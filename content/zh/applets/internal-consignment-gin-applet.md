---
title: "内部寄售 GIN 小程序"
description: "创建和管理寄售发货单，全面掌握销售运营中的物料和行级跟踪信息"
tags:
- applets
- consignment
- goods-issue-note
- inventory-management
- sales-operations
weight: 85
---

## 用途与概述

**内部寄售 GIN 小程序**旨在简化组织内的寄售库存发放管理。它使销售团队能够为寄售物料创建发货单（GIN），在集中列表中跟踪所有寄售发放，并查看每笔交易的详细行项目信息。

{{< callout type="info" >}}
**核心概念**：寄售 GIN 记录寄售库存的发放——即您持有但不拥有的物料——发放至内部地点、客户或用于特定销售活动。这将创建审计跟踪并更新寄售库存余额。
{{< /callout >}}

## 主要功能概述

### 谁受益于本小程序？

**销售代表：**
- 快速为客户演示或试用摆放创建寄售 GIN 项目
- 跟踪已发放给哪些客户或地点的物料
- 查看行级详情以便准确跟进和对账

**销售经理：**
- 监控团队内所有寄售发放
- 审查寄售库存使用模式
- 确保从寄售释放的物料有适当文档记录

**仓库与库存团队：**
- 维护准确的寄售库存记录
- 用适当的文档支持实物发放
- 将寄售库存水平与 GIN 记录进行对账

**财务与运营：**
- 寄售消耗的审计跟踪
- 支持月度账单和供应商对账
- 符合寄售协议跟踪要求

### 解决哪些问题？

**人工寄售跟踪问题：**

在没有专用系统的情况下管理寄售库存会导致：
- 发放记录丢失或缺失
- 实物库存与供应商账单对账困难
- 无法了解物料去向
- 易出错的人工电子表格

**内部寄售 GIN 小程序解决方案：**

- **数字化文档**：为每次寄售发放创建 GIN 记录
- **集中列表**：在一处查看所有寄售 GIN 文档
- **行项目可见性**：准确查看发放的物料和数量
- **审计合规**：为供应商对账和内部审计提供完整跟踪
- **以销售为中心的工作流**：专为销售团队效率设计

## 主要功能概述

{{< cards >}}
  {{< card title="内部寄售 GIN 列表" subtitle="使用高级搜索查看所有寄售 GIN 文档" link="#consignment-gin-listing" >}}

  {{< card title="创建和编辑寄售 GIN" subtitle="使用表头、账户和行明细记录寄售库存发放" link="#creating-a-consignment-gin" >}}

  {{< card title="行项目" subtitle="专用视图，用于跨所有 GIN 搜索和管理行级详情" link="#line-item-listing" >}}

  {{< card title="设置与配置" subtitle="配置字段可见性、默认选择和可打印格式" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/internal-consignment-gin-applet/internal-consignment-gin-overview-infographic.png" alt="内部寄售 GIN 小程序概述：人工寄售跟踪的挑战与小程序的解决方案，以及谁将受益" caption="从人工跟踪到数字化管控：挑战（记录丢失、对账困难、缺乏可见性、电子表格错误）vs 解决方案（数字化文档、集中列表、行项目可见性、审计合规）。受益者：销售代表、销售经理、仓库与库存、财务与运营。" >}}

## 核心概念

### 理解寄售 GIN

寄售库存的**发货单（GIN）**记录从寄售库存释放的物料。与自有库存不同，寄售物料在消耗或售出之前仍属供应商所有。

| 概念 | 定义 | 示例 |
|---------|------------|---------|
| **寄售库存** | 物理位置在您处但由供应商拥有的物料 | 经销商的展示产品 |
| **寄售 GIN** | 记录寄售物料发放的文档 | 向展厅发放演示机 |
| **行项目** | GIN 上的单个物料和数量 | 5 单位产品 A，3 单位产品 B |

{{< callout type="tip" >}}
**实际示例**：销售代表向 ABC 门店发放 10 台 Product XYZ 演示机（发放内容）用于 30 天试用（发放目的）。系统创建寄售 GIN，减少寄售库存余额，并在试用转为销售时记录交易用于供应商计费。
{{< /callout >}}

### GIN 结构

```
Consignment GIN Header (Main Details)
│
├── Consignment GIN No (auto-generated)
├── Branch
├── Transaction Date
├── Currency
├── Purchaser
│
├── Account (Supplier/Entity)
│   ├── Bill To address
│   └── Ship To address
│
└── Lines (Line Items)
    ├── Item 1: Product, Quantity, Serial/Batch/Bin (if applicable)
    ├── Item 2: Product, Quantity, Pricing Details
    └── Item 3: Product, Quantity, Issue Link
```

**层级流转：**

1. **主要明细**：捕获分支机构、交易日期、货币和采购员
2. **账户**：供应商（实体）及账单/收货地址
3. **行**：具体产品、数量、定价及可选序列号/批次/货位跟踪
4. **可选选项卡**：Payment、Department Hdr、Contra、Doc Link、Attachments、Export（可按租户配置）

### 寄售 vs 自有库存

| 方面 | 寄售库存 | 自有库存 |
|--------|-------------------|-------------|
| **所有权** | 使用/售出前属供应商 | 您的组织拥有 |
| **付款** | 消耗时付款 | 收货时付款 |
| **GIN 影响** | 减少寄售余额 | 减少自有库存 |
| **计费** | 供应商按消耗计费 | 已付款 |

---

## 快速入门指南

通过这些基本工作流快速上手。

### 用户：创建您的第一张寄售 GIN

**目标：** 5 步完成寄售库存发放并创建正确的 GIN 记录。

1. **导航**：从侧边栏进入 **Internal Consignment GIN**（默认入口）
2. **创建**：点击列表上的 **"+"**（创建）按钮
3. **主要明细选项卡**：
   - 选择 **Branch** 和 **Transaction Date**
   - 选择 **Currency**
   - 选择 **Purchaser**
4. **Account 选项卡**：选择 **Supplier**（实体）、**Bill To** 和 **Ship To** 地址
5. **Lines 选项卡**：点击 **Add Line** → 选择 **Item**，输入 **Quantity** → 可选添加 Serial Number、Batch Number、Bin Number、Pricing Details 或 Issue Link
6. **创建**：点击 **CREATE**（或 **RESET** 清空）

{{< figure src="/images/internal-consignment-gin-applet/create-edit-form.png" alt="内部寄售 GIN 创建/编辑表单，包含 Main Details、Account 和 Lines 选项卡" caption="创建表单：为寄售库存发放输入 Main Details、Account（供应商）和 Lines（物料）" >}}

**接下来会发生什么？** GIN 创建后，您将进入编辑视图。准备好时使用 **FINAL** 过账文档。

**提示：** 创建 GIN 前，确保物料已配置为寄售物料并正确关联供应商。

---

### 经理：审核寄售 GIN 列表

**目标：** 查看和监控团队创建的所有寄售 GIN 文档。

1. **打开列表**：从侧边栏进入 **Internal Consignment GIN** → 主列表默认打开
2. **高级搜索**：使用 **Consignment GIN No**、**Branch Name**、**Supplier Name**、**Created Date**、**Transaction Date** 或 **Created by** 进行筛选
3. **查看详情**：点击任意行打开包含完整表头、账户和行项目的编辑视图
4. **过账文档**：选择记录并点击 **FINAL** 过账 GIN
5. **导出**（Edit 选项卡）：在查看 GIN 时使用 Export 选项卡生成可打印格式的 PDF

**可执行操作：** 使用列表跟踪活动、识别高使用量供应商，并为供应商对账做准备。

---

### 仓库人员：履行寄售 GIN

**目标：** 实物发放寄售库存并确保文档相符。

1. **接收通知**：销售创建的 GIN（或查看待处理列表）
2. **拣货**：按行项目定位寄售库存并拣选数量
3. **核对**：将数量和序列号与 GIN 交叉验证
4. **发放**：将物料交给申请人或发运
5. **确认**：确保系统中 GIN 状态反映完成

**提示：** 拣货时保留 GIN 打印件或屏幕显示——在发放库存前逐行交叉核对。

---

### 管理员：初始系统设置

**目标：** 5 步为销售团队准备好寄售 GIN 系统。

**步骤 1：配置寄售物料**（`Master Data > Items > [Item] > Consignment`）
- 将物料标记为寄售并关联至正确供应商
- 为每个物料设置默认寄售位置

**步骤 2：设置仓库**（`Master Data > Warehouses` 或 `Inventory > Locations`）
- 定义存放寄售库存的位置
- 确保寄售物料分配到正确的存储区域

**步骤 3：分配权限**（`Settings > Permissions` 或 `Tenant Admin > Roles`）
- 销售代表：Create Consignment GIN、View Consignment GIN
- 仓库：View Consignment GIN
- 财务：View Consignment GIN（用于对账）

**步骤 4：验证寄售收货**（如适用）
- 确保寄售库存已通过 [Consignment GRN](/guides/purchasing-guides/consignment-purchasing/) 收货后再发放
- 检查寄售库存余额

**步骤 5：测试**
- 以销售代表身份创建测试寄售 GIN
- 验证其出现在列表中
- 确认行项目正确显示

**持续工作：** 监控寄售使用情况并与供应商计费周期对账。

---

{{< callout type="tip" >}}
**系统新手？** 从基础开始：
1. 销售代表应创建测试寄售 GIN 以熟悉流程
2. 销售经理应审核列表和筛选器
3. 仓库人员应练习履行待处理列表中的 GIN
4. 管理员应完成上述初始系统设置，然后查看**配置与设置**了解详细选项
{{< /callout >}}

---

## 创建寄售 GIN {#creating-a-consignment-gin}

本节介绍创建寄售发货单的详细流程。

### 前置条件

创建寄售 GIN 前，请确保：

- 系统中已配置寄售物料
- 物料已关联寄售供应商
- 发放地点有可用寄售库存
- 您的用户具有创建寄售 GIN 的权限

### 分步：创建寄售 GIN

**步骤 1：Main Details 选项卡**

| 字段 | 用途 | 示例 |
|-------|---------|---------|
| **Branch** | 发放分支机构 | Main Branch |
| **Transaction Date** | 发放业务日期 | 今日日期 |
| **Currency** | 文档货币 | MYR |
| **Purchaser** | 责任人 | John Smith |

**步骤 2：Account 选项卡**

| 字段 | 用途 | 示例 |
|-------|---------|---------|
| **Supplier** | 拥有寄售库存的实体 | Supplier ABC |
| **Bill To** | 账单地址 | 选择或输入 |
| **Ship To** | 收货/送货地址 | 选择或输入 |

**步骤 3：Lines 选项卡**

对于每个发放的物料：

| 字段 | 用途 | 示例 |
|-------|---------|---------|
| **Item** | 寄售产品 | Product XYZ |
| **Quantity** | 发放单位（Base/UOM） | 10 |
| **Serial Number** | 序列化物料（如启用） | SN-12345 |
| **Batch Number** | 批次追踪物料（如启用） | BATCH-001 |
| **Pricing Details** | 单价、折扣、金额 | 按配置 |

**步骤 4：可选选项卡**

- **Payment**：记录针对 GIN 的付款（如选项卡可见）
- **Department Hdr**：添加部门级明细（如选项卡可见）

**步骤 5：创建并完成**

- **CREATE**：以草稿状态保存 GIN 并打开编辑视图
- **FINAL**（从列表或编辑视图）：过账文档并更新寄售库存

---

### 编辑表单选项卡

编辑寄售 GIN 时，会显示以下附加选项卡（如在 Application Settings 中启用）：

| 选项卡 | 用途 |
|-----|---------|
| **Contra** | 关联对照文档（如相关 GRN、发票） |
| **Doc Link** | 关联相关文档 |
| **Attachments** | 附加文件（收据、佐证文档） |
| **Export** | 通过可打印格式生成 PDF |

使用 **SAVE** 保存更改，**RESET** 放弃更改，或 **DELETE**（需确认）删除草稿 GIN。

---

## 寄售 GIN 列表 {#consignment-gin-listing}

列表提供已创建的所有寄售 GIN 记录的全面视图。

{{< figure src="/images/internal-consignment-gin-applet/main-listing.png" alt="内部寄售 GIN 主列表页，以表格形式显示所有寄售 GIN 记录" caption="主列表：使用筛选和搜索查看所有寄售 GIN 记录" >}}

### 可执行操作

- 以表格格式查看所有寄售 GIN
- 按日期范围、状态、地点或创建人筛选
- 按 GIN 编号、参考或客户搜索
- 按日期、GIN 编号或其他列排序
- 打开任意 GIN 查看完整详情

### 列表列

| 列 | 描述 |
|--------|-------------|
| **Consignment GIN No** | 唯一文档标识符 |
| **Posting Status** | DRAFT 或已过账状态 |
| **Branch** | 发放分支机构 |
| **Supplier Name** | 寄售库存供应商（实体） |
| **Purchaser** | GIN 责任人 |
| **Updated Date** | 最后修改日期 |
| **Created Date** | GIN 创建时间 |
| **Transaction Date** | 业务交易日期 |
| **Created by** | 创建 GIN 的用户 |

### 高级搜索字段

| 字段 | 描述 |
|-------|-------------|
| **Consignment GIN No** | 按文档编号搜索 |
| **Branch Name** | 按分支机构筛选 |
| **Supplier Name** | 按供应商筛选 |
| **Created Date** | 日期范围（起/止） |
| **Transaction Date** | 日期范围（起/止） |
| **Created by** | 按创建人筛选 |

---

## 行项目列表 {#line-item-listing}

**Line Items** 导航提供专用视图，用于跨所有文档搜索和管理寄售 GIN 行项目。通过小程序侧边栏的 **Line Items** 访问。

{{< figure src="/images/internal-consignment-gin-applet/line-items.png" alt="行项目页，显示寄售 GIN 上的单个物料和数量" caption="行项目：跨所有寄售 GIN 文档搜索和查看物料详情" >}}

### 行项目搜索字段

| 字段 | 描述 |
|-------|-------------|
| **Consignment GIN No** | 按父 GIN 文档筛选 |
| **Item Code** | 按产品编码搜索 |
| **Item Name** | 按产品名称搜索 |
| **Txn Amt** | 按交易金额范围筛选 |

### 行项目详情（每行）

| 字段 | 描述 |
|-------|-------------|
| **Item Code** | 产品标识符 |
| **Item Name** | 产品描述 |
| **Quantity** | 发放单位（Base 和 UOM） |
| **Unit of Measure** | UOM（如 EA、Box） |
| **Serial Number** | 序列化物料（如启用） |
| **Batch Number** | 批次追踪物料（如启用） |
| **Bin Number** | 存储位置（如启用） |
| **Pricing Details** | 单价、折扣、金额 |
| **Issue Link** | 关联源文档 |

### 查看行项目

**方式 1：从 GIN 记录**

1. 打开 **Internal Consignment GIN** 列表并点击 GIN 行
2. 在编辑视图中，进入 **Lines** 选项卡
3. 添加、编辑或查看该 GIN 的行项目

**方式 2：专用行项目视图**

1. 点击侧边栏的 **Line Items**
2. 使用高级搜索按 GIN No、Item Code、Item Name 或 Txn Amt 筛选
3. 点击行以编辑模式打开父 GIN

---

## 配置与设置 {#configuration--settings}

管理员通过小程序侧边栏的 **Settings** 配置内部寄售 GIN 小程序。可用设置如下：

### 设置菜单结构

| 设置 | 用途 |
|---------|---------|
| **Application Settings**（字段设置） | 配置哪些字段和选项卡可见 |
| **Default Selection** | 为新文档设置默认值 |
| **Printable Format Settings** | 配置导出/打印模板 |
| **Webhook** | 配置集成 Webhook |
| **Feature Visibility** | 控制功能可见性 |
| **Permissions** | 用户、团队和角色权限列表 |

### 可配置选项卡（Application Settings）

以下选项卡可通过 **Settings > Application Settings** 按租户显示或隐藏：

| 选项卡 | 描述 | 默认 |
|-----|-------------|---------|
| **Payment** | 记录和管理付款 | 可见 |
| **Department Hdr** | 部门级明细 | 可见 |
| **Contra** | 关联对照文档 | 可见 |
| **Doc Link** | 关联相关文档 | 可见 |
| **Attachments** | 附加文件 | 可见 |
| **Export** | 导出为可打印格式（PDF） | 可见 |

### 寄售物料设置

**导航**：`Master Data > Items > [Item] > Consignment`

创建寄售 GIN 前，确保物料已正确配置：

| 设置 | 用途 | 示例 |
|---------|---------|---------|
| **Consignment Item** | 将物料标记为寄售 | 已勾选 |
| **Consignment Supplier** | 关联拥有库存的供应商 | Supplier ABC |
| **Consignment Location** | 默认存储位置 | Consignment Area |

### 仓库/位置设置

**导航**：`Master Data > Warehouses` 或 `Inventory > Locations`

- 定义存放寄售库存的位置
- 确保寄售物料分配到正确位置
- 如需要，设置寄售专用存储区域

### 用户权限

**导航**：`Settings > [Permission Set / User / Team / Role Permission Listing]`

| 权限 | 描述 | 典型角色 |
|------------|-------------|--------------|
| **Create Consignment GIN** | 创建新 GIN 记录 | Purchaser、Sales Rep |
| **View Consignment GIN** | 访问列表和详情 | Purchaser、Warehouse |
| **Edit Consignment GIN** | 修改草稿 GIN | Purchaser、Manager |
| **Delete Consignment GIN** | 删除草稿 GIN | Manager（如适用） |

### 与寄售采购的集成

内部寄售 GIN 小程序可与以下模块集成：

- **Consignment Receipt/GRN** - 收货至寄售
- **Consignment Inventory** - 当前余额
- **Consignment Reconciliation** - 月度计费和供应商结算

确保 [Consignment Purchasing](/guides/purchasing-guides/consignment-purchasing/) 流程已正确配置，以实现端到端跟踪。

---

## 常见问题

**问：在哪里找到内部寄售 GIN 小程序？**
答：从侧边栏进入 **Internal Consignment GIN**（通常位于 Inventory 或 Purchasing 下，视租户设置而定）。如未看到，您的角色可能无访问权限——请联系管理员。

**问：寄售 GIN 与普通 GIN 有什么区别？**
答：寄售 GIN 从寄售库存（您处存放的供应商自有库存）发放物料。普通 GIN 发放自有库存。寄售 GIN 减少寄售余额，并在您被收取消耗物料费用时纳入供应商计费。

**问：提交后可以编辑寄售 GIN 吗？**
答：取决于您的系统配置。草稿 GIN 通常可编辑。提交或完成后，修改可能受限——请咨询管理员。如需更正已完成的 GIN，可能需要创建冲销/调整分录。

**问：没有寄售库存时可以创建寄售 GIN 吗？**
答：不可以。系统会验证发放地点的库存可用性。若出现错误，请检查该物料和地点的寄售库存余额。必须先通过 Consignment GRN 收货。

**问：如何找到我创建的特定寄售 GIN？**
答：打开内部寄售 GIN 列表，使用**高级搜索**：按 Consignment GIN No、Branch Name、Supplier Name、Created Date、Transaction Date 或 Created by 筛选。

**问：寄售 GIN 如何影响供应商计费？**
答：每张寄售 GIN 会减少您的寄售库存。当供应商发送消耗发票（通常为月度）时，其依据这些 GIN 交易。财务使用 GIN 记录进行对账和验证发票。
