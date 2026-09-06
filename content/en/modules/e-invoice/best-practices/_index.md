---
aliases:
- /modules-v2/e-invoice/best-practices/
title: "Best Practices"
description: "Operational recommendations for clearance rejection handling, master-data hygiene, and monthly reconciliation."
weight: 60
bookCollapseSection: false
---

Follow these operational best practices to ensure continuous tax compliance, eliminate clearance rejection delays, and maintain audit readiness.

## 1. Automated Rejection Alert Monitoring
- **Daily Rejection Queue Audits:** Read *Internal Submission → To IRB E-Invoice* daily in the [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) and clear anything marked Invalid. Do not work from Submission History — it is a snapshot taken at submission time and will keep saying "Submitted" for a document LHDN has since rejected.
- **Master Data Pre-Validation:** Enable automated TIN and BRN format checks during customer profile creation to prevent downstream billing rejections.

## 2. Authorisation & Pool Hygiene
- **Diarise the intermediary renewal.** Your MyInvois authorisation of BigLedger expires. When it lapses every submission for that company stops at once with an authentication error and no document has anything wrong with it. Set a reminder a month ahead. (There is no signing certificate to renew — BigLedger holds the credentials.)
- **Review the Individual and Single General pools weekly.** Neither empties itself and neither raises an ageing alert; a document can sit in one for months as an unreported sale.
- **Reconcile before the 7th, not after it.** Run *Monthly Report → Discrepancies Report* for the closing month and clear it while cancellation is still possible.
