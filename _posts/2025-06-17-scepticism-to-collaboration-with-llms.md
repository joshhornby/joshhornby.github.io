---
title: From Scepticism to Collaboration with LLMs
date: 2025-06-17 08:00:00
tags: [ai, software-engineering]
description: "Modern LLMs are reshaping software practice, for better or worse. I began doubtful about the promise of instant productivity, but over time, I've arrived at a surprising conclusion: LLMs offer the most value when we engage them as partners, holding them to the same standards of discipline we expect of ourselves."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-06-17 T19:00:00+01:00
---

Modern LLMs are reshaping software practice, for better or worse. I began doubtful overthe promise of instant productivity with these tools, but over time I've arrived at a surprising conclusion: LLMs offer the most value when we engage them as partners, holding them to the same standards of discipline we expect of ourselves.

## The path from doubt to discipline

I started out sceptical, my first attempts at using LLMs, mainly with Claude 3.7 & 4.0 along side using 
OpenAI's GPT-4 & o3, to write code were laughable. The model would rewrite a framework source code, invent functions, and ignore naming conventions, all while introducing edge-case bugs. I changed tactics, and stopped giving orders and started having a dialogue instead. The model became a well-read but inexperienced pair programmer. That shift from seeing it as a shortcut to treating it as a disciplined partner changed everything.

## An experimentation loop that works

> **Working rule:** *conversation, not delegation.*

1. **State intent first**: Ask the model to summarise the problem and sketch a solution outline before it writes a single line. Misalignment surfaces early.
2. **Write tests up front**: The generated code reveals gaps, I expand the edge cases. A failing test is a fast guard-rail.
3. **Iterate with review**: I keep the review process identical to human PRs: style, complexity, and clarity all matter.
4. **Capture rationale**: I ask for a short "why this design" note and save it beside the code. Future contributors—including the model inherit the context.

## Practices that compound value

| Practice                 | Why it matters                            | How I apply it                                                          |
|--------------------------|-------------------------------------------|-------------------------------------------------------------------------|
| **Structured prompts**   | LLMs anchor on explicit structure         | "Write a three-sentence intent, then a function signature, then tests." |
| **Granular commits**     | Smaller changes shorten the feedback loop | Each prompt covers one behaviour or refactor.                           |
| **Vocabulary alignment** | Consistent terminology reduces drift      | I maintain a glossary in `CONTRIBUTING.md` and reference it in prompts. |
| **Metric tracking**      | Outcome over anecdote                     | I log model authored LOC, test coverage, and review comments weekly.    |

## What LLMs change and what they don't

Routine scaffolding and repetitive tasks now take a fraction of the time, what used to take hours is down to minutes. Investigating a new API is no longer an afternoon lost; it's a quick spin-up.
But not everything changes. System design, trade-off decisions, and organisational alignment still demand human judgment. The model suggests patterns, but it's engineers who decide what fits.
There's a new risk, though: vibe debt—code that appears fine on the surface, but quietly erodes readability and clarity. That's why tests, style checks, and code reviews are as important as ever.

An interesting observation is how sceptics often compare the current LLMs to perfect engineers, while enthusiasts compare them to no tool at all. Reality sits between those view points. The history of software shows that new abstractions seldom remove work, they reallocate it. Terminals displaced punch cards, IDEs displaced editors, and LLMs are displacing a slice of manual implementation while elevating the importance of precise review.

Prompting itself often feels like learning a brand-new programming language: you experiment with syntax, search for the right abstractions, and iterate to achieve clarity. In that sense, **the newest programming language is English.**

## Looking ahead

Agent-style workflows will likely become more popular. The winning teams will not be the first to automate everything, they will be the first to build a repeatable practice that integrates LLMs without surrendering standards. That is a management problem, not a model problem.

I no longer ask whether LLMs will improve engineering. I ask how quickly we can refine the operating procedures that turn probabilistic text into reliable systems.
