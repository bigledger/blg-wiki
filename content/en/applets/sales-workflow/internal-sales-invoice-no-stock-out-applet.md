---
title: "Sales Invoice No Stock-Out (Internal) Applet"
description: "Comprehensive financial invoicing system for services, non-inventory items, and intercompany transactions without physical stock deduction"
tags:
- sales-workflow
- intercompany-billing
- financial-invoicing
- accounts-receivable
- no-stock-out
weight: 35
---

{{< callout type="warning" >}}
**Work in Progress: This documentation is currently pending review**
{{< /callout >}}

## Purpose and Overview

{{< callout type="tip" >}}
**TL;DR — Read this first.**

**What is this applet?** A deliberately restricted version of the standard Sales Invoice. It does everything a sales invoice does financially — AR, GL, tax posting — but it cannot touch inventory. Ever. That restriction is intentional.

**How is it restricted?**
- Only items configured as non-stock (transaction class PNS) can be added as line items. You cannot accidentally add a physical stock item here.
- No Goods Issue Note (GIN) is generated on finalization. The warehouse sees nothing. Stock levels are unchanged.

**Why use this instead of the standard Sales Invoice?** Precisely because of those restrictions. Use this applet when you want a hard guarantee that nothing inventory-related will happen:
- **Intercompany charges** — billing between your own entities (management fees, shared services, cost recharges). The applet has a dedicated Intercompany menu that auto-generates the matching purchase document on the receiving entity's side.
- **Service billing** — consulting fees, maintenance charges, subscriptions. No warehouse involvement needed.
- **Permission isolation** — give finance teams access to this applet only, without opening up the main sales workflow to them.
- **Audit clarity** — these transactions are a distinct document type, completely separate from regular sales invoices in reports and GL postings.

**The honest one-liner:** It is a guardrail. You use it because you want the restriction — to keep financial-only transactions categorically separate from the physical sales workflow.
{{< /callout >}}

The **Internal Sales Invoice (No Stock-Out) Applet** is a financial invoicing tool for scenarios where physical inventory movement is not required. It posts revenue, AR, and tax entries on finalization without triggering any warehouse workflow — no Goods Issue Note (GIN), no stock deduction, no picking queue.

{{< callout type="info" >}}
**Core Concept**: A **No Stock-Out Invoice** is purely a financial document. It updates Accounts Receivable and the General Ledger exactly like a standard invoice, but the warehouse and inventory system are not involved.
{{< /callout >}}

---

## Key Features Overview

### Who Benefits from This Applet?

**Finance & Accounts Receivable Teams:**
- Invoice for services and non-physical items without triggering warehouse workflows
- Accurate GL mapping for service-based and intercompany revenue
- Streamlined monthly billing for recurring charges and management fees
- Bulk import for high-volume billing cycles via Excel or CSV

**Sales & Project Teams:**
- Quick invoicing for consulting, maintenance, and project milestones
- No dependency on warehouse staff or stock availability
- Visibility into billing status for internal and external engagements

**Intercompany Relationship Managers:**
- Built-in intercompany transaction matching between related entities
- Automatic generation of the corresponding purchase document in the receiving entity
- Clear audit trail of all cross-entity financial movements

### What Problems Does This Solve?

**The "Ghost Stock" Problem:**

Standard invoicing assumes a physical product is being sold. Applying it to services creates operational noise:
- Accidental stock deductions for items like "Consulting Hours" or "Management Fee"
- Warehouse staff receiving picking lists for items that do not physically exist
- Inventory adjustments needed to fix incorrect GIN generation
- Distorted inventory valuation from non-physical postings

**The No Stock-Out Solution:**
- **Inventory-Neutral Posting** — financials update, warehouse is untouched
- **Service-First Invoicing** — built for non-inventory items and professional services
- **Intercompany Engine** — built-in matching of cross-entity sales and purchases
- **Bulk Import** — process large volumes of invoices via Excel or CSV templates
- **Template Management** — reuse standard invoice headers for recurring billing types

---

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/internal-sales-invoice-no-stock-out-applet-overview-infographic.png" alt="Sales Invoice No Stock-Out Overview: From Ghost Stock to Financial Precision - comparing manual inventory friction with the digital solution" caption="Sales Invoice No Stock-Out Overview: The Old Way (accidental stock deductions, warehouse confusion, valuation errors) vs The New Way (inventory-neutral posting, service-first invoicing, intercompany bridge)." >}}

## Standard Invoice vs No Stock-Out Invoice


| | Standard Sales Invoice | No Stock-Out Invoice |
|---|---|---|
| **GL Posting** | Yes | Yes |
| **AR Update** | Yes | Yes |
| **Tax Posting** | Yes | Yes |
| **Warehouse GIN** | Yes — generated automatically | **No** |
| **Stock Deduction** | Yes — inventory levels drop | **No — unchanged** |
| **Picking List** | Yes — warehouse staff notified | **No** |
| **Best for** | Physical goods being shipped | Services, fees, intercompany charges |

---

## Key Features

{{< cards >}}
  {{< card title="Sales Invoice" subtitle="Create and manage no stock-out invoices through their full lifecycle" link="#sales-invoice-no-stock-out" >}}
  {{< card title="Line Items" subtitle="Cross-document view of all billed line items for audit and review" link="#line-items" >}}
  {{< card title="Pick Pack Queue" subtitle="Manage internal delivery and pick-pack workflows where needed" link="#pick-pack-queue" >}}
  {{< card title="Template" subtitle="Create reusable invoice headers for standard recurring billing types" link="#sales-invoice-no-stock-out-template" >}}
  {{< card title="File Import" subtitle="Bulk-upload invoices via Excel or CSV for high-volume billing cycles" link="#file-import" >}}
  {{< card title="Intercompany" subtitle="Manage and reconcile cross-entity transactions within the group" link="#intercompany" >}}
{{< /cards >}}

---

## Key Concepts

### The Intercompany Flow

When billing between related entities within the same group, the applet can automatically generate a matching purchase document on the receiving entity's side — so both sides of the transaction are recorded without double entry.

```
Entity A (Seller / Service Provider)
│
└── No Stock-Out Invoice created
        │
        └── Intercompany mapping triggered
                │
                └── Entity B (Buyer) receives matched Purchase Document automatically
```

Both sides are linked, auditable, and reconcilable from the Intercompany menu.

---

## Navigation Menu

The applet sidebar contains six main sections:

### Sales Invoice No Stock-Out
The primary working area. Lists all invoices and is the entry point for creating new ones. The full create/edit/finalize/void lifecycle happens here.

### Line Items
A cross-document view of all line items across all invoices. Used by finance teams to audit billed quantities and amounts without opening individual invoice headers. Also useful for identifying line items with posting errors.

### Pick Pack Queue
Manages internal delivery and pick-pack workflows. Where physical handling is still involved (e.g., internal transfers between branches), this queue tracks the pick and pack process without deducting stock from inventory.

### Sales Invoice No Stock-Out Template
Stores reusable invoice header templates for standard recurring billing types — for example, a "Monthly IT Support Fee" template pre-filled with the standard entity, GL account, and line item structure. Saves setup time for predictable, recurring invoices.

### File Import
Handles bulk creation of invoices via Excel or CSV upload. Used for high-volume billing cycles where creating documents one by one is not practical — for example, end-of-month billing across multiple entities or departments.

### Intercompany
Manages cross-entity transaction matching and reconciliation. Where an invoice generated here creates a corresponding purchase document in another entity, this menu provides visibility into those linked transactions and their matching status.

---

## Sales Invoice No Stock-Out

### Listing

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-listing.png" alt="Sales Invoice Listing - central dashboard for tracking all non-inventory financial documents" caption="Document Listing: A unified view of all active and finalized no stock-out invoices, supporting bulk actions and status tracking." >}}

Lists all no stock-out invoices with their statuses. Multi-row selection is supported for bulk operations.

**Bulk action buttons on the listing:**

| Button | Function |
|--------|----------|
| **FINAL** | Finalizes selected draft invoices — triggers all financial postings (AR, GL, tax) simultaneously. No warehouse activity is triggered. |
| **DISCARD** | Cancels selected draft invoices with no financial impact. Only applies to documents still in draft — cannot discard a finalized invoice. |
| **VOID** | Reverses all financial postings on finalized invoices — AR entry removed, GL journal reversed, tax entry cancelled. **Hidden when e-invoicing is enabled** — once an e-invoice has been submitted to LHDN, you cannot void the document. Issue a credit note or sales return instead. Also blocked if the invoice already has a sales return linked to it. |
| **SEND EMAIL** | Sends the invoice document to the customer via email. |
| **SINGLE / MULTIPLE PRINT** | Generates printable invoice output. Only active if printing is enabled in Application Settings. |

---

### Create

Creates a new no stock-out invoice. The form is organized into tabs.

#### Main Details Tab

Captures the document header information that applies to the entire invoice.

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-main-details-1.png" alt="Main Details Tab (Section 1) - branch, location, and staff assignments" caption="Header Configuration (1): Establishing the physical and organizational origin of the invoice." >}}

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-main-details-2.png" alt="Main Details Tab (Section 2) - currency, terms, and regulatory permit fields" caption="Header Configuration (2): Managing commercial terms, currencies, and industry-specific compliance data." >}}

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-main-details-3.png" alt="Main Details Tab (Section 3) - internal and external remarks" caption="Header Configuration (3): Capturing internal context and formal messages destined for the printed document." >}}

**Required fields:** Branch, Location, Transaction Date

**Optional fields:** Company, Sales Agent, Credit Terms, Credit Limit, Reference, Remarks, External Remarks, Permit No, Currency, Delivery Branch, Delivery Location, Tracking ID, CRM Contact, Member Card, Sales Lead, Due Date

**Fields that need context:**

| Field | Notes |
|-------|-------|
| **Branch / Location** | The issuing branch and its specific inventory location. Even though no stock is deducted, branch and location determine which company's financials the invoice posts to. |
| **Transaction Date** | Determines which accounting period the financial entries are posted to — critical for month-end closing. |
| **Credit Terms / Credit Limit** | Auto-populated from the customer's master data once an entity is selected. Can be overridden per document. |
| **Reference** | Cross-reference to an external document — typically the customer's own PO number or internal request reference so both sides can match records. |
| **External Remarks** | Prints on the invoice sent to the customer. Use for delivery instructions or messages intended for the customer. |
| **Remarks** | Internal notes only — does not appear on the printed invoice. |
| **Permit No** | Required only for regulated goods categories (e.g., pharmaceuticals, controlled items). |
| **Currency / Currency Rate** | Used when billing in a foreign currency. The rate converts amounts back to base currency for GL posting. |
| **Delivery Branch / Location** | The branch responsible for any physical handling related to this invoice — can differ from the issuing branch. |

Document number fields (Tenant / Company / Branch Doc No, Client Doc 1–5) are system-generated and read-only.

---

#### Account Tab

Identifies who is being billed and manages address information. Contains sub-tabs:

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-account-tab.png" alt="Account Tab - managing debtor entity details and billing address" caption="Account Tab: Defining the primary debtor and linking to their financial master record." >}}

**Bill To sub-tab** — The billing address for the invoice. Populated from the entity's master data. This address appears on the printed invoice.

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-ship-to-subtab.png" alt="Ship To Sub-tab - specifying the physical service or delivery destination" caption="Ship To: Recording the physical location where services were performed, separate from the billing address." >}}

**Ship To sub-tab** — The delivery address. Can differ from the billing address — common when the invoice goes to head office but goods or services are delivered to a branch site.

---

#### Lines Tab

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-lines-tab.png" alt="Lines Tab - detailed list of services, fees, and charges" caption="Lines Tab: The core body of the invoice where billable services and non-stock items are recorded." >}}

Lists all items being billed in this document. Each line item represents one service, fee, or non-inventory charge.

Running totals shown at the top:
- **Total Transaction Amount** — combined invoice value in document currency
- **Total Tax Amount** — total tax across all lines, posted to the tax authority account on finalization

Clicking a line item opens the Add/Edit Item form with sub-tabs:

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-item-details-subtab.png" alt="Item Details Sub-tab - specific line item configuration for pricing and taxes" caption="Item Details: Managing the financial values and tax classifications for individual service lines." >}}

**Item Details sub-tab** — item code, description, quantity, UOM, unit price, discount, tax configuration. Price fields and discount visibility are configurable in Application Settings.

#### Serial Number sub-tab

*(only shown if the item is configured as serial-number tracked)*

{{< callout type="tip" >}}
**TL;DR** — No stock is deducted, but the serial number is still recorded against the invoice for audit and traceability purposes.
{{< /callout >}}

Even though this applet does not generate a GIN or reduce stock, you can still capture which specific serial numbers were included in the transaction. This matters for warranty tracking, product recalls, and regulatory audits — you need to know which unit went to which customer, even if the inventory count did not move.

**Batch Number sub-tab** *(only shown if the item is configured as batch-tracked)*

Same principle as serial numbers. The batch number, issue date, and expiry date are captured per line item for traceability. Quantity is validated against the batch balance, but no stock is deducted from it.

**Bin Number sub-tab** *(only shown if the item uses bin-level tracking)*

Records which storage bin the item was picked from, along with container and quantity details. Again, for traceability and audit — not for stock movement.

**Department sub-tab** — assigns this line item to a cost center or department for GL dimension posting at line level.

**Delivery Details sub-tab** — per-line delivery branch, location, delivery type, and tracking ID. Overrides the header-level delivery settings for this specific line.

---

#### Settlement Tab

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-settlement-tab.png" alt="Settlement Tab - recording partial payments and deposits" caption="Settlement Tab: Capturing immediate cash receipts and upfront payments against the invoice." >}}

Records advance or partial payments against this invoice before or at finalization.

| Field | Notes |
|-------|-------|
| **Total Payment** | Cash already received against this invoice. |
| **Doc Open Amount** | What the customer still owes after deducting payments. |
| **Doc ARAP Balance** | The net outstanding balance after both payments and any contra entries. |

Each payment entry links to the Cashbook Applet so the cash receipt is recorded simultaneously.

---

#### Delivery Details Tab

*(Hidden if disabled in Application Settings)*

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-pick-pack-subtab.png" alt="Pick Pack Sub-tab - staging delivery logistics even without inventory movement" caption="Pick Pack Management: Coordinating physical handling and transport logistics for the services or goods invoiced." >}}

Bulk-apply delivery information across all line items at once — Tracking ID, Delivery Branch, Delivery Type (Internal, External, or Pickup), and Delivery Location. More efficient than editing each line individually when all lines share the same delivery details.

This tab contains four sub-tabs, each covering a different stage or method of delivery:

---

**Pick Pack sub-tab**

The starting point for all delivery fulfilment. This is where you assign delivery details to line items and queue them for dispatch.

Use the header fields to set values in bulk across selected lines, then click **Send To Queue** to create delivery jobs. You can also edit individual cells directly in the grid.

| Field | Notes |
|-------|-------|
| **Tracking ID** | The courier or internal tracking reference for this shipment. Can be set in bulk at the header or per-line in the grid. |
| **Delivery Branch** | Which warehouse or branch is handling the dispatch. |
| **Delivery Type** | How the goods are being delivered — **Internal Delivery** (your own fleet), **External Delivery** (third-party courier), or **Pickup** (customer collects). |
| **Delivery Location** | The specific location within the delivery branch from which items will be picked. |

The grid also shows per-line quantities: **Qty To Deliver**, **Qty Pending To Deliver**, and **Pick Pack Status** — so you can see at a glance what has already been queued and what still needs to be dispatched.

---

##### External Delivery sub-tab

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-external-delivery-subtab.png" alt="External Delivery Listing - tracking third-party courier jobs" caption="External Delivery: Monitoring dispatch status for items handled by outside logistics providers." >}}

A read-only listing of all delivery jobs raised for lines marked as **External Delivery** (third-party courier). Jobs appear here automatically once they are created from the Pick Pack sub-tab. Rows are grouped by **Delivery Job ID**.

Shows: Delivery Job ID, Sales Invoice No, Requested Delivery Date, Recipient Address, Delivery Region, Tracking ID, Item Code, Item Name, Delivery Type, Qty, Delivery Status, Remarks.

You can **Cancel Job** directly from this listing if a delivery needs to be recalled before it is dispatched.

---

##### Internal Delivery sub-tab

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-internal-delivery-subtab.png" alt="Internal Delivery Listing - tracking company fleet dispatches" caption="Internal Delivery: Managing logistics for items delivered via the organization's own transport." >}}

Identical in layout to External Delivery, but filtered to show only jobs marked as **Internal Delivery** (your own fleet or internal transport). Same grouping, same cancel action.

---

##### Pickup sub-tab

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-pickup-subtab.png" alt="Pickup Listing - managing customer collection points" caption="Pickup Tracking: Logging instances where the customer self-collects the invoiced items." >}}

Identical in layout to External and Internal Delivery, but filtered to show only jobs where the delivery type is **Pickup** — meaning the customer is collecting the goods themselves rather than receiving a delivery.

---

#### KO For Tab

*(Hidden if disabled in Application Settings)*

{{< callout type="tip" >}}
**TL;DR** — Links this invoice to the upstream document it was raised against. "KO" = Knock-Off — closing off a previously opened document once this invoice fulfills it.
{{< /callout >}}

When a Sales Order, Quotation, or Delivery Order was raised before this invoice, the KO For tab draws a link between them — recording that this invoice is fulfilling that upstream document. It does not copy or create new documents; it simply closes the loop.

**Supported upstream document types:**

| Document | When to use |
|----------|-------------|
| **Sales Order** | Invoice raised against a previously confirmed sales order |
| **Jobsheet** | Invoice raised against a job or service request |
| **Sales Quotation** | Invoice raised directly from an approved quotation |
| **Delivery Order** | Invoice raised against an outbound delivery order |

Each document type is only shown if enabled in Application Settings.

---

#### Department Hdr Tab

*(Hidden if disabled in Application Settings)*

{{< callout type="tip" >}}
**TL;DR** — Tags the entire invoice to a specific internal cost center or department for management reporting.
{{< /callout >}}

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-department-tab.png" alt="Department Hdr Tab - internal cost center allocation" caption="Departmental Tagging: Ensuring revenue and expenses are correctly attributed to the responsible internal team." >}}

Branch and Location tell you *where* the transaction happened. Department tells you *which internal team owns the cost*. For example, an invoice might be issued from the KL Branch but the cost belongs to the IT Department. Setting the department here ensures it shows up correctly in departmental P&L reports.

Fields: Segment, Dimension, Profit Center, Project.

---

#### Posting Tab

*(Hidden if disabled in Application Settings)*

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-posting-tab.png" alt="Posting Tab - real-time financial synchronization status" caption="Posting Status: Verifying the successful integration of the invoice with the GL, Tax, and Cashbook modules." >}}

Shows the system posting status for each financial subsystem after finalization. All fields are read-only:

| Field | Notes |
|-------|-------|
| **Journal Posting Status** | Whether the GL journal entry was successfully posted. |
| **Inventory Posting Status** | Inventory posting record — for a no stock-out invoice this should always reflect no deduction. |
| **Membership Points Posting Status** | Whether loyalty points were processed. |
| **Cashbook Posting Status** | Whether the cashbook entry was recorded. |
| **Tax Posting Status** | Whether the tax entry was filed to the tax module. |

If any status shows an error, the document remains in FINAL status but the affected posting must be investigated and re-triggered before the period can be closed.

---

### Edit

The edit form contains all the same tabs as create, plus additional tabs that only become meaningful after the document exists in the system.

**Action buttons on the edit form:**

| Button | Function |
|--------|----------|
| **SAVE** | Saves changes to a draft document. |
| **FINAL** | Finalizes the document — triggers all financial postings simultaneously. Irreversible without a VOID. |
| **DISCARD** | Cancels the draft with no financial impact. |
| **VOID** | Reverses all financial postings — AR removed, GL journal reversed, tax entry cancelled. Hidden when e-invoicing is enabled or when a sales return is already linked to this document. |
| **DELETE** | Permanently deletes the record. Draft documents only. |

#### Additional Edit-Only Tabs

**ARAP Tab** *(hidden if disabled in Application Settings)*

{{< callout type="tip" >}}
**TL;DR** — Shows the current state of what the customer owes on this invoice. Read-only, auto-computed.
{{< /callout >}}

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-arap-tab.png" alt="ARAP Tab - accounts receivable balance and settlement tracking" caption="ARAP Overview: A real-time view of the document's financial lifecycle, from original invoice to final settlement." >}}

ARAP = Accounts Receivable / Accounts Payable. Once finalized, the customer owes you the invoice amount. This tab shows how much was invoiced, how much has been paid, and how much is still outstanding.

| Field | Notes |
|-------|-------|
| **Products & Services** | The gross invoice amount. |
| **Settlement** | Total payments received so far. |
| **Doc Open Amount** | Remaining unpaid balance. |
| **Contra** | Credit notes or offsets applied against this invoice. |
| **Outstanding** | Net amount the customer still owes after all payments and contras. |

**TraceDocument Tab** *(hidden if disabled in Application Settings)*

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-trace-document-tab.png" alt="TraceDocument Tab - detailed GL journal entry audit" caption="Accounting Traceability: Providing a complete audit trail of every General Ledger entry created by the invoice." >}}

{{< callout type="info" >}}
**Who this tab is for:** Accountants and auditors only. Service managers, technicians, and billing staff do not need to use this tab.
{{< /callout >}}

Shows the **accounting journal entries** (GL postings) that were created in the General Ledger when this invoice was finalized — which accounts were debited, which were credited, and for what amounts. Used by finance teams to verify the posting is correct and by auditors to confirm the financial entries match the invoice.

{{< callout type="info" >}}
**TraceDocument vs Doc Link — what's the difference?**
- **TraceDocument** = *accounting impact* — the GL journal entries posted to the ledger when this invoice was finalized.
- **Doc Link** = *document relationships* — which upstream documents (Sales Orders, Quotations) this invoice was created from, and which downstream documents (Credit Notes, Debit Notes) were later created from it.
{{< /callout >}}

**Contra Tab** *(hidden if disabled in Application Settings)*

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-contra-tab.png" alt="Contra Tab - offsetting balances against other documents" caption="Contra Offsets: Managing the netting-off of balances against existing customer credits or debit notes." >}}

{{< callout type="tip" >}}
**TL;DR** — Apply an existing credit or debit document against this invoice so the customer pays only the net difference instead of the full amount.
{{< /callout >}}

Contra is an accounting term for offsetting one document against another without cash changing hands. Example: the customer has a credit note of RM 200 and owes you RM 1,000 on this invoice. You contra the credit note here — the customer pays RM 800 and both documents are settled.

The system only shows documents eligible for contra — meaning they must:
- Belong to the same company and same customer as this invoice
- Be already finalized (FINAL status)
- Carry an opposite ARAP balance (a credit against a debit, or vice versa)

There is no fixed list of document types — the system dynamically shows whatever eligible documents exist for that customer at the time.

**Doc Link Tab** — Shows documents linked to this invoice in two directions: Copy From (source documents used to create this invoice) and Copy To (documents created from this invoice as a source).

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-doc-link-tab.png" alt="Doc Link Tab - traceability to upstream orders and quotes" caption="Document Linkage: Visualizing the full workflow from initial quotation through to the final invoice." >}}

**Attachment Tab** — Stores supporting documents — signed agreements, approval emails, supporting calculations. Stored against the invoice and accessible to all users with view permission.

**Export Tab** — Data export options for sending invoice data to external accounting systems or generating custom reports.

**E-Invoice Tab** — Manages the full LHDN e-invoice submission lifecycle for this document. Contains four sub-tabs:

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-einvoice-progress.png" alt="E-Invoice Progress - LHDN submission pipeline tracking" caption="E-Invoice Workflow: Monitoring the real-time status of regulatory submissions to LHDN." >}}

- **Progress** — Shows where the document is in the submission pipeline: Pending Posting, Pending in Batch Queue, Pending Submission to IRB, and Submitted to IRB. Validation errors appear here if the document fails pre-submission checks.

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-einvoice-submission.png" alt="E-Invoice Submission - LHDN retrieval data and digital signature" caption="Submission Details: Accessing the official IRBM Unique Identifier and digital certificate for the document." >}}

- **Submission** — Read-only view of the e-invoice data retrieved from LHDN after submission: e-invoice type, purpose, document reference, IRBM status, validation date, IRBM Unique Identifier Number, and a QR code of the digital signature.

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-einvoice-communication.png" alt="E-Invoice Communication - IRB message logs" caption="IRB Communication: Maintaining a record of all automated exchanges with the tax authority regarding this invoice." >}}

- **Communication** — Records and messages exchanged with IRB related to this document.

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-einvoice-cancellation.png" alt="E-Invoice Cancellation - managing withdrawn submissions" caption="Cancellation Management: The interface for requesting document withdrawal from the tax authority after submission." >}}

- **Cancellation** — Used to initiate an e-invoice cancellation request if the document needs to be withdrawn from LHDN after submission.

**Delivery Trips Tab** — Route planning for any physical handling associated with this invoice — used when internal delivery tracking is needed even though stock is not deducted.

---

## Line Items

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-line-items-listing.png" alt="Line Items Listing - cross-document audit of all billed services" caption="Line Item Audit: A comprehensive view of every service billed across the system, ideal for month-end reconciliation." >}}

A standalone listing of all line items across all no stock-out invoices. Used by finance teams to:
- Audit billed amounts across multiple invoices without opening each header
- Filter by item, entity, or date range
- Identify line items with posting errors

---

## Pick Pack Queue

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-pick-pack-queue.png" alt="Pick Pack Queue - staging area for physical fulfillment" caption="Fulfillment Queue: Managing the physical logistics flow for items that require handling without inventory impact." >}}

{{< callout type="tip" >}}
**TL;DR** — A delivery staging queue. Even though no stock is deducted, physical delivery still needs to be coordinated. This is where you manage that.
{{< /callout >}}

Even on a no-stock-out invoice, the goods or materials may still need to be physically delivered — just without the system touching inventory counts. The Pick Pack Queue is the staging area for that delivery step.

It shows all invoice line items that have a pending delivery quantity, grouped by invoice. For each line you can see:

- The requested delivery date and delivery region
- The pending quantity still to be delivered
- Current stock balance at the delivery location (for reference)
- Delivery type and delivery status

**What you do here:** Set the quantity to deliver for each line, select the rows, and click **Ready To Ship**. This creates a delivery job linked to the invoice — capturing the delivery branch, location, dimensions, weight, and remarks — and sets the delivery status to CREATED for tracking.

The financial invoice and the delivery job are separate records. The invoice handles the billing; the Pick Pack Queue handles the logistics.

---

## Sales Invoice No Stock-Out Template

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-template-listing.png" alt="Template Listing - managing recurring billing shortcuts" caption="Template Management: Creating and maintaining shortcuts for frequent, identical billing scenarios." >}}

{{< callout type="tip" >}}
**TL;DR** — A saved shortcut for recurring invoices. Build a template once with the standard header fields and line items, then reference it whenever you need to raise the same invoice again.
{{< /callout >}}

If you raise the same type of invoice repeatedly — same branch, same currency, same line items, same remarks — a template lets you save that standard configuration in one place instead of re-entering it every time.

Typical uses: monthly IT support charges, recurring management fees, standard intercompany service billing.

### What a template stores

**Main Details tab** — the invoice header defaults:

| Field | Notes |
|-------|-------|
| **Template Code** | Required. A short identifier for this template (e.g., `MGMT-FEE-MO`). |
| **Template Name** | Required. A descriptive label (e.g., "Monthly Management Fee — KL Branch"). |
| **Branch / Location** | The default branch and location pre-filled on new invoices. |
| **Currency** | The default billing currency. |
| **Reference / Remarks** | Standard reference text or remarks that appear on every invoice of this type. |

**Lines tab** — you can also save standard line items into the template (e.g., the recurring service code and its standard price). These serve as a starting point — you can adjust quantities or amounts when the template is applied.

### How to use a template when creating an invoice

(currently not available because when creating an invoice it will take the user to edit component) When creating a new invoice, select the template from the template field on the create form. The saved header values are pre-filled automatically. Review and adjust any fields that differ for this specific invoice (e.g., a different reference number or date), then add or modify line items as needed.

### Managing templates

Templates can be edited and deleted after creation. Open the template from the listing, make changes in the Main Details or Lines tab, and click **Save**. To remove a template, use the **Delete** button (visible if enabled in Application Settings).

---

## File Import

### Listing

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-import-listing.png" alt="File Import Listing - history of bulk upload batches" caption="Import History: Reviewing the status and logs of previous bulk billing cycles." >}}

Shows all previously submitted import batches with their processing status.

### Upload (Create)

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-import-upload.png" alt="File Upload Interface - bulk processing via CSV" caption="Bulk Upload: The primary interface for high-volume invoice processing using standardized templates." >}}

Used for bulk billing cycles. The upload process:

1. Download the **Sample Format** first — this gives you the exact column structure the system expects. The file is named `Sales_Invoice_Master_Data_Template.csv`. The column definitions come from the backend, so always download a fresh copy rather than reusing an old one.
2. Choose your delimiter — **Pipe (`|`)** or **Comma (`,`)** — and make sure your CSV matches.
3. Populate the template with your invoice data and upload the file.
4. Click **SUBMIT** to queue the file for processing.

### Import Detail (Edit)

After submission, clicking an import batch shows:

**Details sub-tab** — read-only metadata: Process Status, Error Message, File Name, File Size, Import Format, Created By, Creation Date.

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-import-detail.png" alt="Import Detail View - validation metadata and processing status" caption="Import Audit: Detailed metadata and error logging for a specific bulk upload batch." >}}

{{< callout type="info" >}}
If the batch fails, check the **Error Message** field first — it identifies the specific row or value that caused the failure. Fix the file and re-upload rather than re-submitting the same file.
{{< /callout >}}

**Checking sub-tab** — line-by-line validation results showing which rows passed or failed, so you can identify and correct specific data issues before re-uploading.

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-import-checking.png" alt="Import Checking Sub-tab - line-by-line validation results" caption="Data Validation: Identifying specific row errors before final document generation." >}}

---

## Intercompany

{{< figure src="/images/internal-sales-invoice-no-stock-out-applet/invoice-no-stock-out-intercompany-reconciliation.png" alt="Intercompany Menu - matching cross-entity sales and purchases" caption="Intercompany Bridge: Reconciling internal sales with the corresponding purchase records in the receiving entity." >}}

{{< callout type="tip" >}}
**TL;DR** — When you invoice another entity within your own group, this menu shows the matched purchase document on their side and lets you reconcile both records.
{{< /callout >}}

When a no stock-out invoice is created for an intercompany transaction, the system can automatically generate a corresponding purchase document in the receiving entity. The Intercompany menu provides:
- Visibility into all cross-entity transactions linked to invoices in this applet
- Reconciliation status — whether both sides (the invoice and the matching purchase) are in sync
- Manual intercompany transaction handling for cases that cannot be auto-matched

---

## Settings

Accessed via the top navigation. All settings here are system-wide and affect all users of this applet.

### Application Settings

Field-level visibility and behavior configuration. Controls which tabs, fields, and buttons are shown or hidden. Key configurable areas:
- Which document number fields are visible (Tenant, Company, Branch, Client Doc 1–5)
- Which tabs appear on the create/edit form (Delivery Details, KO For, Department Hdr, ARAP, Posting, TraceDocument, Contra, Doc Link, Attachment, Export)
- Which line item price fields are visible (standard, net, UOM, transaction price, discount)
- Whether currency and foreign exchange fields are shown
- Whether the FINAL, DISCARD, and VOID buttons appear on the listing
- Whether printing and email sending are enabled
- Whether stock balance is shown on line items (visible for reference only — no deduction occurs)

### Default Selection

Sets system-wide default values pre-populated when creating a new document — Default Branch, Location, Company, and Price Book. Reduces data entry for teams that primarily work from a single branch.

### Printable Format Settings

Configures the print template used when generating invoice PDFs — layout, logo, footer text, and which fields appear on the printed document.

### Email Template

Configures the email template used when sending invoices to customers via the Send Email button on the listing.

### Permission Management

Controls who can perform which actions within the applet across four levels: Permission Set, User Permission, Team Permission, and Role Permission. A Permission Wizard is available to guide the initial setup.

A **Role Pricing Scheme Link** is also available — assigns specific pricing schemes to roles, so different user groups see different pricing when creating invoices.

### Webhook Configuration

Configures outgoing webhooks that fire on specific events — for example, notifying an external system when an invoice is finalized.

### Feature Visibility

Controls which features are visible to end users. Use to simplify the interface for specific user groups.

---

## Personalization

User-level customization. Unlike Settings (system-wide), Personalization applies only to the individual user.

### Personal Default Selection

Personal default values for Branch, Location, and Company — overrides the system-wide defaults from Settings for this user only.

### Sidebar Configuration

Controls which sidebar menu items appear and in what order for this user.

---

## Related Applets

The applet has no direct navigation links to other applets. The relationships below are confirmed from the frontend source code.

### Customer Applet

The customer entity on the Account tab is shared with the Customer Applet. This applet does not just read customers — it can also create and update customer records directly without leaving the invoice workflow. Credit terms, credit limits, billing address, and currency all come from the customer's master record.

### Accounts Receivable Applet

When the Contra tab is used, this applet writes contra entries that the AR Applet reads for aging, collection, and outstanding balance tracking.

### Intercompany — Internal Purchase Invoice & Purchase GRN Applets

This is the most significant downstream relationship. When an intercompany invoice is finalized, the system automatically:
- Creates a matching **Purchase Invoice** in the receiving entity
- Creates a matching **Purchase GRN** (Goods Received Note) in the receiving entity

Both documents are generated from this single invoice without any manual entry on the receiving side. The Intercompany menu in this applet provides visibility into those linked documents.

### Delivery / Jobs Applet

When items on an invoice go through the Pick Pack Queue and are marked Ready To Ship, the system creates a delivery job linked to the invoice lines. If the invoice is voided, those delivery jobs are cancelled automatically.

### Pricing Scheme Applet

When adding line items, the system determines the correct unit price based on the selected item and customer combination. Which pricing scheme applies depends on the role-level configuration set in Settings.

### Membership Applet

A loyalty or membership card can optionally be linked to the invoice when selecting a customer. This depends on whether membership features are enabled in your platform configuration.

### My E-Invoice Admin Applet

The VOID button is hidden when e-invoicing is enabled — the applet is aware of e-invoice submission state. Finalized invoices where e-invoice is required are submitted through the My E-Invoice Admin Applet, and the E-Invoice tab on the edit form tracks that submission status.

---

## FAQ

**Q: Can I use this applet for physical products if I do not want to track stock?**
A: Yes. If your business manages stock externally or does not require system-level inventory tracking, you can use this applet to bill for physical products without the system checking or deducting inventory levels.

**Q: How is tax handled?**
A: Tax logic (SST, GST, VAT) applies the same way as a standard invoice — calculated per line item based on the item's tax configuration and the customer's tax profile. The tax amount is posted to the tax authority account on finalization.

**Q: What is the difference between this applet and the standard Sales Invoice applet?**
A: The only functional difference is the stock deduction. Both produce the same financial output (AR, GL, tax). The standard Sales Invoice also triggers a GIN and reduces inventory. This applet does not. Use this one whenever no physical stock movement needs to be recorded in the system.

**Q: What happens when I VOID a finalized document?**
A: All financial postings are reversed — the AR entry is removed, the GL journal is reversed, and the tax entry is cancelled. The document returns to a state where it can be corrected and re-finalized.

**Q: Can I partially pay an invoice?**
A: Yes. Use the Settlement tab to record partial payments. The ARAP tab on the edit form shows the remaining outstanding balance after each payment is applied.

**Q: Why does the Posting tab show an error status?**
A: A posting error means the financial entry for that subsystem failed — usually due to a missing GL account mapping, a closed accounting period, or a tax configuration issue. The document stays in FINAL status but the affected posting must be investigated and re-triggered before the period can be closed.

**Q: Can I bulk-create invoices?**
A: Yes. Use the File Import menu. Download the sample template, populate it with your invoice data, and upload. The system validates each row and reports errors line by line before you commit the batch.
