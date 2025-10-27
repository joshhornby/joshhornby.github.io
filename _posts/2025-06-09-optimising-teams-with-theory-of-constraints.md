---
title: Optimising teams through the Theory of Constraints
date: 2025-06-09 08:00:00
tags: [management, systems-thinking]
description: "Using the Theory of Constraints to improve team delivery"
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-10-26T08:00:00+00:00"
---
When I first started in engineering leadership roles, I figured the best teams ran like well-oiled machines, every engineer flat out, every hour accounted for. It made sense on paper: 100% utilisation must mean maximum output, right? What I learned (mostly the hard way) is that teams pushed to the limit don't run smoothly. One small delay, and everything grinds to a halt.

At first, I thought the fix was better planning or clearer priorities, maybe even more process. But no matter how we organised the work, the same pattern kept showing up: things started fast, then piled up somewhere in the middle. That's when I came across the Theory of Constraints.

The Theory of Constraints shows you something simple: one bottleneck controls your entire throughput, not the sum of everyone's individual effort. When you index on personal productivity, story points completed, or hours logged, you just build invisible queues in front of that bottleneck. Lead times increase, frustration mounts, and the illusion that "everyone's working" masks the reality that nothing's shipping.

To fix that, you have to shift focus from how busy individuals are to how well the system flows. And that starts with identifying what's actually slowing you down.

## Surfacing the constraint
A lot of engineering leadership is just good detective work, looking beyond who's busy and what's being built and instead asking where and why the work stops? It's not always obvious. Constraints are often hidden behind handoffs, stretched roles, or overloaded reviews. They show up as quiet delays, not flashing alerts. Spotting them means stepping back and watching how work really moves through the system.

A few tools help bring that picture into focus:

- **Value-stream mapping** gives you a clear picture of where things actually slow down.
- **Kanban boards with explicit WIP limits** make queues visible, so you can't ignore them.
- **Flow-based metrics such as lead time and throughput** turn gut feel into something you can act on.

Once you know where the real bottleneck is, you can protect it and eventually remove it. But seeing the constraint is only the first step, how your structure works in response to it is what really determines whether things speed up or stay stuck.

## Designing healthy habits
Stack ten pull requests in front of your single code reviewer and watch lead times explode. Leave them with nothing to review and you've wasted your constraint. Keep two or three ready and you maintain flow without hiding problems. It's a bit like keeping a few tables free in a busy restaurant, just enough to keep things moving, but not so much that the place looks empty.

When someone on the team has capacity, point it at the bottleneck:

- Pair a backend engineer with a tester to automate flaky scenarios.
- Have product managers dogfood the feature earlier, compressing feedback loops.
- Encourage cross-skilling so the team can flex and support the areas under the most pressure.

Done well, this keeps the whole system flowing, even when not everyone is operating at 100%.

## Shortening feedback loops
Working in small batches allows you to fail early and often. Continuous integration, feature flags, and trunk-based development shrink the blast radius when something goes wrong, reducing pressure on the constraint and keeping flow predictable.

But fast feedback doesn't just come from tooling, and it relies on the team's ability to act on it. That's where culture comes in.

## Cultural scaffolding
Process tweaks are pointless unless your culture backs them up. You can introduce all the right tools: WIP limits, standups, metrics, automation, but if the underlying team culture doesn't support how and why they're used, then it won't stick. Worse, they'll become theatre: rules followed on paper but ignored in spirit.

You need three things to make this work:

- **Psychological safety** - people must feel authorised to pause work rather than pile it on.
- **Shared responsibility** - the feature isn't done until it's in production and customers succeed.
- **Managerial coaching** - celebrate queue reduction and flow improvement, not personal velocity.

Optimising a team isn't about keeping everyone busy. It's about watching features actually ship to production instead of counting how many tickets got picked up. Focus on throughput, not utilisation. The team that leaves some engineers free to unblock others can ship twice as much as the one where everyone's heads-down on their own work.
