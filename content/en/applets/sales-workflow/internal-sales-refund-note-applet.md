---
title: "Sales Refund Note (Internal) Applet (V3)"
description: "Comprehensive workflow for managing customer refunds, returns, E-Invoice integrations, and payment adjustments."
tags:
- sales
- refund
- finance
- accounts-receivable
- e-invoice
weight: 120
---

{{< callout type="warning" >}}
**Work in Progress:** This document is actively being updated. Sections may be incomplete or subject to change as new versions of the applet are documented.
{{< /callout >}}

## Purpose and Overview

The **Sales Refund Note (Internal) Applet (V3)** is a critical financial control mechanism within the Sales Workflow. It is used to properly document, authorize, and process financial refunds given back to customers. This V3 iteraton includes native support for LHDN E-Invoicing requirements and Strict Amount Balancing validations.

{{< callout type="info" >}}
**Core Concept:** A Sales Refund Note is the financial counterpart to a Sales Return. While a Sales Return handles the physical reversal of goods, the Refund Note manages the reversal of cash, credit, and Accounts Receivable (AR).
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Finance & Accounts Receivable (AR) Teams:**
- Accurate reconciliation of customer account balances.
- Automated creation of General Ledger (GL) posting entries.
- Validation tools ensuring Refund amounts never exceed original payment amounts.

**Customer Service & Sales Teams:**
- Quick lookup of historical invoices to process refunds against.
- Status tracking of a customer's refund request.

**Tax Compliance Officers:**
- Native **E-Invoice** tab to submit, track, and manage LHDN compliant refund credit notes automatically.

### What Problems Does This Solve?

**The Unbalanced Refund Problem:**
Without strict controls, it's possible to refund a customer more than they paid, or refund an amount that doesn't match the inventory returned.

**The Sales Refund Note Solution:**
- **PNS/STL Balancing:** Built-in safeguards ensure that the total value of items being refunded (PNS) exactly matches the settlement cash/credit being returned to the customer (STL). If they are off by even a cent, the system locks finalization.
- **Intercompany Support:** Easily process refunds across different corporate entities via the dedicated Intercompany route.
- **Bulk Processing:** Built-in File Import/Export capabilities for processing hundreds of refunds at once during mass recalls.

## Key Features Overview

{{< cards >}}
  {{< card title="E-Invoice Integration" subtitle="LHDN compliant credit note tracking" link="#e-invoice" >}}
  {{< card title="Amount Balancing" subtitle="Strict PNS vs STL validation" link="#amount-balancing" >}}
  {{< card title="Intercompany Processing" subtitle="Handle cross-entity refunds" link="#intercompany" >}}
  {{< card title="Bulk Import/Export" subtitle="Process mass refunds via CSV" link="#file-export--import" >}}
  {{< card title="ARAP Adjustments" subtitle="Modify customer credit ledgers directly" link="#arap" >}}
  {{< card title="Payment Returns" subtitle="Log direct cash/credit transfers" link="#payment" >}}
  {{< card title="Contra Tracking" subtitle="Link to original Sales Invoices" link="#contra" >}}
{{< /cards >}}

## Key Concepts

### The Amount Balancing Rule (PNS vs STL)

To prevent revenue leakage, this applet enforces a strict balancing rule before a document can be finalized (Posted).
- **PNS (Product/Non-Stock):** The total value of the lines added to the "Lines" tab (e.g., Laptop RM2000 + Warranty RM100 = RM2100).
- **STL (Settlement):** The total value of the cash being given back to the user via the "Payment" tab, or being pushed to their account balance via the "ARAP" tab.

**Rule:** `Sum(PNS) MUST EQUAL Sum(STL)`

If a user tries to finalize a document where PNS is RM 2100 but the Payment is RM 2000, the system will throw a hard validation error.

---

## Quick Start Guide

### Processing a Standard Item Refund

1. Navigate to **Sales Refund Note (Internal)** from the sidebar and click **"+" (Create)**.
2. **Search Tab**: Enter the original Sales Invoice or DO number. Select the document to auto-populate the refund details.
3. **Lines Tab**: Review the items being refunded. Remove any lines that the customer is *not* returning.
4. **Payment Tab**: Add a Settlement line indicating how you are paying the customer back (e.g., Bank Transfer, Credit Card Reversal). 
5. Ensure the amount in the Payment tab matches the total value shown in the Lines tab.
6. Click **Save** to generate the Draft document.
7. Click **Final** to post the transaction to the General Ledger.

---

## Feature Sections & Tabs

### Sidebar Routes
- **Sales Refund Note (Internal):** The main document management view.
- **Line Items:** A flattened reporting view showing every refunded item across all notes.
- **Intercompany:** Dedicated workflow for managing refunds where the selling branch and refunding branch belong to different GL entities.
- **File Export & Import:** Batch operations.

### Refund Note Edit Panels (The 15-Panel View)

Because a refund touches many aspects of finance, the interface is split into 15 specific panels:

1. **Search**: Find historical sales documents to refund against.
2. **Main Details**: Document metadata, dates, and branch routing.
3. **E-Invoice**: A specialized tax compliance panel. Shows LHDN status (Pending IRB, Submitted, Validated, Rejected) and handles buyer notifications.
4. **Account**: Customer entity details.
5. **Lines**: The items or services being refunded.
6. **Payment**: Direct outgoing cash/bank transfers.
7. **ARAP**: Accounts Receivable adjustments (e.g., keeping the refund as store credit on the customer's ledger).
8. **Delivery Details**: Return shipping routing.
9. **Payment Adjustment**: Handle edge-case discrepancies or bank fees.
10. **Department Hdr**: Assign the financial hit of the refund to a specific internal department/cost center.
11. **Trace Document**: Historical audit trail of how this refund was generated.
12. **Contra**: Direct links offsetting the original Sales Invoice.
13. **Doc Link**: User-generated links to external references.
14. **Attachments**: Upload Proof of Payment (bank receipts) or customer correspondence.
15. **Export**: Generate the final Credit Note PDF for the customer.

---

## Configuration & Settings

Click **Settings** at the bottom of the sidebar to configure the applet rules.

### 1. Default Selection & Branch Settings
Configure fallback locations to ensure refunds are routed to the centralized finance branch automatically.

### 2. Return Reasons Settings
A critical setup step. Define standard dropdown reasons for refunds (e.g., "Defective Product", "Service Cancelled", "Duplicate Charge"). This data routes into your financial dashboard.

### 3. Workflow Settings
Determine if Refunds require multi-level managerial approval before the "Final" button becomes active.

### 4. Permissions (Client-Side)
- `SHOW_GENDOC_FINAL_BUTTON`: Should only be granted to Senior Finance staff.
- `SHOW_EDIT_SETTLEMENT_FINAL`: A highly restricted permission allowing adjustments *after* finalization.

### 5. Applet Log & Release Notes
View backend audit trails and stay updated on new applet versions pushed by the infrastructure team.
