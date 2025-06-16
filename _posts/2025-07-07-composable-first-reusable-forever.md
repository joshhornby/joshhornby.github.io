---
title: Composable First, Reusable Forever
date: 2025-07-07 08:00:00
tags: [software-engineering, architecture]
description: "There's a certain romance to reusability. Ask any engineering leader what they want from their systems, and the word reusability will float up within minutes - right alongside maintainable and scalable. It's a moth to the flame that lures us into abstraction, grand refactors, and ever-larger piles of shared code. But after a decade leading teams, I've found reusability is almost always the wrong thing to chase directly. If you want systems you can reuse, you have to start somewhere else: composability."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: 2025-07-07 T19:00:00+01:00
---

There's a certain romance to reusability. Ask any engineering leader what they want from their systems, and the word *reusability* will float up within minutes, right alongside "maintainable" and "scalable".

Reusability lures us into abstraction, big refactors, and large piles of shared code. But I've found reusability is almost always the wrong thing to chase directly. If you want systems you can reuse, you have to start somewhere else: composability.

## The Reusability Fallacy

The "reuse" mindset goes something like this: if I build the perfect library or the global service, teams will stop repeating themselves, and we'll be faster, less expensive, better forever.

In reality, direct attempts at reusability tend to calcify into monoliths. Teams are forced to bend to a common pattern, and the code becomes a monument to decisions no one can quite remember making. "Reusable" code ends up as a graveyard of abandoned entry points and TODOs about missing features. I've lost count of the times I've inherited a "shared" library that, in practice, no one actually wanted to share.

What gets missed is that true reusability is *emergent*. It's not decreed by a principal engineer's architectural document. It's the dividend you collect when you deliberately optimise your systems, code, teams, and process for composability.

The real trap isn't just technical, it's organisational. Every dependency on a "reusable" component couples teams together, sometimes invisibly. When one group needs a small tweak, the change drags through layers of negotiation, code review, and compromise. Instead of accelerating, teams end up queueing for changes, waiting on someone else's roadmap, or tiptoeing around global side effects. Delivery slows. Autonomy shrinks. The promise of speed and consistency quietly becomes a source of friction.

## Composability from First Principles

Composability, by contrast, is about boundaries and contracts. Instead of building a single thing to do everything, you build smaller things that snap together. You resist the urge to predict all future use-cases, and instead focus on making each part simple to understand, reason about, and connect.

[Amazon's famous API Mandate](https://nordicapis.com/the-bezos-api-mandate-amazons-manifesto-for-externalization) wasn't about reusability for its own sake; it was about [enforcing boundaries so that everything had to be composed via stable contracts](/boundaries-over-coordination). The teams got to keep their autonomy, but the business unlocked a surface area for innovation that no monolith could provide.

When you focus on composability:

- You make pieces that are small enough to be replaced, but valuable enough to be used as-is.
- Teams can solve their own problems, using your piece as a building block, not a finished product.
- Integration patterns become clear, and over time, common uses *emerge*, and those are the parts that actually get reused, because it's clear how they fit.

## Composability in Practice

This lesson took years to stick. Early in my career, I pushed my teams to "share more code." Sometimes it worked. More often, it slowed us down, as every small divergence became a negotiation.  

The shift came when we flipped the question: "How do we make this reusable?" to "How do we make this composable?" The difference is subtle but fundamental.

- One early push was a universal logging library, tightly coupled to our specific backend. Teams resisted half-wanted structured logs, the other half just necessary error tracking. When we broke it up into composable middleware, one for output format, one for transport, one for log levels, teams picked what fit their context and contributed back improvements that didn't break everyone else

- For onboarding flows, we abandoned the primary workflow and provided small, composable steps. Teams assembled their flows from these blocks, and when a better approach was found, it was trivial to slot in or swap out.

## Reusability as Dividend

Optimising for composability feels slow at first. It means fewer large abstractions, more focus on contracts, and living with duplication a little longer than your inner perfectionist might like.

But over time, the patterns that get used are the ones that are genuinely valuable. Instead of forcing reuse, you observe it in the wild, and everyone is composing these three pieces together; maybe they deserve a new abstraction.

Reusable code, processes, and even teams emerge not because you enforced them, but because you made it possible. Real reuse is a signal, not a strategy.

If you want to build systems that last and scale, don't make reusability your primary goal. Optimise for composability first. Reusability will follow, and it will be real, earned, and wanted.
