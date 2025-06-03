---
title: Composable First, Reusable Forever
date: 2025-06-17 08:00:00
tags: [management, systems-thinking]
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: 2025-06-17 T19:00:00+01:00
---

think about composability to think about reusability

---
Thesis: Reusability isn't something you build directly; it's the dividend you collect when you deliberately optimise
your systems — code, teams, and process — for composability.

Open with the paradox – many teams chase "reusable code" yet end up with rigid frameworks; argue that genuine
reusability is an emergent property that springs from designing for composability first.

Define the two terms crisply – show how composability (ability to combine small, orthogonal pieces) naturally breeds
reusability (ease of applying pieces in new contexts). Use LEGO vs. pre-glued model kit as an analogy.

Historical detour – trace composability from UNIX pipes → object composition → functional programming (higher-order
functions) → micro-services and cloud functions. Each epoch reveals the same pattern: small contracts, clear interfaces.

The mathematics behind it – briefly introduce category theory's "composition" and "morphisms" to give intellectual heft
without scaring novices.

Design heuristics – SOLID's Single Responsibility and Interface Segregation as composability levers; show how "do one
thing well" leads to easier remixing.

Case study carousel –

React components vs. monolithic jQuery widgets

Terraform modules vs. mega cloud templates

Data-engineering DAGs vs. one-off ETL scripts
Summarise time saved when pieces snap together.

Pitfalls & misconceptions – premature abstraction, YAGNI violations, and the "god helper" utility library that nobody
dares touch. Offer litmus tests to decide when to extract a component.

Tooling spotlight – discuss how package managers, semantic versioning, and contract tests (Pact, consumer-driven
contracts) enforce composability boundaries, safeguarding later reuse.

Measuring success – introduce metrics: change-coupling charts, reuse rate, and cognitive load surveys. Provide a simple
Retrospective checklist for teams.

Call to action – challenge readers to refactor one gnarly module into three composable ones this sprint, track ripple
effects, then blog their outcomes.

---

Lead with the business case – frame composability as a strategic multiplier: faster time-to-market, lower total cost of
ownership, and easier alignment with shifting product strategy. Highlight the financial drag of "not-quite-reusable"
monoliths across multiple teams.

Define terms in leadership language –
Composability: an architectural property enabling independently owned components to combine into novel solutions with
minimal orchestration overhead.
Reusability: the observable result—components finding second and third lives across programmes without bespoke
adaptation.
Emphasise that reusability emerges; it cannot be decreed.

Historical proof points – show how companies that championed composability (e.g., Amazon's service-oriented mandate,
Spotify's "Backstage" platform) unlocked organisational agility. Counter-example: costly "shared" frameworks that
stagnated because they were never composable first.

Strategic principles –

Invest in clear contracts (API first, schema versioning).

Prefer composition over inheritance (both in code and in team responsibilities).

Enforce ownership boundaries (teams publish, not police).

Backlog explicitly for decoupling—make it a tracked OKR, not an ad-hoc refactor.

Operating-model shifts – discuss platform engineering as the steward of composable building blocks, while product squads
remain free to assemble. Outline funding models: charge-back vs. central budget, and why the latter accelerates early
adoption.

Metrics that matter to leadership –

Cycle time reduction for new features assembled from existing components.

Change-coupling heat-maps trending down across repos.

Cross-team dependency latency (request-to-merge days).

Reuse ratio per component (downloads vs. contributors).

Cultural levers – cultivate a "buy before build" mindset; celebrate internal open-source merges in town-halls; rotate
engineers through platform teams to seed empathy.

Governance without friction – lightweight Architectural Decision Records (ADRs), automated contract testing in CI, and
sunset policies for obsolete components to prevent "zombie" reuse.

Common leadership antipatterns –

Declaring a "reusable core" without budget for ongoing stewardship.

Incentivising velocity metrics that punish teams for upstream contributions.

Allowing platform backlogs to be ticket-swamped without a product manager.

Executive call to action – set a quarterly objective: "Increase composable component adoption by 30% while reducing
average integration time by 20%." Offer a playbook: audit → prioritise → staff → measure → amplify successes in exec
reviews.

Suggested narrative arc
CEO-friendly opening anecdote (missed market window due to rigid code)

Data-driven exposition of composability economics

Playbook and tooling guide for leaders

Real-world mini-case study (internal or anonymised)

Actionable takeaway and next-quarter checklist

---

Three levers for maximising composability
Surface Area First – Publish the contract early, even if the internals are a stub. Stripe's "API-first,
implementation-second" habit is the single most effective forcing function I've encountered.
First Round Review

Decouple the People – Assign change control to the team that carries the pager, but let usage belong to everyone. This
mirrors Amazon's "you build it, you run it" memoisation of ownership boundaries.

Version Aggressively – Semantic versioning is a release strategy and a social contract. Move fast, break your major
version, not downstream users.

---

I still remember the afternoon the Payments team at a previous company asked whether we could "just reuse" their monolithic billing system for the new subscriptions product. The code had indeed processed millions of transactions, but every squad that touched it walked away with its own bespoke fork, propped up by a mess of "just-for-us" flags. Reuse had morphed into copy-and-paste debt before the quarter was out.

Watching that facade crack sent me back to Jeff Bezos’s 2002 API Mandate—the memo in which he didn't politely ask teams to share code; he required them to expose contracts, warning of career limiting repercussions for anyone who crossed the boundary. By optimising Amazon for composition—services interacting only through stable APIs, he let genuine reuse emerge as a happy side effect.

## Composition Is a Cause; Reuse Is an Effect

Reuse behaves like compound interest: you can't demand it on day one, but if you invest in composability the dividends accrue. Three ingredients show up in every system that compounds this way:

1. **Stable contracts** — the surface outlives the implementation.
2. **Independent ownership** — the team that changes a component also carries its pager.
3. **Observable adoption** — you measure who consumes what so you can decide where to invest next.

When any element goes missing, you get the payments-library horror show: code built once, copied forever, and maintained by no-one.

## Enter Event-Driven Architecture

If APIs define *what* can be composed, Event-Driven Architecture (EDA) defines *how fast* compositions form. An immutable stream like **OrderCreated** turns into connective tissue: publish once, and a dozen teams can subscribe without a calendar invite. EDA lets new capabilities assemble at the speed of configuration, not negotiation, and that's the purest real-world expression of composability I've seen.

## Funding the Backbone

Composability rarely dies in code; it dies in budgets. Brokers need SLOs, schema registries need upgrades, and somebody has to run the dashboards that prove adoption. At one company we resisted a platform charter for months. After four production incidents originated from DIY Kafka clusters, the finance team asked why we hadn't centralised the spend. The moment a single team owned the backbone, incident counts halved and integration time fell from five days to two.

Funding also buys **discoverability**. A Backstage plug-in that lists canonical events, shows sample payloads, and tracks live subscribers pays for itself the first time a product manager says, "Wait—​we already emit *UserVerified*? Ship the loyalty perk today."

## The Metrics That Matter

Reusable systems feel great, but feelings don't survive budget season. I use three numbers:

* **Median integration time** for a new consumer on an existing event.
* **Consumers per canonical event**, trended quarterly.
* **Change-coupling** between repos—​if two services change together more than 20 % of the time, they're not truly independent.

The first metric captures friction, the second demonstrates leverage, the third catches hidden entanglements that will stall the flywheel.

## Anti-Patterns on the Road to Reuse

* **Event Soup** - a thousand topics, zero owners, paging through EventBridge to guess which one matters. Governance is boring until you ship PII into the void.
* **Synchronous Backdoors** — an event fires, then a consumer calls the producer for state because the payload was empty. Now you have two systems and neither scale.
* **Platform as Ticket Queue** — if the shared-infra team becomes an intake form, you've created a dependency, not a platform. Guard their roadmap or lose the flywheel.

## Closing the Loop

When the subscriptions product finally launched, we reused exactly zero lines of the old payments library. Instead, we subscribed to **PaymentSettled**, emitted **SubscriptionActivated**, and let downstream teams wire themselves up. Six months later, a finance audit revealed the happiest accident: customer lifetime value rose, mainly because Marketing had built three new campaigns *we didn't even know about*. That's the quiet magic of composability, you invest once, and reuse keeps happening for you.

Reuse is strategic; composability is tactical. Lead with the tactic, measure the strategy, and the next time someone asks "just reuse" a monolith, you'll offer them an event instead.
