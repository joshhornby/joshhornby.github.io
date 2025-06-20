---
title: Run Less Software, Build More Value
date: 2025-01-01 08:00:00
tags: [architecture, software-engineering]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-06-11 T19:00:00+01:00
---

One of the biggest lessons I took from [my time at cinch](/stuff-learned-at-cinch) was seeing what happens when you don't have to think about infrastructure. The foundation was built on AWS Serverless and managed services, which meant almost all of our engineering effort could go into solving real product and customer problems, not keeping the plumbing running.

That experience made something clear: most teams quietly accept a [background hum of toil](/engineering-toil), patching, scaling, fixing test flakiness, maintaining scripts, chasing down backup failures. It's rarely a crisis, but it chips away at the team's focus and energy. With serverless, that friction faded into the background.

Suddenly, infrastructure wasn't the limiting factor or even a topic of daily debate. We could ship, experiment, and iterate with almost all of our attention on what mattered to users.

## The Invisible Cost of Running Software

There's a persistent myth that engineering productivity is mostly about process, tooling, or hiring. But the biggest hidden tax is simply the amount of *stuff* you have to run and maintain. Every script, server, and service creates its own mini-ecosystem of alerts, docs, and habits. Each is a small drag on team velocity. In the aggregate, this background noise becomes the dominant cost of building software.

In teams that I've worked with, it's easy to underestimate how much time gets soaked up by maintenance—patching dependencies, wrangling deployments, chasing flaky tests, rotating secrets. These are the sorts of jobs that never make it onto the roadmap, but add up to weeks lost per engineer every year.

## What Happens When You Run Less

When you deliberately architect for less software, choosing serverless where it fits, relying on managed services, resisting the urge to roll your own platforms—the payoff compounds:

- Teams spend more cycles on customer value, less on invisible ops work.
- The blast radius of changes shrinks. Fewer things to break, fewer pages at 2am.
- Onboarding gets faster. New engineers can actually ship code in their first week.
- You reduce the temptation to chase "interesting problems" that aren't valuable for the business.
- Most importantly, you create the conditions for sustained, [leveraged impact work](/doing-leveraged-work) that continues to pay dividends long after the initial push.

## Advice for Engineering Leaders

- **Audit your surface area.** List every system your team runs that isn't directly tied to customer value. Which ones could be outsourced to a managed service?
- **Invest in boring tech.** Choose the platform that fades into the background and lets you focus on shipping, not heroics.
- **Frame toil as a first-class problem.** Make reducing repetitive, low-leverage work part of the team's mission—not an afterthought.
- **Challenge assumptions.** If the default is "we need a new service" ask why. Push for simplicity and leverage, not technical vanity.
- **Celebrate time reclaimed.** Make visible the hours or days saved by automating, outsourcing, or killing off unnecessary systems—and redirect that energy to product bets and customer outcomes.

Serverless isn't a magic bullet, but it's a powerful example of how to run less. The lesson isn't about the technology itself—it's about intentionally reducing the burden your team carries, so they can do their best, most impactful work.

In the end, it's not about where you work, it's about what you choose to work on. The less you run, the more you can build.
