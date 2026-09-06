---
title: "Best Practices"
description: "Operational recommendations for 3-way invoice matching, supplier evaluation, and GRNI monthly reconciliation."
weight: 60
bookCollapseSection: false
---

Follow these operational best practices to maintain purchasing budget controls, prevent vendor overbilling, and ensure smooth financial audits.

## 1. Strict 3-Way Matching Controls
- **Enforce Mandatory PO Matching:** Never process a supplier invoice in Accounts Payable without linking it to an approved Purchase Order and verified Goods Received Note (GRN).
- **Establish Variance Tolerance Limits:** Agree the percentage variance (e.g. maximum 1% on price) your team will accept without escalating. Purchase invoices have no approval engine, so make the escalation a policy and restrict who may finalise an invoice that breaches it.

## 2. Month-End GRNI Reconciliation
- **Audit Un-invoiced GRNs Monthly:** Review outstanding Goods Received Not Invoiced (GRNI) records at month-end to identify shipped orders where supplier invoices are delayed.
- **Resolve Aged GRNI Accruals:** Investigate GRNI balances older than 60 days to clear obsolete receiving records or request missing supplier billing.

## 3. Vendor Performance Monitoring
- **Track On-Time In-Full (OTIF) Metrics:** Monitor supplier delivery reliability by comparing PO promised delivery dates against actual GRN receipt timestamps in the [Purchase Report Applet](/applets/purchase-workflow/purchase-report-applet/).
- **Quality Rejection Logging:** Record all damaged or non-conforming goods returns in the [Purchase Return Applet](/applets/purchase-workflow/internal-purchase-return-applet/) to maintain supplier quality scorecards.
