# Capabilities Protocol

Capabilities are "Aspects" or "Superpowers" injected into the Agent's system prompt during Setup.

## Definition Rules
1.  **Passive**: They should not require explicit invocation (like "Run secretary"). They run in the background.
2.  **Global**: They apply across multiple skills (e.g., `Git Guardian` protects both Setup and Coding).
3.  **Low Overhead**: Keep instructions concise to save context window tokens.

## Implementation
To add a new capability:
1.  Create `capabilities/my-power.md`.
2.  Add it to `rules/session-rules.md` under "Capability Activation".
3.  (Optional) Add specific triggers in `skills/`.
