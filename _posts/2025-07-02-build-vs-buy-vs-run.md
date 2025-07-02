---
title: "Build vs Buy vs Run"
date: 2025-07-02 08:00:00
tags: [software-engineering, architecture]
description: "Self-hosting open-source tools sits between building and buying. Sometimes it's the right call, if you respect the operational cost."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2025-07-02T19:00:00+01:00"
---

The classic build vs buy question has always shaped engineering strategy. There's often a third lesser spoke about option: self-hosting. Instead of writing your own tool or handing over money to a SaaS vendor, you stand up and operate the open-source version yourself.

This approach isn't new, but in the age of mature open-source stacks and cloud automation, it's more accessible than ever. Self-hosting can be a smart middle ground if you go in with eyes open.

### The Practical Upside

The appeal is clear. You get the flexibility of building, the speed of buying, and sometimes, the best cost benefits. If you have strong infrastructure skills in-house, running your own instance of an open-source product can give you:

- **Data Control**: Compliance, residency, or privacy concerns are easier to handle when you own the storage and network.
- **Cost Management**: For some workloads, especially at scale, licence fees for hosted versions add up fast.
- **Customisation**: You're not waiting on a vendor's backlog to tweak workflows or integrations.

I've found self-hosting especially useful for internal tools, developer infrastructure, and as a way to kick the tyres on new tech before committing to a paid platform. Sometimes the only way to know what you need is to get your hands dirty.

### The Operational Reality

Still, self-hosting isn't a "set it and forget it" situation. The day you install is usually the easiest it will ever be. After that, you take on a slice of ongoing responsibility:

- **Upgrades and Security**: You're on the hook for patches and version bumps, not just features.
- **Integrations**: That plugin or SSO config you wanted? It might be DIY.
- **Support**: When something breaks, Stack Overflow and ChatGPT (or the project's issues page) is your support line.

It's easy to underestimate how much [operational work ("toil")](/engineering-toil) accumulates around even simple deployments. That time adds up, and it's almost always invisible on the roadmap until something breaks.

Self-hosting isn't something to avoid, but it works best when treated as a deliberate choice, not a shortcut. A few lessons that have stuck with me:

- **Assign Ownership**: Make sure someone on the team owns the uptime, upgrades, and docs. If it's nobody's job, it will quietly decay.

- **Automate the Boring Parts**: Invest early in scripts for setup, recovery, and upgrades. If you're hand-patching servers, you're paying in toil.

- **Track the True Cost**: Measure not just licence savings but time spent on fixes, reviews, and outages. Sometimes the SaaS fee is a bargain compared to that lost time.

- **Stay Close to Upstream**: Avoid forking or customising too heavily; staying on the mainline keeps your upgrade path (and your support options) much simpler.

- **Know When to Walk Away**: If a self-hosted tool starts to eat more time than it saves, be ready to move on.

### When Self-Hosting Wins

For all the caution, there are plenty of places where self-hosting shines. Internal dev tools, systems where you want deep control, or anything with a clear operational owner can all benefit. Sometimes the "overhead" of running your own is actually what creates the space for learning, control, or leverage.

The trick is to make the decision explicit, revisit it periodically, and be honest about when the costs outweigh the benefits.

Self-hosting is a series of trade-offs. It brings real strengths, but it comes with ongoing responsibilities. The most effective engineering teams don't default to build, buy, or run they approach each as a conscious choice. The real aim is always the same: pick the path that keeps the focus on what matters most to customers.
