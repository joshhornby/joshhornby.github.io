---
title: Optimising teams through the Theory of Constraints
date: 2025-06-09 08:00:00
tags: [management, systems-thinking]
description: "Using the Theory of Constraints to improve team delivery"
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---
When I first started in engineering leadership roles, I figured the best teams ran like well-oiled machines, every engineer flat out, every hour accounted for. It made sense on paper: 100% utilisation must mean maximum output, right? What I learned (mostly the hard way) is that teams pushed to the limit don't run smoothly. One small delay, and everything grinds to a halt.

At first, I thought the fix was better planning or clearer priorities, maybe even more process. But no matter how we organised the work, the same pattern kept showing up: things started fast, then piled up somewhere in the middle. That's when I came across the Theory of Constraints.

The Theory of Constraints shows you something simple. One bottleneck controls your throughput, not the sum of everyone's individual effort. When you measure personal productivity, story points completed or hours logged, all you do is build invisible queues in front of that bottleneck. Lead times go up, people get frustrated, and everyone looks busy while nothing ships.

To fix it, you have to stop asking how busy individuals are and start asking how well the system flows. That starts with finding what's slowing you down.

## Surfacing the constraint
A lot of engineering leadership is detective work. You look past who's busy and what's being built, and ask where the work stops and why. It's rarely obvious. Constraints hide behind handoffs, stretched roles and overloaded reviews. They show up as quiet delays rather than alerts, so spotting them means stepping back and watching how work really moves.

A few tools bring that picture into focus. Value-stream mapping shows you where things slow down. Kanban boards with explicit WIP limits make the queues visible, so you can't ignore them. And flow metrics like lead time and throughput turn a gut feel into something you can act on.

Once you know where the bottleneck is, you can protect it and eventually remove it. But finding it is only the first step. What decides whether things speed up is how you arrange the work around it.

## Designing healthy habits
Stack ten pull requests in front of your single code reviewer and watch lead times explode. Leave them with nothing to review and you've wasted your constraint. Keep two or three ready and you maintain flow without hiding problems. It's a bit like keeping a few tables free in a busy restaurant, just enough to keep things moving, but not so much that the place looks empty.

When someone on the team has capacity, point it at the bottleneck:

- Pair a backend engineer with a tester to automate flaky scenarios.
- Have product managers dogfood the feature earlier, compressing feedback loops.
- Encourage cross-skilling so the team can flex and support the areas under the most pressure.

Done well, this keeps the whole system flowing, even when not everyone is operating at 100%.

## Shortening feedback loops
Working in small batches lets you fail early and often. Continuous integration, feature flags and trunk-based development all shrink the blast radius when something goes wrong, which takes pressure off the constraint and keeps flow predictable.

Tooling only gets you part of the way, because fast feedback still depends on the team acting on it. That's where culture comes in.

## Cultural scaffolding
Process changes are pointless unless the culture backs them up. You can bring in WIP limits, standups, metrics and automation, but if the team doesn't understand why they're there, none of it sticks. Worse, it becomes theatre, where the rules get followed on paper and ignored in practice.

Three things make it work. People need to feel safe pausing work rather than piling more on. The team needs to treat a feature as unfinished until it's in production and customers are using it. And managers need to make a fuss about shorter queues and better flow instead of individual velocity.

Optimising a team isn't about keeping everyone busy. It's about watching features reach production rather than counting how many tickets got picked up. The team that leaves a couple of engineers free to unblock others ships more than the one where everyone is heads-down on their own work.
