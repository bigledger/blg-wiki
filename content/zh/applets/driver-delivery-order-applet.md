---
title: "司机送货单 (Driver Delivery Order) Applet"
description: "用于高效管理和更新出库送货单的简化微型应用程序。"
tags:
- delivery-management
- driver-app
- logistics
- order-tracking
- status-updates
weight: 70
---

## 目的和概述

**Driver Delivery Order Applet** 是一个专门的微型应用程序（主要建立在现有的 Sales Invoice / Outbound Delivery Order 组件之上），旨在简化送货工作流程。它通过提供一个专用且简化的界面来查看、管理和更新送货单状态，从而免去了完整 ERP 系统的复杂性。

{{< callout type="info" >}}
**核心概念**：系统将**谁**在送货（司机）、**送什么**（送货单）以及**如何**跟踪（实时状态更新）连接在一起。
{{< /callout >}}

## 主要功能概述

### 谁将从此 Applet 中受益？

**司机和送货人员：**
- 专注的移动端友好界面，仅显示必要的送货信息
- 在外送货时快速更新状态
- 无需完整的销售会计屏幕，减少了视觉干扰
- 轻松访问送货详情和路线规划

**调度员和物流人员：**
- 实时跟踪和管理出库送货单
- 能够快速分配和重新组织送货时间表
- 清晰概览待处理、运输中和已完成的送货任务
- 简化与司机的沟通

**管理层和后台（财务和运营）：**
- 实时状态更新，瞬间反映在中央 ERP 系统中
- 提高了跟踪的准确性和可靠性
- 在送货完成时自动触发通知和 Webhook
- 通过最新的送货信息提供更好的客户服务

### 这解决了什么问题？

**复杂的 ERP 问题：**

传统的 ERP 系统对于现场工作人员来说通常过于复杂。常见问题包括：
- 司机在一大堆销售和财务屏幕中导航
- 状态更新延迟导致客户可见度差
- 在移动设备上更新订单困难
- 调度员和司机之间沟通不畅
- 向现场工作人员授予过宽的 ERP 访问权限会带来安全风险

**Driver Delivery Order Applet 解决方案：**

- **专用界面** - 专为送货工作流程构建的专注 applet
- **实时同步** - 司机的更新会瞬间反映在中央 ERP 系统中
- **高级筛选** - 按分支机构、状态或日期快速查找订单
- **精细权限** - 限制谁可以查看或编辑特定的送货文件
- **可自定义状态** - 根据您的确切物流术语定制送货状态

## 主要功能概述

{{< cards >}}
  {{< card title="司机送货单列表 (Driver Delivery Order Listing)" subtitle="带有分页功能的数据网格，显示相关的送货信息" link="#driver-delivery-order-listing" >}}

  {{< card title="高级搜索和筛选 (Advanced Search & Filtering)" subtitle="按分支机构、过账状态等进行筛选" link="#advanced-search--filtering" >}}

  {{< card title="编辑和状态更新 (Edit & Status Updates)" subtitle="更新主要详情、查看项目并更改状态" link="#edit--status-updates" >}}

  {{< card title="自定义状态 (Custom Statuses)" subtitle="定义特定的送货术语" link="#configuration--settings" >}}

  {{< card title="Webhook 集成 (Webhook Integrations)" subtitle="在状态更改时触发事件" link="#configuration--settings" >}}

  {{< card title="字段可见性和个性化 (Field Visibility & Personalization)" subtitle="自定义司机体验" link="#configuration--settings" >}}

  {{< card title="权限管理 (Permission Management)" subtitle="精细的角色和文件限制" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/driver-delivery-applet/driver-delivery-order-overview-infographic.png" alt="Streamlined Deliveries: Your Guide to the Driver Delivery Order Applet - comparing complex ERP challenges with the focused applet solution" caption="简化您的送货工作流程：旧方法（复杂的屏幕、延迟的更新、沟通不畅）与新方法（移动端友好、实时同步、轻松跟踪）。" >}}

{{< figure src="/images/driver-delivery-applet/driver-delivery-overview.png" alt="Driver Delivery Order Applet Dashboard Overview" caption="Applet 概览：Driver Delivery Order 主仪表板的综合视图。" >}}

---

## 快速入门指南

使用这些基本工作流程快速上手并运行。

### 供司机使用：管理您的送货

**目标：** 在现场查看您分配到的送货任务并更新其状态。

1. **导航**：通过您的 applet 菜单转到 **Driver Delivery Order Listing**
2. **查找您的订单**： 
   - 检查默认视图，它显示了分配给您的“待处理 (Pending)”或“运输中 (In Transit)”订单
   - 使用搜索栏查找特定的送货单编号
3. **查看详情**： 
   - 点击订单以打开编辑屏幕（或点击“添加”以创建新的临时送货）

   - 查看 **Main Details（主要详情）** 选项卡获取客户地址和说明
   - 查看 **Lines（行）** 选项卡以验证您正在运送什么货物
4. **更新状态**： 
   - 一旦送达（或出现问题），点击 **Status（状态）** 下拉菜单
   - 选择适当的自定义状态（例如，*已送达 (Delivered)*、*失败 (Failed)*、*重新安排 (Rescheduled)*）
5. **保存**：点击 **Save（保存）** 确认。后台数据将瞬间更新！

**专家提示：** 利用个性化侧边栏设置，只需点击即可访问您最常用的操作。

---

### 供调度员使用：跟踪和管理

**目标：** 监控出库送货单并协助司机。

1. **检查列表**：打开 **Driver Delivery Order Listing**
2. **按状态筛选**： 
   - 使用高级搜索按 `DEFAULT_POSTING_STATUS` 筛选
   - 快速找到所有需要调度的“待处理 (Pending)”订单
3. **按分支机构筛选**：如果管理多个地点，按分支机构筛选以查看本地的送货情况
4. **监控更新**：当司机在现场更新他们的订单时，刷新网格以查看实时的状态更改
5. **处理异常**：如果司机报告了问题（例如，状态改为 *失败 (Failed)*），点入订单以查看备注并重新安排。

---

### 供管理员使用：初始系统设置

**目标：** 为您的物流团队配置 applet。

**第 3 步：组织服务器端权限** (`Settings > User / Role Permissions`)
该 Applet 提供全面的权限模块。定义团队 / 用户 / 角色权限，以确保司机只能看到他们自己分支机构的送货文件，并且经理能获得更广泛的跟踪视图。

**第 4 步：自定义状态** (`Settings > Custom Status`)
- 设置符合您工作流程的状态（例如，“准备取货 (Ready for Pickup)”、“运输中 (In Transit)”、“已送达 (Delivered)”、“客户不在家 (Customer Not Home)”）。

**第 5 步：测试流程**
- 在主 ERP 中创建测试用出库送货单 (Outbound Delivery Order)。
- 以司机身份登录，在 Applet 中找到订单，然后更新其状态。
- 验证主 ERP 是否反映了此新状态。

---

### 高级搜索和筛选

**目标：** 快速查找特定的送货订单或筛选列表以获取运营洞察。

1. **打开筛选面板**：在 Driver Delivery Order Listing 页面，打开高级搜索 (Advanced Search) 筛选器。
2. **按分支机构筛选**：需要查看特定物流枢纽的送货情况吗？从下拉菜单选择相应分支机构。 
3. **按状态筛选**： 使用过账状态 (Posting Status) 筛选器，将结果缩小至仅包括“运输中 (In Transit)”或“已送达 (Delivered)”订单，以跟踪绩效。
4. **关键字搜索**： 快速调出特定文档以处理司机或客户查询。

{{< figure src="/images/driver-delivery-applet/advance-filter.png" alt="Driver Delivery Order Advanced Filtering" caption="高级筛选：轻松查找特定的送货和状态。" >}}

---

## 配置和设置

Driver Delivery Order Applet 可通过 **Settings（设置）** 菜单进行系统控制。各项设置根据逻辑进行了分组以帮助您为员工自定义所需环境。

{{< figure src="/images/driver-delivery-applet/setting-page.png" alt="Driver Delivery Order Settings Page" caption="Applet 设置：Applet 中所有可配置功能的分类列表。" >}}

### 系统配置 (System Configuration)
这些设置能够调整底层送货文件的行为。

*   **应用程序设置 (Application Settings)：** 限定 Applet 的全局行为开关。

{{< figure src="/images/driver-delivery-applet/application-setting-driver-do.png" alt="Application setting for driver delivery order applet" caption="Applet 设置：允许用户设置在 applet 中显示哪些侧边栏和侧边菜单的设置。" >}}

*   **默认选择 (Default Selection)：** 设置表单的自动填充数值，让司机不用反复选择统一的重复数据。

{{< figure src="/images/driver-delivery-applet/default-selection.png" alt="Default selection on Driver Delivery Order Applet" caption="Applet 设置：允许用户选择将哪些分支机构和位置设置为默认的设置。" >}}

*   **自定义状态 (Custom Status)：** 这也许是最重要的功能模块！通过建立自定义状态绘制您的物流路程规划（比如 `包装 (Packing)`，`装车 (Loading)`，`运输中 (In Transit)`，`已送达 (Delivered)`，`派送失败 (Failed Delivery)`）。

{{< figure src="/images/driver-delivery-applet/custom-status.png" alt="Custom status on Driver Delivery Order Applet" caption="Applet 设置：允许用户设置送货单的自定义状态的设置。" >}}

### 服务器端权限 (Server Side Permissions)
通过限制真正可以查看、编辑、或者删除这些派送表单的用户，进一步保护公司数据安全。

*   **权限向导 (Permission Wizard)：** 用来快速建立基础功能权限管理的工具向导。

{{< figure src="/images/driver-delivery-applet/permission-wizard.png" alt="Permission wizard on Driver Delivery Order Applet" caption="Applet 设置：用于快速分配基准权限的系统向导工具。" >}}

*   **权限集 (Permission Set)：** 整合权限并设为能够随时被重用的配置模板。
{{< figure src="/images/driver-delivery-applet/permission-set.png" alt="Permission set on Driver Delivery Order Applet" caption="Applet 设置：用户可以使用此菜单保存权限设定并套用到相关的用户 / 角色权限设置上。" >}}

*   **用户/角色权限 (User / Role Permission)：** 提供更为细致精确的划分，具体限定单个或群组所被包含的整体查看访问权限。确保单一司机和站点中心只会看到专属于派发给自己的相关数据表单任务。

{{< figure src="/images/driver-delivery-applet/role-permission.png" alt="Role permission on Driver Delivery Order Applet" caption="Applet 设置：管理员可通过此配置菜单给每位员工设定自己的专属 applet 权限。" >}}

### 开发者工具 (Developer Tools)
专门为帮助管理层负责维护及更新各类 applet 的附属插件功能组件。

*   **发行说明 (Release Notes)：** 您可以快速检索获取各类最新 Applet 等版本更替，修复了哪些系统故障及优化的记录列表。

{{< figure src="/images/driver-delivery-applet/release-note.png" alt="Release note on Driver Delivery Order Applet" caption="用户可通过此功能查阅各类最新的部署和优化更新应用说明。 " >}}

*   **审计跟踪 (Audit Trail)：** 查询并检索操作活动的过往系统日志。轻松地找出到底是谁修改了某个对应单据表格的状态信息，发生在何时以及它的先前所处的相应表单状态。

{{< figure src="/images/driver-delivery-applet/audit-trail.png" alt="Audit trail on Driver Delivery Order Applet">}}

---

## 常见问题解答 (FAQ)

**问：司机是否需要完整会计系统的访问权限才能使用此 applet？**  
答：不需要。这个 applet 的核心优势是它抽象化了复杂的 ERP 系统。司机只需对这个专属的 applet 拥有使用访问权限即可。不仅大大保护了重要财务机密数据的泄漏，也最大程度地简化了派发配送系统原本繁杂的操作流程与成本。

**问：我可以实时看到送货更新吗？**  
答：是的。由于 applet 建立在目前现有的（Outbound Delivery Order）组件功能之上，只要有一位配送司机在线执行任何相应更新，后台内部的大规模系统数据库就会随之呈现瞬间的实时修改展现。没有一丝延迟的困扰。

**问：我们应当如何防范司机的权限，避免他们随意知晓并查看到不必要的系统送单信息呢？**  
答：系统的管理员层可以通过运用操作设定好“服务器端权限 (Server Side Permissions) ” 以达到从本源处便成功规划好的用户所接收限制功能使用的体验系统模块的最终诉求目的，进一步从真正意义上防杜泄露、篡改数据的潜在安全风险或产生不相干系统讯息的各种噪音问题所在。

**问：如果客户拒收派件的物品，司机须该作何应对处理呢？**  
答：遇到类似的相关退运特殊操作情形，我们的专职派发司机会主动登入其相对绑定的系统后台的订单配送栏，修改 “自定义状态 (Custom Status)”至一个系统例外的情形例如直接判定为 “退货失败 (Failed) 或拒签退货状态 (Rejected) ”等并在相应的系统填写文字注解部分记录好产生此类现象问题的具体原因，调度中心随后便可重新跟进检阅、商榷是否需要再度规划该笔退派定单。

**问：我可以筛选系统中的具体订单交付清单，从而更简单纯粹只呈现及管理针对属于指派分部（Branch）之专属列表订单吗？**  
答：可以通过这类的细项设定过滤进行实现。您只需要前往页面的 “高级搜索 (Advanced Search) ”设定模块对您的专属所在站分支网点去选择检索。如果打算永久的达成默认固化此类需求使用习惯，建议进行个人默认中心（*Personal Default Settings*）页面的调整设置。这样便能使得用户下一次完成账户登录启动之后能持续不断的自适应显示为贵司下派此相关联系统的系统专属分发站点处理范围网点单数选项列表。

**问：如果不小心有司机出现了人为的粗心差错操作更迭错误了另一份不是自身的派送单要怎么解决呢？**
答：因为所有的行动以及更新动态都会时时上传集中被纪录并记载储存备案保留于我们的整套后台系统 ERP 数据云中之中，被企业指派授予管理最高核实调控权限的管理用户人员是可以直接审核所有这些相关数据的来历痕迹操作纪录去从上往下反追踪的来调换且撤回相应的派发错换指令的。但出于规避以及节约沟通上的日常开支所必须付出的无谓重复性的损耗与反复，依然建议还是应需平时经常性规范督导以及经常性对本派送部门所属车队长跟队员加强叮嘱宣导相关流程以预防和减低操作频发上的严重性系统误操作问题发生机率，这更是每个管理和工作人员最最该牢记的事情！
