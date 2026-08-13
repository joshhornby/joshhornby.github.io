---
title: "Overtrading"
date: 2026-08-12 08:00:00
tags: [org-design, management]
description: "Building got cheap. The ability to settle decisions did not. Start more work at once and you fill a warehouse you cannot sell."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-12T19:00:00+01:00"
---

A company wins a big contract. Then another one. Sales are up forty percent on last year, the pipeline is full, and the board is delighted. Eight months later, it cannot pay its suppliers and goes under.

Accountants call this overtrading. The business takes on more work than its working capital can carry. Every new order costs money before it earns money. You buy the stock, you pay the staff, you deliver, then you wait sixty days to get paid. Do that once and you are fine. Do it at twice the volume, and the money runs out somewhere in the middle. The orders were real. They were profitable. The company still died.

Demand was never the constraint. Cash was, and specifically how long cash took to go out and come back. Winning more work made it worse.

## Building got cheap, deciding did not

I think something close to this now happens inside software organisations.

Building got cheap, writing the code is no longer the slowest part. A feature that would have taken a month of engineering takes a few days.

So what plays the role of cash? It is the organisation's ability to settle questions. Someone has to decide what the feature actually does. Someone has to agree the data model, clear the security review, set the price, confirm which customer this is for. Those calls sit with a small number of people, and they can only work through so many at a time. That number did not change when the building got faster.

## Unfinished work is money sitting still

When a business overtrades, the money is not gone. It is sitting in a warehouse as stock, or on a spreadsheet as an invoice nobody has paid. It is real value that you cannot spend.

Half-built software waiting on a decision is the same thing. The work is done, and it is worth nothing yet. A branch that needs one product call before it can ship is stocked in a warehouse. Ten of those branches is a full warehouse and an empty bank account.

The arithmetic here is dull and reliable. The more you start at once, the longer each piece takes to finish. Start twice as many projects and each one waits roughly twice as long in the queue, even though nobody built anything slower.

## Every number on the dashboard improves

Overtrading is hard to spot because the accounts look excellent. Revenue is up, margins hold, the order book is full. The one number that would tell you the truth is the bank balance, and it lives on a different page.

Engineering has the same blind spot. Deploys per day go up, pull requests merged go up, and the time from first commit to merge falls. Every number on the dashboard improves because all of those numbers measure building, and building is the part that got cheap. Meanwhile, the thing a customer asked for six weeks ago still is not live because it is waiting on an answer nobody has given. Measure the part that stopped being scarce, and you will feel fast right up until someone asks why nothing shipped.

## Deciding faster is only half the answer

There are two ways out of this and most people only take one.

The first is to settle decisions faster. Push authority down to the team doing the work. Stop routing every choice through the same three people. Where a function has to sign off, give teams a way to handle the common cases themselves and save the humans for the calls that carry real weight. When something is unclear, build a rough version to expose the constraints rather than argue about it in a meeting. All of this works, and you should do it.

The second is to start fewer things at once. This is the one that gets skipped because it feels like throwing away the speed you just gained.

A growing business does not fail because it grew. It fails because it grew without raising the money to carry the growth. Fund it properly, through an overdraft or invoice financing or better payment terms, and the same growth is safe. The failure is unfunded growth, not growth.

The same test applies here. Running more projects at once is fine if you have first raised your capacity to settle decisions. Delegating authority is raising capital. Hiring more engineers is not. That only wins you more orders you cannot fund.

## Cap the work in progress

The practical move is a limit on work in progress, counted against the people who settle decisions rather than the people who build.

That is a different number from the one most teams track. If four projects all need the same head of product to make calls, you have one queue with four things in it, whatever the org chart says. So write down the deciders on each active project. Where the same name turns up three or four times, you have found your real limit, and you have probably already gone past it.

Then hold the ordering. Finish something before you start the next thing. A project that is ninety percent built and waiting on one answer is worth more finished than two new projects are worth started.

The obvious objection is that slack is waste, and that you only learn your true capacity by pushing past it. I have some sympathy with that. But it argues for funded growth, not unfunded growth. Push past the limit deliberately, having raised the capacity first, and you learn something useful. Push past it by accident because building got cheap and it all felt possible, and you end up with a warehouse full of stock.

When building gets cheaper, the question worth asking is what you were short of in the first place. Usually it was the decisions, and cheap code does nothing for those. Start more work at once, and you make them slower.
