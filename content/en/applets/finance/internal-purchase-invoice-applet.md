---
title: "Purchase Invoice (Internal)"
description: "Create and manage internal purchase invoices with GRN/PO knock-off, payments, contra, E-Invoice, intercompany queues, line-items workspace, file import and export, and full settings and personalization."
tags:
- finance
- purchase-invoice
- intercompany
- settlement
- accounts-payable
- e-invoice
- knock-off
- line-items
weight: 120
date: 2026-04-11
lastmod: 2026-04-11
draft: false
---

## Purpose and Overview

The **Purchase Invoice (Internal)** applet streamlines the process of managing your supplier bills. It ensures you know exactly who you are paying, what products or services you purchased, and that the invoiced amount matches what was originally ordered and received.

{{< callout type="info" >}}
**Core Concept**: Think of a Purchase Invoice as the ultimate "truth checker" before money leaves your company. It acts as the bridge between your **operations team** (who received the goods) and your **finance team** (who pays the bills). It ensures that the supplier's bill exactly matches what you originally ordered (Purchase Order) and what physically arrived at your warehouse (Goods Received Note), preventing overpayments, duplicates, and errors.
{{< /callout >}}

## Video Overview

Watch the video tutorial below for a complete walkthrough of the Internal Purchase Invoice Applet, including manual creation, GRN knock-off, and E-Invoice submission:

{{< youtube 0dGRtyjV7-A >}}

## Key Features Overview

### Who Benefits from This Applet?

**Accounts Payable (AP) & Finance:**
- Easily create invoices that automatically pull data from received goods (eliminating manual entry).
- Centralize all payments and offsets (Contras) directly on the invoice.
- Automatically sync eligible transactions to the MyInvois portal (Self-Billed E-Invoices).

**Procurement & Warehouse:**
- Ensure what gets paid matches exactly what was received.
- Maintain a clear audit trail linking original Purchase Orders to final invoices.

**Intercompany Teams:**
- Seamlessly track internal branch transfers through dedicated inbound and outbound queues.

**Administrators:**
- Customize which tabs are visible to keep the screen clean.
- Configure approval workflows and set defaults for specific branches or users.

### What Problems Does This Solve?

**The Manual Invoice Problem:**
Traditional accounts payable involves re-typing data from delivery orders into the accounting system. This leads to:
- Mismatched quantities between what was received and what is billed.
- Duplicate payments for the same items.
- A disconnected audit trail when trying to find the original Purchase Order.

**The Applet Solution:**
- **Automated Matching (Knock-off)** - Pull invoice lines straight from the Goods Received Note (GRN) with a single click.
- **Unified Workspace** - Handle the invoice, payment, and tax compliance (E-Invoice status) all on one screen.
- **Traceability** - Instantly see the history of a transaction from order to payment.

## Key Concepts

### The "Golden Framework" of Purchase Invoices

To effectively manage your invoices, it helps to understand the main components and how they link together in the system:

| Aspect | What It Means | Where You Do It |
|--------|---------------|-----------------|
| **Who** you are paying | The Supplier or Vendor sending the bill. | **Account** Tab |
| **What** you are paying for | The specific products, services, and taxes being billed. | **Line Items** Tab |
| **Proof** of receipt | Matching the invoice to a delivery or order to ensure validity. | **KO For** (Knock-off) Tab |
| **How** you settle it | Recording cash, bank transfers, or offsetting against existing deposits. | **Payment** & **Contra** Tabs |
| **Compliance** | Ensuring the document meets local tax portal requirements. | **E-Invoice** Tab |

---

## Quick Reference Cards

### Common Daily Tasks

**Task: Create an invoice from a Goods Received Note (GRN)**
-> Click `+` -> Go to `KO For` tab -> Select GRN -> Click `Knock-off` -> Click `Create`.

**Task: Offset an invoice with an existing deposit**
-> Open Invoice -> Go to `Contra` tab -> Click `+` -> Select the existing Payment Voucher or Deposit -> Save.

**Task: Upload multiple invoices from an Excel template**
-> Go to `File Import` menu -> Download template -> Fill data -> Click `+` in File Import -> Upload File. 

**Task: Handle a returned item or mistake on a finalized invoice**
-> Open the Finalized Invoice -> Click the `Return` button at the top -> Fill out the return pop-up to generate a Credit Note.

---

## Navigation & Workspaces

The Purchase Invoice applet is divided into four main workspaces accessible from the left-hand menu:

1. **Purchase Invoice**: The main workspace where you create, edit, and view individual invoices.
2. **Line Items**: A dedicated grid view showing all individual items across *all* invoices. Useful for adjusting item quantities, analyzing unit prices, and applying taxes across multiple lines quickly.
3. **File Import**: A workspace dedicated to bulk-uploading invoices via CSV/Excel and resolving data validation errors before importing.
4. **File Export**: A reporting view where you can export your purchase invoice listings into bulk printable or spreadsheet formats.

---

## Quick Start Guide

Get up and running with the most common invoice workflows.

{{< cards >}}
  {{< card title="Manual Invoice Creation" subtitle="Create an invoice from scratch" link="#for-ap-clerks-create-a-manual-invoice" >}}
  {{< card title="Create from GRN (Recommended)" subtitle="Auto-fill data from a received order" link="#for-ap-clerks-the-fast-way-creating-from-a-grn" >}}
  {{< card title="Self-Billed E-Invoices" subtitle="Submit directly to the tax portal" link="#for-finance-teams-handling-self-billed-e-invoices" >}}
{{< /cards >}}

### For AP Clerks: Create a Manual Invoice

Use this method if you are creating an invoice that does not have an existing purchase order or system receipt.

1. **Navigate**: Go to the **Purchase Invoice** menu and click **"+" (Add New)**.
2. **Main Details**: 
   - Select your Branch and Location.
   - Set the Transaction Date.
   - Choose the Currency (changing to a foreign currency will automatically fetch the latest exchange rate).
3. **Select Supplier**: Go to the **Account** tab and select the supplier from the list. (If they don't exist, use the toggle switch to easily create a new supplier profile directly from this screen).
4. **Add Lines**: Move to the **Line Items** tab. Click **"+"** to add the products or services you are being billed for. You can adjust the quantity, unit price, and apply relevant taxes in this grid.
5. **Save & Finalize**: Click **Create** to save the document. Once verified, click **FINAL** to lock it for payment processing.

---

### For AP Clerks: The Fast Way (Creating from a GRN)

This is the recommended method. Instead of typing everything manually, you "Knock-off" (KO) an existing Goods Received Note (GRN). This copies all supplier details and items instantly.

1. **Navigate**: Click **"+" (Add New)** from the main listing.
2. **Start the Knock-Off**: Instead of going to the Account tab, go straight to the **KO For** tab.
3. **Select Source**: Search for and select the specific **Purchase GRN** you want to bill.
4. **Auto-Populate**: Click **Knock-off**. The system will automatically construct the entire invoice using the data from the GRN.
5. **Review & Create**: Check the items to ensure they match the physical bill from the supplier, then click **Create**.

---

### For Finance Teams: Handling Self-Billed E-Invoices

When you generate a Purchase Invoice on behalf of your supplier, it acts as a "Self-Billed" E-Invoice.

**Automatic Self-Billing:**
If you edit a Supplier's profile and set "E-Invoice Self-Bill" to **True**, every invoice created for them will automatically be marked as Self-Billed.

**Manual Self-Billing:**
If the supplier defaults are not set, open your Purchase Invoice, click the **Self-Bill** button at the top, and the system will flag the document.

**Tracking the Submission:**
1. Once finalized, the invoice goes to the **MyInvois Portal**.
2. Check the **E-Invoice Tab** on your document. It will show the progress: 
   - **Queue** → **IRB Processing** → **Validated** (or Failed with an error message).

{{< callout type="warning" >}}
**Note on Consolidated Invoices:** Combining multiple invoices into a single Self-Billed invoice is only permitted during the designated government grace period.
{{< /callout >}}

---

## Advanced Workflows

### Processing Bulk Invoices With File Import
If you have a large volume of bills from suppliers, manually keying them in is inefficient. Use the **File Import** workspace instead.
1. Download the file import CSV or Excel template from the File Import screen.
2. Ensure columns (like dates in YYYY-MM-DD, Entity IDs, and Item Codes) are correctly filled out.
3. Click **Add New (+)** and upload your spreadsheet.
4. The system runs an automated **Helper Checking** validation on upload. If any rows fail (e.g., an Item Code does not exist), the list of errors will show on the screen.
5. Click on the error lines to use the **Helper Checking Edit Form** to quickly correct rows directly from the browser without needing to modify and re-upload the spreadsheet.
6. Once all errors are cleared, process the import to finalize the invoices into the system en masse.

### Manual Intercompany Transactions
If your organization has multiple branches or sister companies configured within the same tenant, you can bill internally using the built-in **Intercompany Transaction** mechanics. This bypasses the typical "Account payable to external vendor" flow.
1. Navigate to the **Manual Intercompany Transaction** menu.
2. Select your sending branch and receiving branch.
3. Proceed just like a standard invoice. The system will automatically map the double-entry accounting to ensure both sides of the intercompany transaction are properly booked without manual journal postings.

### Handling Supplier Returns
If you have already clicked **FINAL** on a Purchase Invoice but later realize goods must be returned, or the supplier incorrectly overcharged:
1. Open the finalized **Purchase Invoice**.
2. Click the **Return Pop-Up** button located in the top actions bar.
3. A return wizard will appear letting you select exactly which line items and quantities are being sent back.
4. The system automatically creates a linked **Purchase Credit Note** to reverse the financial liability and adjust inventory without losing the audit trail of the original invoice.

---

## Tab-by-Tab Breakdown (The Edit Screen)

When you open an existing invoice, you will see a variety of tabs. Here is what they do:

- **Main Details:** Contains the header info, dates, Delivery Branch/Location (can be hidden), Purchaser, Credit Terms/Limits for the supplier, External Document References (DOs, quotations), and foreign exchange auto-rates.
- **Search Document:** Used only when the invoice is in a `TEMP` (Draft) status. Search across other forms and modules to quickly reference un-linked orders.
- **E-Invoice:** Your dashboard for tax portal submissions and error checking (MyInvois Processing, Failures, etc).
- **Account:** The profile, billing, and shipping address of the supplier. You can toggle to create one on the fly here.
- **Line Items:** The itemized breakdown of what you bought (quantity, prices, taxes).
- **KO For (Knock-off):** A dedicated workspace to search and import existing Goods Received Notes (GRN) or Purchase Orders to auto-populate the invoice.
- **Delivery Details:** This tab tracks shipping info, delivery address changes, and consignment parameters distinct from the supplier's billing account.
- **AR AP (Outstanding Balance):** Quickly see the total invoice amount versus what is still remaining to be paid.
- **Payment:** Add or view cash/bank settlements made against this invoice.
- **Department Header:** Tag the invoice with a Dimension, Profit Center, or Project for management reporting.
- **Posting:** View the accounting double-entry for inventory and general ledgers.
- **Trace Document:** A visual map showing the flow from Purchase Order → GRN → Invoice.
- **Contra:** Use this to offset the invoice balance against a previous deposit or existing Payment Voucher.
- **Doc Link:** Manually link a related system file outside of the standard traceability chain (such as associating an arbitrary internal memo or ticket).
- **Attachment:** Upload digital copies of physical receipts or supplier PDFs.
- **Export:** Export the invoice to a predefined printable format.

---

## System Configuration & Personalization

### Customizing Your View (Administrators)

If your screen feels cluttered with tabs you don't use, you can turn them off to simplify the system for your team. You can also change the layout itself!

1. Go to **Settings > Application Settings**.
2. Locate the "Feature Visibility" controls.
3. Toggle off unused tabs (e.g., Hide Delivery Details, Hide Attachments, etc.).
4. Explore **Vertical UI**: Toggle this to ON. This changes the traditional horizontal tab approach into an infinitely scrolling vertical layout, so you don't have to constantly click tab headers to see different sections.

---

## FAQ

**What if I cannot find the "FINAL" or "VOID" button?**  
These actions are controlled by roles. If you don't see them, check with your administrator to ensure you have the correct permission sets.

**Why is the E-Invoice tab empty?**  
The E-Invoice tab will remain empty during standard creation until a supplier is selected and the document is pushed through the workflow.

**Can I offset an invoice if I haven't received a payment voucher yet?**  
No. If there are no existing deposits or payment vouchers linked to this supplier, the Contra list will be empty.

**What happens if I make a mistake on a finalized invoice?**  
Once FINAL, lines cannot be edited. Depending on your policy, you must either VOID the document and recreate it, or issue a Credit Note.  
