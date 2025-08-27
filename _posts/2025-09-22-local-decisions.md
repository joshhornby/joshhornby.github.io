---
title:  "The Local Optimisation Trap"
date:   2025-09-22 08:00:00
description: "How rational team-level decisions create irrational company-wide outcomes and why zooming out matters."
tags: [architecture, software-engineering, management]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-09-22T07:00:00+00:00"
---

Consider a team that implements comprehensive API rate limiting to protect their service from overload. Sensible engineering decision. But those limits force client teams to build complex retry logic and caching layers, slowing their development by weeks.

Or a security team that mandates detailed approval processes for database schema changes. Logical from a risk perspective. But now feature teams spend days waiting for sign-offs on trivial column additions, turning two-hour tasks into week-long blockers.

This is the local optimisation trap in action. Teams make rational decisions within their scope that create irrational outcomes for the company. Each decision makes perfect sense from the team's perspective. The problems only become visible when you zoom out.

## Why Smart Teams Make Locally Optimal Decisions

Teams aren't being selfish, they're responding to their incentive structure. Engineering teams normally get measured on what they can control:

- Sprint velocity and story point completion
- Code quality and test coverage  
- System uptime and performance
- Feature delivery against roadmap commitments

None of these metrics capture cross-team impact. A team can hit all their targets whilst creating chaos elsewhere. The feedback loop is broken too. When teams struggle with your output, they work around it rather than report back. Problems compound invisibly.

As an Engineering Manager, you're caught between competing pressures. Your team needs clear goals and success criteria. But hitting those local targets can hurt everyone else.

Don't abandon local metrics; teams need that focus. Instead, force global perspective into local decisions.

- **Make cross-team impact visible.** Track what happens downstream when your team changes something.

- **Rotate decision-makers.** Have engineers from your team spend time embedded with their consumers. Nothing changes perspective faster than seeing your work from the other side.

- **Change the incentive structure.** Add cross-team satisfaction to your team's objectives. Local optimisation that hurts other teams isn't success, it's debt.

The hardest part is that local optimisation feels like good engineering. Clean code, proper abstractions, following best practices these are valuable. But they become dangerous when you ignore the broader impact.

The best teams ask a different question: not "what's the best solution for us?" but "what's the best solution for the customer journey flowing through us?"
