---
title: "Reports & Analytics"
description: "Comprehensive reporting matrix and scenario guide for procurement spend tracking, vendor performance, and GRNI accrual auditing."
weight: 45
bookCollapseSection: false
---

The Purchasing Module provides analytical tools for procurement officers, buyers, and finance managers to monitor vendor spend concentration, evaluate supplier delivery reliability, and audit month-end un-invoiced goods accruals.

## Reporting Scenario Decision Matrix ("Which Report to Use When")

Select the appropriate report based on your specific operational or business decision scenario:

| Business Scenario / Question | Recommended Report | Primary Applet | Key Metrics & Decision Value |
|------------------------------|--------------------|----------------|------------------------------|
| **"Which suppliers account for the highest percentage of our procurement spend?"** | Vendor Spend Concentration Analysis | [Purchase Report Applet](/applets/purchase-workflow/purchase-report-applet/) | Purchase volume by supplier, total PO commitments, vendor spend ranking. |
| **"How reliable is a supplier at delivering orders on time and in full (OTIF)?"** | Supplier Delivery Performance Log | [Purchase Report Applet](/applets/purchase-workflow/purchase-report-applet/) | Promised PO delivery date vs. actual GRN receiving timestamp, quantity fulfillment rate %. |
| **"What received shipments have not yet been billed by suppliers (GRNI accrual)?"** | Goods Received Not Invoiced Report | [Purchase Report Applet](/applets/purchase-workflow/purchase-report-applet/) | Outstanding GRN receipts without linked purchase invoices, month-end liability accrual total. |
| **"Did vendor invoice pricing match our contracted purchase order rates?"** | Purchase Price Variance (PPV) Report | [Purchase Report Applet](/applets/purchase-workflow/purchase-report-applet/) | Unit price variance between PO contract rate and supplier invoice billing, cost exception alerts. |
| **"What internal departmental purchase requisitions are currently pending approval?"** | Requisition Status & Pipeline Audit | [Purchase Requisition Applet](/applets/purchase-workflow/internal-purchase-requisition-applet/) | Open requisitions, approval bottleneck tracking, departmental budget consumption. |

---

## Key Report Categories

### 1. Vendor & Sourcing Analytics
Designed for procurement managers to evaluate supplier reliability and negotiate contracts:
- **Supplier Spend Summary:** Categorizes procurement expenditures by vendor group, product category, and purchasing branch.
- **Contract Compliance Audit:** Verifies actual purchase order pricing against active pricebook agreements and blanket PO contracts.

### 2. Financial & Payable Audits
Designed for Accounts Payable and finance teams to ensure balance sheet accuracy:
- **Aged Purchase Orders:** Highlights unfulfilled or partial PO commitments older than 30 days.
- **Goods Received Not Invoiced (GRNI) Ledger:** Reconciles physical inventory asset receipts with pending AP invoice liabilities.
