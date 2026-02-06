---
name: vibe-setup
description: Initialize session, load memory & capabilities.
---

# Vibe Coding Setup

## Instructions
1.  **Identity Check**: Determine your underlying model family (Claude, OpenAI, Gemini).
2.  **Load Rules**:
    *   Read `../../rules/AGENT_PROTOCOL.md` (Shared Kernel).
    *   Read **ONE** Adapter based on your identity.
3.  **🛡️ Security Check**: Activate `../../capabilities/git-guardian.md`.
4.  **Engineering Standards (Inject)**:
    *   **Package Manager**: Enforce `pnpm`.
    *   **Git Ignore**: Ensure `.gitignore`. If missing, **ASK USER**: "❓ 是否创建标准 .gitignore? (Y/N)"
5.  **💾 Bootloader Maintenance (Interactive)**:
    *   **Version Check**:
        *   **Latest**: Read `../../../CHANGELOG.md` to identify latest version.
        *   **Installed**: Read `docs/start.md` and check for `<!-- VERSION: X -->` tag.
    *   **Status Analysis**:
        *   If `docs/start.md` or Root Hooks (`AGENTS.md`) are missing -> **MISSING**.
        *   If `docs/start.md` exists but Version != Latest -> **OUTDATED**.
    *   **Report**: "Bootloader Status: [MISSING/OUTDATED/CURRENT]".
    *   **INTERACTION RULE**: If not CURRENT, ask user in a **separate, bold line** at the end:
        > "**❓ 引导文件缺失或过期，是否立即修复? (Y/N)**"
6.  **🧠 Memory Initialization**:
    *   Check directory `docs/project-shared/memory/`.
    *   If `user_preferences.md` is missing, create it with:
        ```markdown
        # User Preferences
        > **Instructions**: Append new preferences here.
        
        - [System] Package Manager: **pnpm** (STRICT).
        - [System] Git: Must have `.gitignore`.
        - [System] Language: Chinese (Simplified).
        ```
    *   If `project_context.md` is missing, create it with header: 
        ```markdown
        # Project Context
        > **Role**: Architecture Map & Decision Log.
        
        ## 1. System Overview
        
        ## 2. Domain Model
        
        ## 3. Key Decisions (ADR)
        ```
7.  **Load Memory**: Read `../../capabilities/memory.md` and then read the actual memory files (`docs/project-shared/memory/*.md`).
8.  **Identify State**: Read `docs/project-shared/progress.md`.
9.  **🔄 Self-Update Check (Git)**:
    *   **Scope**: Check the `.kaleidosphere` directory (if embedded) or current root.
    *   **Action**: Try to run `git fetch` and check `git status -uno`.
    *   **Logic**:
        *   If update available, **ALERT**: "🚀 New KaleidoSphere version available!"
        *   **ASK USER**: "❓ 发现新版本，是否立即更新? (Y/N)"
        *   **If Yes**: 
            1.  Run `git pull`.
            2.  **REPORT**: "Update downloaded. Please read `.kaleidosphere/docs/install.md` to re-install configuration."
            3.  **STOP** execution here.
10. **Handshake & Configuration**: 
    *   **Phase Report**: Report status in Chinese.
    *   **Mode Check**: If `project_context.md` does not specify `Workflow Mode`, ASK USER:
        > "请选择工作流模式 (Workflow Mode):
        > 1. ⚡ **Solo (单兵)**: 极速模式，批量执行，适合 Demo/MVP。
        > 2. 🛡️ **Strict (严格)**: 协作模式，原子提交，强制 Review。
        > 3. ⚖️ **Hybrid (混合/默认)**: 自适应。小任务 Solo，大任务 Strict。
        >
        > (您可以说 **'使用默认'** 以一键配置 Hybrid + pnpm + 中文)"
    *   **Action**: If user confirms, use `capabilities/memory.md` to append choice to `project_context.md` (Preferences section).
    *   **Skill Registry (In-Memory)**:
        *   **Instruction**: You are equipped with the following skills. Keep them in your active memory. **Do NOT write this list to any file.**
        ```markdown
        ### Core Skills
        - **Install**: `skills/core/install/SKILL.md`
        - **Planning**: `skills/core/planning/SKILL.md`
        - **Breakdown**: `skills/core/planning/breakdown/SKILL.md`
        - **Workflow**: `skills/core/workflow/SKILL.md`
        - **Coding**: `skills/core/coding/SKILL.md`
        - **Analysis**: `skills/core/analysis/SKILL.md`
        - **Collaboration**: `skills/core/collaboration/SKILL.md`

        ### External Skills (Auto-Discovery)
        > **Instruction**: Additional skills are located in `skills/external/`.
        > If the user request matches a potential external skill (e.g., "brainstorming", "find skills"), look there.
        ```
    *   **Workspace Prep**:
        *   Create `docs/project-active/[YYYY-MM-DD]/` (Today).
        *   **Instruct**: "Your active workspace is `docs/project-active/[Date]`. Please create a sub-folder `job-[ID]-[Name]` for your first task."
    *   **Guidance**: If Phase 0, recommend Planning.
    *   **MANDATORY**: Append the **Workflow Status Dashboard**.
