---
title: Making Impossible States Impossible
date: 2025-07-21 08:00:00
written_with_ai: true
tags: [software-engineering, developer-experience]
description: "Design your data types and APIs so that invalid program states can't be constructed at all. The compiler enforces it for you at build time."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-08-02T08:00:00+00:00"
---

I first encountered this concept in Richard Feldman's talk _[Making Impossible States Impossible](https://www.youtube.com/watch?v=IcgmSRJHu_8)_. It changed how I design software. Years later, I still think it's one of the most underrated ideas in our industry.

Making impossible states impossible means designing your types and APIs so invalid program states can't exist. The compiler enforces correctness at build time.

Why does this matter?

- No checks for impossible cases. They're unrepresentable
- Fewer bugs, tests, and code. The compiler does the work
- Clear intent. Anyone can see which states are allowed

An example without thinking about impossible states:

```typescript
interface UserSession {
  isLoggedIn: boolean
  username: string
}

// Example usage:
const session1: UserSession = { isLoggedIn: false, username: 'alice' }
// impossible: how can you have a username when not logged in?

function render(session: UserSession) {
  if (session.isLoggedIn) {
    console.log(`Welcome, ${session.username}`)
  } else {
    console.log('Please log in')
  }
}
```

The problem with the code above is nothing stops you constructing `{ isLoggedIn: false, username: 'alice' }` or `{ isLoggedIn: true, username: '' }`. So, you must add runtime checks everywhere to handle those invalid combinations.

Now, the same example but considering impossible states:

```typescript
// Discriminated union: only valid states are representable
type UserSession =
  | { status: 'loggedOut' }
  | { status: 'loggedIn'; username: string }

// Example usage:
const session1: UserSession = { status: 'loggedOut' }
// no username allowed here

const session2: UserSession = { status: 'loggedIn', username: 'alice' }
// always has a username when logged in

function render(session: UserSession) {
  switch (session.status) {
    case 'loggedIn':
      console.log(`Welcome, ${session.username}`)
      break
    case 'loggedOut':
      console.log('Please log in')
      break
  }
}
```

## The benefits of designing with types

The shift comes when you stop treating impossible cases as runtime problems. Make them design problems. Instead of defensive checks hoping no one passes `{ isLoggedIn: false, username: 'alice' }`, encode the rules in your types. The compiler becomes your safety net.

It's a small shift that pays off quickly. Whole categories of bug vanish, and reviewers stop asking what happens if a logged-out user has a username, because the code can't represent it. There are fewer branches to hold in your head and no debates about whether a state should be possible.

The benefit compounds the further you take it. New joiners read the types and learn what's allowed and what isn't, without needing anyone to explain it. Refactoring gets easier, because changing a type shows you every affected line. And you stop writing tests for scenarios that can't happen, which leaves more room for the business logic that can go wrong.

Most bugs aren't edge cases. They're "shouldn't be possible, but the code allowed it." Making impossible states impossible prevents entire bug categories from existing. The compiler won't thank you, but your future self will.
