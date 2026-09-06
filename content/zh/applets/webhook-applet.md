---
title: "Webhook 小程序"
description: "BigLedger 的实时事件通知和外部系统集成"
tags:
- core-module
- integration
- webhooks
- notifications
- api-integration
- real-time
weight: 11
draft: true
unpublished: 2026-09-06
unpublished_reason: "ADR-0008 tier 1 — the Chinese twin of content/en/applets/integrations/webhook-applet.md, unpublished 2026-09-06 and left live here. Same invented claims: retries, OAuth/JWT, request signing, IP whitelisting, 200+ event types, 99.9% delivery, 90-day retention. See planning/worklog/webhook-applet-2026-09-06-unpublish.md"
---

## 目的和概述

Webhook 小程序是一个关键的核心模块集成组件，支持实时事件通知和 BigLedger 与外部系统之间的无缝通信。此小程序提供全面的 webhook 管理、事件驱动通知和 API 集成功能，支持自动化工作流程和系统同步。

{{< callout type="info" >}}
**核心模块小程序**：这是13个基本核心模块小程序之一，支持与外部系统和服务的实时集成和通信。
{{< /callout >}}

### 主要功能
- **Webhook 配置和管理** - 设置和管理 webhook 端点
- **实时事件通知** - 向外部系统即时广播事件
- **API 集成支持** - 促进第三方系统集成
- **事件筛选和路由** - 选择性事件传递和路由
- **安全和认证** - 安全的 webhook 通信

## 关键特性

### Webhook 端点管理
- 多个 webhook 端点配置
- HTTP/HTTPS 协议支持
- 自定义标头和认证设置
- SSL 证书验证
- 端点健康监控和状态跟踪
- 自动重试和故障处理

### 事件广播系统
- 跨所有模块的实时事件捕获
- 可配置的事件类型和筛选器
- JSON 有效负载自定义和格式化
- 批处理和单个事件传递
- 事件排队和可靠传递
- 历史事件日志记录和跟踪

### 安全和认证
- 多种认证方法（API 密钥、OAuth、JWT）
- 请求签名和验证
- IP 白名单和访问控制
- SSL/TLS 加密强制
- 速率限制和节流
- 安全审计日志记录

### 集成管理
- 第三方系统集成模板
- 流行服务集成（Zapier、IFTTT 等）
- 自定义集成开发支持
- 集成测试和验证工具
- 性能监控和分析
- 错误处理和调试工具

### 事件筛选和路由
- 高级事件筛选条件
- 基于数据值的条件路由
- 多目标事件广播
- 自定义转换和映射
- 基于业务规则的事件处理
- 实时事件预览和测试

## 技术规范

### 系统要求
- **最低访问级别**：集成管理员
- **数据库依赖项**：事件和 webhook 表
- **集成点**：所有 BigLedger 模块
- **API 标准**：RESTful API，JSON 格式
- **安全协议**：HTTPS，OAuth 2.0，JWT

### Webhook 配置选项
- **端点 URL**：无限制的 webhook 端点
- **事件类型**：200+ 支持的事件类型
- **有效负载大小**：每个 webhook 最多 10MB
- **重试尝试**：可配置的重试策略
- **认证方法**：多种安全选项

### 性能参数
- **事件吞吐量**：每秒 10,000+ 事件
- **响应时间**：事件捕获 <100ms
- **传递成功率**：99.9% 传递保证
- **并发 Webhooks**：1,000+ 同时传递
- **历史保留**：90 天事件历史

## 集成点

### 核心模块依赖项
- **租户管理员小程序** - 用户认证和权限
- **组织小程序** - 多租户事件路由
- **员工维护小程序** - 基于用户的事件筛选
- **工作流设计小程序** - 工作流触发的事件

### 模块集成
| 模块 | 集成目的 |
|--------|-------------------|
| **销售和 CRM** | 客户和销售事件通知 |
| **采购** | 采购订单和供应商事件警报 |
| **财务会计** | 财务交易事件广播 |
| **库存管理** | 库存水平和移动通知 |
| **电子商务** | 在线交易和客户事件 |
| **制造** | 生产和质量控制事件 |
| **人力资源和工资** | 员工和工资事件通知 |

### 外部集成
- **CRM 系统** - Salesforce、HubSpot、Pipedrive 集成
- **营销平台** - Mailchimp、Constant Contact 通知
- **通信工具** - Slack、Microsoft Teams 警报
- **商业智能** - Power BI、Tableau 数据源
- **会计软件** - QuickBooks、Xero 同步
- **电子商务平台** - Shopify、WooCommerce 集成

## 配置要求

### 初始设置要求
1. **Webhook 端点** - 配置外部系统 URL
2. **认证设置** - 设置安全凭据
3. **事件选择** - 选择相关事件类型
4. **筛选规则** - 定义事件筛选条件
5. **测试配置** - 验证 webhook 功能

### 基本配置
- **事件类型**：已创建订单、已收到付款、库存更新
- **认证**：API 密钥、OAuth 令牌、JWT 凭据
- **重试策略**：指数退避、最大尝试次数
- **筛选规则**：客户特定、金额阈值
- **安全设置**：SSL 验证、IP 白名单

### 高级配置
- **自定义转换** - 数据映射和格式化
- **条件路由** - 基于业务规则的事件路由
- **批处理** - 分组事件传递
- **错误处理** - 自定义错误响应处理
- **分析集成** - 事件性能监控

## 使用案例

### 电子商务集成
**场景**：具有库存同步的在线商店
- 向库存系统发送新订单 webhook
- 向电子商务平台更新库存水平
- 向 CRM 发送客户注册通知
- 向会计系统发送付款确认
- 向客户服务发送发货更新

**好处**：实时电子商务生态系统同步

### CRM 系统集成
**场景**：使用外部 CRM 系统的销售团队
- 新客户创建通知
- 销售订单更新和状态变更
- 付款收据确认
- 服务请求警报
- 潜在客户资格事件广播

**好处**：统一客户关系管理

### 财务系统集成
**场景**：多系统财务运营
- 向会计系统发送发票创建通知
- 向银行平台更新付款处理
- 向财务团队发送费用审批警报
- 预算差异通知
- 审计跟踪事件记录

**好处**：集成财务生态系统管理

### 制造集成
**场景**：与 MES 集成的生产设施
- 工作订单创建通知
- 质量控制结果广播
- 库存消耗更新
- 生产完成警报
- 设备维护通知

**好处**：连接的制造运营

## 相关小程序

### 核心模块小程序
- **[工作流设计小程序](/zh/applets/workflow-design-applet/)** - 工作流触发的 webhooks
- **[租户管理员小程序](/zh/applets/tenant-admin-applet/)** - 安全和访问管理
- **[过程监控小程序](/zh/applets/process-monitoring-applet/)** - 集成监控

### 集成小程序
- **[API 管理小程序](/zh/applets/api-management-applet/)** - API 端点管理
- **[数据同步小程序](/zh/applets/data-sync-applet/)** - 数据同步
- **[外部系统小程序](/zh/applets/external-system-applet/)** - 第三方系统管理

### 通信小程序
- **[通知小程序](/zh/applets/notification-applet/)** - 内部通知
- **[电子邮件集成小程序](/zh/applets/email-integration-applet/)** - 电子邮件系统集成
- **[短信网关小程序](/zh/applets/sms-gateway-applet/)** - 短信通知

## 设置指南

### 快速开始
1. **访问 Webhook 配置** - 导航到小程序
2. **添加 Webhook 端点** - 配置外部系统 URL
3. **选择事件类型** - 选择相关业务事件
4. **配置认证** - 设置安全凭据
5. **测试 Webhook 传递** - 使用测试事件验证功能

### 高级设置
1. **自定义有效负载配置** - 设计自定义事件有效负载
2. **高级筛选设置** - 配置复杂筛选规则
3. **多目标路由** - 设置事件广播
4. **错误处理配置** - 配置重试和错误策略
5. **性能监控设置** - 配置分析和监控

## Webhook 配置示例

### 电子商务订单 Webhook
```yaml
Webhook 名称：电子商务订单集成
端点 URL：https://api.ecommerce.com/webhooks/bigledger
方法：POST
认证：
  类型：API 密钥
  标头：X-API-Key
  值：[ENCRYPTED_API_KEY]

事件触发器：
  - sales_order.created
  - sales_order.updated
  - sales_order.cancelled
  - payment.received

有效负载格式：
  order_id：{{ order.id }}
  customer_id：{{ order.customer_id }}
  total_amount：{{ order.total }}
  status：{{ order.status }}
  items：{{ order.items }}
  timestamp：{{ event.timestamp }}

筛选器：
  - order.total > 100
  - order.status != "draft"

重试策略：
  最大尝试次数：3
  退避：指数
  超时：30 秒
```

### CRM 客户同步 Webhook
```yaml
Webhook 名称：CRM 客户同步
端点 URL：https://api.crm.com/webhooks/customers
方法：POST
认证：
  类型：OAuth 2.0
  令牌：[OAUTH_TOKEN]

事件触发器：
  - customer.created
  - customer.updated
  - customer.deleted

有效负载格式：
  customer_id：{{ customer.id }}
  name：{{ customer.name }}
  email：{{ customer.email }}
  phone：{{ customer.phone }}
  address：{{ customer.address }}
  created_date：{{ customer.created_date }}

安全设置：
  SSL 验证：必需
  IP 白名单：[CRM_SERVER_IPS]
  速率限制：100 请求/分钟
```

## 最佳实践

### Webhook 设计最佳实践
- **幂等操作** - 为重复的 webhook 传递进行设计
- **最小有效负载** - 仅包含必要数据
- **清晰的事件名称** - 使用描述性事件命名约定
- **版本控制策略** - 为 webhook 有效负载演进进行规划
- **文档** - 全面的 webhook 文档

### 安全最佳实践
- **必需认证** - 从不使用不安全的 webhooks
- **SSL/TLS 加密** - 始终使用 HTTPS 端点
- **请求验证** - 验证 webhook 源真实性
- **IP 白名单** - 限制对已知来源的访问
- **速率限制** - 防止 webhook 滥用和泛滥

### 性能最佳实践
- **异步处理** - 异步处理 webhooks
- **批处理** - 在可能时对相关事件进行分组
- **重试逻辑** - 实施智能重试机制
- **监控** - 持续的 webhook 性能监控
- **错误处理** - 优雅的错误处理和记录

## 故障排除

### 常见问题
**Webhook 传递失败**
- 检查端点 URL 可访问性
- 验证认证凭据
- 审查 SSL 证书有效性
- 检查有效负载格式要求

**缺少 webhook 事件**
- 验证事件类型配置
- 检查筛选规则和条件
- 审查 webhook 激活状态
- 确认模块集成设置

**性能问题**
- 监控 webhook 传递时间
- 检查外部系统响应时间
- 审查重试策略配置
- 分析事件队列积压

### 支持资源
- Webhook 配置和设置指南
- 集成最佳实践文档
- 安全实施指南
- 性能优化建议

{{< callout type="warning" >}}
**安全通知**：Webhooks 向外部系统传输敏感业务数据。始终实施适当的认证、加密和访问控制来保护您的数据。
{{< /callout >}}