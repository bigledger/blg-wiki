---
title: "内部销售订单小程序"
description: "Wavelet ERP 全生命周期销售订单管理，涵盖订单录入、履约、配送与报表"
tags:
- sales-order
- order-management
- fulfillment
- delivery-planning
- ecomsync
weight: 70
---

## 目的与概览

**内部销售订单小程序**是 Wavelet ERP 的全生命周期销售订单管理模块。它覆盖订单创建、编辑、审批、履约、配送计划、电商同步、报表以及文件导入/导出。它旨在集中销售订单数据，强化运营控制（信用额度、工作流状态、过账状态），并连接拣货/打包、配送、开票与会计等下游流程。

{{< callout type="info" >}}
**核心概念**：销售订单是主控单据，连接**谁**在购买（客户）、**卖什么**（物料与价格）、**如何履约**（配送与拣货/打包）以及**如何结算**（AR/AP、收款单与过账状态）。
{{< /callout >}}

## 关键特性概览

### 谁会受益？

**销售运营与订单录入：**
- 结构化的销售订单创建与编辑
- 快速搜索与订单/行项目列表
- 客户、账单与收货信息集中管理
- 一键转换为下游单据

**仓库与履约团队：**
- Pick Pack Queue 按销售订单分组
- Delivery Items 列表与打印
- 配送计划与日历视图
- 准确的库存与配送状态可见性

**财务与 AR/AP 团队：**
- 过账状态控制（DRAFT、FINAL、VOID、DISCARD、CLOSE）
- 信用额度校验
- Settlement、ARAP、Receipt Voucher 与 Contra 可见性
- 审计级报表与导出

**电商运营：**
- Marketplace 订单可见性与同步状态
- Ecomsync 仪表板、计划任务与评价管理
- Lazada 与 Shopee 订单处理

**管理层与管理员：**
- 详细报表与行级分析
- 可配置的设置与权限
- 清晰的审计轨迹与运营控制

### 解决哪些问题？

**传统人工销售订单问题：**

传统销售订单处理分散在表格、邮件和割裂的系统中。常见问题包括：
- 重复录入与单据不一致
- 因缺少配送信息导致履约延迟
- 库存与定价更新不准确
- 审批状态与信用额度可见性差
- 难以追踪订单历史与变更

**内部销售订单小程序的解决方案：**

- **单一数据源** - 各团队共享一份集中化销售订单记录
- **受控过账** - DRAFT、FINAL、VOID、DISCARD、CLOSE 的规则控制
- **集成履约** - Pick Pack Queue、配送计划与 Delivery Items
- **电商就绪** - Marketplace 集成与状态可见
- **财务控制** - 信用额度校验与结算管理
- **报表与导出** - 详细分析与文件导出

## 关键特性概览

{{< cards >}}
  {{< card title="销售订单核心" subtitle="创建、编辑、FINAL 并控制过账状态" link="#sales-order-core" >}}

  {{< card title="行项目管理" subtitle="价格、序列号、批次、库位与库存控制" link="#line-item-management" >}}

  {{< card title="配送与履约" subtitle="拣货/打包、Delivery Items 与计划" link="#delivery-and-fulfillment" >}}

  {{< card title="电商同步" subtitle="Marketplace 订单与同步状态" link="#e-commerce-integration" >}}

  {{< card title="报表与分析" subtitle="详细报表与行级可见性" link="#reports-and-analytics" >}}

  {{< card title="文件导入与导出" subtitle="销售订单批量导入与导出" link="#file-import-and-export" >}}

  {{< card title="审批与权限" subtitle="审批队列与权限控制" link="#approval-and-permissions" >}}

  {{< card title="设置与个性化" subtitle="可配置默认值与系统控制" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/internal-sales-order-applet/internal-sales-order-overview.png" alt="内部销售订单小程序流程概览" caption="内部销售订单小程序：从订单创建到履约、配送计划与报表的一体化流程。" >}}

## 关键概念

### 理解销售订单框架

| 维度 | 组件 | 实际示例 |
|--------|-----------|------------------|
| **谁**在购买？ | 客户 / Entity | 零售客户或批发客户 |
| **卖什么**？ | 行项目 | 物料 A（数量 10）、物料 B（数量 5） |
| **如何履约**？ | 配送 / Pick Pack | 具有分支与库位的配送计划 |
| **如何结算**？ | 过账 / 结算 | FINAL 状态并带有结算行 |

{{< callout type="tip" >}}
**真实场景**：销售助理为客户 X 创建内部销售订单。订单先为 DRAFT，审批后变为 FINAL。仓库通过 Pick Pack Queue 拣货，安排配送，财务记录结算与发票。
{{< /callout >}}

### 销售订单生命周期

```
Draft -> Final -> Fulfillment -> Delivery -> Settlement/Invoice -> Close
  |       |           |             |              |               |
  |       |           |             |              |               +--> Close (if enabled)
  |       |           |             |              +--> Receipt vouchers and ARAP
  |       |           |             +--> Delivery items and tracking
  |       |           +--> Pick/pack and warehouse posting
  |       +--> Credit limit and workflow validation
  +--> Edit and discard if required
```

---

## 快速入门指南

根据你的角色快速上手。

[![内部销售订单小程序视频](https://img.youtube.com/vi/L7nSvCluFbM/hqdefault.jpg)](https://youtu.be/L7nSvCluFbM?si=L5-JHPl_Yvp9oeGf)

{{< callout type="note" >}}
**开始之前**：请确保客户/实体已创建、物料已设置，并且你有创建和 FINAL 订单的权限。
{{< /callout >}}

### 面向销售与订单录入：创建第一张销售订单

**目标：**创建一张有效的销售订单并提交履约。

1. **导航**：从侧边栏进入 **Sales Order**
{{< figure src="/images/internal-sales-order-applet/so-create-1.png" alt="Sales Order 子菜单" caption="Sales Order 在销售订单小程序中的位置。" >}}

2. **创建**：点击 **Create** 并填写 Main Details
{{< figure src="/images/internal-sales-order-applet/so-create-2.png" alt="Create 按钮" caption="用于创建新销售订单的 Create 按钮。" >}}

{{< figure src="/images/internal-sales-order-applet/so-create-form.png" alt="Sales Order 小程序创建表单" caption="销售订单小程序中的创建表单。" >}}
   - 填写 Branch、Location 与 Transaction Date
{{< figure src="/images/internal-sales-order-applet/so-branch.png" alt="Branch 下拉、Location 与 Transaction Date" caption="选择分支、配送库位以及交易日期。" >}}
   - 选择 Customer/Entity（来自 Customer Applet）
{{< figure src="/images/internal-sales-order-applet/so-entity.png" alt="Entity Details 字段" caption="用于选择 Customer Applet 中创建的 Entity。" >}}
   - 设置 Sales Agent 与 Reference
{{< figure src="/images/internal-sales-order-applet/so-sales-agent.png" alt="Sales Agent 字段（可下拉选择或从 Entity 自动带出）" >}}

3. **确认 Billing & Shipping**：
   - 选择账单与收货地址
{{< figure src="/images/internal-sales-order-applet/so-bill-to.png" alt="Bill to 与 Ship to 选项卡" caption="Billing address 与 Shipping address 选项卡。" >}}

{{< figure src="/images/internal-sales-order-applet/so-select-billing.png" alt="Select Billing 按钮" caption="选择 Billing 地址。" >}}

   - 如适用，可将 Billing 复制为 Shipping

4. **添加 Line Items**：
{{< figure src="/images/internal-sales-order-applet/so-line.png" alt="Line items 选项卡" caption="在 Sales Order 中添加行项目。" >}}
   - 搜索物料或扫描条码
   {{< figure src="/images/internal-sales-order-applet/so-line-search.png" alt="Sales Order 行项目搜索" caption="搜索将要加入 Sales Order 的行项目。" >}}
   - 设置数量、价格与折扣
   {{< figure src="/images/internal-sales-order-applet/so-quantity.png" alt="行项目数量与价格设置" caption="为行项目设置数量、价格与折扣。" >}}
   - 如需，填写序列号/批次/库位
   {{< figure src="/images/internal-sales-order-applet/so-batch.png" alt="Batch 选项卡" caption="设置批次号、数量、发放日期、到期日期等。" >}}

5. **Delivery Details**：
   - 选择配送分支与库位
   {{< figure src="/images/internal-sales-order-applet/so-delivery.png" alt="Delivery branch 与 location 字段" caption="从下拉列表选择配送分支与库位。" >}}
   - 设置期望配送日期与说明
{{< figure src="/images/internal-sales-order-applet/so-create-4.png" alt="Ship To 中的 Delivery Details 输入" caption="在 Ship To 选项卡中填写 Delivery Details。" >}}

6. **可选附加项**：
   - 如需，添加 settlement 行或附件
   {{< figure src="/images/internal-sales-order-applet/so-settlement.png" alt="Settlement 选项卡" caption="添加 settlement 类型并从下拉选择。" >}}
7. **复核**：检查合计、税额以及信用额度警告
8. **保存**：点击 **Create** 保存为 DRAFT
{{< figure src="/images/internal-sales-order-applet/so-create-5.png" alt="保存 sales order 的按钮" caption="保存创建的销售订单。" >}}

{{< figure src="/images/internal-sales-order-applet/so-cash.png" alt="现金 settlement 类型" caption="Settlement 类型示例：Cash。" >}}

9. **FINAL 并验证**：点击 **FINAL** 过账，并确认订单出现在 Pick Pack Queue 或 Delivery Items（若你有权限）

{{< figure src="/images/internal-sales-order-applet/so-create-6.png" alt="FINAL 按钮" caption="在销售订单小程序中用于过账的 FINAL 按钮。" >}}

---

### 面向仓库与履约：处理 Pick Pack Queue

**目标：**准备并发货配送。

1. **导航**：进入 **Pick Pack Queue**
2. **筛选**：按分支、日期或客户搜索
{{< figure src="/images/internal-sales-order-applet/pick-pack.png" alt="Pick Pack Queue 搜索筛选" caption="Pick Pack Queue 的搜索筛选。" >}}
3. **选择订单**：按 Sales Order 编号分组

{{< figure src="/images/internal-sales-order-applet/so-pick-pack.png" alt="Pick Pack Queue 列表（按订单分组）" caption="Pick Pack Queue：按履约与配送准备分组的行项目。" >}}

4. **设置配送数量**：确认交付数量
5. **确认配送信息**：确保配送分支与库位一致
6. **Ready to Ship**：创建配送任务
7. **Post to Warehouse Picking Queue**：如启用，发送到 WMS
8. **Print Delivery Items**：生成配送单据用于出库
9. **更新配送状态**：记录已送达/部分送达状态及备注

**结果：**订单从销售录入进入履约与配送执行。

---

### 面向财务与 AR/AP：FINAL 并结算

**目标：**确保订单在财务上有效并完成结算。

1. **审核 FINAL 订单**：确保过账状态为 FINAL
2. **检查信用额度**：确认信用额度校验已通过
3. **结算**：添加 settlement 行或收款单
4. **生成销售发票**：如启用，使用 **Generate Sales Invoices**
5. **导出**：使用 File Export 或报表进行对账
6. **审计**：查看 **Events** 与 **Trace Document** 的状态变更与下游链接
7. **关闭**：配送与开票完成后设为 **CLOSE**（如启用）

**结果：**销售订单在财务层面关闭并满足审计要求。

---

### 面向管理员：初始设置

**目标：**配置小程序以确保订单处理一致。

1. **设置默认值**：Branch、Location、Currency 与过账状态
2. **配置工作流**：审批路径与 FINAL 规则
3. **启用关键标签**：Delivery、Settlement、Attachments 与 Ecomsync
4. **定义 Printables**：销售订单与配送格式
5. **配置 Email Templates**：销售订单邮件格式与收件人
6. **设置权限**：角色与团队访问控制
7. **测试流程**：创建测试订单并走完 FINAL → Pick Pack → Delivery

**结果：**用户看到正确菜单，订单遵循受控的生命周期。

---

## Sales Order Core（销售订单核心）

### Sales Order 列表

列表是销售订单的运营仪表板，提供高级搜索与批量操作：
- 按单据号、客户、日期或状态搜索
- 批量操作：FINAL、DRAFT、DISCARD、VOID、PRINT
- 使用模板与打印格式发送邮件
- Marketplace 批量更新（如启用）

{{< figure src="/images/internal-sales-order-applet/so-main-listing.png" alt="Sales Order 主列表页面" caption="主列表：使用筛选与批量操作管理销售订单。" >}}

### 创建与编辑 Sales Order

编辑界面使用标签页（简化界面中为折叠面板）。标签顺序与可见性由设置与权限控制，因此部分标签可能被隐藏或重排。

**编辑 Sales Order：标签页与用途**

| 标签页 | 用途 | 常见操作 |
|---|---|---|
| **Search Document** | 在草稿中搜索并引用其他单据 | 查找源单据以创建订单（仅 TEMP/DRAFT 可见） |
| **Main Details** | 订单核心抬头信息 | 设置分支、库位、交易日期、客户、Sales Agent、币种、信用条款/额度与过账动作（DRAFT/FINAL/VOID/CLOSE） |
| **Account** | 账单与收货信息 | 管理 Bill-to/Ship-to 联系人与地址，支持复制 |
| **Lines** | 订单行项目 | 编辑行项目、定价、税、折扣、序列号/批次/库位与行级配送字段 |
| **ARAP** | 应收应付上下文 | 查看与订单相关的 AR/AP 余额或财务信息 |
| **Delivery Details** | 配送字段 | 设置配送分支/库位、期望日期、配送规则与 PIC 信息 |
| **Delivery Plans** | 配送排程 | 创建与查看配送计划条目 |
| **Settlement** | 收付记录 | 添加 settlement 行、管理收款、查看结算汇总 |
| **KO For** | 抵销引用 | 匹配或导入抵销分配（仅 TEMP/DRAFT 可见） |
| **Receipt Voucher** | 收款单列表 | 查看与订单相关的收款单 |
| **Department Hdr** | 抬头部门标记 | 抬头层级的部门或成本中心分配 |
| **Trace Document** | 过账与可追溯 | 追踪单据流、过账关联与下游单据 |
| **Contra** | 对冲分录 | 查看或新增与订单关联的对冲记录 |
| **Doc Link** | 关联单据 | 查看关联的单据（报价、发票、配送单等） |
| **Attachments** | 附件 | 上传并管理订单附件 |
| **Export** | 导出工具 | 按需导出订单数据 |
| **Ecomsync** | Marketplace 同步 | 查看同步状态、同步详情与电商打印格式 |
| **Status** | 自定义状态 | 更新配置的自定义状态字段 |
| **Events** | 活动历史 | 查看系统事件与状态变更 |
| **Gross Profit** | 利润可见性 | 查看订单毛利（需权限） |

**行项目编辑器标签（在单个行项目内）**

| 标签页 | 用途 | 常见操作 |
|---|---|---|
| **Item Details** | 行项目核心数据 | 数量、单价、折扣、税、UOM |
| **Grouped Item** | 组合商品内容 | 查看组合/套装的子项 |
| **Serial Number** | 序列号管理 | 扫描或选择序列号 |
| **Batches** | 批次管理 | 分配批次与数量 |
| **Bin** | 库位管理 | 分配库位 |
| **Stock Availability** | 库存可用性 | 查看按库位的库存与可用量 |
| **MRP** | MRP 关联 | 如启用，关联工单 |
| **Costing Details** | 成本与毛利 | 如启用，查看成本信息 |
| **Issue Link** | 问题/任务关联 | 将行项目关联到问题或任务记录 |
| **Sales History** | 销售历史 | 查看该物料的历史销售数据 |

### 过账状态控制

| 状态 | 含义 | 常见用途 |
|--------|---------|-------------|
| **DRAFT** | 草稿单据 | 用于录入与审核 |
| **FINAL** | 已过账单据 | 已批准，可进入履约 |
| **VOID** | 已取消 | 过账后取消 |
| **DISCARD** | 删除草稿 | 过账前丢弃草稿 |
| **CLOSE** | 关闭订单 | 阻止后续处理 |

## Approval and Permissions（审批与权限）

使用审批与权限控制谁可以 FINAL、编辑或 VOID 订单。

- **审批流程**：在设置中配置路由与 FINAL 规则，确保过账前校验
- **信用额度控制**：如启用，超出信用额度将阻止 FINAL
- **角色权限**：限制敏感标签（Settlement、Gross Profit、Export）与操作（VOID、CLOSE）
- **审计可见性**：通过 **Events** 与 **Status** 查看状态历史与变更

## Line Item Management（行项目管理）

行项目是销售订单的核心，用于控制定价、履约规则与行级校验：
- 编辑已有行项目；新增行在 Sales Order 中创建
- 控制定价、税与折扣
- 单据级折扣
- 序列号校验
- 批次与库位管理
- 库存可用性检查
- 成本详情与销售历史
- MRP 工单关联（如启用）

{{< figure src="/images/internal-sales-order-applet/so-line-manage.png" alt="行项目管理" caption="行项目列表。" >}}

{{< figure src="/images/internal-sales-order-applet/so-line-edit.png" alt="行项目编辑" caption="在小程序中编辑行项目。" >}}

---

## Delivery and Fulfillment（配送与履约）

### Delivery Details

- 配送分支与库位
- 期望配送日期
- 配送说明与追踪

### Pick Pack Queue

- 按 Sales Order 分组的订单与行项目
- 配送数量 vs 余额数量
- 按库位与公司级别的库存可见性

{{< figure src="/images/internal-sales-order-applet/so-pick-pack.png" alt="Pick Pack Queue 列表（分组行项目）" caption="Pick Pack Queue：用于履约与配送准备的分组行项目。" >}}

### Delivery Items

- 需要出货的 Delivery Items 列表
- 可打印配送单据
- 快速查看配送状态与备注

{{< figure src="/images/internal-sales-order-applet/so-delivery-plan.png" alt="Delivery Items 列表（待发货）" caption="Delivery Items：支持打印的行级配送列表。" >}}

### Delivery Plan and Calendar

- 计划配送场次与排程
- 日历视图用于配送规划

{{< figure src="/images/internal-sales-order-applet/so-delivery-plan.png" alt="Delivery Plan 创建与查看" caption="Delivery Plan：安排并管理配送场次。" >}}

{{< figure src="/images/internal-sales-order-applet/so-calendar.png" alt="Delivery Plan 日历视图" caption="Delivery Plan Calendar：在日历中查看配送安排。" >}}

---

## E-commerce Integration（电商集成）

- Ecomsync 仪表板与计划任务
- Marketplace 订单可见性
- 回复评价与评价跟踪
- Lazada 与 Shopee 订单处理

{{< figure src="/images/internal-sales-order-applet/so-shopee-ecomsync.png" alt="Shopee Ecomsync 仪表板（同步状态）" caption="Shopee Ecomsync Dashboard：Marketplace 同步状态与订单监控。" >}}

{{< figure src="/images/internal-sales-order-applet/so-lazada-ecomsync.png" alt="Lazada Ecomsync 仪表板（同步状态）" caption="Lazada Ecomsync Dashboard：Marketplace 同步状态与订单监控。" >}}

---

## Reports and Analytics（报表与分析）

- **Sales Order Detailed Report**：按日期范围过滤
- **SO Line with SI KO Report**：抵销与未结跟踪
- **Line Items Listing**：未结数量与行级可见性
- **Gross Profit View**：在订单视图中启用（需权限）

{{< figure src="/images/internal-sales-order-applet/so-detailed-report.png" alt="Sales Order Detailed Report（日期筛选与分组）" caption="Sales Order Detailed Report：按订单与行项目分组的详细报表。" >}}

---

## File Import and Export（文件导入与导出）

### File Import

- 上传 CSV 文件
- 选择分隔符
- 通过辅助检查与错误列表进行校验
- 使用示例格式保证模板正确

{{< figure src="/images/internal-sales-order-applet/so-file-import.png" alt="File Import 页面（CSV 上传与分隔符）" caption="File Import：上传 CSV 并校验销售订单数据。" >}}

### File Export

- 按交易日期范围生成导出
- 跟踪生成状态
- 下载导出文件用于对账

{{< figure src="/images/internal-sales-order-applet/so-file-export.png" alt="File Export 列表（生成状态与下载）" caption="File Export：生成并下载销售订单导出文件。" >}}

---

## Configuration & Settings（配置与设置）

内部销售订单小程序高度可配置。设置入口位于：
`Settings`

{{< figure src="/images/internal-sales-order-applet/so-setting-page.png" alt="Settings 页面（配置模块）" caption="Settings：配置默认值、工作流、打印与功能可见性。" >}}

### Application Settings

常见开关与默认值：
- 默认分支与库位
{{< figure src="/images/internal-sales-order-applet/so-def-branch.png" alt="默认 branch 与 location 设置" caption="Settings：配置小程序默认分支与库位。" >}}
- 列可见性与高级搜索控制
{{< figure src="/images/internal-sales-order-applet/so-set-vis.png" alt="Applet 子菜单设置" caption="Settings：配置功能可见性。" >}}

### Printable Format Settings

- 配置销售订单打印布局
- 启用自动预览与批量打印

{{< figure src="/images/internal-sales-order-applet/so-print.png" alt="Printable format 设置" caption="Settings：配置打印格式，并勾选为默认。" >}}

{{< figure src="/images/internal-sales-order-applet/so-add-print.png" alt="新增 printable format 设置" caption="Settings：新增并配置打印格式。" >}}

### Branch and Settlement Settings

- 分支级结算行为
- 付款与收款单默认值

{{< figure src="/images/internal-sales-order-applet/so-set-branch.png" alt="新增或编辑 branch" caption="Settings：配置分支。" >}}

### Email Templates

- 销售订单邮件模板
- 配置收件人（Billing、Shipping）

{{< figure src="/images/internal-sales-order-applet/so-email-temp.png" alt="新增 applet 邮件模板" caption="Settings：配置小程序使用的邮件模板。" >}}

### Sales Order Status

- 自定义订单状态列表
- 用于报表与跟踪的状态标签

{{< figure src="/images/internal-sales-order-applet/so-status.png" alt="新增或编辑 Sales Order Status" caption="Settings：配置 Sales Order 状态。" >}}

### Feature Visibility and Permissions

- 功能可见性配置
- 角色与团队权限集
- 客户端权限控制

{{< figure src="/images/internal-sales-order-applet/so-perm.png" alt="新增或编辑用户权限" caption="Settings：配置用户权限与角色。" >}}

### Personalization

- 设置默认分支、库位与币种，加快录单
- 自定义可见列与高级搜索字段
- 使用基于角色的菜单简化界面

---

**推荐设置清单：**

1. **设置默认值**：Branch、Location、Currency 与过账状态
2. **启用必需标签**：Delivery、Settlement 与 Attachments
3. **配置审批规则**：工作流与权限控制
4. **定义 Printables**：销售订单与配送格式
5. **验证信用额度**：如需，启用信用额度校验
6. **启用 Ecomsync**：用于 Marketplace 集成与跟踪

---

## Audit and History（审计与历史）

使用内置的追踪与历史工具查看变更与下游单据。

- **Events 标签**：查看状态变更、编辑与系统动作
- **Trace Document**：跟踪到配送、发票与结算的单据流
- **列表导出**：导出筛选后的订单用于对账或审计抽样

---

## FAQ

**Q：为什么我看不到 FINAL 按钮？**  
A：FINAL 动作可能被设置隐藏或受到权限限制。

**Q：如何在订单中启用 delivery details？**  
A：在 `Settings > Application Settings` 中启用 **Delivery Details**。

**Q：为什么订单无法通过信用额度校验？**  
A：客户信用额度可能已超限。请提高额度或降低订单金额。

**Q：FINAL 后还能编辑订单吗？**  
A：多数配置下 FINAL 订单会锁定。如需变更，请使用允许的操作（VOID/CLOSE），并按流程重新创建或重新开单。

**Q：为什么 FINAL 后无法更改配送日期？**  
A：过账后配送字段可能被锁定。可通过 Delivery Plan/Delivery Items 更新，或调整设置以允许修改。

**Q：可以一次打印多张销售订单吗？**  
A：可以。使用菜单中的 **Batch Printing** 或列表中的 **SINGLE/MULTIPLE PRINT**。

**Q：如何批量导入销售订单？**  
A：使用 **File Import**，上传 CSV，并通过 helper checking 校验。

**Q：为什么我看不到 Pick Pack Queue 或 Delivery Items？**  
A：这些菜单可能被设置隐藏或权限限制。请检查 **Feature Visibility** 与角色权限。

**Q：如何给客户发送 Sales Order 邮件？**  
A：在列表中选择订单，选择邮件模板，选择 Billing 或 Shipping 收件人，然后点击 **Send Email**。

**Q：如何重新同步 Marketplace 订单？**  
A：打开订单并进入 **Ecomsync** 标签，查看同步状态并重新执行同步操作（如启用）。
