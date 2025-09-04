---
title: "When Less Is More: The Value of Picking One Way"
date: 2025-09-17 08:00:00
tags: [architecture, software-engineering]
description: "Why teams that create the most value aren't the ones with the best tech, they're the ones with the clearest constraints."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-09-17T08:00:00+01:00"
---

Something I've been thinking about recently is choosing what *not* to do is as important as choosing what you will do.

I saw this up close at [cinch](/stuff-learned-at-cinch). The engineering principles there were clear: build on AWS serverless, lean on managed services, stay away from custom platforms unless there's a real need. The payoff wasn't just in uptime or cost, it was in focus. With so much of the heavy lifting handled, most of our effort went straight into products and customers, not infrastructure. That wasn't an accident, it was the result of a handful of high-leverage decisions made early, then stuck too deliberately.

Compare that to teams I've joined where choices pile up quietly: a script here, a homegrown service there, a pet framework someone loved five years ago _(I've been guilty of being this person)_. Each addition feels small in the moment, but the lesson often learned the hard way, is that every extra moving part creates a tax you pay forever. Patching, scaling, wrangling flaky tests, untangling broken pipelines; these jobs rarely make the roadmap, but together, they take up weeks out of every engineer's year.

## Make Choices Explicit

It's easy to assume that productivity comes down to process tweaks or how many engineers you can hire. But in practice, your team's real pace is determined by how much stuff you have to keep alive. Every service and script adds its own gravity docs, alerts, habits, invisible maintenance.

When teams aren't deliberate, complexity creeps in. The ["background hum of toil"](/engineering-toil) grows until it drowns out meaningful work. The fix is rarely a heroic effort; it's naming what you're running, being explicit about what you take on, and being ruthless about killing what doesn't matter any more.

## Fewer Decisions, Better Outcomes

There's a discipline to constraining choice. At cinch, the default was a golden path: "We use this stack, these platforms, this set of libraries, unless you have a reason, stick to it." This doesn't kill creativity, it focuses it. Teams ship faster, onboarding is smoother, and you're not burning energy arguing over which flavour of queue to deploy.

That discipline paid off in all the invisible places. Incidents happened less. New engineers could ship in their first week. We had more capacity for bets that moved the needle, instead of firefighting or hand-rolling another deployment pipeline.

## Run Less, Build More

When you get deliberate about the choices you make and crucially, about the ones you avoid, the benefits compound:

- **More time for actual customer value**. Less background ops, more product shipped.
- **Smaller blast radius**. Fewer things break at once, fewer late-night pages.
- **Smoother onboarding**. New joiners don't need to learn five deployment patterns.
- **Fewer "interesting problems" for the sake of it**. More bets on what matters to the business.
- **[Leveraged work](/doing-leveraged-work)**. The kind that pays off for months or years, not just in the next sprint.

The result isn't a world without problems. It's an environment where your team's time is spent on the problems that matter. That, to me, is the real lesson: not that serverless is magic, but that every architectural decision is a lesson you live with. The best teams make those lessons explicit, write them down, revisit them, and keep their stack as light as possible.

Be explicit about the decisions your team is making. List out the tech, platforms, and patterns you've committed to, and don't ignore the ones that just snuck in along the way. Make the golden path public and easy to follow; exceptions should have a clear reason behind them, not just personal preference. Take time to regularly audit your stack, look for anything you can kill, automate, or shift to a managed service, because every piece you remove frees up more energy for work that actually matters. And when you do subtract something, celebrate it. [Make a habit of calling out time saved and complexity removed](/culture-follows-incentives), not just the features you deliver.

In the end, every system is just a collection of lessons, some intentional and some picked up the hard way. The teams that do well are the ones who talk about what they've learned and let it shape how they work, instead of repeating the same patterns. The less you have to keep running, the more you can actually build.
