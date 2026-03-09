---
title: "内部付款凭证 Applet"
description: "内部付款凭证的端到端处理：创建凭证、管理费用与付款、处理结算与调整，并支持批量导入导出。"
tags:
- internal-payment-voucher
- finance
- accounts-payable
- payments
- settlement
- contra
- intercompany
- import
- export
weight: 20
---

## 目的与概览

**Internal Payment Voucher Applet** 简化了内部付款凭证的完整生命周期，从创建与费用录入，到结算、调整与最终过账。它整合了凭证抬头、费用行、付款行与可追溯性，帮助财务团队在以下主菜单中高效、可控地处理付款：**Internal Payment Voucher**、**File Import**、**File Export**、**Intercompany**、**Settlement Adjustment**、**Expenses Adjustment**。

{{< callout type="info" >}}
**核心概念**：此 Applet 将**付款对象**（实体/供应商）与**付款内容**（费用行）以及**结算方式**（付款行、对冲与调整）关联起来，同时保留过账与审计可追溯性。
{{< /callout >}}

## 关于此 Applet

- **目的**：创建、跟踪并最终完成内部付款凭证，并提供结算、调整与审计控制。
- **目标用户**：应付账款文员、财务主管、资金/付款运营人员、财务经理与控制人员。
- **关键功能**：凭证生命周期管理、费用与行项目录入、付款与结算处理、调整与对冲、内部往来处理、文件导入/导出，以及 **Final/Discard/Void**、**Send Email**、**Single/Multiple Print**、**Clone** 等操作控制。

## 关键功能概览

### 谁会从此 Applet 受益？

**应付账款与财务主管：**
- 更快的凭证创建与可控编辑
- 费用、付款与余额清晰可见
- 内建 Final、Discard、Void 操作

**资金与付款运营：**
- 付款行与结算跟踪更有序
- 可直接导出银行处理文件
- 更好地协调付款时间与方式

**财务经理与控制人员：**
- 便于复核的凭证与结算一致性
- 结账前的 Trace Document 可见性
- 合规审计轨迹

**审计与合规人员：**
- 完整的凭证变更与状态历史
- 从凭证到过账的可追溯性
- 附件与单据关联

### 解决哪些问题？

**手工付款凭证的问题：**

手工处理通常会导致：
- 费用明细缺失或不一致
- 审批缓慢、付款延迟
- 结算余额不清晰
- 审计轨迹薄弱、难以追溯

**Internal Payment Voucher Applet 的解决方案：**

- **结构化凭证录入**（抬头、费用、付款）
- **内建结算控制**与调整流程
- **对冲（Contra）处理**以抵消余额
- **内部往来处理**支持跨实体结算
- **可导出文件**便于后续付款处理
- **审计可追溯性**通过 Trace 与日志实现

## 关键功能概览

{{< cards >}}
  {{< card title="Voucher Management" subtitle="Create, edit, and finalize internal payment vouchers" link="#voucher-management" >}}
  {{< card title="Line Item and Expenses" subtitle="Capture expense details with cost coding" link="#line-item-and-expenses" >}}
  {{< card title="Payments and Settlement" subtitle="Add payment lines and manage settlement" link="#payments-and-settlement" >}}
  {{< card title="Adjustments and Contra" subtitle="Handle expenses and settlement adjustments" link="#adjustments-and-contra" >}}
  {{< card title="File Import" subtitle="Bulk creation of payment vouchers" link="#file-import" >}}
  {{< card title="File Export (CSV)" subtitle="Generate payment export files by date" link="#file-export-csv" >}}
  {{< card title="Intercompany Processing" subtitle="Track unprocessed and processed intercompany" link="#intercompany-processing" >}}
  {{< card title="Trace and Audit" subtitle="Trace documents and audit logs" link="#trace-and-audit" >}}
{{< /cards >}}

{{< figure src="/images/internal-payment-voucher-applet/internal-payment-voucher-overview.png" alt="Internal Payment Voucher overview infographic" caption="Infographic highlighting challenges, solutions, and beneficiary roles." >}}

内部付款凭证概览

## 关键概念

### 理解付款凭证框架

| 维度 | 组件 | 实际示例 |
|--------|-----------|------------------|
| **付款对象** | 实体或供应商 | Vendor ABC Trading |
| **付款内容** | 费用行项目 | Freight Charge, RM 2,500 |
| **结算方式** | 付款行与结算 | Bank transfer, contra offset |
| **过账去向** | AR/AP 与 Trace Document | Posting to AP and Cashbook |

{{< callout type="tip" >}}
**示例**：为运费创建付款凭证，关联供应商，填写成本分摊，使用银行转账付款，并通过 Trace 查看最终过账用于审计。
{{< /callout >}}

### 付款凭证层级结构

```
Organization
│
├── Entities/Suppliers ──> WHO is paid?
│   │
│   └── Voucher Header ──> Core document details
│       │
│       ├── Account & Address Details
│       ├── Expense Lines & Cost Coding
│       └── Payment Lines & Settlement
│
└── Adjustments & Contra ──> Balance corrections
    │
    └── Trace Document ──> Posting visibility
```

**流程贯穿层级：**

1. **组织**：公司政策与控制
2. **实体**：供应商或收款方
3. **凭证抬头**：分支、日期、币种、参考号
4. **费用**：行项目与成本分配
5. **付款**：方式与结算明细
6. **调整/对冲**：修正与抵消
7. **Trace Document**：过账状态与审计

### 付款的“结算三角”

| 组件 | 角色 | 示例 |
|-----------|------|---------|
| **凭证抬头** | 被支付的单据 | IPV-2026-00045 |
| **付款行** | 实际执行付款的方式 | Bank transfer, cheque |
| **结算/对冲** | 余额清算方式 | Offset against AP invoice |

该三角结构确保付款处理一致且可审计。任一边发生变化，另外两边都需要复核，以保持凭证平衡。

---

## 快速开始指南

{{< figure src="/images/internal-payment-voucher-applet/internal-payment-voucher-quick-start.png" alt="Quick start infographic for Internal Payment Voucher" caption="Role-based quick start flow for creating, reviewing, and exporting vouchers." >}}

### 面向财务主管：创建首张付款凭证

1. 从侧边栏进入 **Internal Payment Voucher**。
{{< figure src="/images/internal-payment-voucher-applet/pv.png" alt="Internal Payment Voucher listing" caption="Listing view with filters, actions, and email template selection." >}}
2. 点击 **+** 并填写主要信息（分支、公司、日期、币种、参考号）。
{{< figure src="/images/internal-payment-voucher-applet/pv-add.png" alt="Add Internal Payment Voucher button" caption="Plus button on the listing used to create a new voucher." >}}
3. 打开 **Account**，选择实体、账单与收货信息。
{{< figure src="/images/internal-payment-voucher-applet/pv-entity.png" alt="Account tab with Entity Details" caption="Entity Details fields for the payee in the Account tab." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-entity-select.png" alt="Select Entity dialog" caption="Entity selection list used to populate Account details." >}}

4. 打开 **Expenses**，添加费用行与成本分摊。

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses.png" alt="Expenses tab with item list and Select Item" caption="Expenses tab with line list and item selection panel." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses-line.png" alt="Add Item form - Item Details" caption="Add Item form showing Item Details fields." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-batch.png" alt="Add Item form - Batch Number" caption="Batch Number tab for lot-controlled items." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-sn.png" alt="Add Item form - Serial Number" caption="Serial Number tab for serialized items with scan/import." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-bi.png" alt="Add Item form - Item Details (Main Details)" caption="Item Details main fields for the selected item." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-cost.png" alt="Add Item form - Costing Details" caption="Costing Details tab for cost allocation and pivot view." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-issue-link.png" alt="Add Item form - Issue Link" caption="Issue Link tab for linking related issues or tickets." >}}

5. 打开 **Payment**，添加付款行使应付金额一致。

{{< figure src="/images/internal-payment-voucher-applet/pv-payment.png" alt="Payment tab in voucher edit" caption="Payment tab ready for settlement lines." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-add.png" alt="Add Settlement drawer" caption="Add Settlement form with Settlement Group and Method." >}}

**结算类型参考（示例，取决于你配置的付款方式）：**

| 结算类型 | 适用场景 | 说明 |
|-----------------|-------------|-------|
| **Cash** | 现场现金付款 | Final 后过账到现金簿 |
| **Bank Transfer** | 银行转账 | 如有需要请填写银行参考号 |
| **Cheque** | 支票付款 | 记录支票号与日期 |
| **Contra/Offset** | 与关联单据对冲 | 不发生现金流，减少未结余额 |
| **Other (FPX/e-Wallet)** | 数字支付渠道 | 仅在已配置该结算方式时使用 |

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-data.png" alt="Payment lines with totals" caption="Payment line list showing total payment and balances." >}}

6. 若余额不为 0，请检查 **AR/AP** 或 **Settlement Adjustment**。

{{< figure src="/images/internal-payment-voucher-applet/pv-arap.png" alt="AR/AP tab summary" caption="AR/AP summary for settlement, contra, and outstanding balances." >}}

7. 如需存档审批或发票，请添加 **Doc Link** 或 **Attachments**。

{{< figure src="/images/internal-payment-voucher-applet/pv-doc-link.png" alt="Doc Link tab" caption="Doc Link tab for linking related documents." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-attach.png" alt="Attachments tab" caption="Attachments tab for uploading supporting files." >}}

8. 点击 **Save** 保存草稿，或点击 **Final** 锁定凭证。

{{< figure src="/images/internal-payment-voucher-applet/pv-save.png" alt="Save action in voucher edit" caption="Save button on the voucher form." >}}

**接下来会发生什么？** 经理或控制人员可进行复核并最终确认，Trace Document 会在可用时反映过账状态。

{{< callout type="tip" >}}
**小技巧**：在列表中使用 **Send Email** 与 **Single/Multiple Print** 可加快沟通与审批。
{{< /callout >}}

---

### 面向经理/主管：复核并定稿

1. 打开 **Internal Payment Voucher** 并按状态或日期筛选。
{{< figure src="/images/internal-payment-voucher-applet/pv-stat-date.png" alt="Advanced search filters" caption="Status and date range filters for the listing." >}}
2. 复核 **Main Details**、**Expenses**、**Payment** 标签页的完整性。
{{< figure src="/images/internal-payment-voucher-applet/pv-edit.png" alt="Edit Internal Payment Voucher - Main Details" caption="Edit view showing Main Details fields and actions." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses-edit.png" alt="Expenses tab in edit view" caption="Expenses tab with line items and totals." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-edit.png" alt="Payment tab in edit view" caption="Payment tab showing settlement lines and totals." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-edit-1.png" alt="Edit Payment form" caption="Edit Payment form with Settlement Type, Method, Date, and Amount." >}}

3. 若余额不一致，请检查 **Settlement Adjustment** 或 **Contra**。

{{< figure src="/images/internal-payment-voucher-applet/pv-contra.png" alt="Contra tab in voucher edit" caption="Contra tab listing offsets and balances." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-contra-add.png" alt="Add Contra button" caption="Plus button used to add a contra document." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-contra-add-1.png" alt="Select document to contra" caption="Selection list for choosing documents to offset." >}}

4. 复核 **Trace Document**（如可用）以确认过账就绪状态。

{{< figure src="/images/internal-payment-voucher-applet/pv-trace-doc.png" alt="Trace Document tabs" caption="Trace Document tabs for Journal, Cashbook, Points, Tax, and Inventory." >}}

**Trace Document 差异说明**

| Trace 类型 | 含义 | 出现时机 | 重要性 |
|------------|--------------------|----------------|----------------|
| **Journal Txn** | 总账过账记录 | 凭证 **Final** 且生成 GL 过账后 | 核对借贷科目与金额 |
| **Cashbook Txn** | 现金/银行流水 | 凭证 **Final** 且结算方式过账到现金/银行后 | 校验银行或现金影响与参考号 |
| **Points Txn** | 积分台账变动 | 仅在使用积分结算时出现 | 核对积分扣减或累积 |
| **Tax Txn** | 税务过账记录 | 费用行包含税务时出现 | 核对税额与税务科目 |
| **Inv Txn** | 库存过账记录 | 费用影响库存项目时出现 | 核对库存影响与计价 |

5. 点击 **Final** 通过审批，或需要更正时离线 **Query**。

{{< figure src="/images/internal-payment-voucher-applet/pv-final.png" alt="Final action in Trace Document view" caption="Final button highlighted with Trace Document tab open." >}}

---

### 面向管理员：初始系统设置

1. 在 **Settings > Application Settings** 中配置关键标签页的显示/隐藏。

{{< figure src="/images/internal-payment-voucher-applet/pv-app-setting.png" alt="Application Settings" caption="Application Settings for field visibility and tab configuration." >}}

2. 在 **Settings > Default Selection** 中设置默认值以加快录入。

{{< figure src="/images/internal-payment-voucher-applet/pv-deff-setting.png" alt="Default Selection settings" caption="Default Selection settings for branch and location defaults." >}}

3. 配置 **Printable Format Settings** 以控制凭证输出格式。

{{< figure src="/images/internal-payment-voucher-applet/pv-print-format.png" alt="Printable Format Settings listing" caption="Printable Format Settings listing for voucher templates." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-print-add.png" alt="Add Printable Format" caption="Add Printable Format form with upload area." >}}

4. 配置 **Email Template** 用于凭证通知。

{{< figure src="/images/internal-payment-voucher-applet/pv-email.png" alt="Email Template listing" caption="Email Template list for voucher notifications." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-email-add.png" alt="Create Email Template form" caption="Create Email Template form with printable format and template body." >}}

5. 检查 **Permissions** 与字段可见性以落实角色权限。

{{< figure src="/images/internal-payment-voucher-applet/pv-perm-setting.png" alt="Permission Set settings" caption="Permission Set listing for role-based access." >}}

6. 测试完整流程（创建 → 付款 → Final → Trace）。



---

### 面向资金/付款运营：生成付款导出（CSV）

1. 从侧边栏打开 **File Export**。

{{< figure src="/images/internal-payment-voucher-applet/pv-export.png" alt="Payment Voucher File Export listing" caption="File Export listing with Generate CSV and export history." >}}

2. 选择交易日期范围。

{{< figure src="/images/internal-payment-voucher-applet/pv-export-date.png" alt="File Export date range filters" caption="Choose transaction date range before generating CSV." >}}

3. 点击 **Generate CSV** 下载付款文件。

{{< figure src="/images/internal-payment-voucher-applet/pv-generate-csv.png" alt="Generate CSV action" caption="Generate CSV button in File Export." >}}

4. 确认导出记录出现在列表中。

{{< figure src="/images/internal-payment-voucher-applet/pv-saved-gene.png" alt="Generated export entry" caption="Export listing showing a generated CSV with download action." >}}

---

### 面向财务运营：批量导入付款凭证

1. 从侧边栏打开 **File Import**。
{{< figure src="/images/internal-payment-voucher-applet/pv-file-import.png" alt="File Import listing" caption="File Import listing with uploaded files and statuses." >}}
2. 下载并填写导入模板（Excel/CSV）。Excel/CSV 模板文件可从 **File Export** 菜单下载。

3. 上传文件并在 **Checking** 标签页查看。
{{< figure src="/images/internal-payment-voucher-applet/pv-import-check.png" alt="File Import Checking tab" caption="Checking tab showing validation results." >}}
4. 修正错误后重新上传。
5. 确认导入结果并检查生成的凭证。


{{< callout type="tip" >}}
**上线检查清单**：从草稿到 Final 的完整流程需验证，包括付款行、调整以及 Trace Document 可见性。
{{< /callout >}}

---

## 付款分配与结算跟踪

当结算状态清晰时，付款凭证才算完整。本节说明如何确认已付款、已对冲与未结余额。

### 如何检查结算状态

1. 打开凭证并进入 **Payment** 标签查看付款行。
2. 检查 **Settlement Adjustment** 以修正或平衡。
3. 在 **AR/AP**（编辑视图）中确认未结与已结金额。
4. 修改 **Expenses** 或 **Payment** 后重新核对合计。

### 关键特性

- 费用或付款变更后实时重新计算
- 结算调整流程用于更正
- 支持对冲（Contra）抵消相关单据

### 常见场景

**场景 1：部分付款**
```
Voucher amount: RM 10,000
Payment recorded: RM 6,000
Status: Partially settled, RM 4,000 outstanding
```

**场景 2：含对冲的全额结清**
```
Voucher amount: RM 5,000
Payment: RM 2,000
Contra offset: RM 3,000
Status: Fully settled
```

### 财务团队提示

- 修改费用行后重新核对结算
- 晚期更正建议使用调整而非重开发票
- Final 前确认 AR/AP 余额

---

## 凭证管理

核心流程集中在 **Internal Payment Voucher** 菜单：

- **列表与筛选** 支持高级搜索与列显示
- **创建、编辑、克隆** 可在列表中完成
- 按状态 **Final/Discard/Void**
- 列表直接 **Send Email** 与 **Print**（发送邮件需先选模板）
- Send Email 的 **Template selection** 位于列表工具栏

{{< figure src="/images/internal-payment-voucher-applet/pv.png" alt="Internal Payment Voucher listing (alternate view)" caption="Listing view for Internal Payment Voucher." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-edit.png" alt="Internal Payment Voucher create/edit form" caption="Create/Edit form with tabs for details, expenses, and payment." >}}

**常见状态：**

| 状态 | 含义 | 常见操作 |
|--------|---------|----------------|
| **Draft** | 进行中 | 继续编辑并保存 |
| **Final** | 已批准并锁定 | 进入过账/Trace 流程 |
| **Discarded** | Final 前取消 | 不影响过账 |
| **Voided** | Final 后取消 | 保留审计轨迹 |

**创建/编辑标签（核心）：**

- **Main Details**：抬头字段（分支、日期、币种、参考号）。
- **Account**：实体、账单与收货信息。
- **Expenses**：费用行与成本分摊。
- **Payment**：付款行与结算对齐。
- **Department Hdr**：部门抬头编码。
- **Doc Link**：关联相关单据。

**创建/编辑标签（仅编辑或条件显示）：**

- **Expenses Adjustment**：创建后修正费用分配。
- **AR/AP**：查看未结与已结余额。
- **Settlement Adjustment**：修正结算不匹配。
- **Contra**：对冲关联单据余额。
- **Trace Document**：过账追溯与下游状态。
- **Attachments**：支持文件与审批附件。
- **Export**：启用时导出凭证数据。
- **Sales Commission**：配置后关联佣金记录。

---

## 行项目与费用

使用 **Expenses** 标签录入详细成本：

- 费用行项目、数量与金额
- 定价与税务明细
- 维度/项目/利润中心等成本分摊
- 需要时填写序列号、库位或批次
- 可选问题链接与交付信息

---

## 付款与结算

**Payment** 标签用于管理付款：

- 每张凭证可有多条付款行
- 启用时支持多币种与汇率
- 与费用与调整保持结算一致
- 可查看 AR/AP 未结余额

**提示：** 若启用外汇按钮，请在 Final 前检查汇率，避免过账差异。

---

## 调整与对冲

用于更正与平衡：

- **Expenses Adjustment**：修复或重新分摊费用
- **Settlement Adjustment**：更正结算不匹配
- **Contra**：与关联单据对冲

使用 **Settlement Adjustment** 与 **Expenses Adjustment** 菜单查看完整列表与审计记录。

{{< figure src="/images/internal-payment-voucher-applet/pv-adjust-set.png" alt="Settlement Adjustment listing" caption="Settlement Adjustment listing for payment vouchers." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses.png" alt="Expenses Adjustment listing" caption="Expenses Adjustment listing for payment vouchers." >}}

---

## 内部往来处理

**Intercompany** 菜单将工作分为两类队列：

- **Unprocessed**：待关联/待处理的内部往来交易
- **Processed**：已处理并可审计的内部往来交易

这有助于跨实体付款流程的追踪与一致性。

{{< figure src="/images/internal-payment-voucher-applet/pv-intercompany.png" alt="Intercompany transaction listing" caption="Intercompany listing with unprocessed and processed tabs." >}}

### 内部往来数据来源

内部往来记录来源于标记了内部往来处理的 **Internal Payment Vouchers**。凭证保存并 Final 后，系统会生成内部往来条目，显示在 **Unprocessed** 队列中等待关联或处理。是否出现与可见性取决于内部往来配置与权限。

### 如何创建内部往来交易

1. 创建或打开 **Internal Payment Voucher**。
2. 在 **Account** 中打开 **Intercompany** 子标签（如已启用）。
3. 选择内部往来实体/分支或必填的内部往来字段。
4. 保存并 **Final** 凭证。
5. 从侧边栏进入 **Intercompany** 查看 **Unprocessed** 中的新记录。
6. 关联/处理后确认其移至 **Processed**。

**提示：** 若 **Intercompany** 子标签未显示，请在 **Settings > Application Settings** 中启用或检查角色权限。

---

## 文件导入

通过 **File Import** 批量创建凭证：

1. 上传源文件（Excel/CSV，按模板要求）。
2. 在 checking 视图中验证数据。
3. 解决错误并确认导入。
4. 打开样例凭证核对抬头、费用与付款行。

{{< figure src="/images/internal-payment-voucher-applet/pv-file-import.png" alt="File Import listing" caption="File Import listing with uploaded files and statuses." >}}

---

## 文件导出 CSV

生成下游付款处理所需的导出文件：

1. 打开 **File Export**。
2. 选择交易日期范围。
3. 点击 **Generate CSV** 下载文件。
4. 若文件为空，确认凭证已 **Final** 且日期范围正确。

{{< figure src="/images/internal-payment-voucher-applet/pv-export.png" alt="Payment Voucher file export listing" caption="File Export screen for generating voucher CSV output." >}}

---

## 追溯与审计

- **付款凭证从哪里追溯**：从侧边栏打开 **Internal Payment Voucher**，选择一张凭证并在编辑视图中进入 **Trace Document**。Trace 标签在凭证 **Final** 后显示。
- **Trace Document**：查看过账追溯与下游状态（Final 后可用）。
- **Applet Log**：查看谁在何时做了哪些更改（Settings > Applet Log）。

这些工具可用于审计与结账复核。

---

## 单据链接与附件

- **Doc Link**：关联相关单据以便追溯。
- **Attachments**：存放发票、审批与支持文件。
- **Sales Commission**：启用时关联佣金记录。

---

## 配置与设置

在 **Settings** 中配置 Applet：

- **Application Settings**：字段可见性、标签启用与验证行为。
- **Default Selection**：分支、币种与常用字段默认值。
- **Printable Format Settings**：控制凭证打印版式与品牌信息。
- **Email Template**：配置 Send Email 使用的模板。
- **Feature Visibility**：按角色显示/隐藏菜单与功能。
- **Permissions**：客户端权限集合与用户/团队/角色分配。
- **Webhook**：配置下游系统通知。
- **Applet Log**：系统审计轨迹。
- **Release Notes**：查看 Applet 变更记录。

{{< figure src="/images/internal-payment-voucher-applet/pv-app-setting.png" alt="Internal Payment Voucher settings" caption="Settings page for field visibility, defaults, and templates." >}}

---

## 相关 Applet

- **[供应商维护 Applet](/applets/supplier-maintenance-applet/)**：管理付款凭证使用的供应商主数据。
- **[Chart of Account Applet](/applets/chart-of-account-applet/)**：定义费用与过账使用的 GL 科目。
- **[General Ledger Applet](/applets/general-ledger-applet/)**：查看付款凭证最终的总账过账记录。
- **[Cashbook Applet](/applets/cashbook-applet/)**：核对付款凭证关联的现金与银行流水。

---

## 总结

Internal Payment Voucher Applet 提供可控、可审计的内部付款流程。它将凭证录入、费用与付款管理、结算调整、内部往来处理以及导入/导出整合在一个 Applet 中，为财务与合规提供清晰的可追溯性。

---

## 常见问题

**Q: 为什么 Final 按钮不可用？**
A: 必填字段可能缺失，或你的角色没有 Final 权限。请检查 Main Details、Expenses 与 Payment 标签。

**Q: 为什么 Payment 或 Expenses 标签被隐藏？**
A: 可能在 Application Settings 或角色字段配置中被禁用。

**Q: 为什么凭证显示未结余额？**
A: 付款行与结算调整未完全匹配费用总额，请检查付款、对冲与调整。

**Q: 如何导出给银行的付款文件？**
A: 进入 **File Export**，选择交易日期范围并点击 **Generate CSV**。

**Q: 付款凭证从哪里追溯？**
A: 从 **Internal Payment Voucher** 打开凭证，在编辑视图进入 **Trace Document**。Trace 标签在凭证 **Final** 后显示。

**Q: 可以关联相关单据吗？**
A: 可以。使用 **Doc Link** 关联相关单据以保持可追溯性。

**Q: 为什么导出文件是空的？**
A: 请确认凭证已 **Final**，且交易日期范围与凭证日期匹配。

**Q: 为什么无法选择供应商/实体？**
A: 供应商可能未启用、主数据缺失，或你的角色无权限。

**Q: 为什么 Send Email 不见了或不可用？**
A: Email 可能在 Application Settings 中被隐藏，或你的角色无权限；同时确认已选择 Email Template。

**Q: 为什么看不到 Intercompany 记录？**
A: 你可能无内部往来权限，或所选分支/日期范围内没有交易。
