---
title: Sentry AI Tracing for OpenAI in Laravel
date: 2026-01-02 08:00:00
tags: [ai, php, laravel]
description: "Sentry has built-in AI tracing for Python and JavaScript. PHP developers get nothing. Here's how to build it yourself."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-01-02T08:00:00+00:00"
---

Sentry has an [LLM monitoring feature](https://docs.sentry.io/product/insights/llm-monitoring/) that tracks token usage, model versions, and latency for AI calls. Their Python and JavaScript SDKs have built-in integrations. The PHP SDK doesn't.

This post shows how to add the same tracing to Laravel using Sentry's `gen_ai.*` span conventions. The attributes are documented, so we can set them manually and get the same UI features.

## Implementation

Create a service that wraps OpenAI calls with Sentry spans:

```php
<?php

namespace App\Services;

use OpenAI;
use OpenAI\Client;
use Sentry\SentrySdk;
use Sentry\Tracing\SpanContext;
use Sentry\Tracing\SpanStatus;

class OpenAIService
{
    protected Client $client;

    public function __construct()
    {
        $this->client = OpenAI::client(config('services.openai.api_key'));
    }

    /**
     * Wrap an OpenAI API call with Sentry AI tracing.
     *
     * @param  array<int, array{role: string, content: string}>  $messages
     */
    protected function traceOpenAIRequest(
        string $operation,
        string $model,
        array $messages,
        callable $apiCall
    ): mixed {
        $hub = SentrySdk::getCurrentHub();
        $parentSpan = $hub->getSpan();

        // No active transaction? Skip tracing, just make the call.
        if ($parentSpan === null) {
            return $apiCall();
        }

        $spanContext = SpanContext::make()
            ->setOp('gen_ai.request')
            ->setDescription("openai.{$operation}")
            ->setData([
                'gen_ai.request.model' => $model,
                'gen_ai.operation.name' => $operation,
                'gen_ai.system' => 'openai',
            ]);

        $span = $parentSpan->startChild($spanContext);
        $hub->setSpan($span);

        try {
            $response = $apiCall();

            $usage = $response->usage;
            $span->setData([
                'gen_ai.request.model' => $model,
                'gen_ai.operation.name' => $operation,
                'gen_ai.system' => 'openai',
                'gen_ai.usage.input_tokens' => $usage->promptTokens ?? 0,
                'gen_ai.usage.output_tokens' => $usage->completionTokens ?? 0,
                'gen_ai.usage.total_tokens' => $usage->totalTokens ?? 0,
                'gen_ai.response.model' => $response->model ?? $model,
                'gen_ai.response.finish_reason' => $response->choices[0]->finishReason ?? 'unknown',
            ]);

            $span->setStatus(SpanStatus::ok());

            return $response;
        } catch (\Throwable $e) {
            $span->setStatus(SpanStatus::internalError());
            throw $e;
        } finally {
            $span->finish();
            $hub->setSpan($parentSpan);
        }
    }
}
```

Any method that calls OpenAI passes through the tracer:

```php
public function gradeTranscript(string $transcript, string $roleContext): array
{
    $systemPrompt = $this->buildGradingSystemPrompt($roleContext);
    $model = 'gpt-4o-mini';

    $messages = [
        ['role' => 'system', 'content' => $systemPrompt],
        ['role' => 'user', 'content' => "Grade this transcript:\n\n{$transcript}"],
    ];

    $params = [
        'model' => $model,
        'response_format' => [
            'type' => 'json_schema',
            'json_schema' => [
                'name' => 'sales_scorecard',
                'strict' => true,
                'schema' => $this->getScorecardSchema(),
            ],
        ],
        'messages' => $messages,
    ];

    $response = $this->traceOpenAIRequest(
        operation: 'chat_completions',
        model: $model,
        messages: $messages,
        apiCall: fn () => $this->client->chat()->create($params)
    );

    return json_decode($response->choices[0]->message->content, true);
}
```

The callable pattern keeps the wrapper generic. Chat completions, embeddings, image generation and they all use the same tracing method.

### Why these specific attributes

Sentry has [documented semantic conventions](https://develop.sentry.dev/sdk/performance/span-data-conventions/#ai) for AI spans. Using the exact `gen_ai.*` attribute names means their UI recognises them:

- `gen_ai.system` identifies the provider (openai, anthropic, etc.)
- `gen_ai.request.model` is what you asked for
- `gen_ai.response.model` is what you got (these can differ)
- `gen_ai.usage.input_tokens` and `gen_ai.usage.output_tokens` power cost tracking
- `gen_ai.response.finish_reason` tells you if the response completed, hit token limits, or got filtered

The Python SDK sets these automatically. We're just doing the same thing manually.

### Graceful degradation

The `if ($parentSpan === null)` check handles cases without active transactions. Queue workers, artisan commands, or anywhere you haven't started a Sentry transaction. The API call still works, you just don't get the span.

This matters because Sentry's performance tracing requires an active transaction. If you skip this check, queue jobs calling OpenAI will throw null pointer errors.

### Restoring the parent span

The `finally` block restores the parent span even if the API call throws:

```php
} finally {
    $span->finish();
    $hub->setSpan($parentSpan);
}
```

Skip this and you'll get orphaned spans. The trace hierarchy breaks. Child spans from later operations attach to the wrong parent. Debugging becomes a nightmare.

## What shows up in Sentry

After deploying this, traces show LLM calls as discrete spans within the request waterfall. You can see:

- How much time OpenAI took vs your own code
- Token counts per request (sort by tokens to find expensive prompts)
- Finish reasons to catch truncated responses
- Model drift if OpenAI routes to a different variant

The real value is aggregation. Which endpoint uses the most tokens? Which prompt type fails most often? Is gpt-5-mini fast enough or do you need gpt-5? Now you have data.

## Cost tracking

LLM costs scale with usage in ways traditional compute doesn't. With token counts in your spans, you can:

- Set up Sentry alerts when token usage spikes
- Identify which features drive costs
- Catch runaway retry loops before they drain your budget
- Compare costs across model variants

## Extending it

The pattern extends to other providers. Anthropic, Mistral, whatever. Change `gen_ai.system` and adapt the response parsing. The semantic conventions are provider-agnostic by design.

For streaming responses, you'll need to accumulate tokens differently since usage comes at the end of the stream. The wrapper structure stays the same.

The conventions are documented and accessible. A little bit of work gives you the same observability that Python and JavaScript get out of the box.
