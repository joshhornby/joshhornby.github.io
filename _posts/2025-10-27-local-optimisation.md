---
title:  "The Local Optimisation Trap"
date:   2025-10-27 08:00:00
written_with_ai: true
description: "How rational team-level decisions create irrational company-wide outcomes and why zooming out matters."
tags: [software-engineering]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-10-27T07:00:00+00:00"
---

A team implements API rate limiting to protect their service from overload. Sensible engineering decision. But those limits force client teams to build complex retry logic and caching layers, slowing their development by weeks.

This is Local Optimisation in action. Teams make rational decisions within their scope that create irrational outcomes for the company or other teams. Each decision makes perfect sense from the team's perspective, and the problems only become visible when you zoom out.

## Why teams make locally optimal decisions

I don't believe teams do this on purpose. [They respond to their incentive structure](/culture-follows-incentives). Engineering teams normally get measured on what they can control:

- Feature delivery against roadmap commitments
- Code quality and test coverage
- Sprint velocity and story point completion _(No one said they had to be good measures)_
- System uptime and performance

None of these metrics capture cross-team impact. A team can hit all their targets whilst creating chaos elsewhere.

As an Engineering leader, you're caught between a rock and a hard place. Your team needs clear goals and success criteria. But hitting those local targets can hurt everyone else.

My current answer isn't to abandon local metrics, because teams need that focus. It's to force a global perspective into local decisions.

- Track what happens downstream when your team changes something. Make cross-team impact visible in your metrics.

- Have engineers spend time embedded with their consumers. Nothing changes perspective faster than seeing your work from the other side.

- Add cross-team satisfaction to your team's goals. A local win that hurts other teams is debt, not success.

The hardest part is that it feels like good engineering. Clean code, proper abstractions and following best practice are all valuable, and they get dangerous only when you ignore the wider impact. So instead of asking what the best solution is for us, ask what the best solution is for the customer journey flowing through us.
