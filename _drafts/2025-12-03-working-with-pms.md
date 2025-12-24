---
title: "Working Effectively With Product Managers"
date: 2025-12-03 08:00:00
tags: [management, leadership, product]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-12-03 T07:00:00+01:00"
---

Early in my career as a Tech Lead, I had a PM who'd send me a Slack message every morning: "Any blockers I should know about?" At the time, I found it slightly annoying. Now I recognise it as the simplest, most effective ritual I've encountered for keeping a PM-Engineering partnership healthy.

The relationship between a Tech Lead and their PM is one of the most important in any product team. Get it right, and work flows. Get it wrong, and you'll spend more time in misaligned meetings than actually building anything.

## What Product Managers Do

It's useful to start by understanding the role of a product manager. A PM is responsible for:

- Product vision and strategy
- Prioritisation based on customer needs and business goals
- Stakeholder relationships across the business
- Representing the customer within the team

This can be shortened to: PMs focus on the "what" and "why", engineering focuses on the "how".

Often the delivery role is overlooked and it can vary significantly between organisations. In some companies, PMs are deeply involved in day-to-day delivery, while in others they take a more strategic view. In my experience engineering normally own delivery execution, with PMs providing context, prioritisation, and stakeholder management.

## Owning the How, Partnering on the What

The Tech Lead owns the "how" - ensuring we build things the right way, with quality and maintainability in mind. But stopping there is a mistake, Tech Leads also engage with the "what" - understanding customer needs and business goals behind features. This isn't stepping on the PM's toes. It's how you catch problems early and propose solutions that actually fit.

This matters even more when the PM is less experienced. Tech Leads often have years on their PM counterparts, especially at growing companies. Use that. Share what you've learned about prioritisation, stakeholder management, or customer research. A stronger PM makes your life easier.

## Balancing Delivery and Quality

I've had versions of the same conversation dozens of times. PM: "Can we ship this by Friday?" Me: "We can, but we'll be skipping the integration tests and the error handling will be basic." PM: "Is that bad?" Me: "Depends on how much you like getting paged at 2am."

The answer isn't to pick a side. It's to make the trade-offs explicit. Sometimes speed wins. Sometimes quality must. What matters is deciding together with eyes open.

One thing that helps: bring PMs into technical discussions about architecture and quality. I started inviting my PM to our architecture reviews, not to contribute technically, but to hear the reasoning. When they understand why something takes longer, the conversations get easier.

## Common Challenges

Over the years I've seen a few common challenges arise in the PM-Engineering relationship:

### Unclear ownership

I once sat in a post-mortem where we discovered that a critical customer email had gone unsent for three weeks. The PM thought engineering would trigger it after deployment. Engineering thought the PM would handle it through the marketing platform. Neither did.

When nobody knows who owns what, things slip through. The fix is boring but effective: define responsibilities early. Write them down. Revisit them when scope changes.

### Different definitions of success

I remember a feature launch where the PM was thrilled. Adoption numbers looked great, stakeholders were happy, champagne emojis in Slack. Meanwhile, I was dreading the on-call rotation because I knew the code we'd shipped was held together with duct tape. Two months later, that feature accounted for 40% of our production incidents.

PMs watch business metrics. Engineers care about technical excellence. Neither is wrong, but without shared goals you end up talking past each other. Align on what "done well" looks like before you start, not after.

### Committing to dates without engineering input

"We told the board it would be ready by March."

I've heard variations of this sentence more times than I'd like. The PM promises a deadline to stakeholders, then tells the team. Engineers feel set up to fail before they've written a line of code.

The fix: bring engineering into estimation conversations before commitments are made. Even a rough "t-shirt size" check can prevent a lot of pain. I've written more about this in [Estimation Pragmatism](/estimation-pragmatism).

### Solution vs problem framing

A PM once came to me with a detailed spec for a notification preferences page: checkboxes for email, SMS, and push, organised by category, with a "save all" button at the bottom. I built it. Users ignored it completely.

When we finally talked to customers, we discovered they didn't want granular control. They wanted one toggle: "only contact me about my orders." We'd built a solution to a problem nobody had.

Better PMs share the customer problem and constraints, then collaborate on the approach. The best solutions often come from engineers who understand the technical possibilities. This is what [Product Engineers](/product-engineers) do well.

### Technical work as a hard sell

I spent months trying to get a PM to prioritise a caching layer that would cut our API response times in half. Every sprint planning, I'd bring it up. Every sprint, something more "urgent" came along.

Then we had an incident where slow responses caused a cascade of timeouts during a sales event. Suddenly the caching work was top priority. We shipped it in two weeks. I couldn't help thinking: we could have done this months ago, calmly, instead of in crisis mode.

Refactoring, paying down debt, improving observability. PMs don't always see the value because it doesn't move a business metric. The relationship gets strained when engineers feel they have to constantly justify foundational work. Frame technical investments in terms of what they enable: faster future delivery, fewer incidents, less firefighting. And sometimes, accept that you'll only get the green light after something breaks.

### "Just a small change"

"Can we just add a field to the user profile? Should be quick, right?"

I remember explaining to a PM that this "simple" request would require a database migration, updates to three microservices, changes to the mobile app, and a data backfill script. Their face fell. It genuinely looked simple from the outside.

Trust erodes when engineers feel their expertise isn't respected. But often PMs aren't being dismissive - they just can't see the iceberg under the water. The antidote is curiosity on both sides: PMs asking why something is complex, and engineers explaining without condescension.

## The Relationship Is the Work

Most of these challenges come down to the same thing: two people with different contexts trying to solve the same problem. The PM sees stakeholder pressure, market timing, and customer feedback you'll never hear. You see technical risk, maintenance burden, and the last three times a "quick fix" came back to bite you.

Neither view is complete. The best PM-Tech Lead partnerships I've seen treat this gap as a feature, not a bug. You're not supposed to agree on everything. You're supposed to bring different perspectives and hash it out until you land on something better than either of you would reach alone.

The PM I mentioned at the start, the one with the daily "any blockers?" message, taught me something I didn't appreciate until years later. The ritual wasn't really about blockers. It was about creating a daily moment where we had to be honest with each other. Most days the answer was "nope, all good." But on the days it wasn't, I'd already have their attention.

That takes trust. Trust takes time. And time takes showing up, being honest about trade-offs, and occasionally admitting you got it wrong.
