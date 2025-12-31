---
title: Git Worktrees for Parallel AI Agent Work
date: 2026-01-13 08:00:00
tags: [ai, software-engineering]
description: "Using Git worktrees to give coding agents their own isolated workspace without the overhead of multiple clones."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-01-13T08:00:00+00:00"
---

Last week I had [Claude Code](https://code.claude.com/docs/en/overview) working on a refactor in one terminal while I asked it to add a new feature in another. Both tasks touched the same files. The result was predictable: merge conflicts, lost changes, and 20 minutes spent untangling the mess.

After some googling I discovered [Git worktrees](https://git-scm.com/docs/git-worktree).

## The problem with parallel AI agents

AI coding agents like Claude Code work by reading and writing files directly. They're fast, thorough, and increasingly autonomous. But they have no awareness of each other.

When you run two agents against the same working directory, you get:

- Race conditions on file writes
- Partial changes overwritten by the other agent
- Git status becoming a tangled mess of unrelated modifications
- No clean way to commit one agent's work without including the other's half-finished changes

The naive solution is to clone the repository multiple times. That works, but it's wasteful. Each clone duplicates the entire .git directory, creating coordination headaches when you want to pull changes between them.

## Worktrees: one repository, multiple working directories

Git worktrees let you check out multiple branches simultaneously, each in its own directory, all sharing the same .git metadata. You get the isolation of separate clones without the duplication.

```bash
# From your main repo, create a new worktree for a feature branch
git worktree add -b feature-auth ../myrepo--feature-auth
```

Now you have two directories:
- `myrepo/` on your original branch
- `myrepo--feature-auth/` on the new branch

Both point to the same repository. Commits made in either are immediately visible to the other. But the working directories are completely isolated.

## Why not just use branches?

Branches solve a different problem. They let you track parallel lines of development, but you can only have one branch checked out at a time in a single working directory.

If Agent A is halfway through modifying `auth.py` on branch `feature-login`, and you want Agent B to start work on `feature-search`, you're stuck. You'd need to stash or commit Agent A's incomplete changes before switching branches. Then switch back when you want to continue. That's not parallel work. That's context-switching with extra steps.

Worktrees give you multiple checked-out branches simultaneously. Each branch lives in its own directory with its own working tree. Agent A keeps working in one directory while Agent B works in another. No stashing, no switching, no coordination required.

## One agent per worktree

Before starting a new AI agent task, spin up a dedicated worktree:

```bash
# Terminal 1: Main feature work
cd myrepo
claude

# Terminal 2: Parallel refactor
git worktree add -b refactor-payments ../myrepo--refactor-payments
cd ../myrepo--refactor-payments
claude
```

Each agent now has its own sandbox. They can make conflicting changes to the same files without stepping on each other. When both finish, you merge their branches using normal git workflows.

I keep two functions in my [dotfiles](https://github.com/joshhornby/dotfiles) to speed up the workflow:

```bash
# Create a new worktree and branch, then cd into it
ga() {
  local branch="$1"
  local base="$(basename "$PWD")"
  local worktree_path="../${base}--${branch}"

  git worktree add -b "$branch" "$worktree_path"
  cd "$worktree_path"
}

# Remove worktree and branch when done
gd() {
  local cwd worktree root branch
  cwd="$(pwd)"
  worktree="$(basename "$cwd")"
  root="${worktree%%--*}"
  branch="${worktree#*--}"

  cd "../$root"
  git worktree remove "$worktree" --force
  git branch -D "$branch"
}
```

## When this matters most

The value compounds with certain workflows:

- Running code review agents while continuing development on main
- Experimenting with alternative implementations without polluting your branch
- Having one agent write tests while another writes implementation
- Keeping a "clean" worktree for quick fixes while a larger refactor runs elsewhere

## What worktrees don't solve

Worktrees isolate file changes, not everything. If your agents are running database migrations, starting servers on the same ports, or writing to shared external resources, you'll still have conflicts. The isolation is at the filesystem level, not the system level.

For most AI-assisted coding tasks, filesystem isolation is enough. The agents read code, propose changes, and write files. Worktrees keep this writes from colliding.

## The bigger picture

As AI agents become more capable, we'll run more of them in parallel. The bottleneck shifts from "how fast can I type" to "how many parallel workstreams can I coordinate." Git worktrees are a small piece of infrastructure that makes that coordination tractable.

The tools we've built for human developers, version control, branching, merging, turn out to work well for AI agents too. We just need to use them more aggressively.
