---
title: "Reports & Analytics"
description: "Practical scenario guide and reporting matrix for production yield, work center efficiency, and WIP cost variance analysis."
weight: 45
bookCollapseSection: false
---

The Manufacturing Module provides production analytics for plant managers, process engineers, and cost accountants to track manufacturing yield, evaluate work center efficiency, and audit Work-in-Progress (WIP) absorption.

## Reporting Scenario Decision Matrix ("Which Report to Use When")

Select the appropriate report based on your specific operational or business decision scenario:

| Business Scenario / Question | Recommended Report | Primary Applet | Key Metrics & Decision Value | Actionable Business Outcome |
|------------------------------|--------------------|----------------|------------------------------|-----------------------------|
| **"What is our active Work-in-Progress (WIP) asset dollar balance across factory work centers?"** | Work-in-Progress (WIP) Asset Valuation | [Production Planning and Monitoring Applet](/applets/manufacturing/production-planning-and-monitoring-applet/) | Issued raw material cost, labor absorbed, uncompleted work order WIP total. | Reconciles month-end manufacturing asset ledgers with General Ledger balance sheets. |
| **"Which work centers suffer from high machine downtime or bottleneck operational delays?"** | Work Center Capacity & Downtime Log | [Process Maintenance Applet](/applets/manufacturing/process-maintenance-applet/) | Scheduled machine hours vs. actual run hours, downtime frequency, operational efficiency %. | Identifies factory bottlenecks and optimizes machine maintenance schedules. |
| **"What is our manufacturing material yield and component scrap loss percentage?"** | Production Material Yield & Scrap Analysis | [Manufacturing Operation Applet](/applets/manufacturing/manufacturing-operation-applet/) | Standard BOM component requirement vs. actual material issued, scrap variance %. | Highlights raw material quality issues and adjusts standard BOM engineering recipes. |
| **"Did finished batch production costs exceed our standard estimated cost baseline?"** | Manufacturing Cost Variance Report | [Production Planning and Monitoring Applet](/applets/manufacturing/production-planning-and-monitoring-applet/) | Standard unit cost vs. actual unit cost (material + labor + overhead absorption), variance dollar amount. | Identifies cost overruns in production and adjusts commercial product selling prices. |

---

## Detailed Operational Reporting Guides

### 1. Production Yield & Scrap Audit
- **Purpose:** Compares theoretical standard raw material consumption against actual shop floor material issuance.
- **Key Parameters:** Filter by Production Work Order ID, Work Center Code, and Finished Product SKU.
- **Operational Utility:** Prevents raw material theft and identifies inefficient machine calibration settings.

### 2. WIP Balance Reconciliation
- **Purpose:** Audits open production orders to ensure WIP asset balances clear accurately upon finished goods receiving.
- **Key Parameters:** Filter by Factory Branch, Work Order Status (In-Progress vs Completed), and Date Range.
- **Operational Utility:** Clears stale work orders and ensures accurate cost of goods manufactured (COGM) accounting.
