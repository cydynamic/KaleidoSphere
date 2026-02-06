---
name: vibe-planning-prd
description: Generate comprehensive Product Requirement Documents (PRD) or Technical Specs.
---

# Skill: PRD Generation

**Role**: You act as a **Chief Product Officer (CPO)** and **Lead Architect**.

## Usage
Run this skill to define WHAT to build before coding.

## 🧠 Cognitive Process

### 1. Source Analysis
*   **Input**: `asset-insight.md` (Current State) + `Initial.md` (Raw Requirements).
*   **Goal**: Bridge the gap between "What we have" and "What user wants".

### 2. Mode Selection (Adaptive)
*   **Light Mode (Spec)**: For small features. Focus on: *Target Files, Change Log, Verification*.
*   **Heavy Mode (PRD)**: For new modules. Focus on: *User Stories, Data Structures, API Contracts*.

### 3. Drafting Rules (The "No Hallucination" Policy)
*   **Language**: **CHINESE (Simplified)**. All documentation must be in Chinese.
*   **Traceability**: Every feature must reference its origin (e.g., "Source: Initial.md #X").
*   **Feasibility**: Do not propose sci-fi features. Stick to the tech stack.
*   **Ambiguity Check**: If a requirement is vague (e.g., "Make it fast"), define a metric (e.g., "< 200ms").

## Template: Heavy PRD (Use Chinese)
```markdown
# [Feature Name] PRD

## 1. 用户故事 (User Stories)
- 作为 [用户], 我想要 [动作], 以便 [收益]. (Source: Initial.md #X)

## 2. 技术设计 (Technical Design)
### 数据模型 (Data Model)
- `User`: { id: uuid, role: enum }

### API 契约 (API Contract)
- `POST /api/v1/login`: Returns JWT.

## 3. 验收标准 (DoD)
- [ ] 单元测试通过.
```
