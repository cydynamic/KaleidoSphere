# 🏛️ 架构设计 (Architecture & Design)

## 系统架构 (System Architecture)

KaleidoSphere 采用分层架构设计，确保系统的稳定性与可扩展性。
能力是全局护栏/规则层，技能是执行入口；技能执行时必须遵循能力，能力不调用技能。

```mermaid
graph TD
    User((用户 👤))
    
    subgraph KaleidoSphere [万花境 OS]
        subgraph Kernel [核心层]
            Protocol[规则 / 协议 📜]
            Identity[身份锁 🔐]
        end
        
        subgraph Cortex [认知层]
            Setup[启动技能 🏗️]
            Install[安装技能 🧰]
            Planning[规划技能 🧠]
            Workflow[流程技能 🧭]
            Analysis[分析技能 🔍]
            Coding[编码技能 ⚡]
            Collaboration[协作技能 🤝]
        end
        
        subgraph Superpowers [能力层]
            Git[Git 护栏 🛡️]
            Sec[秘书 📝]
            Mem[记忆系统 💾]
            Prog[进度管理 📈]
            InstallStrat[安装策略 🧩]
            FlowStrat[流程策略 🧭]
            Arch[归档能力 📦]
        end
        
        subgraph Artifacts [资产层]
            PRD[PRD 文档 📄]
            Code[源代码 💻]
            Progress[进度日志 📊]
        end

        subgraph SelfDevKit ["自举开发套件 (meta-studio/self-dev)"]
            DevDocs["self-dev/docs (维护文档)"]
            DevTests["self-dev/tests (测试套件)"]
            DevRunner["run_tests.sh"]
        end
    end

    User -->|自然语言| Cortex
    Cortex -->|参考| Kernel
    Cortex -->|调用| Superpowers
    Cortex -->|生成| Artifacts
    Cortex -->|维护| SelfDevKit
    Superpowers -->|记录| Artifacts
    Superpowers -->|保护| Code
```

## 用户项目工作流 (User Project Workflow)

该流程面向用户项目（嵌入式 `.kaleidosphere`）。KaleidoSphere 引入了 "Active -> 沉淀 -> Shared" 的生命周期管理，实现 **L1 (全局)** 与 **L2 (会话)** 的分级管理。
流程决策由 Workflow Strategy 能力完成，流程执行由 Workflow Skill 驱动。

```mermaid
graph TD
    User((用户))
    Flow[流程策略能力]
    InstallStrat[安装策略能力]
    
    subgraph Shared ["共享层 (L1)"]
        Progress["progress.md (全局进度)"]
        Memory["project_context.md (长期记忆)"]
    end
    
    subgraph Active ["活跃层 (L2)"]
        Job["任务目录 (当前任务)"]
        Tasks["tasks.md (每日清单)"]
    end
    
    subgraph Archive [归档层]
        OldJobs[已完成任务]
    end

    User -->|请求| InstallStrat
    InstallStrat -->|输出安装清单| Install[安装技能]
    Install -->|就绪| Setup[启动技能]
    Setup -->|进入| Flow
    Flow -->|确定流程| Planning[规划技能]
    Setup -->|创建| Job
    Setup -->|链接| Progress
    
    User -->|执行| Job
    Job -->|更新| Tasks

    Planning -->|设计确认| Design["设计图 (可选)"]
    Design -->|实现| Coding[编码技能]
    
    User -->|"沉淀 (Harvest)"| Archivist[归档能力]
    Archivist -->|归档| Job --> OldJobs
    Archivist -->|提炼| Memory
    Archivist -->|完成| Progress
```

## 自举开发工作流 (Self-Dev Workflow)

该流程面向万花境自身仓库。入口为 `docs/start.md`，实例层沉淀在 `docs/project-*`，不走 `.kaleidosphere` 更新逻辑。自举开发套件位于 `meta-studio/self-dev`。

```mermaid
graph TD
    Dev((开发者))
    Start["docs/start.md"]
    Flow["流程策略能力"]
    InstallStrat["安装策略能力"]
    InstallSkill["安装技能"]

    subgraph Instance["实例层 (docs/)"]
        Shared["docs/project-shared/"]
        Active["docs/project-active/"]
    end

    Dev -->|启动| Start
    Start -->|判定安装| InstallStrat
    InstallStrat -->|就绪| InstallSkill
    InstallSkill -->|激活| Setup[启动技能]
    Setup -->|读取| Shared
    Setup -->|准备| Active

    Dev -->|请求| Flow
    Flow -->|确定流程| Planning[规划技能]
    Planning -->|设计确认| Design["设计图 (可选)"]
    Design -->|实现| Coding[编码技能]

    Coding -->|收尾| Archivist[归档能力]
    Archivist -->|提炼| Shared

    subgraph SelfDevKit2["自举开发套件 (meta-studio/self-dev)"]
        DevDocs2["self-dev/docs (维护文档)"]
        DevTests2["self-dev/tests (测试套件)"]
        DevRunner2["run_tests.sh"]
    end
    Setup -->|维护| DevDocs2
    Setup -->|维护| DevTests2
    DevTests2 -->|执行| DevRunner2
```
