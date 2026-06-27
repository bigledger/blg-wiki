---
title: "Best Practices"
description: "Operational recommendations for cashier drawer controls, credit limit management, and revenue reconciliation."
weight: 60
bookCollapseSection: false
---

Follow these operational best practices to maintain inventory accuracy, prevent cashier fraud, and ensure smooth financial reconciliation.

## 1. Cashier Shift & Drawer Controls
- **Mandatory Opening Float Audits:** Require cashiers to count and confirm opening cash floats in the [POS General Applet](/applets/sales-workflow/pos-general-applet/) before processing the first sale.
- **Blind End-of-Day Counts:** Implement blind cash counting for Z-reports in the [Daily Cashier Report Applet](/applets/sales-workflow/daily-cashier-report-applet/) where cashiers enter actual drawer counts without seeing expected system totals first.

## 2. Commercial Credit Control
- **Strict Credit Limit Enforcement:** Configure hard blocks on Sales Order creation whenever a customer's total outstanding invoices exceed approved credit limits or payment terms.
- **Formal Approval Workflows:** Require managerial sign-off for quotations exceeding standard discount thresholds.

## 3. Inventory Reconciliation
- **Barcode Scanning at Checkout:** Enforce mandatory 2D/barcode scanning at POS registers rather than manual SKU entry to prevent mispicks and stock discrepancies.
- **Daily Negative Stock Audits:** Run daily reports to audit and resolve any negative inventory balances caused by improper override sales.
