# AI Chat Room 协作指南 (AI Chat Room Guide)

## 📖 简介
**AI Chat Room** 是一种高级执行模式，用于处理复杂、跨模块或需要深度架构设计的任务。通过模拟 **AI 统筹者 (Architect)** 与 **AI 开发者 (Coder)** 的对话，实现思维链的显式化和上下文隔离。

## 📁 目录结构
聊天室文件应存放在：
`docs/project-active/<Date>/ai-chat-room/`

*   **文件名规范**: `YYYYMMDD-<Topic>.md`
    *   例: `20260110-monorepo-setup.md`
*   **归档**: 讨论结束的文件移入 `archived/` 子目录。

---

## 🎨 会话格式规范 (Protocol)

为了保证 Markdown 渲染的可读性和 AI 解析的准确性，**必须**严格遵守以下格式：

### 1. 发言块 (Message Block)
每个角色的发言必须包含 **Level 3 Header**、**引用元数据** 和 **水平分割线**。

```markdown
### 🦁 AI 统筹者
> 🕒 2026-01-10 10:00:00 | 🏷️ 状态: 方案评审

@AI 开发者，请基于 spec.md 设计 Store 的接口定义。

---
```

```markdown
### ⚡ AI 开发者
> 🕒 2026-01-10 10:05:00 | 🏷️ 状态: 编码中

收到。考虑到性能问题，我建议使用 Recoil 而不是 Redux。以下是草案...

---
```

### 2. 角色列表 (Roles)

| 图标 | 角色名 | 职责摘要 | 详细设定 |
| :--- | :--- | :--- | :--- |
| 🦁 | **AI 统筹者** | 架构设计、任务拆解、Code Review | `roles/coordinator.md` |
| ⚡ | **AI 开发者** | 代码实现、细节补全、风险预警 | `roles/developer.md` |
| 👤 | **User** | 需求澄清、最终决策 | (Human) |

---

## 🚀 交互流程 (Proxy Recording)

**核心升级**: 用户不再需要手动编辑 Markdown 文件。

### 1. 启动 (Start)
*   **用户**: "开启聊天室：[Topic]"
*   **AI (统筹者)**:
    1.  创建 `YYYYMMDD-[Topic].md` 并写入基础信息。
    2.  **MANDATORY**: 输出以下引导回复：
        > "✅ 聊天室已就绪。文件路径: `[FilePath]`
        >
        > **下一步操作 (开发者)**:
        > 请您打开一个新的 Agent 会话，输入以下 **完整指令** 以加入协作：
        >
        > ```markdown
        > **角色分配**: 你现在将扮演 **@AI开发者**。
        >
        > **行动指令**:
        > 1. 请读取并执行 `skills/setup.md` (系统初始化)。
        > 2. 初始化完成后，请立即读取并加入聊天室: `[FilePath]`。
        > ```
        >
        > 我（统筹者）将在此处等待 Developer 上线。"

### 2. 循环 (Loop)
1.  **用户输入**: 用户在 Agent 对话框中输入指令或反馈。
    *   例如: *"这里需要加个 Auth 验证。"*
2.  **AI 代理 (Record)**: 收到消息后，**立即**追加到聊天室文件。
    ```markdown
    ### 👤 User
    > 🕒 2026-01-27 10:30:00
    
    这里需要加个 Auth 验证。
    
    ---
    ```
3.  **AI 响应 (Respond)**: 读取最新文件内容，以 **AI 角色** 进行回复并追加。
    ```markdown
    ### 🦁 AI 统筹者
    > ...
    
    收到。@AI 开发者，请在接口中增加 Bearer Token 校验。
    
    ---
    ```

### 3. 归档与重置 (Exit & Archive)
当聊天记录过长（>500行）或 Topic 结束时：
1.  **Archivist**: 系统会自动触发 `capabilities/archivist.md` 进行垃圾回收。
2.  **User Action**: 用户也可以随时输入 "归档聊天室" 手动触发。
3.  **Result**: 旧文件移入 `archived/`，新文件仅保留 Summary。

---

## 🛑 防自嗨机制 (Anti-Self-Play)
*   **Write Lock**: 每个 Agent **只能** 写入属于自己角色的 Header (如 `### 🦁 AI 统筹者`)。写入他 人 Header 视为严重违规（除非它是代理用户写入 User Block）。
*   **Fire and Forget**:
    *   **统筹者**: 下达指令 -> 写入文件 -> **结束**。
    *   **开发者**: 执行代码 -> 回复结果 -> 写入文件 -> **结束**。
*   **One-Turn-Policy**: 每次工具调用**只产出一条**聊天记录。严禁一次性生成多轮对话。
