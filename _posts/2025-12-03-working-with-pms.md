---
title: "Working Effectively With Product Managers"
date: 2025-12-03 08:00:00
tags: [management, product, tech-lead-series]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-12-03 T07:00:00+01:00"
---

> This post is part of a series on engineering leadership from a Tech Leads perspective. You can read the other posts in the [Tech Leadership Series](/tags/tech-lead-series/).

One of the most important relationships for a Tech Lead is with their product manager. A strong partnership here can make or break a team's success.

## What Product Managers Do

I think it's useful to start by understanding the role of a product manager. A PM is responsible for:

- Product vision and strategy
- Prioritisation based on customer needs and business goals
- Stakeholder relationships across the business
- Representing the customer within the team

This can be shortened to: PMs focus on the "what" and "why", engineering focuses on the "how".

When it comes to the delivery role it can vary significantly between organisations. In some companies, PMs are deeply involved in day-to-day delivery, while in others they take a more strategic view. In my experience engineering normally own delivery execution, with PMs providing context, prioritisation, and stakeholder management.

## Owning the How, Partnering on the What

As we spoke about above, the Tech Lead owns the "how" of delivery - ensuring we build things the right way, with quality and maintainability in mind. However, I also see value in partnering closely with PMs on the "what" - understanding the customer needs and business goals behind features.

It's not uncommon for the PM to be more junior than the Tech Lead in terms of experience. In these situations, I see part of the Tech Lead role as mentoring and supporting the PM to grow into their role. This could involve sharing best practices around prioritisation, stakeholder management, or customer research.

## Balancing Delivery and Quality

A common situation Tech Leads face is balancing the need for speedy delivery with maintaining high quality. PMs may push for faster delivery to meet business deadlines, while engineers advocate for more time to ensure quality. In these situations, open communication is key.

The answer isn't to pick a side. It's to make the trade-offs explicit. Sometimes speed wins. Sometimes quality must. What matters is deciding together with eyes open.

One thing that helps: bring PMs into technical discussions about architecture and quality. When they understand why something takes longer, the conversations get easier.

## Common Challenges

Over the years I've seen a few common challenges arise in the PM-Engineering relationship:

### Unclear ownership

When nobody knows who owns what, things slip through. The PM assumes engineering will handle stakeholder updates. Engineering assumes the PM has it covered. Neither does. The fix is boring but effective: define responsibilities early. Write them down. Revisit them when scope changes.

### Different definitions of success

PMs watch business metrics. Engineers care about technical excellence. Neither is wrong, but without shared goals you end up talking past each other. The PM celebrates a feature launch while the engineer winces at the shortcuts taken to hit the deadline. Align on what "done well" looks like before you start, not after.

### Committing to dates without engineering input

PM promises a deadline to stakeholders, then tells the team. Engineers feel set up to fail before they've written a line of code. The fix: bring engineering into estimation conversations before commitments are made. Even a rough "t-shirt size" check can prevent a lot of pain. I've written more about this in [Estimation Pragmatism](/estimation-pragmatism).

### Solution vs problem framing

PM arrives with a fully-specced solution instead of a problem to solve. Engineers become ticket-takers rather than partners. Better PMs share the customer problem and constraints, then collaborate on the approach. The best solutions often come from engineers who understand the technical possibilities. This is what [Product Engineers](/product-engineers) do well.

### Technical work as a hard sell

Refactoring, paying down debt, improving observability. PMs don't always see the value because it doesn't move a business metric. The relationship gets strained when engineers feel they have to constantly justify foundational work. Frame technical investments in terms of what they enable: faster future delivery, fewer incidents, less firefighting.

### "Just a small change"

PM assumes something is easy because it sounds simple. A one-line copy change turns into a database migration. Trust erodes when engineers feel their expertise isn't respected. The antidote is curiosity: ask why something is complex instead of assuming it shouldn't be.

## The Relationship Is the Work

Most of these challenges come down to the same thing: two people with different contexts trying to solve the same problem. The PM sees stakeholder pressure, market timing, and customer feedback you'll never hear. You see technical risk, maintenance burden, and the last three times a "quick fix" came back to bite you.

Neither view is complete. The best PM-Tech Lead partnerships I've seen treat this gap as a feature, not a bug. You're not supposed to agree on everything. You're supposed to bring different perspectives and hash it out until you land on something better than either of you would reach alone.

That takes trust. Trust takes time. And time takes showing up, being honest about trade-offs, and occasionally admitting you got it wrong.

The teams that ship well aren't the ones with the smoothest processes. They're the ones where the Tech Lead and PM actually like working together.
