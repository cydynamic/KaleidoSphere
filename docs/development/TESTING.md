# KaleidoSphere 测试指南 (Testing Guide)

> **Philosophy**: 我们不仅写 Prompt，我们还**测试** Prompt。
> 万花境的测试本质上是 **"Automated Simulation" (自动化模拟)**。

## 🛠 1. 环境准备 (Prerequisites)

我们需要使用 [Promptfoo](https://promptfoo.dev) 来运行测试。它是一个 CLI 工具，负责把我们的 Skill 发送给 LLM 并评估结果。

### 安装
```bash
# 需要 Node.js 环境
npm install -g promptfoo
```

### 配置 API Key
Promptfoo 需要调用 LLM (Claude/OpenAI/Gemini) 来运行测试。请在 `.env` 文件或环境变量中配置：
```bash
export ANTHROPIC_API_KEY=sk-...
export GOOGLE_API_KEY=AIza...
export OPENAI_API_KEY=sk-...
```

---

## 🏃 2. 运行测试 (Running Tests)

我们提供了一个一键测试脚本。在项目根目录下运行：

```bash
# 运行所有核心测试套件 (Security, Workflow, Setup, Planning)
./meta-studio/self-dev/tests/run_tests.sh
```

或者运行单个测试套件：

```bash
promptfoo eval -c meta-studio/self-dev/tests/suites/security.yaml --no-cache
```

---

## 🧪 3. 测试架构 (Test Architecture)

KaleidoSphere 使用 **Domain-Driven Testing** 策略，测试文件位于 `meta-studio/self-dev/tests/suites/`。

*   **Security Suite** (`security.yaml`): 测试安全护栏（如 npm 禁用、身份锁定）。
*   **Workflow Suite** (`workflow.yaml`): 测试状态同步和日志记录。
*   **Setup Suite** (`setup.yaml`): 测试初始化流程。
*   **Planning Suite** (`planning.yaml`): 测试需求分析逻辑。
*   **Install Strategy Suite** (`install-strategy.yaml`): 测试安装策略与冲突处理。
*   **Workflow Strategy Suite** (`workflow-strategy.yaml`): 测试流程决策与注入处理。

### 用例结构示例
```yaml
description: "My Skill Test"

prompts:
  - file://../prompts/universal_loader.js # 1. 智能加载器 (Loader)

providers:
  - file://../providers.yaml                       # 2. 模型配置 (Config)

tests:
  - description: "Test Scenario Name"
    vars:
      skill_path: "../../../../skills/core/coding/SKILL.md"   # 3. 被测 Skill
      user_message: "User input here"
    assert:
      - type: javascript                           # 4. 确定性断言 (Deterministic Assert)
        value: "output.includes('REJECTED')"
```

> **重要**：如果使用 `llm-rubric`，务必配置 `defaultTest` 作为裁判模型，否则断言无法稳定执行。
> 参考示例（Standard 使用官方 baseUrl）：
```yaml
# JUDGE Configuration
defaultTest:
  options:
    provider:
      id: anthropic:messages:claude-haiku-4-5-20251001
      config:
        apiKeyEnvar: ANTHROPIC_API_KEY
        apiBaseUrl: https://api.anthropic.com/v1
        temperature: 0
        max_tokens: 1024
```

---

## 🎯 测试策略 (Strategy)

*   **Regression Testing**: 每次修改核心 Skill，都必须运行 `./run_tests.sh`。
*   **Safety Testing**: 重点测试 "Identity Lock" (防幻觉) 和 "Git Guardian" (安全切面)。
*   **Mock Environment**: 我们的测试运行在 Mock 环境中，不需要真实文件系统权限。

---

## 🧭 安装与流程测试 (Install & Workflow)

本次新增 **安装决策能力 + 安装技能**、**流程决策能力 + 流程执行技能**，建议补充以下测试场景：

### 安装决策能力 (Install Strategy)
**目标**：发现冲突时不静默，必须提示并给出参考选项。
*   现有 `docs/` 且有内容 → 必须提示风险并输出安装清单表格。
*   `.gitignore` 屏蔽 `docs/` → 必须提示提交风险。
*   无 `.git` → 必须建议初始化。
*   用户要求改路径 → 必须记录映射并调整相对路径描述。

### 流程决策能力 (Workflow Strategy)
**目标**：流程决策明确、可追踪、可解释。
*   必须展示最终流程表（包含注入步骤）。
*   设计步骤前必须询问是否需要设计图。
*   禁止静默合并或回退。

### 多模型一致性
同一套测试在多个 Provider 上执行，断言必须在语义层面保持一致：
*   推荐使用 `llm-rubric` 校验“必须提示/必须拒绝/必须展示表格”等行为。
*   确保 `temperature: 0`，降低随机性。

---

## ✅ 提交前基础检查 (Pre-Commit Checks)

**目标**：提交前快速发现常见文档问题（不依赖脚本）。

1. **关键文件存在**：`docs/install.md`、`docs/start.md`、`rules/AGENT_PROTOCOL.md`。
2. **仓库地址一致**：README / COOKBOOK 中的 clone 地址与当前仓库一致。
3. **关键引用可达**：README 中引用的关键文档路径存在（如 `docs/design/architecture*.md`）。
