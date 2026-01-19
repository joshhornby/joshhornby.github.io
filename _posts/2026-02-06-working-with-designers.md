---
title: Working with Designers
date: 2026-02-06 08:00:00
tags: [tech-lead, leadership]
description: "The tech lead and designer relationship has unique friction points. When to push back on designs, how to collaborate early, and handling the 'pixel perfect' conversation."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2026-02-06T08:00:00+00:00"
---

> This post is part of my [Tech Lead Series](/tags/tech-lead), a collection of practical advice for engineers stepping into leadership roles.

A designer once handed me a Figma file with a custom animation for a loading spinner. It was beautiful. It was also going to take a week to implement, on a feature that needed to ship in three days. When I asked if we could use a simpler animation, she was visibly frustrated. "Why do I bother making designs if engineering just ignores them?"

She wasn't wrong to be frustrated. I wasn't wrong about the constraints. We were both failing at the same thing: collaborating early enough that this conversation never needed to happen.

## The Core Tension

Engineering and design optimise for different things. Design optimises for user experience: how it looks, how it feels, whether it delights. Engineering optimises for what we can build: can we do this reliably, keep it working, within our constraints?

Both matter. Neither is more important. But they pull in different directions.

This tension isn't a problem to solve. It's a dynamic to manage. The best products come from holding both perspectives in balance. That requires a relationship where you can have honest conversations about trade-offs without it feeling like a battle.

## The Product Trio

Marty Cagan popularised the idea of the Product Trio: product manager, designer, and tech lead working together as equal partners. Each owns a different dimension of the problem.

The PM owns what problem to solve and why it matters. The designer owns how the solution works for the user. The tech lead owns how it gets built. All three perspectives are needed to build something valuable, usable, and possible.

The key insight is shared ownership rather than hand-offs. Strong teams make decisions together while exploring the problem, not one after another during the build. When one role dominates, teams build the wrong thing, build the right thing poorly, or fail to ship at all.

I covered [working with product managers](/working-with-product-managers) earlier in this series. The same principles apply here: early involvement, shaping each other's work, productive disagreement. The trio works when all three roles respect what the others bring.

## Collaborate Early

The spinner story happened because I wasn't involved until the design was finished. By then, the designer had invested time and creative energy. Asking for changes felt like rejection.

Early involvement prevents this. When you're in the conversation from the start, constraints are shared information, not late surprises. The design evolves with what's possible in mind.

What early involvement looks like:

### Join the problem definition

Before wireframes exist, there's a problem being explored. Be in that conversation. Your technical knowledge shapes what solutions are even possible.

### Share constraints upfront

If the team is using a design system with limited components, say so. If there's a performance budget that rules out certain approaches, mention it. Let the designer work with real constraints rather than discovering them later.

### Review rough ideas, not polished designs

Looking at early sketches is more useful than seeing final mockups. Changes are easier and feel less personal when the design is still rough.

### Pair on complex interactions

For anything involving animation, state transitions, or complex data, sit together and work through it. The designer understands what they want to achieve; you understand what's achievable. Meet in the middle.

## Having the Pushback Conversation

Sometimes you need to say no, or at least "not like this." These conversations go badly when they feel like engineering vetoing design. They go well when they feel like problem-solving together.

### Start with understanding

Before explaining why something is hard, understand why it was designed that way. "Help me understand what this animation is trying to achieve" opens a conversation. "We can't do this animation" closes it.

### Explain the cost, not just the answer

"This will take two weeks" is more useful than "we can't do this." It lets the designer weigh the trade-off themselves. Sometimes they'll decide it's worth it. Sometimes they'll find another way.

### Offer alternatives

Don't just spot problems; bring solutions. "We can't do this custom animation, but here's what we can do with our existing library" gives the designer something to work with.

### Pick your battles

Not every gap from the spec matters equally. A button that's slightly smaller than the mockup probably isn't worth fighting about. An interaction that breaks accessibility is. Focus your pushback on things that actually matter.

### Never say "just" when it isn't

Dismissing design decisions as unimportant ("it's just a colour") damages trust. If you're pushing back, do it respectfully. If you don't understand why something matters, ask.

## The Pixel Perfect Debate

Every tech lead eventually has the "pixel perfect" conversation. The designer wants the implementation to match their mockup exactly. Engineering is shipping something close enough. Both sides get frustrated.

Here's the reality: perfect implementation of every design detail is expensive. Engineering time spent matching mockups exactly is time not spent on other features. But designs exist for a reason. Visual consistency matters. User experience details matter.

The answer isn't all-or-nothing. It's deciding together what matters.

Some things should be pixel perfect:
- Spacing and alignment in core UI components
- Brand colours and typography
- Key user-facing screens like onboarding or checkout

Some things don't need to be:
- Internal tools or admin screens
- Early iterations that will change based on feedback
- Features with low usage or visibility

Have the conversation explicitly. "For this feature, what's the priority: speed or polish?" Get agreement before work starts, not after it ships.

## Building the Relationship

Like all relationships, this one requires upkeep.

### Learn their tools

You don't need to master Figma, but understanding how design files work helps. You can export assets correctly, read specs, and ask good questions.

### Share your tools

Help designers understand how the codebase works, what reusable components exist, what's easy versus hard. This knowledge makes their designs easier to build.

### Give them access

Let designers see the staging environment, use the product, experience what users experience. Bugs and gaps are easier to discuss when everyone can see them.

### Celebrate their work

When a design makes the product better, say so. Designers often only hear from engineering when there's a problem. Positive feedback builds the relationship.

### Include them in retrospectives

If a feature shipped with design compromises, talk about why together. What could you do differently next time to avoid late-stage pushback?

## The Goal

The goal isn't engineering and design agreeing on everything. It's both sides understanding each other well enough to have productive disagreements. To argue about the right approach because you're both trying to build something great, not because you're protecting your territory.

This takes time. It requires you to see design as a partner in building good products, not a department that hands you requirements. When the relationship is right, you'll find that the frustrating conversations become interesting problems to solve together.
