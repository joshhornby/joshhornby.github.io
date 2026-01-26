---
title: Serving Markdown for AI Agents
date: 2026-01-19 08:00:00
tags: [ai, software-engineering]
description: "AI agents prefer clean markdown over HTML. Here's how to serve both from a Jekyll blog."
sitemap:
    lastmod: "2026-01-19T08:00:00+00:00"
    priority: 0.7
    changefreq: 'monthly'
---

Daniel Doubrovkine wrote a post about [serving markdown for AI agents](https://code.dblock.org/2026/01/15/serving-markdown-for-ai-agents.html). When an AI agent fetches a webpage, it has to wade through navigation and nested divs to find the actual content. Why not give it the Markdown source instead?

I've added this to my Jekyll blog.

## The changes

Two small changes make this work on a Jekyll site hosted on GitHub Pages.

First, add a link tag to the HTML head. This tells AI agents where to find the Markdown version:

```html
{% raw %}{% if page.layout == 'post' %}
<link rel="alternate" type="text/markdown" 
      href="{{ page.url | append: '.md' }}">
{% endif %}{% endraw %}
```

Second, copy the Markdown files during the build. GitHub Pages doesn't support custom Jekyll plugins, so this runs in a GitHub Actions workflow:

```yaml
- name: Copy markdown source files
  run: |
    find _posts \( -name "*.md" -o -name "*.markdown" \) | while read file; do
      filename=$(basename "$file")
      if [[ $filename =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})-(.+)\.(md|markdown)$ ]]; then
        slug="${BASH_REMATCH[4]}"
        cp "$file" "_site/${slug}.md"
      fi
    done
```

[The script](https://github.com/joshhornby/joshhornby.github.io/blob/master/.github/workflows/pages.yml) pulls the slug from each post filename and copies it to match the URL. A post at `/serving-markdown-for-ai-agents` gets a companion file at `/serving-markdown-for-ai-agents.md`.

## What this gives you

AI agents visiting a post can now fetch the HTML or find the link tag and grab clean Markdown instead.

The `rel="alternate"` pattern is already common for RSS feeds. Same idea here.

The Markdown files include front matter with title, date, and tags. A format built for reading, not rendering.

## Why bother

The web was built for humans using browsers. AI agents are a different kind of reader. They don't care about your CSS or sidebar. They want content in the simplest form possible.

Serving Markdown alongside HTML changes nothing for human readers. It just makes your content easier for agents to parse.

RSS feeds solved this problem for feed readers years ago. Markdown does the same for a new kind of reader.
