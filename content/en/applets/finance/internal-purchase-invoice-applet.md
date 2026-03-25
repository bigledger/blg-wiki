---
title: "Internal Purchase Invoice Applet"
description: "Streamline intercompany and intra-company purchasing workflows, managing bill-to details, settlement methods, and automated accounting entries."
tags:
- finance
- purchase-invoice
- intercompany
- settlement
- accounts-payable
weight: 120
---

## Purpose and Overview

The **Internal Purchase Invoice Applet** is designed to handle the critical "Invoicing" stage of the procurement cycle, specifically tailored for organizations with complex multi-branch or intercompany structures. It allows users to create official purchase invoices that reconcile with Goods Received Notes (GRN) or existing Purchase Orders (PO), ensuring that the financial liability is accurately recorded in the accounts.

{{< callout type="info" >}}
**Core Concept**: This applet transforms procurement documents into financial records, linking physical stock receipts to billing obligations and settlement processes.
{{< /callout >}}

## Key Features

### Who Benefits from This Applet?

**AP Clerks & Finance Teams:**
- Generate purchase invoices by knocking off (**KO**) against established POs or GRNs.
- Manage "Bill To" and "Entity Details" to ensure tax and legal compliance.
- Record settlements (payments) directly against the invoice using the **Add Settlement** feature.

**Warehouse & Procurement Managers:**
- Verify that billed items match received items (Three-way matching logic).
- Track the conversion status of procurement steps to avoid double-billing.

**Management & Branch Supervisors:**
- Oversee intercompany billing through the dedicated **Intercompany** tab.
- Monitor high-volume imports via the **File Import** feature.

### What Problems Does This Solve?

**Manual Data Entry Errors:**
- Instead of typing details from a paper invoice, users "pull" data from existing GRNs or POs, reducing typos and price mismatches.

**Intercompany Reconciliation Issues:**
- Dedicated status tracking for intercompany transactions ensures both the "sending" and "receiving" branches reflect the same financial reality.

**Payment Tracking Gaps:**
- The ability to link settlements directly to the invoice header ensures no payment is lost or misallocated.

---

## Feature Navigation

{{< cards >}}
  {{< card title="Purchase Invoice" subtitle="Listing, create & edit with bill-to and line items" link="#for-ap-clerks-creating-a-new-invoice" >}}

  {{< card title="Knock-Off (KO)" subtitle="Linking invoices to POs or GRNs" link="#quick-start-guide" >}}

  {{< card title="Settlement" subtitle="Adding payments and managing KO for payments" link="#frequently-asked-questions" >}}

  {{< card title="Intercompany" subtitle="Managing transactions between branches" link="#who-benefits-from-this-applet" >}}
{{< /cards >}}

---

## Quick Start Guide

### For AP Clerks: Creating a New Invoice

**Goal:** Create a purchase invoice and link it to a previous delivery (GRN) within 5 steps.

1. **Select Branch**: Open the applet and select your current **Branch** from the dropdown.
2. **Initialize Invoice**: Click **"+" (Create)** from the main listing view.
3. **Configure Header**:
   - **Entity Details**: Select the supplier/vendor.
   - **Bill To**: Confirm the billing address and tax details.
4. **Link to Received Goods (KO)**:
   - Navigate to the **Lines** tab.
   - Click **"+"** and select **KO For Purchase GRN** (or **KO For Purchase Order**).
   - Select the relevant records to pull the items, quantities, and prices automatically.
5. **Finalize**: Review the totals in the **Summary** section and click **Save**.

### For Supervisors: Managing Settlements

**Goal:** Record a payment against an existing invoice.

1. **Search**: Locate the approved Purchase Invoice in the main listing.
2. **Edit**: Click the invoice number to open the edit screen.
3. **Add Payment**:
   - Go to the **Settlement** tab.
   - Click **Add Settlement**.
   - Enter the payment amount and choose the method (Cash, Bank, etc.).
4. **Verify**: Check the **Total Settlement** vs **Total Amount** to ensure the balance is correct.

---

## Config & Settings

The applet behavior is highly customizable through the **Settings** menu:

- **Application Settings**: Configure default decimal places, auto-generation of invoice numbers, and mandatory field requirements.
- **Printable Format**: Design the layout of the PDF/printed invoice (logos, footer notes).
- **Default Selection**: Set default branches or tax codes to speed up data entry.
- **Workflow Settings**: Define if an invoice requires a supervisor's approval before it is finalized.

---

## Frequently Asked Questions

**Q: Can I create an invoice if there is no PO or GRN yet?**
A: Yes, you can manually add items in the **Lines** tab by selecting **Search Item** instead of using the Knock-Off (KO) features. However, for audit compliance, linking to a GRN is recommended.

**Q: What does "KO For Purchase GRN" mean?**
A: **KO** stands for "Knock-Off." It means you are marking a specific GRN as "billed" so it cannot be invoiced again, preventing duplicate payments to suppliers.

**Q: How do I handle a price difference between the PO and the actual Invoice?**
A: During the KO process, you can manually adjust the **Price** item if it varies from the PO, provided you have the necessary permissions.

**Q: Where can I see intercompany invoices from other branches?**
A: Navigate to the **Intercompany** tab. This view specifically filters for invoices where the purchaser and supplier are both within your organization's branch network.

**Q: Can I import a large batch of invoices from an Excel file?**
A: Yes, use the **File Import** menu. You will need to map your Excel columns to the standard applet fields (e.g., Code, Qty, Amount).

---

## Audit and Traceability

To ensure financial integrity, use the following tools:
- **Audit Trail**: Located in Settings, this logs every change made to an invoice, including who created it and who modified the prices.
- **Release Notes**: Check this section frequently to see new updates and improvements made to the applet.

---

{{< callout type="tip" >}}
**Next Steps**: After perfecting the invoice, proceed to the **Supplier Statement** report in the Finance module to reconcile your total outstanding balance with your vendors.
{{< /callout >}}

