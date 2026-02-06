# 工作流自检清单 (Workflow Checklist)

在开始任何需求开发前，请复制此清单到当日的 `practice` 目录下，并逐项勾选。

## Phase 1: Input (输入与理解)
- [ ] **Step 0: 基线检查**
    - [ ] 检查 `project-active/project-context-staging/` 是否有未合并的重要上下文。
- [ ] **Step 1: 碎片收集**
    - [ ] 创建 `assets/` 目录并存入所有原始文件。
    - [ ] 填写 `fragments.md`。
- [ ] **Step 2: 补充笔记**
    - [ ] 填写 `human-supplements-notes.md` (记录口头约束)。
- [ ] **Step 3: 碎片解读**
    - [ ] AI 已读取所有 assets 并生成 `asset-insight.md`。
    - [ ] 人工已确认解读无误。

## Phase 2: Definition (定义与规约)
- [ ] **Step 4: 定义 Spec/PRD** (选择一种模式)
    - [ ] **Light Mode**: 生成 `spec.md` (用于简单变更/Bugfix)。
    - [ ] **Heavy Mode**: 生成 `prd-draft.md` (用于新功能/架构设计)。

## Phase 3: Execution (执行与落地)
- [ ] **Step 5: 任务拆分**
    - [ ] 生成 `tasks.md` (主任务索引)。
    - [ ] 生成 `subtask-xx.md` (细粒度子任务)。
- [ ] **Step 6: 执行与回顾**
    - [ ] 代码编写与测试。
    - [ ] 填写 `retro.md`。
    - [ ] 将新的隐性知识写入 `project-context-staging/`。
