---
name: capability-workflow-strategy
description: Resolves workflow order, injection, and conflict handling.
---

# Superpower: Workflow Strategy

**Core Function**: Decide workflow order and resolve conflicts with explicit user confirmation.

## Default Flow (Reference)
- Setup -> Planning -> Design (optional) -> Coding -> Harvest

## Injection Model
Supported injection types (reference only; user may propose others):
- **skill**: reference a SKILL.md
- **file**: reference a single workflow file
- **folder**: reference a folder with a manifest/index

## Decision Rules
1. **No Silent Merge**: Always surface changes and ask the user.
2. **Reference Options Only**: Provide examples, never limit choices.
3. **Explain Outcome**: Show how the final flow changes after injection.

## Design Step Policy
- Ask the user if design is needed before entering Design.
- If yes, use Pencil MCP to draft and iterate until approved.

## Persistence
- Store workflow decisions in `docs/project-shared/memory/project_context.md`.
- Include injected flow description and placement.
