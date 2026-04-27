---
title: "Consignment Return (Internal) Applet"
description: "Comprehensive consignment return management system for processing supplier consignment returns, inventory adjustments, settlements, and financial reconciliation."
tags:
- consignment-management
- supplier-returns
- inventory-adjustment
- financial-posting
- document-tracing
- settlement
weight: 65
date: 2026-04-27
draft: false
---

## Purpose and Overview

The **Internal Consignment Return Applet** is a specialized tool designed to manage the end-to-end process of returning consignment goods to suppliers. It handles the complete lifecycle from initiating a return — either manually or by referencing an existing Purchase GRN or Purchase Order — through to final financial settlement and inventory reconciliation.

{{< callout type="info" >}}
**Core Concept**: A Consignment Return is not simply "sending goods back." It is a **financial and inventory transaction** that must update stock levels, supplier accounts receivable/payable (ARAP), and be fully traceable back to the originating consignment document.
{{< /callout >}}

---

## Key Features Overview

### Who Benefits from This Applet?

**Procurement & Warehouse Teams:**
- Accurately record consignment goods being returned to suppliers
- Link returns directly to originating Purchase GRNs or Purchase Orders using Knock-Off (KO) functionality
- Maintain correct stock levels through automated inventory adjustments on finalization

**Finance Teams:**
- Manage ARAP (Accounts Receivable / Accounts Payable) entries for consignment returns
- Process settlements via multiple payment methods (cash, bank transfer, cheque, credit card, e-wallet, etc.)
- Full contra support to offset returns against outstanding documents

**Management:**
- Complete audit trail linking every return to its source document
- Document tracing (Trace Document tab) to follow the full transaction chain
- Exportable records for reporting and compliance

### What Problems Does This Solve?

**The Manual Consignment Return Problem:**
- **Missing Credits**: Finance is not notified of returns, so supplier balances are not adjusted
- **Inventory "Ghost" Stock**: Goods leave the warehouse but remain on record
- **Untracked Settlements**: No systematic way to confirm whether a return was refunded or offset

**The Applet Solution:**
- **Unified Finalization**: One **FINAL** action updates stock, GL postings, and supplier ARAP simultaneously
- **Document Linkage**: KO For Purchase GRN and KO For Purchase Order prevent over-returning and ensure every return is traceable
- **Flexible Settlement**: Supports cash refunds, contra offsets, and multiple payment modes

{{< figure src="/images/internal-consignment-return-applet/consignment-return-overview-infographic.png" alt="Consignment Returns: From Manual Chaos to Unified Control - comparing manual return challenges with the unified applet solution" caption="Consignment Returns: From Manual Chaos to Unified Control — Inventory ghost stock, missing credits, and untracked settlements solved by unified finalization, document linkage via KO, and flexible settlement options." >}}

---

## Key Concepts

### Understanding the Consignment Return Framework

| Aspect | Component | Practical Example |
|--------|-----------|-------------------|
| **What** is being returned? | Line Items (Products) | Electronic components, inventory goods |
| **To whom** is it returned? | Supplier (Entity / Purchaser) | Vendor Company ABC |
| **Against which document?** | Source Document (GRN / PO) | Purchase GRN #GRN-2025-001 |
| **How is it settled?** | Settlement / Contra | Bank transfer, contra against invoice |

{{< callout type="tip" >}}
**Real-World Example**: Your warehouse received 100 units of a product under a consignment arrangement. 20 units are defective. You raise an Internal Consignment Return referencing the original GRN, return the 20 units, and settle the credit via bank transfer from the supplier.
{{< /callout >}}

### Document Lifecycle

A Consignment Return document moves through these stages:

```
Create (Draft)
    │
    ▼
Add Line Items (from Search, KO For GRN, or KO For PO)
    │
    ▼
Add Account / Delivery / Settlement / Department Info
    │
    ▼
FINAL  ──→  Stock adjusted + ARAP posted + Document locked
    │
    ▼
(Optional) Contra / Doc Link / Attachments / Export
```

**Key States:**

| State | Description |
|-------|-------------|
| **Draft** | Document is created and editable. Stock and financial postings are not yet made. |
| **Final** | Document is confirmed. Inventory is adjusted and ARAP entries are posted. |
| **Deleted** | Draft documents can be deleted before finalization. |

---

## Quick Start Guide

### Creating a Consignment Return

**Goal:** Create and finalize a consignment return in 6 steps.

1. **Navigate**: Go to **Consignment Return** from the sidebar
2. **Create**: Click the **Add (+)** button → The Create Consignment Return form opens
3. **Search Source Document** *(optional)*: Use the **Search** tab to find and copy from an existing consignment document
4. **Fill Main Details**:
   - Select **Company**, **Branch**, **Location**
   - Select the **Purchaser** (supplier)
   - Set the **Transaction Date**, **Currency**, and **Reference** number
5. **Add Line Items**: Switch to the **Lines** tab → Click **Add** → Choose items via:
   - **Search Item**: Search by product code or name
   - **KO For Purchase GRN**: Pull items from a specific Goods Received Note
   - **KO For Purchase Order**: Pull items from a specific Purchase Order
6. **Finalize**: Click **FINAL** → The system posts stock adjustments and ARAP entries

{{< callout type="warning" >}}
Once a document is set to **FINAL**, it cannot be edited. Ensure all line items, quantities, and account details are correct before finalizing.
{{< /callout >}}

{{< figure src="/images/internal-consignment-return-applet/consignment-return-listing.png" alt="Internal Consignment Return Listing showing document list with split-panel edit form" caption="Internal Consignment Return Listing: Select a document from the list to open the edit form in the side panel. The FINAL button in the toolbar allows bulk finalization of selected draft documents." >}}

### Editing a Consignment Return (Draft)

1. From the listing, click on a **Draft** document to open it
2. Make necessary changes across any tab
3. Click **SAVE** to preserve changes
4. Click **FINAL** when the document is ready to post

---

## The Create Form: Tab-by-Tab Guide

When creating or editing a Consignment Return, the form is organized into the following tabs:

### Search Tab *(Create mode only)*

Use this tab to search for an existing consignment document and copy its details into the new return. This is the fastest way to create a return that references a prior transaction.

### Main Details Tab

Captures the core header information for the return document.

| Field | Description |
|-------|-------------|
| **Doc Short Code** | System-generated document type code (read-only) |
| **Doc No (Tenant)** | Tenant-level document number (auto-generated, read-only) |
| **Doc No (Company)** | Company-level document number (auto-generated, read-only) |
| **Doc No (Branch)** | Branch-level document number (auto-generated, read-only) |
| **Company** | The company processing the return |
| **Branch** | Branch handling the transaction |
| **Location** | Warehouse or storage location |
| **Purchaser** | The supplier to whom goods are returned |
| **Transaction Date** | Date of the return |
| **Credit Terms** | Applicable credit terms |
| **Reference** | External reference number (e.g., supplier return authorization) |
| **Remarks** | Free-text notes |
| **Permit No** | Regulatory permit number if applicable |
| **Currency** | Transaction currency |
| **Tracking ID** | Logistics tracking identifier |
| **Delivery Branch / Location** | Branch and location for delivery of the return |

### Account Tab

Manages the supplier and billing/shipping entity information.

- **Entity Selection**: Select the supplier entity linked to the return
- **Billing Info**: Billing contact name, email, phone
- **Billing Address**: Full billing address (address lines, city, state, postcode, country)
- **Shipping Info**: Shipping contact name, email, phone
- **Shipping Address**: Full shipping/delivery address

{{< figure src="/images/internal-consignment-return-applet/consignment-return-account-tab.png" alt="Account tab showing Entity Details sub-tab with Entity Id, Entity Name, Status, Entity Type, Identity Type, and Currency fields" caption="Account Tab — Entity Details: Select the supplier entity. The Bill To and Ship To sub-tabs capture the corresponding billing and shipping addresses." >}}

### Lines Tab

Manages the individual products being returned.

| Field | Description |
|-------|-------------|
| **Item Code** | Product or inventory item code |
| **Description** | Item description |
| **Quantity** | Number of units being returned (note: quantity signum is negative for returns) |
| **UOM** | Unit of measure |
| **Unit Price** | Price per unit |
| **Discount** | Applicable discount |
| **Tax (SST/WHT)** | Tax configuration if enabled |
| **Amount** | Total line amount |

**Adding Line Items:**

{{< cards >}}
  {{< card title="Search Item" subtitle="Search by product code or name and add directly" >}}
  {{< card title="KO For Purchase GRN" subtitle="Link to items from an existing Goods Received Note" >}}
  {{< card title="KO For Purchase Order" subtitle="Link to items from an existing Purchase Order" >}}
{{< /cards >}}

{{< callout type="tip" >}}
Using **KO For Purchase GRN** or **KO For Purchase Order** is recommended. It creates a document link for traceability and prevents returning more than what was originally received.
{{< /callout >}}

{{< figure src="/images/internal-consignment-return-applet/consignment-return-lines-tab.png" alt="Lines tab showing item CSG-001 with Item Code, Item Name, UOM and Delivery columns, with Total Txn Amount displayed" caption="Lines Tab: Each line represents a product being returned. The Total Txn Amount and Total SST/VAT/GST Amount are summarized at the top right." >}}

### Delivery Details Tab

Records delivery-related information for the physical movement of returned goods, including delivery schedules and logistics notes.

{{< figure src="/images/internal-consignment-return-applet/consignment-return-delivery-details-tab.png" alt="Delivery Details tab showing Tracking ID, Delivery Branch, Delivery Type, Delivery Location fields with Apply to Lines buttons and item CSG-001 listed" caption="Delivery Details Tab: Set Tracking ID, Delivery Branch, Delivery Type, and Delivery Location. Use Apply to Lines to apply changes to all line items at once." >}}

### Settlement Tab

Records how the return is being financially settled with the supplier.

| Settlement Type | Description |
|-----------------|-------------|
| **Bank Transfer** | Supplier refunds via direct bank transfer |
| **Cash** | Cash refund from supplier |
| **Cheque** | Cheque payment from supplier |
| **Credit Card** | Credit card refund |
| **e-Wallet** | Electronic wallet refund |
| **FPX e-Mandate** | Online banking via FPX |
| **Payment Gateway** | Online payment gateway refund |
| **Open Credit** | Applied as open credit on the supplier account |
| **Others** | Any other settlement type |

{{< figure src="/images/internal-consignment-return-applet/consignment-return-settlement-tab.png" alt="Settlement tab showing Total Settlement, Doc Open Amount, and Doc ARAP Balance summary with Date, Amount, Details and Remarks columns" caption="Settlement Tab: Displays the Total Settlement applied, Doc Open Amount, and remaining Doc ARAP Balance. Click the + button to add a new settlement entry." >}}

### KO For Tab *(Create mode only)*

Use the **KO For** tab to import knock-off line items from source documents. This links the return to specific originating documents and ensures financial accuracy.

### Department Hdr Tab

Captures cost centre and department allocation for the return document header.

| Field | Description |
|-------|-------------|
| **Segment** | Business segment |
| **Dimension** | Accounting dimension |
| **Profit Center** | Profit centre allocation |
| **Project** | Project code if applicable |

{{< figure src="/images/internal-consignment-return-applet/consignment-return-department-hdr-tab.png" alt="Department Hdr tab showing Segment, G/L Dimension, Profit Centre, and Project dropdown fields" caption="Department Hdr Tab: Assign the consignment return to a Segment, G/L Dimension, Profit Centre, and Project for cost allocation and reporting." >}}

### ARAP Tab *(Edit mode only)*

Displays the Accounts Receivable / Accounts Payable entries generated when the document is finalized. This is a read-only view of the financial impact.

{{< figure src="/images/internal-consignment-return-applet/consignment-return-arap-tab.png" alt="ARAP tab showing Product and Services amount, Settlement, Doc Open Amount, Contra, and Outstanding balance fields" caption="ARAP Tab: A read-only summary of the financial posting — Products & Services value, Settlement applied, Contra offset, and the remaining Outstanding balance." >}}

### Trace Document Tab *(Edit mode only)*

Provides a complete audit trail of all documents linked to this consignment return — from the original Purchase Order through the GRN to this return document.

{{< figure src="/images/internal-consignment-return-applet/consignment-return-trace-document-tab.png" alt="Trace Document tab showing Journal Txn sub-tab with GL Code, Entity, Description, Debit and Credit columns and Total Debit/Credit summary" caption="Trace Document Tab — Journal Txn: View all general ledger journal entries generated by this document. Sub-tabs include Cashbook Txn, Points Txn, Tax Txn, and Inv Txn for a complete audit trail." >}}

### Contra Tab *(Edit mode only)*

Allows the return amount to be offset against outstanding supplier invoices or credit notes instead of receiving a cash refund.

{{< figure src="/images/internal-consignment-return-applet/consignment-return-contra-tab.png" alt="Contra tab showing Total Contra, Doc Open Amount and Doc ARAP Balance with an empty document list" caption="Contra Tab: Shows Total Contra applied, Doc Open Amount, and Doc ARAP Balance. Click + to select a document to offset against." >}}

{{< figure src="/images/internal-consignment-return-applet/consignment-return-contra-document-selection.png" alt="Select Document to Contra With popup showing CSGGRIN and PURINV documents with Doc Short, Doc No, Branch, Server Doc Type and Status columns" caption="Contra Document Selection: Search and select from available supplier documents (Consignment GRN, Purchase Invoice, etc.) to apply as a contra offset against the return amount." >}}

### Doc Link Tab *(Edit mode only)*

Links this consignment return to other related documents in the system for cross-referencing.

{{< figure src="/images/internal-consignment-return-applet/consignment-return-doc-link-tab.png" alt="Doc Link tab showing Copy From and Copy To sub-tabs with Doc Short, Doc No, Branch, Server Doc Type, Status and Date columns" caption="Doc Link Tab: The Copy From sub-tab shows source documents this return was copied from. The Copy To sub-tab shows documents that were subsequently created from this return." >}}

### Export Tab *(Edit mode only)*

Exports the consignment return document in configurable formats for record-keeping, sending to suppliers, or integration with external systems.

{{< figure src="/images/internal-consignment-return-applet/consignment-return-export-tab.png" alt="Export tab showing Printable Format dropdown and Export as PDF button" caption="Export Tab: Select a Printable Format template and click Export as PDF to generate a formatted document for supplier correspondence or internal record-keeping." >}}

### Attachments Tab *(Edit mode only)*

Upload and manage supporting documents such as:
- Supplier return authorization letters
- Delivery order copies
- Photos of defective goods
- Inspection reports

{{< figure src="/images/internal-consignment-return-applet/consignment-return-attachments-tab.png" alt="Attachments tab showing File Name, bl_fi_generic_doc_attachme, Uploaded Date, Uploaded By and Actions columns with an add button" caption="Attachments Tab: Click the + button to upload supporting files. Uploaded documents are listed with their file name, upload date, and the user who uploaded them." >}}

---

## Line Items Management

### The Line Items View

The **Line Items** section (accessible from the sidebar) provides a dedicated view of all line items across consignment return documents. This is useful for searching and reviewing specific product returns independent of their parent documents.

### Editing a Line Item

1. From the **Lines** tab (within a document), click on a line item to edit
2. Modify quantity, price, discount, UOM, or tax configuration
3. Save changes

---

## Settings and Configuration

### Application Settings

Administrators can configure the applet behavior via `Settings > Application Settings`:

| Setting | Description |
|---------|-------------|
| **Default Branch** | Pre-selected branch for new documents |
| **Default Location** | Pre-selected warehouse location |
| **Default Company** | Pre-selected company |
| **Enable SST** | Enable Sales & Service Tax on line items |
| **Enable WHT** | Enable Withholding Tax on line items |
| **Enable Dimension** | Show/hide dimension field |
| **Enable Profit Center** | Show/hide profit center field |
| **Enable Project** | Show/hide project field |
| **Enable Segment** | Show/hide segment field |
| **Hide Unit Price Fields** | Control visibility of specific pricing columns |
| **Hide Costing Details** | Hide costing information from line items |
| **Disable GRN Listing** | Disable the GRN document listing view |

### Default Selection

Pre-configure default values for new documents to reduce data entry:

- Default Branch
- Default Location
- Default Company
- Default Purchaser

### Printable Format Settings

Configure the layout and content of printed/PDF documents generated from this applet. Multiple printable format templates can be configured to suit different supplier or internal requirements.

### Personalization: Default Selection

Each user can configure their own default selections (branch, location, company) independently of the system-wide defaults via `Personalization > Default Selection`.

---

## Permissions

The applet enforces role-based access control:

| Permission | Description |
|------------|-------------|
| **Create** | Ability to create new consignment return documents |
| **Read** | Ability to view the listing and document details |
| **Update** | Ability to edit draft documents and save changes |
| **Delete** | Ability to delete draft documents |
| **Final** | Ability to finalize documents (posts to stock and ARAP) |

{{< callout type="warning" >}}
Only users with the **Final** permission can post a consignment return. Finalization is irreversible — ensure the document is accurate before proceeding.
{{< /callout >}}

---

## Common Workflows

### Return Against a GRN (Knock-Off)

**Scenario**: You received 50 units on GRN-2025-001 and need to return 10 defective units.

1. Create a new Consignment Return
2. Fill in **Main Details** (company, branch, supplier, date)
3. Go to **Lines** tab → Click **Add**
4. Select the **KO For Purchase GRN** tab
5. Search for `GRN-2025-001`
6. Select the 10 units to return
7. Return to the document → Add **Settlement** (e.g., credit to open balance)
8. Click **FINAL**

**Result**: 10 units are deducted from inventory, ARAP is updated, and the document is linked to GRN-2025-001 for full traceability.

---

### Contra Settlement Against Outstanding Invoice

**Scenario**: Instead of a cash refund, you want to offset the return value against an outstanding supplier invoice.

1. Finalize the consignment return document
2. Go to the **Contra** tab
3. Search for the outstanding supplier invoice
4. Apply the return amount as a contra offset
5. Save the contra entry

---

### Bulk Finalization from Listing

You can finalize multiple draft documents directly from the listing without opening each one:

1. Go to the **Consignment Return** listing
2. Select the draft documents using the checkboxes
3. Click the **FINAL** button in the listing toolbar
4. Confirm the action

---

## Frequently Asked Questions

**Q: Can I edit a finalized consignment return?**

A: No. Once a document is finalized, it is locked and cannot be edited. If corrections are needed, you must raise a new document or use contra/settlement adjustments.

---

**Q: What is the difference between "KO For Purchase GRN" and "Search Item"?**

A: **Search Item** lets you add any inventory item freely without linking to a source document. **KO For Purchase GRN** pulls items specifically from a Goods Received Note, creating a document link for traceability and preventing over-returning.

---

**Q: What happens to stock when I finalize a consignment return?**

A: The system automatically deducts the returned quantity from the selected warehouse location. The quantity signum for consignment returns is negative, so stock is reduced upon finalization.

---

**Q: How do I track which invoices a consignment return has been applied against?**

A: Use the **Contra** tab on the finalized document to view all contra entries, or use the **Trace Document** tab to see the complete document chain.

---

**Q: Can I attach documents to a consignment return?**

A: Yes. Use the **Attachments** tab (available in edit mode) to upload supporting documents such as return authorizations, inspection reports, or supplier correspondence.

---

**Q: What settlement methods are supported?**

A: The applet supports Bank Transfer, Cash, Cheque, Credit Card, e-Wallet, FPX e-Mandate, Payment Gateway, Membership Point Currency, Open Credit, and Others.

---

**Q: Can multiple users work on the same document?**

A: Draft documents can be accessed by users with the appropriate permissions. However, simultaneous editing is not supported. The last saved version will be retained.
