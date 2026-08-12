---
title: Engineering Toil - Seeing the Unseen Work
date: 2025-06-23 08:00:00
written_with_ai: true
tags: [management, developer-experience]
description: "Toil is the work that keeps systems running and never shows up in a sprint goal. Ignore it long enough and it becomes the defining experience of the team."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

It's easy to celebrate the wins in a product engineering team. A launch, pulling together to resolve a critical outage, watching months of platform work unlock a wave of customer growth. Underneath all of that sits something more ordinary, which is *toil*. Toil is the work that keeps systems running and quietly eats a team's time and energy.

In every system I've worked on, toil is there. It's the 2am manual restart of a stuck service, the weekly trawl through logs to clear false positives, the ritual of updating an expiring certificate. You won't see "reduce toil" in a sprint goal, but ignore it long enough and it becomes the defining experience of the team.

## What is toil?

[Google's SREs gave us a good definition](https://sre.google/sre-book/eliminating-toil/): toil is manual, repetitive and has no lasting value. That's different from necessary operational work. Rolling out a new service is interesting the first time. Doing it by hand for the twentieth time is not. Debugging a tricky issue can be satisfying, but fixing the same alert every week turns into busywork.

Manual deployments are the obvious case, where engineers SSH into boxes, run bespoke scripts and work through a checklist, with every step a chance for human error. Then there are noisy alerts that page someone who doesn't need to act. Or the same class of bug fixed separately in six microservices because nobody built the shared solution. Or rotating secrets and updating dependencies by hand because the automation never landed.

Toil is the sort of work where, once you've finished, nothing is better except that you'll be doing it again soon.

## What toil costs

The first cost is obvious. It uses engineering hours that could go on [work that keeps paying back](/doing-leveraged-work). Over time the costs get worse.

Good engineers joined to solve interesting problems, not to babysit pipelines, so toil drains motivation. When half a sprint disappears into repetitive admin, plans slip and the team spends more time holding the status quo in place than moving it. Manual steps mean more chances to make a mistake, and bored, tired people make more of them. Eventually the best engineers leave for somewhere their time counts for more.

This isn't only anecdotal. The [DORA "State of DevOps" report](https://dora.dev/research/2024/dora-report) tracks engineering performance across thousands of organisations, and it consistently finds that teams carrying high levels of toil ship more slowly, recover from failures less well, and burn out more often.

High-performing teams tend to pick ["boring technologies"](/boring-tech), invest in automation and standardise their tooling. They end up with a fraction of the operational overhead their peers carry.

## Leading teams through toil

Your job as a leader isn't to remove toil overnight. It's to make it visible and treat it as real engineering work.

### Make toil visible

Start by naming and tracking it. Ask the team which tasks they repeat most often. A regular toil audit, meaning a short and candid conversation about recurring work, gets you most of the way there. Metrics help, but the anecdotes land harder. Ask how much of the week goes on work they'd rather never do again.

### Make automation count

Put toil reduction into engineering priorities explicitly. Carve out time for automation as a commitment rather than a Friday afternoon hack. Treat removing a manual step as being worth as much as a feature launch, because every hour saved comes back as better work.

### Reduce at the source

Most toil has a cause upstream, whether that's a broken abstraction, a missing tool or a gap in the process. Fix it at the root by investing in better CI/CD, smarter alerting or shared infrastructure libraries. Sometimes the fix isn't technical at all, and the answer is saying no to a low-value operational request.

### Protect the team

Left alone, toil crowds out everything else. Protect the time for work that moves the team forward, and push back on purely operational requests unless they come with a plan to automate them.

### Model it yourself

Leaders set the tone. If you automate something annoying, share it. When someone removes a manual process, highlight it in the demo or the retro. That's how the team learns toil reduction counts as progress.

## The payoff

The healthiest engineering cultures I've seen share a bias for automating away the boring parts. They build the tooling, refine the process, and watch for friction creeping back. Toil never disappears completely, but it stays in check because someone keeps looking at it.

What you get back is hours. Teams move faster, systems get more reliable, and people remember why they joined in the first place.
