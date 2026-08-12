---
title: Don't Improve Coordination, Eliminate It
date: 2025-06-11 08:00:00
written_with_ai: true
tags: [architecture, systems-thinking, org-design]
description: "Every cross-team sync is a boundary that needs reinforcing. What if coordination isn't a sign of organisational maturity, but a sign the boundaries are broken?"
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

If you want to know how healthy your engineering org is, count the meetings on your calendar. Or better yet, count the ones labelled "cross-team sync".

As dependencies grow, so does the overhead required to keep them in sync. New shared Slack channels, sprawling Jira boards, a weekly check-in "just to keep us aligned". I've been part of rollouts where the answer to any missed hand-off was to add another layer of coordination, hoping that more meetings might compensate for too many moving parts.

But lately, I've started asking: _What if coordination isn't a sign of organisational maturity, but a sign the boundaries are broken?_

## A better question

Jess Kerr, in her piece ["Better Coordination, or Better Software?"](https://jessitron.com/2021/08/02/better-coordination-or-better-software/){:target="_blank"} puts it simply:

> "When different parts of an organisation need to coordinate, it seems like a good idea to help them coordinate smoothly and frequently. Don't. Help them coordinate less - more explicitly, less often"

We tell ourselves coordination is necessary to keep the system ticking over. But more often, it's a tax we pay for missing contracts, leaky abstractions, or responsibilities spread across too many teams. Each sync is a signal: there's a boundary that needs reinforcing.

When you pay that cost up front by investing in clear APIs, real ownership, and solid contract tests, the system gives you back time. You replace five recurring meetings with one shared doc and a test suite. Teams stop unblocking each other and start unblocking themselves.

## The composability dividend

The more composable the systems, the clearer the boundaries, and the less coordination you need to hold them together. That's [work that keeps paying back](/doing-leveraged-work).

It's easy to reach for process and meetings as an organisational safety net. It's harder, and worth more, to make your systems fit together so you don't need the net.

## Making boundaries work for you

Rather than fighting the same coordination problems week after week, change the system that keeps producing them. Three things have worked for me.

Code your boundaries instead of putting them in the calendar. If two teams depend on a recurring hand-off, ask whether a contract test or some shared automation could make that meeting unnecessary. Ship the boundary rather than the invite.

Make interfaces explicit everywhere, not just at the public edge. Every undocumented internal dependency is next month's meeting in disguise.

Track your coordination overhead. Count the regular meetings, the shared Slack channels and the cross-team Jira epics. That's your boundary tax. If it's going up, your calendar is scaling instead of your system.

Next time you find yourself spinning up another coordination ritual, pause. Is the problem really information flow, or is it the absence of a clear, trusted boundary? Often the answer is a better interface rather than another meeting.
