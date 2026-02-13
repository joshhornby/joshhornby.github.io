---
title: Making Technical Decisions Stick
date: 2026-02-20 08:00:00
tags: [tech-lead, leadership]
description: "Technical decisions get revisited, ignored, or forgotten unless you make them stick. ADRs, RFCs, or just conversations? Match the documentation to the decision's weight."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2026-02-20T08:00:00+00:00"
---

> This post is part of my [Tech Lead Series](/tags/tech-lead), a collection of practical advice for engineers stepping into leadership roles.

Decisions that aren't documented don't exist. They live in the memories of people who were in the room, until those people leave or forget. A decision made in a Slack thread that scrolled past last month might as well never have happened.

Making technical decisions is one part of the job. Making them stick is another.

## Why Decisions Don't Stick

Even good decisions fade without reinforcement.

They're not written down. Verbal agreements in meetings evaporate. Six months later, nobody remembers what was decided or why.

They're written but not findable. The decision exists in a Confluence page nobody visits, a Slack message nobody searches for, a Google Doc with no clear owner.

The context isn't captured. Even when the decision is documented, the reasoning isn't. A year later, someone asks "why do we do it this way?" and nobody can answer.

People weren't involved. Decisions made by a small group don't feel binding to people who weren't asked. They'll revisit the decision because, from their view, it was never really made.

There's no follow-up. A decision without follow-through is just a suggestion. If nobody checks whether the decision is being followed, it won't be.

## Match documentation to the decision's weight

Not every decision needs the same treatment.

Verbal agreement works for small, reversible decisions that affect only your team. "Let's use this library for parsing." These can live in team memory, but expect to explain them again.

Written summary works for decisions that affect multiple people or span time. A Slack message that captures what was decided and why. A brief note in your team's docs. Easy to write, easy to find later.

Architecture Decision Records (ADRs) work for decisions that limit future work. An ADR is a short document that captures the context, the decision, the options you rejected, and the results. It becomes part of your project's permanent record.

Request for Comments (RFCs) work for decisions that need input from many people or have high stakes. An RFC is a proposal that invites feedback before the decision is final. It documents both the decision and the discussion that led to it.

Most decisions need only verbal agreement or written summary. Save ADRs and RFCs for decisions that matter: technology choices, architectural patterns, interfaces between systems.

## ADRs work because they're simple

A good ADR has six sections and fits on one page:

```markdown
# ADR-001: Use PostgreSQL for user service data

## Status
Accepted

## Context
We need a database for the new user service. The team has
experience with PostgreSQL and MongoDB. We expect relational
queries across user profiles, permissions, and audit logs.

## Decision
Use PostgreSQL for the user service.

## Results
Relational queries are straightforward. We lose MongoDB's
flexible schema, which means migrations for schema changes.

## Options rejected
- **MongoDB**: Better schema flexibility, but our query
  patterns are relational and the team knows PostgreSQL better.
- **MySQL**: Similar fit, but less team experience and weaker
  JSON support.
```

Keep it short. If writing an ADR feels like a chore, it's too long.

## RFCs fail when they're theatre

RFCs work when they're real invitations for input, not rubber stamps.

Share early. An RFC shared before you've made up your mind gets real feedback. An RFC shared when you've already decided just annoys people.

Set clear timelines. "Comments by Friday" creates urgency. Open-ended feedback periods drag on forever.

Ask for feedback directly. Don't just post and wait. Ask specific people for input. Reach out to experts, to people affected, to the usual critics.

Respond to feedback. Every comment deserves a response, even if it's "thanks, but we're going in a different direction for these reasons." Ignored feedback teaches people not to bother.

Make the decision. An RFC that never ends is worse than no RFC. Set a deadline, weigh the feedback, make a call, and write it down.

## Involvement determines whether decisions stick

The decision-making process matters as much as the decision itself.

Involve the right people. Not everyone, but not no one. People affected by a decision should have a chance to weigh in. Decisions made without asking get reopened.

Be explicit about the process. Are we deciding today? Taking input for a week then deciding? Who makes the final call? Vagueness about the process creates vagueness about the outcome.

Disagree and commit. Once a decision is made, everyone should support it, even those who disagreed. If you can't get to agreement, be clear that you're making a call despite disagreement and expect people to follow through.

Don't revisit without new information. Every decision can be debated forever. Establish that decisions stay made unless new facts arise. "We already decided this" should end conversations, not start them.

## Decisions need visible attention, not rules

Follow-through doesn't mean a heavy process. It means someone is paying attention.

Check in code reviews. When you see code that goes against a decision, ask about it. Sometimes there's a good reason; sometimes someone didn't know. Either way, it's a conversation.

Point to decisions in discussions. When someone proposes something that clashes with a prior decision, point to the docs. "We decided X for these reasons. Has something changed?"

Update decisions when needed. Things change. If a decision no longer makes sense, update it explicitly. Don't let it fade away; mark it replaced and write down why.

Model it yourself. Your own code should follow the decisions. If you ignore the standards, so will everyone else.

## Keep decisions close to the code

ADRs belong in a `/docs/adr` folder in the repo. Decisions about this system live with this system. They're versioned, searchable, and visible in pull requests.

Use a consistent numbering system. ADR-001, ADR-002. Numbers make decisions easy to reference. "This implements ADR-015" in a commit message links decisions to outcomes.

Review active ADRs once a quarter. Are they still relevant? Are they being followed? Are any ready to be replaced?

If your team has never used ADRs, don't mandate them for everything. Write one ADR for one decision and see if it helps. Build the habit bit by bit.

## Shared understanding, not bureaucracy

Technical decisions shape how your systems evolve. When they're undocumented, they get forgotten. When they're made in isolation, they get ignored. When nobody follows up, they become suggestions.

The goal isn't a process for its own sake. It's building a shared record of how things work and why. New team members can understand the system's history. Future decisions build on past ones. And the PostgreSQL you decided on three months ago is still what gets used.
