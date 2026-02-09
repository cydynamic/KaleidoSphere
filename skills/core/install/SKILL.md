---
name: vibe-install
description: Install KaleidoSphere with conflict-aware safeguards.
---

# Skill: Installer

## Usage
Run this skill when installing or repairing KaleidoSphere in a user project.

## Instructions
1. **Load Strategy**: Read `../../capabilities/install-strategy.md`.
2. **Inspect Project**:
   - Check `docs/`, `.gitignore`, `.git`.
   - Check opt-out in `docs/project-active/memory/user_preferences_local.md`.
3. **Generate Install Plan**:
   - Output a table of paths, purpose, and risks.
4. **Ask for Confirmation**:
   - Provide reference options; accept custom solutions.
   - If not installed, include clone + install command from the strategy.
5. **Execute Install**:
   - Follow `docs/install.md` but adapt paths if remapped.
6. **Record Mapping**:
   - If remapped, write to `docs/project-shared/memory/project_context.md`.
7. **Record Opt-Out**:
   - If user declines installation, record in
     `docs/project-active/memory/user_preferences_local.md` (user-local opt-out),
     and do not ask again in this project.
8. **Report Result**:
   - Summarize what was created or updated.
