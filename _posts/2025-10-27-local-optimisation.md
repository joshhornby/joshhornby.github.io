---
title:  "The Local Optimisation Trap"
date:   2025-10-27 08:00:00
description: "How rational team-level decisions create irrational company-wide outcomes and why zooming out matters."
tags: [software-engineering]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-10-27T07:00:00+00:00"
---

Recently I've been thinking about a behaviour I've seen teams fall into, something I've started calling "Local Optimisation". 

Imagine a team that implements API rate limiting to protect their service from overload. A sensible engineering decision, right? But those limits force client teams to build complex retry logic and caching layers, slowing their development by weeks.

This is Local Optimisation in action. Teams make rational decisions within their scope that create irrational outcomes for the company or other teams. Each decision makes perfect sense from the team's perspective, and the problems only become visible when you zoom out.

## Why Teams Make Locally Optimal Decisions

I don't believe teams do this on purpose; [they respond to their incentive structure](/culture-follows-incentives). Engineering teams normally get measured on what they can control:

- Feature delivery against roadmap commitments
- Code quality and test coverage
- Sprint velocity and story point completion _(No one said they had to be good measures)_
- System uptime and performance

None of these metrics capture cross-team impact. A team can hit all their targets whilst creating chaos elsewhere.

As an Engineering leader, you're caught between a rock and a hard place. Your team needs clear goals and success criteria. But hitting those local targets can hurt everyone else.

My current solution is not to abandon local metrics; teams need that focus. Instead, force global perspective into local decisions.

- **Make cross-team impact visible.** Track what happens downstream when your team changes something.

- **Rotate decision-makers.** Have engineers from your team spend time embedded with their consumers. Nothing changes perspective faster than seeing your work from the other side.

- **Change the incentive structure.** Add cross-team satisfaction to your team's objectives. Local optimisation that hurts other teams isn't success, it's debt.

The hardest part is that local optimisation feels like good engineering. Clean code, proper abstractions, following best practices these are valuable. But they become dangerous when you ignore the wider impact. Instead of "what's the best solution for us?" reframe the question to be "what's the best solution for the customer journey flowing through us?"
