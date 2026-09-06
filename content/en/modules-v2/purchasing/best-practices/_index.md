---
title: "Best Practices"
description: "Operational recommendations for checking supplier invoices, supplier evaluation, and monthly purchase reconciliation."
weight: 60
bookCollapseSection: false
---

Follow these operational best practices to maintain purchasing budget controls, prevent vendor overbilling, and ensure smooth financial audits.

## 1. Checking a supplier invoice before you finalise it
- **Always knock off, never key from scratch:** Nothing in BigLedger requires it, so make it a house rule — open the invoice's *KO For* tab and pull in the finalised Purchase Order or GRN rather than typing the lines. The copied lines are what you compare against the supplier's paper.
- **Establish Variance Tolerance Limits:** Agree the percentage variance (e.g. maximum 1% on price) your team will accept without escalating. Purchase invoices have no approval engine, so make the escalation a policy and restrict who may finalise an invoice that breaches it.

## 2. Month-End Reconciliation of Un-invoiced Receipts
- **Audit un-invoiced GRNs monthly:** Review GRNs with no invoice against them at month-end to find deliveries the supplier has not billed. Note that on the standard pair the GRN books no stock — the goods are in your warehouse and absent from the stock ledger until the invoice is finalised, so this list is also your stock-timing exposure.
- **Resolve Aged GRNI Accruals:** Investigate GRNI balances older than 60 days to clear obsolete receiving records or request missing supplier billing.

## 3. Vendor Performance Monitoring
- **Track On-Time In-Full (OTIF) Metrics:** Monitor supplier delivery reliability by comparing PO promised delivery dates against actual GRN receipt timestamps in the [Purchase Report Applet](/applets/purchase-workflow/purchase-report-applet/).
- **Quality Rejection Logging:** Record all damaged or non-conforming goods returns in the [Purchase Return Applet](/applets/purchase-workflow/internal-purchase-return-applet/) to maintain supplier quality scorecards.
