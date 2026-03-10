---
title: "库存结余 Applet"
description: "实时库存结余可视化，覆盖物品与地点，并提供高级筛选与分析工具"
tags:
- stock-balance
- inventory-management
- warehouse
- stock-visibility
- inventory-control
weight: 185
---

## 目的与概览

**Stock Balance Applet** 提供企业范围内的实时库存数量总览，帮助你了解当前库存、所在位置以及库存随地点变化的情况。

{{< callout type="info" >}}
**核心概念**：库存结余是由所有入库与出库交易计算得出的实时数量，按 **Item** 与 **Location** 汇总。
{{< /callout >}}

{{< callout type="info" >}}
**只读视图**：此 Applet 不会创建或编辑库存。所有数量均由其他 Applet 的库存交易更新（sales、purchase、adjustment 与 transfers）。
{{< /callout >}}

**目的：** 为按物品与地点统计的在手库存提供单一可信来源。

**目标用户：** 仓库团队、库存控制人员、采购与销售协调人员，以及财务或审计团队。

**关键功能：**
- 实时库存结余列表，支持分组与透视分析
- 通过物品类型、地点与结余进行高级筛选
- 与相关 Applet 的库存交易数据集成

## 关键功能概览

### 谁能从此 Applet 获益？

**仓库与门店团队：**
- 拣货与出库前确认在手库存
- 按地点定位库存
- 及早发现缺货风险

**库存控制人员：**
- 监控各地点的结余准确性
- 使用列表筛选与导出来排查差异
- 统一各分支库存可视化标准

**采购与销售团队：**
- 下单或报价前验证可用库存
- 通过实时结余避免过量采购
- 降低因库存不准导致的丢单风险

**财务与审计团队：**
- 核对库存数量以完成对账
- 通过导出与相关交易文档支持审计
- 提前发现异常以减少损耗

### 解决了哪些问题？

**库存可视化痛点：**
- 库存数据分散在多个单据与团队中
- 交易更新不及时
- 销售或采购前的结余核对耗时

**Stock Balance Applet 的解决方案：**
- **实时结余视图**，按物品与地点分组
- **高级筛选**，按物品类型与结余条件过滤
- **无缝集成**，连接所有入库与出库流程

## 关键功能概览

{{< cards >}}
  {{< card title="库存结余列表" subtitle="按物品与地点显示实时结余" link="#stock-balance-listing" >}}

  {{< card title="高级搜索" subtitle="按物品、地点与结余筛选" link="#advanced-search--filters" >}}

  {{< card title="图表与透视" subtitle="按地点进行分布分析" link="#charts--pivot" >}}

  {{< card title="导出与分析" subtitle="与相关团队共享列表数据" link="#export--analysis" >}}

  {{< card title="集成与数据来源" subtitle="与相关 Applet 进行库存数据联动" link="#integrations--data-sources" >}}

  {{< card title="配置与设置" subtitle="控制默认值与字段可见性" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/stock-balance-applet/stock-balance-overview.png" alt="库存结余 Applet 概览" caption="库存结余 Applet 概览图。" >}}

## 关键概念

### 理解库存结余

库存结余是系统在应用所有库存变动后得到的实时数量。

| 术语 | 含义 |
|------|------|
| **Opening Balance** | 某一期间或快照开始时的在手数量 |
| **Inbound Movements** | 采购、退货入库、调整入库、调拨入库 |
| **Outbound Movements** | 销售、出库、调整出库、调拨出库 |
| **Current Balance** | Opening + Inbound - Outbound |

{{< callout type="tip" >}}
**实用建议**：若结余异常，请查看影响该物品与地点的近期库存交易（sales、purchase、adjustments）。
{{< /callout >}}

### 库存结余结构

将库存结余视为一个结构化汇总：

```
Organization
|
|-- Items
|   |-- Item Type / Sub Item Type
|   |-- UOM
|
|-- Locations
|
|-- Transactions
    |-- Inbound (GRN, Purchase, Return In)
    |-- Outbound (Sales, Issue, Return Out)
    |-- Adjustments
```

**结构中的流转：**
1. **Item** 是跟踪单位。
2. **Location** 是库存所在地点。
3. **Transactions** 是所有结余变化的来源。

### 库存结余的“黄金三角”

| 组件 | 类比 | 定义 | 示例 |
|-----------|---------|------------|---------|
| **Item** | 产品 | 被跟踪的 SKU 或库存物品 | `ITEM-001` |
| **Location** | 货架 | 存放库存的仓库或门店 | `WH-KL` |
| **Movement** | 变化 | 影响库存增减的交易 | GRN, Sales, Adjustment |

当这三者一致时，库存结余就是准确且可用的。

---

## 快速入门指南

{{< figure src="/images/stock-balance-applet/sb-quick-guide.png" alt="库存结余快速入门" caption="面向仓库、库存与管理员的快速入门指南。" >}}

### 仓库人员：检查在手库存

**目标：** 确认某个物品在指定地点的在手数量。

1. 从侧边栏进入 **Stock Balance**。
2. 使用 **Advanced Search** 按 **Location** 与 **Item Code** 过滤。
3. 点击 **Search** 加载列表。
4. 查看 **Bal** 列确认当前数量。
5. 如需查看成本类字段，请使用 **Column Toggle** 并确保权限允许。
6. 如需共享结果，可导出列表。

---

### 库存控制人员：排查差异

**目标：** 追踪系统结余与实物盘点不一致的原因。

1. 使用 **Item Code**、**Location** 与 **Balance Greater Than 0** 过滤列表。
2. 查看 **Bal** 列获取当前数量。
3. 使用 **Column Toggle** 按 **Location** 分组进行对比。
4. 如需交叉分析，启用 **Pivot Mode**。
5. 需要提供证据时导出列表给审计或财务。

---

### 管理员：初始配置

**目标：** 确保 Applet 能用于日常运营。

1. 确认 **Item Master** 与 **Location** 数据完整且准确。
2. 分配权限，确保只有授权角色可查看成本类字段。
3. 配置默认分支、地点与字段可见性。
4. 验证 **Settings** 与 **Permissions** 仅对管理员可见。
5. 运行测试搜索，验证数据与权限。

---

{{< callout type="tip" >}}
**新手建议**：从一个物品与一个地点开始，确认列表结余无误后再扩展。
{{< /callout >}}

---

## 库存结余列表 {#stock-balance-listing}

该列表是库存可视化的核心界面。它按 **Item Code** 分组，并可按 **Location** 进行透视对比。

{{< figure src="/images/stock-balance-applet/sb-listing-1.png" alt="库存结余列表主视图" caption="库存结余列表主视图。" >}}

列表还可按 **EAN Code**、**Company**、**MA Price** 与 **Last Purchase Company** 分组。可在 **Column** 设置中启用或禁用这些分组。

{{< figure src="/images/stock-balance-applet/sb-listing.png" alt="按 EAN code、company、MA price 与 last purchase company 分组的列表" caption="按 EAN code、company、MA price 与 last purchase company 分组的列表。" >}}

{{< figure src="/images/stock-balance-applet/sb-column.png" alt="列设置面板，用于分组与透视" caption="列设置面板，用于管理分组、Pivot Mode 与可见列。" >}}

{{< figure src="/images/stock-balance-applet/sb-wo-pivot.png" alt="列表中的 Pivot Mode 启用与禁用" caption="列表中 Pivot Mode 的启用与禁用对比。" >}}

**什么是 Pivot Mode？** Pivot Mode 会重新组织列表，将 **Location** 或其他列变成分组列，便于并排比较库存。

**它能做什么？** 启用后，可将字段拖入 **Row Groups**、**Columns** 与 **Values**，构建 cross-tab 视图来对比各地点差异。

**禁用 vs 启用 Pivot Mode：**
- **禁用**：标准行列表，每行代表一个物品-地点记录，适合浏览与过滤。
- **启用**：聚合的 cross-tab 视图，适合多地点对比。

**关键列表字段：**

| 列名 | 描述 |
|--------|-------------|
| **Item Code** | 用作主分组字段的物品编码 |
| **EAN Code** | 物品条码或扫描码 |
| **Company** | 物品所属公司实体 |
| **Location** | 仓库或门店地点 |
| **Bal** | 当前结余数量 |
| **MA Price** | 移动平均单价（可能受权限控制） |
| **Last Purchase Cost** | 最近采购成本，用于估值对比 |

**列表支持的操作：**
- 按 **Item Code** 分组查看各地点合计。
- 按 **Location** 进行透视对比库存分布。
- 使用状态栏查看合计、选中行数与聚合值。
- 启用图表与范围选择进行快速分析。
- 在启用导出时导出为 Excel 或 CSV。

### 图表与透视 {#charts--pivot}

使用 **Charts** 与 **Pivot Mode** 分析各地点与物品的库存分布。

**Charts：** 仅在 **Pivot Mode** 启用时可生成图表。选中单元格范围后打开图表面板，即可将结余可视化。

**Pivot Mode：** 将字段拖入 **Row Groups**、**Columns** 与 **Values**，构建 cross-tab 视图以进行并排对比。

**生成图表步骤：**
1. 在列设置面板启用 **Pivot Mode**。
2. 在列表中右键选择 **Pivot Chart** 或 **Chart Range**。
3. 选择可用图表类型，如 **Donut** 或 **Pie**。

{{< figure src="/images/stock-balance-applet/sb-chart-donut.png" alt="在库存结余列表中生成的 Donut 图" caption="由列表生成的 Donut 图。" >}}

{{< figure src="/images/stock-balance-applet/sb-chart-pie.png" alt="在库存结余列表中生成的 Pie 图" caption="由列表生成的 Pie 图。" >}}

### 导出与分析 {#export--analysis}

使用 **Export** 与其他团队共享列表或用于对账分析。

**导出选项：**
- 导出为 **Excel** 或 **CSV** 以便进一步分析。

**导出步骤：**
1. 在列表中右键任意位置。
2. 选择 **Export**，再选择 **CSV** 或 **Excel**。
3. 文件会自动下载。

{{< figure src="/images/stock-balance-applet/sb-export.png" alt="列表中的导出菜单" caption="包含 CSV 与 Excel 选项的导出菜单。" >}}

{{< figure src="/images/stock-balance-applet/sb-export-download.png" alt="导出下载中" caption="导出下载中。" >}}

**导出文件：**

{{< figure src="/images/stock-balance-applet/sb-export-csv.png" alt="导出的 CSV 文件" caption="导出的 CSV 文件。" >}}

{{< figure src="/images/stock-balance-applet/sb-export-excel.png" alt="导出的 Excel 文件" caption="导出的 Excel 文件。" >}}

---

## 高级搜索与筛选 {#advanced-search--filters}

**Advanced Search** 面板用于快速定位所需库存。

{{< figure src="/images/stock-balance-applet/sb-search.png" alt="高级搜索面板" caption="库存结余的高级搜索面板。" >}}

**可用筛选条件：**
- **Company**
- **Location**
- **Item Code**
- **Item Type**
- **Sub Item Type**
- **Balance Greater Than 0**

**支持的 Item Types：**
- `BASIC_ITEM`
- `GROUPED_ITEM`
- `BUNDLE`
- `COUPON`
- `SERVICE`
- `WARRANTY`
- `BATCH_EXPIRY`
- `DOC_HEADER_ADJUSTMENT`
 
**Item Type 差异说明：**

| Item Type | 含义 | 常见用途 |
|-----------|----------------|------------------|
| **BASIC_ITEM** | 标准库存物品，按数量跟踪。 | 普通 SKU。 |
| **GROUPED_ITEM** | 用于分组多个子物品的父项。 | 套装或组合。 |
| **BUNDLE** | 打包销售的组合物品。 | 促销套装（如手机 + 保护壳）。 |
| **COUPON** | 非库存类折扣或券。 | 礼券或优惠券。 |
| **SERVICE** | 非实物的服务类项目。 | 安装或维护服务。 |
| **WARRANTY** | 与销售关联的保修项目。 | 延保服务。 |
| **BATCH_EXPIRY** | 按批次与有效期跟踪的物品。 | 食品、药品等受监管品类。 |
| **DOC_HEADER_ADJUSTMENT** | 单据级别调整行。 | 四舍五入或抬头调整。 |

**支持的 Sub Item Types：**
- `BASIC_QTY`
- `BATCH_NUMBER`
- `SERIAL_NUMBER`
- `BIN_NUMBER`

**Sub Item Type 差异说明：**

| Sub Item Type | 含义 | 常见用途 |
|---------------|---------------|------------------|
| **BASIC_QTY** | 不按批次或序列号的数量跟踪。 | 普通数量型物品。 |
| **BATCH_NUMBER** | 按批次或批号跟踪数量。 | 保质期或监管类物品。 |
| **SERIAL_NUMBER** | 按唯一序列号跟踪数量。 | 高价值或需序列号管理的物品。 |
| **BIN_NUMBER** | 按仓库内库位（bin）跟踪数量。 | 需要库位管理的仓库。 |

**搜索建议：**
- 使用 **Item Code** 精确匹配 SKU。
- 使用 **Balance Greater Than 0** 隐藏零结余物品。
- 使用 **Item Type** 过滤特定库存类型。

---

## 集成与数据来源 {#integrations--data-sources}

Stock Balance 会汇总多个库存流程的数据，并提供给下游 Applet 使用。

**入站数据来源（导入的行数据）：**
- Organisation Applet
- Item (Inventory) Maintenance Applet
- Doc Item Maintenance Applet
- Sales Invoice Applet
- Purchase Invoice Applet
- Sales Return Applet
- Purchases Return Applet
- Stock Adjustment Applet
- Sales Credit Note Applet
- Sales Debit Note Applet
- Purchase Credit Note Applet
- Purchase Debit Note Applet
- Internal Sales Goods Received Note Applet
- Internal Purchase Goods Received Note Applet
- Internal Sales Goods Issue Note Applet
- Internal Purchase Goods Issue Note Applet

**使用 Stock Balance 数据的下游 Applet：**
- Stock Availability Applet
- Inventory Admin Applet
- Sales Order Applet
- Packing Order Applet
- Delivery Order Applet
- Purchase Order Applet
- Purchase Requisition Applet
- Quotation Applet
- Sales Credit Note Applet
- Sales Debit Note Applet
- Purchase Credit Note Applet
- Purchase Debit Note Applet
- Sales Return Applet
- Purchases Return Applet
- Stock Adjustment Applet
- Internal Sales Goods Received Note Applet
- Internal Purchase Goods Received Note Applet
- Internal Sales Goods Issue Note Applet
- Internal Purchase Goods Issue Note Applet

---

## 配置与设置 {#configuration--settings}

配置取决于部署与权限。若 **Settings** 启用，管理员可以配置默认值与字段可见性。

{{< figure src="/images/stock-balance-applet/sb-setting.png" alt="库存结余设置页面" caption="用于设置默认值与字段可见性的库存结余设置页面。" >}}

### 权限

权限控制谁可以查看结余、成本与设置。请仅向授权角色授予读取与配置权限。

**可控制内容：**
- 访问 Stock Balance 列表
- 成本字段可见性（MA Price、Last Purchase Cost）
- Applet 设置访问（默认值、列可见性与配置）

**配置位置：**
- 使用 **Role Permissions** 对角色设置访问规则
- 使用 **User Permissions** 对特定用户设置例外权限

{{< figure src="/images/stock-balance-applet/sb-role-perm.png" alt="库存结余 Applet 的角色权限" caption="库存结余 Applet 的角色权限。" >}}

{{< figure src="/images/stock-balance-applet/sb-user-perm.png" alt="库存结余 Applet 的用户权限" caption="库存结余 Applet 的用户权限。" >}}

---

## 个性化

此 Applet 没有独立的个性化菜单。若环境支持个人默认值，将沿用组织级的分支、地点与语言偏好。

---

## 常见问题（FAQ）

**问：为什么我的库存结余显示为 0？**
答：先检查筛选条件。**Balance Greater Than 0** 会隐藏零结余物品，同时确认 **Location** 与 **Item Type** 是否正确。

**问：为什么看不到某个地点或公司？**
答：地点可见性受权限控制。请联系管理员确认访问权限与地点分配。

**问：为什么看不到 MA cost 或 last purchase cost 列？**
答：成本字段通常由权限控制，也可能被设置为隐藏。请联系管理员启用相关字段与权限。

**问：库存结余是如何计算的？**
答：库存结余由该物品与地点的所有入库与出库交易计算得出，系统会随交易实时更新。

**问：为什么无法生成图表？**
答：图表仅在启用 **Pivot Mode** 后可用。请在列设置中开启 Pivot Mode，再选取范围并选择 **Pivot Chart**。

**问：为什么没有导出选项？**
答：导出可能被权限或管理员设置禁用。请确认你的角色权限，并检查是否有导出限制。

**问：Stock Balance Applet 与 Stock Report Applet 有什么区别？**
答：Stock Balance 更侧重实时运营与列表分析，而 Stock Report 提供更全面的分析、历史视图与报表。

**问：为什么出现负库存？**
答：负库存通常由时序差异、回填交易或缺少入库导致。请检查该物品的近期销售、采购与调整记录，并确认是否允许负库存。
