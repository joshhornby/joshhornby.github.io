---
title:  "How to Move Fast without Breaking Things"
date:   2021-02-09 11:00:00
tags: personal-development
featured: true
image: /assets/images/Social-Advice-to-My-Younger-Software-Developer-Self.jpg
hide_image: true
description: "As I look back over what's almost a decade in software development, there are some things I wish I'd started doing sooner. This is the advice I'd give my younger self, who has just landed their first professional software development job."
---

I'm sure you've heard the saying "Move fast and Break Things" which was initially coined in the early days of Facebook. The idea that you could beat your competition by fast iteration & shipping product as quickly as possible.


Racing a car has a great analogy: In order to get faster lap times, you sometimes have to drive slower.
Specifically, you need to slow down for corners in order to maintain your control over the vehicle. Try to drive too fast and you end up wrecked. Even if you don't wreck, correcting from having entered a corner too fast loses far more time than just slowing down properly. Similarly to technical debt, if you start a straightaway from a slower starting speed because you botched the prior corner, that damages your lap time throughout the entire stretch.

In the overall scheme of being able to deliver software you're confident in, it is faster to consider stability inherently in your development process than try to blast out features and bolt on stability later once you're committed to the initial brittle implementation.

Identify Things You Cannot Break

[Zach Holman](https://twitter.com/holman) has a great post about how at GitHub they [Move Fast and Break Nothing](https://zachholman.com/talk/move-fast-break-nothing/). He thinks there is one thing you should do first and foremost:

> I think move fast and break things is fine for many features. But the first step is identifying what you cannot break. These are things like billing code (...), upgrades (hardware or software upgrades can always be really dicey to perform), and data migrations.

Once you've identified these areas, it's a whole massive challenge on how to not break these critical parts in the software, and still make fast and small changes. Like changing the engine while a car is running, there is no simple and one size fits all solution to this.

One interesting approach GitHub are doing is parallel code paths. In a nutshell, the idea is running both the old and the new code, and only switching to the new code one if it performs at least as good as the old one.