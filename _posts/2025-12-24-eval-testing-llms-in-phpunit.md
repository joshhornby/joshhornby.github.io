---
title: Eval Testing LLMs in PHPUnit
date: 2025-12-24 08:00:00
tags: [ai, php, software-engineering]
description: "Unit tests for prompts. How to build eval suites in PHPUnit that catch regressions before your users do."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-12-24T08:00:00+00:00"
---

Most teams treat prompts like configuration. Tweak a few words, deploy, move on. I did the same until I shipped a "small fix" that quietly broke a feature I didn't even know to check.

The thing about prompts is they're code in disguise. They change behaviour, they have edge cases, and they regress. Without tests, the only feedback loop is customer complaints.

I learned this building [Cold Call Coach](https://coldcall.coach), an AI-powered sales training app. The AI plays different prospect personas, and each persona needs to behave consistently: sceptical prospects should stay sceptical, happy customers shouldn't suddenly turn hostile. Evals are how I keep that in check.

## The problem with testing LLM outputs

Traditional unit tests assert on exact outputs. `assertEquals('hello', greet())`. LLMs don't work that way. Ask the same prompt twice, and you'll get different wording, different structure, sometimes different conclusions. The output is probabilistic, not deterministic.

This leads teams down two paths. Either they don't test prompts at all (relying on "vibes" and manual QA), or they over-constrain tests to check for specific phrases that break the moment the model rephrases anything.

Both approaches fail. The first catches nothing. The second catches everything, including perfectly valid responses.

## LLM-as-judge: testing behaviour, not strings

The solution is to test _behaviour_, not exact output. Instead of checking whether the response contains "I understand your concern", you check whether the response _demonstrates empathy_. And you use another LLM to make that judgement.

This is the LLM-as-judge pattern. You send the response to a judge model along with a list of criteria, and it returns a pass/fail verdict for each. The criteria are written in plain English:

```php
$this->assertResponseMeetsCriteria($response, [
    'Response is short (1-3 sentences)',
    'Response shows skepticism, impatience, or guardedness',
    'Response does NOT show enthusiasm or warmth',
    'Response does NOT immediately agree to hear more or set up a meeting',
], 'Initial cold call with generic pitch');
```

The judge model evaluates whether the response meets each criterion. If any fail, the test fails with the reasoning included.

## Building an eval test case in PHPUnit

The base test case handles the plumbing. Tests inherit from it and focus on scenarios and criteria.

```php
#[Group('ai-eval')]
abstract class EvalTestCase extends TestCase
{
    // Cheap model generates responses, smarter model judges them
    protected string $conversationModel = 'gpt-4o-mini';
    protected string $judgeModel = 'gpt-4o';

    protected function getAIResponse(
        AIRole $role,
        string $userMessage,
        array $conversationHistory = []
    ): string {
        $messages = [
            ['role' => 'system', 'content' => $role->getSystemInstructions()],
            ...$conversationHistory,
            ['role' => 'user', 'content' => $userMessage],
        ];

        $response = $this->client->chat()->create([
            'model' => $this->conversationModel,
            'messages' => $messages,
        ]);

        return $response->choices[0]->message->content;
    }

    // Build up conversation history turn by turn
    protected function simulateConversation(AIRole $role, array $userMessages): array
    {
        $conversationHistory = [];
        $responses = [];

        foreach ($userMessages as $userMessage) {
            $response = $this->getAIResponse($role, $userMessage, $conversationHistory);
            $responses[] = $response;

            $conversationHistory[] = ['role' => 'user', 'content' => $userMessage];
            $conversationHistory[] = ['role' => 'assistant', 'content' => $response];
        }

        return ['messages' => $conversationHistory, 'responses' => $responses];
    }

    // LLM-as-judge: ask a smarter model to evaluate the response
    protected function judgeResponse(string $response, array $criteria): array
    {
        $criteriaList = implode("\n", array_map(
            fn ($c, $i) => ($i + 1).". {$c}",
            $criteria,
            array_keys($criteria)
        ));

        $prompt = <<<PROMPT
You are an AI evaluator. Assess whether this response meets the criteria.

Response: "{$response}"

Criteria:
{$criteriaList}

Return JSON: {"scores": {"criterion_1": true/false, ...}, "reasoning": "..."}
PROMPT;

        $result = $this->client->chat()->create([
            'model' => $this->judgeModel,
            'messages' => [['role' => 'user', 'content' => $prompt]],
            'response_format' => ['type' => 'json_object'],
        ]);

        $parsed = json_decode($result->choices[0]->message->content, true);

        // Map criterion_1, criterion_2... back to the original criteria text
        $scores = [];
        foreach ($criteria as $i => $criterion) {
            $key = 'criterion_'.($i + 1);
            $scores[$criterion] = $parsed['scores'][$key] ?? false;
        }

        return ['passed' => !in_array(false, $scores, true), 'scores' => $scores, 'reasoning' => $parsed['reasoning'] ?? ''];
    }

    protected function assertResponseMeetsCriteria(string $response, array $criteria, string $context = ''): void
    {
        $result = $this->judgeResponse($response, $criteria);
        $failedCriteria = array_filter($result['scores'], fn ($passed) => ! $passed);

        if (! empty($failedCriteria)) {
            $this->fail(
                "{$context}: Failed criteria: ".implode(', ', array_keys($failedCriteria)).
                ". Reasoning: {$result['reasoning']}. Response: \"{$response}\""
            );
        }
    }
}
```

A few things are worth noting:

- Use a cheaper model for conversation, a smarter one for judging. The judge needs to be more capable than the model being tested, otherwise it misses subtle failures.
- JSON mode makes parsing reliable. No regex parsing of natural language responses.
- Failed tests include reasoning. You get the criteria that failed, why, and the actual response:

```
FAILED  Tests\Evals\Roles\HappyWithCurrentVendorEvalTest

Response failed criteria: Response shows resistance to switching OR
dismisses the pitch, Response maintains satisfaction with current solution.

Reasoning: The response does not explicitly show resistance to switching
or dismiss the pitch, as it simply indicates a lack of understanding.
It does not express satisfaction with the current solution.

Response was: "I'm not following. What are you asking?"
```

This tells you exactly what went wrong: the AI responded with confusion instead of the expected "we're happy with our current vendor" pushback.

## Testing multi-turn conversations

Single-turn tests catch obvious issues. But LLM behaviour often depends on conversation history. A prospect should warm up gradually over multiple exchanges, not flip after one good question:

```php
#[Test]
public function it_gradually_warms_up_after_multiple_good_exchanges(): void
{
    $role = $this->createRole();

    $conversation = $this->simulateConversation($role, [
        "Hi, this is Alex. What's the biggest operational challenge you're dealing with right now?",
        "When you say manual reporting takes too much time, can you walk me through what that process looks like?",
        "So if I'm understanding correctly, you've got 3 people spending 2 days a month on this. What's the impact when leadership makes decisions on stale data?",
        "What have you tried before to solve this?",
    ]);

    $this->assertConversationMeetsCriteria($conversation['messages'], [
        'The ASSISTANT engages more substantively in later responses',
        'The ASSISTANT shares some information about their challenges',
        'The progression feels natural - remaining somewhat guarded is acceptable',
    ], 'Multiple good discovery questions should lead to gradual engagement');
}
```

The `simulateConversation` method sends each message sequentially, building up the conversation history. The judge then evaluates the entire transcript against the criteria.

## Tracking costs

These tests make real API calls. Left unchecked, a test suite can rack up significant costs. The base test case tracks token usage and prints a summary at the end:

```
┌────────────────────────────────────────────────────────────┐
│                   AI EVAL COST SUMMARY                     │
├──────────────┬─────────┬──────────┬───────────┬───────────┤
│ Model        │ Reqs    │ In       │ Out       │ Cost      │
├──────────────┼─────────┼──────────┼───────────┼───────────┤
│ gpt-4o-mini  │ 12      │ 8.2K     │ 3.1K      │ $0.0031   │
│ gpt-4o       │ 12      │ 15.4K    │ 2.8K      │ $0.0665   │
├──────────────┴─────────┴──────────┴───────────┼───────────┤
│ TOTAL                                         │ $0.0696   │
└───────────────────────────────────────────────┴───────────┘
```

Run these in a separate test group (`--group=ai-eval`) so they don't execute on every commit. CI runs them nightly or on prompt changes.

## What evals actually catch

Over the past few months, these tests have caught issues I wouldn't have found otherwise:

- Character breaks. A test explicitly tries to get the AI to acknowledge being an AI. The test expects it to stay in character. This caught a regression where a prompt change made the model more "helpful" about meta-questions.

- Premature agreement. The AI prospect was supposed to be sceptical. A prompt tweak made it too friendly too fast. The "does not warm up after one good question" test caught it.

- Edge case handling. Tests for unclear inputs ("Hello?", "Testing 1 2 3") ensure the model asks for clarification rather than assuming context.

```php
#[Test]
public function it_does_not_assume_sales_call_without_context(): void
{
    $response = $this->getAIResponse($role, 'Testing, testing, 1 2 3.');

    $this->assertResponseMeetsCriteria($response, [
        'Response asks for clarification or explanation',
        'Response does NOT assume this is about a software product',
        'Response shows natural confusion about the strange message',
    ], 'Random test message should not trigger sales prospect mode');
}
```

## You can't vibe code a prompt

The incident.io team [wrote about this recently](https://incident.io/building-with-ai/you-cant-vibe-code-a-prompt). Their observation: letting an LLM optimise its own prompts leads to overfitting. The model memorises specific answers rather than learning generalisable patterns. When they let Claude fix a failing eval, it added overly specific rules that broke previously passing cases.

The lesson applies here too. Evals are for *detecting* problems, not solving them. The LLM can generate test cases and judge responses, but the actual prompt engineering requires human intuition. You need to understand *why* a behaviour matters, not just pattern-match on symptoms.

Use LLMs to:
- Generate diverse test cases
- Judge whether responses meet criteria
- Lint prompts for contradictions

Keep humans for:
- Designing the criteria themselves
- Understanding why certain behaviours matter
- Making trade-offs when criteria conflict

## Running the tests

The test suite lives alongside regular PHPUnit tests but runs separately:

```bash
./vendor/bin/phpunit --group=ai-eval
```

A dedicated API key (`OPENAI_API_KEY_EVALS`) keeps costs isolated and auditable. The tests skip gracefully if the key isn't set, so local development isn't blocked.

The biggest benefit isn't catching bugs. It's confidence. Before evals, every prompt change felt risky. Did I break something? Would I even know? Now there's a baseline. The tests codify expected behaviours in a way that survives team changes and model updates.

Prompts are code. They deserve the same discipline.
