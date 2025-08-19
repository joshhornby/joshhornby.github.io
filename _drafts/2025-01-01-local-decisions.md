---
title:  "The Local Optimisation Trap: How Teams Kill Global Performance"
date:   2015-10-12 11:50:00
description: ""
tags: []
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2015-10-12T23:49:00+00:00"
---

I watched a support team spend three weeks building an elegant ticket categorisation system. They created detailed taxonomies, automated tagging rules, and clean reporting dashboards. The system worked beautifullyfor them. Support tickets got categorised faster, their metrics looked pristine, and management was impressed.

Six months later, the engineering team was drowning. The support categories bore no relationship to how the product was actually built. A "Login Issue" ticket might involve the authentication service, the user database, the frontend form validation, or the session management system. Engineers spent hours each week translating support categories back into actionable technical information, often getting it wrong and fixing the wrong thing entirely.

This is local optimisation at its most destructive. One team makes decisions that streamline their workflow whilst creating exponentially more work elsewhere.

## The Pattern Everywhere

I've seen this pattern repeat across dozens of organisations:

**Sales teams** negotiate custom contract terms because it closes deals faster. Legal and engineering then spend months building one-off features and managing bespoke billing logic that serves exactly one customer.

**Product managers** define requirements in business language because it's clearer for stakeholders. Engineers translate those requirements into technical specifications, often misinterpreting the underlying intent and building the wrong solution.

**Engineering teams** choose the latest trendy framework because it's more interesting to work with. Operations then struggles to monitor, debug, and scale systems they don't understand, leading to longer outages and frustrated customers.

**Marketing teams** promise delivery dates that sound good in campaigns. Engineering scrambles to hit artificial deadlines, cutting quality corners that create support burden for months.

Each decision makes perfect sense within the local context. But the cumulative effect is organisational dysfunction that's nearly impossible to trace back to its source.

## Why This Happens

Teams optimise locally because **they feel the immediate pain of their current process but remain insulated from the downstream consequences**. The support team experiences the frustration of inconsistent ticket categorisation every day. They never see engineers struggling to interpret their categories.

There's also a measurement problem. Teams get evaluated on metrics they can directly control. Support gets measured on response time and categorisation accuracy. Engineering gets measured on feature delivery and bug counts. Nobody gets measured on how well the handoffs between teams work.

Finally, there's simple human psychology. It's easier to solve problems you can see than problems that exist somewhere else in the organisation. The support team can immediately observe whether their new categorisation system works. They can't easily observe whether it makes engineering's job harder.

## Breaking the Cycle

**Map the full workflow.** Before changing any process, trace the entire end-to-end flow. Who touches this work after you're done? What information do they need? How will your change affect their work? I've seen teams discover their "optimisation" actually added 40 hours of work elsewhere for every hour it saved them.

**Rotate people through downstream teams.** Nothing beats firsthand experience of how your decisions affect others. When support people spend time with engineering during incident response, they quickly understand why technical accuracy matters more than clean categories.

**Measure cross-team outcomes.** Instead of optimising support response time, measure time-to-resolution across the entire chain. Instead of measuring feature delivery speed, measure customer value delivered. These broader metrics naturally encourage teams to consider their impact on others.

**Build feedback loops.** Create regular touchpoints where downstream teams can show upstream teams the consequences of their decisions. Monthly "pain point reviews" where engineering shows support how categorisation mistakes led to customer escalations. Quarterly sessions where operations shows product teams how feature decisions affected system stability.

**Default to transparency.** Make the cost of local decisions visible. When support builds a new categorisation system, publish the engineering hours required to interpret each category. When product defines requirements, track how often engineers need clarification and rework. Sunlight remains the best disinfectant.

## The Real Cost

Local optimisation doesn't just create inefficiencyit destroys trust between teams. When engineering constantly struggles with poorly translated requirements, they start building buffers and workarounds. When support deals with misleading technical information, they stop trusting engineering's estimates. These defensive behaviours compound over time, creating organisational scar tissue that's incredibly difficult to heal.

The most successful companies I've worked with have learned to optimise for global outcomes even when it makes local work slightly harder. Their teams ask "How does this decision affect everyone else?" before they ask "How does this make my job easier?" It's a subtle shift in thinking that produces dramatically different results.
