---
title: Working with Product Managers
date: 2026-02-03 08:00:00
tags: [tech-lead, leadership, product]
description: "The tech lead and PM relationship can be the most productive partnership in a team or a source of constant friction. Here's how to make it work."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2026-02-03T08:00:00+00:00"
---

> This post is part of my [Tech Lead Series](/tags/tech-lead), a collection of practical advice for engineers stepping into leadership roles.

Early in my career, I worked with a PM who would appear on Monday mornings with a fully formed spec, hand it to the team, and disappear until the demo. The specs were detailed, complete with wireframes and acceptance criteria. They were also frequently wrong. By the time we'd built what was specified, the requirements had changed, or we'd discovered technical constraints that made the approach unworkable.

Years later, I worked with a PM who did the opposite. She'd share half-formed ideas before they were ready, ask for technical input on problems we didn't understand yet, and change direction based on our feedback. It felt chaotic. It was also the most productive team I've ever been on.

The difference wasn't the PMs. It was the relationship.

## The Partnership Model

In healthy teams, the tech lead and PM operate as partners, not as spec-writer and spec-implementer. Both own the outcome. Both contribute to the solution. The boundaries are fuzzy by design.

The PM brings customer understanding, market context, and business priorities. The tech lead brings technical constraints, implementation options, and system knowledge. Neither has the full picture alone.

This sounds obvious, but it's not how many teams actually work. The default mode is handoff: PM decides what, engineering decides how. This creates problems that compound over time.

When you're not involved in the "what", you build solutions to the wrong problems. When the PM isn't involved in the "how", they specify things that are expensive or impossible. The handoff model optimises for clean boundaries at the cost of good outcomes.

## What Good Looks Like

### Early involvement

You're in the conversation when problems are being defined, not just when solutions are being specified. You hear about customer feedback before it becomes a Jira ticket.

### Mutual influence

The PM changes their approach based on your technical input. You change your approach based on their customer insight. Neither person's opinion automatically wins.

### Shared ownership

When something ships and doesn't work, you both own the failure. When something succeeds, you both take credit. The "that's not my job" reflex is gone.

### Productive disagreement

You argue about the right approach, sometimes heatedly. But you argue in service of the outcome, not to win. And you reach decisions both can commit to.

### Trust in absence

When the PM makes a call without you, you trust it was reasonable. When you make a technical decision that affects the product, they trust you thought about the user impact.

## Building the Relationship

This partnership doesn't happen by itself. You have to build it.

### Schedule regular time together

A weekly sync, just the two of you. Not to review tickets, but to discuss what's coming, what's unclear, what's worrying each of you. This prevents surprises and builds understanding.

### Learn their world

Sit in customer calls. Read the support tickets. Understand what success looks like from their view. The more you understand their context, the better your technical decisions will be. This is what separates [product engineers](/product-engineers) from those who just build to spec.

### Share your constraints

Don't let technical debt, system limits, or team capacity be invisible. If something is expensive or risky, say so early. Give them the information they need to make good trade-offs.

### Ask why, not just what

When a feature request arrives, understand the problem it's solving. Often there's a simpler solution once you understand the actual need. Sometimes the problem isn't worth solving at all.

### Offer alternatives

If you can't do what they're asking, don't just say no. Come back with options. "We can't do X, but we could do Y which addresses most of the same need in half the time."

## When to Push Back

Part of the tech lead's job is saying no. Not to block things, but to be helpful. Some situations that call for pushback:

### When the complexity isn't worth the value

A feature that takes three months to build but helps 2% of users might not be the right investment. You have visibility into the cost that the PM might not have.

### When there's a better solution

If you can solve the same problem more simply, make the case. PMs aren't married to their specs; they're married to solving customer problems.

### When quality will suffer

Rushing to hit a deadline by cutting corners creates debt that slows future work. Sometimes the right answer is to adjust scope or timeline rather than sacrifice quality.

### When the team is overloaded

You see the strain on your team more clearly than anyone. If people are burning out or cutting corners because there's too much to do, push for sustainable pace.

The key is how you push back. "No" is rarely useful. "Here's what I'm seeing and here are some options" starts a conversation.

## Common Failure Modes

### The adversarial relationship

Tech lead and PM view each other as obstacles. Engineering thinks product doesn't understand technical constraints. Product thinks engineering always overcomplicates things. Both are probably right, and both are making it worse.

### The absent PM

The PM is spread across too many teams, so they drop off specs and disappear. Engineering makes product decisions they shouldn't be making alone, and the PM is surprised by what gets built.

### The spec-following tech lead

The tech lead treats specs as requirements to build rather than problems to solve. They don't push back, don't offer alternatives, don't engage with the product thinking.

### The scope-creeping conversation

Every discussion about how to build becomes a negotiation about adding features. What started as a simple improvement becomes a three-month project because neither person knows how to say "not now."

## The Underlying Principle

The best tech lead-PM relationships share one thing: both people are trying to solve the same problem rather than protect their territory.

When the PM sees engineering as a partner in solving customer problems, they share context generously and welcome technical input. When the tech lead sees product as a partner in building good software, they engage with customer needs rather than just technical specifications.

This requires trust, which requires time. You won't have this relationship on day one. But you can start building it by showing up as a partner rather than an implementer, by engaging with the product thinking rather than just the tickets, by treating the PM's success as your own.
