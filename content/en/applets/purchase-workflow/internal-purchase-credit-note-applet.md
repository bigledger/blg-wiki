---
title: "Purchase Credit Note (Internal) Applet"
description: "User guide for the Internal Purchase Credit Note applet: supplier credits, lines, file import, and links to related purchase and e-invoice guides."
tags:
  - purchase-workflow
  - purchase-credit-note
  - internal-purchase
  - e-invoice
  - procurement
  - file-import
weight: 80
date: 2026-04-06
lastmod: 2026-06-16
draft: false
---

## Purpose and overview {#what-is-a-purchase-credit-note}

In purchasing, a credit note (also called a supplier credit or purchase credit note) is a formal record that reduces what your company owes a supplier, or corrects what you already recorded, when something changes after a purchase or invoice. Typical reasons include returned goods, wrong quantities or prices, agreed rebates, or duplicate billing. In plain terms: a supplier invoice says you should pay more; a purchase credit note says you should pay less or take an amount off the account.

In BigLedger, the **Purchase Credit Note (Internal) Applet** is where you create and maintain that record inside the ERP, with the same overall shape as other purchase documents: header details, supplier account, and lines so procurement and finance stay aligned.

{{< callout type="info" >}}
Cannot see a menu item or button? Administrators control feature visibility, field settings, and permissions. If something you were trained on is missing, ask your admin—it may be turned off for your role or company policy.
{{< /callout >}}

Every credit note ties together **who** you are crediting (supplier on **Account**), **which document** you are editing (header on **Main Details**), and **what** is credited on each line (**Line Items** on create, **Lines** on edit). Optional tabs add payment, department, knock-off from GRN/PO/supplier DO (**KO For**), e-invoice, settlement, and evidence when your tenant shows them.

---

## Before you begin

- Agree internally who proposes credit amounts (procurement) and who approves them for posting (finance), so totals and reasons are clear before you use **FINAL**.
- The supplier must exist in master data before you can complete the **Account** tab on a new credit note.
- Whether you must tie a credit to an existing posted invoice depends on your process. When **KO For** is visible on create, it is for knock-off from **Purchase GRN**, **Purchase Order**, or **Supplier Delivery Order** (see [KO For tab](#ko-for-tab-create)); linking or settlement against a **posted purchase invoice** may use **Doc Link**, **ARAP**, or other steps your finance team defines.
- For statutory e-invoice steps after posting, your organisation may also use [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)—see that guide for queues and status, not this page.

---

## Who benefits and problems solved {#what-problems-does-this-solve}

| Who | Typical use |
|-----|-------------|
| Procurement | Create and update credit notes, supplier and addresses, and lines; use bulk tools when many lines change. |
| Finance | Review totals, use **FINAL** when the credit is ready for downstream posting, use **DISCARD** or **VOID** when policy allows; work in **E-Invoice**, **ARAP**, or **Contra** when enabled and trained. |
| Operations | Run file imports, attachments, or exports when your company uses them for evidence or hand-off. |

Without a structured credit-note process, teams often rely on email and spreadsheets, which makes it hard to prove what was agreed, match credits to invoices or receipts, and keep procurement and finance on the same numbers. This applet gives one official list, header plus supplier plus lines in one place, optional links to e-invoice and settlement when your tenant enables them, and bulk paths through the **Line Items** workspace and **File Import**.

---

## Key features overview

{{< cards >}}
{{< card title="Quick start" subtitle="Minimum paths by role" link="#quick-start-guide" >}}
{{< card title="Field reference" subtitle="Header, account, and line fields explained" link="#field-reference" >}}
{{< card title="Edit screen tabs" subtitle="Each tab and when to use it" link="#edit-screen-tabs" >}}
{{< card title="Record a supplier credit" subtitle="Create and edit a credit note" link="#record-a-supplier-credit" >}}
{{< card title="Line Items workspace" subtitle="Search and edit lines across documents" link="#line-items-workspace" >}}
{{< card title="File Import" subtitle="CSV template, columns, and troubleshooting" link="#file-import" >}}
{{< card title="Personalization" subtitle="Your own defaults and layout" link="#personalization" >}}
{{< card title="E-invoice and related" subtitle="What opens on the document" link="#e-invoice-and-related-flows" >}}
{{< card title="Settings" subtitle="For administrators" link="#settings-for-administrators" >}}
{{< card title="If something is wrong" subtitle="Common fixes" link="#if-something-is-wrong" >}}
{{< card title="FAQ" subtitle="Common questions" link="#frequently-asked-questions" >}}
{{< card title="Glossary" subtitle="Terms used in this guide" link="#glossary" >}}
{{< /cards >}}

{{< figure src="/images/internal-purchase-credit-note-applet/internal-purchase-credit-note-applet-overview-infographic.png" alt="Overview of the Purchase Credit Note (Internal) Applet: documents, line items, and import" caption="Purchase credit notes, the Line Items workspace, and file import in one applet." >}}

---

## Quick start {#quick-start-guide}

The layout may show the same areas as **tabs across the top** or as **expansion panels** you open one at a time—that is a display choice only; the underlying data and steps are the same. Users can switch layout with **CHANGE VIEW** (see [Settings](#settings-for-administrators)).

### For procurement: record a credit and get it ready for finance

1. Open **Purchase Credit Note (Internal)** from the sidebar and use the list search or filters to find an existing document, or start **Create** / **+** for a new one.
2. On **Create Purchase Credit Note**, work through **Main Details**, then **Account**, then **Line Items**. Treat optional tabs only when your process requires them (**Payment**, **Department Hdr**, **KO For**—see below).

**Main Details — what to fill in**

- Required vs optional fields are controlled by **Field settings** for your tenant. On the form, anything your company marks as mandatory usually shows as required (for example asterisk or red highlight when empty). If you are unsure about a blank field, ask procurement lead or admin rather than guessing.
- **Reference numbers:** Use the field your policy names for each purpose. A practical pattern many teams use: put the **supplier’s own credit note reference** (if they issued one) in the supplier or external reference field your form exposes; put **your internal case or return ID** in an internal reference; put the **original purchase invoice or PO number** wherever finance asked you to trace the credit (sometimes a dedicated reference, sometimes remarks). If your form only has one reference line, agree one convention with finance and stick to it.
- **Dates:** Use the document date and any due/posting-related dates your form shows the way finance trained you (often “today” for the credit note date unless policy says otherwise).

**Account**

- Pick the **same supplier** the credit is for, and bill-to / ship-to that match the agreement or the original transaction.

**Line Items — quantities and prices**

- Enter the **credit** you are recording now: item, **quantity being credited**, and **unit price for this credit** (the amount that should reduce payables after posting—not “extra” fields for history unless your form has them).
- **Price to use:** If finance agreed to credit at the **same unit price as the original invoice**, use that price on the line. If they agreed a **different** credit price (promotional credit, partial write-down, negotiated return value), enter that agreed price—not the old invoice price. When in doubt, confirm with finance before posting.
- **Example (returned goods):** Finance agrees to credit 10 returned units at MYR 50.00 each. On **Line Items**, choose the **same item code** as the original purchase (or the return line item your policy uses), enter **Qty 10**, **Unit price 50.00** (or your form’s equivalent labels), and a clear line remark such as “Return RMA-123”. Totals on the header should match what was approved.

Optional tabs when visible:

- **Payment** — only if your process records payment lines on the credit note.
- **Department Hdr** — department or segment on the header when your company allocates credits that way.
- **KO For** — see [KO For tab](#ko-for-tab-create); use it when you should build lines from open quantities on a **Purchase GRN**, **Purchase Order**, or **Supplier Delivery Order** instead of typing every line by hand.

3. Click **CREATE** to save a new document (use **RESET** only if you intend to clear the draft form). After the document exists, continue editing with **SAVE**; optional tabs on the saved document are described under [Edit screen tabs](#edit-screen-tabs).

### For finance: approve posting and follow your close-out steps {#finalize-void-or-discard-finance}

1. Open the document from the list and confirm supplier, totals, and lines against your approval rules.
2. Use **SAVE** while changes are still in progress. When the credit is ready for generic document posting, use **FINAL** (header button on the edit screen).
3. On **Main Details**, **DISCARD** removes a draft (no posting status yet, or status **DRAFT**). **VOID** appears after the document is **FINAL** (posted), when your settings and permissions allow. Either action can be hidden or blocked while the document is locked—ask finance or admin if a button is missing.
4. Complete **E-Invoice**, **ARAP**, **Contra**, **Doc Link**, or other tabs only as your training describes. Deep e-invoice submission and My E-Invoice workflows are covered in [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) and, where relevant, [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/).

### For operations: bulk lines and evidence

1. Use [File Import](#file-import) for CSV uploads; fix errors shown on **Checking**, then re-import or continue per your admin’s procedure.
2. Use [Line Items workspace](#line-items-workspace) to find and correct specific lines after import or when working across many documents.
3. On an open document, use **Attachment** or **Export** when those tabs are visible and your process requires files or extracts.

{{< callout type="tip" >}}
After you **FINAL**, the document is treated as posted for your process: follow-up (payables effect, e-invoice, settlement) depends on tenant configuration. Confirm with finance whether a settlement run, e-invoice check, or other step is required—see [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) for ARAP and invoice-side context where credits mirror invoices.
{{< /callout >}}

---

## Field reference {#field-reference}

This section explains what each part of the credit note form is for. **Which fields are required** depends on your company’s **Field settings**—the tables below describe purpose, not whether every tenant marks them mandatory.

For shared concepts (currency, GL segments, e-invoice supplier fields), see also [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) where similar fields are documented for invoices.

### Main Details (document header)

| Field | What it is for |
|-------|----------------|
| **Doc Short Code** | System document type code (read-only after creation). |
| **Doc No (Tenant)** | Document number at tenant level. |
| **Document No (Company)** | Document number at company level (when shown). |
| **Document No (Branch)** | Document number at branch level (when shown). |
| **Custom Document Number** | Optional custom numbering when your admin enables it. |
| **Client Doc Short Code** | Short code for your external document classification. |
| **Client Doc 1 No – 5 No** | Up to five external reference numbers (supplier CN, PO, invoice, case ID—agree usage with finance). |
| **Branch** | Branch that owns this credit note. |
| **Location** | Store or location within the branch. |
| **Purchaser** | Person responsible for this credit (buyer or procurement contact). |
| **Transaction Date** | Date of the credit note for posting and reporting. |
| **Credit Terms** | Payment or credit terms applied to this document. |
| **Reference** | Primary header reference (often supplier credit note number or internal trace ID). |
| **Remarks** | Free-text notes visible on the document. |
| **Permit No** | Import or permit reference when your process requires it. |
| **Currency** | Document currency (amounts on lines are in this currency). |
| **Base Currency** | Your organisation’s reporting currency (when shown). |
| **Currency Rate** | Exchange rate between document currency and base currency. |
| **Tracking ID** | Shipment, RMA, or logistics tracking reference. |
| **External Quotation / Order / Delivery Order / Invoice / Others** (+ dates) | Cross-reference to supplier documents outside BigLedger. |
| **Posting Status** | **DRAFT**, **FINAL**, or **VOID**—whether the credit is still editable, posted, or cancelled. |
| **Status** | Active/inactive document status (for example **ACTIVE**). |

{{< figure src="/images/internal-purchase-credit-note-applet/tab-main-details.png" alt="Main Details tab on an open purchase credit note showing header fields, branch, dates, and references" caption="Main Details: header fields including branch, location, dates, references, currency, and posting status." >}}

### Account (supplier)

The **Account** tab has subtabs **Entity Details**, **Bill To**, and **Ship To** when your admin shows them.

| Field / area | What it is for |
|--------------|----------------|
| **Entity Id / supplier picker** | The supplier receiving the credit—must match the party on the original transaction. |
| **Entity Name, Type, Status** | Supplier master data for identification and compliance. |
| **ID Number, Identity Type, Email, Phone** | Supplier identity and contact (used for reporting and e-invoice when enabled). |
| **Currency** | Supplier account currency context when shown. |
| **Bill To** | Billing name and address on the credit. |
| **Ship To** | Shipping or return address when relevant to the credit. |

{{< figure src="/images/internal-purchase-credit-note-applet/tab-account.png" alt="Account tab showing supplier entity details and bill-to or ship-to addresses" caption="Account: select the supplier and confirm Bill To and Ship To match the credit agreement." >}}

Video walkthrough: selecting the supplier and updating billing details on a purchase credit note.

{{< youtube 5GJvJrqqheA >}}

### Line Items / Lines (credit lines)

On **Create Purchase Credit Note** the tab is **Line Items**; on an open document it is **Lines**—same data, different screen title.

| Field | What it is for |
|-------|----------------|
| **Item Code** | Product or service being credited. |
| **Item Name** | Description from item master. |
| **UOM** | Unit of measure (each, box, kg, etc.). |
| **Qty** | Quantity being credited (reduces payables by this amount × unit price). |
| **Unit Price (Inclusive of Tax)** | Agreed credit price per unit—not necessarily the original invoice price unless finance confirmed that. |
| **SST / VAT / GST** | Tax amount on the line when applicable. |
| **Txn Amount** | Line total in document currency. |
| **Remarks** | Line-level reason (for example “Return RMA-123”, “Price correction”). |
| **Serial #** | Serial-tracked items—enter when your item setup requires it. |
| **Segment Code, Dimension Code, Profit Centre Code, Project Code** | GL allocation when your finance policy splits credits by department or project. |
| **Landed Costs** | Additional cost components when costing is enabled. |

{{< figure src="/images/internal-purchase-credit-note-applet/tab-lines.png" alt="Lines tab showing credit line items with item code, quantity, unit price, and amounts" caption="Lines (Line Items on create): each row records what is being credited—item, quantity, and unit price." >}}

---

## Record a supplier credit {#record-a-supplier-credit}

This is the day-to-day workflow inside the applet: one list, one document, supplier account, and credit lines.

### Main list: Purchase Credit Note (Internal)

From the sidebar, open the main list to search, filter, and open documents. **Create** / **+** starts a new credit note when you have permission. Columns may include document number, dates, amounts, **Self Billed ?** (reflects the header/supplier self-billed flag when present), and status—exact columns depend on configuration.

{{< figure src="/images/internal-purchase-credit-note-applet/1.png" alt="Purchase Credit Note (Internal) listing with search and Create control" caption="Main list: search and filter credit notes, open a row, or start a new document with Create / +." >}}

### Create a new credit note {#create-a-purchase-credit-note}

Video walkthrough: creating a purchase credit note from the listing through **Main Details**, **Account**, **Line Items**, and **CREATE**.

{{< youtube dkRuP79Xa9E >}}

1. From the list, click **Create** / **+**. The screen title is **Create Purchase Credit Note**.
2. **Main Details** — dates, references, and other header fields your company requires (see [Field reference](#field-reference)).
3. **Account** — select the supplier and billing/shipping details as required.

{{< figure src="/images/internal-purchase-credit-note-applet/2.png" alt="Create Purchase Credit Note screen showing Main Details or Account tab with header and supplier fields" caption="Create a credit note: complete Main Details and Account before moving to lines." >}}

4. **Line Items** — add lines (items, quantities, amounts) for what is being credited.

{{< figure src="/images/internal-purchase-credit-note-applet/3.png" alt="Create Purchase Credit Note Line Items tab with credit lines in the grid" caption="Line Items: enter each credited item, quantity, and unit price (or use KO For when your process starts from another document)." >}}

5. Optional tabs (only if shown): **Payment**, **Department Hdr**, **KO For** — complete when your process says so. See [KO For tab](#ko-for-tab-create).
6. Click **CREATE** to persist the document. Use **RESET** to clear the unsaved create form.

### KO For tab (create) {#ko-for-tab-create}

The **KO For** tab is optional and only appears when your administrator enables it. It exists so you can **import knock-off lines from an existing purchase document** instead of re-typing item codes, quantities, and baseline amounts.

Inside the tab you get subtabs such as **KO For Purchase GRN**, **KO For Purchase Order**, and **KO For Supplier Delivery Order** (exact titles match your screen). Typical flow: open the subtab that matches the document you are crediting against, **search and select** that document, then use the knock-off action your training describes. The system brings **open quantities and linked line data** from that document into this credit note so you start from what was already received or ordered. **Review and adjust** lines afterward if the credit quantity or price differs from what was pulled (for example partial return or negotiated credit).

If you **skip KO For**, you can still enter lines manually on **Line Items**; finance may later match the credit to invoices or payables using **Doc Link**, **ARAP**, or other tools on the saved document. Whether knock-off is required is a **company rule**, not something the applet decides for you.

For invoice-centric knock-off, settlement, and ARAP behaviour, continue with [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) after the credit note exists if that is how your tenant is set up.

### Edit an existing credit note

Open a row from the list. The header shows **SAVE** and, when allowed, **FINAL**.

{{< figure src="/images/internal-purchase-credit-note-applet/4.png" alt="Open purchase credit note in edit mode with SAVE and FINAL in the header" caption="After the document exists: use SAVE while editing; use FINAL when finance is ready to post the credit note." >}}

For tab-by-tab guidance on the saved document, see [Edit screen tabs](#edit-screen-tabs).

---

## Edit screen tabs {#edit-screen-tabs}

After you **CREATE** a credit note, the edit screen shows a set of tabs (or vertical panels if **CHANGE VIEW** is set that way). Tabs appear only when your administrator has not hidden them. Work through them in the order below when your process requires each step.

### Main Details

**When to use:** Always—the document header.

**What you do here:** Review or update branch, location, dates, references, currency, and remarks. **DISCARD** (draft) and **VOID** (posted) appear here when permitted. Confirm **Posting Status** before you assume the credit is live in payables.

**Typical scenario:** Procurement corrects the supplier reference number before finance runs **FINAL**.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-main-details.png" alt="Main Details tab on edit purchase credit note" caption="Main Details on edit: update header fields; DISCARD and VOID appear here when permitted." >}}

### E-Invoice

**When to use:** When e-invoice is enabled for your tenant—usually after **FINAL**.

**What you do here:** View or trigger e-invoice actions (submission, cancellation) per country rules. **Self-billed** suppliers may see different subtabs than standard suppliers.

**Typical scenario:** Finance posts the credit, then completes e-invoice submission from this tab or follows up in [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/).

{{< figure src="/images/internal-purchase-credit-note-applet/tab-e-invoice.png" alt="E-Invoice tab on purchase credit note after posting" caption="E-Invoice: submission and cancellation panels after FINAL when e-invoice is enabled." >}}

### Account

**When to use:** Always—supplier identity and addresses.

**What you do here:** Confirm **Entity Details**, **Bill To**, and **Ship To** match the supplier and addresses on the original purchase or return agreement.

**Typical scenario:** Credit for a return—the ship-to address is the supplier’s return warehouse.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-account.png" alt="Account tab on edit purchase credit note" caption="Account on edit: confirm supplier entity and addresses." >}}

### Lines

**When to use:** Always—what is being credited.

**What you do here:** Add, edit, or remove credit lines (item, qty, unit price, tax, remarks). Same grid as **Line Items** on create.

**Typical scenario:** Partial return—reduce qty on one line and add a remark with the RMA number.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-lines.png" alt="Lines tab on edit purchase credit note" caption="Lines on edit: add or adjust credited items, quantities, and prices." >}}

### ARAP

**When to use:** When the tab is visible and finance uses payables settlement on the document.

**What you do here:** View or manage accounts receivable/payable settlement—offset this credit against open supplier invoices or balances.

**Typical scenario:** Posted credit note reduces amount owed on a specific purchase invoice.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-arap.png" alt="ARAP tab on purchase credit note for payables settlement" caption="ARAP: offset this credit against open supplier invoices or balances." >}}

### Payment

**When to use:** When your process records payment lines directly on the credit document (uncommon for standard supplier credits—confirm with finance).

**What you do here:** Enter or review payment allocation lines tied to this document.

**Typical scenario:** Refund or settlement recorded on the same document per company policy.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-payment.png" alt="Payment tab on purchase credit note" caption="Payment: payment lines when your process records them on the credit document." >}}

### Department Hdr

**When to use:** When your company allocates credits by department, segment, or project at header level.

**What you do here:** Set segment, dimension, profit centre, or project on the document header for GL reporting.

**Typical scenario:** Credit for a department’s mistaken order—segment code routes the credit to the correct cost centre.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-department-hdr.png" alt="Department Hdr tab on purchase credit note" caption="Department Hdr: segment, dimension, profit centre, or project on the header." >}}

### Trace Document

**When to use:** When audit or finance needs posting trace on the generic document.

**What you do here:** Review system posting trace and linked posting events (read-only for most users).

**Typical scenario:** Support investigates why a credit did not appear in a report—trace shows posting history.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-trace-document.png" alt="Trace Document tab showing posting trace on purchase credit note" caption="Trace Document: read-only posting trace for audit and support." >}}

### Contra

**When to use:** When finance offsets this credit against another payable or document.

**What you do here:** Create or review contra entries that net this credit against an invoice, debit note, or other balance.

**Typical scenario:** Supplier sends a credit note that nets against an unpaid invoice—finance records contra here.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-contra.png" alt="Contra tab on purchase credit note" caption="Contra: net this credit against another payable or document." >}}

### Doc Link

**When to use:** When you must formally link this credit to related documents (PO, GRN, invoice, etc.).

**What you do here:** Add or view document links for traceability and matching—not the same as **KO For** on create, which pulls lines from GRN/PO/SDO.

**Typical scenario:** Link posted credit to the original purchase invoice number for three-way matching audit.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-doc-link.png" alt="Doc Link tab on purchase credit note for linking related documents" caption="Doc Link: formally link this credit to PO, GRN, invoice, or other related documents." >}}

### Attachment

**When to use:** When you need evidence on file (supplier PDF credit note, email approval, photos of returned goods).

**What you do here:** Upload, view, or download attachments stored against this document.

**Typical scenario:** Attach the supplier’s signed credit note PDF before **FINAL**.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-attachment.png" alt="Attachment tab on purchase credit note for uploading evidence files" caption="Attachment: upload supplier credit note PDFs, email approvals, or other evidence." >}}

### Export

**When to use:** When you need a data extract of this document for hand-off or external review.

**What you do here:** Run export in the format your administrator configured.

**Typical scenario:** Export credit note details for a supplier dispute file.

{{< figure src="/images/internal-purchase-credit-note-applet/tab-export.png" alt="Export tab on purchase credit note for data extracts" caption="Export: run configured data extracts of this document for external review." >}}

---

## Line Items workspace {#line-items-workspace}

The **Line Items** item in the left menu is not the same as the **Line Items** tab on **Create Purchase Credit Note** or the **Lines** tab on an open document. The menu opens a separate search grid so you can work across many documents and jump straight into editing one line.

1. Open **Line Items** from the sidebar.
2. Use search and filters to narrow the list.
3. Open a row to edit (screen title **Edit Item**).
4. Use the subtabs as shown—for example **Item Details**, **Costing Details**, and **Issue Link**; serial, batch, or bin subtabs appear when your item setup requires them. Click **SAVE** on the line editor when done.
5. Use **Delete** on a line when available and your policy allows it (confirm prompts if shown).

---

## File Import {#file-import}

Use **File Import** when your company loads credit note data from CSV instead of typing each document or line manually.

{{< figure src="/images/internal-purchase-credit-note-applet/file-import.png" alt="File Import upload screen titled Upload The Data with Delimeter, file upload area, Sample Format, and SUBMIT" caption="File Import: choose Delimeter, attach a CSV, use Sample Format for the template, then SUBMIT. Review results on the import record under Details and Checking." >}}

### Step-by-step upload

1. Open **File Import** from the sidebar and start a new import with **Create** / **+**.
2. The upload screen title is **Upload The Data**. Set **Delimeter** (the on-screen spelling) to match your CSV:
   - **COMMA** — fields separated by `,` (most common)
   - **PIPE** — fields separated by `|`
3. Add a `.csv` file with **Upload File** or drag and drop into the drop zone.
4. Open **Sample Format** to open the column-picker dialog and download the template CSV (`Purchase_Credit_Note_Master_Data_Template.csv`). **Target fields** (mandatory) are always included; you can add **source fields** (optional) from the left list.

{{< figure src="/images/internal-purchase-credit-note-applet/file-import-sample-format-dialog.png" alt="Sample Format dialog showing source fields and target fields for CSV import" caption="Sample Format: target fields (right) are mandatory; add optional source fields (left) before downloading the template CSV." >}}

5. Click **SUBMIT** to run the import.
6. Open the import record (**File Details**). Review **Details** for file-level status, and **Checking** for row-level validation.

### Sample Format: target fields (mandatory)

These columns are **always required** in your CSV header and must be **populated on every data row** you expect to import. They cannot be removed from the Sample Format download.

| Column | Purpose |
|--------|---------|
| `BRANCH_CODE` | Branch code where the credit note belongs. |
| `LOCATION_CODE` | Location or store code within the branch. |
| `DOC_CURRENCY` | Document currency code (for example `MYR`, `USD`). |
| `TXN_DATE` | Transaction date (match the date format in the sample template). |
| `HDR_REF_NO` | Header reference number for the credit note. |
| `QTY` | Line quantity being credited. |
| `SETTLEMENT_OR_ITEM_CODE` | Item code or settlement code for the line. |
| `AMOUNT_INCL_TAX` | Line amount including tax in document currency. |

### Sample Format: source fields (optional)

Select these in the **Sample Format** dialog when your CSV needs extra header, supplier, line, tax, GL, or e-invoice data. Add only the columns you will populate—empty optional columns are usually fine.

#### Header and document

| Column | Purpose |
|--------|---------|
| `PURCHASE_AGENT` | Purchaser or buyer code on the header. |
| `CREDIT_TERMS` | Credit terms code or name. |
| `CREDIT_LIMIT` | Credit limit reference when used. |
| `HDR_DESCRIPTION` | Header description text. |
| `HDR_REMARKS` | Header remarks. |
| `TRACKING_ID` | Tracking or RMA reference. |
| `Client Doc Type` | Client document type short code. |
| `Client Doc 1` – `Client Doc 5` | External reference numbers 1–5. |
| `BASE_DOC_X_RATE` | Exchange rate for foreign-currency documents. |
| `POSTING_STATUS` | Posting status when importing as draft or final per your process. |

#### Supplier (entity)

| Column | Purpose |
|--------|---------|
| `ENTITY_CODE` | Supplier code. |
| `ENTITY_NAME` | Supplier name. |
| `ENTITY_TYPE` | Entity type classification. |
| `ENTITY_ARAP_TYPE` | AR/AP type for the entity. |
| `ENTITY_ID_NO` | Supplier ID number. |
| `ENTITY_ID_TYPE` | ID type (for example NRIC, BRN). |
| `ENTITY_ID_NO_OLD` | Previous ID number when applicable. |
| `ENTITY_TOURISM_TAX_ID_NO` | Tourism tax ID. |
| `ENTITY_EINVOICE_TAX_ID_NO` | E-invoice tax ID. |
| `ENTITY_EINVOICE_ID_TYPE` | E-invoice ID type. |
| `ENTITY_EINVOICE_ID_VALUE` | E-invoice ID value. |
| `ENTITY_TAX_REG_NUMBER` | Tax registration number. |
| `ENTITY_SST_NO` | SST registration number. |
| `ENTITY_PHONE` | Supplier phone. |
| `ENTITY_EMAIL` | Supplier email. |
| `ENTITY_SKIP_EINVOICE` | Skip e-invoice flag when applicable. |
| `ENTITY_UPSERT` | Create or update supplier on import when enabled. |
| `ENTITY_BRANCH_CODE` | Supplier branch code. |
| `ENTITY_BRANCH_CODE_XTN_MAPPING_VALUE_01` – `05` | External mapping values for supplier branch. |

#### Billing and shipping address

| Column | Purpose |
|--------|---------|
| `BILLING_NAME`, `BILLING_EMAIL`, `BILLING_PHONE` | Bill-to contact. |
| `BILLING_ADDRESS_LINE_1` – `5`, `BILLING_COUNTRY`, `BILLING_STATE`, `BILLING_CITY`, `BILLING_POSTCODE` | Bill-to address. |
| `SHIPPING_NAME`, `SHIPPING_EMAIL`, `SHIPPING_PHONE` | Ship-to contact. |
| `SHIPPING_ADDRESS_LINE_1` – `5`, `SHIPPING_COUNTRY`, `SHIPPING_STATE`, `SHIPPING_CITY`, `SHIPPING_POSTCODE` | Ship-to address. |

#### Line item detail

| Column | Purpose |
|--------|---------|
| `ITEM_NAME` | Item description. |
| `ITEM_DESCRIPTION` | Extended item description. |
| `LINE_ITEM_NAME` | Line display name. |
| `LINE_ITEM_REMARKS` | Line remarks. |
| `LINE_BRANCH_CODE` | Branch on the line when different from header. |
| `ITEM_TXN_TYPE`, `ITEM_TXN_CLASS`, `ITEM_SUB_ITEM_TYPE` | Item transaction classification. |
| `ITEM_CCY_CODE` | Line item currency when used. |
| `UOM` | Unit of measure. |
| `UNIT_PRICE_INCL_TAX` | Unit price including tax. |
| `DISCOUNT_AMOUNT` | Discount on the line. |
| `TAX_CODE` | Tax code. |
| `TAX_AMOUNT` | Tax amount. |
| `ITEM_SERIAL_NO`, `ITEM_BATCH_NO`, `ITEM_TRACKING_ID` | Serial, batch, or tracking ID. |
| `GL_CODE` | GL account code. |
| `SEGMENT_CODE`, `GL_DIMENSION_CODE`, `PROFIT_CENTRE_CODE`, `PROJECT_CODE` | GL segments and dimensions. |
| `LINE_TXN_DATE` | Line transaction date when different from header. |
| `SORT_CODE` | Sort or display order. |
| `ITEM_REF_NO` | Item reference number. |
| `TXN_TYPE_PNS_STL_MTHD`, `STL_AMOUNT`, `TRANSACTION_NO`, `STL_REMARKS` | Settlement-related line fields when used. |

#### E-invoice (when applicable)

| Column | Purpose |
|--------|---------|
| `EINVOICE_ITEM_CLASSIFICATION_CODE`, `EINVOICE_ITEM_TAX_TYPE_CODE`, `EINVOICE_ITEM_UOM` | E-invoice line classification. |
| `EINVOICE_SUBMISSION_TYPE` | Submission type. |
| `EINVOICE_SUPPLIER_TIN_NO`, `EINVOICE_SUPPLIER_ENTITY_ID_TYPE`, `EINVOICE_SUPPLIER_ID_NO`, `EINVOICE_SUPPLIER_SST_NO` | Supplier e-invoice identity. |
| `EINVOICE_SUPPLIER_NAME`, `EINVOICE_SUPPLIER_EMAIL`, `EINVOICE_SUPPLIER_PHONE` | Supplier e-invoice contact. |
| `EINVOICE_SUPPLIER_ADDRESS_NAME`, `EINVOICE_SUPPLIER_ADDRESS_LINE_1` – `5`, `EINVOICE_SUPPLIER_ADDRESS_CITY`, `EINVOICE_SUPPLIER_ADDRESS_POSTCODE`, `EINVOICE_SUPPLIER_ADDRESS_STATE`, `EINVOICE_SUPPLIER_ADDRESS_COUNTRY` | Supplier e-invoice address. |
| `EINVOICE_SELF_BILLED` | Self-billed flag. |
| `EINVOICE_BILLING_FREQUENCY`, `EINVOICE_BILLING_PERIOD_START`, `EINVOICE_BILLING_PERIOD_END` | Billing period for e-invoice. |
| `ORIGINAL_EINVOICE_REF_UUID` | Reference to original e-invoice UUID when correcting. |

### Example CSV rows

**Minimal row (mandatory columns only):**

| BRANCH_CODE | LOCATION_CODE | DOC_CURRENCY | TXN_DATE | HDR_REF_NO | SETTLEMENT_OR_ITEM_CODE | QTY | AMOUNT_INCL_TAX |
|-------------|---------------|--------------|----------|------------|-------------------------|-----|-----------------|
| HQ | WH01 | MYR | 2026-06-01 | CN-2026-001 | ITEM-A001 | 10 | 500.00 |

**Row with supplier and reference (optional columns added):**

| BRANCH_CODE | LOCATION_CODE | DOC_CURRENCY | TXN_DATE | HDR_REF_NO | ENTITY_CODE | SETTLEMENT_OR_ITEM_CODE | QTY | AMOUNT_INCL_TAX | HDR_REMARKS |
|-------------|---------------|--------------|----------|------------|-------------|-------------------------|-----|-----------------|-------------|
| HQ | WH01 | MYR | 2026-06-01 | CN-2026-002 | SUPP001 | ITEM-B002 | 5 | 250.00 | Return RMA-456 |

### Import rules (read before SUBMIT)

- **Mandatory columns:** All eight target columns must appear in the header row and be filled on each data row; empty required cells produce errors on **Checking**.
- **Column names:** Match the Sample Format spelling and case exactly.
- **Delimiter:** Must match the **Delimeter** you select on **Upload The Data**—a comma file with **PIPE** selected (or vice versa) will fail or mis-parse rows.
- **Failed rows:** Treat **Checking** as the **source of truth** after each run. Fix the CSV and start a new import (or follow your admin’s recycle procedure).

### Import listing and File Details

After **SUBMIT**, the **File Import Listing** shows each upload:

| Column | Meaning |
|--------|---------|
| **File Name** | Uploaded file name. |
| **File Size** | Size of the upload. |
| **Format** | Usually **CSV**. |
| **Status** | Record status (for example **ACTIVE**). |
| **Process Status** | Overall import result—commonly **DONE** (completed) or **FAILED** (file-level failure). |
| **Error Message** | Summary when the whole file failed (wrong format, delimiter mismatch, etc.). |
| **Created Date / Created by** | Audit of who uploaded and when. |

{{< figure src="/images/internal-purchase-credit-note-applet/file-import-listing-status.png" alt="File Import listing showing Process Status and Error Message columns" caption="File Import listing: check Process Status and Error Message for file-level results." >}}

Open a row to see **File Details** with two tabs:

| Tab | Purpose |
|-----|---------|
| **Details** | File metadata and process status. |
| **Checking** | Row-by-row validation grid (helper table)—use this to fix data and re-import. |

### Checking tab (helper table) {#checking-tab}

The **Checking** tab is your main tool for troubleshooting CSV uploads.

{{< figure src="/images/internal-purchase-credit-note-applet/file-import-checking-tab.png" alt="File Details Checking tab with Processed and Validation Error columns" caption="Checking tab: row-level Processed status and Validation Error messages for self-service CSV fixes." >}}

| Column | Meaning |
|--------|---------|
| **Line Number** | Row number in your CSV (excluding header). |
| **Processed** | Whether this row was accepted (**true**) or rejected (**false**). |
| **Validation Error** | Plain-language reason the row failed (missing branch, invalid item, bad date, etc.). |
| **Branch Code, Location Code, Settlement/Item Code, …** | Values the system parsed from your file—compare with your CSV to find typos. |
| **Error Message / Short Error Message** | Technical detail for support when validation text is not enough. |

**Self-service correction workflow**

1. **SUBMIT** the file.
2. Open the import record → **Checking** tab.
3. Filter or scan for **Processed = false** and read **Validation Error** on each failed row.
4. Fix those rows in your CSV (delimiter, mandatory columns, valid codes, date format).
5. Upload again with **Create** / **+** and **SUBMIT** a corrected file.

{{< callout type="warning" >}}
If **Process Status** is **FAILED** with an **Error Message** on the listing but **Checking** is empty, the problem is usually file-level (delimiter, encoding, or no valid rows)—fix the file structure before row-level fixes.
{{< /callout >}}

If **File Import** is missing from the menu, feature visibility or role permissions may hide it.

---

## Personalization {#personalization}

**Personalization** is a separate menu (footer or sidebar link) for **individual user preferences**—it does not change company-wide settings in **Settings**.

| Feature | What you can set |
|---------|------------------|
| **Default Selection** | Your personal default **branch** and **location** when creating documents (within branches you are allowed to access). |
| **Single / double column layout** | **DEFAULT_TOGGLE_COLUMN** — prefer single- or dual-column form layout where supported. |

Use Personalization when you always work from the same branch or warehouse and want faster document creation without asking an admin to change tenant defaults.

Company-wide defaults remain under **Settings → Default Selection** (administrators only).

{{< figure src="/images/internal-purchase-credit-note-applet/personalization-default-selection.png" alt="Personalization Default Selection screen" caption="Personalization: set your own default branch and location without changing company-wide settings." >}}

---

## E-invoice and related flows {#e-invoice-and-related-flows}

On an open document, the **E-Invoice** tab appears when e-invoice is enabled for your tenant. After **FINAL**, panels such as submission or cancellation follow your country and company rules. The document and supplier self-billed flag drives self-billed behaviour in the UI (for example, which e-invoice subtabs show after posting). Configure or interpret self-billed with your finance team and with [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) where supplier e-invoice settings are documented.

Day-to-day monitoring of submissions, failures, and cancellations belongs in [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)—use that user guide for queue-based work, not a second copy of those steps here.

---

## Choosing other purchase documents {#when-to-use-which-purchase-document}

| Situation | Where to read more |
|-----------|---------------------|
| Supplier should charge you less (return, error, rebate, duplicate bill) | This applet — purchase credit note. |
| You need to charge the supplier more (under-billing, extra cost to supplier) | [Purchase Debit Note (Internal) Applet](/applets/purchase-workflow/internal-purchase-debit-note-applet/) |
| Physical return of goods with a dedicated return process | [Purchase Return (Internal) Applet](/applets/purchase-workflow/internal-purchase-return-applet/) |
| Refund flows your company separates from standard credits | [Purchase Refund Note (Internal) Applet](/applets/purchase-workflow/internal-purchase-refund-note-applet/) |

Related purchase flow guides:

- [Purchase Order (Internal) Applet](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Purchase GRN Stock In (Internal) Applet](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/)
- [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/)
- [Supplier Delivery Order Applet](/applets/purchase-workflow/supplier-delivery-order-applet/)

---

## Settings (for administrators) {#settings-for-administrators}

These live under **Settings** in the applet. Names match what users usually see in the sidebar.

### System configuration

| Area | What it is for |
|------|----------------|
| **Application Settings** | Hide/show fields, tabs, listing columns, and sidebar menus—see [Application Settings tabs](#application-settings-tabs) below. |
| **Default Selection** | Tenant-wide default **company**, **branch**, and **location** for new documents. |
| **Printable Format Settings** | Layout and content of printed or PDF credit notes (logo, columns, no-price variants, branch-specific formats). |
| **Branch Settings** | Branch-specific defaults such as print format per branch. |

{{< figure src="/images/internal-purchase-credit-note-applet/settings-printable-format.png" alt="Printable Format Settings for purchase credit note layout" caption="Printable Format Settings: configure logo, columns, and branch-specific print layouts for credit notes." >}}

### Application Settings tabs {#application-settings-tabs}

Open **Settings → Application Settings**. Use the top tabs to configure behaviour by screen area:

| Tab | What administrators configure |
|-----|------------------------------|
| **Sidebar Menu** | Show or hide **File Import**, **Line Items**, and other sidebar entries. |
| **Advanced Search Filter** | Hide date filters on listings. |
| **Gen Doc Listing** | Listing columns, sort order, **FINAL** / **DISCARD** / **VOID** button visibility, vertical vs horizontal layout defaults. |
| **Main Details** | Required or hidden header fields, external document references, currency and forex display, purchaser autofill. |
| **E-Invoice** | E-invoice tab and field visibility. |
| **Account** | **Entity Details**, **Bill To**, **Ship To** sub-tab visibility. |
| **Line Items** | Line grid columns, pricing, tax, serial/batch, costing toggles. |
| **KO For** | Knock-off tab on create (GRN / PO / supplier DO). |
| **Miscellaneous** | Hide **Payment**, **Contra**, **Doc Link**, **Attachment**, **Export**, **Department Hdr**, **Trace Document**, **ARAP** tabs. |

{{< figure src="/images/internal-purchase-credit-note-applet/settings-application-gen-doc-listing.png" alt="Application Settings Gen Doc Listing tab" caption="Gen Doc Listing: configure listing columns, sort order, and FINAL / DISCARD / VOID button visibility." >}}

{{< figure src="/images/internal-purchase-credit-note-applet/settings-application-main-details.png" alt="Application Settings Main Details tab" caption="Main Details: set required or hidden header fields and currency display options." >}}

### Change View

On many settings and document screens, **CHANGE VIEW** (top right) toggles between **horizontal tabs** and **vertical expansion panels**. Same fields and data—only layout changes. Train users on whichever mode your tenant sets as default under **Gen Doc Listing**.

{{< figure src="/images/internal-purchase-credit-note-applet/change-view-toggle.png" alt="CHANGE VIEW toggle between horizontal tabs and vertical expansion panels" caption="CHANGE VIEW: switch between horizontal tabs and vertical expansion panels without changing data." >}}

### Server-side permissions

| Area | What it is for |
|------|----------------|
| **Permission Wizard** | Map roles to applet functions step by step. |
| **Permission Set** | Reusable permission packages. |
| **User Permission** | Assign permissions to individual users. |
| **Role Permission** | Assign permissions by role. |

Video walkthrough for permission setup:

{{< youtube iitlqsVyH5g >}}

### Other settings areas

| Area | What it is for |
|------|----------------|
| **Client-side permission listing** | Fine control over buttons such as **FINAL**, **SAVE**, **DISCARD**, **VOID**. |
| **Webhook** | Events to other systems when data changes. |
| **Feature visibility** | Which menus and features appear. |
| **Role pricing scheme link** | Links roles to pricing where used. |
| **Release notes** | What changed in the applet. |
| **Applet log / Audit Trail** | Operational log for support and audit. |

Configure these according to your organisation’s procurement, finance, and approval policies.

---

## If something is wrong {#if-something-is-wrong}

| Problem | What to try |
|---------|-------------|
| Cannot create a document | Ask admin to check create permission and **Default Selection** (company/branch). |
| **FINAL**, **SAVE**, **DISCARD**, or **VOID** missing | Permissions, client-side permission listing, or Application Settings; finance or admin can adjust. |
| A trained tab disappeared | Application Settings **Miscellaneous** or field settings may hide it—admin review. |
| **File Import** not in the menu | May be off for your role or hidden under **Sidebar Menu** in Application Settings. |
| Tabs vs panels | Same data; use **CHANGE VIEW** or admin default in **Gen Doc Listing**. |
| CSV import rows fail | Open **Checking** tab; match **Delimeter** and mandatory columns to [File Import](#file-import). |

Still stuck? Note your user name, document number (if any), and what you clicked, then contact your BigLedger administrator or internal help desk.

---

## Frequently asked questions {#frequently-asked-questions}

What is the difference between a purchase credit note and a supplier invoice?  
An invoice from the supplier normally increases what you owe. A purchase credit note reduces that balance or corrects an earlier posting—see [Purpose and overview](#what-is-a-purchase-credit-note).

When should I use a credit note instead of a debit note?  
Use a credit note when the outcome is “we pay less” or “take this off our account.” Use a debit note when policy says you must charge the supplier more. See [Choosing other purchase documents](#when-to-use-which-purchase-document).

How do I link a credit note to an existing purchase invoice?  
On create, **KO For** pulls from **Purchase GRN**, **Purchase Order**, or **Supplier Delivery Order**, not directly from a purchase invoice screen—see [KO For tab](#ko-for-tab-create). For **invoice**-level linking or settlement, use **Doc Link** or **ARAP** when visible, or follow [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/).

File import failed—what should I check first?  
Open the import record and read the **Checking** tab; fix **Delimeter** and column layout to match **Sample Format**. See [Checking tab](#checking-tab).

What is the Line Items menu versus the Line Items tab or Lines tab?  
The **Line Items** menu searches across documents. On **Create Purchase Credit Note** the tab is **Line Items**; on an existing document the tab is **Lines**—same line list, different screen.

What does Self Billed mean on the list?  
The list column **Self Billed ?** reflects the document/supplier self-billed flag used for e-invoice. Supplier-side setup is described with purchase invoice and e-invoice training.

What is Personalization versus Default Selection in Settings?  
**Personalization** sets **your** default branch/location and layout. **Settings → Default Selection** sets **company-wide** defaults for all users (admin only).

---

## Related documentation {#related-documentation}

- [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) — invoice, knock-off, ARAP, file import templates, self-billed context.
- [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) — submission status and operational follow-up.
- [Purchase Order (Internal) Applet](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Purchase GRN Stock In (Internal) Applet](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/)
- [Purchase Debit Note (Internal) Applet](/applets/purchase-workflow/internal-purchase-debit-note-applet/)
- [Purchase Return (Internal) Applet](/applets/purchase-workflow/internal-purchase-return-applet/)
- [Purchase Refund Note (Internal) Applet](/applets/purchase-workflow/internal-purchase-refund-note-applet/)
- [Supplier Delivery Order Applet](/applets/purchase-workflow/supplier-delivery-order-applet/)

---

## Glossary {#glossary}

| Term | Meaning |
|------|---------|
| ARAP | Accounts receivable/payable area on the document for settlement when enabled. |
| Contra | Contra entries when the tab is visible—your finance team defines use. |
| Delimeter | On-screen label for the CSV field separator on file import (match your file; the usual English spelling is “delimiter”). |
| DISCARD | Removes a draft credit note when shown (draft or no posting status yet), subject to lock and settings. |
| Doc Link | Tab for linking related documents when visible. |
| FINAL | Header action to post/finalize the document when permitted. |
| KO / knock-off | Matching this credit to other purchase documents. **KO For** on create imports lines from **Purchase GRN**, **Purchase Order**, or **Supplier Delivery Order**. |
| Self-billed | E-invoice mode for self-billed suppliers; changes which e-invoice panels apply. |
| VOID | Cancels a posted (**FINAL**) document when shown, subject to lock and settings. |
