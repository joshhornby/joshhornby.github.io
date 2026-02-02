---
title: Scope Creep and How to Fight It
date: 2026-02-17 08:00:00
tags: [tech-lead, leadership, project-management]
description: "Scope creep kills projects slowly. One small addition at a time, until the original timeline is impossible. Here's how to recognise it early and have the conversation."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2026-02-17T08:00:00+00:00"
---

> This post is part of my [Tech Lead Series](/tags/tech-lead), a collection of practical advice for engineers stepping into leadership roles.

Scope creep doesn't announce itself. It arrives as reasonable requests. Each addition seems small. Each conversation is "while we're building this anyway." Nobody makes a bad decision. You just make a lot of small decisions that add up to a bad outcome.

## Recognising the Pattern

"While you're in there..." The logic seems sound. You're already working on the payment system, so why not also add refund handling? Because refund handling is a week of work you didn't plan for.

"This would only take a few hours." People who don't build software underestimate how long things take. A few hours becomes a few days. And even if it really is a few hours, a dozen "few hours" changes add up to weeks.

"The customer really needs this." Urgent requests from customers feel impossible to refuse. But customers will always want more. The question is whether this specific addition is worth delaying everything else.

"We forgot to include..." Discovered requirements feel like corrections to an incomplete plan, not additions. But they're still additions. The plan was complete for what it covered; this is new scope.

"Just a small tweak." Small is relative. Small compared to the original feature can still be real work. And small things ship with testing, documentation, edge cases.

The common thread: each individual addition seems fair. The problem is the pile-up.

## Why It Happens

Scope creep has a few common causes.

When the initial scope isn't well-defined, people fill in the gaps with guesses. Those guesses get turned into requirements as work moves forward.

Different stakeholders have different expectations. Without clear agreement on what's in and what's out, each stakeholder adds their own version.

PMs want to please stakeholders. Tech leads want to please PMs. Engineers want to solve problems. Everyone's drive is to say yes. Nobody's drive is to protect the timeline. Learning [when to say no](/when-to-say-no) is one of the most important skills for a tech lead.

"We've already built most of it, we might as well add this too." The logic feels right but ignores that adding more makes it even later.

When the goal is vague ("make a good dashboard"), scope expands to fill available time. When the goal is specific ("show four metrics, ship in two weeks"), additions are clearly out of scope.

## Fighting It Early

The best time to fight scope creep is before work starts.

Define scope explicitly. Write down what's included and what's not. "The dashboard will show revenue, users, conversion, and churn. It will not include filtering, export, or alerts." The explicit exclusions matter as much as the inclusions.

Get sign-off on boundaries. Make sure everyone with influence agrees on the scope before work begins. When additions arise, you can point back to the agreement.

Size the work with buffers. Things take longer than estimated. If you estimate two weeks and commit to two weeks, any addition blows the timeline. Build in slack so small adjustments don't become crises. [Good estimation](/estimation-pragmatism) isn't about perfect numbers; it's about reducing surprise.

Separate must-have from nice-to-have. Prioritise hard upfront. When pressure mounts, you know what can be cut.

## Having the Conversation

Once creep starts, you need to address it directly. Hoping it stops on its own doesn't work.

Name what's happening. "I've noticed we've added six features since we started. Our two-week timeline is now impossible." Make the pile-up visible.

Quantify the impact. "Each of these additions adds roughly two days. We're now looking at five weeks instead of two." Numbers make the problem concrete.

Present the trade-offs. "We can add this feature, but it means either pushing the deadline or cutting something else. Which would you prefer?" Force a decision rather than absorbing the cost silently.

If the team committed to a deadline, additions should require clear trade-offs. Don't let creep quietly extend timelines. Make it a choice.

When scope changes, record what changed and why. This creates accountability and helps prevent further creep.

## Structural Approaches

Beyond conversations, some structural approaches help.

Timebox hard. "We have two weeks. What can we build in two weeks?" Start from the constraint and work backward. This frames additions as taking away from something else.

Keep a backlog of good ideas that aren't in scope for this release. People feel heard without adding to current work. Review the list for the next iteration.

Smaller releases mean less chance for creep. A two-week feature ships before scope can expand much. A six-month project piles up changes for six months.

Some teams require formal change requests for scope additions. The process itself discourages casual additions.

Burn-down charts, task boards, regular demos. When everyone can see how much work remains, it's harder to pretend additions are free. [Hill charts](/hill-charts) are useful here because they show uncertainty, not just completion.

## When to Accept Changes

Not all scope additions are creep. Sometimes requirements genuinely change. Sometimes you learn something that makes the original plan wrong.

Changes driven by new information are legitimate: user research reveals the original approach won't work, a dependency changes, business conditions shift, or you discover a technical constraint that forces redesign.

The difference is whether the change is driven by new information or by wishful thinking. "We learned customers don't use this feature that way" is new information. "The VP would also like it to do this" is wishful thinking.

Accept legitimate changes. Push back on scope creep. The skill is knowing which is which.

## The Uncomfortable Truth

You cannot eliminate scope creep entirely. Some additions will get through. Some projects will expand beyond their original bounds. This is normal.

What you can do is make creep visible, make trade-offs explicit, and protect the team's ability to deliver. Every time you let an addition slip in without discussion, you teach stakeholders that additions are free. Every time you name the creep and force a decision, you build a culture that respects constraints.
