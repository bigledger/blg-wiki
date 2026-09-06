---
title: 小程序与工作流程
description: BigLedger 小程序和工作流程自动化的全面指南
weight: 1
bookCollapseSection: false
tags:
- applets
- workflows
- automation
---

BigLedger 的模块化架构建立在小程序之上 - 可重复使用的组件提供特定的业务功能。每个小程序可以被多个模块使用，确保整个系统的一致性。

## 理解小程序

{{< callout type="info" >}}
**重要提示**：小程序与模块具有多对多关系。例如，税务配置小程序被财务会计、销售、采购和电子商务模块使用。这种设计消除了重复并确保系统中的行为一致。
{{< /callout >}}

### 关键特征
- **可重复使用** - 一个小程序服务多个模块
- **可配置** - 根据您的业务需求定制
- **集成** - 无缝协同工作
- **独立** - 可以在不影响其他组件的情况下更新

## 小程序资源

### 完整的小程序参考
- **[完整小程序目录](/zh/applets/applet-catalog/)** - 按模块组织的所有 BigLedger 小程序的综合目录
- **[小程序目录](/zh/applets/applet-directory/)** - 可搜索的小程序市场和安装指南
- **[小程序商店](/zh/applets/applet-store/)** - 额外小程序和扩展的市场

### 特色小程序类别

#### 核心模块（13个基本小程序）
所有其他模块所需的基础小程序：
- **[租户管理小程序](/applets/tenant-admin-applet/)** - 系统管理和配置
- **[会计科目表小程序](/applets/chart-of-account-applet/)** - 财务账户结构
- **[组织小程序](/applets/organization-applet/)** - 公司和组织结构
- **[客户维护小程序](/applets/customer-maintenance-applet/)** - 客户主数据
- **[供应商维护小程序](/zh/applets/supplier-maintenance-applet/)** - 供应商主数据
- **[员工维护小程序](/applets/employee-maintenance-applet/)** - 员工记录
- **[税务配置小程序](/applets/tax-configuration-applet/)** - 税务设置和合规
- **[查看所有核心小程序 →](/zh/applets/applet-catalog/#core-module-applets-13-applets)**

#### 库存与运营
- **[库存盘点小程序](/applets/stock-take-applet/)** - 数字库存计数和管理
- **[库存余额小程序](/applets/stock-balance-applet/)** - 实时库存跟踪
- **[内部库存调整小程序](/zh/applets/internal-stock-adjustment-applet/)** - 库存修正
- **[流程监控小程序](/zh/applets/process-monitoring-applet/)** - 业务流程跟踪

#### 客户参与
- **[团队维护小程序](/zh/applets/team-maintenance-applet/)** - 团队结构和管理
- **[会员管理控制台小程序](/zh/applets/membership-admin-console-applet/)** - 客户忠诚度计划
- **[统一联络中心小程序](/zh/applets/unified-contact-center-ucc-applet/)** - 客户服务平台

#### 定价与商务
- **[价格表小程序](/applets/pricebook-applet/)** - 高级定价管理
- **[EcomSync 相关小程序](/applets/90-ecomsync-related-applets/)** - 电子商务同步

## 模块集成

小程序设计为与模块具有多对多关系：