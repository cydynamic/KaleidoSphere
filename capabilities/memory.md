---
name: capability-memory
description: Read/Write persistent memory from the file system.
---

# Superpower: Persistent Memory

> **Architecture Note**: This file-based memory system is a **Temporary Simulation** of the Mem0 architecture.
> **Future Roadmap**: This Capability will be replaced by a direct interface with the [Mem0 API](https://mem0.ai/) and [HippoRAG](https://github.com/OSU-NLP-Group/HippoRAG) for vector storage and knowledge graph retrieval.
> **Migration Path**: Ensure all data structure here (Key-Value pairs in Markdown) remains compatible with JSON payloads for future API calls.

**Core Function**: Simulate a "Mem0" experience by reading/writing to the `docs/project-shared/memory/` directory.

## 🧠 Behavior Logic

### 1. Context Loading (Start of Session)
Always read:
*   `docs/project-shared/memory/user_preferences.md` (Coding style, preferred libs).
*   `docs/project-shared/memory/project_context.md` (Key architectural decisions).

### 2. Context Saving (SAFE APPEND ONLY)
**CRITICAL**: NEVER use `write_file` directly to overwrite these files. You will lose history.

**Protocol**:
1.  **Shell Append (Preferred)**:
    `run_shell_command("printf '\n- [DATE] Fact' >> path/to/file.md")`
2.  **Read-Modify-Write (Fallback)**:
    `read_file` -> Concatenate -> `write_file`.

**Format**:
`- [YYYY-MM-DD] <Fact>: <Details>`

### 3. Persistence (Auto-Commit)
*   **Action**: Whenever you update a memory file, you MUST commit it immediately.
*   **Command**: `git add docs/project-shared/memory/ && git commit -m "docs: Update system memory"`

## Example
**User**: "I hate Tailwind, use CSS Modules."
**Agent**: *Executes shell command*:
`printf "\n- [2026-01-27] Preference: No Tailwind, prefer CSS Modules." >> docs/project-shared/memory/user_preferences.md`
**Agent**: *Executes commit*:
`git add ... && git commit ...`
