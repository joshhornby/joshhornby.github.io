---
title: "Why Less Is More"
date: 2025-09-17 08:00:00
tags: [architecture, software-engineering]
description: "The teams that create the most value aren't the ones with the best tech. They're the ones with the clearest constraints."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

Something I've been thinking about recently is that choosing what *not* to do matters as much as choosing what you will.

I saw this up close at [cinch](/stuff-learned-at-cinch). The engineering principles were clear. Build on AWS serverless, lean on managed services, and stay away from custom platforms unless there's a real need. The payoff showed up in focus more than in uptime or cost. With the heavy lifting handled, most of our effort went into products and customers rather than infrastructure. That was the result of a handful of decisions made early and then stuck to deliberately.

Compare that to teams where the choices pile up quietly. A script here, a homegrown service there, a pet framework someone loved five years ago _(I've been guilty of being this person)_. Each addition feels small at the time. The lesson, usually learned the hard way, is that every extra moving part is a tax you pay forever. Patching, scaling, wrangling flaky tests, untangling broken pipelines. None of it makes the roadmap, and together it takes weeks out of every engineer's year.

## Make choices explicit

It's easy to assume productivity comes down to process tweaks or how many engineers you can hire. In practice your pace is set by how much you have to keep alive. Every service and script brings its own gravity: docs, alerts, habits, maintenance nobody sees.

When teams aren't deliberate, complexity creeps in and the ["background hum of toil"](/engineering-toil) grows until it drowns out the real work. The fix is rarely heroic. You name what you're running, you're explicit about what you take on, and you're ruthless about killing what no longer matters.

## Fewer decisions, better outcomes

There's a discipline to constraining choice. At cinch the default was a golden path: we use this stack, these platforms, this set of libraries, and unless you have a reason, you stick to it. That doesn't kill creativity. It focuses it. Teams ship faster, onboarding is smoother, and nobody burns a week arguing about which flavour of queue to deploy.

The discipline paid off in the invisible places. Fewer incidents. New engineers shipping in their first week. More capacity for the bets that mattered, instead of firefighting or hand-rolling another deployment pipeline.

## Run less, build more

Get deliberate about the choices you make, and about the ones you avoid, and the benefits compound. There's more time for customer work because less of the day goes on background ops. The blast radius shrinks, so fewer things break at once and fewer pages arrive at night. New joiners don't have to learn five deployment patterns. And you spend your energy on bets that matter to the business rather than on interesting problems for their own sake. That's [work that keeps paying back](/doing-leveraged-work) for months rather than for one sprint.

None of this gives you a world without problems. It gives you one where the team's time goes on the problems that matter. Every architectural decision is something you live with, and the best teams write those decisions down, revisit them, and keep the stack as light as they can.

So be explicit about what your team has committed to. List the tech, the platforms and the patterns, including the ones that snuck in without anyone deciding. Make the golden path public and easy to follow, and expect exceptions to come with a reason rather than a preference. Audit the stack regularly and look for anything you can kill, automate or move to a managed service. And when you do remove something, [call out the time saved and the complexity removed](/culture-follows-incentives), not just the features you shipped.

Every system is a collection of lessons, some deliberate and some picked up the hard way. The teams that do well talk about what they've learned and let it change how they work. The less you have to keep running, the more you can build.
