---
title: Engineering Toil - Seeing the Unseen Work
date: 2025-06-24 08:00:00
tags: [management, software-engineering]
description: "It's easy to admire the peak moments in engineering: shipping features, the incident recovery, the burst of innovation after months of foundational work. But beneath the visible achievements sits something far more ordinary and persistent - *toil*. Toil is the work that keeps systems humming, the low-grade friction that quietly erodes a team's time, energy, and, eventually, spirit."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-06-24 T19:00:00+01:00
---

It’s easy to celebrate the highlights in product engineering: a product launch, pulling together to resolve a critical outage, or watching months of platform investment quietly unlock a wave of customer growth. But beneath the visible achievements sits something far more ordinary and persistent - *toil*. Toil is the work that keeps systems humming, the low-grade friction that quietly erodes a team's time and energy.

In every system I've touched, toil is there silent, repetitive, rarely celebrated. It's the 2am manual restart of a stuck service, the weekly trawl through logs to clear false positives, the ritual of updating an expiring certificate. You won't see "reduce toil" in most sprint goals, but ignore it long enough, and it becomes the defining experience of the team.

## What Is Toil?

[Google SREs gave us a nice definition](https://sre.google/sre-book/eliminating-toil/): toil is manual, repetitive, automatable, and devoid of lasting value. It's distinct from necessary operational work. If deploying a new service is exciting once, doing it by hand a hundred times is toil. If debugging a production issue is an opportunity for learning, fixing the same type of alert every Friday is a pure grind.

A few common examples:

- **Manual Deployments:** Engineers SSH into boxes, run bespoke scripts, follow checklists. Each step is a chance for human error.
- **Noisy Alerts:** Pager fatigue from alerts that don't need immediate human intervention.
- **Repetitive Bug Fixes:** Squashing the same bug class across many microservices because there's no shared solution.
- **Admin Tasks:** Rotating secrets, expiring tokens, or manually updating dependencies because automation never landed.

At its core, toil is the sort of work where, after you've done it, the world isn't really any better off except that you'll need to do it again soon.

## The Impact of Toil

Toil is a slow poison. The first cost is obvious: it takes up engineering hours that could be spent on higher leverage work, shipping features, fixing fundamental issues, or improving the system. Over time, the costs deepen:

- **Demoralisation:** Talented engineers joined to solve interesting problems, not to babysit pipelines or chase routine tickets. Toil drains motivation.
- **Reduced Velocity:** When half a sprint is lost to repetitive admin, progress stalls. Product plans slip. Teams spend more time maintaining the status quo than moving it forward.
- **Operational Risk:** Manual steps mean more opportunities for error. Fatigue and boredom make mistakes more likely, compounding incidents.
- **Attrition:** Eventually, the best engineers move on to places where their time and energy yield greater impact.

The problem isn't just anecdotal. The [DORA "State of DevOps" report](https://dora.dev/research/2024/dora-report), which tracks engineering performance across thousands of organisations worldwide, consistently finds that teams burdened by high levels of toil deliver features more slowly, recover from failures less effectively, and experience higher rates of burnout and attrition.

By contrast, high-performing teams invest in automation, standardised tooling, and platform improvements, leading to less than half the operational overhead and wasted work compared to their peers.

Ignore toil, and you invite steady decay in team morale and system reliability. Address it, and you unlock time, attention, and satisfaction.

## Leading Teams Through Toil

Leadership's job isn't to remove toil overnight, it's to surface it, prioritise, and make it a first-class engineering concern.

### Make Toil Visible

The first step is to name and track toil. Invite teams to surface the tasks they repeat most often. Regular "toil audits" a lightweight, candid team conversation about recurring work can be transformative. Metrics help, but anecdotes are powerful: "How much of your week is spent on work you wish you never had to do again?"

### Incentivise Automation

Make toil reduction an explicit part of engineering priorities. Carve out time for automation, not just as a Friday-afternoon hack, but as a core commitment. Celebrate the removal of manual steps as much as a feature launch because every hour saved is an hour reinvested in better work.

### Reduce at the Source

Most toil has a cause upstream, a broken abstraction, a missing tool, a gap in process. Leaders can sponsor efforts to fix these at the root, whether it's investing in better CI/CD, smarter alerting, or shared infrastructure libraries. Sometimes the fix is non-technical: saying "no" to low-value operational requests, or renegotiating expectations with stakeholders.

### Protect the Team

Left unchecked, toil crowds out everything else. Protect time for projects that move the team up the value chain. Push back on work that's purely operational unless it comes with a plan to reduce or automate it.

### Model and Celebrate Toil Reduction

Leaders set the tone, if you automate something annoying, share it. If you see someone on the team remove a manual process, highlight it in demos or retros. This normalises the idea that toil reduction isn't "nice to have" its real, valuable progress.

## The Payoff

Great teams don't just build, they tend to the systems they inherit, they refuse to let drudgery define their days. Over the years, the healthiest engineering cultures I've seen share a bias for automating away the boring bits. They build tooling, refine the process, and keep an eye out for creeping friction. Toil is never eliminated entirely, but it's kept in check an ongoing tax that's regularly audited.

[The real reward is leverage](/doing-leveraged-work): engineers reclaim hours, teams move faster, systems become more reliable, and morale stays high. And, crucially, the team remembers why they joined in the first place.
