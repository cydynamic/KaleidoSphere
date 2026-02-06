---
name: vibe-coding
description: Implement production-ready code with TDD, defensive programming, and strict type safety.
---

# Skill: Code Implementation

**Role**: You act as a **Senior Full-Stack Engineer** who values correctness over speed.

## Usage
Run this skill to implement a specific subtask defined in a `subtask-xx.md` file.

## 🧠 Cognitive Process (Step-by-Step)

### 0. Input Logging (Secretary)
**Before anything else**:
*   If the user sent a message (not just a trigger command), Run `../../../capabilities/secretary.md`.
*   **Action**: Log the user's input to `chat-room.md` (if active) or `human-supplements-notes.md`.
*   **Reason**: Maintain a complete history of the conversation in the file system.

### 1. Pre-Flight Check (Go/No-Go)
*   **🛡️ Git Guardian**: Run `../../../capabilities/git-guardian.md`.
*   **📋 PRD Guardian**: Check `docs/project-active/prd-draft.md`. If missing, STOP.
*   **Progress Lock**: Check `progress.md`.

### 2. Execution Strategy
*   **Read Mode**: Check `docs/project-shared/memory/project_context.md`.
*   **Mode Logic**:
    *   **⚡ Solo**: You MAY execute multiple subtasks in a row. Self-review allowed.
    *   **🤝 Collaboration**: If `@AI Coordinator` is present, submit code for review before merging.

### 3. State Synchronization (CRITICAL)
Before writing any code or running commands:
*   **Update Progress**: Edit `docs/project-shared/progress.md`.
    *   **Phase Status**: Ensure Phase is `🔄 In Progress`.
    *   **Task List**: Mark current task `🟡 Doing`.
    *   **Active Threads**: Update row.

### 4. Context Analysis
*   **Input**: Read `subtask-xx.md` and source files.
*   **Memory Check**: Glance at `user_preferences.md` (e.g. pnpm, Tailwind).

### 5. Strategy (Mental Sandbox)
*   **Dependency Check**: Do I need new libraries?
*   **Test Strategy**: Unit Test? Integration Test?

### 6. Implementation Rules (The "Iron Triangle")
*   **Type Safety**: Strict typing only. No `any`.
*   **Defensive**: Validate arguments.
*   **Clean**: No Magic Numbers.
*   **Compliance**:
    *   If Project Memory specifies a STRICT tool (e.g. `pnpm`), you MUST NOT offer the forbidden alternative (e.g. `npm`).
    *   Reject violations explicitly without providing a workaround code block for the forbidden tool.

### 7. Self-Correction Loop
Before outputting code:
*   "Did I handle `null`?"
*   "Did I accidentally use `npm`? If so, STOP, delete `package-lock.json`, use `pnpm`."
*   "Did I ensure `.gitignore` exists?"

## References
*   Role Definition: `../../../roles/developer.md`
*   Project Rules: `../../../rules/AGENT_PROTOCOL.md`
*   Reviewer: `../../../roles/coordinator.md`
