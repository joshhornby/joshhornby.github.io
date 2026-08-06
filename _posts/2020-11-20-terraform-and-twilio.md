---
title:  "Using Terraform to build Twilio TaskRouter Infrastructure"
date:   2020-05-03 14:30:00
tags: [twilio]
description: How you can use Terraform to deploy your Twilio TaskRouter config
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

To manage a growing [Twilio TaskRouter](https://www.twilio.com/taskrouter)
config, I've written a [Terraform plugin](https://github.com/joshhornby/terraform-provider-twiliotaskrouter) that lets
developers extend and edit their TaskRouter infrastructure in code.

## What is Terraform?

Terraform is an open source tool for creating and versioning infrastructure.

Without it, you create and update your Twilio TaskQueues, Workflows and phone numbers by hand. Infrastructure built that way leaves the knowledge in one person's head, and nobody wants to touch it later because there's no record of how it got that way.

Infrastructure as code fixes that. Once the config lives in code, changes go through code review like anything else, and the code doubles as documentation and a history of what changed.

## Benefits of using Terraform with Twilio

Moving TaskRouter config into code gave me a few things:

- New environments, like testing and production, are quick to spin up
- The infrastructure lives in Git
- Config changes go through the same pull request workflow as any other code
