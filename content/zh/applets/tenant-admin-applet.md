---
title: "租户管理 Applet"
description: "Akaun 平台中用于目录、用户、角色、权限集、设置与审计可追溯性的集中式租户治理 Applet"
tags:
- tenant-administration
- access-control
- role-management
- permission-sets
- audit-trail
weight: 61
---

## 目的与概述

**Tenant Admin Applet** 是 Akaun Platform 中的租户治理工作区。它将目录访问、用户访问、Applet 分配、角色与权限控制以及运营审计可见性统一到一个位置。

{{< callout type="info" >}}
**核心概念**：控制**谁**可以访问租户、**可以访问什么**（catalogues/applets），以及**如何进行访问治理**（roles、permission sets 与 audit trail）。
{{< /callout >}}

{{< figure src="/images/tenant-admin-applet/tenant-main-listing.png" alt="Tenant Admin 主列表页面，展示治理模块" caption="主列表页面：租户治理模块的集中菜单" >}}

## 关键功能总览

### 谁会从这个 Applet 中受益？

**租户管理员：**
- 在一个入口管理租户用户、管理员、Applet 和目录
- 配置角色与权限结构
- 通过设置开关控制菜单/模块可见性

**安全与运维团队：**
- 标准化基于角色的访问控制
- 通过分配可见性与复核流程减少权限漂移
- 通过审计日志监控高风险变更

**合规与审计相关方：**
- 追踪谁在何时做了什么变更
- 审核访问治理控制的操作元数据
- 支持内外部审计证据收集

**租户终端用户：**
- 获得更准确的访问分配
- 基于角色获取对应的 Applet 与目录可见性
- 减少访问配置问题

### 这个 Applet 解决了什么问题？

**使用前：**
- 访问管理常分散在多个流程中
- 用户/Applet/目录分配难以一致性校验
- 角色与权限变更难以端到端追踪
- 手工配置增加误配风险

**使用后：**
- 通过单一路由化 Applet 承载租户管理流程
- 以角色与权限集实现治理，并支持目标范围控制
- 以计数与下钻提供结构化的用户和 Applet 分配可见性
- 通过审计轨迹实现管理变更可追溯

## 关键功能总览

{{< cards >}}
  {{< card title="目录治理" subtitle="目录记录与 applet 关联控制" link="#main-modules" >}}

  {{< card title="用户访问控制" subtitle="租户与平台用户分配流程" link="#user-access-control" >}}

  {{< card title="角色与权限" subtitle="角色列表、分配计数与权限集" link="#roles--permission-sets" >}}

  {{< card title="角色文件导入" subtitle="模板下载 + 批量上传与状态跟踪" link="#role-file-import" >}}

  {{< card title="审计可见性" subtitle="面向治理与合规的可检索操作历史" link="#audit-trail" >}}

  {{< card title="设置与个性化" subtitle="菜单可见性、默认值与个性化" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/tenant-admin-applet/tenant-admin-overview-infographic.png" alt="Tenant Admin 信息图，展示上线前挑战、Applet 解决方案与受益角色" caption="Tenant Admin 概览：上线前挑战、Applet 方案与受益对象" >}}

## 关键概念

### 租户访问治理模型

| 治理问题 | 主要模块 | 结果 |
|---|---|---|
| 谁可以访问租户？ | Tenant Users、Platform Users、Tenant Admins | 受控的主体级访问 |
| 他们可以打开什么？ | Catalogue、Applets | 受控的 Applet/目录覆盖范围 |
| 他们可以做什么？ | Tenant Roles、Permission Sets | 基于角色/权限集的动作级控制 |
| 如何验证变更？ | Audit Trail | 可追溯的治理历史 |

{{< callout type="tip" >}}
**建议顺序**：先配置 Roles 和 Permission Sets，再分配 users 与 applets，最后在 Audit Trail 中核验所有变更。
{{< /callout >}}

---

## 快速开始指南

使用以下按角色划分的流程即可快速上手。


### 面向租户管理员：基线设置

**目标：** 用 10 个实操步骤完成租户治理配置。

1. 打开 `Tenant Admin` 并确认当前租户上下文。
2. 进入 `Settings`，确保必要模块可见（Catalogue、Users、Roles、Permission Sets、Audit Trail）。
3. 配置默认选项（branch、location、company、row count）。
4. 配置 `Catalogue` 记录并建立 applet 关联。
5. 检查 `Applets` 列表并验证状态/可用性。
6. 配置 `Tenant Roles` 并检查角色分布计数。
7. 配置 `Permission Sets` 并映射到 applet/目标需求。
8. 验证 `Tenant Users` 与 `Platform Users` 分配。
9. 注册并验证至少两个有效的 `Tenant Admins`。
10. 执行一次测试变更，并在 `Audit Trail` 中确认可追溯性。

### 面向安全与运维：控制加固

**目标：** 降低误配置与过度授权风险。

1. 在 `Tenant Roles` 中检查重复或过时角色。
2. 在 `Permission Sets` 中检查不必要的宽权限。
3. 通过角色 `No. of Users` 与 `No. of Teams` 识别过度分配模式。
4. 在需要时强制目标范围控制（company/branch/location）。
5. 确保有备用管理员账号以保障连续性。
6. 按角色验证模块可见性策略（admin vs operations vs audit）。
7. 定期审查 `Audit Trail` 中的高权限变更。

### 面向合规/审计团队：证据审查

**目标：** 产出可辩护的治理证据。

1. 按日期、动作类型、操作者筛选 `Audit Trail`。
2. 抽样高影响变更（角色编辑、权限变更、管理员更新）。
3. 核验时间戳与操作者数据一致性。
4. 采集/导出审计工作底稿所需材料。
5. 记录未解决异常并跟踪整改。

### 面向应用支持：快速处理访问问题

**目标：** 通过一致检查流程快速关闭常见访问工单。

1. 在 `Settings` 中确认模块可见性。
2. 在 `Tenant Users` 或 `Platform Users` 中检查用户分配。
3. 验证角色分配与对应 `Permission Sets`。
4. 在 `Catalogue` 与 `Applets` 中确认 applet/目录关联。
5. 使用 `Audit Trail` 定位导致问题的最近变更。

### 实战演练：新租户访问上线（端到端）

**场景：** 某租户当天内需为新财务运营团队开通受控访问。

1. 管理员在 `Settings` 启用必要模块（`Catalogue`、`Applets`、`Tenant Users`、`Tenant Roles`、`Permission Sets`、`Audit Trail`）。
2. 管理员在 `Catalogue` 中核对或创建财务相关目录项。
3. 管理员在 `Applets` 中确认所需 applet 已启用并关联到正确目录。
4. 管理员为 Finance Clerk 与 Finance Supervisor 创建/更新 `Tenant Roles`。
5. 管理员为每个角色映射合适的 `Permission Sets`，并设置所需目标范围。
6. 管理员在 `Tenant Users` 分配试点用户，并验证 applet/目录可见性。
7. 支持人员使用试点用户登录验证并检查菜单访问是否符合预期。
8. 合规人员审查 `Audit Trail` 中全部配置动作并留存证据。

**结果：** 访问配置一致、支持验证通过，并具备审计可追溯性。

### 常见错误（快速开始）

- 在 `Settings` 未完成模块可见性配置前就先启用角色。
- 未验证 applet 到目录的关联就先分配用户。
- 对专用角色复用宽权限集且未做范围控制。
- 全量上线前跳过试点用户验证。
- 高影响访问变更后遗漏审计核验。

**如何避免：** 固定按顺序执行：可见性 -> 目录/applet 关联 -> 角色/权限集 -> 用户分配 -> 试点测试 -> 审计核验。

{{< callout type="tip" >}}
**上线检查清单**：已验证模块可见性、已配置默认值、已定稿角色、已映射权限集、已测试用户分配，并已安排上线首周审计监控。
{{< /callout >}}

---

## 主要模块

该 Applet 由以下治理模块组成：

| 模块 | 主要用途 |
|---|---|
| `Catalogue` | 管理目录记录与 applet-目录关联 |
| `Subscription` | 处理租户订阅相关管理 |
| `Tenant Users` | 管理租户级用户访问与分配 |
| `Platform Users` | 在租户上下文中管理平台级用户访问 |
| `Applets` | 审核与治理 applet 可用性 |
| `Tenant Roles` | 定义角色结构并查看分配计数 |
| `Role File Import` | 通过模板批量导入角色定义 |
| `Tenant Admins` | 维护租户管理员账号 |
| `Permission Sets` | 配置可复用权限包 |
| `Data Sync` | 管理同步控制（依分支就绪度而定） |
| `Audit Trail` | 查看操作历史与可追溯性 |
| `Settings` | 配置默认值、字段设置、webhook 与权限视图 |
| `Personalization` | 用户级个性化控制 |

## 核心 UI 工作流

### 列表与运营视图

UI 在主要模块中提供基于网格的操作视图：
- 用户视图包含分配计数（`No. of Catalogue`、`No. of Applets`）和状态字段
- 角色视图包含分布指标（`No. of Users`、`No. of Teams`）
- 权限集视图包含代码/名称/applet/日期跟踪
- 角色导入视图包含文件状态与处理错误信息
- 审计视图包含操作者/动作/日期过滤，便于追溯

### 新建/编辑与动作流程

Applet 中常见工作流：
- 目录新建/编辑与 applet 关联流程
- 权限集新增/编辑与多步骤行配置
- 角色文件上传（支持下载示例 CSV）
- 租户管理员新建/编辑流程
- applet 加入目录与为用户安装操作

{{< figure src="/images/tenant-admin-applet/tenant-main-listing.png" alt="Tenant Admin 的目录列表页面" caption="目录列表：管理租户目录条目" >}}

{{< figure src="/images/tenant-admin-applet/tenant-catalogue-create.png" alt="目录新建表单" caption="新建表单：配置并维护目录记录" >}}

{{< figure src="/images/tenant-admin-applet/tenant-catalogue-edit.png" alt="目录编辑表单" caption="编辑表单：配置并维护目录记录" >}}

## 用户访问控制

使用 `Tenant Users`、`Platform Users` 与 `Tenant Admins` 执行访问管理。

- 查看分配范围与状态
- 维护租户级管理员
- 校验用户到 applet 与用户到目录的一致性

{{< figure src="/images/tenant-admin-applet/tenant-user.png" alt="Tenant Users 列表" caption="Tenant Users 列表：用户访问范围与状态" >}}

## 角色与权限集

角色与权限组件提供访问治理基础能力：

- 使用 `Tenant Roles` 定义角色并查看分配指标
- 使用 `Permission Sets` 管理可复用权限包
- 角色/应用权限流程支持目标范围控制（company/branch/location）

{{< figure src="/images/tenant-admin-applet/tenant-role.png" alt="角色列表" caption="Tenant Roles：结构化的基于角色治理" >}}

{{< figure src="/images/tenant-admin-applet/tenant-permission-set.png" alt="权限集列表" caption="Tenant Permission Sets：结构化的角色权限治理" >}}

## 角色文件导入

角色上线支持批量导入：

- 下载示例模板 CSV
- 上传角色文件
- 查看处理状态与逐行错误信息

{{< figure src="/images/tenant-admin-applet/role-file-import-page.png" alt="角色文件导入页面" caption="Role File Import：基于模板的批量配置与状态监控" >}}

## 审计轨迹

`Audit Trail` 支持追溯与治理监控：

- 按动作/日期/操作者过滤
- 查看敏感操作变更历史
- 生成合规证据

{{< figure src="/images/tenant-admin-applet/tenant-audit-trail-2.png" alt="审计轨迹列表" caption="Audit Trail：可检索的管理变更历史" >}}

## 配置与设置

设置与个性化模块包括：

- 菜单/模块可见性开关
- 默认值设置
- 字段设置与 webhook 配置
- 个性化侧栏/默认项

{{< figure src="/images/tenant-admin-applet/tenant-setting-page.png" alt="Tenant Admin 设置页面" caption="设置页面：配置模块可见性与默认值" >}}

### 配置检查清单（推荐）

配置新租户时建议按以下顺序执行：

1. 在 `Settings` 中校验模块可见性开关。
2. 设置默认值（company、branch、location、row count）。

{{< figure src="/images/tenant-admin-applet/tenant-default.png" alt="company、branch、location 与列表行数默认值配置" caption="默认设置：配置 company、branch、location 与 row count 默认值" >}}

3. 配置角色与权限集。

{{< figure src="/images/tenant-admin-applet/tenant-perm-wizard.png" alt="用于目标范围与权限配置的向导" caption="权限向导：按 company、branch、location 定义范围化权限" >}}

{{< figure src="/images/tenant-admin-applet/tenant-perm-set.png" alt="权限集配置界面" caption="Permission Sets：创建可复用的 applet 访问包" >}}

{{< figure src="/images/tenant-admin-applet/tenant-user-perm.png" alt="用户级权限配置界面" caption="用户权限：为特定用户覆盖或细化访问控制" >}}

{{< figure src="/images/tenant-admin-applet/tenant-role-perm.png" alt="角色权限映射界面" caption="角色权限：将角色映射到权限集与范围化动作" >}}

4. 验证租户/平台用户分配。
5. 确认关键动作的审计日志可见性。

### 按角色的模块可见性建议

| 角色 | 建议可见模块 |
|---|---|
| 租户管理员 | Catalogue、Tenant Users、Platform Users、Applets、Tenant Roles、Permission Sets、Tenant Admins、Audit Trail |
| 安全/运维 | Tenant Roles、Permission Sets、Tenant Users、Platform Users、Audit Trail、Data Sync |
| 合规/审计 | Audit Trail、Tenant Roles（只读）、Permission Sets（只读） |

### 角色与权限治理设置

应用以下控制以降低误配置风险：

- 角色定义按业务职能划分（而非按个人划分）。
- 使用权限集沉淀可复用访问模式。
- 在需要时启用目标范围控制（company/branch/location）。
- 定期审查角色分配计数（`No. of Users`、`No. of Teams`）。

### 审计与监控配置

推荐的运营检查节奏：

- 每日：在 `Audit Trail` 审查高影响的角色/权限/管理员变更。
- 每周：核查是否存在异常模块可见性变更。
- 每月：与业务负责人复核角色与权限集使用情况。

### 环境说明

- `Data Sync` 在不同分支中可能是部分实现。
- `Subscription` 的主机名相关功能可能需要按环境完成集成。
- 在你的部署分支中校验 settings 路由默认值，避免重定向不一致。

## FAQ

**Q1: 用户已分配但仍看不到模块，应该先检查什么？**  
A: 按顺序检查：`Settings` 的模块可见性、用户分配（`Tenant Users`/`Platform Users`）、角色分配、关联权限集。

**Q2: 什么时候使用 Tenant Users，什么时候使用 Platform Users？**  
A: `Tenant Users` 用于租户范围账号操作；`Platform Users` 用于从平台级身份上下文管理访问。

**Q3: 如何安全地把新角色发布给大量用户？**  
A: 先用试点用户验证角色并映射正确权限集，再分批发布，同时监控 `Audit Trail`。

**Q4: 如何快速批量上线角色？**  
A: 使用 `Role File Import`：下载示例 CSV，填写必填列并上传，然后检查文件状态和错误行。

**Q5: 如何核实是谁改了权限或角色设置？**  
A: 使用 `Audit Trail` 过滤器（操作者、动作、日期），并查看事件明细进行追溯。

**Q6: 为什么有些标签只显示英文？**  
A: 部分视图依赖共享主机 `labels` 翻译；不可用时组件会回退到内置英文文本。

**Q7: 上线前要验证哪些内容？**  
A: 验证模块可见性、默认值、角色、权限集、用户分配、备用管理员，并执行一次端到端测试并在 `Audit Trail` 留痕。

**Q8: Data Sync 在所有环境都可直接用于生产吗？**  
A: 不一定。请按分支/环境确认就绪度，因为部分实现仍包含 TODO 或仅部分接线。



