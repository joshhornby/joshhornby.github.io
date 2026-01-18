---
title: Serving Markdown for AI Agents
date: 2026-01-19 08:00:00
tags: [ai, software-engineering]
description: "Bots prefer clean markdown over HTML. Here's how to serve both from a Jekyll blog."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
---

Daniel Doubrovkine wrote a post about [serving markdown for bots](https://code.dblock.org/2026/01/15/serving-markdown-for-ai-agents.html) that caught my attention. The idea is simple: when a bot fetches a webpage, it has to wade through navigation, scripts, and nested divs to find the actual content. Why not just give it the markdown source instead?

I've done the same on this blog. Here's how.

## The changes

Two small changes make this work on a Jekyll site hosted on GitHub Pages.

First, add a link tag to the HTML head. This tells bots where to find the markdown version:

```html
{% raw %}{% if page.layout == 'post' %}
<link rel="alternate" type="text/markdown"
      href="{{ page.url | append: '.md' }}"
      title="Markdown">
{% endif %}{% endraw %}
```

Second, copy the markdown files during the build. GitHub Pages doesn't support custom Jekyll plugins, so this runs in a GitHub Actions workflow:

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

The script pulls the slug from each post filename and copies it to match the URL. A post at `/serving-markdown-for-ai-agents` gets a companion file at `/serving-markdown-for-ai-agents.md`.

## The result

Bots now have two options when they visit a post:

1. Fetch the HTML for the full rendered page
2. Find the link tag and fetch clean markdown instead

The `rel="alternate"` pattern is already common for RSS feeds. Using it for markdown follows the same idea.

The markdown files include front matter with title, date, and tags. Bots get the content in a format built for reading, not rendering.

## Why bother

The web was built for humans using browsers. Bots are a different kind of reader. They don't care about your CSS or sidebar. They want the content in the simplest form possible.

Serving markdown alongside HTML costs nothing for human readers. It just makes your content easier for bots to read.

This is like adding RSS feeds years ago. A second format for a different kind of reader. The pattern is familiar, even if the reader is new.
