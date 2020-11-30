---
title:  "Using Terraform to build Twilio TaskRouter Infrastructure"
date:   2020-05-03 14:30:00
tags: twilio
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2020-05-13 T15:00:00+01:00
---

In order to manage an ever growing [Twilio TaskRouter](https://www.twilio.com/taskrouter)
config I've created a [Terraform Plugin](https://github.com/joshhornby/terraform-provider-twiliotaskrouter) which allows
developers to easily extend and edit their TaskRouter infrastructure.

By moving your TaskRouter infrastructure into code I've found the following benefits:

- Easily spin up new environments e.g Testing, Production.
- All your infrastructure can now be added to Git.
- Any updates to your TaskRouter config now has to go through the same Pull Request
workflow as any other piece of code.
