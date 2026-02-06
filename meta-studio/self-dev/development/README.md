# Self-Dev Development Guide

This section defines how to develop KaleidoSphere itself.

Scope:
- Applies to system code and docs in this repository.
- The instance knowledge base lives in `docs/project-shared/`.

Bootstrap (self-dev):
- Tell the assistant: "Please read `docs/start.md` and help me develop KaleidoSphere."
- Do NOT use `.kaleidosphere` update/pull logic. This repo is the system itself.

Change consistency rules:
- If you modify `docs/install.md` or bootloader content, you MUST update the self-dev instructions here.
- If you modify core workflow docs, you MUST update the workflow strategy capability/skill.

Testing:
- Follow `meta-studio/self-dev/tests/README.md`.
