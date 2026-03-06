---
title: "员工 Applet"
description: "面向组织架构、访问控制、薪资与报销配置的集中式员工主数据管理"
tags:
- employee-master
- hr-management
- org-chart
- payroll-setup
- access-control
weight: 61
---

## 用途与概览

**Employee Applet** 是 Akaun Platform 中用于管理员工主数据的核心模块。它将员工档案、汇报关系、登录访问、薪资与税务配置、报销设置以及合规记录集中在同一套结构化系统中。

{{< callout type="info" >}}
**核心概念**：一条员工记录应同时连接**员工是谁**、**在组织中的位置**、**具备哪些访问权限**以及**如何发薪与报销**。
{{< /callout >}}

### 关于该 Applet

**目的：** 在 HR、财务与访问控制流程中维护准确的员工主数据与运营设置。

**目标用户：** HR 与 People Ops、Finance 与 Payroll、部门主管、IT 与系统管理员。

**关键功能：**
- 员工档案创建与维护
- 员工类别管理与标签化
- 组织结构与汇报关系
- 登录访问与权限控制
- 薪资、税务与付款配置
- 报销账户与额度可见性
- 批量文件导入与审计追踪

## 关键功能概览

### 谁能从中受益？

**HR 与 People Ops：**
- 结构化入职与档案维护
- 员工联系与地址信息的集中视图
- 快速更新分支、部门与角色

**Finance 与 Payroll：**
- 一致的付款与税务配置
- 支出限额与报销额度关联
- 干净的数据用于薪资与报销处理

**部门主管：**
- 清晰的汇报关系与团队可视化
- 已批准请假记录的跟踪与更新
- 组织结构的准确对齐

**IT 与系统管理员：**
- 登录与权限控制
- 功能可见性与访问管理
- 满足合规的 Applet 审计记录

### 解决什么问题？

**分散的员工数据问题：**

传统员工管理往往分散在表格、邮件线程与独立的 HR/Payroll 系统中，常见问题包括：
- 重复或不一致的员工记录
- 汇报关系缺失或审批不清晰
- 薪资与税务配置不准确
- 入职因手工设置而延迟
- 缺乏可追溯的审计记录

**Employee Applet 的解决方案：**

- **单一可信来源**：统一的员工主数据
- **结构化组织关系**：明确的汇报链路
- **一体化访问设置**：登录与权限集中配置
- **可用于 Payroll 的配置**：税务与付款字段完备
- **批量导入工具**：更快完成入职与更新
- **审计追踪**：满足合规与责任追溯

## 关键功能概览

{{< cards >}}
  {{< card title="Employee Master Data" subtitle="创建、编辑与管理员工档案" link="#employee-master-data" >}}

  {{< card title="Org Chart & Reporting" subtitle="定义汇报关系与组织结构" link="#org-chart-and-reporting" >}}

  {{< card title="Login & Access" subtitle="控制员工登录、权限与角色" link="#login-and-access" >}}

  {{< card title="Payroll & Tax" subtitle="配置付款与税务详情" link="#payroll-and-tax-configuration" >}}

  {{< card title="Claims & Entitlements" subtitle="管理报销账户、额度与报表" link="#claims-and-entitlements" >}}

  {{< card title="File Import" subtitle="批量上传与更新员工记录" link="#file-import" >}}

  {{< card title="Audit & Compliance" subtitle="Applet 日志与可追溯性" link="#audit-and-compliance" >}}

  {{< card title="Configuration & Settings" subtitle="默认值、字段设置与可见性" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/employee-applet/employee-applet-overview.png" alt="关键功能概览" caption="Employee Applet 关键功能概览" >}}

## 关键概念

### 员工主数据结构

| 维度 | 组件 | 示例 |
|--------|-----------|------------------|
| **员工是谁** | 档案与身份 | 姓名、ID、职称 |
| **隶属哪里** | 分支、部门、汇报关系 | KL 分支、Finance、主管 X |
| **需要哪些访问权限** | 登录与权限 | Approver、HR admin、staff |
| **如何发薪** | 付款与税务配置 | 银行信息、税务档案 |
| **可报销什么** | 报销账户与额度 | 医疗基金、差旅额度 |

{{< callout type="tip" >}}
**真实场景示例**：一名新入职的财务主管加入公司。HR 创建员工档案并分配部门与主管，IT 配置登录权限，Finance 配置税务与付款信息。该员工即可进入 Payroll 与报销流程。
{{< /callout >}}

---

## 快速上手指南

{{< figure src="/images/employee-applet/employee-applet-quick-start.png" alt="Employee Applet 快速上手" caption="Employee Applet 快速上手图示" >}}

根据角色快速开始。

### 面向 HR/管理员：创建新员工

**目标：** 添加一位包含完整档案的新员工。

1. **导航**：进入 **Employee Listing**
{{< figure src="/images/employee-applet/employee-listing.png" alt="Employee 列表" caption="Employee Listing：可查看已创建的员工" >}}
2. **创建**：点击 **+** 并填写基础信息
{{< figure src="/images/employee-applet/employee-create.png" alt="创建员工按钮" caption="创建按钮：用于新建员工" >}}
3. **补充联系人**：填写 Employee Name、Employee Code、Employee Nickname、status 等字段
{{< figure src="/images/employee-applet/employee-add-details.png" alt="填写员工信息" caption="在 Create Employee 区域填写员工字段" >}}
4. **分配结构**：设置分支、部门与 Report To
{{< figure src="/images/employee-applet/employee-create-branch.png" alt="设置员工分支" caption="在配置中设置员工分支" >}}
5. **保存**：确认并保存员工记录
{{< figure src="/images/employee-applet/employee-save.png" alt="保存按钮" caption="点击 CREATE 保存员工信息" >}}

---

### 面向部门主管：维护汇报关系与请假

**目标：** 保持团队结构与已批准请假信息准确。

1. **从列表打开员工档案**
{{< figure src="/images/employee-applet/employee-view.png" alt="查看员工详情" caption="点击员工条目查看详情" >}}
2. **更新 Report To** 以反映团队变动
{{< figure src="/images/employee-applet/employee-report.png" alt="Report To 选项卡" caption="Report To 选项卡：可新增或编辑汇报关系" >}}
3. **检查已批准请假**
{{< figure src="/images/employee-applet/employee-leave.png" alt="Approved Leave" caption="创建新的 Approved Leave 记录" >}}

{{< figure src="/images/employee-applet/employee-create-leave.png" alt="创建请假记录" caption="设置请假日期并点击 Add 保存" >}}

{{< figure src="/images/employee-applet/employee-success.png" alt="保存成功提示" caption="Approved leave 保存成功" >}}
4. **检查 Org Chart** 确认层级已更新
{{< figure src="/images/employee-applet/employee-org-chart.png" alt="Org Chart" caption="查看组织结构并核对关系" >}}

{{< figure src="/images/employee-applet/employee-org-chart-struc.png" alt="组织结构图" caption="组织结构展示" >}}
5. **保存更改** 以更新组织结构视图

---

### 面向 Finance/Payroll：配置付款与税务

**目标：** 确保员工可以进入 Payroll 流程。

1. **打开员工档案**
2. **进入 Payment Config** 并填写银行信息
{{< figure src="/images/employee-applet/employee-payment.png" alt="Payment Config 选项卡" caption="员工付款信息配置" >}}
3. **设置 Tax Profile** 与法定字段
{{< figure src="/images/employee-applet/employee-tax.png" alt="Tax 选项卡" caption="员工税务信息配置" >}}
4. **如需设置 Spending Limits**
{{< figure src="/images/employee-applet/employee-speending.png" alt="Spending Limit 选项卡" caption="员工支出限额配置" >}}
5. **复核变更** 以确认 Payroll 字段
6. **保存** 以启用 Payroll 数据
{{< figure src="/images/employee-applet/employee-saved.png" alt="保存按钮" caption="保存已编辑/新增的员工信息" >}}

---

### 面向 IT/管理员：设置权限与可见性

**目标：** 控制用户访问与功能可见性。

1. **进入 Settings**
2. **配置 Permission Sets**（角色与团队）
{{< figure src="/images/employee-applet/employee-set-perm.png" alt="权限设置" caption="为员工设置权限与角色" >}}
3. **调整 Feature Visibility**（菜单与选项卡）
{{< figure src="/images/employee-applet/employee-app-setting.png" alt="应用配置" caption="选择要隐藏或显示的选项卡" >}}

{{< figure src="/images/employee-applet/employee-hide-unhide.png" alt="应用配置" caption="启用或禁用各选项卡" >}}
4. **为员工登录分配 User Permissions**
5. **保存** 以应用访问变更

---

## Employee Master Data

员工列表是创建与管理员工记录的主入口，包含：
- 档案信息、类别与雇佣类型
- 联系人与地址管理
- 分支与公司分配
- Engagement 公司访问与 e-invoice 详情
- Peppol ID 绑定与通知配置

{{< figure src="/images/employee-applet/employee-listing.png" alt="员工列表页面" caption="Employee Listing：通过搜索与筛选管理员工主数据" >}}

{{< figure src="/images/employee-applet/employee-create.png" alt="员工创建表单" caption="Employee Create：在同一表单中更新档案、联系人与雇佣信息" >}}

{{< figure src="/images/employee-applet/employee-edit.png" alt="员工编辑表单" caption="Employee Edit：在同一表单中更新档案、联系人与雇佣信息" >}}

### 常见状态/阶段

| 状态 | 含义 | 典型用途 |
|--------|---------|-------------|
| **ACTIVE** | 员工处于启用状态 | 正常在职记录 |
| **INACTIVE** | 员工不再启用 | 离职或长期停用 |
| **DRAFT** | 档案尚未完成 | 入职过程中的记录 |

## Employee Categories

通过类别列表进行员工分类，用于报表、筛选与政策控制：
- 创建、编辑与分配员工类别
- 基于标签的 HR 与 Finance 视图分组
- Treeview 选择支持本地化标签

{{< figure src="/images/employee-applet/employee-categories.png" alt="员工类别视图" caption="Employee categories：查看员工类别与分组" >}}

## Org Chart 和汇报关系

使用组织结构工具定义并可视化汇报关系：
- 为每位员工设置 Report To
- Org Chart 列表与层级视图
- 已批准请假可视化，便于管理规划

{{< figure src="/images/employee-applet/employee-org-chart.png" alt="组织结构视图" caption="Org Chart：可视化汇报关系与团队结构" >}}

## Login 与访问控制

在员工档案中直接控制登录与访问：
- 创建与编辑员工登录凭证
{{< figure src="/images/employee-applet/employee-login.png" alt="login 选项卡" caption="员工详情中的 Login 选项卡" >}}
- 设置 rank、status 与 applet catalog 访问
{{< figure src="/images/employee-applet/employee-login-create.png" alt="login 配置" caption="员工登录配置" >}}


## Payroll 与税务配置

Payroll 就绪需要一致的财务设置：
- 付款配置与银行信息
- 税务档案与法定字段
- 员工报销支出限额

## 报销与额度

Applet 将员工记录与报销管理关联：
- 报销账户与额度关联
- HR 与 Finance 的报表可见性
- 额度余额与使用跟踪

## 文件导入

批量导入用于入职与大规模更新：
- 上传员工数据文件
- 导入前验证与预览
- 减少大规模录入工作
- 使用模板文件避免验证错误
{{< figure src="/images/employee-applet/employee-file-import.png" alt="文件导入菜单" caption="通过 CSV 导入员工信息以节省时间" >}}


### 示例导入模板

使用 CSV 或 Excel（XLSX），首行必须为表头。推荐格式：

| 列 | 是否必填 | 示例 | 说明 |
|--------|----------|---------|-------|
| **Employee Code** | 是 | EMP001 | 必须唯一 |
| **Employee Name** | 是 | Nur Aisyah | 法定姓名 |
| **Employee Type** | 是 | Merchant | 员工类型 |
| **ID Number** | 是 | EMP1234 | 员工识别号 |
| **Email** | 是 | nur@example.com | 用于登录 |
| **Phone** | 否 | +60 12-345 6789 | 含国家区号 |
| **Branch Code** | 是 | KL01 | 必须存在于 Branch 设置中 |
| **Department** | 否 | Finance | 使用标准部门名称 |
| **Report To (Employee ID)** | 否 | EMP0005 | 主管 ID |
| **Join Date** | 否 | 2026-01-15 | YYYY-MM-DD |
| **Status** | 否 | ACTIVE | ACTIVE/INACTIVE |

---

## 配置与设置

在 `Settings` 中配置 Applet 行为。

**关键配置区域：**
- **Default Selection**：分支、部门与常用默认值
- **Field Settings**：启用或隐藏字段与选项卡
- **Webhook**：与外部系统集成
- **Feature Visibility**：控制菜单与模块可见性
- **Permission Wizard and Sets**：基于角色的访问管理
- **User, Team, and Role Permissions**：细粒度权限控制
- **Personalization**：默认偏好与侧边栏布局
- **Applet Log**：用于合规审计的操作追踪

{{< figure src="/images/employee-applet/settings.png" alt="Employee Applet 设置页" caption="Settings：配置默认值、字段可见性与权限" >}}

---

## FAQ

**Q: 为什么看不到 Create Employee 按钮？**
A: 可能没有所需权限。请在 Settings 中检查角色或用户权限。

**Q: 如何批量上传员工？**
A: 进入 **File Import**，上传模板文件，验证后导入。

**Q: 如何更改员工的汇报主管？**
A: 打开员工档案并更新 **Report To** 区域。

**Q: 为什么 Payroll 或 Tax 字段被隐藏？**
A: 可在 `Settings > Field Settings` 中配置字段可见性。

**Q: 如何绑定 Peppol ID 用于电子发票？**
A: 在员工档案中使用 **Peppol ID Link** 区域。

**Q: 为什么看不到 Org Chart 菜单？**
A: 功能可见性或角色权限可能限制访问。请检查 `Settings > Feature Visibility`。
