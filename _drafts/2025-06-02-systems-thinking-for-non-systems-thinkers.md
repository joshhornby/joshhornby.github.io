---
title: Systems Thinking for Someone Who Doesn't Naturally Think in Systems
date: 2025-07-14 08:00:00
tags: [systems-thinking, management]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-07-14 T19:00:00+01:00
---

Most people I know didn't start out thinking in systems. I certainly didn't. I saw problems, solutions, people, outcomes. I built things that worked, until they didn't. Only after enough duct-taped fixes and unexpected side effects did I realise the problem: I was building for *this moment*, not for the complex, persistent, and unpredictable mess that is reality. I needed to see systems.

## Why Systems Thinking Feels Unnatural

Systems thinking isn't just a different lens; it's a different way of parsing the world. If you're anything like me, your mind defaults to cause, effect, done. It's linear. Clean. Satisfying. But systems are rarely stories; they're feedback loops, invisible dependencies, reinforcing and balancing forces that don't care about your linear plans.

Linear thinkers want checklists. Systems thinkers look for patterns.

The hardest part: the system isn't just the code, or the org chart, or the quarterly plan. It's the interplay. The bit where a database bottleneck quietly pushes your SLOs off target, so ops jump in with a hotfix, which triggers a wave of new incidents, and suddenly support is firefighting instead of building. Product has to shift priorities to address the fallout, and your beautifully planned roadmap morphs into something unrecognisable.

A few years ago, I kept running into the same issue during sprint planning. Every quarter, the same complaint surfaced: "We're always interrupted by urgent bug fixes." We'd shuffle the backlog, add buffer time, tell ourselves this sprint would be different. It never was.

After a while, I stopped blaming our process discipline. I sketched out a map: where did these interruptions come from? Patterns started to show, the majority of urgent bugs traced back to one legacy service that only a couple of people truly understood. New hires wouldn't touch it. Documentation was sparse. When something broke, all work ground to a halt while the experts scrambled for a fix.

This wasn't a planning failure. It was a system that invisibly routed risk to a single fragile point, and left us exposed week after week. Once we saw the whole picture, the solution changed. We didn't just "try harder", we carved out time for the team to refactor, document, and spread knowledge of that service, and made it a team-wide objective, not a side quest. The firefighting tailed off. Sprints became predictable.

## Getting Practical: How I Try to Think in Systems

1. **Map Flows, Not Steps** - When something breaks, don't just fix the broken link. Map the whole flow. Who's upstream, who's downstream? Where does work pile up? Where does it disappear?

2. **Ask, "What Happens Next?"** - Every intervention has a knock-on effect. Pause to imagine: If I change X, who gets woken up at 2 a.m. a month from now?

3. **Look for Reinforcing Patterns** - What keeps recurring? Teams firefighting the same issue, code being rewritten every six months, customers finding workarounds you never designed for these aren't just annoyances, they're signals.

4. **Optimise for Feedback Loops** - The sooner you hear about something breaking, the sooner you can adapt. Tight feedback is the heart of healthy systems whether it's alerts, retros, or simply talking to users often.

5. **Accept That You Can't See It All** - Systems thinking is not an exact science. You'll miss stuff. The trick is to build in slack, monitor what you can, and revisit your maps often.

Linear thinking gets you quick wins. System thinking gets you wins that last. The organisations and codebases that endure aren't built on heroics or clever patches. They're built on the quiet discipline of people who bother to map the system, listen to the signals, and are humble enough to adapt.

You don't have to be a natural systems thinker. I'm not. You have to care enough to step back, trace the loops, and try again.
