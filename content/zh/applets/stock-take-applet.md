---
title: "库存盘点小程序"
description: "用于基于会话的库存审计、设备驱动盘点和对账报告的综合库存盘点与差异管理系统"
tags:
- stock-take
- inventory-control
- variance-management
- cycle-count
- warehouse-operations
weight: 165
---

{{< callout type="warning" >}}
**进行中**: 该小程序文档仍在审核中。
{{< /callout >}}

## 目的与概览

**库存盘点小程序** 是一款可直接落地到运营场景的工具，可在不依赖电子表格和手工对账的情况下执行准确盘点。它支持基于会话的盘点、设备驱动流程以及快速差异分析，帮助团队更快完成盘点并更快完成关账。

{{< callout type="info" >}}
**核心概念**: 该小程序将盘点流程端到端串联起来：**Session**（何时/何地盘点）、**Device**（谁来盘点）、**Records**（盘了什么）、以及 **Report**（如何对账差异）。
{{< /callout >}}

{{< figure src="/images/stock-take-applet/stock-take-main-overview.png" alt="库存盘点小程序首页视图，展示会话、设备、报表、设置和个性化等模块导航。" caption="库存盘点小程序概览：在一个统一的运营工作区访问所有核心盘点流程。" >}}

### 关于该小程序

- **目的**: 将库存盘点作业数字化，减少实物库存与系统结存之间的不一致。
- **目标用户**: 仓库团队、库存管控人员、财务/审计团队以及运营管理者。
- **关键特性**:
  - 通过 `OPEN` 和 `CLOSED` 控制执行基于会话的库存盘点
  - 设备分配以支持可控的多人盘点作业
  - 通过扫描表单或结构化手工录入快速采集商品
  - 面向序列号和批次的校验，提升可追溯盘点能力
  - 差异报表支持原因填写和基于 Excel 的批量原因上传

## 关键特性概览

### 谁会从这个小程序中受益？

**仓库员工与盘点员：**
- 通过条码/手工扫描流程更快完成盘点
- 可选自动扫描行为，减少数据录入疲劳
- 更完善地处理序列号和批次库存

**库存主管与门店经理：**
- 按地点组织结构化盘点会话
- 设备分配与进度可视化
- 通过会话关闭实现可治理的流程控制

**财务与内部审计团队：**
- 清晰的差异视图（数量差异与序列号差异）
- 成本影响可见并支持对账
- 记录差异原因以满足异常处理与审计追踪

**运营管理层：**
- 更高库存准确率，减少调整带来的意外
- 更可预测的库存对账周期
- 基于可靠库存报表进行更清晰的决策

### 这个小程序解决了什么问题？

**手工库存盘点问题：**

传统库存盘点通常依赖割裂的表格、延迟更新和薄弱的可追溯性。常见问题包括：
- 重复盘点或漏盘
- 日终对账缓慢
- 序列号不一致但缺少根因证据
- 差异缺少统一原因记录
- 管理决策可见性滞后

**库存盘点小程序解决方案：**

- **会话控制** - 以结构化 `OPEN` 和 `CLOSED` 周期执行盘点
- **引导式盘点** - 分配设备并按受控流程引导盘点员
- **灵活采集** - 可按场景选择先扫描或手工录入
- **序列号感知校验** - 提升序列号/批次库存盘点可信度
- **差异洞察** - 分析数量和序列号差异及其成本影响
- **批量对账** - 通过 Excel 导出、填写原因并导入更新对账结果

## 关键特性概览

{{< cards >}}
  {{< card title="会话管理" subtitle="创建、执行并关闭受控库存盘点会话" link="#session-management" >}}

  {{< card title="设备分配" subtitle="为每个会话绑定活跃设备以确保执行清晰" link="#device-management" >}}

  {{< card title="快速盘点" subtitle="扫描表单与结构化录入，支持高速盘点" link="#counting-workflows" >}}

  {{< card title="序列号与批次控制" subtitle="跟踪序列号和批次差异并提升可追溯性" link="#counting-workflows" >}}

  {{< card title="差异报表" subtitle="在一个视图中查看最小/最大值、盘点数量、系统数量和差异" link="#reporting-and-reconciliation" >}}

  {{< card title="原因上传" subtitle="在 Excel 中导出并导入原因更新" link="#reporting-and-reconciliation" >}}

  {{< card title="可配置规则" subtitle="控制扫描行为、校验、流程与可见性" link="#configuration--settings" >}}

  {{< card title="个性化默认值" subtitle="按小程序与用户设置分支和地点默认值" link="#configuration--settings" >}}
{{< /cards >}}

## 关键概念

### 理解库存盘点框架

| 维度 | 组件 | 实际示例 |
|--------|-----------|------------------|
| **何时/何地**盘点 | Stock Take Session | "KL Warehouse - April Cycle Count" |
| **谁**在盘点 | Assigned Devices / Users | Counter Device A, Counter Device B |
| **盘了什么** | Session Records | Item code, quantity, UOM, serial/batch |
| **如何**进行结果对账 | Session Report | Variance, serial variance, reason, cost impact |

### 库存盘点层级结构

```
Stock Take Applet
|
|-- Stock Take Session
|   |-- Details (name, code, location, status, workflow)
|   |-- Devices (assigned active counting devices)
|   |-- Records (all counted lines)
|   `-- Report (variance and reconciliation)
|
|-- Devices (master device setup)
|
`-- Report (cross-session listing and exports)
```

### 状态与报表类型

| 类型 | 值 | 含义 |
|------|--------|---------|
| **会话状态** | `OPEN`, `CLOSED` | 开放状态的会话允许主动盘点和编辑 |
| **差异状态** | `YES`, `NO` | 表示会话是否存在差异 |
| **报表类型** | `Scanned Items`, `Active Items`, `All Items` | 控制分析/导出时的报表范围 |

---

## 快速开始指南

使用以下按角色划分的流程快速上线。

### 面向盘点员：开始盘点商品

**目标：** 使用扫描或手工录入快速采集准确库存记录。

1. 进入 **Stock Take Session** 并打开分配给你的会话。
2. 在 **Devices** 标签中选择你被分配且处于活跃状态的设备。
3. 打开 **Records**，从 **Scan Form** 或 **Add Item** 开始。
4. 扫描或输入商品编码，选择 UOM，然后输入数量。
5. 对于序列号/批次商品，按要求填写序列号或批次信息。
6. 保存并确认该记录行已出现在列表中。

**提示：** 对于序列号商品，请保持数量与序列号列表一致，以避免保存报错。

---

### 面向库存主管：端到端执行一个会话

**目标：** 建立可控库存盘点会话并监控执行。

1. 打开 **Stock Take Session** 并点击 **Create**。
2. 填写 **Session Name**、**Session Code**、**Location**，并将状态保持为 `OPEN`。
3. 保存会话后，打开 **Devices** 标签。
4. 为每个盘点小组添加活跃设备。
5. 在盘点员提交记录行时监控 **Records**。
6. 在 **Report** 标签中点击 **GENERATE** 或 **REGENERATE** 刷新差异。
7. 审核并完成对账后，将状态改为 `CLOSED`。

---

### 面向管理员：上线前配置小程序

**目标：** 在团队开始盘点前确保小程序配置正确。

1. 打开 **Settings > Field Settings**。
2. 设置所需开关：
   - `ENABLE_AUTO_SCAN`（如果你需要扫描后自动加入列表）
   - `ENABLE_VALIDATE_SERIAL`（用于序列号库存控制）
   - `SCAN_CODE_MOBILE_VIEW`（如果使用移动端相机扫描）

3. 如需在会话推进中启用流程控制，请配置 `WORKFLOW_PROCESS_GUID`。

{{< figure src="/images/stock-take-applet/auto-scan.png" alt="Field Settings 页面，包含自动扫描、序列号校验、移动端扫描和流程配置选项。" caption="Field Settings：在上线前配置扫描行为、校验控制和流程关联。" >}}

4. 打开 **Settings > Default Selection** 并设置默认分支与地点。
5. 打开 **Personalization > Default Selection** 并验证试点用户的用户级覆盖设置。
6. 使用一个示例会话进行端到端测试：
   - 创建会话
   - 分配设备
   - 添加记录
   - 生成报表
   - 填写原因
   - 关闭会话

---

### 面向财务/审计：对账差异并关闭异常

**目标：** 以可用于审计的证据完成差异复核。

1. 打开目标会话并进入 **Report** 标签。

{{< figure src="/images/stock-take-applet/session-report.png" alt="Session Report 标签页，显示已生成报表行、差异列，以及所选库存盘点会话的对账上下文。" caption="Session Report 视图：在当前库存盘点会话中分析商品级差异并准备对账。" >}}

2. 通过报表类型筛选（`Scanned Items`、`Active Items` 或 `All Items`）。


{{< figure src="/images/stock-take-applet/session-report-search.png" alt="Session Report 高级搜索，包含 Scanned Items、Active Items 或 All Items 报表类型筛选。" caption="Session Report 搜索：快速过滤报表范围，聚焦精确的对账数据集。" >}}

3. 复核数量差异、序列号差异和总成本影响。
4. 对关键异常逐行填写原因，或点击 **UPLOAD REASON**。
5. 导出报表模板，填写 `TotalQty` 和 `reason`，然后导入回系统。
6. 确认报表行已更新，并在需要时导出最终报表。

{{< callout type="tip" >}}
**实务上线顺序**: 先在一个试点地点和一个盘点小组运行。验证流程耗时后，再扩展到所有地点。
{{< /callout >}}

---

## 会话管理

### 会话列表

会话网格提供快速运营视图，字段包括：
- 会话名称（Session Name）和会话编码（Session Code）
- 地点（Location）和公司（Company）
- 状态（Status，`OPEN` / `CLOSED`）
- 开始日期（Start Date）和修改日期（Modified Date）

{{< figure src="/images/stock-take-applet/stock-take-session-listing.png" alt="Stock Take Session 列表，含可搜索记录、会话元数据和运营状态跟踪。" caption="会话列表页：通过筛选和快捷操作查看进行中与已完成会话。" >}}

### 会话详情

**Details** 标签包含：
- 会话标识：名称、编码、描述
- 运营上下文：地点和公司
- 控制字段：状态、开始/结束日期
- 流程字段：状态与处理结果
- 审计字段：创建/修改人及时间戳

{{< figure src="/images/stock-take-applet/stock-take-session-create-form.png" alt="创建库存盘点会话表单，包含会话编码、地点和流程详情等核心字段。" caption="创建会话表单：配置一个包含必需运营信息的新库存盘点会话。" >}}

{{< figure src="/images/stock-take-applet/stock-take-session-edit-form.png" alt="编辑库存盘点会话表单，显示状态、详情及关联盘点标签的更新控制。" caption="编辑会话表单：维护会话详情并控制从开放盘点到关闭的推进过程。" >}}

### 设备标签

使用此标签将活跃设备绑定到会话。之后盘点员即可在该会话中使用设备记录库存行。

{{< figure src="/images/stock-take-applet/device-tab.png" alt="会话编辑中的 Devices 标签，展示已分配盘点设备及其当前状态。" caption="会话设备标签：为所选库存盘点会话绑定并查看活跃盘点设备。" >}}

### 记录标签

提供跨已分配设备的会话级盘点行视图。主管可快速发现缺失行、不匹配和异常值。

{{< figure src="/images/stock-take-applet/session-record.png" alt="Records 标签显示盘点商品行，包含商品编码、数量、UOM 和最后更新时间信息。" caption="会话记录标签：在执行过程中跟踪已采集库存盘点并查看记录级详情。" >}}

### 报表标签

这是对账工作区：
- 生成或重新生成报表行
- 筛选并检查差异
- 记录原因
- 启动原因上传流程

{{< figure src="/images/stock-take-applet/session-report-tab.png" alt="Session Report 标签控制区，包含 Generate/Regenerate 操作、报表列表和原因更新流程。" caption="会话报表标签：在一个标签内生成差异输出并管理对账操作。" >}}

## 设备管理

**Devices** 菜单用于管理你的库存盘点设备主数据：
- 创建设备档案（名称、编码、品牌、型号、状态）
- 仅保留可用且活跃的设备用于分配
- 维护设备状态以支持受控会话使用

{{< figure src="/images/stock-take-applet/stock-take-device-listing.png" alt="库存盘点设备列表，显示用于分配的设备编码、型号信息和活跃状态。" caption="设备列表页：在将设备分配到库存盘点会话之前管理可用盘点设备。" >}}

{{< figure src="/images/stock-take-applet/stock-take-device-create-form.png" alt="创建设备表单，包含设备名称、编码、品牌、型号和状态字段。" caption="创建设备表单：注册一个可分配到会话流程的新库存盘点设备。" >}}

{{< figure src="/images/stock-take-applet/stock-take-device-edit-form.png" alt="编辑设备表单，展示现有设备详情、状态更新及审计元数据字段。" caption="编辑设备表单：维护设备档案信息和启用状态以支持持续运营。" >}}

## 盘点工作流

### 结构化录入（Add Item）

适用于需要逐行引导录入的场景：
- Scan Code 查询
- UOM 选择
- 数量扫描/手工处理
- 序列号列表处理
- 保存选项，如 **Save & Continue** 和 **Save & New**

### 快速扫描表单

适用于追求速度的盘点环境：
- 可选移动端相机扫描模式
- 针对条码格式的读取器类型选择
- 使用数量、备注和序列号/批次输入快速添加
- 在扫描列表中可直接编辑备注

### 编辑与修正

可在记录编辑页复核并修正盘点行。当会话为 `CLOSED` 时，创建/更新/删除操作会被限制，以保护结果最终化。

## 报表与对账

### 会话级报表

报表行包括：
- 商品详情：商品名称、编码、EAN
- 数量信号：Min、Max、Counted、EMP/System quantity
- 差异指标：Variance、Variance 2、SN Variance
- 序列号分析：仅系统存在 vs 仅盘点存在的序列号
- 财务信号：成本值与总成本影响
- 对账备注原因字段

{{< callout type="info" >}}
**术语说明**: 在报表页面中，**EMP Quantity** 指用于差异对比的系统期末结存。
{{< /callout >}}

{{< figure src="/images/stock-take-applet/stock-take-session-report-details.png" alt="库存盘点会话报表详情，展示商品级数量、差异指标和原因字段。" caption="会话报表详情页：在商品粒度上将盘点数量与系统结存进行对账。" >}}

### 跨会话报表列表

顶层 **Report** 菜单可按以下维度比较会话：
- 地点（Location）
- 日期（Date）
- 会话状态（Session status）
- 差异状态（Variance status）

同时支持直接导出报表。

{{< figure src="/images/stock-take-applet/stock-take-report-listing.png" alt="库存盘点报表列表，包含差异状态、分组视图和可导出布局。" caption="报表列表页：分析库存盘点结果并识别需要对账的会话。" >}}

### Excel 原因上传流程

该小程序支持规模化对账：
1. 选择报表类型并导出文件。
2. 填写关键字段（`itemCode`、`TotalQty`、`reason`）。
3. 导入文件以批量更新报表行。
4. 重新打开报表验证更新。

{{< figure src="/images/stock-take-applet/stock-take-upload-reason.png" alt="上传原因页面，用于导入基于 Excel 的差异备注和数量调整。" caption="上传原因页：使用库存盘点报表模板批量导入对账原因。" >}}

{{< figure src="/images/stock-take-applet/stock-take-upload-reason-1.png" alt="上传原因后续页面，显示已选文件状态和可执行导入操作。" caption="上传原因确认：校验准备好的文件并继续批量导入原因。" >}}

## 配置与设置

### `Settings > Field Settings`

通过以下开关控制运行时行为：

| 设置项（Setting） | 影响（Impact） |
|---------|--------|
| `ENABLE_AUTO_SCAN` | 自动将扫描商品推入列表 |
| `ENABLE_VALIDATE_SERIAL` | 启用序列号校验逻辑 |
| `STOCK_DURING_OPENING_SHOP` | 允许配置盘点时机策略 |
| `SERIALIZED_ITEM_EXT` | 从商品扩展读取序列化行为 |
| `SCAN_CODE_MOBILE_VIEW` | 启用相机/移动端扫描视图 |
| `HIDE_ADD_BUTTON` | 在扫描表单中隐藏手工添加操作 |
| `WORKFLOW_PROCESS_GUID` | 将会话流程连接到工作流配置 |

{{< figure src="/images/stock-take-applet/stock-take-settings-page.png" alt="库存盘点小程序设置页，包含字段配置、流程控制和默认选择选项。" caption="设置页：配置扫描行为、校验规则和小程序级默认控制。" >}}

### `Settings > Default Selection`

设置小程序级默认值：
- 默认分支（Default Branch）
- 默认地点（Default Location）

### 权限与集成工具

设置路由还提供以下运营控制：
- 功能可见性（Feature visibility）
- Webhook 配置（Webhook setup）
- 权限向导（Permission wizard）、权限集合（permission sets），以及角色/用户/团队权限视图

## 审计与可追溯性

该小程序通过以下能力支持审计导向运营：
- 会话和记录时间戳（`created` 和 `modified`）
- 关键记录的用户归属（`created by` 和 `modified by`）
- 报表行级差异原因记录
- 通过会话状态（`OPEN` vs `CLOSED`）实现受控最终化

**实务审计流程：**
1. 确认会话状态和关闭日期。
2. 复核报表行差异与原因字段。
3. 校验序列号商品的序列号差异。
4. 导出最终报表作为审计证据。

---

## 故障排查流程

当用户反馈库存盘点问题时，可使用以下快速决策流程。

```text
Start
  |
  +-- What is the issue type?
      |
      +-- Scan Issue
      |    |
      |    +-- Item code not recognized?
      |    |    -> Check code exists and item is active
      |    |
      |    +-- Mobile scan not opening?
      |    |    -> Check `SCAN_CODE_MOBILE_VIEW` in Field Settings
      |    |
      |    +-- Add button not visible?
      |         -> Check `HIDE_ADD_BUTTON` in Field Settings
      |
      +-- Serial Issue
      |    |
      |    +-- Save blocked with serial error?
      |    |    -> Ensure qty matches serial count
      |    |
      |    +-- Serial validation failing?
      |         -> Check `ENABLE_VALIDATE_SERIAL`
      |         -> Verify serial belongs to the selected item
      |
      +-- Report Issue
           |
           +-- GENERATE/REGENERATE disabled?
           |    -> Confirm session status is `OPEN`
           |
           +-- Variance lines missing?
           |    -> Regenerate report and check selected report type
           |
           +-- Reason import failed?
                -> Validate Excel template columns (`itemCode`, `TotalQty`, `reason`)
                -> Re-import and review error rows
```

{{< callout type="tip" >}}
如果按此流程排查后问题仍存在，请在升级处理前记录会话编码、设备编码以及错误状态截图。
{{< /callout >}}

---

## 常见问题（FAQ）

**Q: 为什么我无法在会话中添加记录？**  
A: 最常见原因是会话已处于 `CLOSED`。仅在你的治理策略允许时才可重新打开流程/状态。

**Q: 为什么我的序列号商品保存失败？**  
A: 数量与序列号录入很可能不平衡，或该商品的一项/多项序列号值无效。

**Q: Variance 和 Variance 2 有什么区别？**  
A: Variance 基于最小/最大计算区间核对盘点数量；Variance 2 则将盘点数量直接与系统期末结存比较。

**Q: 我可以批量对账原因，而不是逐行编辑吗？**  
A: 可以。使用 **Upload Reason** 导出报表数据，在 Excel 中填写数量/原因后再导入。

**Q: 为什么扫描模式下 Add 按钮被隐藏？**  
A: 很可能是 Field Settings 中启用了 `HIDE_ADD_BUTTON`。

**Q: 如何仅在报表中包含活跃库存？**  
A: 在生成/导出前使用报表类型筛选并选择 **Active Items**。

**Q: 为什么我在报表标签中无法点击 GENERATE/REGENERATE？**  
A: 仅当会话状态为 `OPEN` 时才允许生成报表。

**Q: 为什么在我的会话中没有可分配设备？**  
A: 只有活跃设备可被分配。请检查设备主数据列表并启用所需设备。

**Q: 为什么扫描表单中的商品被标记为无效？**  
A: 可能是编码未匹配到活跃商品配置，或商品/序列号校验规则阻止了录入。

**Q: Scanned、Active、All Items 三种报表类型应如何选择？**  
A: **Scanned Items** 用于仅看已采集数据，**Active Items** 用于当前活跃库存范围，**All Items** 用于完整对账范围。

**Q: 会话关闭后还能编辑或删除记录吗？**  
A: 不能。关闭会话的设计目的是锁定运营编辑并保持对账完整性。
