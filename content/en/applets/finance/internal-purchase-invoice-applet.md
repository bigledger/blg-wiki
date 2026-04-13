---
title: "Purchase Invoice (Internal)"
description: "Comprehensive guide to managing internal purchase invoices, including three-way matching, intercompany transactions, settlement management, and E-Invoice integration."
tags:
- finance
- purchase-invoice
- intercompany
- settlement
- accounts-payable
- e-invoice
weight: 120
---

## Purpose and Overview

The **Purchase Invoice (Internal)** is the financial cornerstone of the procurement lifecycle within BigLedger. It facilitates the conversion of procurement activities into formal accounting records, specifically optimized for organizations managing multiple branches or complex intercompany relationships.

By linking physical receipts (Goods Received Notes) and procurement commitments (Purchase Orders) to financial obligations, it ensures accurate **Accounts Payable (AP)** management and financial integrity.

{{< callout type="info" >}}
**Core Concept**: This applet acts as the bridge between operations and finance, transforming operational data into verified financial liabilities.
{{< /callout >}}

## Key Features & Benefits

### 1. Robust Three-Way Matching (Knock-Off)
Reduce overbilling and errors by verifying invoices against existing documents:
- **KO For Purchase GRN**: Direct reconciliation against received goods.
- **KO For Purchase Order**: Validation against original procurement commitments.
- **Prevents Duplicate Billing**: The "Knock-Off" (KO) mechanism ensures a single delivery or order cannot be invoiced multiple times.

### 2. Comprehensive Intercompany Management
Specifically designed for internal ecosystem transactions:
- **Inbound & Outbound Queues**: Dedicated views for unprocessed and processed intercompany transactions.
- **Automated Synchronization**: Ensure that a "Sales Invoice" in one branch correctly appears as a "Purchase Invoice" in the receiving branch.

### 3. Integrated Settlement & Payment
Manage the full lifecycle of the invoice within a single interface:
- **Add Settlement**: Record partial or full payments directly against the invoice.
- **Settlement Methods**: Support for multiple payment groups and methods (Cash, Bank, E-Wallet, etc.).
- **Real-time Balance Tracking**: Instantly see total settlements vs. invoice totals.

### 4. Advanced Operational Tools
- **E-Invoice Integration**: Native support for digital invoicing requirements.
- **Self-Billed Invoices**: Support for self-billing scenarios where the purchaser generates the invoice on behalf of the supplier.
- **Bulk Operations**: High-volume **File Import** and **File Export/Bulk Print** capabilities.

---

## Feature Navigation

{{< cards >}}
  {{< card title="Purchase Invoice" subtitle="Listing, create & edit with bill-to and line items" link="#for-ap-clerks-creating-a-new-invoice" >}}
  {{< card title="Intercompany" subtitle="Managing Inbound/Outbound unprocessed transactions" link="#managing-intercompany-transactions" >}}
  {{< card title="Settlement" subtitle="Adding payments and managing settlement methods" link="#recording-settlements-and-payments" >}}
  {{< card title="E-Invoice" subtitle="Digital invoicing and compliance status" link="#e-invoice-integration" >}}
{{< /cards >}}

---

## Quick Start Guide

### For AP Clerks: Creating a New Invoice

**Goal:** Transform a Goods Received Note (GRN) into a financial invoice.

1. **Initialize**: Click **"+" (Create)** from the main listing view.
2. **Account Details**: 
   - Under the **Account** tab, select the **Entity** (Supplier).
   - Verify the **Bill To** and **Ship To** addresses are correct.
3. **Add Items via KO**:
   - Go to the **Lines** tab.
   - Click **"+"** and select **KO For Purchase GRN**.
   - Select the relevant receipt(s) from the listing to auto-populate items and prices.
4. **Validation**: Use the **Final** button to lock the document and prepare it for accounting posting.

### Managing Intercompany Transactions

**Goal:** Process an inbound stock transfer from another branch.

1. Navigate to the **Intercompany** tab.
2. Select **Inbound > UNPROCESSED**.
3. Locate the transaction sent by the sister branch.
4. Review and process it into a local Purchase Invoice to reflect the internal liability.

### Recording Settlements and Payments

**Goal:** Record a partial payment made to a supplier.

1. Open the target Purchase Invoice in **Edit** mode.
2. Navigate to the **Settlement** tab.
3. Click **Add Settlement**.
4. Select the **Settlement Type** (e.g., Bank) and **Method** (e.g., Maybank Account).
5. Enter the amount and **Save**.

---

## Configuration & Settings

Fine-tune the applet behavior to match your organizational policies:

| Category | Description |
| :--- | :--- |
| **Default Selection** | Set default branches and tax codes for faster entry. |
| **Field Configuration** | Define mandatory fields and visibility for specific roles. |
| **Knock-Off Settings** | Configure how documents are linked and what triggers a "closed" state. |
| **Printable Format** | Customize the PDF layout including logos and terms & conditions. |

---

## Frequently Asked Questions

**Q: Can I create an invoice without a preceding GRN or PO?**
A: Yes. In the **Lines** tab, click **"+"** and select **Search Item** to manually add lines. This is common for service-based or non-stock expenses.

**Q: What is the difference between SAVE and FINAL?**
A: **SAVE** keeps the document in a draft state (editable). **FINAL** locks the document for financial reporting and prevents further edits unless voided or reversed.

**Q: How do I handle Multi-Currency invoices?**
A: If enabled, a **Forex** button will appear in the header of the edit screen, allowing you to set exchange rates for the document.

**Q: Can I clone a recurring invoice?**
A: Yes. Use the **CLONE** option in the dropdown menu from the Edit screen to create a new copy of an existing invoice.

---

## Audit and Compliance

- **Audit Trail**: Every modification to an invoice (price changes, quantity adjustments) is logged with a timestamp and user ID in **Settings > Audit Trail**.
- **E-Invoice Status**: Monitor the status of digital submissions via the dedicated **E-Invoice** tab within each record.

---

{{< callout type="tip" >}}
**Reporting Tip**: Use the **File Export** feature to generate batch reports for external auditors or for deep-dive reconciliation in Excel.
{{< /callout >}}

