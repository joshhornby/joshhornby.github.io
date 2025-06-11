---
title: Making Impossible States Impossible
date: 2025-01-01 08:00:00
tags: [software-engineering, architecture]
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2025-07-14 T19:00:00+01:00
---

https://www.youtube.com/watch?v=IcgmSRJHu_8

```typescript
// 1. Define each state interface
interface NewTicket {
  status: 'New';
  createdAt: Date;
  reporter: string;
}

interface AssignedTicket {
  status: 'Assigned';
  createdAt: Date;
  reporter: string;
  assignee: string;
  priority: 'Low' | 'Medium' | 'High';
}

interface InProgressTicket {
  status: 'InProgress';
  createdAt: Date;
  reporter: string;
  assignee: string;
  priority: 'Low' | 'Medium' | 'High';
  startedAt: Date;
}

interface ResolvedTicket {
  status: 'Resolved';
  createdAt: Date;
  reporter: string;
  assignee: string;
  priority: 'Low' | 'Medium' | 'High';
  startedAt: Date;
  resolvedAt: Date;
  resolution: string;
}

interface ClosedTicket {
  status: 'Closed';
  createdAt: Date;
  reporter: string;
  assignee: string;
  priority: 'Low' | 'Medium' | 'High';
  startedAt: Date;
  resolvedAt: Date;
  resolution: string;
  closedAt: Date;
  closureReason: 'UserConfirmed' | 'TimedOut' | 'Other';
}

// 2. Union of all ticket states
type TicketState =
  | NewTicket
  | AssignedTicket
  | InProgressTicket
  | ResolvedTicket
  | ClosedTicket;

// 3. Events driving transitions
type TicketEvent =
  | { type: 'ASSIGN'; assignee: string; priority: 'Low' | 'Medium' | 'High' }
  | { type: 'START_WORK'; timestamp: Date }
  | { type: 'RESOLVE'; timestamp: Date; resolution: string }
  | { type: 'CLOSE'; timestamp: Date; reason: ClosedTicket['closureReason'] }
  | { type: 'REOPEN'; timestamp: Date };

// 4. Reducer enforcing only valid transitions
function transition(
  ticket: TicketState,
  event: TicketEvent
): TicketState {
  switch (ticket.status) {
    case 'New':
      if (event.type === 'ASSIGN') {
        return {
          status: 'Assigned',
          createdAt: ticket.createdAt,
          reporter: ticket.reporter,
          assignee: event.assignee,
          priority: event.priority,
        };
      }
      return ticket;

    case 'Assigned':
      if (event.type === 'START_WORK') {
        return {
          status: 'InProgress',
          ...ticket,
          startedAt: event.timestamp,
        };
      }
      return ticket;

    case 'InProgress':
      if (event.type === 'RESOLVE') {
        return {
          status: 'Resolved',
          ...ticket,
          resolvedAt: event.timestamp,
          resolution: event.resolution,
        };
      }
      return ticket;

    case 'Resolved':
      switch (event.type) {
        case 'CLOSE':
          return {
            status: 'Closed',
            ...ticket,
            closedAt: event.timestamp,
            closureReason: event.reason,
          };
        case 'REOPEN':
          return {
            status: 'InProgress',
            ...ticket,
            // keep original startedAt, but you might record a new timestamp elsewhere
          };
        default:
          return ticket;
      }

    case 'Closed':
      if (event.type === 'REOPEN') {
        return {
          status: 'InProgress',
          createdAt: ticket.createdAt,
          reporter: ticket.reporter,
          assignee: ticket.assignee,
          priority: ticket.priority,
          startedAt: event.timestamp,
        };
      }
      return ticket;

    default:
      // Exhaustiveness check – compile‑time error if a state is unhandled
      const _exhaustive: never = ticket;
      return _exhaustive;
  }
}

// 5. Example of an impossible state – TypeScript will error
const impossible: TicketState = {
  status: 'New',
  createdAt: new Date(),
  reporter: 'alice@example.com',
  assignee: 'bob',          // ❌ not allowed on New
  priority: 'High'          // ❌ not allowed on New
};

```
