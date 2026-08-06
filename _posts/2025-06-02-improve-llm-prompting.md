---
title: Improve LLM prompts using LLMs
date: 2025-06-02 08:00:00
tags: [ai, developer-experience]
description: "Small changes to a prompt often make a large difference to the output. This is the workflow I use to improve my own prompts, especially for technical tasks."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

I've been experimenting with ways to improve how I interact with large language models (LLMs) like ChatGPT. Small changes to a prompt often make a large difference to the output. This is the workflow I've settled on for improving my prompts, especially for technical or complex tasks.

## Setting up a prompt engineering environment

1. **Create a new "project" in ChatGPT** - A dedicated workspace gives you a clean context where the model remembers your earlier interactions, which matters when you're iterating on a prompt.
2. **Upload context** - I use [Google's Prompt Engineering whitepaper](https://www.kaggle.com/whitepaper-prompt-engineering) as the foundation. It sets out the principles and techniques concisely. Upload it as a file into the project so the model can refer back to it.
3. **Set instructions** - Then define system instructions to steer the model's behaviour. Here's the kind of instruction I'll set:

    ```text
    You are a tool to generate excellent prompts that will greatly improve 
    output compared to what is given as input. You will use the attached book
    on Prompt Engineering to formulate these prompts and you will return the improved
    prompt along with your reasoning for why it is better.
    
    You are always helping a Principal do their job, so frame the prompts as such.
    ```

Some actual examples of where I've used this recently:

- Improve prompts for summarising technical docs
- Debug poorly performing prompts by asking why they don't work

In each case, having the model work from the whitepaper's framing made the responses clearer and more grounded in actual technique.

Here's an actual example of this in action _(thankfully not a real situation)_. 

**Initial prompt:**

```text
Write me a prompt to plan a retro on a recent incident at work which involved downtime of our main database
```
<br />
**Response:**

```text
### Improved prompt

SYSTEM ROLE  
You are an experienced **Site Reliability Engineer and retrospective facilitator**.  
Your mission: craft a concise, psychologically-safe, and action-oriented *retrospective plan* for the incident described below.

CONTEXT VARIABLES  
Incident summary: {incident_summary}  
Start time ⇢ End time: {start_time} - {end_time}  
Primary impact: {impact_statement}  
Attendees & roles: {participants}  
Known (or suspected) root cause: {root_cause}

INSTRUCTIONS (OUTPUT MUST BE MARKDOWN)
1. Produce a document with these H1/H2 headings *in order*:

    - # Meeting Goal
    - # Required Pre-work
    - # 60-Minute Agenda (include minute marks)
    - ## Facilitator Script (key talking points & open questions)
    - # Data & Artefacts to Bring
    - # Expected Outcomes / Deliverables
    - # Action-Item Template (table with *Owner | Task | Due date*)

2. Emphasise **blameless inquiry**, shared learning, and prevention.
3. Keep total length ≤ 450 words.
4. Return *only* the Markdown document no extra commentary.

---

### Why this prompt is stronger

| Guideline leveraged                                                                              | How the prompt applies it                                                                                        |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| **Be specific about the output** - spell out structure, style and length                         | We enumerate exact headings, Markdown format and a 450-word cap, so the model knows *precisely* what to produce  |
| **Role + system prompting** - give the model an identity & purpose                               | Declaring the model an *SRE facilitator* primes domain tone and expertise                                        |
| **Use variables in prompts** - make it reusable                                                  | Place-holders like `{incident_summary}` mean the same template works for any future incident                     |
| **Positive instructions over constraints** - tell the model what to *do*, not a list of "don'ts" | Clear, affirmative steps guide behaviour while keeping creative latitude                                         |
| **Design with simplicity** - concise, action verbs, no fluff                                     | Short sections and numbered rules reduce ambiguity and cognitive load                                            |
| **Control token length** - avoid rambling answers                                                | An explicit 450-word limit aligns with best-practice token control                                               |

Use the variable block to drop in the real incident details, send the prompt, and you'll receive a ready-to-run retro agenda that's tight, blameless and outcome-focused.
```

<br />

## Why this works

Three things are doing the work here. The whitepaper gives you and the model a shared reference point, so its suggestions come from a known set of techniques rather than whatever it guesses you want. The system instructions keep it in the same role between prompts. And because it's a project, the context persists, so you can refine the same prompt over several rounds instead of starting again each time.

