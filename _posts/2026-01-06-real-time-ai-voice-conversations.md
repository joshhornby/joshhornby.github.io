---
title: Building Production-Grade Real-Time AI Voice Conversations
date: 2026-01-06 08:00:00
tags: [ai, twilio, software-engineering]
description: "Patterns for handling interruptions, chunking speech, and detecting call endings when building voice AI with Twilio and OpenAI."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-01-05T08:00:00+00:00"
---

> This is the second post about building [Cold Call Coach](https://coldcall.coach). The first covered [eval testing LLMs in PHPUnit](/2025/12/24/eval-testing-llms-in-phpunit/).

Real-time voice AI has a problem that text chat doesn't: humans expect conversational norms that took evolution millions of years to establish. When someone interrupts you, you stop talking. When there's a pause, you wait. When the conversation ends, both parties know it. Violate any of these, and the interaction feels broken even if it's technically working.

I ran into this building [Cold Call Coach](https://coldcall.coach), a sales training app where users practice cold calls against an AI prospect via Twilio. The first beta tester interrupted the AI mid-sentence. It kept talking. Then it responded to something she'd said thirty seconds earlier. The conversation became incoherent within three turns.

The patterns that follow emerged from fixing these failures. They're specific to Twilio and OpenAI, but the underlying challenges apply to any real-time voice system.

## Stream interruption handling

When a user talks over the AI mid-response, you need to cancel the current OpenAI stream immediately. If you don't, you're burning tokens on a response nobody will hear. Worse, you lose context. The user said something important, but you're still processing stale input.

The solution uses `AbortController` to cancel in-flight streams:

```typescript
if (state.isProcessing && state.currentStreamController) {
  console.log('New prompt received while processing - canceling current stream');
  state.currentStreamController.abort();

  // Remove the last user message from history to combine with new text
  const lastMessage = state.conversationHistory[state.conversationHistory.length - 1];
  if (lastMessage?.role === 'user') {
    state.conversationHistory.pop();
    userText = lastMessage.content + ' ' + userText;
    console.log('Combined user message:', userText);
  }
}
```

The message combining is crucial. Say the user starts with "I'm calling about your current CRM" but interrupts themselves to add "specifically the reporting features". Without combining, you'd lose the first half. With combining, the AI sees the full context: "I'm calling about your current CRM specifically the reporting features".

Twilio sends an `interrupt` event when the user starts speaking over the AI. Handle it immediately:

```typescript
case 'interrupt':
  console.log('User interrupted - stopping stream');
  state.isInterrupted = true;
  if (state.currentStreamController) {
    state.currentStreamController.abort();
  }
  break;
```

The `isInterrupted` flag prevents race conditions. Without it, the streaming loop might send another chunk to TTS before the abort completes. The user hears a fragment of speech that makes no sense.

State management matters here. You need at least three flags:
- `isProcessing`: Are we currently streaming a response?
- `isInterrupted`: Did the user interrupt?
- `currentStreamController`: Reference to abort the active stream

Get any of these wrong, and you'll have conversations where the AI responds to questions from two turns ago.

## Sentence-aware chunking for TTS

Sending every token to Twilio as it arrives creates choppy, robotic speech. The TTS engine receives "I" then "think" then "we" and tries to synthesise each fragment. The result sounds like a bad mobile connection.

The fix is buffering. Collect tokens until you have a complete phrase, then send it all at once:

```typescript
export const WORDS_PER_CHUNK = 4;
export const FIRST_CHUNK_WORDS = 2;

export function shouldSendChunk(
  buffer: string,
  newContent: string,
  sentFirstChunk: boolean = true
): boolean {
  const wordCount = countWords(buffer);
  const chunkThreshold = sentFirstChunk ? WORDS_PER_CHUNK : FIRST_CHUNK_WORDS;
  const hasPunctuation = newContent.length > 0 && containsPunctuation(newContent);
  const bufferEndsWithAbbreviation = endsWithAbbreviation(buffer);

  return wordCount >= chunkThreshold || (hasPunctuation && !bufferEndsWithAbbreviation);
}
```

Notice the `FIRST_CHUNK_WORDS` constant. The first chunk is smaller (2 words) for responsiveness. Users expect near-instant feedback. A long pause before any speech feels broken. After the first chunk, you can afford larger chunks (4 words) because the user knows the AI is responding.

The streaming loop applies this logic:

```typescript
for await (const chunk of result.textStream) {
  if (state.isInterrupted) {
    console.log('Stream interrupted, stopping sends');
    break;
  }

  const content = chunk;
  fullResponse += content;
  wordBuffer += content;

  if (shouldSendChunk(wordBuffer, content, state.sentFirstChunk)) {
    const textToSend = wordBuffer.trim();
    if (textToSend) {
      const isLast = hasEndPunctuation(textToSend);
      sendTextChunk(socket, textToSend, isLast);
      wordBuffer = '';
      state.sentFirstChunk = true;
    }
  }
}
```

The `isLast` flag tells the TTS engine this chunk ends a sentence. It adjusts prosody accordingly, adding a natural pause before the next sentence. Without this, the AI speaks in one continuous monotone.

## End-of-call detection via marker tokens

The AI prospect decides when to end the call. Maybe the user successfully booked a meeting. Maybe they were too pushy and the prospect hung up. Either way, the AI signals this by including `[END_CALL]` in its response.

Detecting the marker seems trivial until you consider abbreviations. "Dr. Smith will see you now" has a period, but it's not a sentence ending. Your end-of-sentence detection needs to ignore these:

```typescript
const ABBREVIATIONS = [
  'Mr', 'Mrs', 'Ms', 'Dr', 'Prof', 'Jr', 'Sr',
  'Inc', 'Corp', 'Ltd', 'Co', 'St', 'Ave', 'Blvd',
  'vs', 'etc', 'approx', 'dept', 'est', 'govt', 'no', 'vol',
];

const ABBREVIATION_PATTERN = new RegExp(
  `\\b(${ABBREVIATIONS.join('|')})\\.\\s*`,
  'i'
);

export function hasEndPunctuation(text: string): boolean {
  const trimmed = text.trim();
  if (!/[.!?]$/.test(trimmed)) {
    return false;
  }
  // Don't treat abbreviation periods as sentence endings
  if (endsWithAbbreviation(trimmed)) {
    return false;
  }
  return true;
}
```

The marker detection strips the token from the output and sets a flag:

```typescript
export const END_CALL_PATTERN = /\[?END[_\s]?CALL\]?/gi;

if (END_CALL_PATTERN.test(wordBuffer)) {
  state.shouldEndCall = true;
  wordBuffer = wordBuffer.replace(END_CALL_PATTERN, '').trim();
  END_CALL_PATTERN.lastIndex = 0;
  console.log('End call marker detected - will terminate after response');
}
```

Note the `lastIndex` reset. JavaScript regex with the `g` flag maintains state between calls. Without resetting, subsequent tests might fail unexpectedly. This is a classic gotcha that causes intermittent bugs in production.

After the response completes, check whether to end the call:

```typescript
if (state.shouldEndCall && !state.isInterrupted) {
  console.log('AI ending the call');
  setTimeout(() => {
    sendEndCall(socket);
  }, 500);
}
```

The 500ms delay gives the TTS time to finish the final sentence. Ending immediately would cut off the AI mid-word.

## Lessons from production

These three patterns emerged from watching real users break the app. Each one seems obvious in retrospect, but I didn't find them in any tutorial or documentation.

A few other things that mattered:

- Log everything. When voice conversations go wrong, reproducing the issue is nearly impossible. Timestamps, message content, state flags. All of it. You'll need it.

- Test with bad connections. Users on mobile with spotty signal will have packets arrive out of order, duplicated, or not at all. Your state machine needs to handle rubbish input gracefully.

- Latency budgets are tight. Users tolerate about 300ms of silence before they think something broke. Every millisecond in your processing pipeline matters. Profile aggressively.

Real-time voice is hard in ways that text chat isn't. Humans expect conversational norms that took evolution millions of years to establish. When an AI violates those norms, it feels broken even if it's technically working.
