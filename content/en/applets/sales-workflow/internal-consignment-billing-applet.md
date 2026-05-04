---
title: "Consignment Billing (Internal) Applet"
description: "Comprehensive financial system for converting consignment stock issues into final sales invoices and financial settlements"
tags:
- sales-workflow
- consignment-billing
- order-fulfillment
- finance
- accounts-receivable
weight: 50
---

{{< callout type="warning" >}}
**Work in Progress: This documentation is currently under development. Visual assets (screenshots) will be added soon.**
{{< /callout >}}

## Purpose and Overview

{{< callout type="tip" >}}
**TL;DR — Not an accountant? Read this first.**

**What is Consignment?** Think of it like a **vending machine that you own and place at someone else's location**. The machine is stocked with your products. The other party uses whatever they need from it. At the end of the month, you check what was taken and charge them only for that — nothing more. What they didn't take stays in the machine, ready for next month.

That arrangement is called **consignment**. Your stock sits at their location, still owned by you, until they actually take and use it. They don't pay upfront. They don't pay for what they don't use. You only invoice them for what was consumed.

This applet is the tool that generates that end-of-month invoice. It looks at what was physically sent out, matches it against what was consumed, and produces the formal charge. The remaining stock stays on record for the next billing cycle.

Without this applet, that billing step would be manual — spreadsheets, phone calls, and a high chance of billing the wrong quantity or missing a batch entirely.
{{< /callout >}}

**Where this applet fits in one line per step:**

| Step | Applet | What it does |
|------|--------|-------------|
| 1 | Consignment GRN | Supplier delivers — you sign for it and record it coming in |
| 2 | Consignment GIN | You send the stock out from your warehouse to the consignee |
| 3 | Customer Consignment | You track what's at the consignee's location, manage returns |
| 4 | **Consignment Billing** ← this applet | Consignee consumed some stock — you generate the invoice for it like a report |

The **Internal Consignment Billing Applet** is a specialized financial tool designed to manage the process of invoicing goods that have been previously issued on consignment. Once the customer has consumed some of that stock, this is where you record what was used and generate the invoice for it — the billing report for what was taken.

This applet converts Goods Issue Notes (GINs) — the records of stock that was physically sent out — into final sales invoices once the goods are confirmed as used or sold by the consignee. This ensures accurate financial recognition and keeps inventory records in sync with revenue.

{{< callout type="info" >}}
**Core Concept**: A **Consignment Billing** record is the financial finalization of a previous physical stock movement, moving the asset from "Consignment Out" to "Revenue" within the organization's ERP.
{{< /callout >}}

---

## Key Features Overview

### Who Benefits from This Applet?

**Sales Representatives & Account Managers:**
- Precise tracking of current consignment sales performance
- Accurate calculation of commissions and incentives based on finalized billing
- Visibility into which client-held stock is ready for invoicing
- Reduced friction in reconciling monthly sales reports from consignees

**Finance & Accounts Receivable Managers:**
- Automated conversion of physical GIN records into financial invoice documents
- Reliable aging and AR tracking for long-term consignment partners
- Improved month-end consolidation of inter-company or external consignment revenue
- Reduced manual effort through template-based and bulk billing tools

**Stock Controllers & Auditors:**
- Seamless visibility into the path from stock issue to final sale
- Complete audit trails of every consignment billing transaction
- Verification that billed quantities match previously issued consignment notes
- Prevention of duplicate billing or orphaned consignment stock records

### What Problems Does This Solve?

**The Consignment-to-Cash Gap Problem:**

Managing stock held by third parties or internal branches through consignment involves significant reconciliation challenges:
- Difficulty in tracking which specific physical issues (GINs) have been finalized as sales
- Discrepancies between physical consumption reports and final system invoicing
- Manual errors or delays in applying the correct contract price to consignment sales
- Lack of centralized visibility into the total outstanding consignment value
- Complex tax and currency conversion issues at the point of billing

**The Consignment Billing Solution:**

- **Direct GIN Mapping Engine** - Instant conversion of one or multiple consignment issues into a single invoice
- **Consumption-Based Billing** - Precise control over the volume of consignment stock being billed per cycle
- **Bulk Import Capabilities** - Efficiently process high-volume consignment cycles using standardized CSV templates
- **Integrated Audit Logic** - Every invoice is tied back to its original physical movement for complete traceability
- **Real-Time Financial Sync** - Automatically updates revenue, tax, and AR accounts upon document finalization

---

## Key Features

{{< cards >}}
  {{< card title="Billing Conversion" subtitle="Directly convert consignment issues into final sales invoices" link="#consignment-billing" >}}
  {{< card title="GIN-to-Invoice Link" subtitle="Maintain complete traceability to original stock movements" link="#issue-link-sub-tab" >}}
  {{< card title="Bulk File Import" subtitle="Upload large consignment billing cycles via CSV templates" link="#file-import-menu" >}}
  {{< card title="Financial Rules" subtitle="Automated tax and pricing application per billing cycle" link="#arap-tab" >}}
  {{< card title="Audit & Reporting" subtitle="Detailed history of consignment finalizations and settlements" link="#tracedocument-tab" >}}
  {{< card title="Permission Control" subtitle="Role and user-level access management per document action" link="#permission-management" >}}
{{< /cards >}}

---

## Key Concepts

### The Consignment Invoicing Framework

To manage the strategic transition from physical asset to revenue, the applet follows a structured logic:

| Stage | Action | Impact |
|-------|--------|--------|
| **Consignment GIN** | Physical stock issued to consignee. | Stock moves to "Transit/Consignment" location. |
| **Billing Cycle** | Consumption report received from consignee. | **Consignment Billing Applet** used to create invoice. |
| **Final Invoice** | Transaction finalized. | **Revenue recorded**, AR updated, Stock finalized. |

{{< callout type="tip" >}}
**Real-World Example**: A distributor issues RM 5,000 worth of parts to a service sub-contractor. Using this applet at the end of the month, they select the original GIN, tick the items the contractor has used, and the system automatically generates an invoice for the specific consumed amount while keeping the remaining stock in the consignment account.
{{< /callout >}}

### From Stock to Revenue

The system facilitates the financial culmination of an order:

```
Physical Supply Chain
│
├── Inventory Out ──→ Consignment Goods Issue Note (GIN)
│   │
│   └── Consignment Billing ──→ Financial Recognition & Invoicing
│       │
│       └── Settlement ──→ Payment received from Consignee
```

---

## Accounting Significance & Inter-Applet Flow

Understanding where this applet sits in the broader system is essential before using it.

### Document Chain

```
Internal Purchase Order Applet (purchase-workflow)
└── Purchase Order — formal order raised to supplier for consignment stock
        │
        ▼
Consignment GRN Applet (Internal)
└── Goods Received Note — stock received into your warehouse from supplier
        │
        ▼
Consignment GIN Applet (Internal)
└── Goods Issue Note (GIN) — stock issued out from your warehouse to consignee
        │
        ▼
Customer Consignment Applet
└── Transfer Out — stock tracked at the consignee's location
└── Transfer Receive — unsold stock returned to your warehouse
        │
        ▼
Internal Consignment Billing Applet  ← YOU ARE HERE
└── Consignment Billing Invoice — financial recognition of consumed stock
        │
        ├── AR Applet ──────── open receivable created against the consignee
        ├── GL / Journal ───── revenue and COGS entries posted
        ├── Tax Applet ─────── SST/VAT/GST computed and posted
        └── Cashbook / Payment — settlement recorded when consignee pays
```

{{< callout type="info" >}}
**Related Applets:**
- [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet) — the furthest upstream step. A Purchase Order is raised to the supplier before any stock arrives. There is no dedicated consignment PO applet — consignment stock procurement goes through the standard purchase order workflow.
- [Consignment GRN Applet (Internal)](/applets/inventory-workflow/internal-consignment-grn-applet) — records stock being **received into your warehouse** from the supplier against the PO. Without a GRN, there is no stock to issue.
- [Consignment GIN Applet (Internal)](/applets/inventory-workflow/internal-consignment-gin-applet) — records stock being **issued out from your warehouse** to the consignee. The GIN is the internal record this billing applet links back to when generating invoices.
- [Customer Consignment Applet](/applets/sales-workflow/customer-consignment-applet) — tracks the stock **at the consignee's location**, manages returns, and monitors what has been consumed vs what remains.
{{< /callout >}}

### Customer Consignment Applet vs Internal Consignment Billing Applet

These two applets are often confused because they both deal with consignment. The simplest way to think about it:

- **Customer Consignment Applet** — handles the **customer's side**. Tracks the stock that is sitting at their location, manages sending it out and getting it back. It's about knowing what the customer has.
- **Internal Consignment Billing Applet** — handles the **billing report**. Once the customer has used some of that stock, this applet is where you record what was consumed and generate the invoice for it. It's about charging for what was used.

The key distinction is **stock management vs billing**.

| | Customer Consignment Applet | Internal Consignment Billing Applet |
|---|---|---|
| **What it does** | Tracks stock at the customer's location | Generates the invoice for what the customer consumed |
| **Primary user** | Warehouse / logistics team | Finance / accounts receivable team |
| **Output document** | Transfer Out, Transfer Receive | Sales Invoice |
| **Financial impact** | None — no charges, no revenue posted | Full financial posting — revenue, AR, tax, COGS |
| **When to use** | When sending stock out or getting it back | When the customer reports consumption and you need to bill them |
| **Triggers** | Manual dispatch or scheduled transfer | End of billing cycle, consumption report received |
| **Links to** | Inventory / GIN records | AR, GL, Tax, Cashbook |

In practice, the workflow always goes in this order:

```
Customer Consignment Applet          Internal Consignment Billing Applet
─────────────────────────────        ────────────────────────────────────
1. Transfer Out                  →   (stock is now at customer's location)
2. Customer consumes stock       →   3. Consumption report received
                                     4. Create Consignment Billing
                                     5. Link GINs via Issue Link
                                     6. FINAL → invoice posted
7. Transfer Receive (returns)    ←   (unused stock comes back)
```

The Customer Consignment Applet answers: *"What stock does the customer have right now?"*
This applet answers: *"What did they use, and what do they owe us for it?"*

### What Happens Financially When a Record is Finalized

When a Consignment Billing document is set to **FINAL**, the system triggers all of the following simultaneously:

1. **Revenue is recognized** — the invoice amount is posted to the revenue GL account.
2. **Inventory is relieved** — the consignment stock quantity is removed from the consignment location and expensed as COGS.
3. **AR is opened** — an Accounts Receivable entry is created against the consignee entity for the invoice amount.
4. **Tax is computed and posted** — SST, VAT, or GST is calculated per line item and posted to the tax liability account.
5. **Cashbook entry is staged** — if a payment is attached, the cashbook is updated accordingly.

### Why the GIN Link Matters

A **GIN (Goods Issue Note)** is an internal warehouse record — purely for your own system — created the moment stock leaves your warehouse. It is not signed by the customer and is not a billing document. It simply tells your inventory system: *"this stock has left our shelves."*

In the vending machine analogy, it is the record of *"we loaded the machine with X items on this date."*

**Before GIN** — your system shows 100 units in stock
**GIN created** — 40 units issued out → your system now shows 60 units remaining

It serves three purposes:
1. **Reduces your stock balance** — so your warehouse count stays accurate
2. **Records who the stock went to** — so you know which consignee holds it
3. **Becomes the reference for billing** — when this applet creates an invoice, it links back to the GIN to prove the stock was genuinely dispatched

It is not the same as a Delivery Order (which the customer signs) or an invoice (which charges the customer). Think of it as the internal paper trail that sits behind both of those.

```
GIN            = "we sent it out"        → inventory record (internal)
Transfer Out   = "customer received it"  → delivery record
Consignment Billing = "they used it, here's the charge" → billing record
```

Each line item on a Consignment Billing must be linked back to its originating GIN via the **Issue Link** sub-tab. This linkage:
- Prevents double-billing the same consignment stock.
- Maintains a complete audit trail from physical movement to financial invoice.
- Allows partial billing — only the consumed portion of a GIN is billed; the remainder stays open for future billing cycles.
- Feeds the **TraceDocument** tab, which shows the full upstream and downstream document chain.

---

## Quick Start Guide

### For Sales: Finalizing Your Monthly Billings

**Goal:** Convert a consignee's sales report into a finalized system invoice.

1. **Navigate**: Go to **Consignment Billing** in the sidebar.
2. **Select Entity**: On the Account tab, choose the Consignee or Branch you are billing.
3. **Link Issues**: On each line item, open the **Issue Link** sub-tab and select the relevant GINs that match the current consumption report. Update quantity if only a partial billing is required.
4. **Review & Create**: Verify the total amount and taxes on the Line Items tab, then click **CREATE**. The system generates the invoice linked to those specific GINs.

### For Finance: Bulk Processing via Import

**Goal:** Process a wide range of consignment billings across multiple branches.

1. **Get Template**: Go to **File Import**, download the sample CSV template.
2. **Populate Details**: Fill in the GIN references, item codes, and billing quantities based on your consolidations.
3. **Upload & Verify**: Upload the file. The system validates that the GINs exist and are not yet fully billed. Check the **Checking** sub-tab for any row-level errors.
4. **Finalize All**: Return to the Consignment Billing listing, select the generated drafts, and click **FINAL** to post them all.

---

## Navigation Menu

The applet sidebar contains three main sections:

### Consignment Billing
The primary working area. Lists all consignment billing documents and is the entry point for creating new invoices. This is where the full create/edit lifecycle happens — from draft through to finalization and settlement.

### Line Items
A cross-document view of all line items across all consignment billing records. Useful for finance teams who need to audit or review individual billed items without opening each document header separately. Also used to identify line items with posting errors or missing Issue Links.

### File Import
Handles bulk creation of consignment billing records via CSV upload. Used when processing high-volume billing cycles — for example, end-of-month billing across multiple branches or consignees — where creating documents one by one is not practical.

---

## Consignment Billing

### Listing

The listing shows all consignment billing documents with their statuses. Multi-row selection is supported for bulk operations.

**Bulk action buttons available on the listing:**

| Button | Function | Visibility |
|--------|----------|-----------|
| **FINAL** | Finalizes selected draft documents, triggering all financial postings (AR, GL, inventory, tax). | `HIDE_GENDOC_FINAL_BUTTON` |
| **DISCARD** | Cancels selected draft documents without any financial impact. | `HIDE_GENDOC_DISCARD_BUTTON` |
| **VOID** | Reverses all financial postings on finalized documents. Used for corrections after finalization. | `HIDE_GENDOC_VOID_BUTTON` |
| **SINGLE/MULTIPLE PRINT** | Generates printable invoice output for selected records. | Active only if `PRINTABLE` is enabled in Application Settings |

---

### Create

Creates a new consignment billing document. The form is organized into tabs.

#### Main Details Tab

Captures the document header information that applies to the entire billing document.

| Field | Description | Hidden |
|-------|-------------|--------|
| **Branch** | Where this billing document originates — the branch that holds or issued the consignment stock. This is the *stock source*, not necessarily where the goods are being delivered to. Drives which inventory locations are available to select. | Always visible |
| **Location** | The specific inventory location within the Branch where the consignment stock is held. More granular than Branch — a branch can have multiple locations (e.g., Main Store, Cold Room, Overflow). | `HIDE_LOCATION` |
| **Delivery Branch** | The branch responsible for physically delivering the billed goods to the consignee. This can be different from the issuing Branch — for example, stock originates from KL Branch but is delivered by Penang Branch. | `HIDE_DELIVERY_BRANCH` |
| **Delivery Location** | The specific location within the Delivery Branch that handles the outgoing delivery. | `HIDE_DELIVERY_LOCATION` |
| **Purchaser / Sales Agent** | The internal staff member responsible for this billing. Label configurable via `salesManLabels`. | Always visible |
| **Transaction Date** | The official date of the billing transaction. This determines which accounting period the financial entries are posted to — important for month-end closing. Editable only if `SHOW_TRANSACTION_DATE` is active. | Always visible |
| **Credit Terms** | How long the consignee has to pay — e.g., Net 30 means payment is due within 30 days. Populated from the entity's master data after the entity is selected. Can be overridden per document. | Always visible |
| **Credit Limit** | The maximum outstanding balance allowed for this consignee. Also entity-driven. Used by finance to flag if this billing would push the consignee over their approved credit exposure. | Always visible |
| **Reference** | A free-text field to cross-reference an external document — typically the consignee's own consumption report number or their internal PO number, so both sides can match records. | Always visible |
| **Remarks** | Notes visible only internally. Does not appear on the printed invoice sent to the consignee. Use this for internal instructions or context. | Always visible |
| **External Remarks** | Notes that print on the invoice document sent to the consignee. Use this for delivery instructions, special conditions, or messages intended for the consignee. | Always visible |
| **Permit No** | A regulatory or customs permit number required for certain controlled goods. Only relevant in industries where goods movement requires a permit (e.g., pharmaceuticals, alcohol, chemicals). | `HIDE_PERMIT_NO` |
| **Base Currency** | The home currency of your company. Shown for reference when the document currency differs — helps staff see the base equivalent without switching screens. | `HIDE_BASE_CURRENCY` |
| **Currency / Currency Rate** | Used when billing a consignee in a foreign currency. The rate converts the foreign currency amounts back to your base currency for GL posting. The live rate button fetches the current market exchange rate automatically. | `HIDE_CURRENCY` |
| **Tracking ID** | A logistics or shipment tracking reference at the document level. Useful when the entire billing relates to a single shipment that can be tracked externally. | `HIDE_TRACKING_ID` |

**Document number fields** (Doc No Tenant / Company / Branch, Client Doc 1–5) are system-generated and read-only. Their individual visibility is configurable via `HIDE_SERVER_DOC_1/2/3` and `HIDE_CLIENT_DOC_1/2/3/4/5` in Application Settings.

**Apply to Lines** — appears in edit mode when Branch or Location is changed at the header level. Propagates the updated branch/location values down to all existing line items in one action, avoiding the need to edit each line individually.

---

#### Account Tab

Manages the consignee entity and address information. Contains three sub-tabs.

**Entity Details sub-tab**

Identifies who is being billed. The Entity ID field opens a searchable entity selector. Once an entity is selected, all other fields are auto-populated from the entity master record:

| Field | Description |
|-------|-------------|
| **Entity Id** | The consignee you are billing. Selecting this auto-populates all other fields on this tab and drives Credit Terms, Credit Limit, and document currency on the Main Details tab. |
| **Status** | Whether the entity is currently active. Billing an inactive entity may indicate a data issue worth checking before proceeding. |
| **Entity Type** | Whether this is an external customer, an internal branch, or an inter-company entity — affects how the financial entries are posted. |
| **Identity Type / ID Number** | The entity's official registration number (e.g., company registration, IC number). Used for tax and compliance purposes on the invoice. |
| **Currency** | The entity's default billing currency. This becomes the currency of the entire document — all line item amounts will be in this currency. |

**Bill To sub-tab**

The billing address for the invoice. Can be selected from the entity's registered addresses or manually overridden. This address appears on the printed invoice.

**Ship To sub-tab**

The delivery/shipping address. Separate from the billing address to support scenarios where goods are delivered to a different location than where the invoice is sent — common in consignment arrangements where the consignee has multiple sites.

---

#### Line Items Tab

Lists all items being billed in this document. Two running totals are shown at the top right:

- **Total Txn Amount** — the combined invoice value of all line items in the document currency. This is what the consignee will be charged before any payments or contras are applied.
- **Total SST/VAT/GST Amount** — the total tax computed across all lines. This is the tax portion that will be posted to the tax authority account on finalization.

**Landed Cost allocation** *(edit mode only)* — sometimes additional costs like freight, insurance, or handling need to be charged on top of the item prices. Enter the total landed cost amount, choose how to spread it across lines — **Quantity** (proportional to units), **Transaction Amount** (proportional to line value), or **Equal** (same amount to every line) — then **ALLOCATE** to preview the distribution and **CONFIRM** to apply it. This increases the billed amount on each line accordingly.

Clicking a line item row opens the **Add/Edit Item** form.

---

##### Add / Edit Item Form

When adding or editing a line item, the form has the following sub-tabs:

**Item Details sub-tab**

Contains its own nested sub-tabs:

- **Main Details** — item code, description, quantity, UOM, unit price, discount, tax configuration, and WHT configuration. The visible price fields are individually configurable via Application Settings (`HIDE_UNIT_PRICE_STD_*`, `HIDE_UNIT_PRICE_NET_*`, `HIDE_UNIT_PRICE_TXN_*`, `HIDE_UNIT_DISCOUNT`, `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, etc.).
- **Department** — cost center / department allocation for this specific line item, used for GL dimension posting at the line level.
- **Doc Link** *(edit mode only)* — shows documents linked to this specific line item, providing item-level traceability.
- **Delivery Details** — per-line delivery branch, delivery location, delivery type, and tracking ID. Overrides the header-level delivery settings for this line.

**Serial Number sub-tab** *(only shown if the item is serial-number tracked)*

Manages the specific serial numbers being billed. Validates that the serials were part of the original consignment issue, preventing billing of serials that were never issued to this consignee.

**Batch Number sub-tab** *(only shown if the item is batch-number tracked)*

Manages batch numbers for the billed quantity, maintaining batch-level traceability from issue to invoice.

**Bin Number sub-tab** *(only shown if the item uses bin-level tracking)*

Manages bin location assignments for the billed quantity.

**Costing Details sub-tab** *(hidden if `HIDE_COSTING_DETAILS` is enabled)*

Shows the cost breakdown for the line item — purchase cost, landed cost, and margin. Used for profitability analysis and COGS verification without leaving the billing document.

**Issue Link sub-tab**

This is the most critical sub-tab for consignment billing. It links this line item back to the originating Goods Issue Note (GIN) from the Inventory Applet.

The listing shows all GINs associated with this item for the selected consignee: Project, Issue Number, Issue Summary, Issue Description, Assignee, Created Date, Resolved Date, and Status.

Clicking a GIN row opens the **Edit Issue** form, which allows editing the Project and Issue Number reference and provides further sub-tabs — Details, Planning, Attachment, Comment, Subtasks, Linked Issues, Worklogs, and Activity — giving full traceability into the originating stock movement event.

Without a valid Issue Link, the billing cannot be traced back to a physical stock movement, breaking the audit trail and potentially allowing duplicate billing.

---

#### Delivery Details Tab

*(Hidden if `HIDE_DELIVERY_DETAILS_TAB` is enabled)*

Provides a bulk-apply interface for delivery information across all line items. Rather than editing each line individually, you set a value here and apply it to all selected lines at once:

| Field | Description |
|-------|-------------|
| **Tracking ID** | Logistics tracking reference applied to selected lines. |
| **Delivery Branch** | The branch handling delivery for selected lines. |
| **Delivery Type** | INTERNAL_DELIVERY, EXTERNAL_DELIVERY, or PICKUP — determines how the goods reach the consignee. |
| **Delivery Location** | The destination location for selected lines. |

The grid below shows the current delivery details per line item and supports inline editing for individual overrides.

---

#### Payment Tab

*(Hidden if `HIDE_MAIN_PAYMENT_TAB` is enabled)*

Records advance or partial payments against this billing document before or at the time of finalization.

- **Total Payment** — how much cash has already been received against this invoice. If the consignee paid a deposit upfront, it shows here.
- **Doc Open Amount** — what the consignee still owes in cash after deducting payments. This is the amount finance will chase for collection.
- **Doc ARAP Balance** — the final net balance after both payments and any contra entries are applied. This is the true outstanding amount on this document.

Each payment entry links to the Cashbook Applet, so the cash receipt is recorded in the bank account at the same time the AR balance is reduced.

---

#### KO For Tab

*(Hidden if `HIDE_KO_FOR_TAB` is enabled)*

**KO** stands for **Knock-Off** — an accounting term for linking a document to another document it is fulfilling or closing off.

Think of it this way: sometimes a Purchase Order or GRN was raised upstream, and this billing invoice is the document that fulfills or settles it. The KO For tab records that relationship — it says *"this invoice is knocking off (closing) that upstream document."* It does not copy or create new documents; it simply draws a line between this billing and the document it is settling against.

The document types available to knock off are controlled by the **Knock-Off Settings** in the Settings menu (Purchase GRN, Purchase Order, Purchase Requisition, Supplier Delivery Order).

---

#### Department Hdr Tab

*(Hidden if `HIDE_DEPARTMENT_HDR_TAB` is enabled)*

**Department Hdr** (Header) is deeper than Branch or Location. Branch and Location tell you *where* the transaction happened physically. Department tells you *which internal team or cost center owns the cost* of this transaction.

For example, a billing document might be issued from the KL Branch (Branch), from the Main Warehouse (Location), but the cost belongs to the Service Department (Department). This matters for internal management reporting — finance needs to know which department is responsible for the revenue and costs, not just which building it came from.

Setting the department here tags all the financial entries (GL postings) for this entire document to that department, so it shows up correctly in departmental P&L reports.

---

### Edit

The edit form contains all the same tabs as create, plus additional tabs that are only meaningful after a document exists in the system.

**Action buttons on the edit form:**

| Button | Function | Condition |
|--------|----------|-----------|
| **SAVE** | Saves changes to a draft document. Disabled if the user lacks update permission. | Always visible |
| **FINAL** | Finalizes the document, triggering all financial postings simultaneously. Irreversible without a VOID. | Document is in draft |
| **DISCARD** | Cancels the draft without any financial impact. | Document is in draft |
| **VOID** | Reverses all financial postings — AR entry removed, GL journal reversed, inventory reinstated to consignment account, tax entry cancelled, and GIN links released for re-billing. | Document is finalized |
| **RESET** | Reverts unsaved changes back to the last saved state. | Always visible |
| **DELETE** | Permanently deletes the record. Requires a second click to confirm. | Draft documents only |

#### Additional Edit-Only Tabs

**ARAP Tab** *(hidden if `HIDE_MAIN_ARAP_TAB` is enabled)*

**ARAP** stands for **Accounts Receivable / Accounts Payable** — the accounting term for money that is owed but not yet paid.

In plain terms: once this invoice is finalized, the customer owes you money. That unpaid amount is the "AR" (Accounts Receivable). This tab shows the current state of that debt — how much was invoiced, how much has been paid, and how much is still outstanding. All fields here are read-only and computed automatically by the system.

| Field | Description |
|-------|-------------|
| **Products & Services** | The gross invoice amount — the total value of goods billed. |
| **Settlement** | Total payments received against this invoice so far. |
| **Doc Open Amount** | The remaining unpaid balance (Products & Services minus Settlement). |
| **Contra** | Any contra entries applied — e.g., credit notes offset against this invoice. |
| **Outstanding** | The net amount the consignee still owes after all payments and contras. |

This tab is the primary reference for AR aging and collection follow-up.

**Posting Tab** *(hidden if `HIDE_POSTING_TAB` is enabled)*

Shows the system posting status for each financial subsystem after finalization. All fields are read-only:

| Field | Description |
|-------|-------------|
| **Journal Posting Status** | Whether the GL journal entry has been successfully posted. |
| **Inventory Posting Status** | Whether the inventory movement (consignment stock relief) has been recorded. |
| **Membership Points Posting Status** | Whether loyalty or membership points have been processed. |
| **Cashbook Posting Status** | Whether the cashbook entry has been recorded. |
| **Tax Posting Status** | Whether the tax entry has been filed to the tax module. |

If any status shows an error, it indicates a posting failure — usually due to a missing GL account mapping, a closed accounting period, or a tax configuration issue. The document remains in FINAL status but the affected posting needs to be investigated and re-triggered.

**TraceDocument Tab** *(hidden if `HIDE_TRACE_DOCUMENT_TAB` is enabled)*

Displays the full document chain for this billing record — both upstream (the GINs and stock movements that led to this invoice) and downstream (any credit notes, payments, or other documents generated from it). This is the primary tool for auditors tracing a transaction end-to-end across the system.

**Contra Tab** *(hidden if `HIDE_MAIN_CONTRA_TAB` is enabled)*

**Contra** is an accounting term for offsetting one document against another to reduce what is owed — without an actual cash payment changing hands.

The most common scenario: the customer has a credit note from a previous return or overpayment. Instead of paying the full invoice amount in cash, you agree to apply that credit note against this invoice. The credit note and the invoice partially cancel each other out. The customer then only pays the difference.

This is different from a regular payment (cash received) — contra is a paper offset between two existing documents.

This tab manages those offsets and shows:

- **Total Contra** — sum of all contra amounts applied to this invoice.
- **Doc Open Amount** — the invoice balance before contra is applied.
- **Doc ARAP Balance** — the net balance after contra, which is what the customer actually still owes in cash.

Each contra entry links to the originating credit or debit document in the respective applet, maintaining a two-sided audit trail.

**Doc Link Tab** *(hidden if `HIDE_DOC_LINK_TAB` is enabled)*

Shows the document linkage chain with two sub-tabs:

- **Copy From** — documents that were used as the source when creating this billing (e.g., a GIN or a previous draft that was copied forward).
- **Copy To** — documents that were created from this billing as a source (e.g., a credit note raised against this invoice).

**Attachment Tab** *(hidden if `HIDE_ATTACHMENT_TAB` is enabled)*

Stores supporting documents for this billing record — consignee consumption reports, signed delivery notes, approval emails, etc. Attachments are stored against the document and accessible to all users with view permission.

**Export Tab** *(hidden if `HIDE_EXPORT_TAB` is enabled)*

Provides data export options for this document — useful for sending billing data to external accounting systems or generating custom reports outside the ERP.

---

## Line Items Menu

A standalone listing of all line items across all consignment billing documents. This view is used by finance teams to:
- Audit billed quantities against original GIN quantities across multiple documents.
- Filter and review items by product, entity, or date range without navigating into individual billing headers.
- Identify line items with posting errors or missing Issue Links.

---

## File Import Menu

### Listing

Shows all previously submitted import batches with their processing status. Clicking a row opens the import detail view.

### Upload (Create)

Used for bulk billing cycles. The upload process:

1. Select the **Delimiter** (comma, semicolon, etc.) that matches your CSV file format.
2. Upload the CSV file via drag-and-drop or file picker. Only `.csv` files are accepted.
3. Download the **Sample Format** link to get the correct column structure before preparing your file. The template (`MasterData_Upload_InternalPurchaseInvoice.csv`) defines the required columns — GIN references, item codes, quantities, entity IDs, and billing dates.
4. Click **SUBMIT** to queue the file for processing.

### Import Detail (Edit)

After submission, clicking an import batch shows:

**Details sub-tab** — read-only metadata about the upload:

| Field | Description |
|-------|-------------|
| **Process Status** | Whether the batch is still being processed, completed successfully, or failed. Check this first after submitting — if it shows failed, look at the Error Message before re-uploading. |
| **Error Message** | The specific reason the batch failed — e.g., a GIN reference that doesn't exist in the system, a line that would duplicate an already-billed quantity, or an entity ID that can't be found. Fix the CSV based on this message before re-uploading. |
| **File Name / File Size** | The uploaded file details for reference. |
| **Import Format** | The format detected from the uploaded file. |
| **Created By / Creation Date** | Who submitted the import and when. |

**Checking sub-tab** — a line-by-line validation result showing which rows passed or failed, allowing the user to identify and correct specific data issues before re-uploading.

---

## Configuration & Settings

Accessed via the top navigation bar. All settings here are system-wide and affect all users of this applet.

### Default Selection

Sets the system-wide default values pre-populated when creating a new document:
- **Default Branch** — the branch pre-selected on the Main Details tab for all new documents.
- **Default Location** — the inventory location pre-selected within that branch.

These defaults reduce data entry time for teams that primarily work from a single branch.

### Application Settings

Field-level visibility and behavior configuration. This is where administrators control which tabs, fields, and buttons are shown or hidden across the entire applet. Key configurable areas:

- Which document number fields are visible (Tenant, Company, Branch, Client Doc 1–5).
- Which tabs are shown on the create/edit form (Delivery Details, Payment, KO For, Department Hdr, ARAP, Posting, TraceDocument, Contra, Doc Link, Attachment, Export).
- Which line item price fields are visible (standard, net, UOM, transaction price, discount fields).
- Whether currency and foreign exchange fields are shown.
- Whether costing details are shown on line items.
- Whether the FINAL, DISCARD, and VOID buttons appear on the listing.
- Whether printing is enabled.
- Custom status fields — up to 5 header-level and 5 line-level custom statuses for workflow tagging.

### Printable Format Settings

Configures the print template used when generating invoice PDFs. Controls layout, logo, footer text, and which fields appear on the printed document sent to the consignee.

### Knock-Off Settings

Controls which upstream document types can be knocked off by or for this applet:

**Knock Off BY** — document types that this billing can knock off (settle against):
- Purchase GRN
- Purchase Order
- Purchase Requisition
- Supplier Delivery Order

**Knock Off FOR** — document types that can knock off this billing:
- Purchase GRN
- Purchase Order
- Purchase Requisition
- Supplier Delivery Order

---

## FAQ

**Can I bill a GIN partially across multiple months?**
Yes. The Issue Link tracks the remaining unbilled balance of every GIN. You can link a GIN and bill only a portion of the quantity; the remainder stays available for future billing cycles.

**What if the pricing has changed since the original consignment was issued?**
The billing phase allows you to apply current or contract prices independently of the price used on the original stock movement. The GIN link preserves the physical quantity reference while the billing document controls the financial value.

**Can I see which GINs are still outstanding?**
Yes. The Issue Link sub-tab on each line item shows all GINs for the selected consignee, including their status. Partially billed GINs remain visible and available for selection in future billing cycles.

**What happens if I VOID a finalized document?**
All financial postings are reversed — the AR entry is removed, the GL journal is reversed, the inventory is reinstated to the consignment account, the tax entry is cancelled, and the GIN links are released, making those quantities available for re-billing.

**Does it support inter-company consignments?**
Yes. If the consignee is an internal entity in another company within the same system, the applet can generate a corresponding purchase record in the receiving company automatically, creating a matched inter-company transaction pair.

**Why does the Posting tab show an error status?**
A posting error means the financial entry for that subsystem failed — usually due to a missing GL account mapping, a closed accounting period, or a tax configuration issue. The document remains in FINAL status but the affected posting needs to be investigated and re-triggered before the period can be closed.
