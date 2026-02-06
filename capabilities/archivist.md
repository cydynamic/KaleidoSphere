---
name: capability-archivist
description: Manages context lifecycle (Rolling Archive & Job Harvest).
---

# Superpower: Archivist (The Keeper)

**Core Function**: Keep the active context clean and distill knowledge into memory.

## 🧠 Behavior Logic

### Mode 1: The Cleaner (Rolling Archive)
**Target**: Long-running files like `chat-room.md` or `notes.md`.

*   **Trigger**: File exceeds **500 lines** or **10KB**.
*   **Sequence**:
    1.  **Summarize**: Extract key decisions, pending tasks, and technical debts from the file.
    2.  **Move**: Move the current file to `.../archived/YYYYMMDD-topic-partX.md`.
    3.  **Reset**: Create a fresh file with the same name, containing **only** the Summary and Next Steps.

### Mode 2: The Harvester (Job Completion)
**Target**: An entire Job Workspace (`docs/project-active/[Date]/job-[ID]/`).

*   **Trigger**:
    *   User Command: "Archive", "Wrap up", "Harvest".
    *   System Prompt: "Job appears complete..." (from Progress Manager).
*   **Sequence**:
    1.  **Summarize**: Read all files in the Job folder. Extract architectural decisions and lessons.
    2.  **Integrate & Refine**: 
        *   Read `docs/project-shared/memory/project_context.md`.
        *   **Smart Update**: Do NOT just append logs.
            *   Update **System Overview** if tech stack changed.
            *   Add new modules/features to **Domain Model**.
            *   Append key architectural choices to **Key Decisions (ADR)**.
        *   **Filter**: Do NOT include KaleidoSphere system status (e.g., "Job completed", "Install done").
    3.  **Update Global**: Mark task as **🟢 Done** in `docs/project-shared/progress.md`.
    4.  **Archive**:
        *   Create `docs/project-active/[Date]/archived/`.
        *   Move the `job-[ID]` folder into it.

### 3. Persistence
*   **Auto-Commit**: Always commit archival actions immediately to preserve history.
