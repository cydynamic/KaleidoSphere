---
name: capability-progress
description: Manages the global progress dashboard with support for parallel threads and hierarchical tracking.
---

# Superpower: Progress Manager

**Core Function**: Maintain Project State across two levels (Global vs Session).

## 🧠 Hierarchical Tracking (L1 vs L2)

### L1: Global Progress (Shared)
*   **File**: `docs/project-shared/progress.md`
*   **Audience**: Team, Coordinator, Architecture Review.
*   **Content**: Completed Features, Milestones, Explicit Locks.
*   **Format**:
    ```markdown
    | Thread | Task | Status | Branch | Job Link |
    | :--- | :--- | :--- | :--- | :--- |
    | Worker-A | Login | 🟢 Done | feat/login | [Job-01](../../project-active/2026-02-02/archived/job-01-login/) |
    ```

### L2: Session Progress (Active Job)
*   **File**: `docs/project-active/[Date]/job-[ID]-[Name]/tasks.md`
*   **Audience**: Developer, Current Session.
*   **Content**: Granular Checklist, Debugging Steps, Implementation Details.

## 🧠 Behavior Logic

### 1. State Definitions
*   🟢 **Active/Done**: Operating normally or finished.
*   🟡 **Coding/Doing**: Work in progress (Local).
*   🔵 **Review**: Waiting for check.
*   🔴 **Blocked**: Needs help.

### 2. Update Protocol (Lazy Sync / Private First)
*   **Default Mode (Private)**:
    *   Agent operates exclusively in **L2** (`active/.../tasks.md`).
    *   **L1** (`shared/progress.md`) is **NOT** updated for "Doing" states unless explicitly requested (e.g., "Lock this feature" or "Broadcast status").
*   **Completion (Harvest)**:
    *   L1 is updated ONLY when the task is **Finished and Harvested** (via Archivist).
    *   This keeps the shared log clean (Signal > Noise).

### 3. Completion Detection (Auto-Prompt)
*   **Trigger**: When you mark the **last item** in L2 (`tasks.md`) as completed.
*   **Action**: You MUST append a bold prompt to your response:
    > "**❓ Job appears complete. Archive and Harvest context? (Y/N)**"
*   **Exceptions**:
    *   **No L2 Job**: If there is no active `docs/project-active/[Date]/job-*/tasks.md`, do NOT prompt.
    *   **Already Confirmed**: If the user already answered **Y** and the archive/harvest action has been executed, do NOT prompt again.

### 4. Persistence
*   **Action**: Commit immediately after update.
*   **Command**: `git add ... && git commit -m "docs: Update progress"`
