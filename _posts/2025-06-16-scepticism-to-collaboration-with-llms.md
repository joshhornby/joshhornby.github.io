---
title: From Scepticism to Collaboration with LLMs
date: 2025-06-16 08:00:00
tags: [ai]
description: "Modern LLMs are already reshaping software practice, whether we like it or not. I began wary of the promise of instant productivity, yet have arrived at a somewhat surprising conclusion: LLMs are most valuable when we treat them as colleagues and require the same discipline we expect of ourselves."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-06-16 T19:00:00+01:00
---

Modern LLMs are already reshaping software practice, whether we like it or not. I began wary of the promise of instant productivity, yet have arrived at a somewhat surprising conclusion: LLMs are most valuable when we treat them as colleagues and require the same discipline we expect of ourselves.

## The path from doubt to discipline

- **Initial scepticism** - Early outputs were incorrect and sometimes comically wrong. For example, changing the framework source code, or using functions that simply don't exist.
- **Enchantment phase** - The model felt magical until I inspected the diff. The code compiled, yet violated naming conventions and hid edge-case bugs.
- **Reframing** - I stopped issuing commands and started a dialogue. The model became a well-read but inexperienced pair programmer.

That shift transformed the tool from a novelty toy to a partner.

## An experimentation loop that works

> **Working rule:** *conversation, not delegation.*

1. **State intent first** - Ask the model to summarise the problem and sketch a solution outline before it writes a single line. Misalignment surfaces early.
2. **Write tests up front** - The generated code reveals gaps, I expand the edge cases. A failing test is a fast guard-rail.
3. **Iterate with review** - I keep the review process identical to human PRs: style, complexity, and clarity all matter.
4. **Capture rationale** - I ask for a short "why this design" note and save it beside the code. Future contributors—including the model inherit the context.

## Practices that compound value

| Practice                 | Why it matters                            | How I apply it                                                          |
|--------------------------|-------------------------------------------|-------------------------------------------------------------------------|
| **Structured prompts**   | LLMs anchor on explicit structure         | "Write a three-sentence intent, then a function signature, then tests." |
| **Granular commits**     | Smaller changes shorten the feedback loop | Each prompt covers one behaviour or refactor.                           |
| **Vocabulary alignment** | Consistent terminology reduces drift      | I maintain a glossary in `CONTRIBUTING.md` and reference it in prompts. |
| **Metric tracking**      | Outcome over anecdote                     | I log model authored LOC, test coverage, and review comments weekly.    |

## What LLMs change and what they don’t

- **Change** - Routine scaffolding and repetitive glue shrink dramatically. Investigating new APIs is now minutes, not hours.
- **Endure** - System design, trade-off decisions, and organisational alignment remain stubbornly human. The model suggests patterns, engineers judge their fit.
- **Emergent risk** - *Vibe debt*: superficially correct code that erodes readability. Tests, style checks, and code reviews all remain mandatory.

An interesting observation is how sceptics often compare the current LLMs to perfect engineers, while enthusiasts compare them to no tool at all. Reality sits between those view points. The history of software shows that new abstractions seldom remove work, they reallocate it. Terminals displaced punch cards, IDEs displaced editors, and LLMs are displacing a slice of manual implementation while elevating the importance of precise review.

Prompting itself often feels like learning a brand-new programming language: you experiment with syntax, search for the right abstractions, and iterate to achieve clarity. In that sense, **the newest programming language is English.**

## Looking ahead

Agent-style workflows will likely become more popular. The winning teams will not be the first to automate everything, they will be the first to build a repeatable practice that integrates LLMs without surrendering standards. That is a management problem, not a model problem.

I no longer ask whether LLMs will improve engineering. I ask how quickly we can refine the operating procedures that turn probabilistic text into reliable systems.
