---
title: Making Impossible States Impossible
date: 2025-07-21 08:00:00
tags: [software-engineering, developer-experience]
description: "The idea of making impossible states impossible in simple terms, means designing your data types and APIs so that certain invalid or nonsensical program states simply can't happen, the compiler enforces it for you at build time."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2025-07-22 T19:00:00+01:00"
---

I first came across this concept in Richard Feldman's talk _[Making Impossible States Impossible](https://www.youtube.com/watch?v=IcgmSRJHu_8)_. It completely changed the way I think about designing software. Since then, it's shaped how I write code, and honestly, I think it's one of the most underrated ideas in the industry.

The idea of making impossible states impossible in simple terms means designing your data types and APIs so that certain invalid or nonsensical program states simply can't happen, the compiler enforces it for you at build time.

Why does this matter?

- You don't need to write checks or handle impossible cases, they're unrepresentable and thus eliminated from your code.
- Fewer bug fixes, fewer tests, less code, the compiler does the heavy lifting.
- Your code becomes clearer and more maintainable because you and your team can instantly see "only these states are allowed here".

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

The real shift comes when you stop treating these "impossible" cases as a runtime problem and start treating them as a design problem. Rather than constantly adding defensive if-else checks, hoping no one will ever pass in `{ isLoggedIn: false, username: 'alice' }` you push the burden up front, into your types. The compiler is now your safety net, not your tests or code reviews.

It's a small, but powerful mental shift: suddenly, a whole class of bugs just can't exist. You don't even think about them. Reviewers don't need to ask, "What happens if this function gets a loggedOut user with a username?" The code simply can't represent that situation. Fewer mental branches. Fewer "should this be possible?" debates.

The more you lean into this approach, the more you see the benefit compound:

- **Onboarding new engineers**: The shape of the types tells the story. What can happen? What's forbidden? You don't need tribal knowledge or a wall of comments.
- **Refactoring with confidence**: Change a type, and the compiler points out everywhere you need to update. You can evolve your codebase without fear of missing some edge-case.
- **Testing for what matters**: You stop wasting time testing "should never happen" scenarios and focus on the actual business logic

Most bugs aren't random or wild-edge-cases, they're "shouldn't be possible, but the code allowed it". Making impossible states impossible is the quiet work that prevents entire categories of bugs from existing in the first place. The compiler won't thank you, but your future self (and team) will.
