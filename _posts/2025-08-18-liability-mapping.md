---
title: Liability Mapping your Tech Debt
date: 2025-08-18 08:00:00
description: "Liability mapping splits tech debt into five categories so teams can work out what to fix and when, instead of arguing about the word 'debt'."
tags: [architecture]
sitemap:
   priority: 0.7
   changefreq: 'monthly'
   lastmod: "2026-08-02T08:00:00+00:00"
---

I've [written about how tech debt gets used as a catch-all term](/reconsidering-tech-debt) for a range of unrelated issues. Usually nobody can say how much debt exists or what it costs, so the discussion stays vague and the debt never gets paid down.

I've also covered [engineering toil](/engineering-toil), the quiet repetitive work that slows teams down and chips away at morale without ever appearing in a budget or on a roadmap.

Liability mapping is a way of improving those conversations. It helps teams work out what to fix and when, so you can stop debating what counts as "debt" and focus on what needs attention.

## What is liability mapping?

Liability mapping breaks "tech debt" into five categories, separating minor annoyances from real risks. Each category gets a clear owner and action:

| Category      | Definition                                                                                     | Primary signal                                           | Typical owner action                                       |
|---------------|------------------------------------------------------------------------------------------------|----------------------------------------------------------|------------------------------------------------------------|
| **Liability** | Clear, externally-visible risk that violates contractual, security, or compliance obligations. | CVE backlog, failed audits.                              | **Must-fix** inside cycle time or sprint.                  |
| **Drag**      | Internal friction that slows feature flow but rarely harms customers directly.                 | Build times, flaky tests, manual deploy steps.           | Schedule & track via *flow-metrics budget*.                |
| **Hazard**    | Latent defect with low frequency but high blast-radius.                                        | Single-point-of-failure, critical data coupling.         | Invest in redundancy or feature-flags before feature work. |
| **Relic**     | Dormant code, unused infra, forgotten toggles that clutter cognition.                          | Zero-call endpoints, abandoned feature flags.            | Archive or delete quarterly, measuring LOC shrink.         |
| **Bet**       | Conscious shortcut taken for speed-to-market with a written expiry date.                       | TODO markers with "sunset-by" field, prototype branches. | Review in *risk council* before expiry, then promote or retire. |

Each category represents different pain: customer harm (liability, hazard), team velocity (drag), cognitive load (relic), and calculated risk (bet). Call them all "tech debt" and everything becomes equally urgent or equally ignored.

Once you see which problems fall into which bucket, conversations about what to fix now, what to plan for, and what you can safely ignore become much clearer.

## Creating your first liability map

Start with evidence, not opinions. Pull from security scans, incident reviews, flow metrics, dead-code analysis. You want facts that everyone can see and agree on.

Bring together engineering, product and compliance if you need them. Run a quick workshop where you take each item, debate its category and assign one of the five classes. Don't get stuck on edge cases. Argue once, decide, and move on. You're classifying what something is, not how it got there.

After labelling, add rough triage scores. Does this hurt customers now? Could it explode later? How much does it slow us down? Do we understand it well enough to be sure? You're gauging immediacy, blast radius and how confident you are.

Now, with everything tagged and scored, it's time to make the map.

![Graph showing a liability map in grid form](/assets/images/liability-mapping-grid.png)

I like to plot items on a 3x3 grid of immediate impact against long-term risk, colour-coded by class. Certain problems stand out straight away: the drag that's really a ticking time bomb, the relics that turn out to be harmless, the liabilities hiding in plain sight. Everyone gets a shared picture of what needs attention now and what can stay in the backlog.

Then connect the map to how you budget. Anything labelled a liability or a hazard belongs in the run-cost or operational budget, because those are the items that bring fines, churn or outages if you leave them. Drags, relics and bets go into your change-cost or innovation work streams.

That translation is what gets you buy-in from finance or leadership, because it connects technical pain to money.

The map is a living document rather than a one-off exercise. Your first attempt will be rough, and that's fine. Over time you'll get better at spotting liabilities early and pruning relics before they pile up.

## Getting exec buy-in

Executives care about risk, money and time, not refactoring in the abstract. They want to know why they should fund work that isn't features or revenue, so connect every liability to a disaster avoided, faster delivery or lower cost.

When someone asks why you need to refactor now, point at the liability-class items and show the legal exposure. Patching the roof costs less than fixing the flood damage. You're protecting the business rather than tidying up code.

When someone calls it a nice-to-have, show the data. Cutting drag got features shipping 30% faster and brought the cost per change down. Clean-up that raises throughput makes money.

And when someone says you can't pause the roadmap, the map shows why 15% of capacity on clean-up compounds. You get less firefighting, more predictable launches and falling run-costs. You're clearing the path rather than stopping.

Liability mapping gives you a story you can act on. You meet execs with real numbers instead of hand-waving about invisible debt, and the conversation moves from begging for resources to agreeing what to fix and when.

## Creating an example map

Consider SportingGoods, an e-commerce company. Their payment system is critical to the business and has accumulated shortcuts and legacy infrastructure. Engineers struggle to ship changes to it, and product worries about outages hitting revenue.

| Class         | Example                                                                                                                   | Action                                               |
|---------------|---------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------|
| **Liability** | Payment service is still handling card data using a deprecated PCI flow, immediate upgrade required to avoid fines.       | Patch and migrate to current PCI-compliant flow now. |
| **Drag**      | Deployments to the payment service can only happen during a two-hour maintenance window, causing week-long lead times.    | Invest in zero-downtime deploys and automation.      |
| **Hazard**    | All payment requests are routed through a single, unmonitored queue, one silent failure could block every transaction.    | Add monitoring and redundancy before peak season.    |
| **Relic**     | Codebase still contains endpoints for a retired payment partner (SportPay), unused for nine months, but never cleaned up. | Identify, archive, and safely delete old endpoints.  |
| **Bet**       | Fast-tracked "Buy Now, Pay Later" feature shipped behind a toggle, with no refund logic, review before next quarter.      | Reassess, build missing logic or sunset as needed.   |

This one-page map turns technical complaints into a shared plan. What to do next and how urgent it is becomes obvious.

## Keeping the map up to date

Once liability mapping is running, the challenge is keeping it current. Left alone, any system like this drifts. Labels blur, the map goes stale, and before long people are calling everything "debt" again.

Be ruthless with the labels. One item gets one class, whichever needs fixing first. If something sits between drag and hazard, pick one. Hedging with dual priorities defeats the point.

Make labels expire. Set a twelve-month limit so entries disappear unless someone actively renews them. That keeps the map current rather than turning it into an archive of old worries.

Store the map with your architecture decision records, in the repo engineers open every day. Keeping it visible is what stops the debt argument becoming a matter of opinion.

None of that needs more process. It needs small, consistent acts of clarity: pick a label, expire the old entries, and keep the map where everyone can see it.
