---
title: "Building an AI Application: Lessons from Lenny's Vault"
date: 2025-08-22 08:00:00
description: "A few lessons from building an application built on top of AI APIs."
tags: [software-engineering, ai]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-08-22 T08:00:00+00:00"
---
I've just finished a side project built on top of AI APIs and in the main using Claude Code. [Lenny's Vault](https://lennysvault.com/) is an AI-powered search engine for [Lenny Rachitsky's podcast](https://www.lennysnewsletter.com/podcast). It transforms hours of audio content into searchable insights, letting users find specific advice on topics like growth strategies, product management, and leadership in seconds rather than scrolling through dozens of episode transcripts.

## How It Works

The system uses a multi-agent architecture built on AWS Lambda & Step Functions. When new podcast episodes are published:

1. **Transcript Processing Agent** extracts and cleans audio transcriptions
2. **Content Analysis Agent** identifies key topics, themes, and actionable insights
3. **Semantic Indexing Agent** creates embeddings for search functionality
4. **Categorisation Agent** organises insights into themes (Strategic Thinking, Leadership, etc.)
5. **Quality Control Agent** validates extracted insights before indexing

Each agent is a separate Lambda function, allowing independent scaling and easier debugging when things go wrong.

## The Reality of Building with AI

### Non-Deterministic Outputs Are Your Biggest Enemy

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

The trade-off? Less creative outputs, but predictable behaviour that users can rely on.

### Testing AI Is Still Unsolved

There's no agreed approach for testing prompts in TypeScript. Traditional unit tests don't work when your "function" is a Large Language Model. I found [this resource from Incident.io](https://incident.io/building-with-ai/you-cant-vibe-code-a-prompt) particularly useful for thinking about AI testing strategies.

My approach: **golden dataset testing**. I maintain a list of podcast episodes with manually curated insights. Each deployment runs the full pipeline against this dataset, flagging any outputs that deviate significantly from expected results.

### Log Everything (Seriously, Everything)

AI systems fail in ways you can't predict. A prompt that worked perfectly suddenly starts producing rubbish outputs because the underlying model behaviour changed.

I log every prompt and response pair, processing times for each agent and model versions and timestamps.

This verbose logging saved me when OpenAI's API behaviour changed unexpectedly, causing my Content Analysis Agent to misclassify strategic discussions as tactical advice.

### Claude Code: Powerful but Requires Monitoring

Claude Code accelerated development significantly, especially for wiring together AWS CDK infrastructure, writing simple Lambda functions, and testing.

But it also introduced subtle bugs I only caught in production. The AI would generate syntactically correct code that violated business logic assumptions. For example, it created error handling that silently continued processing when it should have failed fast.

I'm convinced the future is engineers working **with** AI tools, not being replaced by them. The human judgment for business context remains irreplaceable.

### AWS Step Functions Made Agent Chaining Simple

Orchestrating multiple AI agents could have been a nightmare of message queues and state management. Step Functions provided visual workflow management and built-in error handling.

The visual editor made it easy to view how the system was working at a high level. When the Semantic Indexing Agent started timing out on longer episodes, I could show exactly where the bottleneck occurred and how it affected search functionality.

### Using AI to Validate AI

The "Evaluator-Optimizer" pattern from the [AI SDK documentation](https://ai-sdk.dev/docs/foundations/agents#evaluator-optimizer) proved essential. A separate Quality Control Agent evaluates each output, scoring it on relevance, completeness, and formatting.

If the score falls below a threshold, the system re-runs the failed agent with additional context.

Building Lenny's Vault taught me that AI development isn't just about prompt engineering and model selection. It's about building robust systems that handle uncertainty, provide observability, and maintain quality at scale. The same engineering principles that apply to traditional software testing, monitoring, and gradual rollouts become even more important when your core logic is non-deterministic.
