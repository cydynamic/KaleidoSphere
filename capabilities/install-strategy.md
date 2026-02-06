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

## Pre-Install Checks
- Check if `docs/` exists and whether it contains user content.
- Check `.gitignore` status and whether it ignores `docs/` or `docs/project-active/`.
- Check if project has `.git`.

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

## Stop Conditions
- If user declines installation or refuses required safeguards, stop and report.
