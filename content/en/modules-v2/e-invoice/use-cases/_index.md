---
title: "Use Cases"
description: "Real-world business reference architectures for commercial B2B billing, consolidated retail POS, and foreign self-billed compliance."
weight: 40
bookCollapseSection: false
---

The E-Invoice & PEPPOL Module flexibly supports diverse compliance workflows across commercial enterprise billing, high-volume retail chains, and international trade.

## 1. Commercial B2B Enterprise Billing (Real-Time API Clearance)

**Business Scenario:** A B2B distributor issues high-value commercial invoices to corporate clients, requiring real-time validation and clearance UUID stamping prior to dispatch.

- **Primary Applets:** [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/), [MY E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/), [Sales Invoice Applet](/applets/sales-workflow/internal-sales-invoice-applet/)
- **Operational Flow:** Commercial Sales Invoice approved → BigLedger signs payload and calls tax API → clearance UUID & QR code stamped onto PDF → invoice emailed to buyer.

---

## 2. Retail Chain High-Volume Sales (Monthly B2C Consolidation)

**Business Scenario:** A retail store network processes 50,000 counter checkout receipts daily to end-consumers who do not request individual tax invoices.

- **Primary Applets:** [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/), [POS General Applet](/applets/sales-workflow/pos-general-applet/)
- **Operational Flow:** Retail sales executed at POS counters → system aggregates B2C receipts into monthly summary batches → consolidated e-invoice submitted to the tax authority by the 7th of the following month (LHDN deadline).

---

## 3. Foreign Service Import & Commission Self-Billing

**Business Scenario:** A business imports digital software subscriptions from foreign vendors or pays local freelance agents who are not registered for tax e-invoicing.

- **Primary Applets:** [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/), [MY E-Invoice for Customer & Supplier Applet](/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet/)
- **Operational Flow:** Foreign supplier invoice received in Accounts Payable → buyer issues self-billed e-invoice payload → submitted to tax API for validation → input tax deduction claimed legally.
