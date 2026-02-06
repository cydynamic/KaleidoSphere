---
name: vibe-workflow
description: Orchestrate workflow execution with explicit user confirmation.
---

# Skill: Workflow Orchestrator

## Usage
Run this skill to decide and execute the project workflow.

## Instructions
1. **Load Strategy**: Read `../../capabilities/workflow-strategy.md`.
2. **Read Context**:
   - Read `docs/project-shared/memory/project_context.md` for workflow notes.
3. **Resolve Flow**:
   - Apply default flow and injected steps.
4. **Present Flow**:
   - Show the final flow order and explain changes.
   - Provide reference options; accept user custom choices.
5. **Execute Steps**:
   - Run each step in order.
   - Ask before Design step.
6. **Record Decisions**:
   - Write final flow and rationale to `project_context.md`.
