---
title: "Sentry AI Tracing with Laravel's AI SDK"
date: 2026-02-14 08:00:00
tags: [ai, php, laravel]
description: "Laravel now has an official AI SDK with built-in events. Sentry tracing goes from manual wrapping to a single event listener."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-02-14T08:00:00+00:00"
---

In my [previous post](/2026/01/02/sentry-ai-tracing-laravel), I showed how to manually wrap OpenAI calls with Sentry spans to get LLM monitoring in PHP. It worked, but every AI call needed to pass through a tracing method. You had to remember to use it.

Laravel now ships an [official AI SDK](https://laravel.com/docs/12.x/ai-sdk) (`laravel/ai`) that changes this. The SDK fires events for every agent interaction, which means tracing becomes a listener. Write it once, and every AI call in your app gets traced automatically.

## What changed

The old approach required wrapping each call:

```php
$response = $this->traceOpenAIRequest(
    operation: 'chat_completions',
    model: $model,
    messages: $messages,
    apiCall: fn () => $this->client->chat()->create($params)
);
```

The new SDK has agents as first-class objects. You define an agent class with instructions, tools, and a schema, then call `prompt()`:

```php
$response = (new SalesCoach)->prompt('Analyse this sales transcript...');
```

The SDK fires events at each stage. Six are useful for tracing:

- `PromptingAgent` / `AgentPrompted` for non-streamed chat calls
- `StreamingAgent` / `AgentStreamed` for streamed chat calls
- `GeneratingEmbeddings` / `EmbeddingsGenerated` for embedding calls

Each event carries an `invocationId` to correlate the start and finish.

## The listener

Instead of wrapping individual calls, register a single event listener:

```php
<?php

namespace App\Listeners;

use Laravel\Ai\Events\AgentPrompted;
use Laravel\Ai\Events\AgentStreamed;
use Laravel\Ai\Events\EmbeddingsGenerated;
use Laravel\Ai\Events\GeneratingEmbeddings;
use Laravel\Ai\Events\PromptingAgent;
use Laravel\Ai\Events\StreamingAgent;
use Laravel\Ai\Providers\Provider;
use Sentry\SentrySdk;
use Sentry\Tracing\Span;
use Sentry\Tracing\SpanContext;
use Sentry\Tracing\SpanStatus;

class SentryAiTracing
{
    /**
     * @var array<string, array{span: Span, parentSpan: Span}>
     */
    protected static array $activeSpans = [];

    public function handlePromptingAgent(PromptingAgent $event): void
    {
        $this->startSpan($event);
    }

    public function handleStreamingAgent(StreamingAgent $event): void
    {
        $this->startSpan($event);
    }

    public function handleAgentPrompted(AgentPrompted $event): void
    {
        $this->finishSpan($event);
    }

    public function handleAgentStreamed(AgentStreamed $event): void
    {
        $this->finishSpan($event);
    }

    public function handleGeneratingEmbeddings(GeneratingEmbeddings $event): void
    {
        $parentSpan = SentrySdk::getCurrentHub()->getSpan();

        if ($parentSpan === null) {
            return;
        }

        $context = SpanContext::make()
            ->setOp('gen_ai.embeddings')
            ->setDescription('embeddings '.$event->model)
            ->setOrigin('auto.ai.laravel')
            ->setData([
                'gen_ai.system' => strtolower($event->provider->name()),
                'gen_ai.request.model' => $event->model,
                'gen_ai.operation.name' => 'embeddings',
            ]);

        $childSpan = $parentSpan->startChild($context);

        SentrySdk::getCurrentHub()->setSpan($childSpan);

        static::$activeSpans[$event->invocationId] = [
            'span' => $childSpan,
            'parentSpan' => $parentSpan,
        ];
    }

    public function handleEmbeddingsGenerated(EmbeddingsGenerated $event): void
    {
        $entry = static::$activeSpans[$event->invocationId] ?? null;

        if ($entry === null) {
            return;
        }

        unset(static::$activeSpans[$event->invocationId]);

        $span = $entry['span'];

        $span->setData(array_merge($span->getData(), [
            'gen_ai.response.model' => $event->response->meta->model,
            'gen_ai.usage.input_tokens' => $event->response->tokens,
        ]));

        $span->setStatus(SpanStatus::ok());
        $span->finish();

        SentrySdk::getCurrentHub()->setSpan($entry['parentSpan']);
    }

    protected function startSpan(PromptingAgent $event): void
    {
        $parentSpan = SentrySdk::getCurrentHub()->getSpan();

        if ($parentSpan === null) {
            return;
        }

        $providerName = $event->prompt->provider instanceof Provider
            ? strtolower($event->prompt->provider->name())
            : 'unknown';

        $agentName = class_basename($event->prompt->agent);

        $context = SpanContext::make()
            ->setOp('gen_ai.chat')
            ->setDescription('chat '.$event->prompt->model)
            ->setOrigin('auto.ai.laravel')
            ->setData([
                'gen_ai.system' => $providerName,
                'gen_ai.request.model' => $event->prompt->model,
                'gen_ai.operation.name' => 'chat',
                'gen_ai.agent.name' => $agentName,
                'gen_ai.pipeline.name' => $agentName,
            ]);

        $childSpan = $parentSpan->startChild($context);

        SentrySdk::getCurrentHub()->setSpan($childSpan);

        static::$activeSpans[$event->invocationId] = [
            'span' => $childSpan,
            'parentSpan' => $parentSpan,
        ];
    }

    protected function finishSpan(AgentPrompted $event): void
    {
        $entry = static::$activeSpans[$event->invocationId] ?? null;

        if ($entry === null) {
            return;
        }

        unset(static::$activeSpans[$event->invocationId]);

        $span = $entry['span'];
        $usage = $event->response->usage;
        $meta = $event->response->meta;

        $span->setData(array_merge($span->getData(), [
            'gen_ai.response.model' => $meta->model,
            'gen_ai.usage.input_tokens' => $usage->promptTokens,
            'gen_ai.usage.output_tokens' => $usage->completionTokens,
        ]));

        $span->setStatus(SpanStatus::ok());
        $span->finish();

        SentrySdk::getCurrentHub()->setSpan($entry['parentSpan']);
    }

    /**
     * Reset active spans (used in testing).
     */
    public static function flush(): void
    {
        static::$activeSpans = [];
    }
}
```

Laravel auto-discovers listeners by convention. The `handlePromptingAgent` method maps to the `PromptingAgent` event, and so on for the rest. Drop this class into `app/Listeners` and every agent and embedding call gets a Sentry span with the same `gen_ai.*` attributes from before.

## What's different from the manual approach

The old wrapper only traced calls that explicitly used it. Forget to wrap a call and you get no span. The listener catches everything that goes through the SDK, regardless of which agent or provider made the call.

The SDK abstracts providers behind a common interface. The listener pulls the provider name from `$event->prompt->provider->name()`, so switching from OpenAI to Anthropic doesn't need any tracing changes.

Streaming was awkward before because token counts arrive at the end of the stream. The SDK handles that internally and fires `AgentStreamed` with the full usage data already collected. The listener code is identical for both paths.

Embeddings follow the same pattern but with different span data. Chat completions track both input and output tokens. Embeddings only have input tokens since there's no generated text, just vectors.

Each event gets a unique `invocationId`. The listener uses this to match start and finish events, stored in a static `$activeSpans` array. This handles concurrent requests without race conditions.

## The same patterns still apply

The graceful degradation check from the original post still applies. If there's no active Sentry transaction (queue workers, artisan commands), `getSpan()` returns null and the listener exits early without errors.

Parent span restoration is the same. After finishing the AI span, we reset the hub to the parent span so later operations attach to the right place in the trace hierarchy.

The `gen_ai.*` attribute conventions are unchanged. Sentry's LLM monitoring UI still picks up token counts, model versions, and provider information the same way.

## Beyond Sentry

The SDK fires events that any listener can hook into. You could add listeners for logging, cost tracking, or rate limiting alongside the tracing listener.

The previous post required you to build the plumbing and remember to use it. Now the framework gives you the hooks.
