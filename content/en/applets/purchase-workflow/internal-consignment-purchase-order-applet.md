---
title: "Internal Consignment Purchase Order Applet"
description: "User guide for consignment purchase orders: stock placement agreements, consignor ownership, listing and create/edit workflow, and how this differs from a standard purchase order."
tags:
- purchase-workflow
- procurement
- consignment
- purchase-order
- supplier-management
- line-items
- inventory
weight: 18
date: 2026-05-06
lastmod: 2026-06-24
draft: false
---

## Purpose and overview {#purpose-and-overview}

**Internal Consignment Purchase Order** records the **request and agreement** for consignment stock placement with a consignor (supplier). It is **not** the same as committing to buy goods the way a standard purchase order does.

The window title is **Internal Consignment Purchase Order Applet**. The listing screen is **Consignment Purchase Order Listing**.

{{< callout type="info" >}}
**Core concept:** This applet links **who** consigns stock (consignor on **Account**), **what** you are requesting (**Lines**), **how** you plan to receive it (**Delivery Details**, **KO For** from prior documents), and **when** terms apply (**Main Details** validity and **Payment** terms for **future** settlement—not an immediate payment on the PO itself). In consignment, the **consignor usually keeps ownership** even after goods arrive at your site; ownership transfer and payment follow your policy and linked documents such as [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/) (receipt) and [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) (settlement).
{{< /callout >}}

### How this document compares to a standard purchase order

| Document | What it is for | When you use it |
|----------|----------------|-----------------|
| [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | **Commitment to buy**—your organisation expects to take ownership and pay under normal purchase terms | Standard purchasing when you are buying stock or services |
| **Consignment Purchase Order (this applet)** | **Agreement for consigned stock**—requested quantities, terms, and receiving references while the consignor keeps ownership | When stock is placed with you on consignment terms |
| [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) | **Consignor settlement**—billable quantities and amounts after usage or settlement triggers | After consignment activity in a billing period—not when you create the PO |

### Where consignment fits in your process

| Stage | Purpose |
|-------|---------|
| **Consignment Purchase Order (this applet)** | Define requested consignment stock, terms, and references |
| [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/) | Record physical receipt of consigned goods |
| Consumption / sales activity | Determine what was used or sold (per your policy) |
| [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) | Record billable quantity and settlement amounts |
| Payment | Settle the billed amount per your credit terms |

**What triggers payment?** Your finance and operations teams define this—typically after usage, consumption, or an approved billing cycle—not simply because goods arrived on site.

### Where to work in the menu

- **Consignment Purchase Order** — listing, create, and edit in a split-pane layout.
- **Line Items** — cross-document line workspace when you need line-level review.
- **File Import** — bulk create or update when your administrator enables it.
- **Settings** and **Personalization** — defaults, fields, print formats, permissions, and layout (administrators and users respectively).

---

## Document status reference {#document-status-reference}

This applet uses **two status dimensions**:

- **Record status** (for example **ACTIVE** / **INACTIVE**) — whether the header is treated as a live working record.
- **Posting status** (**DRAFT**, **FINAL**, **VOID**) — whether the document is still editable, posted and locked, or voided.

| Posting status | Typical record status | Meaning | What you can do |
|----------------|----------------------|---------|-----------------|
| **DRAFT** | **ACTIVE** | Work in progress | **CREATE** or **UPDATE**, edit fields, add/remove **Lines**, use **KO For** |
| **FINAL** | **ACTIVE** | Posted / locked | **VIEW**, **PRINT**, **EXPORT**, **VOID** (from listing), link downstream receiving documents |
| **VOID** | **ACTIVE** | Reversed posted document | Read-only; indicates the posted order was voided through allowed action |

{{< callout type="warning" >}}
After **FINAL**, the consignment purchase order is locked for normal editing. Header fields and **Lines** are usually read-only. If a formal amendment is required (for example quantity, validity, or payment terms), the usual options are to **VOID** the order and create a replacement, or follow your organisation's amendment process—contact your administrator for the approved procedure.
{{< /callout >}}

**Listing actions** (toolbar on **Consignment Purchase Order Listing**): **PRINT**, **FINAL**, **DISCARD**, **VOID**, **SEND EMAIL** (with **Printable Format** and **Email Template** when configured). **FINAL** and **VOID** apply to **selected rows**—only eligible **DRAFT + ACTIVE** or **FINAL + ACTIVE** rows are processed.

---

## Before you begin {#before-you-begin}

- You need a **supplier (consignor)** in master data—you select it on **Account** → **Entity Details**. If missing, ask your administrator to add it.
- Prepare **Lines** you will source on consignment—product codes, planned quantities, delivery windows, and reference pricing.
- Know your company's **consignment terms**: holding period, billing frequency, and settlement method.
- Have **Company**, **Branch**, and **Location** ready—**Branch** is required on the document.
- If your company uses **Department Hdr**, **Contra**, or custom status tabs, confirm they are enabled for your login.
- Check permissions: can you **create**, **update**, **finalize**, and **void** consignment orders?

{{< callout type="info" >}}
Field labels, mandatory markers, and hidden tabs follow **Field Settings** and **Feature Visibility** set by your administrator. If a field or tab this guide mentions is missing, ask an administrator rather than assuming you are on the wrong screen.
{{< /callout >}}

---

## Who uses this applet

| Role | Main responsibility |
|------|---------------------|
| **Procurement** | Create consignment stock **requests**—header, consignor, requested lines, validity, and delivery expectations |
| **Warehouse / receiving** | Receive consigned goods and confirm quantities against the agreement (GRN or delivery documents) |
| **Inventory / operations** | Track consigned stock on hand, usage, and reconciliation with requested quantities |
| **Finance / Accounts Payable** | Process **consignor settlement** via Consignor Purchase Billing when billable quantities are determined |
| **Administrator** | **Settings** / **Personalization**: defaults, printable formats, field visibility, permissions |

**Procurement** typically works **Main Details**, **Account**, **Lines**, optional **KO For**, **Delivery Details**, and **Payment**, then requests **FINAL** from the listing when terms are confirmed.

**Warehouse** uses linked [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/) or [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) to record receipt against this order.

**Finance** reviews terms for planning; actual payment runs through [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/)—not when the PO is first created.

---

## Key features overview

{{< cards >}}
{{< card title="Purpose and workflow" subtitle="Consignment agreement vs standard PO" link="#purpose-and-overview" >}}
{{< card title="Status and posting" subtitle="DRAFT, FINAL, VOID, and listing actions" link="#document-status-reference" >}}
{{< card title="Quick start" subtitle="Create, update, and finalize" link="#quick-start-guide" >}}
{{< card title="Listing" subtitle="Search, FINAL, VOID, print, email" link="#consignment-purchase-order-listing" >}}
{{< card title="Main Details" subtitle="Header, validity, purchaser, terms" link="#main-details-tab" >}}
{{< card title="Account" subtitle="Consignor entity, bill-to, ship-to" link="#account-tab" >}}
{{< card title="Lines" subtitle="Requested items and reference pricing" link="#lines-tab" >}}
{{< card title="KO For" subtitle="Pull lines from prior documents" link="#ko-for-tab" >}}
{{< card title="Payment" subtitle="Future settlement terms" link="#payment-tab" >}}
{{< card title="Save and finalize" subtitle="CREATE, UPDATE, FINAL, VOID" link="#save-finalize-and-reset" >}}
{{< card title="File Import" subtitle="Bulk upload when enabled" link="#file-import" >}}
{{< card title="Settings (admin)" subtitle="Defaults, formats, permissions" link="#configuration-and-settings" >}}
{{< card title="FAQ" subtitle="Common questions" link="#frequently-asked-questions" >}}
{{< card title="Glossary" subtitle="Terms used in this guide" link="#glossary" >}}
{{< /cards >}}

{{< figure src="/images/internal-consignment-purchase-order-applet/internal-consignment-purchase-order-applet-overview-infographic.png" alt="Internal Consignment Purchase Order Applet overview showing supplier-owned stock, planned delivery, knock-off from prior documents, and deferred billing" caption="From consignor-owned stock to settled consumption: a consignment workflow that tracks the agreement, receiving, and settlement in linked documents." >}}

### What problems this solves

Without a structured consignment purchase order, teams often rely on ad hoc agreements—spreadsheets, email, or verbal terms. That makes it hard to know when goods arrived, what quantities are on hand, who owns what, when to pay, or what the holding cost is.

This applet provides:

- **Single source of truth** for each consignment **agreement**—header, consignor account, and requested lines
- **Clear ownership model**—receiving goods does not by itself mean you have bought them
- **Planned delivery** via **Delivery Details** so warehouse knows when to expect consigned stock
- **Upstream knock-off** via **KO For** to pull lines from blanket consignment PO, quotation, or requisition
- **Terms for future settlement** via **Payment** and **Credit Terms**—not payment for the full holding upfront
- **Audit trail** via **TraceDocument** and linked downstream records

---

## Key concepts

### The consignment framework: who, what, how, when

| Question | Answer | In this applet |
|----------|--------|-----------------|
| **Who?** | Which consignor is placing stock with us? | **Account** tab: **Entity Details**, **Bill To**, **Ship To** |
| **What?** | Which products and **requested quantities**? | **Lines** tab: item codes, quantities, UOM, reference unit pricing |
| **How?** | How will stock be received and sourced? | **Delivery Details**, **KO For** (lines from prior documents), downstream GRN |
| **When?** | When do terms apply and when is settlement due? | **Main Details** (validity), **Payment** (credit terms for **future** settlement), [Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) |
| **How much?** | Planning value and allocation | **Lines** (reference pricing × requested qty); **Department Hdr** and **ARAP** when enabled |

**KO For vs downstream matching:** The **KO For** tab on this PO is for **building** the order—pulling open lines from a **Blanket Consignment Purchase Order**, **Purchase Quotation**, or **Purchase Requisition**. Matching **requested**, **received**, and **billed** quantities over time happens in linked [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/), and [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/)—not on a separate reconciliation tab in this applet.

---

## Quick start guide {#quick-start-guide}

**Goal:** Create a consignment purchase order and post it when terms are confirmed.

1. Open **Consignment Purchase Order** from the sidebar. On **Consignment Purchase Order Listing**, click **Create** (`+`). The listing stays on the left; the create pane opens on the right.
2. **Main Details** — Set **Company**, **Branch** (required), **Location** if used, **Transaction Date**, **Validity**, **Purchaser**, and **Credit Terms** (for **future settlement** after consignor billing). Add **Reference** and **Remarks** as needed.
3. **Account** — Open **Entity Details** and select the consignor (**Entity Id** is required). Confirm **Bill To** and **Ship To** sub-tabs.
4. **Lines** — Click **Create** (`+`) on the line grid. In **Select Item**, use **Search Item** (or another enabled source), complete item details, and **ADD** each line. You need **at least one line** before **CREATE** is enabled.
5. Optional: **KO For** — Pull lines from a blanket consignment PO, quotation, or requisition when your process starts from an upstream document.
6. Optional: **Delivery Details** — Set **Tracking ID**, **Delivery Type**, **Delivery Branch**, **Delivery Location**, and **Apply to Lines** when your team uses planned receipt.
7. Optional: **Payment** — Add payment lines when finance records settlement on the PO (**Settlement Method**, **Date**, **Paid Amount**); credit terms for future billing are usually on **Main Details**.
8. Click **CREATE** to save the new order. A success message appears and the row shows in the listing with posting status **DRAFT**.
9. To change a saved order, select the row—**Edit Consignment Purchase Order** opens. Click **UPDATE** after edits.
10. When terms are confirmed, select the row(s) on the listing and click **FINAL**. Posting status becomes **FINAL** and the order is locked for normal editing.

{{< callout type="tip" >}}
**FINAL is on the listing**, not on the edit pane header. Use **UPDATE** to save draft changes; use **FINAL** from the listing when the order is ready to post.
{{< /callout >}}

### Workflow paths

**Path A: Buyer drafts, manager finalizes**

1. Buyer clicks **Create**, completes **Main Details**, **Account**, and **Lines**, then **CREATE**.
2. Buyer notifies the manager (email, **SEND EMAIL** from listing, or your internal process).
3. Manager reviews the order in **Edit Consignment Purchase Order**.
4. Manager selects the row on the listing and clicks **FINAL**.

**Path B: Buyer creates and finalizes**

1. Buyer completes all required tabs and clicks **CREATE**.
2. Buyer selects the row and clicks **FINAL** immediately so the consignor can ship per **Validity** and **Delivery Details**.

---

## Consignment Purchase Order Listing {#consignment-purchase-order-listing}

Use **Consignment Purchase Order Listing** to search, open, post, void, print, and email orders.

**Typical columns:** **Doc Short Code** (`INTERNAL_PURCHASE_CONSIGNMENT_ORDER`), **Doc No (Tenant)**, **Doc No (Company)**, **Doc No (Branch)**, plus supplier, dates, and status fields your administrator exposes.

**Main actions:**

| Action | When to use |
|--------|-------------|
| **Create** (`+`) | Start a new order in the right-hand pane |
| **FINAL** | Post selected **DRAFT + ACTIVE** rows |
| **VOID** | Reverse selected **FINAL + ACTIVE** rows when policy allows |
| **DISCARD** | Discard eligible draft work per your process |
| **PRINT** / **SEND EMAIL** | Share the order with the consignor using **Printable Format** and **Email Template** |
| Row click | Open **Edit Consignment Purchase Order** |

Multi-select rows and click **FINAL** once to post several orders—only eligible rows are processed.

---

## Detailed walkthrough {#detailed-walkthrough}

Document tabs (exact labels on create/edit screens): **Main Details**, **Account**, **Lines**, **KO For**, **ARAP**, **Delivery Details**, **Payment**, **Department Hdr**, **TraceDocument**. Additional tabs such as **Contra**, **Doc Link**, **Attachments**, **Export**, or **Status** may appear when your administrator enables them.

### Main Details tab {#main-details-tab}

**Purpose:** Set the order header, validity window, and purchaser information.

{{< figure src="/images/internal-consignment-purchase-order-applet/main-details.png" alt="Main Details tab for Internal Consignment Purchase Order showing company, branch, transaction date, validity, purchaser, and credit terms" caption="Main Details: define the order header, validity period, and purchaser before adding lines." >}}

**Fields to complete:**

- **Company** — Your legal entity (usually defaulted by login branch).
- **Branch** — Operational branch placing the order (**required**).
- **Location** — Warehouse or plant location when your organisation uses it.
- **Transaction Date** — Date you issue this consignment order to the consignor.
- **Purchaser** — Staff member responsible for this order (routing and audit trail).
- **Validity** — Start and end dates for when this consignment arrangement is active.
- **Credit Terms** — When you pay **after consignor billing** for billable quantities—not an upfront payment for the full consignment holding. These terms apply when [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) records settlement.
- **Reference** — External reference (RFQ, requisition ID, internal case number).
- **Remarks** / **External Remarks** — Internal notes vs consignor-visible notes.
- **Base Currency** and **Currency** — When consignment is priced in foreign currency, select currency and **Currency Rate**.
- (Optional) **Client Document** fields, **Permit No**, **Tracking ID** — When your workflow requires them.

{{< callout type="info" >}}
**Tip:** Set **Validity** to match your consignment arrangement. Validity helps warehouse and finance manage aging consignment holdings.
{{< /callout >}}

### Account tab {#account-tab}

**Purpose:** Select the consignor and confirm billing and shipping details.

Sub-tabs: **Entity Details**, **Bill To**, **Ship To**.

{{< figure src="/images/internal-consignment-purchase-order-applet/account-tab.png" alt="Account tab for Internal Consignment Purchase Order showing supplier selection and billing and shipping addresses" caption="Account: choose the consignor on Entity Details and confirm bill-to and ship-to information." >}}

**Entity Details:**

- Select the **consignor** (**Entity Id** is required). Only suppliers in **Master Data** appear. If the supplier is missing, ask your administrator to add it before you proceed.

**Bill To:**

- Where the consignor sends **settlement or billing documents** for billable consignment quantities. Usually auto-populated from the supplier master—confirm or override address fields.

**Ship To:**

- Where consigned goods will be delivered. May differ from bill-to when goods go to warehouse while settlement documents go to accounts payable.

(Optional) **Delivery Branch** and **Delivery Location** on other tabs or header may route receiving documents when your company uses them.

### Lines tab {#lines-tab}

**Purpose:** Add the products or services you are taking on consignment.

{{< figure src="/images/internal-consignment-purchase-order-applet/line-items-tab.png" alt="Lines tab for Internal Consignment Purchase Order showing item selection and quantity and pricing entry" caption="Lines: add consigned products, quantities, reference pricing, tax, and remarks for each line." >}}

**To add a line:**

1. Click **Create** (`+`) on the **Lines** grid.
2. **Select Item** opens—commonly **Search Item**; other sources may appear when enabled.
3. Complete item details:
   - **Quantity** — Units you expect to receive on consignment (requested quantity).
   - **UOM** — Unit of measure (EA, BOX, KG, etc.).
   - **Unit Price** — Consignor's **reference price** for planning. Line total = requested quantity × unit price. **Final payable amounts** are determined at **Consignor Purchase Billing**—not necessarily from this line alone.
   - **Discount** / **Tax** — When applicable.
   - (Optional) **Remarks** on the line.
4. Click **ADD** to attach the line.

The grid shows **Item Code**, **Item Name**, line amounts, and summary totals such as **Total Txn Amount** and **Total SST/VAT/GST Amount** when pricing columns are visible for your role.

**Repeat** for each consigned product. At least **one line** is required before **CREATE**.

### KO For tab {#ko-for-tab}

**Purpose:** Pull lines or quantities from **upstream documents** when building this order—so you do not re-key items from a blanket consignment PO, quotation, or requisition.

{{< figure src="/images/internal-consignment-purchase-order-applet/KO-tab.png" alt="KO For tab for Internal Consignment Purchase Order showing knock-off from prior documents" caption="KO For: select a source document and use KNOCK OFF to bring lines into this consignment PO." >}}

**Sub-tabs** (when enabled): **Blanket Consignment Purchase Order**, **Purchase Quotation**, **Purchase Requisition**.

**Typical flow:**

1. Open the sub-tab that matches your source document.
2. Search and select the document.
3. Click **KNOCK OFF** to import open lines into this order.
4. Review and adjust quantities on **Lines** before **CREATE** or **UPDATE**.

Use **DELETE** on the KO For grid to remove a linked source row before knock-off is complete, when your process allows.

{{< callout type="info" >}}
**Not downstream reconciliation:** **KO For** does **not** show received vs billed matching for goods already on consignment. That tracking happens in [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/), and [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/).
{{< /callout >}}

### Payment tab {#payment-tab}

**Purpose:** Record **payment lines** and view settlement balances for this consignment order—normally used when finance applies payment against the document per your process, not as upfront payment for the full requested quantity on **CREATE**.

{{< figure src="/images/internal-consignment-purchase-order-applet/payment-tab.png" alt="Payment tab on Edit Consignment Purchase Order showing payment grid, totals, and Add Payment panel with Settlement Method" caption="Payment: view Total Payment, Doc Open Amount, and Doc ARAP Balance; use Add (`+`) to open Add Payment and choose Settlement Method." >}}

**On the Payment tab you see:**

- **Payment grid** — Columns such as **Payment Method**, **Date**, and **Paid Amount** for each payment line (empty until lines are added).
- **Summary totals** — **Total Payment**, **Doc Open Amount**, and **Doc ARAP Balance** above the grid.
- **Add** (`+`) — Opens **Add Payment** in the side panel.

**To add a payment line:**

1. Click **Add** (`+`) on the **Payment** tab.
2. In **Add Payment**, select **Settlement Method** (for example bank transfer, cheque, or other methods your organisation lists).
3. Complete required fields for that method (for example **Date**, **Paid Amount**, and any method-specific references).
4. Click **ADD** on the payment form, then **UPDATE** on the document to save.

Credit terms for **future consignor billing** are usually set on **Main Details** (and may mirror on this tab depending on your field settings). **Payment lines** here record how settlement was applied when your finance team uses this tab on the PO.

{{< callout type="info" >}}
**Tip:** Creating this consignment PO does **not** by itself create a payment obligation for the full requested quantity. Many teams process settlement through [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) and add payment lines there; use this **Payment** tab when your process records payment on the consignment PO itself.
{{< /callout >}}

### Delivery Details tab {#delivery-details-tab}

**Purpose:** Set planned delivery and receiving context.

{{< figure src="/images/internal-consignment-purchase-order-applet/delivery-details-tab.png" alt="Delivery Details tab for Internal Consignment Purchase Order showing delivery branch, location, and tracking fields" caption="Delivery Details: record delivery type, branch, location, and tracking for consigned stock." >}}

**Fields to configure:**

- **Tracking ID**, **Delivery Type**, **Delivery Branch**, **Delivery Location** — Each may offer **Apply to Lines** to push values to line rows.
- **Planned Notification Schedule (PNS)** — When enabled, expected delivery dates and quantities per shipment during the validity window.
- **Delivery Instructions** — Special handling notes for warehouse and consignor.

### ARAP tab

**Purpose:** Accounts receivable / accounts payable posting view for finance. Informational for most users—your finance team manages posting entries linked to the order and downstream settlement.

### Department Hdr tab

**Purpose:** Allocate the consignment holding to cost dimensions (**Segment**, **Profit Center**, **Project**, etc.) when your organisation uses department headers on purchase documents.

### TraceDocument tab

**Purpose:** View financial and posting trace for the order.

{{< figure src="/images/internal-consignment-purchase-order-applet/trace-document-tab.png" alt="TraceDocument tab for Internal Consignment Purchase Order showing posting history" caption="TraceDocument: inspect posting history and linked financial transactions." >}}

Sub-tabs may include **Journal Txn**, **Cashbook Txn**, **Tax Txn**, **Inv Txn**, and related views. Use this for compliance audits and finance dispute resolution—not for quantity knock-off against GRN (see linked receiving and billing applets).

### Conditional tabs

Depending on **Feature Visibility** and **Field Settings**, you may also see:

- **Contra** — Adjustments or offsets with consignor approval
- **Doc Link** — Link requisitions, quotations, or related documents
- **Attachments** — Upload quotations, approvals, or contracts
- **Export** — PDF or other export when printable formats are configured
- **Status** — Custom workflow status when enabled

### Save, finalize, and reset {#save-finalize-and-reset}

These actions are part of the main document workflow—not a separate process.

| Button / action | Screen | Purpose |
|-----------------|--------|---------|
| **CREATE** | Create pane | First save of a new order (**DRAFT** posting status). Enabled when **Main Details**, valid **Account**, and at least one **Line** are complete. |
| **UPDATE** | Edit pane | Save changes to an existing **DRAFT** order. |
| **RESET** | Create or Edit pane | Discard unsaved form changes and reload the last saved state. |
| **FINAL** | **Listing** toolbar | Post selected **DRAFT + ACTIVE** orders—locks header and lines for normal editing. |
| **VOID** | **Listing** toolbar | Reverse eligible **FINAL + ACTIVE** orders when policy allows. |
| **DISCARD** | **Listing** toolbar | Discard draft work per your organisation's rules. |

**After FINAL:**

- Header and **Lines** are read-only in most setups; minor fields (for example **Remarks**) may still be editable depending on configuration.
- The consignor can ship per **Validity** and **Delivery Details**.
- Receiving staff use linked GRN or delivery documents; finance uses Consignor Purchase Billing for settlement.

If you discover an error after **FINAL**:

1. **VOID** the order from the listing (when allowed) and create a corrected replacement, or
2. Use **Contra** when your process and consignor agreement allow adjustments, or
3. Follow your organisation's formal amendment procedure—ask your administrator.

---

## Line Items workspace

The sidebar **Line Items** entry opens a cross-document line listing. Use it when you need to search or review individual consignment PO lines across many orders without opening each header document.

---

## File Import {#file-import}

When **File Import** appears in your sidebar, administrators have enabled bulk upload for consignment purchase orders.

Typical flow:

1. Open **File Import** → **Create** (`+`).
2. Download the **sample format** from the upload dialog.
3. Complete mandatory columns per the template (commonly branch, transaction date, entity, item, and quantity fields—confirm with your administrator).
4. Upload the file and review import results before **FINAL** on imported rows from the listing.

If **File Import** is missing, it may be hidden by **Feature Visibility** or your role may lack permission.

---

## If something is wrong {#if-something-is-wrong}

| Symptom | Likely cause | What to do |
|---------|----------------|------------|
| **CREATE** disabled | Missing **Branch**, invalid **Entity Id**, or no lines | Complete required **Main Details**, select consignor on **Account**, add at least one **Line** |
| **UPDATE** disabled | No changes on the form, or document not in editable state | Make a valid edit, or confirm posting status is **DRAFT** |
| **FINAL** skipped some selected rows | Rows not **DRAFT + ACTIVE** | Filter listing; select only eligible rows |
| **VOID** unavailable | Row not **FINAL + ACTIVE**, or role restricts void | Confirm status and permissions with administrator |
| Expected tab missing | **Feature Visibility** or **Field Settings** | Ask administrator to review applet settings |
| Price columns hidden on **Lines** | Pricing display permission | Administrator adjusts role permissions |

---

## Configuration and settings {#configuration-and-settings}

Administrators configure the applet under **Settings** and **Personalization** in the sidebar.

### Settings

| Area | What it controls |
|------|------------------|
| **Feature Visibility** | Which menus and tabs users see (**File Import**, optional document tabs) |
| **Application Settings** | Required or hidden header and line fields; listing columns; **FINAL** / **VOID** / **DISCARD** button visibility |
| **Field Settings** | Field-level mandatory and visibility rules |
| **Default Selection** | Default company, branch, location, and tab ordering for new orders |
| **Printable Format Settings** | Layout for **PRINT** and **Export** |
| **Email Template** | Templates for **SEND EMAIL** from the listing |
| **Branch Settings** | Branch-specific defaults |
| **Permission Wizard / Permission Set / User / Team / Role Permission** | Who can create, update, finalize, void, and view pricing |
| **Webhook** | External notifications when documents change (when enabled) |

### Personalization

| Area | What it controls |
|------|------------------|
| **Personal Default Selection** | Your own default branch and location |
| **Sidebar** | Layout of your sidebar menu |

---

## Permissions {#permissions}

- If **Create** (`+`) is missing or **CREATE** / **UPDATE** never enables, your role may lack permission or **Feature Visibility** may hide functions.
- **FINAL**, **VOID**, and **DISCARD** on the listing are controlled by role permissions and **Application Settings**.
- Line **Unit Price** and amount columns may require pricing-display permission.
- Administrators adjust **Permission Set**, **Role Permission**, and **Field Settings** for your organisation.

---

## Frequently asked questions {#frequently-asked-questions}

**Q: Does creating a Consignment Purchase Order create an immediate payment obligation?**

A: **No.** Creating a consignment PO establishes the **expected stock arrangement**, quantities, terms, and references for downstream receiving. Payment obligations normally arise after settlement events and when [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/) records billable quantities. The **Payment** tab sets **future** settlement terms—not payment for the full requested quantity at **CREATE** or **FINAL**.

---

**Q: What is the difference between Internal Consignment Purchase Order and Internal Purchase Order?**

A: A [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) is a **commitment to buy**. A **Consignment Purchase Order** is an **agreement for consigned stock**—the consignor usually keeps ownership until settlement. See [How this document compares to a standard purchase order](#purpose-and-overview).

---

**Q: Who owns inventory after goods are received?**

A: In a typical consignment arrangement, **the consignor still owns the stock** after it arrives. Physical receipt via consignment GRN confirms what you received—it does not automatically transfer ownership or create full payment obligation.

---

**Q: When does payment actually happen?**

A: Usually **after** usage or billing rules trigger [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/), then payment per **Credit Terms** on that billing document—not when you **CREATE** or **FINAL** the consignment PO.

---

**Q: Which quantity becomes payable?**

A: **Requested quantity** on the PO is what you asked to place on consignment. **Billable quantity** is determined later by your settlement rules and recorded on Consignor Purchase Billing—not by the PO line quantity alone.

---

**Q: What is KO For?**

A: **KO For** pulls lines from an **upstream** document (blanket consignment PO, quotation, or requisition) when you **build** this order. It is not the screen for matching received and billed quantities—that happens in linked GRN, delivery, and consignor billing documents.

---

**Q: Where do I click FINAL?**

A: On **Consignment Purchase Order Listing**—select one or more **DRAFT + ACTIVE** rows and click **FINAL**. Use **UPDATE** on the edit pane to save draft changes first.

---

**Q: Can I edit a consignment order after FINAL?**

A: Not in the normal way. After **FINAL**, header and lines are locked. **VOID** from the listing (when allowed) and create a replacement, use **Contra** if enabled, or follow your amendment procedure.

---

**Q: What happens if the consignor delivers fewer items than requested?**

A: Record actual delivered quantity in **Supplier Delivery Order** or **Internal Consignment GRN**. The consignor can deliver the balance later, or use **Contra** for a formal adjustment per your agreement.

---

**Q: What is the ARAP tab?**

A: **ARAP** = Accounts Receivable / Accounts Payable posting information for finance. Informational for most users.

---

**Q: Why is File Import missing from my menu?**

A: It may be hidden by **Feature Visibility** or your role lacks permission. Ask your administrator.

---

## Glossary {#glossary}

| Term | Meaning in this guide |
|------|------------------------|
| **Consignment Purchase Order** | Agreement documenting **requested consignment stock**, terms, and receiving references—not immediate purchase ownership. |
| **Consignor** | Supplier who owns consigned stock until settlement events defined in your policy. |
| **Requested quantity** | Quantity on the PO line—the consignment stock you are asking the consignor to place with you (not necessarily billable yet). |
| **Billable quantity** | Quantity that becomes payable after settlement triggers; recorded in [Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/). |
| **Posting status** | **DRAFT**, **FINAL**, or **VOID**—whether the document is editable, posted, or voided. |
| **Record status** | **ACTIVE** or **INACTIVE**—whether the header is a live working record. |
| **Lines** | Consigned products with requested quantities, reference pricing, and terms (tab label on the document screen). |
| **Validity** | Period during which the consignment agreement and expected receipts are active. |
| **KO For** | Tab to pull lines from a prior blanket consignment PO, quotation, or requisition when **building** this order. |
| **Consignor Purchase Billing** | Consignor **settlement document** for billable quantities after usage or billing rules. |
| **Credit Terms** | When payment is due **after** consignor billing—future settlement timing, not an immediate PO obligation. |
| **Consignment holding** | Consigned stock physically at your site while the consignor still owns it. |

---

## Related Applets

- **[Internal Purchase Requisition Applet](/applets/purchase-workflow/internal-purchase-requisition-applet/)** — Upstream: internal request that may be referenced or knocked off via **KO For** when creating the consignment PO.

- **[Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/)** — Downstream: when the consignor ships goods, your warehouse receives against this consignment PO.

- **[Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/)** — Downstream receiving: confirms receipt, quantity, and condition of consigned goods.

- **[Consignee Stock Transfer](/applets/inventory-workflow/consignee-stock-transfer-applet/)** — Downstream inventory: move consigned goods within or between locations.

- **[Internal Consignor Purchase Billing](/applets/purchase-workflow/internal-consignor-purchase-billing-applet/)** — Downstream settlement: records billable quantities and links back to this PO for payment tracking.

- **[Internal Purchase Invoice Applet](/applets/finance/internal-purchase-invoice-applet/)** — Standard purchase settlement when your process requires a normal purchase invoice outside consignor billing.

---

Last updated: June 24, 2026
