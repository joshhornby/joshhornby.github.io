---
title: Optimising teams through the Theory of Constraints
date: 2025-06-09 08:00:00
tags: [management, systems-thinking]
description: "How to use the Theory of Constraints to improve team delivery"
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-06-09 T19:00:00+01:00
---
When I first started in engineering leadership, I figured the best teams ran like well-oiled machines, every engineer flat out, every hour accounted for. It made sense on paper: 100% utilisation must mean maximum output, right? What I learned (mostly the hard way) is that teams pushed to the limit don't run smoothly. One small delay, and everything grinds to a halt.

At first, I thought the fix was better planning or clearer priorities, maybe even more process. But no matter how we organised the work, the same pattern kept showing up: things started fast, then piled up somewhere in the middle. That's when I came across the Theory of Constraints.

The Theory of Constraints offers a simple insight: your throughput is governed by a single constraint, not by the sum of everyone's individual effort. When you index on personal productivity, story points completed, hours logged, you merely accumulate invisible queues in front of that constraint. Lead times increase, frustration mounts, and the illusion that "everyone's working" masks the reality that value isn't moving.

To fix that, you have to shift focus from how busy individuals are to how well the system flows. And that starts with identifying what's actually slowing you down.

## Surfacing the constraint
A lot of engineering leadership is just good detective work. Before you can improve how work flows, you need to make the constraint obvious:

- **Value-stream mapping** gives you a clear picture of where things actually slow down.
- **Kanban boards with explicit WIP limits** make queues visible, so you can't ignore them.
- **Flow based metrics such as lead time and throughput** turn gut feel into something you can act on.

Once you know where the real bottleneck is, you can protect it and eventually remove it. But seeing the constraint is only the first step, how you manage work around it is what really determines whether things speed up or stay stuck.

## Designing healthy habits
Too much work piles up and everything slows down. Too little, and the bottleneck sits idle. You want just enough of a buffer to handle the usual bumps without hiding real problems. It's a bit like keeping a few tables free in a busy restaurant, just enough to keep things moving, but not so much that the place grinds to a halt.

When someone on the team has capacity, point it at the bottleneck:

- Pair a backend engineer with a tester to automate flaky scenarios.
- Have product managers dogfood the feature earlier, compressing feedback loops.
- Encourage cross-skilling so the team flexes where the system needs.

Done well, this keeps the whole system flowing, even when not everyone is operating at 100%.

## Shortening feedback loops
Working in small batches allows you to fail early, and often. Continuous integration, feature flags, and trunk-based development shrink the blast radius when something goes wrong, reducing pressure on the constraint and keeping flow predictable.

But fast feedback doesn't just come from tooling, and it relies on the team's ability to act on it. That's where culture comes in.

## Cultural scaffolding
Process tweaks are pointless unless the culture holds them up. You can introduce all the right tools: WIP limits, standups, metrics, automation, but if the underlying team culture doesn't support how and why they're used, then it won't stick. Worse, they'll become theatre: rules followed on paper but ignored in spirit.

It takes deliberate cultural foundations to make these practices meaningful, things that shape how the team behaves when no one's watching:

- **Psychological safety** - people must feel authorised to pause work rather than pile it on.
- **Shared responsibility** - the feature isn't done until it's in production and customers succeed.
- **Managerial coaching** - celebrate queue reduction and flow improvement, not personal velocity.

Optimising a team isn't about keeping everyone busy, it's about making sure the right work moves at the right time. Focus on throughput, not utilisation, and you get steady, predictable progress instead of a mad dash. The paradox is simple: the team that's OK with waiting now and then is the one that ends up delivering more.
