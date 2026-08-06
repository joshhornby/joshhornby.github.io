---
title: Reconsidering Tech Debt
date: 2025-06-30 08:00:00
description: "There's a phrase I've grown wary of over the years: tech debt. It shows up in all kinds of conversations, often spoken as a half-apology, half-warning. The metaphor is sticky, and like most sticky things in engineering, I think it's started to obscure more than it reveals."
tags: [culture, software-engineering]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

There's a phrase I've grown wary of over the years: *tech debt*. It shows up in all kinds of conversations, but often hides more than it explains.

"We need to pay down our tech debt".

"If only we didn't have so much tech debt".

After a while, the phrase stops clarifying things and just becomes a catch-all excuse, something we say out of habit, even when it doesn't help us understand what's wrong or what to do next.

## Where the debt analogy breaks down

The appeal of "tech debt" is that finance is familiar. You borrow, you accrue interest, you pay it back later. It makes prioritising feel rational, because you can invest now and settle up afterwards. The metaphor holds for a while, then it starts to slip.

Teams use the phrase for legacy code, quick hacks, architectures that no longer fit, and features that were never built. One word ends up carrying too many unrelated things.

Real debt is precise. You know the amount, the terms and the interest rate. Nobody can tell you how much tech debt they have or what they're paying to service it.

And it offers cover. Saying "tech debt" moves the conversation away from how the decisions got made, why the work is hard now, and what changing it would actually take.

## Language shapes how we act

The words we use shape what we do about a problem. Calling everything "tech debt" wraps a range of issues in one comforting financial metaphor. Some of it is the cost of learning. Some is a relic that no longer matters. Some is a deep architectural problem sitting in the same list as a small annoyance.

Mostly it flattens the story. What we call debt is usually the result of decisions made under real constraints. Today's debt was yesterday's pragmatic delivery, and the metaphor blurs that context rather than explaining it.

## What to say instead

If I could retire the term from engineering meetings, I would. What I'd rather hear is more specific.

Describe the pain instead of the metaphor. Is the code slow? Hard to read? Impossible to change safely? Is it blocking a launch?

Tell the story of how we got here. What did we learn? Was it a deliberate trade-off or an accident? The history matters more than the label.

Then describe the impact today. What is it costing? How is it affecting customers or slowing the team? That's what drives sensible prioritisation.

My real objection isn't about language. It's about discipline. "Tech debt" is shorthand that lets us skip the harder conversation about architectural drift, team incentives and the messy reality of delivery. I'd rather teams confronted the mess directly.
