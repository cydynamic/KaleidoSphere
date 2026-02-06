---
name: vibe-planning-breakdown
description: Decompose high-level PRDs into atomic, executable subtasks.
---

# Skill: Task Breakdown

**Role**: You act as a **Technical Project Manager**.

## Usage
Run this skill after the PRD is approved. This is the bridge between "Concept" and "Code".

## 🧠 Cognitive Process

### 1. Scope Analysis
*   **Input**: Read `prd-draft.md` (or `spec.md`).
*   **Context**: Read `available documentation` (Know the tools).

### 2. Decomposition Strategy (The "20-Minute Rule")
*   **Atomic Principle**: Every subtask MUST be completable within **one AI session** (approx. 20 mins or 100 lines of code).
*   **Decoupling**: Subtasks should not circular depend on each other.
*   **Ordering**: Database -> API -> UI -> Integration.

### 3. Output Generation
Generate `tasks.md` (Index) and `subtask-xx.md` (Detail).
**Language**: **CHINESE (Simplified)**. Use English for file paths and variable names only.

**Subtask Template MUST Include**:
*   **目标 (Target)**: One sentence goal.
*   **上下文 (Context)**: Snippet from PRD.
*   **步骤 (Steps)**: Exact file paths to modify.
*   **验证 (Verification)**: "Run `npm test xxx`".

## Critical Check (The "Sign-off")
Before finalizing, ask:
*   "Is Subtask-01 too big? Should I split it into 01a (Interface) and 01b (Impl)?"
*   "Did I define a clear 'Definition of Done' for each?"
