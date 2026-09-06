---
translationKey: vstecs-ms-esd-order-applet
title: "VSTECS MS ESD 订单小程序"
description: "Microsoft ESD 订单管理，具有价格检查和订单处理的 API 集成"
weight: 180
tags:
- applets
- microsoft
- esd-orders
- api-integration
---

附加 MS ESD 订单用户指南和实施工作分解。
此小程序需要从 BLG 到 EMP 和 BLG 到分销商系统的集成才能正常运行。
检查 MS ESD 产品 SKU 更新价格的 API。
向分销商创建订单以检索 MS ESD 产品的 API。

**注意
此集成目前有 2 个工作流：
快捷方法：EMP 集成到 BLG（不使用 T2T 管理小程序）
标准方法：T2T 管理小程序启用来宾和主机租户连接，文档项目维护小程序执行项目代码映射。