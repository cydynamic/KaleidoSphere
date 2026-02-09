---
name: capability-install-strategy
description: Decides safe installation steps and conflict handling for KaleidoSphere.
---

# Superpower: Install Strategy

**Core Function**: Make installation safe, explicit, and user-confirmed.

## Decision Rules
1. **No Silent Actions**: Any conflict or risk must be surfaced to the user.
2. **User First**: Provide reference options; user can propose custom handling.
3. **Minimal Impact**: Avoid overwriting user files without consent.
4. **One-Time Prompt**: If not installed and user has opted out, do not ask again.
5. **Install Record**: After successful install, record it in `docs/start.md`.

## Pre-Install Checks
- Check if `docs/` exists and whether it contains user content.
- Check `.gitignore` status and whether it ignores `docs/` or `docs/project-active/`.
- Check if project has `.git`.
- Check user opt-out in `docs/project-active/memory/user_preferences_local.md`.

## Required Output
Before installing, output a **table** listing:
- Path, Type, Purpose, Risk/Note

## Conflict Handling
- If `docs/` already exists, warn about potential collisions.
- If `.gitignore` ignores `docs/`, warn that commits may fail.
- If `.git` is missing, recommend `git init`.

## Path Remap Policy
If user wants a different path:
- Accept a custom root (e.g., `docs/kaleidosphere/`).
- Adjust **all relative paths** in the install plan.
- Record the mapping in `docs/project-shared/memory/project_context.md` under a
  "Project Preferences" section.

## Non-Installed Projects (Ad Prompt)
If `start.md` exists but `.kaleidosphere/` is missing, provide a one-time prompt:
1. Ask whether to enable KaleidoSphere.
2. If yes, provide:
   - `git clone git@github.com:cydynamic/KaleidoSphere.git .kaleidosphere`
   - `请读取 .kaleidosphere/docs/install.md 并安装系统。`
3. If the user declines, record opt-out in
   `docs/project-active/memory/user_preferences_local.md` and stop asking.

## Stop Conditions
- If user declines installation or refuses required safeguards, stop and report.
