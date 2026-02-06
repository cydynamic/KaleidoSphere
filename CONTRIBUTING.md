# 🤝 贡献指南 (Contributing Guide)

感谢你对 KaleidoSphere 的兴趣！我们致力于构建一个标准化、安全、高效的 AI Agent 操作系统。

## 🛠 开发环境搭建 (Setup)

1.  **Fork** 本仓库。
2.  **Clone** 到本地：
    ```bash
    git clone https://github.com/cydynamic/KaleidoSphere.git
    ```
3.  **安装依赖**:
    ```bash
    npm install -g promptfoo
    ```
4.  **配置 Key**:
    复制 `.env.example` 到 `.env` 并填入 Key (如果需要运行测试)。

---

## 🧪 测试驱动开发 (TDD)

我们实行 **Strict TDD**。任何对 `skills/` 的修改，都必须通过自动化测试。

**运行测试**:
```bash
./meta-studio/self-dev/tests/run_tests.sh
```

**新增测试**:
请在 `meta-studio/self-dev/tests/suites/` 下添加新的测试用例。参考 `docs/development/TESTING.md`。

---

## 📏 代码规范 (Standards)

请严格遵守 `rules/AGENT_PROTOCOL.md` 中的定义：

1.  **Language**: 核心文档使用 **中文 (Simplified)**，代码变量使用 **英文**。
2.  **Path**: 始终使用动态路径（`$(pwd)`）或相对路径。**严禁硬编码绝对路径**。
3.  **Identity**: 严禁让 Agent 模拟其他角色。
4.  **Mermaid**: 含括号/标点的中文标签必须使用双引号包裹（示例见 `docs/design/architecture_cn.md`）。
5.  **安装一致性**: 修改 `docs/install.md` 或内置安装流程时，必须同步更新“安装能力/安装技能”。
6.  **流程一致性**: 修改内置流程时，必须同步更新“流程决策能力/流程执行技能”。

---

## 🚀 提交 PR (Pull Request)

1.  **Run Tests**: 确保 `./meta-studio/self-dev/tests/run_tests.sh` 全绿。
2.  **Update Changelog**: 如果你的改动引入了新特性或修复了 Bug，请在 `CHANGELOG.md` 中记录。
3.  **Commit Message**: 遵循 Conventional Commits (e.g., `feat(skill): Add new planning mode`).
4.  提交 PR 到 `main` 分支。
