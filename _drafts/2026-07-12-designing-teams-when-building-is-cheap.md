---
title: "Designing Teams When Building Is Cheap"
date: 2026-07-12 08:00:00
tags: [teams, ai, leadership]
description: "Building got cheap, so stop designing teams to build more. Design for judgement and flow to production, then protect the pipeline that makes the experts the whole model depends on."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-07-12T08:00:00+01:00"
---

For most of my career, the constraint on a software team was how much it could build. You hired against that constraint. You added a frontend engineer because there was more frontend work than one person could handle, a data engineer because the pipelines needed owning, a mobile engineer because the app had become a platform of its own. The org chart was a map of where the work piled up.

That assumption is quietly breaking. When an engineer with good tools can stand up a working feature in an afternoon that used to take a sprint, capacity stops being the thing in short supply. Andrew Ng framed it well recently: the bottleneck moves from execution to decisions. If building is close to free, the questions that remain are what's actually worth building, and how quickly a decision turns into safely-merged code in front of a customer.

Neither of those is a capacity problem, and that changes how you should design a team.

## Capacity was the wrong thing to optimise

Consider the standard shape: a squad of six to eight, each person owning a lane. Product, frontend, backend, data, ML, DevOps, security. It's a sensible design when execution is the constraint because it maximises how much work can be in flight at once.

But it optimises the one thing that just got cheap, and it taxes the two things that are now scarce.

It taxes judgement. When eight people each own a slice, nobody is squarely accountable for the question that matters most now: should we build this at all? Prioritisation gets diffused across the group, and a group is very good at finding reasons to keep everyone busy. You end up with well-engineered features that should never have been started.

It taxes flow to production. Every handoff between lanes is a queue, a context transfer, and a place for work to sit "done" without being shipped. More people means more seams, and more seams mean more distance between a decision and a customer seeing it.

So the specialist squad is efficient at building and inefficient at the two things that decide whether the building was worth it.

## The shape that follows

If judgement and flow are the scarce resources, you design for them directly. That points at a smaller team of broader people: two or three expert generalists, with agents filling in the depth they lack in any single lane.

The word doing the work there is *expert*: someone with genuine depth in one or two areas, and enough range (now amplified by tooling) to carry a piece of work from decision to production without three handoffs. The depth is what makes the range safe to have. They hold the "should we?" question because they can see the whole thing. They ship faster because there are fewer seams to cross.

This is the more honest version of the "do more with fewer people" story. The gain comes from removing coordination cost and concentrating judgement in people who can actually use it.

## The catch, and it's the real job

Here's where I want to be careful, because everything above is the flattering half.

The expert generalist is the load-bearing part of this whole design, and the same forces making them powerful are making them rarer. Juniors leaning on these tools tend to ship more and understand less. The cost of reviewing output is rising while the cost of writing it falls. If someone spends years producing code they can't fully explain, and is never required to, they never build the judgement this whole model runs on. They just get faster at shipping things nobody on the team fully understands.

That's a [local optimisation](/local-optimisation) trap, and it's a shape I keep coming back to. Every team, acting rationally, leans on its seniors and its tooling to ship faster today. Collectively, we stop running the apprenticeship that produced those seniors in the first place. The design works beautifully in the short run and slowly eats its own supply.

So the advice runs almost opposite to the last decade. The move now is to [build less](/less-is-more), put the judgement in fewer and broader hands, and shorten the path to production. Then spend the capacity you've just freed on the one thing no tool will do for you: growing the next set of experts. That means deliberately giving people room to struggle with problems the tools could have solved for them in seconds, which no velocity metric will ever thank you for. If that part stops, the whole design stops with it.
