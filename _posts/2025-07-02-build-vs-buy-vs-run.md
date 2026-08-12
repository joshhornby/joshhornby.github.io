---
title: "Build vs Buy vs Run"
date: 2025-07-02 08:00:00
written_with_ai: true
tags: [software-engineering, architecture]
description: "Self-hosting open-source tools sits between building and buying. Sometimes it's the right call, if you respect the operational cost."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2026-08-02T08:00:00+00:00"
---

The classic build vs buy question has always shaped engineering strategy. There's a third option that gets discussed less: self-hosting. Instead of writing your own tool or paying a SaaS vendor, you stand up and run the open-source version yourself.

This isn't new, but with mature open-source stacks and cloud automation it's easier than it used to be. Self-hosting can be a sensible middle ground as long as you go in with your eyes open.

### The practical upside

The appeal is obvious. You get some of the flexibility of building and some of the speed of buying, and at certain scales it costs less. If you have strong infrastructure skills in-house, running your own instance gets you a few things.

Data control is the big one. Compliance, residency and privacy questions are easier to answer when you own the storage and the network. Cost matters too, because for some workloads the licence fees on a hosted version add up quickly. And you can change things without waiting on a vendor's backlog.

I've found self-hosting most useful for internal tools and developer infrastructure, and as a way to try new tech before committing to a paid platform. Sometimes the only way to work out what you need is to run it for a while.

### The operational reality

Self-hosting isn't set-and-forget. The day you install it is the easiest day you'll have. After that you've taken on ongoing responsibility.

You own the patches and the version bumps, not just the features. The plugin or SSO config you wanted may turn out to be a DIY job. And when something breaks at 2am, your support line is the project's issue tracker.

It's easy to underestimate how much [operational work](/engineering-toil) builds up around even a simple deployment. That time is almost always invisible on the roadmap until something breaks.

None of this is a reason to avoid self-hosting. It just works better as a deliberate choice than as a shortcut. A few lessons have stuck with me.

Assign ownership. Someone needs to own the uptime, the upgrades and the docs. If it's nobody's job, it quietly decays.

Automate the boring parts early. Write the scripts for setup, recovery and upgrades. If you're hand-patching servers, you're paying in toil.

Track the true cost. Measure the time spent on fixes and outages alongside the licence savings. Sometimes the SaaS fee is a bargain next to the hours.

Stay close to upstream. Heavy forking and customisation makes your upgrade path much harder, and it costs you the community support too.

And know when to walk away. If a self-hosted tool starts eating more time than it saves, move on.

### When self-hosting wins

For all the caution, there are plenty of places it works well. Internal dev tools, systems where you want deep control, and anything with a clear operational owner. Sometimes the overhead of running your own is what creates the space to learn how the thing actually works.

The trick is making the decision explicit, revisiting it now and then, and being honest about when the costs have overtaken the benefits. The most effective teams don't default to build, buy or run. They treat each one as a choice, and pick whichever keeps the focus on customers.
