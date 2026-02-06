---
name: capability-git-guardian
description: Aspect-oriented Git status check to prevent data loss.
---

# Superpower: Git Guardian

**Core Function**: Ensure the project is under version control before allowing significant changes.

## 🧠 Behavior Logic (The Aspect)

### 1. The Check (Robust)
Before executing any **Setup** or **Coding** skill, you MUST verify Git status.
**Do NOT** just look for `.git` folder (it might be in a parent directory).
**Action**: Run `git rev-parse --is-inside-work-tree` (or equivalent check).

### 2. The Intervention
*   **If Command Fails (Not a git repo)**:
    *   **STOP** immediately.
    *   **Alert**: "⚠️ **Security Risk**: This project is not under version control."
    *   **Propose**: "Shall I initialize Git for you? (`git init && git add . && git commit -m 'Initial'`)?"
    *   *Wait for user confirmation before proceeding.*
*   **If Command Succeeds**:
    *   Proceed normally.

### 3. Dirty Check (Optional/Contextual)
*   If you are about to perform a destructive operation (e.g., refactoring), run `git status --porcelain`.
*   If there are uncommitted changes, warn the user: "You have uncommitted changes. Suggest committing before we start."
