---
aliases:
- /modules-v2/inventory/reports/
title: "Reports & Analytics"
description: "Comprehensive reporting matrix and scenario guide for inventory valuation, stock turnover, and physical audit reconciliation."
weight: 45
bookCollapseSection: false
---

The Inventory Module provides deep analytical tools for warehouse managers, inventory controllers, and cost accountants to audit stock balances, track batch expiration dates, monitor inventory turnover, and reconcile physical valuation asset ledgers.

## Reporting Scenario Decision Matrix ("Which Report to Use When")

Select the appropriate report based on your specific operational or business decision scenario:

| Business Scenario / Question | Recommended Report | Primary Applet | Key Metrics & Decision Value |
|------------------------------|--------------------|----------------|------------------------------|
| **"What is our total inventory asset dollar valuation for month-end financial balance sheets?"** | Perpetual Inventory Valuation Report | [Stock Report Applet](/applets/inventory-workflow/stock-report-applet/) | Quantity on hand, unit cost valuation (FIFO/Moving Avg), total asset GL dollar balance. |
| **"Which inventory items move fast vs. slow (ABC classification & turnover velocity)?"** | Stock Turnover & Velocity Analysis | [Stock Report Applet](/applets/inventory-workflow/stock-report-applet/) | Annual turnover ratio, days-sales-of-inventory (DSI), fast-moving vs. dead stock identification. |
| **"Which batch lot numbers are approaching expiration in our food/pharma warehouses?"** | Batch & Expiry Date Aging Report | [Stock Balance Applet](/applets/inventory-workflow/stock-balance-applet/) | Batch/serial numbers, manufacturing date, expiration date, days remaining until expiry. |
| **"What was the financial impact and variance of our quarterly physical stock count?"** | Physical Stock Take Variance Audit | [Stock Take Applet](/applets/inventory-workflow/stock-take-applet/) | System balance vs. physical audit count, variance quantity, shrinkage expense GL allocation. |
| **"Where are specific high-value items stored across multi-warehouse bin locations?"** | Warehouse Bin Location & Availability Summary | [Stock Availability Applet](/applets/inventory-workflow/stock-availability-applet/) | Physical warehouse, aisle, shelf, bin coordinates, reserved vs. unreserved stock. |

---

## Key Report Categories

### 1. Stock Valuation & Accounting Reports
Designed for cost accountants and audit compliance:
- **Stock Movement Ledger:** Complete historical audit trail logging every inbound GRN, stock transfer, sales dispatch, and adjustment with timestamps.
- **GL Reconciled Valuation:** Matches physical warehouse stock valuation totals against General Ledger Asset Accounts.

### 2. Operational & Warehouse Controls
Designed for warehouse supervisors and inventory controllers:
- **Reorder Point Alert Summary:** Highlights SKUs falling below minimum safety stock levels requiring purchase replenishment.
- **Stock Adjustment Summary:** Tracks inventory damage, scrap, and manual write-offs categorized by reason codes.
