---
title: Reconsidering Tech Debt
date: 2025-06-30 08:00:00
description: "There's a phrase I've grown wary of over the years: tech debt. It shows up in all kinds of conversations, often spoken as a half-apology, half-warning. The metaphor is sticky, and like most sticky things in engineering, I think it's started to obscure more than it reveals."
tags: [management, architecture, software-engineering]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-06-30 T19:00:00+01:00
---

There's a phrase I've grown wary of over the years: *tech debt*. It shows up in all kinds of conversations, often spoken as a half-apology, half-warning.

"We need to pay down our tech debt".

"If only we didn't have so much tech debt."

After a while, the phrase stops clarifying things and just becomes a catch-all excuse, something we say out of habit, even when it doesn't help us understand what's wrong or what to do next.

## The Debt Analogy: Useful Until It Isn't

The core appeal of "tech debt" is its similarities with finance. Debt is familiar: you borrow, gain interest, pay it back later. It makes prioritising work feel rational, invest now, pay off later, balance the books. The metaphor works for a while. But over time, I've found it gets warped in every direction:

- Some teams use "tech debt" to describe everything from legacy code, to quick hacks, or misaligned architectures, to missed features. "Debt" becomes a catch-all word, big, heavy, packed with too many unrelated things.

- Real debt is precise. You know the amount, the terms, the interest rate. Tech debt? It's a hand wave. No one can tell you how much debt you actually have, or what you're paying in interest.

- Worst of all, "tech debt" offers cover. It's an excuse, a way to shift focus away from how decisions were made, why things are hard, or what it would actually take to change them.

## Language Shapes Our Actions

In engineering, the words we use shape how we act. "Tech debt" turns engineering problems into financial abstractions. That's comforting, but also misleading.

- If every bit of "tech debt" is just a loan, it implies that paying it off is always worthwhile. That's not true. Sometimes, the "debt" is simply the cost of learning what works. Sometimes it's a relic that doesn't matter any more.

- The metaphor hides trade-offs. Financial debt is straightforward, money is money. In software, "debt" ranges from an ugly variable name to an entire architecture that can't scale. Bundling these together under one phrase makes prioritisation fuzzier, not clearer.

- It erases history. When we talk about "tech debt", we usually mean "something that should have been done differently." But most "debt" was the right decision *at the time*, made under real constraints. Today's "debt" is yesterday's pragmatic delivery.

## What to Say Instead

If I could retire the term "tech debt" from engineering meetings, I would. But what would I hope to hear instead?

- **Be precise.** Is the code slow? Hard to read? Impossible to change? Are we blocked from launching a new feature? Describe the pain, not the metaphor.
- **Tell the story.** How did we get here? What did we learn? Was it a deliberate trade-off, or an accident? The history matters more than the label.
- **Describe the impact.** What is the cost today? How is it affecting customers, or slowing the team? Specifics drive better prioritisation.

Ultimately, my gripe with "tech debt" isn't just about language. It's about discipline. "Tech debt" gives us a shorthand to avoid challenging conversations about architectural drift, team incentives, and the messy path of real world delivery. I'd rather see teams confront the mess head on, with the honesty and clarity it deserves.

The most effective teams don't get stuck on metaphors. They focus on real problems, clear trade-offs, and steady progress. That kind of clarity always beats shorthand.
