---
title: What is an AI Agent?
date: 2026-01-08 08:00:00
tags: [ai, software-engineering]
description: "The term 'agent' gets used loosely. Here's a practical definition: tools, loops, and deciding when to stop."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-01-08T08:00:00+00:00"
---

> If you want to build an agent without writing the loop yourself, I wrote a follow-up on [Building AI Agents with the Claude Agent SDK](/building-agents-with-claude-agent-sdk).

The term "agent" gets used for everything from chatbots to autonomous systems. The definition has become fuzzy.

This matters because prompts and agents are built differently. A prompt is a function call. An agent is a loop. Pick the wrong one, and you'll either over-engineer a simple task or under-engineer a complex one.

## The prompt: input goes in, output comes out

A prompt is stateless. You send text to an LLM, you get text back. The model has no memory of previous calls. It can't take actions. It can't decide it needs more information. What you send is all it knows.

```typescript
const response = await openai.chat.completions.create({
  model: 'gpt-4',
  messages: [{ role: 'user', content: 'Summarise this document: ...' }],
});

console.log(response.choices[0].message.content);
```

This works for simple tasks. Summarisation. Classification. Extraction. Translation. The model does one thing and stops.

Even with system prompts, few-shot examples, and structured outputs, it's still a prompt. The input is more sophisticated, but the basic pattern hasn't changed: text in, text out, done.

## The agent: a loop that decides when to stop

An agent adds three things that prompts don't have:

1. It can use tools
2. It can reason about what to do next
3. It decides when the task is complete

The simplest agent looks like this:

```typescript
let done = false;

while (!done) {
  const response = await llm.generate(context);

  if (response.wantsToUseTool) {
    const result = await executeTool(response.toolCall);
    context.push(result);
  } else {
    done = true;
  }
}
```

That loop is the difference. The LLM isn't just answering a question. It's deciding what action to take, observing the result, and choosing what to do next. It might call a database. Search the web. Write a file. Run code. Each action produces information that shapes the next decision.

## Tools turn text into actions

Without tools, an LLM can only produce text. It can tell you how to query a database. It can't actually query it. Tools bridge that gap.

A tool is a function the agent can call. The LLM outputs a structured request ("call the `search_emails` function with query='invoices from last week'"), your code runs it, and the result goes back into the context.

```typescript
const tools = [
  {
    type: 'function',
    function: {
      name: 'search_emails',
      description: 'Search emails by query',
      parameters: {
        type: 'object',
        properties: {
          query: { type: 'string' },
        },
      },
    },
  },
];

const response = await openai.chat.completions.create({
  model: 'gpt-4',
  messages,
  tools,
});

const toolCalls = response.choices[0].message.tool_calls;
if (toolCalls) {
  const toolCall = toolCalls[0];
  const result = await executeFunction(toolCall.function.name, toolCall.function.arguments);
  // Add result to context and continue the loop
}
```

The model learns to use tools through the descriptions you provide. Good descriptions matter more than clever prompting. If the model doesn't understand when to use a tool, it won't.

## Reasoning happens between actions

An agent doesn't just run tools randomly. It reasons about what information it needs and what actions will get it closer to the goal.

Consider "find all overdue invoices and email the customers". A prompt can't do this. An agent can:

1. Query the database for overdue invoices
2. Look at the results
3. Decide it needs customer email addresses
4. Query for those
5. Draft emails for each customer
6. Send them (or ask for confirmation first)

Each step depends on what came before. The agent adapts to what it finds. If there are no overdue invoices, it stops early. If some customers have missing email addresses, it handles that case.

This is the ReAct pattern: Reason, Act, Observe, repeat. The model explains its thinking, takes an action, sees the result, and decides what to do next.

## When prompts are enough

Not everything needs an agent. Most tasks don't.

Use a prompt when:
- The task completes in one step
- All required information is in the input
- No external actions are needed
- The output format is predictable

Summarisation, classification, extraction, translation, code generation from clear specs. These are prompt tasks. Adding an agent loop just adds latency and cost.

The test is simple: does the model need to *do something* beyond generating text? If no, use a prompt.

## When you actually need an agent

Use an agent when:
- The task requires multiple steps
- Information must be gathered from external sources
- The number of steps isn't known in advance
- Actions depend on what it finds along the way

Research tasks. Multi-step workflows. Anything where the model needs to explore, try things, or recover from failures.

Cold Call Coach uses an agent for grading sales transcripts. The agent doesn't just score the conversation. It spots key moments, pulls context about the prospect persona, compares against best practices, and writes feedback you can act on. A prompt could produce a score. The agent produces coaching.

## The spectrum

Real systems exist on a spectrum:

A prompt is a single LLM call with no memory of previous calls.

A chain is multiple prompts in sequence where the output of one becomes input to the next.

An agent is a loop with tool use where the LLM decides the flow.

A multi-agent system has multiple agents working together where one plans and others execute.

Most production systems are chains or simple agents. Multi-agent systems add coordination overhead that's hard to justify until you've hit the limits of a single agent, so start simple.

## Building your first agent

If you've been writing prompts and want to try agents, start small:

1. Pick a task that requires 2-3 tools
2. Define clear tool descriptions
3. Implement the basic loop
4. Add safety limits (max iterations, timeouts)
5. Log everything

The hardest part isn't the code. It's deciding what tools the agent can use and what limits to set. Too few tools and it can't finish the task. Too many and it gets confused or does something unsafe.

## The failure modes are different

Prompts fail predictably. The output is wrong or malformed. You adjust the prompt and try again.

Agents fail subtly. They might:
- Loop forever trying different approaches
- Use tools in unexpected combinations
- Take actions you didn't expect
- Burn through API credits on dead ends

Logging matters more with agents. You need to see every step of its thinking, every tool call, every decision. When something goes wrong, you need the full trace to understand why.

I wrote about [Sentry tracing for AI calls](/sentry-ai-tracing-laravel) previously. For agents, this becomes essential. Without it, debugging is guesswork.

## A working definition

The term "agent" covers a lot of ground. A chatbot with a system prompt, a scheduled script that calls an LLM, a knowledge base assistant - these all get called agents, though they work very differently.

A useful distinction: does it use tools? Does it loop? Does it decide when it's done? If yes to all three, it's an agent. If no, it's probably a prompt or a chain - which might be exactly what the task needs.

## Start with the task, not the design

The goal isn't to build agents. The goal is to solve problems. Sometimes a prompt solves the problem. Sometimes you need tools. Sometimes you need a loop.

Reaching for an agent when a prompt would work is over-engineering. Using a prompt when you need an agent means building something that can't do the job.
