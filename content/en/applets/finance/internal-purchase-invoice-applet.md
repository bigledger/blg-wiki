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

**Purchase Invoice (Internal)** is the accounts-payable document used to record what you owe suppliers (and, where configured, intercompany counterparties) after goods or services are received or ordered. It connects operational records—such as **purchase orders** and **goods received notes (GRN)**—to the financial invoice, then supports **payments**, **contra** entries, **attachments**, **E-Invoice** compliance, and traceability back to posting.

{{< callout type="info" >}}
**Core Concept**: You choose the **supplier** and addressing (**bill-to** / **ship-to**), enter or import **invoice lines** (items, tax, and any analytical fields your company uses), then record **payments**, run **posting** and **trace** steps as required, and use **E-Invoice** when your tax process needs it—all on one document.
{{< /callout >}}

You open it from the main **Purchase Invoice** flow, with separate menus for **Line Items**, **File Import**, **File Export**, and **Intercompany** when your administrator enables them. **Settings** and **Personalization** control defaults, visible fields, knock-off behaviour, permissions, and layout.

---

## Key Features Overview

### Who Benefits from This Applet?

**Accounts payable and finance users**
- Build invoices from **knock-off** against **Purchase GRN**, **Purchase Order**, and (when enabled) **Purchase Requisition** or **Supplier Delivery Order**
- Use **Search Document** on the edit screen to locate **Purchase Order**, **Purchase GRN**, or **Purchase Invoice** lines to reference or match
- Run **FINAL**, **VOID**, **DISCARD**, **CLONE**, **SAVE**, and **Forex** from the edit toolbar subject to permissions and settings
- On the listing, batch **FINAL**, **DISCARD**, **VOID**, **SINGLE/MULTIPLE PRINT**, and **SELF-BILLED** where enabled
- Record **Payment** lines (settlement), **Contra**, and **ARAP** summary on the header when tabs are visible

**Procurement and warehouse staff**
- Rely on KO and search-by-document so billed quantities align with receipts and orders
- Use **Delivery Details** and line-level **Issue Link** when the process ties invoices to logistics or help-desk work

**Intercompany teams**
- Use **Intercompany Transaction Listing** with **Inbound** / **Outbound** and **UNPROCESSED** / **PROCESSED** sub-queues to align internal transfers between branches

**Operations and support (line-centric work)**
- Open the **Line Items** menu for a cross-document grid, then **Edit Line Item**, **Edit Issue**, and **Log Time** flows without opening every invoice header

**Administrators**
- Configure **Default Selection**, **Field Settings**, **Printable Format**, **Knock-off Settings**, **Feature Visibility**, **Branch Settings**, webhooks, permission sets (including **Permission Wizard** and **Role Pricing Scheme Link**), **Release Notes**, and **Applet Log**

### What Problems Does This Solve?

**Without a structured purchase invoice process**, AP often retypes GRN/PO data, loses the link between receipt and supplier bill, duplicates invoicing against the same receipt, or mis-posts intercompany movements.

**This applet addresses that by:**
- Providing **knock-off** and **KO For** (import knock-off) paths so lines stay tied to source documents (behaviour governed by **Knock-off Settings** and flags such as **ENABLE_MULTIPLE_KO**)
- Separating **draft** work (**SAVE** on edit, **CREATE** / **RESET** on create) from **FINAL** posting locks
- Centralising **Payment** and optional **Contra** on the same document as the lines
- Offering **File Import** and **File Export** for volume scenarios when menus are not hidden
- Exposing **TraceDocument** and **Applet Log** for investigation and audit support

### Guide navigation

Use the cards below to jump to detailed sections in this guide.

{{< cards >}}
  {{< card title="Quick Start Guide" subtitle="By role: AP, intercompany, lines, batch, admin" link="#quick-start-guide" >}}
  {{< card title="Purchase Invoice listing" subtitle="Search, columns, bulk actions" link="#purchase-invoice-listing" >}}
  {{< card title="Create purchase invoice" subtitle="Main, account, lines, KO, payment" link="#create-purchase-invoice" >}}
  {{< card title="Edit screen and tabs" subtitle="All panels and toolbar" link="#edit-purchase-invoice" >}}
  {{< card title="Line items and knock-off" subtitle="Add Item, GRN/PO listing, edit knockoff" link="#line-items-and-knock-off" >}}
  {{< card title="Payment, contra, ARAP" subtitle="Settlement and offsets" link="#payment-contra-and-arap" >}}
  {{< card title="E-Invoice, export, attachments" subtitle="Compliance and outputs" link="#e-invoice-export-and-attachments" >}}
  {{< card title="Intercompany" subtitle="Inbound/outbound queues" link="#intercompany-transactions" >}}
  {{< card title="Line Items menu" subtitle="Cross-document lines" link="#line-items-menu" >}}
  {{< card title="File import and export" subtitle="Batch menus" link="#file-import-and-file-export" >}}
  {{< card title="Configuration and settings" subtitle="Defaults, KO, permissions" link="#configuration--settings" >}}
  {{< card title="Personalization" subtitle="User defaults and sidebar" link="#personalization" >}}
  {{< card title="Audit and traceability" subtitle="Applet log and trace" link="#audit-and-traceability" >}}
  {{< card title="FAQ" subtitle="Common issues" link="#faq" >}}
{{< /cards >}}

---

## Key Concepts

### Framework

| Aspect | Meaning | Typical use |
|--------|---------|-------------|
| **Supplier** | **Account** → entity / bill-to / ship-to | Who sends the tax invoice |
| **Purchaser** | **Main Details** | Internal buyer reference |
| **Lines** | **Line Items**, **Add Item**, knock-off from **GRN Line Listing** / **PO Line Listing** | What was purchased |
| **Settlement** | **Payment** tab | Bank, cash, card, e-wallet, etc. |
| **Controls** | **Posting**, **TraceDocument** | Accounting trail |

### Document lifecycle (simplified)

```
Create screen → CREATE (first save) → Edit screen
    → SAVE (draft) as needed
    → FINAL (lock for normal editing)
    → VOID / DISCARD (per policy; listing or main details)
    → Payment / E-Invoice / export as your process defines
```

**CLONE** (dropdown on edit) creates a copy when not hidden by settings. **RESET** on create clears the draft form.

### Knock-off ideas the settings can enable

Your tenant may allow knock-off by or for: **Purchase GRN**, **Purchase Order**, **Purchase Requisition**, **Supplier Delivery Order** (separate “by” vs “for” flags in configuration). The **KO For** tab runs **import knock-off**. Line-level **Add Knockoff** / **Edit Knockoff** screens maintain links already on the invoice.

### Tabs vs expansion panels

When **vertical orientation** is used, many sections appear as **expansion panels** with the same content as horizontal tabs. **Search Document** and some lazy tabs load when opened. Invalid required sections can show **red** tab or panel titles until validation passes.

### Listing columns

The grid supports many optional columns (document numbers at tenant/company/branch level, E-Invoice fields, **ARAP** amounts, open balance, contra, transaction and reference dates, linked documents, segment/dimension/project/profit centre, and more). Which columns appear depends on **applet settings** and **column permissions**—if a column is missing, ask your administrator before assuming data is absent.

---

## Quick Start Guide {#quick-start-guide}

### For AP clerks: first purchase invoice from GRN

1. Open **Purchase Invoice** (main listing).
2. Click **Create** (+).
3. **Main Details**: set transaction date, reference, currency, **Purchaser** (via **Select Purchaser** if required), and any mandatory custom or reference fields.
4. **Account**: **Select Supplier**, then **Bill To** and **Ship To** (and **Select Shipping Entity** when your process uses it).
5. **Line Items**: open **Add Item** / line creation. Pick the item, quantity, and pricing; complete **Item Details**, and if shown **Serial Number**, **Batch Number**, **Bin Number**, **Costing Details**, or **Issue Link**.
6. Alternatively, from the **edit** screen after save, use **Search Document** → **Search Purchase GRN** (or **Search Purchase Order**) to select lines, or use **KO For** for import knock-off when the tab is visible.
7. On create, click **CREATE**; then from listing open the document for **SAVE** / **FINAL** as needed.

### For AP clerks: listing shortcuts

- Select one or more rows and use **FINAL**, **DISCARD**, or **VOID** when buttons appear (gated by **HIDE_GENDOC_*** settings and client-side permissions such as **SHOW_GENDOC_FINAL_BUTTON**).
- **SINGLE/MULTIPLE PRINT** runs when **PRINTABLE** is configured.
- **SELF-BILLED** supports self-billing workflows from the listing.
- **Advanced search** uses the applet’s search model; **column toggle** switches layout on wide screens.

### For intercompany users

1. Open **Intercompany**.
2. Choose **Inbound** or **Outbound**.
3. Open **UNPROCESSED** to work the processing queue, or **PROCESSED** to review documents already linked.
4. Complete the on-screen action your company uses to generate or tie the purchase invoice.

### For line-level work

1. Open **Line Items** from the menu.
2. Use **Line Items Listing** to find a line; open **Edit Line Item**.
3. Use **Issue Link** / **Log Time** flows when your process tracks issues against purchase lines.

### For batch import and export

1. Open **File Import** or **File Export** (hidden if **HIDE_FILE_IMPORT_MENU** / **HIDE_FILE_EXPORT_MENU** is set).
2. Follow the on-screen steps and templates your administrator provides.

### For administrators: setup checklist

- [ ] **Settings → Default Selection** — branch, company, location, language, orientation, toggles.
- [ ] **Settings → Field Settings** — mandatory and visible fields.
- [ ] **Settings → Printable Format** — print and export layouts.
- [ ] **Settings → Knock-off Settings** — which KO types are allowed and how they behave.
- [ ] **Settings → Feature Visibility** — menus (import/export, intercompany, etc.).
- [ ] **Settings → Branch Settings** — branch-specific behaviour.
- [ ] **Settings → Client-side permission listing** — FINAL, VOID, DISCARD, SAVE visibility.
- [ ] **Permission set / User / Team / Role** listings — who can create, edit, finalise, void, import, export.
- [ ] **Permission Wizard** — guided permission setup if you use it.
- [ ] **Role pricing scheme link** — if pricing visibility is role-driven.
- [ ] Pilot: one GRN-based invoice, one manual line invoice, one payment line, one intercompany item, then verify **Posting** / **TraceDocument**.

---

## Purchase Invoice Listing {#purchase-invoice-listing}

The listing title in the product is **Purchase Invoice Listing**. From here you:

- **Create** new documents (permission permitting).
- **Advanced search** with the general advanced search component (criteria depend on configuration).
- Use **column toggle** for single- vs double-column layout on larger displays.
- Apply **FINAL**, **DISCARD**, **VOID**, **SINGLE/MULTIPLE PRINT**, and **SELF-BILLED** from the button row when each is allowed.
- Open a row to move to **Purchase Invoice Edit**.

Row selection and bulk behaviour follow the same permission and posting rules as individual documents. If a button never appears, check **Feature Visibility**, client-side permissions, and **HIDE_GENDOC_*** applet flags.

---

## Create Purchase Invoice {#create-purchase-invoice}

The create column is titled **Create Purchase Invoice**. Toolbar: **Back**, **RESET**, **CREATE**.

Tabs on create (some hidden by settings):

| Tab | Purpose |
|-----|---------|
| **Main Details** | Header, purchaser, dates, references, E-Invoice-related header fields when applicable |
| **Account** | Supplier selection, bill-to and ship-to tabs |
| **Line Items** | List of lines; navigate to **Line Item Add** |
| **Delivery Details** | Shown unless **HIDE_DELIVERY_DETAILS_TAB** |
| **Payment** | Shown unless **HIDE_MAIN_PAYMENT_TAB** |
| **KO For** | Import knock-off; hidden if **HIDE_KO_FOR_TAB** |
| **Department Hdr** | Segment, dimension, profit centre, project pickers when enabled; hidden if **HIDE_DEPARTMENT_HDR_TAB** |

**Contra** appears on **edit**, not on the create tab strip shown in code. After **CREATE**, continue on the edit screen for remaining tabs.

---

## Edit Purchase Invoice {#edit-purchase-invoice}

The edit header shows a status-specific title plus **Purchase Invoice**. Toolbar (subject to visibility):

| Control | Role |
|---------|------|
| **Forex** (green) | Multi-currency / rate when `showForexButton()` applies |
| **FINAL** | Locks document (`showFinal()` / permissions) |
| **VOID** | Voids document when allowed |
| **SAVE** | Draft save unless **HIDE_GENDOC_SAVE_BUTTON** |
| **Menu** | **CLONE** when enabled (**HIDE_CLONE_BUTTON** may hide it) |
| **DISCARD** | Also available on **Main Details** content when discard is valid |

### Edit tabs and panels (ordered panels in code)

The following can appear as tabs or expansion panels. **Search Document** is hidden when **HIDE_SEARCH_BY_DOCUMENT_BUTTON** is set. Other sections use **HIDE_*** flags (for example **HIDE_MAIN_CONTRA_TAB**, **HIDE_ATTACHMENT_TAB**, **HIDE_EXPORT_TAB**, **HIDE_POSTING_TAB**, **HIDE_TRACE_DOCUMENT_TAB**, **HIDE_DOC_LINK_TAB**).

| Section | Content |
|---------|---------|
| **Search Document** | Sub-areas: **Search Purchase Order**, **Search Purchase GRN**, **Search Purchase Invoice** |
| **Main Details** | Same family of fields as create; **DISCARD** when applicable |
| **E-Invoice** | E-Invoice component for submission/status |
| **Account** | Entity, bill to, ship to; may open **Select Shipping Entity & Address** |
| **Line Items** | Grid of lines; create/edit lines |
| **KO For** | **Import knock-off** component |
| **Delivery Details** | Line/header delivery context |
| **ARAP** | AR/AP summary fields on header |
| **Payment** | Payment listing; **Payment Add** / **Payment Edit** |
| **Department Hdr** | Analytical dimensions |
| **Posting** | Posting view |
| **TraceDocument** | Generic document posting trace |
| **Contra** | Contra listing; select document, add/edit contra |
| **Doc Link** | Document links |
| **Attachment** | Attachment listing; add/view |
| **Export** | Export actions for the document |

Tab **order** can be customised per tenant using **PURCHASE_INVOICE_DETAILS_TAB_ORDER** in settings.

---

## Line Items and Knock-off {#line-items-and-knock-off}

### Add Item (Line Item Add)

Screen title **Add Item**. **ADD** saves the line. Sub-tabs or panels can include:

- **Item Details** (required path for the item)
- **Grouped Item** when the item type is grouped
- **Serial Number**, **Batch Number**, **Bin Number** when item subtype and settings allow (may be hidden via **HIDE_SERIAL_NUMBER**, **HIDE_BATCH_NUMBER**, **HIDE_BIN_NUMBER**)
- **Costing Details** unless costing is hidden or restricted
- **Issue Link** unless **HIDE_ISSUE_LINK**

**Line Item Edit** mirrors edit behaviour with save/delete patterns appropriate to posting status.

### Knock-off from listings

Dedicated flows include **GRN Line Listing** and **PO Line Listing** (and related knock-off add/edit components) so you can attach invoice lines to operational documents.

### Import knock-off

**KO For** hosts **import knock-off** for bringing knock-off data in bulk according to configuration.

---

## Payment, Contra, and ARAP {#payment-contra-and-arap}

- **Payment**: Use **Payment Add** to record settlement lines; **Payment Edit** to change them. Settings may allow editing payment or settlement dates (**ENABLE_EDIT_PAYMENT_DATE**, **ENABLE_EDIT_SETTLEMENT_DATE**).
- **Contra**: **Contra Select Document**, **Contra Add**, **Contra Edit**—use when your process offsets this invoice against another document.
- **ARAP**: Header-level AR/AP tab when **HIDE_MAIN_ARAP_TAB** is false; complements **ARAP** columns on the listing.

---

## E-Invoice, Export, and Attachments {#e-invoice-export-and-attachments}

- **E-Invoice**: Full tab/panel on edit; may include supplier **EInvoice** address creation when maintaining supplier from the invoice journey.
- **Export**: Document-level export from the **Export** tab.
- **Attachments**: **Attachment Add** and **Attachment View** from the listing on the edit flow.
- **Doc Link**: Related document links for traceability.

---

## Intercompany Transactions {#intercompany-transactions}

The screen shows **Intercompany Transaction Listing** with:

- **Inbound** → **UNPROCESSED** (processing queue) and **PROCESSED** (linked documents listing)
- **Outbound** → **UNPROCESSED** and **PROCESSED** the same way

Layout may use nested tabs or nested expansion panels on small or vertical layouts. Use **UNPROCESSED** to clear items waiting to become (or match) a purchase invoice on your branch; use **PROCESSED** to audit what already completed.

---

## Line Items Menu {#line-items-menu}

Routes under **Line Items**:

| Step | Screen |
|------|--------|
| Listing | **Line Items Listing** |
| Drill-down | **Edit Line Item** |
| Issue | **Edit Line Item Edit Issue** |
| Time | **Edit Line Item Log Time** |

Use this when you need line-centric corrections or issue logging across many invoices.

---

## File Import and File Export {#file-import-and-file-export}

- **File Import**: separate container for importing invoice data in batch (respect **HIDE_FILE_IMPORT_MENU**).
- **File Export**: **Purchase Invoice File Export** listing for batch export (respect **HIDE_FILE_EXPORT_MENU**).

Exact file formats and validation messages depend on tenant configuration—document them internally beside your templates.

---

## Supplier Maintenance from the Invoice Flow {#supplier-maintenance-from-the-invoice-flow}

When you drill into **Account**, you may open supplier maintenance screens without leaving the applet, including (when your permissions allow): **Supplier Create** / **Supplier Edit**, address and contact create/edit, tax create/edit, payment configuration, company listing, category, branch, login, item pricing, and **EInvoice Create Address**. Use these to fix master data discovered during invoice entry.

---

## Configuration and Settings {#configuration--settings}

Open **Settings** from the applet menu. Typical child areas:

| Area | Purpose |
|------|---------|
| **Default Selection** | Defaults for branch, company, location, language, orientation, decimal behaviour, item search types |
| **Field Settings** | Field visibility and mandatory rules |
| **Printable Format** | PDF and print layouts |
| **Knock-off Settings** | KO rules and behaviour |
| **Webhook** | Outbound integrations |
| **Feature Visibility** | Which menus and features appear |
| **Branch Settings** | Branch-specific configuration |
| **Client-side permission listing** | Toggle client-side actions (FINAL, VOID, DISCARD, etc.) |
| **Permission Wizard listing** | Guided permission setup |
| **Permission set listing** | Permission sets resolved for this applet |
| **User / Team / Role permission listing** | Who gets which sets |
| **Role pricing scheme link listing** | Role-based pricing links |
| **Release Notes** | Version information |
| **Applet Log** | Operational log for the applet |

{{< callout type="warning" >}}
Changing knock-off flags, tab hides, or permissions while users are posting can cause confusion. Apply changes in a maintenance window or communicate before go-live.
{{< /callout >}}

---

## Personalization {#personalization}

**Personalization** includes:

- **Personal Default Selection** — user overrides for defaults where the platform allows
- **Sidebar** — shortcut customisation

Personal choices do not replace company-wide security; they only adjust convenience defaults.

---

## Audit and Traceability {#audit-and-traceability}

- **TraceDocument** on the invoice shows generic document posting trace when the tab is enabled.
- **Applet Log** under **Settings** captures applet-level activity suitable for support and audit handoff.
- Your organisation may also use platform-wide audit tools outside this applet—confirm with your administrator.

---

## FAQ {#faq}

**Why is FINAL (or VOID / SAVE) missing?**  
Check **Settings → Feature Visibility**, **Client-side permission listing** (e.g. **SHOW_GENDOC_FINAL_BUTTON**), and applet flags **HIDE_GENDOC_FINAL_BUTTON**, **HIDE_GENDOC_VOID_BUTTON**, **HIDE_GENDOC_SAVE_BUTTON**.

**Why is the Search Document tab missing?**  
**HIDE_SEARCH_BY_DOCUMENT_BUTTON** may be set, or your role lacks access.

**Can I invoice without GRN/PO?**  
Yes—use **Line Items** → **Add Item** and manual item selection when policy allows.

**Why does my tab order differ from another company?**  
**PURCHASE_INVOICE_DETAILS_TAB_ORDER** can reorder edit tabs per tenant.

**File Import / Export menus are gone**  
**HIDE_FILE_IMPORT_MENU** or **HIDE_FILE_EXPORT_MENU** may be true.

**What does SELF-BILLED on the listing do?**  
It supports self-billing workflows where the buyer issues the supplier invoice—use only when finance and tax policy allow.

**Red tab labels on edit**  
Required validation failed for that section—open it and complete mandatory fields.

**CLONE is missing**  
**HIDE_CLONE_BUTTON** or permissions may block it.

**Intercompany row stuck in UNPROCESSED**  
Confirm the sending branch posted the document, mapping is correct, and your user has rights to the queue.

**Where do I see E-Invoice status?**  
Use the **E-Invoice** tab on the invoice; listing may show E-Invoice columns when enabled.

---

## Related Applets

- [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/) — orders used for PO knock-off  
- [Internal Purchase Requisition Applet](/applets/purchase-workflow/internal-purchase-requisition-applet/) — requisitions when KO includes requisition  
