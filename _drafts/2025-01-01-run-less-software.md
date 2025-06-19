---
title: Run Less Software, Build More Value
date: 2025-01-01 08:00:00
tags: [architecture, software-engineering]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-06-11 T19:00:00+01:00
---

Looking back, one of the most important periods in my career was [my time at cinch](/stuff-learned-at-cinch). I'd joined a team where the engineering foundation was already built on AWS Serverless and managed services. Coming from roles where patching, scaling, and chasing flaky deployments were the norm, this felt like a step change.

Most teams, myself included, get used to a certain amount of invisible work: the checklist of rituals that keeps production running, from managing scripts to updating certificates and scrambling when the wrong alert fires. It's the kind of [toil that just becomes background noise](/engineering-toil). But at cinch, so much of that friction had simply evaporated. The infrastructure wasn't front of mind. It wasn't our bottleneck, or even much of a conversation. What struck me wasn't just the lack of firefighting; it was how much energy was redirected back into the product, the actual customer experience.

We could focus on building, shipping, and learning from real users, rather than tending to the plumbing underneath. That shift, more than any framework or process, was what made the difference.

## What Serverless Unlocked

Time-to-customer shrank. Because infra wasn't a bottleneck, we could deliver new features at the speed the business needed. Rolling out a new product flow or updating an integration was usually just a case of writing the code, getting it through review, and hitting deploy. There wasn't a long checklist of ops rituals, no separate infra ticket waiting to be picked up, and no need for cross-team negotiation to get capacity bumped or security updates scheduled.

With infra out of the way, the real conversations became: what does the customer need? How can we solve it? Our time and energy shifted from platform maintenance to product discovery, experimentation, and fast feedback cycles. We could run more frequent A/B tests, iterate quickly on new ideas, and try things, measure the result, and adjust all without worrying if we'd tip the system over. The team started talking in terms of user journeys, not server health or incident queues.

When most of the repetitive, manual work disappears, so does a surprising amount of team frustration. Jobs like "clear this alert every Friday" or "manually rotate secrets every month" were mostly replaced by automated processes and platform defaults. Less busywork, lower risk of burnout, and a greater sense of progress each sprint. The best engineers want to work where their impact is visible, where they're building, not just maintaining. Serverless made that possible.

## Compounding Leverage (and Boring Tech)

It wasn't about chasing every new AWS service or the latest framework. The real productivity boost came from [choosing boring](/boring-tech) and sticking to it. Leaning on standard serverless services, Lambda, SQS, DynamoDB, S3, and shared libraries. When new projects started, there was no time lost debating basic tech choices. Most of the answers were already settled, which made onboarding new people or spinning up new squads straightforward. The stack faded into the background, letting product conversations take centre stage.

The biggest payoff from all this: [leverage](/doing-leveraged-work). Every automated process, every bit of managed infra, every shared tool freed up time and attention for more leveraged work. New engineers could ship code in their first week. Cross-team patterns and libraries meant a fix or improvement in one place benefited everyone. Knowledge about "how to get things done" was embedded in the platform and the codebase, not just in people's heads. The cumulative effect was a team that could take on bigger challenges, try more ideas, and not get bogged down in the day-to-day noise of running software.

## The Real Value

The best thing about this approach wasn't just speed, it was confidence. We could say yes to customer asks without getting bogged down in "can the platform handle it?" worries. Product teams were free to focus on solving the right problems. Shipping became the default, not the exception.

It's easy to take this for granted, but looking back, it was foundational to the way we worked. The stack faded into the background. What mattered was the work we shipped, not the infrastructure we ran.

That's the lesson I keep with me: the less software you have to run and worry about, the more value you can create.

Choose less, build more.
