---
title: "POS终端小程序"
description: "零售运营的销售点终端管理和配置"
tags:
- pos-module
- point-of-sale
- retail
- terminal-management
- cashier-operations
weight: 200
draft: true  # unpublished 2026-09-06 (Vincent): publishes content the English no longer says; retranslate from the rebuilt English page — see planning/reviews/2026-09-06-translation-orphan-sweep.md
---

## 目的和概述

{{< callout type="warning" >}}
**待办事项**：此小程序文档需要详细扩展。这是一个包含基本结构和关键信息的占位符。
{{< /callout >}}

POS终端小程序是BigLedger销售点模块的核心组件，为零售运营提供全面的销售点终端管理、配置和实时交易处理。

### 主要功能
- **终端配置** - POS硬件和软件设置
- **交易处理** - 实时销售交易处理
- **支付集成** - 多种支付方式支持
- **库存集成** - 实时库存水平更新
- **收据管理** - 收据打印和数字发送

## 主要特性

### 待办事项：扩展主要特性部分
- 多终端管理
- 离线/在线同步功能
- 条形码扫描集成
- 客户显示支持
- 管理员覆盖功能

## 集成点

### 核心模块依赖项
- **[库存项目维护小程序](/applets/inv-item-maintenance-applet/)** - 产品信息
- **[客户维护小程序](/applets/customer-maintenance-applet/)** - 客户数据
- **[现金簿小程序](/applets/cashbook-applet/)** - 支付处理
- **[税务配置小程序](/applets/tax-configuration-applet/)** - 销售税计算

## 相关小程序

### 待办事项：记录相关小程序
- 收银员操作小程序
- POS库存小程序
- 收据管理小程序
- POS报告小程序

{{< callout type="info" >}}
**文档状态**：此小程序需要全面的文档，包括详细功能、硬件要求、配置指南和零售实施示例。
{{< /callout >}}