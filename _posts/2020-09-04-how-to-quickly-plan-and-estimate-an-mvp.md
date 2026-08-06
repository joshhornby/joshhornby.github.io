---
title:  "How to quickly plan and estimate an MVP"
date:   2020-09-19 19:00:00
tags: [software-engineering]
description: "This post outlines my tried & tested strategy for quickly planning and estimating MVP projects. This process departs a little from Agile/Scrum best practices. There are no guarantees on estimation quality which I believe is impossible to do for software projects, but it helps to provide a rough guide for new projects."
sitemap:
  priority: 0.7
  changefreq: 'monthly'
  lastmod: "2020-09-09T22:12:10+00:00"
---

This post outlines my tried and tested strategy for quickly planning and estimating MVP projects.
This process departs a little from Agile/Scrum best practices. It won't give you an accurate estimate, because I don't think accurate estimates are possible for software projects, but it gives you a rough guide for a new one.

## Gather requirements
To plan, you need to know what you're building.
The more questions you ask at this stage, the easier the later steps get.

Some questions to ask are:

- Why are we building this?
- Who is the target audience?
- How many people do we expect to use this?
- What does "Complete" look like to you?  

## Break down the work

Now that you have the requirements and understand what needs building, start breaking down the work.

I split the work into epics and user stories. An epic is a group of related user stories. A user story is a short requirement written from the point of view of an end user.

I normally start with the CRUD *(Create, Read, Update, Delete)* stories, so Create User, View User, Update User Marketing Preferences, and so on.

| Epic   | Story |
|---------|-------|
| Favourite    | User can add a product to their favourites   |
| Favourite    | User can remove a product from their favourites   |
| Favourite    | User can view a product in their favourites   |
| Account    | User can view their account details   |
| Account    | User can update the details of their account   |
| Account    | User can delete their account   |

## Estimate

On a greenfield project it's impossible to predict how long a feature will take.
Plenty of things affect the accuracy of an estimate:

- How many hours actually get spent on the project
- How often people get interrupted
- Who is working on it, how experienced they are, and how long they've worked together

Time-based estimation fails as a rule, which is why I use story points instead.

## How to estimate difficulty

People are better at comparing than at analysing.
If someone asks you how big Europe is compared to Australia, you'll reach for a map.

So I use relative estimation.

### Putting this into practice

- Choose an "easy" story, ask the team to consider how difficult it is, then assign it 2 points.
- Choose another story. Ask the team: is it easier or harder to build than the first story?
- If easier, assign it 1 point.
- If harder, how much harder? Assign it 3 or more points.

Use the following scale, *1, 2, 3, 5, 8, 13, 20, 40, 100*.

Do this for every story, checking as you go that each new estimate still makes sense against the others. You'll need to go back and change earlier values.

If a story comes out very large, that's usually a sign to break it into several smaller ones.

Once all stories have an estimate, it's time to put the stories in priority order.

- Which stories depend on others? 
- Which stories provide the most business value?
- What needs to be built first?

## Create a rough plan

> I don't like to make guarantees when a new feature/project will be complete.
In my experience there are too many variables outside your control
to confidently promise dates this early on in the development lifecycle. 

But other teams usually need a rough guide so they can coordinate, for example marketing or compliance.

With the current team, think about how many stories the team could finish in a sprint (I personally like to work in 2 week sprints).

For example, let's say they think they can complete the first four stories, which add up to 6 points. This becomes the estimated velocity.

Next compare it to the total number of points for the whole project (in this example, 30 points).

30 points total / 6 points for this sprint = 5 sprints to finish

The accuracy of this prediction will change as you complete sprints.
Your velocity will likely be variable at the beginning of a project and will smooth out as the team goes through more sprints.

**Once all the steps are complete, you will end up with:**

| Epic      | Story                                           | Points | Sprint |
|-----------|-------------------------------------------------|--------|--------| 
| Account   | User can view their account details             | 2      | 1      |
| Account   | User can update the details of their account    | 5      | 1      |
| Account   | User can delete their account                   | 8      | 1      |
| Favourite | User can add a product to their favourites      | 2      | 2      |
| Favourite | User can remove a product from their favourites | 3      | 2      |
| Favourite | User can view a product in their favourites     | 2      | 2      |

This gives you a rough guide to how long the MVP will take. It isn't a guarantee, and it won't be perfect, but it's a reasonable starting point.
