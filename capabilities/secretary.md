---
name: capability-secretary
description: Enables Proxy Recording of user inputs into context files.
---

# Superpower: Secretary Mode

**Core Function**: You act as a proxy for the user, recording their natural language inputs into the project's persistent memory.

## 🧠 Behavior Logic

### 1. Pre-Flight Check (The Switch)
Before recording anything automatically:
1.  **Read Preference**: Check `docs/project-shared/memory/user_preferences.md`.
2.  **Check Toggle**: Look for `AutoRecord: true`.
3.  **Decision**:
    *   If **False/Missing**: **SKIP** automatic recording. (Only record if user explicitly says "Record this" or "Take a note").
    *   If **True**: Proceed to record.

### 2. Record Action (The "Proxy")
When the user sends **ANY message** (only if AutoRecord is **ON**):

1.  **Determine Target**:
    *   **Priority**: `docs/project-active/[Date]/chat-log.md` (single rolling file for the day).
    *   **Fallback**: `docs/project-shared/memory/human-supplements-notes.md`.

2.  **Append**:
    *   Use `run_shell_command` with `cat >>` (append).
    *   **Format**:
        ```markdown
        ### 👤 User
        > 🕒 <Current Time>

        <User's Original Message>

        ---
        ```

3.  **Rolling Rule** (for `chat-log.md` only):
    *   **Threshold**: > **500 lines** OR **10KB**.
    *   **Action**:
        1) Move to `docs/project-active/[Date]/archived/chat-log-YYYYMMDD-partX.md`.
        2) Create a fresh `chat-log.md` with only **Summary + Next Steps**.

### 3. Persistence
*   **Auto-Commit**: Commit the change immediately.
*   **Note**: If writing to `project-active`, commit to the Nested Git repo **only if initialized**. If not initialized, report and skip auto-commit.

### 4. Respond Action
*   Acknowledge the record: "I've logged your feedback."
