---
title: From Scepticism to Collaboration with LLMs
date: 2025-06-17 08:00:00
tags: [ai, software-engineering, developer-experience]
description: "LLMs work best when you treat them like a junior engineer, not a magic wand. Same standards, same discipline, same reviews."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

_For context: most of my experiments are with Claude 3.7, OpenAI's GPT-4, o3 and o4-mini-high. The reflections here are based on hands-on use of those models in day-to-day coding._

LLMs are changing how we write software, whether we like it or not. I was sceptical of the productivity claims. After months of daily use, I've landed somewhere I didn't expect: they work best when you treat them like a junior engineer. Same standards, same reviews.

## The path from doubt to discipline

My first attempts at using LLMs to write code were laughable. The model would rewrite framework source code, invent functions, ignore naming conventions, and introduce edge-case bugs along the way. So I changed tactics. Instead of giving orders, I started having a conversation, and the model turned into a well-read but inexperienced pair programmer.

The gains come from treating it the way you'd treat a junior engineer. You share the intent, you say what you expect, and you review the result together at each step. Making every interaction a conversation rather than a hand-off surfaces the hidden assumptions early. In practice it looks like this:

1. **State intent first**: Ask the model to summarise the problem and sketch a solution outline before it writes a single line. Misalignment surfaces early.
2. **Write tests up front**: The generated code reveals gaps, I expand the edge cases. A failing test is a fast guard-rail.
3. **Iterate with review**: I keep the review process identical to human PRs: style, complexity, and clarity all matter.
4. **Capture rationale**: I ask for a short "why this design" note and save it beside the code. Future contributors, including the model, inherit the context.

## Practices that compound

No prompt makes an LLM work like an expert out of the box. What matters is the habits around it: how you interact, how you review, and how you check whether anything is actually improving. Those habits compound.

[Structured prompts make the biggest difference](/improve-llm-prompting). The more explicit and orderly the instructions, the better the output. I'll ask for a three-sentence summary of intent, then a function signature, then tests. That sort of scaffolding gives the model something to anchor to and keeps it from wandering off track.

I treat each prompt as its own commit. Keeping changes small shortens the feedback loop. One behaviour or refactor at a time means reviews are faster and mistakes are easy to spot and unwind.

Consistent vocabulary is another small thing worth doing. I keep a glossary in CONTRIBUTING.md and reference it in prompts. When everyone, human or model, uses the same term for the same thing, there's less drift at the hand-offs.

Each week, log the model-authored lines of code, the test coverage and the review comments. It moves the conversation from "it feels quicker" to "here's what changed", which is harder to argue with.

## What LLMs change and what they don't

Routine scaffolding and repetitive tasks now take a fraction of the time. What took hours takes minutes. Investigating a new API is no longer an afternoon lost.

Plenty doesn't change. System design, trade-off decisions and organisational alignment still need human judgement. The model suggests patterns. Engineers decide what fits.

There's a new risk too. Call it vibe debt: code that looks fine on the surface but quietly erodes readability. Tests, style checks and code reviews matter as much as they ever did.

Sceptics tend to compare today's LLMs to a perfect engineer, and enthusiasts compare them to having no tool at all. Reality sits between the two. New abstractions rarely remove work, they move it. Terminals displaced punch cards, IDEs displaced editors, and LLMs are displacing a slice of manual implementation while making precise review more important.

Prompting feels like learning a new programming language. You experiment with the syntax, look for the right abstractions, and iterate until it's clear. The newest programming language is English.

## Looking ahead

Agent-style workflows will get more popular. The teams that win won't be the first to automate everything. They'll be the first to build a repeatable practice that uses LLMs without dropping their standards. That's a management problem rather than a model problem.

I no longer wonder if LLMs will improve engineering, only how fast we can adapt to turn probabilistic text into reliable systems.
