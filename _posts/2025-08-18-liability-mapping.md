---
title: Liability Mapping and Tech Debt
date: 2025-08-18 08:00:00
description: "How Liability Mapping can be used to improve conversations around tech debt, help teams prioritise which areas they should start paying back and when. The aim is to cut through the noise of 'debt', 'toil' and everything in between, surfacing what actually matters so teams can spend less time debating and more time making clear progress."
tags: [management, architecture]
sitemap:
   priority: 0.7
   changefreq: 'monthly'
   lastmod: "2025-08-18T19:00:00+01:00"
---

I've [written about tech debt and how often it's used as a catch-all term for a range of issues](/reconsidering-tech-debt), often no one can say how much debt exists or what the cost of it is. This results in vague discussions and a lack of paying down the debt.

I've also covered [engineering toil](/engineering-toil) that quiet, repetitive work that slows teams down and chips away at morale, yet rarely gets counted in any official budget or roadmap.

This post introduces the concept of liability mapping, how it can be used to improve conversations around tech debt, help teams prioritise which areas they should start paying back and when. The aim is to cut through the noise of "debt", "toil" and everything in between, surfacing what actually matters so teams can spend less time debating and more time making progress.

## What is liability mapping?

Liability mapping breaks down the messy sprawl of "tech debt" into five categories. The goal is to surface what really matters, separate minor annoyances from large risks, whilst giving each a clear owner and action. Here's how I think about it:

| Category      | Definition                                                                                     | Primary signal                                           | Typical owner action                                       |
|---------------|------------------------------------------------------------------------------------------------|----------------------------------------------------------|------------------------------------------------------------|
| **Liability** | Clear, externally-visible risk that violates contractual, security, or compliance obligations. | CVE backlog, failed audits.                              | **Must-fix** inside cycle time or sprint.                  |
| **Drag**      | Internal friction that slows feature flow but rarely harms customers directly.                 | Build times, flaky tests, manual deploy steps.           | Schedule & track via *flow-metrics budget*.                |
| **Hazard**    | Latent defect with low frequency but high blast-radius.                                        | Single-point-of-failure, critical data coupling.         | Invest in redundancy or feature-flags before feature work. |
| **Relic**     | Dormant code, unused infra, forgotten toggles that clutter cognition.                          | Zero-call endpoints, abandoned feature flags.            | Archive or delete quarterly; measure LOC shrink.           |
| **Bet**       | Conscious shortcut taken for speed-to-market with a written expiry date.                       | TODO markers with "sunset-by" field; prototype branches. | Review in *risk council* before expiry; promote or retire. |

Because each one points to a different kind of pain: customer harm (liability, hazard), team speed (drag), mental clutter (relic), and deliberate, short-term risk (bet). Lumping them all together as "tech debt" means you either treat everything as equally urgent, or worse, ignore the actual dangerous bits until they bite you.

Liability mapping gives you a way to break that trend. Once you see which problems fall into which bucket, it's much easier to have conversations about what to fix now, what to plan for, and what you can safely ignore.

## Creating your first liability map

The most important thing is to start with real, observable evidence rather than gut feel or personal gripes. That means pulling from sources that tell the story of your systems: recent security scan reports, incident reviews, system flow metrics, maybe even a dead-code analysis. The goal is to surface facts, not feelings, so everyone's working from the same page.

Once you've got your evidence, bring together a cross-functional group, engineering, product, maybe even compliance if the risks warrant it. The workshop itself should be quick, energetic, and decisive: take each item, debate its category, and tag it with one of the five liability classes. Don't get bogged down in edge cases or endless debate, argue once, decide, and move on. The classification isn't about assigning blame, it's about getting clarity. You're looking for agreement on what the thing is, not how it happened.

After labelling, add a few triage scores. This is less about precise numbers and more about gut-level, back-of-the-envelope assessment. Ask: does this problem bite customers or the business right now, or does it have the potential to blow up later? How badly is it slowing us down? Are we sure we understand it, or is there uncertainty? The answers give you a rough sense of immediacy, potential blast radius, and how much evidence you actually have, as opposed to just vibes.

Now, with everything tagged and scored, it's time to make the map.

![Graph showing a liability map in grid form](/assets/images/liability-mapping-grid.png)

I like to plot each item on a 3x3 grid: immediate impact on one axis, longer-term risk on the other. Colour-code by class. Instantly, certain problems will pop out, the "drag" that's actually a ticking time bomb, the relics that are harmless, the liabilities hiding in plain sight. This picture gives everyone a shared, visual sense of what really needs urgent attention and what can stay in the backlog for now.

Link the map to how you actually budget and prioritise work. Anything labelled a liability or hazard goes straight into the run-cost or operational budget those are the items that could hit you with fines, customer churn, or outages if left unchecked. Drags, relics, and bets get slotted into your change-cost or innovation work streams.

This translation is great when you're trying to get buy-in from finance or leadership, because it lines up technical pain with the language of business costs and value.

The real trick is to treat this whole exercise as a living document, not a one-off event. The first map you make will be rough, maybe even a bit awkward, but that's fine. The point is to get started, get the categories working for you, and begin building the muscle. Over time, it'll get easier to spot liabilities, identify hazards before they escalate, and run pruning rituals on relics and bets.

## Getting exec buy-in

Winning over execs starts with translating technical issues into their priorities; risk, money, and time. Most leadership teams don't care about "refactoring" or "debt" in the abstract. What they want to know is why they should spend actual budget on things that aren't shiny features or new revenue. That means you have to speak their language, connecting every liability to either avoided disaster, increased velocity, or long-term cost reduction.

- Take the classic, "Why do refactoring now?" No need to get defensive. Point directly to liability-class issues and show how leaving them alone risks legal exposure or damaging headlines. It's almost always cheaper to patch the roof now than deal with a flooded office later. This isn't just about code, it's about protecting the business from preventable pain.

- Next up, "Isn't this just 'nice to have'?" Here, data is your friend. Demonstrate how cutting drag led to faster shipping and measurable wins, features delivered sooner, cost per change reduced, or even churn prevented. If you can tie a technical clean-up to a quantifiable boost in throughput, suddenly it moves from "nice to have" to "making us money".

- And for the old "We can't pause the roadmap", the map itself is your best tool. Show how dedicating a slice of capacity (say, 15% of effort) to relic clean-up or hazard reduction compounds over time. That investment means less firefighting, more predictable launches, and a downward trend in run-cost. Most execs have seen how unchecked tech mess drags on delivery, connecting clean-up work directly to improved flow and lower cost makes it obvious you're not pausing the roadmap, you're clearing the lane for it.

In the end, liability mapping gives you a story that's both credible and actionable. It lets you meet execs where they are, with real numbers and outcomes, instead of hand-waving about invisible debt. The conversation shifts from asking for resources to a mutual understanding: fix the right things, at the right time, and the business moves faster and safer.

## Creating an example map

Picture an e-commerce business, call them "SportingGoods", who specialise in selling sports equipment online. Their payments system is a key part of their business, but over time, layers of shortcuts and old infrastructure have built up, making it increasingly brittle. Engineers regularly voice frustration about the difficulty of shipping changes, and product teams worry about how outages and how this will impact revenue.

| Class         | Example                                                                                                                   | Action                                               |
|---------------|---------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------|
| **Liability** | Payment service is still handling card data using a deprecated PCI flow, immediate upgrade required to avoid fines.       | Patch and migrate to current PCI-compliant flow now. |
| **Drag**      | Deployments to the payment service can only happen during a two-hour maintenance window, causing week-long lead times.    | Invest in zero-downtime deploys and automation.      |
| **Hazard**    | All payment requests are routed through a single, unmonitored queue, one silent failure could block every transaction.    | Add monitoring and redundancy before peak season.    |
| **Relic**     | Codebase still contains endpoints for a retired payment partner (SportPay), unused for nine months, but never cleaned up. | Identify, archive, and safely delete old endpoints.  |
| **Bet**       | Fast-tracked "Buy Now, Pay Later" feature shipped behind a toggle, with no refund logic, review before next quarter.      | Reassess, build missing logic or sunset as needed.   |

A one-page liability map like this turns back-room technical complaints into a crisp, shared plan, making the next actions, and their urgency, obvious to both teams and leadership.

## Keeping the map up to date

Once you've got liability mapping up and running, the next challenge is making sure it stays sharp. Any system like this, left unchecked, starts to drift, labels blur, maps go stale, and before long, people slip back into calling everything "debt". The real work is keeping your categories clear and the map relevant.

- Start by being ruthless about labels. Every item gets a single class, the one that demands the earliest safe fix. If something feels like it straddles drag and hazard, push the team to pick. The discipline is worth it: forcing a decision means you always know what needs doing first, instead of hedging with dual priorities that never get tackled.

- Second, treat every label as perishable. Nothing should linger on your map indefinitely. Set a policy: every entry expires after twelve months unless it's actively reviewed and renewed. This keeps the map a reflection of current risk, not a dusty archive of old fears and half-forgotten tickets.

- Finally, make the map a living artefact. Store it right alongside your architecture decision records, in the same repo your engineers already use. This transparency acts as a vaccine against hand-wavy "debt" arguments and makes the whole process less about finger-pointing and more about building shared understanding.

Keeping the map honest isn't about more process, it's about small, consistent acts of clarity: pick a label, expire old entries, and keep the map where everyone can see it. That's how you ensure the liability map keeps earning its place as a real decision tool, not just another forgotten spreadsheet.
