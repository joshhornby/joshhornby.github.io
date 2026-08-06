---
title: Cycle Time Isn't Your North Star
date: 2025-07-14 08:00:00
tags: [management, systems-thinking, developer-experience]
description: "Many teams obsess over DORA metrics, but speed alone isn't a strategy. DORA is a speedometer, not a compass, and here's how to anchor measurement in real outcomes."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2026-08-02T08:00:00+00:00"
---

> "If a measure becomes a target, it ceases to be a good measure." - Goodhart's Law

A few years ago, we brought in a Developer Experience dashboard at a previous role. Overnight, one of my teams' cycle time metric was cause for concern. The message from above was clear: lower this number. So we chopped up tickets, split stories smaller, and watched our average cycle time drop. The dashboard turned green. Everyone was happy.

Except customers saw no difference. Our output increased on paper, but the features we shipped weren't more valuable, they just arrived in smaller boxes. Releases got marginally safer, but nothing fundamentally shifted.

That's DORA's trap. It's precise about delivery speed, and the precision hides the bigger question: are you shipping the right thing?

## What DORA gets right

DORA's four metrics (deployment frequency, lead time, change failure rate, and time to restore) became the industry standard for a reason. They reveal whether your engineering system is healthy. If releases are infrequent, slow, or break things, these metrics expose the bottlenecks.

In teams where deployment feels risky, DORA focuses effort on the mechanics of reliable delivery. Teams who improve these numbers tend to build trust and psychological safety. You can't move faster without letting people experiment and learn.

## Where it falls short

But DORA is a speedometer, not a compass. Once cycle time becomes a target, it gets gamed. Teams split stories smaller, push unfinished work into side channels, or manipulate the process to make graphs trend upward.

You can improve your DORA dashboard without shipping anything that matters. There's also diminishing returns. Going from monthly to weekly releases transforms a business. Reducing cycle time from two days to one? Customers won't notice. Eventually, the real [constraints live elsewhere](/optimising-teams-with-theory-of-constraints).

## Looking wider: SPACE, flow and context

This is why I never look at DORA alone. Frameworks like SPACE bring in satisfaction, collaboration and the daily experience of doing the work. Flow frameworks go further, mapping value from idea to customer and showing you blockages DORA misses.

Good measurement works in layers. Business outcomes like retention, activation and revenue sit at the top, and they tell you whether the work made a difference. Flow metrics sit below that, showing where value gets stuck rather than just where code does. DORA sits under those, signalling delivery health. And at the foundation is the question of whether the team is thriving or just burning down tickets.

![A black-and-white diagram with four stacked boxes labelled: Business Outcomes, Flow Metrics, DORA Metrics, and Team Thriving. Double-headed vertical arrows connect each box, showing two-way influence between the layers](/assets/images/dora-flow-diagram.png)

Work on only one layer and you miss the full story. DORA is a good warning light, but the business metrics tell you whether you're driving towards the right destination.

## Avoiding metric-driven thrash

Metrics work best as conversation starters. They highlight issues, not victories. The value is asking why a number moved, not just reacting.

Improvement requires a theory: a clear reason why a change will help engineers or the business. Skip that step and you chase what's easy to count, not what matters.

I treat metric-driven changes as experiments. Make the change, watch what happens, and check for a real difference in customer engagement a quarter later. If faster deployments don't shift outcomes, you're measuring the wrong thing. If a metric only creates busywork, where tickets close faster but nothing meaningful ships, kill it.

Teams don't work towards dashboards. They [work towards what gets celebrated](/culture-follows-incentives). Changing incentives and making space for qualitative feedback matter more than perfect numbers.

## How I approach this now

I anchor everything to one customer or business metric. DORA and flow metrics are early warnings, so when they drift, dig deeper rather than panicking. In reviews we look at what's changing and whether it reaches customers. If code review takes hours but product discovery takes weeks, delivery isn't your constraint.

Measurement should evolve with your team. If people game a metric, or it stops revealing insights, move on. The question isn't "Are the numbers better?" It's "Are we making a difference for customers, or just running in circles more efficiently?"

Benchmarks spot drift, but improvement happens locally. Metrics should open conversations, not dominate them. Without the story behind a number, you're not ready to improve it.

DORA remains the quickest way to find delivery pain. But developer experience is about removing friction from work that matters. Stack your measurements across delivery, flow, outcomes and team health, and anchor them to impact rather than activity. Otherwise you'll sprint faster towards nowhere.
