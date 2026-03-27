---
title: "供应商 Applet"
description: "面向供应商入驻、付款设置、信用控制、文件操作与实体合并的综合供应商主数据管理"
tags:
- supplier-management
- procurement
- accounts-payable
- master-data
- file-import
- file-export
- entity-merging
- credit-control
weight: 70
---

## 用途与概览

**Supplier Applet** 是一个集中式工作台，用于统一管理采购与财务场景下的供应商主数据。它支持供应商入驻、资料维护、付款与税务设置、信用控制、批量导入/导出流程，以及重复实体清理。

{{< callout type="info" >}}
**核心概念**：该 applet 将 **向谁采购**（Supplier Profile）、**如何交易**（Payment/Tax/Credit setup）与 **如何治理数据**（Settings、权限与合并工具）连接在一起。
{{< /callout >}}

## 关键功能概览

### 谁会从这个 Applet 受益？

**采购团队：**
- 快速创建并维护供应商档案
- 使用分类与分支关联提高业务准确性
- 减少因供应商信息不完整导致的采购延误

**财务与应付账款团队：**
- 在一个地方维护付款配置与税务数据
- 一致地管控信用账期与信用额度
- 使用文件导出与汇总视图进行对账

**数据管理员 / 主数据团队：**
- 执行供应商与信用数据的批量导入流程
- 使用合并工具清理重复实体
- 监控处理结果与错误信息

**系统管理员：**
- 配置字段可见性与标签页行为
- 设置 applet 默认值与分支分组规则
- 管理功能可见性与权限页面

### 这个 Applet 解决了什么问题？

**常见供应商数据问题：**
- 跨团队重复创建供应商
- 付款与税务信息不一致
- 入驻与更新流程手工化、效率低
- 导入/导出与合并状态缺少可视化

**Supplier Applet 带来的结果：**
- **单一供应商主数据来源**，支持采购与财务共用
- **结构化创建/编辑标签页**，保证供应商资料完整
- **批量数据流程**，支持规模化维护
- **实体合并流程**，安全去重供应商数据
- **可配置治理能力**，通过设置与权限统一控制

## 关键功能概览

{{< cards >}}
  {{< card title="Supplier Listing" subtitle="Search, filter, create, and edit supplier records" link="#supplier-listing" >}}
  {{< card title="Supplier Edit Tabs" subtitle="Maintain login, payment, tax, address, contact, and more" link="#supplier-createedit-form" >}}
  {{< card title="Credit Controls" subtitle="Credit term/limit listings and bulk upload menus" link="#credit-controls" >}}
  {{< card title="File Import & Export" subtitle="CSV-based bulk maintenance and export generation" link="#file-import--export" >}}
  {{< card title="Consolidated ARAP" subtitle="Consolidated AR/AP listing for enabled tenants" link="#consolidated-arap" >}}
  {{< card title="Entity Merging" subtitle="Criteria-based duplicate merge and processing tracking" link="#entity-merging" >}}
  {{< card title="Configuration" subtitle="Field settings, default selection, and branch grouping" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/supplier-applet/supplier-applet-overview.png" alt="供应商 applet 概览，展示供应商维护、批量数据操作与设置" caption="Supplier Applet 概览：在一个 applet 中完成供应商资料管理、配置与数据治理。" >}}

## 核心概念

### 理解供应商管理框架

| 维度 | 组件 | 实际示例 |
|--------|-----------|------------------|
| **向谁采购** | Supplier Profile | 供应商编码、名称、类型、状态 |
| **如何交易** | Payment/Tax/Credit setup | 付款配置、税务明细、信用账期与额度 |
| **如何治理数据** | Settings + Merge tools | 字段可见性、默认值、实体合并 |

### 供应商数据层级

```
Supplier Applet
|
|-- Supplier Listing
|   |-- Supplier Create/Edit Tabs
|   |   |-- Main
|   |   |-- E-Invoice / Peppol Config
|   |   |-- Login / Driver Login
|   |   |-- Payment Config / Tax
|   |   |-- Address / Contact
|   |   |-- Credit Term and Limit
|   |   |-- Branch / Company / Item Pricing
|   |   `-- Documents
|
|-- Supporting Menus
|   |-- Category
|   |-- Credit Term Listing
|   |-- Credit Limit Listing
|   |-- File Import / File Export
|   |-- Upload Credit Terms / Upload Credit Limits
|   |-- Consolidated ARAP
|   `-- Entity Merging / Entity Merge Processing
|
`-- Settings & Personalization
```

### 供应商控制三角

| 组件 | 作用 | 示例 |
|-----------|------|---------|
| **Profile** | 供应商身份与状态 | Supplier Code、Supplier Name、Type |
| **Transaction Setup** | 交易相关配置 | 银行账户、税务类型、税码 |
| **Control Layer** | 规则与清理治理 | 信用规则、字段设置、合并条件 |

---

## 快速上手指南

### 面向采购：创建你的第一个供应商

**目标：** 创建可直接使用的供应商档案。

1. 打开 **Supplier Listing**。
2. 点击 **+** 创建供应商。
3. 在 **Main** 完成基础信息（编码/名称/类型/状态）。
4. 添加 **Address** 与 **Contact** 记录。
5. 添加 **Category** 与必要的业务关联。
6. 与财务确认 **Payment Config** 与 **Tax** 的必填要求。
7. 在必需资料完成后，将状态设置为 **Active**。
8. 保存并在列表中确认供应商已出现。

{{< figure src="/images/supplier-applet/supplier-listing.png" alt="供应商列表，包含创建入口与可搜索行" caption="Supplier Listing：从这里开始创建供应商，并打开已有记录进行维护。" >}}

### 面向财务：配置付款与税务

**目标：** 让供应商资料达到可付款状态。

1. 在列表中打开供应商记录。
2. 进入 **Payment Config** 标签并新增一条付款配置。
3. 填写 `Payee Residential Status`、`Country`、`Bank`、账户字段及可选到期日。
4. 确认选择银行后 `Swift Code` 自动带出。
5. 进入 **Tax** 标签并维护税务信息。
6. 在 **Credit Term and Limit** 中确认信用配置。
7. 保存并复核更新结果。

{{< figure src="/images/supplier-applet/payment-config-create.png" alt="Payment Config 创建表单，包含收款人状态、银行、账户与国家字段" caption="Payment Config：维护财务流程使用的供应商付款方式信息。" >}}

### 面向数据管理员：执行批量操作

**目标：** 规模化维护供应商数据。

1. 使用 **File Import** 上传供应商 CSV 文件。
2. 上传前选择正确分隔符（`PIPE`、`COMMA`、`SEMICOLON`、`TAB`）。
3. 使用 **Sample Format** 校验文件结构后再提交。
4. 使用 **Upload Credit Terms** 与 **Upload Credit Limits** 批量更新信用数据。
5. 检查列表中的处理状态与错误信息。
6. 使用 **File Export** 生成供应商 CSV 导出文件。

{{< figure src="/images/supplier-applet/menu-file-import.png" alt="文件导入页面，包含分隔符选择与 CSV 上传区域" caption="File Import：上传供应商主数据 CSV 并提交处理。" >}}

### 面向管理员：配置 Applet

**目标：** 建立治理规则与默认行为。

1. 打开 **Settings > Application Settings**。
2. 配置菜单与标签页可见性规则。
3. 在 **Settings > Default Selection** 设置默认值。
4. 如有需要，配置 **Entity Branch Group**。
5. 检查设置路由下的角色与用户权限。
6. 执行端到端测试（创建供应商、添加付款配置、验证列表可见性）。

{{< figure src="/images/supplier-applet/supplier-settings.png" alt="供应商设置页面，包含字段配置与默认选择" caption="Settings：控制 applet 行为、标签页可见性与默认配置。" >}}

---

## 侧边菜单参考

### 主菜单

| 菜单 | 功能说明 | 典型用途 |
|------|--------------|-------------|
| **Supplier** | 供应商目录与编辑入口 | 创建并维护供应商主数据 |
| **Category** | 供应商分类主数据 | 按分类进行筛选与报表 |
| **Credit Term Listing** | 信用账期主数据 | 维护可用账期规则 |
| **Credit Limit Listing** | 信用额度主数据 | 维护可用额度规则 |
| **File Import** | 供应商 CSV 导入 | 批量创建/更新供应商 |
| **Upload Credit Terms** | 信用账期文件上传 | 批量分配/更新供应商账期 |
| **Upload Credit Limits** | 信用额度文件上传 | 批量分配/更新供应商额度 |
| **File Export** | 供应商导出任务列表 | 生成并下载 CSV 快照 |
| **Consolidated ARAP** | 汇总账户列表 | 查看汇总 AR/AP 记录 |
| **Entity Merging** | 重复实体分组与合并 | 供应商去重 |
| **Entity Merge Processing** | 合并队列结果列表 | 跟踪合并进度与结果 |
| **Settings** | applet 设置、功能可见性、权限 | |
| **Personalization** | 个人默认选择与侧边栏设置 |  |

<a id="supplier-listing"></a>
## 供应商列表

供应商列表包含以下关键列：
- Supplier Code
- Supplier Name
- Supplier Type
- Created/Modified By and Date
- Status

你可以通过列表筛选与搜索快速定位并打开供应商记录。

{{< figure src="/images/supplier-applet/supplier-listing.png" alt="供应商列表，包含创建入口与可搜索行" caption="Supplier Listing：从这里开始创建供应商，并打开已有记录进行维护。" >}}

{{< figure src="/images/supplier-applet/supplier-search.png" alt="供应商高级搜索" caption="Supplier Advance Search：使用高级搜索快速定位目标供应商。" >}}

<a id="supplier-createedit-form"></a>
## 供应商创建/编辑表单

供应商编辑页面采用多标签结构，并支持标签顺序与可见性配置。

### 标签页说明

| 标签页 | 主要功能 |
|-----|---------------|
| **Main** | 供应商核心资料 |
| **E-Invoice** | 电子发票身份与相关配置字段 |
| **Peppol Config** | Peppol 参与者链接管理与通知选项 |
| **Category** | 供应商分类关联 |
| **Login** | 供应商登录主体关联 |
| **Applet Catalog** | 将供应商关联到 applet catalog |
| **Driver Login** | 司机登录关联记录 |
| **Payment Config** | 供应商付款方式 |
| **Tax** | 供应商税务信息 |
| **Address** | 地址维护（主/账单/收货及地址类型） |
| **Contact** | 联系人维护 |
| **Credit Term and Limit** | 信用账期与额度设置 |
| **Branch Linking** | 分支关联记录 |
| **Supplier Branch** | 跨公司供应商分支记录 |
| **Company Linking** | 供应商-公司关联及相关控制 |
| **Item Pricing** | 供应商物料价格记录 |
| **Remark** | 备注文本 |
| **Employee** | 员工关联上下文 |
| **Documents** | 采购与付款相关单据历史 |

{{< figure src="/images/supplier-applet/supplier-create-form.png" alt="供应商创建与编辑表单，包含多个业务标签页" caption="Supplier Create/Edit：在资料、财务与关联标签页中维护供应商数据。" >}}

### Payment Config 字段说明

根据 payment config 的创建/编辑组件，主要字段如下：

| 字段 | 功能 |
|-------|----------|
| **Payee Residential Status** | 收款人居民/非居民分类 |
| **Country** | 付款国家上下文 |
| **Bank** | 银行选择 |
| **Swift Code** | 根据银行自动带出 |
| **Bank Acc No.** | 银行账号 |
| **Bank Acc Holder Name** | 账户名 |
| **IBN Number** | 附加账户标识 |
| **Account Expiry** | 可选账户到期日 |

<a id="credit-controls"></a>
## 信用控制

### 信用账期列表（Credit Term Listing）

使用 **Credit Term Listing** 定义并维护供应商可复用的标准信用账期规则。

你可以在这个菜单中：
- 在一个网格里查看所有账期（Credit Term Code、Credit Term Name、Status、Modification Date）
- 搜索和筛选账期规则
- 新建信用账期记录
- 打开并编辑现有账期
- 通过状态控制启用或停用账期

创建/编辑可配置内容：
- **Credit Term Code** 与 **Credit Term Name**
- **Status**
- **Set Year / Set Month / Set Day**
- **Add Year / Add Month / Add Day**
- 编辑模式中的审计信息（**Created By**、**Creation Date**、**Modified By**、**Modified Date**）

对客户的业务价值：
- 统一付款账期逻辑，确保采购与财务在供应商账期计算上保持一致。

{{< figure src="/images/supplier-applet/menu-credit-term-listing.png" alt="信用账期列表" caption="Supplier Credit Term Listing：查看信用账期列表。" >}}

### 信用额度列表（Credit Limit Listing）

使用 **Credit Limit Listing** 定义并维护供应商信用控制所需的额度规则。

你可以在这个菜单中：
- 在一个网格里查看所有额度（Credit Limit Code、Credit Limit Name、Status、Modification Date）
- 搜索与筛选额度记录
- 新建信用额度记录
- 打开并编辑现有额度
- 通过状态控制启用或停用额度

创建/编辑可配置内容：
- **Credit Limit Code** 与 **Credit Limit Name**
- **Status**
- **Currency**
- **Credit Limit Amount**
- 编辑模式中的审计信息（**Created By**、**Creation Date**、**Modified By**、**Modified Date**）

对客户的业务价值：
- 在供应商交易执行前落实一致的财务风险边界。

{{< figure src="/images/supplier-applet/menu-credit-limit-listing.png" alt="信用额度列表" caption="Supplier Credit Limit Listing：查看信用额度列表。" >}}

### 上传菜单

- **Upload Credit Terms**：批量导入供应商信用账期分配。
- **Upload Credit Limits**：批量导入供应商信用额度分配。

两个导入列表都提供文件名、格式、处理状态与错误信息等字段。

<a id="file-import--export"></a>
## 文件导入与导出（File Import & Export）

### 文件导入（File Import）

供应商文件导入支持：
- 分隔符选择：`PIPE`、`COMMA`、`SEMICOLON`、`TAB`
- 通过拖拽或文件选择上传 CSV
- 下载 Sample Format
- 在导入列表中监控处理状态（`Process Status`、`Error Message`）

{{< figure src="/images/supplier-applet/menu-file-import.png" alt="文件导入列表" caption="File Import：查看 Supplier Applet 中的导入记录列表。" >}}

{{< figure src="/images/supplier-applet/menu-file-import-1.png" alt="文件导入菜单" caption="File Import Create：导入文件时的配置页面。" >}}

{{< figure src="/images/supplier-applet/menu-file-import-error.png" alt="文件导入错误" caption="File Import Checking：检查 CSV 导入错误。" >}}

### 文件导出（File Export）

供应商文件导出支持：
- 日期过滤（`created_date_from`、`created_date_to`）
- 生成 CSV（`Generate CSV`）
- 在导出列表中跟踪状态，并执行下载/删除操作

{{< figure src="/images/supplier-applet/menu-file-export.png" alt="文件导出列表，包含生成按钮、状态列与下载操作" caption="File Export：生成供应商 CSV 并跟踪处理状态。" >}}

<a id="consolidated-arap"></a>
## 综合应收应付（Consolidated ARAP）

使用 **Consolidated ARAP** 维护 AR/AP 流程中的汇总账户记录及其关联关系。

主列表功能：
- 查看汇总账户记录，字段包括：
  - **Account Code**
  - **Account Name**
  - **Nick Name**
  - **Description**
  - **Status**
  - **Created Date / Updated Date**
- 按关键字搜索并使用高级筛选
- 打开记录进行编辑
- 新建 Consolidated ARAP 记录

创建/编辑（Main 标签）功能：
- 维护 **Acc Code**、**Acc Name**、**Acc Nickname**、**Description**、**Status**
- 保存账户配置更新
- 在编辑模式下按需删除记录
- 查看审计字段（created/modified by and date）

编辑模式下的附加标签：
- **Entity**：将供应商实体链接到所选 Consolidated ARAP 账户
- **Login**：管理登录主体链接（User Email、Rank、Status、Modified Date）
- **Applet Catalog**：管理 applet catalog 链接（Catalogue Code/Name/Type、Description、No. of Applets）

对客户的业务价值：
- 为财务提供一个结构化入口，统一维护汇总账户及其实体关联。

{{< figure src="/images/supplier-applet/menu-consolidated-arap.png" alt="Consolidated ARAP 列表，包含账户级字段与筛选" caption="Consolidated ARAP：在启用租户中查看汇总 AR/AP 记录。" >}}

<a id="entity-merging"></a>
## 实体合并（Entity Merging）

实体合并支持按以下条件进行去重：
- Entity Name
- Entity ID No
- Entity Phone
- Entity Email

来自组件逻辑的重要行为：
- 合并网格初始为空。
- 仅在选择 **Merge Criteria** 后加载数据。

执行合并后，可通过 **Entity Merge Processing** 跟踪合并状态与 merged/total 进度。

{{< figure src="/images/supplier-applet/menu-entity-merging.png" alt="实体合并页面，包含合并条件选择与重复分组" caption="Entity Merging：选择条件、查看分组记录并执行去重合并。" >}}

{{< figure src="/images/supplier-applet/menu-entity-merge-processing.png" alt="实体合并处理列表，包含状态与进度列" caption="Entity Merge Processing：跟踪合并结果与完成进度。" >}}

---

<a id="configuration--settings"></a>
## 配置与设置（Configuration & Settings）

设置路由包括：
- **Default Selection** (`settings/default-selection`)
- **Field Settings** (`settings/field-settings`)
- **Feature Visibility** (`settings/feature-visibility`)
- **Permission screens** (`permission-set`、`user-permission`、`team-permission`、`role-permission`、`permission-wizard`)
- **Entity Branch Group** (`settings/entity-branch-group`)
- **Webhook** (`settings/webhook`)

### Application Settings 重点项

字段设置中可配置：
- 菜单可见性（Category、Credit Term/Limit listings、File Import/Export、Consolidated ARAP、Entity Merging）
- 供应商主表字段（email、phone、supplier code、status、currency、tax id 等）
- 供应商详情标签（Payment Config、Tax、Address、Contact、Credit Term and Limit、Peppol、E-Invoice、Documents 等）

### Personalization（个性化）

个性化路由包括：
- `personalization/personal-default-selection`
- `personalization/sidebar`

{{< figure src="/images/supplier-applet/personal.png" alt="个性化设置" caption="Personalization：每位用户可自定义设置（可选择默认 branch 与默认 location）。" >}}


---

## 集成点（Integration Points）

| 模块 | 集成目的 |
|--------|---------------------|
| **Purchasing** | 在采购单据与供应商相关交易中引用供应商 |
| **Accounts Payable** | 支持付款处理与应付侧供应商数据使用 |
| **E-Invoice / Peppol** | 支持电子发票身份数据与 Peppol 参与者配置 |
| **Master Data Services** | 支持供应商批量导入/导出与跨实体维护 |
| **Reporting** | 支持基于列表/导出结果的供应商筛选与汇总 |

---

## 问题排查（Troubleshooting）

### Entity Merging 无数据

**问题：** Entity Merging 网格为空。  
**可能原因：** 尚未选择合并条件。  
**处理方式：** 先选择 **Merge Criteria**（Entity Name、ID No、Phone 或 Email），再查看加载结果。

### Payment Config 的 Swift Code 为空

**问题：** `Swift Code` 没有带出。  
**可能原因：** 未选择银行，或银行选择被改动。  
**处理方式：** 先选 `Country`，再选 `Bank`；表单会自动填充 `Swift Code`。

### 导入文件处理失败

**问题：** 导入完成但状态为失败。  
**可能原因：** 分隔符/模板不匹配，或行数据无效。  
**处理方式：** 下载 **Sample Format**，确认分隔符选择后重新上传，并查看 `Error Message`。

### 看不到某些标签或菜单

**问题：** 用户看不到预期的标签/菜单。  
**可能原因：** 被字段设置隐藏，或角色/菜单权限未开放。  
**处理方式：** 检查 **Settings > Field Settings** 以及对应角色的可见性权限配置。

---

## 相关 Applet（Related Applets）

### 核心模块 Applet
- **[Customer Maintenance Applet](/applets/customer-maintenance-applet/)** - 客户主数据
- **[Inventory Item Maintenance Applet](/applets/inv-item-maintenance-applet/)** - 供应商与商品关系
- **[Tax Configuration Applet](/applets/tax-configuration-applet/)** - 供应商税务设置

### 采购相关 Applet
- **[Purchase Order Applet](/applets/purchase-order-applet/)** - 供应商订单处理
- **[Purchase Requisition Applet](/applets/purchase-requisition-applet/)** - 采购申请
- **[Supplier Portal Applet](/applets/supplier-portal-applet/)** - 供应商自助门户

### 财务相关 Applet
- **[Accounts Payable Applet](/applets/accounts-payable-applet/)** - 供应商付款
- **[Payment Processing Applet](/applets/payment-processing-applet/)** - 供应商支付处理
- **[Expense Management Applet](/applets/expense-management-applet/)** - 供应商费用管理

---

## 最佳实践（Best Practices）

- 在大规模导入前，先制定统一的命名与编码规范。
- 将 **Category**、**Credit Term Listing**、**Credit Limit Listing** 作为受控主数据，避免临时值。
- 批量导入前先用小样本测试。
- 将 **Entity Merging** 作为常规数据治理动作，定期去重。
- 在 **Field Settings** 中保持标签页精简，仅向用户展示必要字段。
- 在供应商投入业务使用前，完成关键付款字段校验。

---

## FAQ

**问：为什么 Entity Merging 列表是空的？**  
答：这是设计行为。必须先选择 **Merge Criteria**，系统才会加载数据。

**问：Payment Config 有哪些可用字段？**  
答：包括 Payee Residential Status、Country、Bank、Swift Code、Bank Acc No.、Bank Acc Holder Name、IBN Number 和 Account Expiry。

**问：供应商导入支持什么文件格式？**  
答：支持 CSV，并可选择分隔符（`PIPE`、`COMMA`、`SEMICOLON`、`TAB`）。

**问：在哪里批量上传信用账期和信用额度？**  
答：使用 **Upload Credit Terms** 和 **Upload Credit Limits** 菜单。

**问：在哪里查看导出生成状态？**  
答：在 **File Export** 列表中，可查看状态/错误并执行下载。

**问：为什么 Supplier Edit 里看不到某些标签？**  
答：标签可见性由 **Settings > Field Settings** 以及租户权限/可见性配置控制。

**问：在哪里查看供应商关联单据历史？**  
答：在 Supplier Edit 的 **Documents** 标签中查看。

**问：为什么导入文件一直是失败状态？**  
答：请查看 `Error Message`，确认 CSV 分隔符与页面选择一致，并按 **Sample Format** 校验文件。

**问：为什么我还不能下载导出文件？**  
答：导出任务必须先生成完成。请等待 `Status` 显示完成后再下载。

---
