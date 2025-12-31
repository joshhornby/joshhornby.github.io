---
title: Prompt Engineering for Engineering Managers
date: 2026-01-20 08:00:00
tags: [ai, leadership, management]
description: "Actual prompts I use for 1:1 prep, incident reviews, and decision memos. Less theory, more copy-paste."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-01-20T08:00:00+00:00"
---

Most prompt engineering content targets developers writing code. But the highest-leverage prompts I've written have nothing to do with code. They're for the management tasks that eat my calendar: preparing for 1:1s, writing decision documents, running incident reviews.

This post shares the actual prompts I use. Copy them, adapt them, throw them away if they don't fit.

## 1:1 Preparation

Before each 1:1, I dump my notes into Claude with this prompt:

```
You are helping me prepare for a 1:1 with a direct report.

Context about this person:
- Role: {role}
- Tenure: {months} months
- Current projects: {projects}
- Recent events: {events}

My raw notes from the past two weeks:
{notes}

Help me prepare by:
1. Identifying 2-3 themes worth discussing
2. Suggesting one question I should ask about their growth
3. Flagging anything that seems like it needs immediate attention
4. Proposing one piece of feedback I could give, with a specific example

Keep your response under 300 words.
```

The constraint on length matters. Without it, you get a wall of text that takes longer to read than just preparing manually.

What I've learned: the "recent events" field is where the value hides. Mentioning that someone just shipped a difficult project, or that their team went through a reorg, changes the output completely.

## Incident Reviews

After an incident, someone needs to write the review document. This prompt turns raw timeline notes into a structured first draft:

```
You are helping write a blameless incident review document.

Incident: {title}
Duration: {start_time} to {end_time}
Impact: {impact}
Timeline (raw notes):
{timeline}

Write a review document with these sections:
1. Summary (3 sentences max)
2. Timeline (formatted, with timestamps)
3. What went well
4. What could have gone better
5. Action items (specific, with suggested owners)

Rules:
- Blameless: focus on systems, not individuals
- Be specific: "alerts fired late" not "monitoring was bad"
- Action items must be concrete enough to create tickets from
```

The "blameless" instruction matters more than you'd expect. Without it, the output tends toward finger-pointing language, even from context that doesn't contain any.

## Decision Documents

When I need to write up a decision for stakeholders, I start with a brain dump and use this prompt to structure it:

```
I need to write a decision document for engineering leadership.

The decision: {decision}

Context and constraints:
{context}

Options I've considered:
{options}

My current thinking:
{thinking}

Write a decision document that:
1. States the decision clearly in the first paragraph
2. Explains why this matters (business impact)
3. Summarises options considered with trade-offs
4. Anticipates 2-3 objections and addresses them
5. Lists what happens next

Tone: direct, not defensive. Assume readers are smart but time-poor.
```

The "assume readers are smart but time-poor" instruction shapes the output more than any other single phrase. It cuts the preamble and gets to the point.

## Performance Review Drafts

Performance reviews require specific examples. I feed in my notes throughout the review period:

```
Help me draft a performance review for {name}.

Role: {role}
Review period: {period}

My notes from this period:
{notes}

Write a review that:
1. Opens with an overall assessment (1-2 sentences)
2. Highlights 3 specific accomplishments with impact
3. Identifies 1-2 areas for growth with examples
4. Suggests goals for next period

Use specific examples from my notes. If I haven't provided enough detail for a section, tell me what's missing rather than making things up.
```

The last instruction prevents hallucination. Without it, the model will invent plausible-sounding examples that you then have to delete.

## What I don't use AI for

Some management tasks resist prompting:

- Difficult conversations. The nuance matters too much.
- Career advice. Requires context I can't fully articulate.
- Anything where the person might see the output. It feels impersonal and they'll notice.

The prompts above are for documents and preparation, not for the actual human interaction.

## Iteration

These prompts evolved over months. The first versions produced generic output. Adding constraints, role context, and anti-hallucination rules made them useful.

If a prompt doesn't work, the fix is usually more specific context or tighter constraints. Rarely do you need a longer prompt. Usually you need a more precise one.
