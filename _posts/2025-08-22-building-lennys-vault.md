---
title: "Building an AI Application: Lessons from Lenny's Vault"
date: 2025-08-22 08:00:00
description: "A few lessons from building an application built on top of AI APIs."
tags: [software-engineering, ai]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

I've just finished a side project built on top of AI APIs, mostly using Claude Code. [Lenny's Vault](https://lennysvault.com/) is an AI-powered search engine for [Lenny Rachitsky's podcast](https://www.lennysnewsletter.com/podcast). It turns podcast episodes into searchable insights, so you can find specific advice on growth, product management or leadership.

## How it works

The system uses a multi-agent architecture built on AWS Lambda & Step Functions. When new podcast episodes are published:

1. Transcript Processing Agent extracts and cleans audio transcriptions
2. Content Analysis Agent identifies key topics, themes, and actionable insights
3. Semantic Indexing Agent creates embeddings for search functionality
4. Categorisation Agent organises insights into themes (Strategic Thinking, Leadership, etc.)
5. Quality Control Agent validates extracted insights before indexing

Each agent is a separate Lambda function, allowing independent scaling and easier debugging when things go wrong.

## The reality of building with AI

### Non-deterministic outputs are the biggest problem

The same podcast transcript would produce different key insights on consecutive runs. Sometimes the AI would extract 8 actionable points, sometimes 15. Occasionally it would focus entirely on tactical advice whilst missing strategic frameworks.

I solved this through rigid prompt engineering and response formatting. Every agent now uses structured JSON schemas with explicit constraints:

```json
{
  "insights": {
    "type": "array",
    "items": {"type": "string"},
    "minItems": 5,
    "maxItems": 12
  },
  "category": {
    "type": "string",
    "enum": ["Strategic Thinking", "Leadership", "Growth"]
  }
}
```

The trade-off is less creative output in exchange for behaviour users can rely on.

### Testing AI is still unsolved

There's no agreed approach for testing prompts in TypeScript. Traditional unit tests don't work when your "function" is a Large Language Model. I found [this resource from Incident.io](https://incident.io/building-with-ai/you-cant-vibe-code-a-prompt) particularly useful for thinking about AI testing strategies. I've since written about [eval testing LLMs in PHPUnit](/eval-testing-llms-in-phpunit) - different language, same patterns.

### Log everything

AI systems fail in ways you can't predict. A prompt that worked perfectly suddenly starts producing rubbish outputs because the underlying model behaviour changed.

I log every prompt and response pair, processing times for each agent and model versions and timestamps.

This verbose logging saved me when OpenAI's API behaviour changed unexpectedly, causing my Content Analysis Agent to misclassify strategic discussions as tactical advice.

### Claude Code needs watching

Claude Code sped up development a lot, especially wiring together AWS CDK infrastructure, writing simple Lambda functions and testing.

It also introduced subtle bugs I only caught in production. The code was syntactically correct but broke assumptions in the business logic. In one case it wrote error handling that silently continued processing when it should have failed fast.

I'm convinced the future is engineers working with these tools rather than being replaced by them. Judgement about business context is still the part that's hard to replace.

### AWS Step Functions made agent chaining simple

Orchestrating multiple AI agents could have been a nightmare of message queues and state management. Step Functions provided visual workflow management and built-in error handling.

The visual editor made it easy to view how the system was working at a high level. When the Semantic Indexing Agent started timing out on longer episodes, I could show exactly where the bottleneck occurred and how it affected search functionality.

### Using AI to validate AI

The "Evaluator-Optimizer" pattern from the [AI SDK documentation](https://ai-sdk.dev/docs/foundations/agents#evaluator-optimizer) proved essential. A separate Quality Control Agent evaluates each output, scoring it on relevance, completeness, and formatting.

If the score falls below a threshold, the system re-runs the failed agent with additional context.

Building Lenny's Vault taught me that AI development isn't mostly about prompt engineering and model selection. It's about building reliable systems that handle uncertainty and stay observable. Testing, monitoring and gradual rollouts matter more, not less, when your core logic is non-deterministic.
