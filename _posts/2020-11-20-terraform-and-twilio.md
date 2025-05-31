---
title:  "Using Terraform to build Twilio TaskRouter Infrastructure"
date:   2020-05-03 14:30:00
tags: code
image: /assets/images/terraform-and-twilio.jpg
description: How you can use Terraform to deploy your Twilio TaskRouter config
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2020-05-13 T15:00:00+01:00
---

In order to manage an ever growing [Twilio TaskRouter](https://www.twilio.com/taskrouter)
config I've created a [Terraform Plugin](https://github.com/joshhornby/terraform-provider-twiliotaskrouter) which allows
developers to easily extend and edit their TaskRouter infrastructure.

## What is Terraform?

Terraform is an open source tool for building, changing, and versioning infrastructure safely and efficiently. 

If we didn't use Terraform we'd need to manually create and update our Twilio TaskQueues, Workflows, Phone numbers and the list goes on. When infrastructure is created manually, knowledge ends up trapped in the heads of individuals and future updates are scary, unrepeatable, difficult and undocumented.

But that’s where infrastructure as code can help. By storing infrastructure configurations in code, and not making changes manually, engineers can apply processes, such as code review to their infrastructure changes too. The code acts as documentation, and becomes a history of changes.

## Benefits of using Terraform with Twilio

By moving your TaskRouter infrastructure into code I've found the following benefits:

- Easily spin up new environments e.g Testing, Production.
- All your infrastructure can now be added to Git.
- Any updates to your TaskRouter config now has to go through the same Pull Request workflow as any other piece of code.
