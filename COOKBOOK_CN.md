# KaleidoSphere 实战指南 (Cookbook)

> **让 AI 像资深工程师一样思考与协作。**

---

## 📍 安装与准备 (Setup)

本指南中的指令基于 **嵌入式安装**（即 `.kaleidosphere/` 目录）。

1.  **安装 (Clone)**:
    在你的项目根目录下执行：
    ```bash
    git clone https://github.com/cydynamic/KaleidoSphere.git .kaleidosphere
    ```

2.  **配置 (Configure)**:
    在项目根目录**新建或编辑** `.gitignore`，写入以下两行，保持项目纯净：
    ```
    .kaleidosphere/
    docs/project-active/
    ```

---

## 🚀 启动与激活 (Bootstrap)

这是使用万花境的**唯一入口**。请养成习惯。

### 1. 首次激活 (Installation)
*   **场景**: 你刚在一个新项目中安装了 `.kaleidosphere`。
*   **操作**: 打开 AI 对话框（Claude/Cursor），输入：
    > "请读取 `.kaleidosphere/docs/install.md` 并安装系统。"
*   **结果**: 系统会自动生成 `docs/start.md`、`CLAUDE.md` 等核心文件，并完成初始化。

### 2. 日常唤醒 (Daily Routine)
*   **场景**: 每天开始工作，或开启一个新的 AI 会话。
*   **操作**: **第一句话**必须是：
    > "请读取 `docs/start.md` 并开始 [你的任务]..."
    *   *例: "请读取 `docs/start.md` 并帮我重构 Auth 模块。"*
*   **结果**: AI 会自动加载内核、读取记忆，并无缝衔接你的任务。

### 💡 秘诀：万能咒语
如果你觉得 AI 变笨了，或者忘了输出进度表，只需在指令中加上：
> **"按照万花境流程..."**
> *例: "按照万花境流程，帮我拆解这个任务。"*

---

## 🎭 场景演练 (Workflows)

### 场景 A: 轻量迭代 (Quick Fix / Solo)
*适合: 修复 Bug、开发小功能、不需要复杂规划。*

1.  **唤醒**: "请读取 `docs/start.md`，我要修复登录页面的样式问题。"
2.  **执行**: AI 会直接修改代码。
3.  **记录**: AI 会自动将你的修改意图记录到 `human-supplements-notes.md`。
4.  **提交**: AI 提示你 Git Commit。

### 场景 B: 深度开发 (The Harvest Workflow)
*适合: 开发新 Feature、长期项目、需要保留完整上下文。*

1.  **唤醒**: "请读取 `docs/start.md`，我要开发支付模块。"
2.  **Setup**: AI 会在 `docs/project-active/[Date]/` 下创建一个专门的 `job-[ID]` 目录。
3.  **Planning**: AI 在该目录下生成详细的 `tasks.md` (L2 进度)。
4.  **Execution**: AI 对照清单逐个实现，工作文件完全隔离。
5.  **收割 (Harvest)**:
    *   任务完成后，AI 会提示：**"❓ 任务似乎已完成。是否归档并提炼上下文？(Y/N)"**
    *   确认后，AI 将把关键信息（决策、变动）提炼到 `project_context.md` (Shared Memory)。
    *   原始工作文件夹被移动到 `archived/`。
    *   全局进度表 (`progress.md`) 更新为 **Done**。

### 场景 C: 团队协作 (Chat Room)
*适合: 需求模糊，需要讨论。*

1.  **Trigger**: "开启聊天室：讨论一下数据库选型。"
2.  **Process**: AI 切换为 Coordinator 角色，引导你进行多轮对话。
3.  **Result**: 讨论结果被整理成 Spec 文档，转入场景 B 进行开发。

---

## 🦸 进阶能力 (Advanced Features)

### 1. 记忆系统 (Memory)
*   **用法**: "记住我不喜欢用 `any` 类型。"
*   **效果**: AI 会将其写入 `user_preferences.md`，永久生效（即使换了 AI 模型）。
*   **注意**: 严禁使用 AI 自带的 `save_memory` 工具，必须走万花境协议。

### 2. 自动记录 (Auto-Record)
*   **默认**: 关闭 (OFF)。
*   **开启**: 在 `docs/project-shared/memory/user_preferences.md` 中添加：
    `- [System] AutoRecord: true`
*   **效果**: 所有的对话都会被自动记录到 `docs/project-active/[Date]/` 下，无需手动整理。

### 3. 自动更新 (Self-Update)
*   **机制**: 每次运行 `setup` (通过 `start.md`) 时，系统会自动检查远程更新。
*   **操作**: 如果提示有更新，输入 "是" 即可一键升级。

---

## 🧰 技能清单 (Skills)
*   **Core**: Planning, Breakdown, Coding, Analysis, Collaboration.
*   **Discovery**: 更多技能请查看 `.kaleidosphere/skills/external/`。

---

## ❓ 常见问题 (FAQ)

**Q: AI 没有输出进度仪表盘？**
A: 请对它说："按规则回复"。

**Q: `progress.md` 是做什么的？**
A: 它是项目的全局进度看板 (L1)。在深度开发模式下，它会链接到具体的 Job 任务单 (L2)。

**Q: 我可以直接让 AI 写代码吗？**
A: 可以（场景 A）。但对于复杂任务，建议先走 Planning（场景 B）。
