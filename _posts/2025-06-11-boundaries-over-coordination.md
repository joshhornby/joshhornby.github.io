---
title: Don't Optimise Coordination, Eliminate It
date: 2025-06-11 08:00:00
tags: [management, software-engineering, architecture, systems-thinking]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-06-09 T19:00:00+01:00
---

If you want to know how healthy your engineering system is, count the meetings on your calendar. Or better yet, count the ones labelled "cross-team sync".

As dependencies grow, so does the overhead required to keep them in sync. New shared Slack channels, sprawling Jira boards, a weekly check-in "just to keep us aligned." I've been part of rollouts where the answer to any missed hand-off was to add another layer of coordination, hoping that more meetings might compensate for too many moving parts.

But lately, I've started asking: _What if coordination isn't a sign of organisational maturity, but a sign the boundaries are broken?_

## A Better Question

Jess Kerr, in her piece ["Better Coordination, or Better Software?"](https://jessitron.com/2021/08/02/better-coordination-or-better-software/){:target="_blank"}, puts it plainly:

> "When different parts of an organisation need to coordinate, it seems like a good idea to help them coordinate smoothly and frequently. Don't. Help them coordinate less - more explicitly, less often"

We tell ourselves coordination is necessary to keep the system ticking over. But more often, it's a tax we pay for missing contracts, leaky abstractions, or responsibilities spread across too many teams. Each sync is a signal: there's a boundary that needs reinforcing.

When you pay that cost up front by investing in clear APIs, real ownership, and robust contract tests, the system gives you back time. You replace five recurring meetings with one shared doc and a test suite. Teams stop unblocking each other and start unblocking themselves.

## The Composability Dividend

The more composable our systems, the clearer our boundaries, the less coordination we need and the more real leverage we get.

It's easy to reach for a process and meetings as a kind of organisational safety net. It's harder (and more valuable) to make your systems fit together so that you don't need the safety net in the first place.

## Making Boundaries Work for You

Rather than battling the same coordination issues week after week, change the underlying system that keeps creating them. Here's how I've learned to turn boundaries from a source of friction into a source of leverage:

- **Code Your Boundaries, Don't Calendar Them** If two teams rely on a recurring hand-off, ask yourself: could a robust contract test or shared automation make that meeting unnecessary? Ship the boundary, not the calendar invite.

- **Prioritise Explicit Interfaces, Everywhere** Don't save good API design for the public edge. Every ambiguous, undocumented internal dependency is tomorrow's meeting in disguise. Make contracts explicit.

- **Track Your Coordination Overhead** Count every regular meeting, shared Slack, and cross-team Jira epic. This is your "boundary tax". Watch it. If it's trending up, your system's not scaling your calendar is.

Next time you find yourself spinning up another coordination ritual, pause. Is the problem really about information flow, or is it the absence of a clear, trusted boundary?

Maybe the highest leverage thing you can do isn't another meeting, but a better interface.
