---
title: "Vibe Coding vs Agentic Engineering"
date: 2026-07-18 08:00:00
written_with_ai: true
tags: [ai, software-engineering, developer-experience]
description: "Vibe coding and agentic engineering use the same tools but differ on one thing: whether you keep the specify-and-review discipline. The skill teams need is knowing which mode the work deserves."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2026-08-02T08:00:00+01:00"
---

"I built it with AI" now tells you almost nothing. It might mean someone chatted at a model until the screen looked right. It might mean someone wrote a spec, fenced the agent in, and read every risky line that came back. Same tool, same afternoon, and I would trust those two results very differently.

People use both terms loosely, so let me be precise. Andrej Karpathy coined *vibe coding* for the mode where you give in to the vibes, describe what you want, accept what comes back, and barely look at the code. Addy Osmani has written well about [how this fits into the SDLC](https://addyosmani.com/blog/new-sdlc-vibe-coding/). My angle is narrower: what separates the two modes, and how a team picks one.

## Same tool, different discipline

When AI writes the code, the work moves to the two things either side of it. You specify what to build. You review what got built.

Vibe coding drops both. You skip the careful spec, you skip the careful review, and you run the loop of "that's not quite right, try again" until it looks done. It is fast and it is useful. For a prototype, a throwaway script, or a spike to learn something, the ceremony would only slow you down.

Agentic engineering keeps both, and adds more. You write the spec down. You give the agent guardrails to work inside. You review the output against risk, and you gate it with tests, linting, and types. It is slower to start and much safer to ship.

| | Vibe coding | Agentic engineering |
|---|---|---|
| **Spec** | A sentence or two, refined by chatting | Written up front, questioned before building |
| **Guardrails** | Few, you steer as you go | Stated scope, constraints, definition of done |
| **Review** | Skim the output, trust the vibes | Risk review, read the dangerous parts closely |
| **Tests** | Optional, often skipped | Behaviour tests, gated in CI |
| **Best for** | Prototypes, spikes, throwaways, learning | Anything customers, money, or data touch |
| **Main risk** | Shipping code nobody understands | Ceremony that outweighs the task |

## Match the ceremony to the risk

Teams get this wrong in both directions.

The obvious failure is vibe coding leaking into production. Someone builds a quick prototype, it demos well, and it quietly becomes the product without ever picking up a spec, tests, or a proper review. Now you run code nobody fully understands, and the first person to understand it will be whoever is on call when it breaks.

The less obvious failure is the opposite. You wrap a real throwaway in full agentic ceremony. A PRD, issues, and a gated pipeline for a script you will run once and delete is process theatre. It burns the time the tools were supposed to give you back.

The skill is reading the work and matching the ceremony to the risk. A rough internal dashboard and a payment flow are different kinds of work, so vibe code the dashboard and agentic-engineer the payment flow. Most work sits between those two, and judging where is the job.

## Make the mode explicit

For one person this is a judgement call. For a team it needs to be a stated decision, because the expensive mistakes come from nobody being sure which mode they are in.

Name the mode when the work starts. "This is a spike, vibe it and we'll throw it away" is a different instruction from "this is going to customers", and saying which one out loud costs nothing.

Then put a gate at the boundary between them. A prototype moving to production should be a step someone takes on purpose, with a spec and a review attached, not something that happens by default because the demo went well. Check the tests at that gate too. Vibe-coded tests can be green and still tell you nothing, so anything going to customers needs tests that describe behaviour and trace back to a real spec.

My argument here is about clarity, not caution. Treat the two modes as one thing and you get either a prototype in production or a committee reviewing a throwaway.

As building gets cheap, producing code stops being the scarce skill in either mode. What stays scarce is judgement: knowing which mode the work deserves, and keeping the two apart. The tools give everyone speed. Deciding when to slow down is still your job.
