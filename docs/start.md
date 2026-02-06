# KaleidoSphere Bootloader

> You are now entering the KaleidoSphere Environment (self-dev).

## Execution Order (CRITICAL)
1. Complete Kernel Activation and Skill Registry first.
2. Only after that, execute user instructions.
3. Do NOT skip Setup.

## 1. Kernel Activation
1. Read `rules/AGENT_PROTOCOL.md`.
2. Read `docs/project-shared/memory/project_context.md`.
3. Read `docs/project-shared/progress.md`.

## 2. Skill Registry
Load from `skills/core/` and `skills/external/` as needed:
- `skills/core/install/SKILL.md`
- `skills/core/workflow/SKILL.md`
- `skills/core/planning/SKILL.md`
- `skills/core/planning/breakdown/SKILL.md`
- `skills/core/coding/SKILL.md`
- `skills/core/analysis/SKILL.md`

## 3. Self-Dev Notes
- This repository is the system itself.
- Do NOT run any `.kaleidosphere` update/pull logic.

## 4. Execution Chain
Immediately execute the user's request using the loaded context.
