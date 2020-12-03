---
title:  "How to quickly plan and estimate an MVP"
date:   2020-09-19 19:00:00
tags: project-management
image: /assets/images/how-to-quickly-plan-and-estimate-an-mvp.jpg
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2020-09-19 T19:00:00+01:00
---

This post outlines my tried & tested strategy for quickly planning and estimating MVP projects.
This process departs a little from Agile/Scrum best practices. There are no guarantees on estimation quality which I believe is impossible to do for software projects, but it helps to provide a rough guide for new projects.

## Gather Requirements
In order to plan you need to know what you should be building.
The more questions you can ask in this step the easier you will find future steps. 

Some questions to ask are:

- Why are we building this?
- Who is the target audience?
- How many people do we expect to use this?
- What does "Complete" look like to you?  

## Break down the work

Now you have gathered some requirements and have a better understanding of what needs
to be build it's time to start breaking down the work.

I like to split the work into **Epics** & **User Stories**.

**Epics** = A group of related user stories

**User Stories** = Short requirements or requests written from the perspective of an end user

Normally I start with the CRUD *(Create, Read, Update, Delete)* stories, for example: Create User, View User, Update User Marketing Preferences. 

| Epic   | Story |
|---------|-------|
| Favourite    | User can add a product to their favourites   |
| Favourite    | User can remove a product from their favourites   |
| Favourite    | User can view a product in their favourites   |
| Account    | User can view their account details   |
| Account    | User can update the details of their account   |
| Account    | User can delete their account   |

## Estimate

When building a greenfield project it's impossible to predict how long it will take to build features.
In my experience numerous factors affect the accuracy of estimations:

- How many hours will be spent on the project
- How many times a day you get interrupted
- Who is working on the project eg Experience level of the team, how long have the team worked together

As a general rule Time-based estimation will fail, this is why I like to use Story Points instead.

## How to estimate difficulty?

As humans it's easier for us to compare than it is to analyze.
As an example if someone asked you how big Europe is compared to Australia you would most likely look at a maps.

This is why I use **Relative estimation**.

### Putting this into practice

- Choose an "easy" story, ask the team to consider how difficult it is, then assign it 2 points.
- Choose another story. Ask the team: is it easier or harder to build than the first story?
- If easier, assign it 1 point.
- If harder, how much harder? Assign it 3 or more points.

Use the following scale, *1, 2, 3, 5, 8, 13, 20, 40, 100*.

Sometimes I find it difficult to know which points we should be assigning to a story.
So I like to use bigger, more spaced apart numbers to prevent wasting time on estimation that is overly granular. 

Do this for each story, and verify throughout that each additional estimated story is relative to other stories; you may need to go back and change the values as you do this.

As a general rule, if a story is quite large then this is normally a sign you need to break this down into multiple stories.

Once all stories have an estimate, it's time to put the stories in priority order.

- Which stories depend on others? 
- Which stories provide the most business value?
- What needs to be built first?

## Create a rough plan

> I don't like to make guarantees when a new feature/project will be complete.
In my experience there are too many variables outside of your control
to confidently promise dates this early on in the development lifecycle. 

But a rough guide is normally required so other teams can coordinate their efforts E.g Marketing, Compliance etc.

With the current team, think about how many stories the team could finish in a sprint (I personally like to work in 2 week sprints).

For example, let's say they think they can complete the first four stories, which adds up to 6 points. This is then becomes the estimated velocity.

Next compare it to the total number of points for the whole project (in this example, 30 points).

30 points total / 6 points for this sprint = 5 sprints to finish

The accuracy of this prediction will change as you complete sprints.
Your velocity will likely be variable at the beginning of a project and will smooth out as the team goes through more sprints.

**Once all the steps are complete you will end up with:**

| Epic   | Story | Points | Sprint
|---------|-------|---------|-------| 
| Account    | User can view their account details   | 2 | 1
| Account    | User can update the details of their account   | 5 | 1
| Account    | User can delete their account   | 8 | 1
| Favourite    | User can add a product to their favourites   | 2 | 2
| Favourite    | User can remove a product from their favourites   | 3 | 2
| Favourite    | User can view a product in their favourites   | 2 | 2
