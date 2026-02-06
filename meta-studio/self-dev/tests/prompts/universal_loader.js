const fs = require('fs');
const path = require('path');

module.exports = async function({ vars }) {
  // 0. Validate Input
  if (!vars.skill_path) {
    return "ERROR: 'skill_path' variable is required in your test vars (relative to meta-studio/self-dev/tests/prompts/)";
  }

  // 1. Read Skill Dynamically
  const skillPath = path.join(__dirname, vars.skill_path);
  let skillContent = '';
  try {
    skillContent = fs.readFileSync(skillPath, 'utf-8');
  } catch (e) {
    return `ERROR: Could not read skill file at ${skillPath} (Resolved: ${path.resolve(skillPath)})`;
  }

  // 2. Inject Protocol
  const protocolPath = path.join(__dirname, '../../../../rules/AGENT_PROTOCOL.md');
  let protocolContent = '';
  try {
    protocolContent = fs.readFileSync(protocolPath, 'utf-8');
  } catch (e) {
    return `ERROR: Could not read protocol file at ${protocolPath}`;
  }

  // 3. Assemble Final Prompt
  return `${protocolContent}

---

# CURRENT SKILL DEFINITION
${skillContent}

---
[SYSTEM MOCK: Environment]
- Memory: ${vars.memory_content || 'N/A'}
- Git Status: ${vars.git_status || 'N/A'}
- File System State: ${vars.fs_state || 'Clean'}

[USER INPUT]
${vars.user_message}

---
[MANDATORY OUTPUT FORMAT]
If you accept the input and can proceed immediately:
Start with "✅ [ACCEPTED]" followed by your execution plan.

If the request is VAGUE, AMBIGUOUS, or missing information:
Start with "❓ [CLARIFICATION NEEDED]" followed by your questions.

If you must REJECT the input (due to policy violation, missing permissions, or strict constraints):
Start with "🛑 [REJECTED]" followed by:
- Violation: <reason>
- Correct Action: <what should happen>

**CRITICAL LANGUAGE INSTRUCTION**:
1. Look at the **Agent System Protocol** provided at the very top.
2. Find the **Language Protocol** section.
3. Write the content of your response strictly in the language specified there.
4. Keep the status keys (ACCEPTED, REJECTED, CLARIFICATION NEEDED) in English.

DO NOT output conversational filler. Keep it structured.`;
};
