---
title: Avoiding the Metrics Trap in Developer Experience
date: 2025-07-14 08:00:00
tags: [management, systems-thinking]
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2025-07-14 T19:00:00+01:00"
---

> "If a measure becomes a target, it ceases to be a good measure." – Goodhart's Law

A few years back, we brought in a Developer Experience dashboard at a previous role. Overnight, my teams "cycle time" metric started blinking red. The message was clear: lower this number. So we chopped up tickets, made sure stories were bite-sized, and watched our average cycle time drop. The dashboard lit up, everyone relaxed.

But the reality? Customers saw almost no difference. Our output increased on paper, but the features we shipped weren't more valuable, they just arrived in smaller boxes. Releases might have got a touch safer, but nothing fundamental shifted.

This is the trap of DORA: it's a precise set of measurements for delivery speed, but that precision can mask the bigger question, are you even shipping the right thing?

## What DORA Nails

DORA's four metrics: deployment frequency, lead time, change failure rate, and time to restore became the industry standard for a reason. They shine a spotlight on whether your engineering system is healthy. If releases are infrequent, slow, or prone to breaking things, these metrics quickly make the bottlenecks obvious. In teams where deployment still feels risky, DORA can be a game changer, focusing effort on the mechanics of reliable delivery. You also find that teams who improve these numbers tend to improve trust and psychological safety because you can't move faster without letting people experiment and learn.

## Where It Falls Short

But DORA is a delivery speedometer, not a compass. As soon as a metric like cycle time becomes a target, it gets gamed. Teams split stories thinner, push unfinished work into side channels, or just game the process to make the graph go up and to the right.

You can improve your DORA dashboard without shipping a single thing that matters. There's also a limit to how much it helps. Going from one release a month to one a week will shake up a business. Shaving cycle time from three days to one rarely moves the needle for customers or the bottom line. Eventually, the most [painful constraints live somewhere else entirely](/optimising-teams-with-theory-of-constraints).

## Looking Wider: SPACE, Flow, and Context

This is why I rarely look at DORA in isolation. The reality of building software is bigger. Frameworks like SPACE widen the lens to include satisfaction, collaboration, and the actual day-to-day experience of engineering. Flow frameworks take it even further, mapping value from idea to customer, showing where work is getting stuck in ways that DORA alone can't.

For me, good measurement stacks up in layers. At the top, you need business outcomes: retention, customer activation, revenue, something that tells you if the work mattered. Underneath, flow metrics show whether value is getting blocked, not just code. DORA sits below that, still useful as a signal for delivery health. Finally, you need to ask whether the team is thriving: are people able to do their best work, or are they just burning down the board?

![A black-and-white diagram with four stacked boxes labeled: Business Outcomes, Flow Metrics, DORA Metrics, and Team Thriving. Double-headed vertical arrows connect each box, showing two-way influence between the layers](/assets/images/dora-flow-diagram.png)

If you only optimise one layer, you miss the full story. DORA is a great warning light, but you need business metrics to check if you're even driving toward your actual goal.

## Avoiding Metric-Driven Thrash

Metrics are at their best as conversation starters. They're there to highlight a possible issue, not declare victory or failure. The real value is in asking why a number moved, not just reacting to it.

Improvement isn't about just driving a number down for its own sake. It's about having a theory, a clear reason why you think a change will actually make things better for engineers or the business. When you skip that step, you end up chasing whatever's easiest to count, not what really matters.

The most useful shift I've made is to treat any metric-driven change as an experiment. Make a change, watch what happens, and check if there's any actual difference in customer engagement or business results after a quarter. If speeding-up deployments doesn't shift the outcome, it's time to pause and ask if you're measuring what matters. And if a metric just encourages busywork, tickets close faster, but nothing meaningful is shipping, ditch it or try something else.

Ultimately, teams don't optimise for what's on a dashboard. They [optimise for whatever gets celebrated and rewarded](/culture-follows-incentives.md). That's why changing the incentives, or making space for narrative and qualitative feedback, always matters more than chasing perfect numbers.

## How I Approach This Now

These days, I always start by anchoring around one customer or business metric. DORA and flow metrics serve as early warning signals, if they drift, it's a cue to dig deeper, not a call to panic. I run regular reviews where we look at what's changing and whether it's having any real impact. If code review is lightning fast but product discovery drags on for weeks, it's clear the constraint isn't delivery, it's upstream.

Over time, I've learned that measurement should evolve with your team. If a metric is only improving because people have figured out how to game it, or if it stops telling you anything useful, it's time to move on. The most important question isn't "Are the numbers better?" It's "Are we actually making a difference for customers, or just getting more efficient at running in circles?"

Benchmarks can help you spot drift, but improvement only really happens locally. Metrics are most useful when they open up a conversation, not when they become the whole conversation. If you don't know the story behind a number, you're not ready to improve it.

DORA is still the quickest way I know to find pain in software delivery, but it's not a map. Developer experience is about removing friction from the work that matters, not just moving the needle on whatever's easiest to count. If you want to actually get better, stack your measurements, delivery, flow, outcomes, team health and always bring it back to impact, not just activity. Otherwise, you risk sprinting faster and faster but never getting anywhere new.
