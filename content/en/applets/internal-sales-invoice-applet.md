---
title: "Internal Sales Invoice Applet"
description: "Comprehensive sales transaction management system for invoicing, inventory logic, and financial posting"
tags:
- sales-management
- invoice-processing
- financial-posting
- stock-control
- order-to-cash
weight: 101
date: 2026-01-26
draft: false
---

## Purpose and Overview

The **Internal Sales Invoice Applet** is a powerful tool designed to manage the entire order-to-cash process. It moves beyond simple billing by integrating sales transactions with real-time inventory deduction, financial posting, and logistics coordination.

{{< callout type="info" >}}
**Core Concept**: The system bridges **Sales Operations** (Orders) with **Financial Control** (Ledgers) and **Logistics** (Stock Deductions) in a single workflow.
{{< /callout >}}

{{< figure src="/images/internal-sales-invoice-applet/internal-sales-invoice-overview-infographic.png" alt="Internal Sales Invoice Overview Infographic" caption="Visual guide to the challenges, solutions, and benefits of the applet." >}}

{{< figure src="/images/internal-sales-invoice-applet/main-listing-page.png" alt="Internal Sales Invoice Main Listing" caption="The central hub for managing all sales transactions and their statuses." >}}

## Key Features Overview

### Who Benefits from This Applet?

**Sales Representatives:**
- Quick conversion of orders to invoices via Knock-Off (KO)
- Real-time visibility of stock availability
- History tracking of customer transactions
- Personalized default settings for faster entry

**Finance & Accounts Teams:**
- Automated General Ledger (GL) postings
- Accurate tax calculations and breakdowns
- Contra settlement management (Credit/Debit notes)
- Complete audit trails for every transaction

**Logistics & Warehouse Teams:**
- Integrated pack queue management
- Auto-generation of Delivery Orders (DO)
- Direct link between invoicing and stock reporting

**Business Managers:**
- Real-time sales performance monitoring
- Strict access controls and permission management
- Comprehensive activity logs to prevent fraud

### What Problems Does This Solve?

**The Manual Invoicing Problem:**

Traditional sales processing often suffers from disconnected systems. Common issues include:
- **Data Re-entry Errors**: Manually typing data from orders to invoices leads to mistakes.
- **Inventory Discrepancies**: Billed amounts don't match actual stock deductions.
- **Delayed Reporting**: Financial data is only available after batch posting.
- **Phantom Stock**: Selling items that physically exist but are systemically reserved.

**The Sales Invoice Applet Solution:**

- **Instant Knock-off (KO)** - Convert Sales Orders to Invoices with zero manual data entry.
- **Real-time Posting** - Financial ledgers and inventory levels update immediately upon finalization.
- **Unified Workflow** - Pack queue and delivery logistics live within the same ecosystem.
- **Forensic Audit Trail** - Track every click, status change, and user action.
- **Flexible Settlement** - Handle complex payments via Contra, Credit Notes, or Vouchers.

## Key Features Overview

{{< cards >}}
  {{< card title="Transaction Listing" subtitle="View and track invoice status" link="#transaction-listing" >}}

  {{< card title="Knock-off (KO)" subtitle="Convert orders to invoices instantly" link="#for-sales-teams-generate-invoices-quickly" >}}

  {{< card title="Pack Queue" subtitle="Manage logistics and delivery" link="#logistic-features" >}}

  {{< card title="Contra Settlements" subtitle="Offset payments with credit notes" link="#contra-settlements" >}}

  {{< card title="Document Tracing" subtitle="Audit financial journal postings" link="#trace-document" >}}

  {{< card title="Personalization" subtitle="Customize layouts and columns" link="#configuration--settings" >}}

  {{< card title="Bulk Operations" subtitle="Import/Export large datasets" link="#bulk-importexport" >}}

  {{< card title="Permission Control" subtitle="Granular access management" link="#administration--permissions" >}}
{{< /cards >}}

## Key Concepts

### The Order-to-Cash Cycle

Understanding how the Sales Invoice Applet fits into the bigger picture is crucial for effective management.

| Stage | Component | Action | Impact |
|-------|-----------|--------|--------|
| **1. Demand** | Sales Order (SLS OR) | Customer confirms order | Stock is **Reserved** (Not deducted) |
| **2. Billing** | **Sales Invoice (SLS INV)** | **Invoice is Finalized** | **Stock Deducted** + **Revenue Recognized** |
| **3. Fulfillment** | Delivery Order (DO) | Goods leave warehouse | Stock movement verified |
| **4. Payment** | Receipt/Contra | Payment received | Customer Balance reduced |

{{< callout type="tip" >}}
**Golden Rule**: The **Sales Invoice** is the "Source of Truth" for financial revenue and physical stock deduction. Until an invoice is "Finalized", no accounting entries are made.
{{< /callout >}}

### Understanding "Knock-Off" (KO)

**"Knock-Off"** is the process of converting a source document (like a Sales Order) into a destination document (Sales Invoice) while maintaining a link between them.

*   **Partial Knock-Off**: You can invoice 5 items from a 10-item order. The system keeps the remaining 5 as "Backorder".
*   **Fully Knock-Off**: The entire order is invoiced, and the order status becomes "Closed".
*   **Benefits**: Prevents over-invoicing and ensures every invoiced item traces back to an authorized order.

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Sales Teams: Generate Invoices Quickly

**Goal:** Create a valid sales invoice and deduct stock in 5 simple steps.

1.  **Initialize**: Click the **Plus (+)** button in the main toolbar to open a blank invoice canvas.
    {{< figure src="/images/internal-sales-invoice-applet/create-form.png" alt="Invoice Creation Form" caption="The streamlined interface for creating new sales invoices." >}}
2.  **Select Customer**:
    *   Navigate to the **Account** tab.
    *   Search for the **Entity ID** or Name.
    *   *System Action*: Automatically pulls in Bill-To/Ship-To addresses and Credit Terms.
3.  **Add Items**:
    *   Go to the **Line** tab and click **(+) Add Item**.
    *   Select the Product and enter **Quantity**.
    *   *Note*: For serialized items, select specific serial numbers from the dropdown.
4.  **Review Financials**: Check the **Total Amount**, Tax details, and any applicable **Discounts**.
5.  **Finalize**: Switch status from **Draft** to **Final**.
    *   ✅ System assigns an Invoice Number.
    *   ✅ Stock is deducted immediately.
    *   ✅ Revenue is posted to GL.

**Pro Tip:** Use the **Knock-off (KO)** button to instantly copy all details from an existing Sales Order instead of typing them manually.

---

### For Managers: Review and Control

**Goal:** Ensure data integrity and audit compliance.

1.  **Monitor Statuses**:
    *   **Draft (Blue)**: Working copies; safe to edit or delete.
    *   **Final (Green)**: Legal documents; locked and posted.
    *   **Modification (Orange)**: Final docs with minor non-financial edits (e.g., updating remarks).
2.  **Audit Sensitive Actions**:
    *   Use the **Audit Trail** to see who modified prices or changed dates.
    *   Check for "Selling Below Cost" warnings in the line items.
3.  **Manage Exceptions**:
    *   Approve special requests for **Backdating** or **Credit Limit Overrides** if you have Admin permissions.

---

### For Admins: System Configuration

**Goal:** Set up the environment for your branch or team.

**Step 1: Define Default Branch** (`Personalization > Default Settings`)
- Set the primary business unit and warehouse location.
- *Why?* Reduces errors by auto-selecting the correct stock source for every new invoice.

**Step 2: Configure Permissions** (`Settings > Permission Wizard`)
- **Allow Change Date**: decide if users can backdate invoices (usually **OFF** for junior staff).
- **Allow Price Edit**: decide if sales reps can change system prices (usually **OFF** to prevent unauthorized discounts).
- **View Cost**: decide if users can see the profit margin per item.

**Step 3: Set Up Printing Templates**
- Configure the default layouts for **Tax Invoices** and **Delivery Orders**.
- Add company logos and footer terms (e.g., "Goods sold are not returnable").

---

## Configuration & Settings

**Customize the interface to match your workflow.**

{{< figure src="/images/internal-sales-invoice-applet/settings-page.png" alt="Applet Settings" caption="Configure default branches, layouts, and permissions." >}}

### Personalization Menu

Access the **Personalization** menu to adapt the applet to your specific role.

**Default Settings:**
Save time by locking in your most-used parameters:
- **Default Branch**: Business unit for recording sales.
- **Default Location**: Warehouse for stock draws.
- **Delivery Branch**: Default hub for logistics documents.

**View Layouts:**
- **UI Orientation**: Switch between **Horizontal** (Standard tabs) or **Vertical** (Widescreen optimized).
- **Layout Mode**:
    - **Single-Page**: Clean focus for high-speed retail entry.
    - **Double-Page**: Split-screen for complex B2B invoicing (view Invoice and Stock list side-by-side).

**Column Manager:**
- **Visibility**: Tick/Untick columns to hide unused fields (e.g., hide "Project Code" if not used).
- **Ordering**: Drag and drop headers to prioritize critical info (e.g., move "Total Amount" to the left).

---

## Detailed Feature Guides

### Contra Settlements

**What is it?**
Contra Settlement allows you to pay an invoice using *other documents* instead of cash or bank transfer. This is common in B2B trade where you buy and sell to the same partner.

**How to use it:**
1.  Open a **Draft** Invoice.
2.  Go to the **Contra** tab.
3.  Select **Knock-off (KO)**.
4.  Choose a valid **Credit Note** or **Receipt Voucher** from the list.
5.  Enter the amount to offset.
6.  The "Balance Due" of the invoice will decrease accordingly.

### Document Tracing

**Why trace?**
To verify that the system performed the correct accounting and inventory moves.

**How to trace:**
Click the **Trace** button on any **Final** invoice to see:
*   **Journal Postings**: The exact Debit (Customer) and Credit (Sales) entries.
*   **Stock Movement**: Which specific batch or serial number was deducted.
*   **Costing**: The cost of goods sold (COGS) calculation for that specific transaction.

---

## FAQ

**Q: Can I edit an invoice after finalizing it?**
A: **No, for financial fields.** Price, Quantity, Item, and Customer cannot be changed once Final. You must **Void** the invoice (reversing all entries) and create a new one. Non-financial fields like *Remarks* or *Salesman* can be edited, changing the status to "Modification".

**Q: Why is the "Transaction Date" greyed out?**
A: To prevent accounting fraud or accidental period closures. Backdating requires the specific **"Allow Change Transaction Date"** permission. Contact your Admin if you need this enabled.

**Q: I have sold the wrong item, but the goods haven't left the warehouse. What do I do?**
A: **Void** the invoice immediately. This will return the stock to the system. Then create a new invoice with the correct item. Do *not* use a Credit Note for this if the goods never left, as Voiding is cleaner for audit trails.

**Q: How do I handle partial payments?**
A: The invoice itself records the full sale. Payments are handled in the **Official Receipt** applet. However, you can use the **Contra** tab on the invoice to offset any *deposits* previously collected.

**Q: Can I print a Delivery Order (DO) without showing prices?**
A: Yes. When clicking the **Printer Icon**, select the **Delivery Order** template. This template is designed for logistics staff and hides all financial information (Unit Price, Total) while showing Item Codes, Descriptions, and Quantities.
