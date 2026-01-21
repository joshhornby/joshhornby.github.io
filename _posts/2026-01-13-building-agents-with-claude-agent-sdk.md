---
title: Building AI Agents with the Claude Agent SDK
date: 2026-01-13 08:00:00
tags: [ai, software-engineering, typescript]
description: "The same engine behind Claude Code, exposed as a library. Build agents that read files, run commands, and work through problems on their own."
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: "2026-01-13T08:00:00+00:00"
---

The [Claude Agent SDK](https://platform.claude.com/docs/en/agent-sdk/overview) is the same engine that powers Claude Code, exposed as a library. It handles the agent loop, provides built-in tools for file operations and terminal commands, and manages context across turns.

> If you're unclear on what separates an agent from a prompt, I covered that in [What is an AI Agent?](/what-is-an-ai-agent).

This post covers building a test generator agent that analyses source files, identifies untested code paths, and writes test files.

## What the SDK provides

Building an agent from the raw API means writing the tool execution loop yourself. Call the model, check if it wants a tool, execute the tool, feed the result back, repeat. Then add retry logic, timeout handling, permission checks, and context window management.

The SDK handles this:

```typescript
import { query } from "@anthropic-ai/claude-agent-sdk";

for await (const message of query({
  prompt: "Generate tests for the UserService class"
})) {
  console.log(message);
}
```

Claude reads files, analyses code, writes tests. You get a stream of what's happening.

## Built-in tools

The SDK includes:

- Read - read any file in the working directory
- Write - create new files
- Edit - make precise edits to existing files
- Bash - run terminal commands
- Glob - find files by pattern
- Grep - search file contents with regex
- WebSearch - search the web
- WebFetch - fetch and parse web pages

Each tool handles edge cases: file permissions, command timeouts, encoding issues.

## Setup

Install the Claude Code CLI. The SDK uses it as its runtime:

```bash
npm install -g @anthropic-ai/claude-code
```

Run `claude` in your terminal and authenticate. Then create your project:

```bash
mkdir test-generator && cd test-generator
npm init -y
npm install @anthropic-ai/claude-agent-sdk
npm install -D typescript @types/node tsx
```

Set your API key:

```bash
export ANTHROPIC_API_KEY=your-api-key
```

## A minimal agent

Create `agent.ts`:

```typescript
import { query } from "@anthropic-ai/claude-agent-sdk";

async function run() {
  for await (const msg of query({
    prompt: "What test files exist in this project?",
    options: {
      model: "sonnet",
      allowedTools: ["Glob", "Read"],
      maxTurns: 50
    }
  })) {
    if (msg.type === "assistant") {
      for (const block of msg.message.content) {
        if ("text" in block) {
          process.stdout.write(block.text);
        }
      }
    }

    if (msg.type === "result") {
      console.log(`\nDone: ${msg.subtype}`);
    }
  }
}

run();
```

Run it:

```bash
npx tsx agent.ts
```

Three things matter:

1. `allowedTools` restricts what Claude can do, so start narrow.
2. `maxTurns` caps the loop. 50 is enough for simple tasks.
3. The message stream shows progress as it happens.

## Understanding the message stream

The `query()` function returns an async generator:

```typescript
for await (const msg of query({ prompt: "..." })) {
  switch (msg.type) {
    case "system":
      if (msg.subtype === "init") {
        console.log("Session:", msg.session_id);
      }
      break;

    case "assistant":
      for (const block of msg.message.content) {
        if ("text" in block) {
          console.log(block.text);
        } else if ("name" in block) {
          console.log(`Using tool: ${block.name}`);
        }
      }
      break;

    case "result":
      console.log(`Cost: $${msg.total_cost_usd.toFixed(4)}`);
      break;
  }
}
```

The `result` message includes cost and token usage.

## A test generator agent

Create `generate-tests.ts`:

```typescript
import { query } from "@anthropic-ai/claude-agent-sdk";

async function generateTests(sourcePath: string) {
  console.log(`Generating tests for: ${sourcePath}\n`);

  for await (const msg of query({
    prompt: `Read ${sourcePath} and generate comprehensive unit tests.
- Use the existing test framework in this project
- Cover edge cases and error conditions
- Follow the testing patterns already established
- Write tests to a new file in the appropriate test directory`,
    options: {
      model: "opus",
      allowedTools: ["Read", "Write", "Glob", "Grep"],
      permissionMode: "acceptEdits",
      maxTurns: 100
    }
  })) {
    if (msg.type === "assistant") {
      for (const block of msg.message.content) {
        if ("text" in block) {
          console.log(block.text);
        } else if ("name" in block) {
          console.log(`[${block.name}]`);
        }
      }
    }

    if (msg.type === "result" && msg.subtype === "success") {
      console.log(`\nCost: $${msg.total_cost_usd.toFixed(4)}`);
    }
  }
}

generateTests(process.argv[2] || "./src/services/auth.ts");
```

The `permissionMode: "acceptEdits"` auto-approves file writes. The agent can create new test files without prompting.

## Structured output

When you need JSON output, define a schema:

```typescript
import { query } from "@anthropic-ai/claude-agent-sdk";

const testPlanSchema = {
  type: "object",
  properties: {
    sourceFile: { type: "string" },
    testFile: { type: "string" },
    testCases: {
      type: "array",
      items: {
        type: "object",
        properties: {
          name: { type: "string" },
          description: { type: "string" },
          type: { type: "string", enum: ["unit", "integration", "edge-case"] }
        },
        required: ["name", "description", "type"]
      }
    },
    coverage: {
      type: "object",
      properties: {
        functions: { type: "number" },
        branches: { type: "number" }
      }
    }
  },
  required: ["sourceFile", "testFile", "testCases"]
};

interface TestPlan {
  sourceFile: string;
  testFile: string;
  testCases: Array<{
    name: string;
    description: string;
    type: "unit" | "integration" | "edge-case";
  }>;
  coverage?: { functions: number; branches: number };
}

async function planTests(sourcePath: string): Promise<TestPlan | null> {
  for await (const msg of query({
    prompt: `Analyse ${sourcePath} and plan tests. Don't write them yet, just plan.`,
    options: {
      model: "sonnet",
      allowedTools: ["Read", "Glob"],
      permissionMode: "bypassPermissions",
      maxTurns: 50,
      outputFormat: {
        type: "json_schema",
        schema: testPlanSchema
      }
    }
  })) {
    if (msg.type === "result" && msg.subtype === "success") {
      return msg.structured_output as TestPlan;
    }
  }
  return null;
}
```

The `outputFormat` option forces valid JSON matching your schema.

## Permissions and safety

Three modes control tool approval:

```typescript
options: {
  // Default - prompts for approval
  permissionMode: "default",

  // Auto-approve file edits
  permissionMode: "acceptEdits",

  // No prompts at all
  permissionMode: "bypassPermissions"
}
```

For more control:

```typescript
options: {
  canUseTool: async (toolName, input) => {
    // Allow all reads
    if (["Read", "Glob", "Grep"].includes(toolName)) {
      return { behavior: "allow", updatedInput: input };
    }

    // Only allow writes to test directories
    if (toolName === "Write") {
      const path = (input as any).file_path || "";
      if (!path.includes("/test/") && !path.includes("/__tests__/")) {
        return {
          behavior: "deny",
          message: "Can only write to test directories"
        };
      }
    }

    return { behavior: "allow", updatedInput: input };
  }
}
```

This restricts the agent to writing only in test directories.

## Subagents for specialised work

Split complex work across specialised agents:

```typescript
import { query, AgentDefinition } from "@anthropic-ai/claude-agent-sdk";

async function generateWithAnalysis(sourcePath: string) {
  for await (const msg of query({
    prompt: `Generate tests for ${sourcePath}.
First use the coverage-analyser to identify gaps.
Then use the mock-generator to create test doubles.
Finally write the tests.`,
    options: {
      model: "opus",
      allowedTools: ["Read", "Write", "Glob", "Grep", "Task"],
      permissionMode: "acceptEdits",
      maxTurns: 150,
      agents: {
        "coverage-analyser": {
          description: "Analyses code to find untested paths",
          prompt: `You analyse source code to identify:
- Functions without test coverage
- Uncovered branches and conditions
- Error handling paths that need tests
Return a list of specific test cases needed.`,
          tools: ["Read", "Grep", "Glob"],
          model: "sonnet"
        } as AgentDefinition,

        "mock-generator": {
          description: "Creates mock objects and test fixtures",
          prompt: `You create test doubles:
- Mock objects for external dependencies
- Fixture data for different scenarios
- Stub implementations for interfaces
Match the testing framework already in use.`,
          tools: ["Read", "Glob"],
          model: "haiku"
        } as AgentDefinition
      }
    }
  })) {
    if (msg.type === "assistant") {
      for (const block of msg.message.content) {
        if ("name" in block && block.name === "Task") {
          console.log(`Delegating: ${(block.input as any).subagent_type}`);
        }
      }
    }
  }
}
```

Using `haiku` for simpler tasks keeps costs down.

## Session continuity

Resume conversations to build on previous work:

```typescript
import { query } from "@anthropic-ai/claude-agent-sdk";

let sessionId: string | undefined;

// First: plan the tests
for await (const msg of query({
  prompt: "Analyse the auth module and plan what tests we need",
  options: {
    model: "opus",
    allowedTools: ["Read", "Glob", "Grep"],
    permissionMode: "bypassPermissions",
    maxTurns: 75
  }
})) {
  if (msg.type === "system" && msg.subtype === "init") {
    sessionId = msg.session_id;
  }
}

// Later: write the tests using the same context
if (sessionId) {
  for await (const msg of query({
    prompt: "Now write the tests we planned",
    options: {
      resume: sessionId,
      allowedTools: ["Read", "Write", "Glob"],
      permissionMode: "acceptEdits",
      maxTurns: 100
    }
  })) {
    // Agent remembers the analysis from before
  }
}
```

## Hooks for custom behaviour

Intercept the agent loop for logging or safety checks:

```typescript
import {
  query,
  HookCallback,
  PreToolUseHookInput
} from "@anthropic-ai/claude-agent-sdk";

const auditLog: HookCallback = async (input) => {
  if (input.hook_event_name === "PreToolUse") {
    const hookInput = input as PreToolUseHookInput;
    const timestamp = new Date().toISOString();
    console.log(`[${timestamp}] ${hookInput.tool_name}`);
  }
  return {};
};

const preventOverwrite: HookCallback = async (input) => {
  if (input.hook_event_name === "PreToolUse") {
    const hookInput = input as PreToolUseHookInput;

    if (hookInput.tool_name === "Write") {
      const path = (hookInput.tool_input as any).file_path || "";

      // Check if file exists
      const fs = await import("fs/promises");
      try {
        await fs.access(path);
        return {
          hookSpecificOutput: {
            hookEventName: "PreToolUse",
            permissionDecision: "deny",
            permissionDecisionReason: `File ${path} already exists`
          }
        };
      } catch {
        // File doesn't exist, allow write
      }
    }
  }
  return {};
};

for await (const msg of query({
  prompt: "Generate tests for the payment service",
  options: {
    model: "sonnet",
    allowedTools: ["Read", "Write", "Glob"],
    maxTurns: 75,
    hooks: {
      PreToolUse: [
        { hooks: [auditLog] },
        { matcher: "Write", hooks: [preventOverwrite] }
      ]
    }
  }
})) {
  // Agent runs with audit logging and overwrite protection
}
```

The `matcher` targets specific tools.

## Custom tools with MCP

Add custom tools via Model Context Protocol:

```typescript
import {
  query,
  tool,
  createSdkMcpServer
} from "@anthropic-ai/claude-agent-sdk";
import { z } from "zod";
import { exec } from "child_process";
import { promisify } from "util";

const execAsync = promisify(exec);

const testRunner = createSdkMcpServer({
  name: "test-tools",
  version: "1.0.0",
  tools: [
    tool(
      "run_tests",
      "Execute tests and return results",
      {
        testFile: z.string().describe("Path to test file"),
        pattern: z.string().optional().describe("Test name pattern to run")
      },
      async (args) => {
        const cmd = args.pattern
          ? `npm test -- ${args.testFile} -t "${args.pattern}"`
          : `npm test -- ${args.testFile}`;

        try {
          const { stdout, stderr } = await execAsync(cmd, { timeout: 30000 });
          return {
            content: [{
              type: "text",
              text: `Tests passed:\n${stdout}`
            }]
          };
        } catch (error: any) {
          return {
            content: [{
              type: "text",
              text: `Tests failed:\n${error.stdout}\n${error.stderr}`
            }]
          };
        }
      }
    ),

    tool(
      "get_coverage",
      "Get test coverage for a file",
      {
        sourcePath: z.string().describe("Source file to check coverage for")
      },
      async (args) => {
        const { stdout } = await execAsync(
          `npm test -- --coverage --collectCoverageFrom="${args.sourcePath}"`
        );
        return {
          content: [{ type: "text", text: stdout }]
        };
      }
    )
  ]
});

for await (const msg of query({
  prompt: "Write tests for utils.ts, run them, and fix any failures",
  options: {
    model: "opus",
    mcpServers: { "test-tools": testRunner },
    allowedTools: [
      "Read",
      "Write",
      "Edit",
      "Glob",
      "mcp__test-tools__run_tests",
      "mcp__test-tools__get_coverage"
    ],
    maxTurns: 150
  }
})) {
  // Agent can now run tests and check coverage
}
```

MCP tools use the `mcp__servername__toolname` prefix.

## File checkpointing

Track changes and roll back on failure:

```typescript
import { query } from "@anthropic-ai/claude-agent-sdk";

for await (const msg of query({
  prompt: "Refactor the test suite to use the new assertions",
  options: {
    model: "opus",
    allowedTools: ["Read", "Edit", "Glob"],
    permissionMode: "acceptEdits",
    maxTurns: 100,
    fileCheckpointing: {
      enabled: true,
      checkpointDir: ".agent-snapshots"
    }
  }
})) {
  if (msg.type === "result") {
    if (msg.subtype === "success") {
      console.log("Refactoring complete");
      console.log("Checkpoint:", msg.checkpointId);
    } else {
      console.log("Failed - changes rolled back");
    }
  }
}
```

The SDK snapshots files before editing. On failure, changes revert automatically.

## Skills

Package agent configurations so you can reuse them:

```typescript
import { query, Skill } from "@anthropic-ai/claude-agent-sdk";

const jestTestGenerator: Skill = {
  name: "jest-tests",
  description: "Generate Jest tests for TypeScript code",
  systemPrompt: `You generate Jest tests for TypeScript code.
Follow these patterns:
- Use describe/it blocks
- Prefer toBe and toEqual assertions
- Mock external dependencies with jest.mock
- Use beforeEach for common setup
- Test both success and error cases
- Name tests clearly: "should [expected behaviour] when [condition]"`,
  tools: ["Read", "Write", "Glob", "Grep"],
  model: "opus",
  outputFormat: {
    type: "json_schema",
    schema: {
      type: "object",
      properties: {
        testFile: { type: "string" },
        testCount: { type: "number" },
        mocks: { type: "array", items: { type: "string" } }
      },
      required: ["testFile", "testCount"]
    }
  }
};

for await (const msg of query({
  prompt: "Generate tests for src/services/email.ts",
  options: {
    skill: jestTestGenerator,
    maxTurns: 100,
    permissionMode: "acceptEdits"
  }
})) {
  // Skill configuration applies automatically
}
```

Define once, reuse across projects.

## Cost tracking

Monitor API spend:

```typescript
for await (const msg of query({ prompt: "..." })) {
  if (msg.type === "result" && msg.subtype === "success") {
    console.log(`Total: $${msg.total_cost_usd.toFixed(4)}`);
    console.log(`Tokens: ${msg.usage.totalTokens}`);

    for (const [model, usage] of Object.entries(msg.modelUsage)) {
      console.log(`  ${model}: $${usage.costUSD.toFixed(4)}`);
    }
  }
}
```

The breakdown shows spend per model when using subagents.

## Production deployment

### Container isolation

```dockerfile
FROM node:20-alpine

WORKDIR /app
COPY package*.json ./
RUN npm ci --production
COPY . .

RUN adduser -D agent
USER agent

CMD ["node", "dist/generator.js"]
```

```yaml
services:
  test-generator:
    build: .
    volumes:
      - ./project:/workspace
    environment:
      - ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
```

### CI integration

```yaml
name: Generate Missing Tests
on:
  push:
    paths:
      - 'src/**/*.ts'

jobs:
  generate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: '20'

      - run: npm ci

      - name: Find files without tests
        id: find
        run: |
          echo "files=$(./scripts/find-untested.sh)" >> $GITHUB_OUTPUT

      - name: Generate tests
        if: steps.find.outputs.files != ''
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
        run: |
          for file in ${{ steps.find.outputs.files }}; do
            node dist/generate-tests.js "$file"
          done

      - name: Create PR
        uses: peter-evans/create-pull-request@v5
        with:
          title: "Add generated tests"
          branch: generated-tests
```

### Rate limiting

```typescript
import Bottleneck from "bottleneck";

const limiter = new Bottleneck({
  maxConcurrent: 1,
  minTime: 1000
});

async function processFiles(files: string[]) {
  for (const file of files) {
    await limiter.schedule(() => generateTests(file));
  }
}
```

### Queuing for scale

```typescript
import { Queue, Worker } from "bullmq";

const testQueue = new Queue("test-generation");

// Producer
await testQueue.add("generate", {
  sourcePath: "./src/services/payment.ts",
  outputDir: "./__tests__"
});

// Worker
const worker = new Worker("test-generation", async (job) => {
  const { sourcePath, outputDir } = job.data;
  const result = await generateTests(sourcePath, outputDir);
  return result;
});
```

## Full example

```typescript
import { query, AgentDefinition } from "@anthropic-ai/claude-agent-sdk";

interface GeneratorResult {
  sourceFile: string;
  testFile: string;
  tests: Array<{
    name: string;
    type: "unit" | "integration" | "edge-case";
    passed?: boolean;
  }>;
  coverage: number;
}

const resultSchema = {
  type: "object",
  properties: {
    sourceFile: { type: "string" },
    testFile: { type: "string" },
    tests: {
      type: "array",
      items: {
        type: "object",
        properties: {
          name: { type: "string" },
          type: { type: "string", enum: ["unit", "integration", "edge-case"] },
          passed: { type: "boolean" }
        },
        required: ["name", "type"]
      }
    },
    coverage: { type: "number" }
  },
  required: ["sourceFile", "testFile", "tests"]
};

export async function generateTests(
  sourcePath: string
): Promise<GeneratorResult | null> {
  console.log(`Processing: ${sourcePath}`);

  for await (const msg of query({
    prompt: `Generate comprehensive tests for ${sourcePath}.

1. Use the analyser to identify what needs testing
2. Write tests covering all identified cases
3. Follow existing test patterns in the project

Be thorough but practical.`,
    options: {
      model: "opus",
      allowedTools: ["Read", "Write", "Glob", "Grep", "Task"],
      permissionMode: "acceptEdits",
      maxTurns: 150,
      outputFormat: { type: "json_schema", schema: resultSchema },
      agents: {
        "analyser": {
          description: "Identifies untested code paths",
          prompt: `Analyse source code for:
- Public functions without tests
- Conditional branches
- Error handling paths
- Edge cases`,
          tools: ["Read", "Grep", "Glob"],
          model: "sonnet"
        } as AgentDefinition
      }
    }
  })) {
    if (msg.type === "assistant") {
      for (const block of msg.message.content) {
        if ("name" in block) {
          if (block.name === "Task") {
            console.log(`  [${(block.input as any).subagent_type}]`);
          } else {
            console.log(`  [${block.name}]`);
          }
        }
      }
    }

    if (msg.type === "result") {
      if (msg.subtype === "success") {
        console.log(`Done. Cost: $${msg.total_cost_usd.toFixed(4)}`);
        return msg.structured_output as GeneratorResult;
      }
      console.log(`Failed: ${msg.subtype}`);
      return null;
    }
  }

  return null;
}

async function main() {
  const source = process.argv[2];
  if (!source) {
    console.error("Usage: tsx generator.ts <source-file>");
    process.exit(1);
  }

  const result = await generateTests(source);

  if (result) {
    console.log(`\nGenerated: ${result.testFile}`);
    console.log(`Tests: ${result.tests.length}`);
    console.log(`Coverage: ${result.coverage}%\n`);

    for (const test of result.tests) {
      console.log(`  [${test.type}] ${test.name}`);
    }
  } else {
    process.exit(1);
  }
}

main();
```

Run it:

```bash
npx tsx generator.ts ./src/services/auth.ts
```

## What this doesn't cover

The SDK includes more:

- Tool result streaming for long-running operations
- Custom model configuration (temperature, top_p)
- Parallel tool execution
- Context window management for large codebases

The [SDK documentation](https://platform.claude.com/docs/en/agent-sdk/overview) has the full API reference.

## When to use this

The SDK fits tasks where an agent needs to:

- Read and understand existing code before acting
- Make multiple decisions based on what it finds
- Use several tools in sequence
- Return structured data you can use in other code

Test generation works well because the agent needs to read source files, understand the testing patterns already in place, decide what to test, and write files that follow those patterns. A single LLM call can't do that.

Tasks that don't need this: one-shot transformations, simple text generation, or anything where you know exactly what tools to call upfront. For those, the raw API is simpler.

The SDK pays off when you can't predict the steps upfront. Let the agent figure it out.
