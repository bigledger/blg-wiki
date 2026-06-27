---
title: "Use Cases"
description: "Real-world business reference architectures for retail chains, B2B wholesale distributors, and consignment sales."
weight: 40
bookCollapseSection: false
---

The Sales & POS Module flexibly supports diverse commercial business models. Below are reference operational architectures for common industries.

## 1. Multi-Outlet Retail Chain (Fast Checkout & Central Loyalty)

**Business Scenario:** A retail chain operates 15 physical store outlets requiring fast cashier checkouts, real-time inventory lookups across branches, and centralized membership rewards.

- **Primary Applets:** [POS General Applet](/applets/sales-workflow/pos-general-applet/), [Daily Cashier Report Applet](/applets/sales-workflow/daily-cashier-report-applet/), [Membership Admin Applet](/applets/membership/membership-admin-applet/)
- **Operational Flow:** Cashier scans barcodes at register → member identified via phone lookup → tier discount applies automatically → customer pays via e-wallet → system updates stock allocation and credits loyalty points instantly.

---

## 2. B2B Wholesale Distribution (Order-to-Cash with Credit Terms)

**Business Scenario:** A corporate distributor sells industrial equipment to wholesale clients on Net 30 payment terms, requiring formal quotes, hard stock reservations, and dispatch tracking.

- **Primary Applets:** [Sales Quotation](/applets/sales-workflow/internal-sales-quotation-applet/), [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/)
- **Operational Flow:** Sales representative creates Quotation → client approves → converted to Sales Order with hard inventory reservation → warehouse dispatches Goods Issuance Note → AR clerk issues Sales Invoice for Net 30 billing.

---

## 3. Customer Consignment Sales (Vendor-Managed Inventory)

**Business Scenario:** A supplier places merchandise at retail partner stores on consignment. Inventory remains owned by the supplier until consumed or sold by the partner.

- **Primary Applets:** [Customer Consignment Applet](/applets/sales-workflow/customer-consignment-applet/), [Sales Invoice Applet](/applets/sales-workflow/internal-sales-invoice-applet/)
- **Operational Flow:** Stock dispatched to customer consignment location → monthly consumption report received from partner → consignment billing process generates invoice for consumed stock only → remaining inventory reconciled.
