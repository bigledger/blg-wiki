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
lastmod: 2026-04-26
draft: false
---

## Purpose and overview {#what-is-a-purchase-credit-note}

In purchasing, a credit note (also called a supplier credit or purchase credit note) is a formal record that reduces what your company owes a supplier, or corrects what you already recorded, when something changes after a purchase or invoice. Typical reasons include returned goods, wrong quantities or prices, agreed rebates, or duplicate billing. In plain terms: a supplier invoice says you should pay more; a purchase credit note says you should pay less or take an amount off the account.

In BigLedger, the Purchase Credit Note (Internal) applet is where you create and maintain that record inside the ERP, with the same overall shape as other purchase documents: header details, supplier account, and lines so procurement and finance stay aligned.

{{< callout type="info" >}}
Cannot see a menu item or button? Administrators control feature visibility, field settings, and permissions. If something you were trained on is missing, ask your admin—it may be turned off for your role or company policy.
{{< /callout >}}

<a id="key-concepts-for-purchase-credit-notes"></a>

Every credit note ties together who you are crediting (supplier on **Account**), which document you are editing (header on **Main Details**), and what is credited on each line (**Line Items** on create, **Lines** on edit). Optional tabs add payment, department, knock-off from GRN/PO/supplier DO (**KO For**), e-invoice, settlement, and evidence when your tenant shows them.

---

## Before you begin

- Agree internally who proposes credit amounts (procurement) and who approves them for posting (finance), so totals and reasons are clear before you use FINAL.
- The supplier must exist in master data before you can complete the Account tab on a new credit note.
- Whether you must tie a credit to an existing posted invoice depends on your process. When **KO For** is visible on create, it is for knock-off from **Purchase GRN**, **Purchase Order**, or **Supplier Delivery Order** (see [KO For tab](#ko-for-tab-create)); linking or settlement against a **posted purchase invoice** may use **Doc Link**, **ARAP**, or other steps your finance team defines.
- For statutory e-invoice steps after posting, your organisation may also use [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)—see that guide for queues and status, not this page.

---

## Who benefits and problems solved {#what-problems-does-this-solve}

| Who | Typical use |
|-----|-------------|
| Procurement | Create and update credit notes, supplier and addresses, and lines; use bulk tools when many lines change. |
| Finance | Review totals, use FINAL when the credit is ready for downstream posting, use DISCARD or VOID when policy allows; work in E-Invoice, ARAP, or Contra when enabled and trained. |
| Operations | Run file imports, attachments, or exports when your company uses them for evidence or hand-off. |

Without a structured credit-note process, teams often rely on email and spreadsheets, which makes it hard to prove what was agreed, match credits to invoices or receipts, and keep procurement and finance on the same numbers. This applet gives one official list, header plus supplier plus lines in one place, optional links to e-invoice and settlement when your tenant enables them, and bulk paths through the Line Items workspace and File Import.

---

## Key features overview

{{< cards >}}
{{< card title="Quick start" subtitle="Minimum paths by role" link="#quick-start-guide" >}}
{{< card title="Record a supplier credit" subtitle="Create and edit a credit note in this applet" link="#record-a-supplier-credit" >}}
{{< card title="Line Items workspace" subtitle="Search and edit lines across documents" link="#line-items-workspace" >}}
{{< card title="File Import" subtitle="CSV upload and validation" link="#file-import" >}}
{{< card title="E-invoice and related" subtitle="What opens on the document" link="#e-invoice-and-related-flows" >}}
{{< card title="Settings" subtitle="For administrators" link="#settings-for-administrators" >}}
{{< card title="If something is wrong" subtitle="Common fixes" link="#if-something-is-wrong" >}}
{{< card title="FAQ" subtitle="Common questions" link="#frequently-asked-questions" >}}
{{< card title="Glossary" subtitle="Terms used in this guide" link="#glossary" >}}
{{< /cards >}}

{{< figure src="/images/internal-purchase-credit-note-applet/internal-purchase-credit-note-applet-overview-infographic.png" alt="Overview of the Purchase Credit Note (Internal) Applet: documents, line items, and import" caption="Purchase credit notes, the Line Items workspace, and file import in one applet." >}}

---

## Quick start {#quick-start-guide}

The layout may show the same areas as tabs across the top or as expansion panels you open one at a time—that is a tenant display choice only; the underlying data and steps are the same.

### For procurement: record a credit and get it ready for finance

1. Open Purchase Credit Note (Internal) from the sidebar and use the list search or filters to find an existing document, or start **Create** / **+** for a new one.
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

3. Click **CREATE** to save a new document (use **RESET** only if you intend to clear the draft form). After the document exists, continue editing with **SAVE**; optional tabs on the saved document are described under [Record a supplier credit](#record-a-supplier-credit).

### For finance: approve posting and follow your close-out steps {#finalize-void-or-discard-finance}

<a id="understanding-draft-vs-posted"></a>

1. Open the document from the list and confirm supplier, totals, and lines against your approval rules.
2. Use **SAVE** while changes are still in progress. When the credit is ready for generic document posting, use **FINAL** (header button on the edit screen).
3. On **Main Details**, **DISCARD** removes a draft (no posting status yet, or status DRAFT). **VOID** appears after the document is **FINAL** (posted), when your settings and permissions allow. Either action can be hidden or blocked while the document is locked—ask finance or admin if a button is missing.
4. Complete **E-Invoice**, **ARAP**, **Contra**, **Doc Link**, or other tabs only as your training describes. Deep e-invoice submission and My E-Invoice workflows are covered in [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) and, where relevant, [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/).

### For operations: bulk lines and evidence

1. Use [File Import](#file-import) for CSV uploads; fix errors shown on **Checking**, then re-import or continue per your admin’s procedure.
2. Use [Line Items workspace](#line-items-workspace) to find and correct specific lines after import or when working across many documents.
3. On an open document, use **Attachment** or **Export** when those tabs are visible and your process requires files or extracts.

{{< callout type="tip" >}}
After you FINAL, the document is treated as posted for your process: follow-up (payables effect, e-invoice, settlement) depends on tenant configuration. Confirm with finance whether a settlement run, e-invoice check, or other step is required—see [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) for ARAP and invoice-side context where credits mirror invoices.
{{< /callout >}}

---

## Record a supplier credit {#record-a-supplier-credit}

<a id="purchase-credit-notes-in-detail"></a>
<a id="search-and-open-existing-credit-notes"></a>

This is the day-to-day workflow inside the applet: one list, one document, supplier account, and credit lines.

### Main list: Purchase Credit Note (Internal)

From the sidebar, open the main list to search, filter, and open documents. **Create** / **+** starts a new credit note when you have permission. Columns may include document number, dates, amounts, **Self Billed ?** (reflects the header/supplier self-billed flag when present), and status—exact columns depend on configuration.

{{< figure src="/images/internal-purchase-credit-note-applet/1.png" alt="Purchase Credit Note (Internal) listing with search and Create control" caption="Main list: search and filter credit notes, open a row, or start a new document with Create / +." >}}

### Create a new credit note {#create-a-purchase-credit-note}

1. From the list, click **Create** / **+**. The screen title is **Create Purchase Credit Note**.
2. **Main Details** — dates, references, and other header fields your company requires.
3. **Account** — select the supplier and billing/shipping details as required.

{{< figure src="/images/internal-purchase-credit-note-applet/2.png" alt="Create Purchase Credit Note screen showing Main Details or Account tab with header and supplier fields" caption="Create a credit note: complete Main Details and Account before moving to lines." >}}

4. **Line Items** — add lines (items, quantities, amounts) for what is being credited; see procurement notes under [Quick start](#quick-start-guide) for references and pricing.

{{< figure src="/images/internal-purchase-credit-note-applet/3.png" alt="Create Purchase Credit Note Line Items tab with credit lines in the grid" caption="Line Items: enter each credited item, quantity, and unit price (or use KO For when your process starts from another document)." >}}
5. Optional tabs (only if shown): **Payment**, **Department Hdr**, **KO For** — complete when your process says so. See [KO For tab](#ko-for-tab-create).
6. Click **CREATE** to persist the document. Use **RESET** to clear the unsaved create form.

### KO For tab (create) {#ko-for-tab-create}

The **KO For** tab is optional and only appears when your administrator enables it. It exists so you can **import knock-off lines from an existing purchase document** instead of re-typing item codes, quantities, and baseline amounts.

Inside the tab you get subtabs such as **KO For Purchase GRN**, **KO For Purchase Order**, and **KO For Supplier Delivery Order** (exact titles match your screen). Typical flow: open the subtab that matches the document you are crediting against, **search and select** that document, then use the knock-off action your training describes. The system brings **open quantities and linked line data** from that document into this credit note so you start from what was already received or ordered. **Review and adjust** lines afterward if the credit quantity or price differs from what was pulled (for example partial return or negotiated credit).

If you **skip KO For**, you can still enter lines manually on **Line Items**; finance may later match the credit to invoices or payables using **Doc Link**, **ARAP**, or other tools on the saved document. Whether knock-off is required is a **company rule**, not something the applet decides for you.

For invoice-centric knock-off, settlement, and ARAP behaviour, continue with [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) after the credit note exists if that is how your tenant is set up.

### Edit an existing credit note

Open a row from the list. The header shows **SAVE** and, when allowed, **FINAL**. Tabs on the saved document commonly include:

{{< figure src="/images/internal-purchase-credit-note-applet/4.png" alt="Open purchase credit note in edit mode with SAVE and FINAL in the header" caption="After the document exists: use SAVE while editing; use FINAL when finance is ready to post the credit note." >}}

| Area | Typical use |
|------|-------------|
| Main Details | Header fields; **DISCARD** or **VOID** appear here when permitted (see [Quick start](#quick-start-guide)). |
| E-Invoice | E-invoice panels after posting when enabled; self-billed suppliers can change which subtabs appear—see [E-invoice and related flows](#e-invoice-and-related-flows). |
| Account | Supplier and addresses. |
| Lines | Same line grid as **Line Items** on create; the label on edit is **Lines**. |
| ARAP | Accounts receivable/payable settlement when the tab is visible. |
| Payment | Payment lines when visible. |
| Department Hdr | Department or segment on the header when visible. |
| Trace Document | Generic document posting trace when visible. |
| Contra | Contra entries when visible. |
| Doc Link | Links to related documents when visible. |
| Attachment | Attach evidence when visible. |
| Export | Export when visible. |

---

## Line Items workspace {#line-items-workspace}

<a id="line-items"></a>
<a id="work-on-many-lines-at-once-line-items"></a>

The **Line Items** item in the left menu is not the same as the **Line Items** tab on **Create Purchase Credit Note** or the **Lines** tab on an open document. The menu opens a separate search grid so you can work across many documents and jump straight into editing one line.

1. Open **Line Items** from the sidebar.
2. Use search and filters to narrow the list.
3. Open a row to edit (screen title **Edit Item**).
4. Use the subtabs as shown—for example **Item Details**, **Costing Details**, and **Issue Link**; serial, batch, or bin subtabs appear when your item setup requires them. Click **SAVE** on the line editor when done.
5. Use **Delete** on a line when available and your policy allows it (confirm prompts if shown).

---

## File Import {#file-import}

<a id="import-rows-from-a-csv-file"></a>

Use **File Import** when your company loads line or header-related data from CSV instead of typing each row.

{{< figure src="/images/internal-purchase-credit-note-applet/file-import.png" alt="File Import upload screen titled Upload The Data with Delimeter, file upload area, Sample Format, and SUBMIT" caption="File Import: choose Delimeter, attach a CSV, use Sample Format for the template, then SUBMIT. Review results on the import record under Details and Checking." >}}

1. Open **File Import** from the sidebar and start a new import with **Create** / **+**.
2. The upload screen title is **Upload The Data**. Set **Delimeter** (the on-screen spelling) to match your CSV.
3. Add a `.csv` file with **Upload File** or drag and drop into the drop zone.
4. Open **Sample Format** to download or view the expected layout. That file is the contract for your CSV: **column names and order should match it** (including spelling and case if your template is strict). Use the same **date and number formats** as the sample rows (many tenants use ISO dates `YYYY-MM-DD` in CSV—if your sample shows another pattern, follow the sample).
5. Click **SUBMIT** to run the import.
6. Open the import record (**File Details**). Review **Details** for status and metadata, and **Checking** for row-level validation messages.

**Credit note CSV — minimum rules (read before SUBMIT)**

- **Mandatory columns:** Any column required in **Sample Format** must be present in the header row and populated on each data row you expect to import; empty required cells produce errors on **Checking**.
- **Failed rows:** Errors are listed per row on **Checking**; fix the CSV and run **SUBMIT** again on a new import (or follow your admin’s recycle procedure). Whether the server keeps partial successes when some rows fail is decided by backend rules—treat **Checking** as the source of truth after each run.
- **Deeper column semantics** (tax codes, document links, item cross-refs) align with other purchase CSV imports in many deployments—use the File Import section in [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) when you need field-by-field explanations beyond these basics.

If **File Import** is missing from the menu, feature visibility or role permissions may hide it.

---

## E-invoice and related flows {#e-invoice-and-related-flows}

On an open document, the **E-Invoice** tab appears when e-invoice is enabled for your tenant. After **FINAL**, panels such as submission or cancellation follow your country and company rules. The document and supplier **einvoice_self_billed** flag drives self-billed behaviour in the UI (for example, which e-invoice subtabs show after posting). Configure or interpret self-billed with your finance team and with [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) where supplier e-invoice settings are documented.

Day-to-day monitoring of submissions, failures, and cancellations belongs in [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)—use that user guide for queue-based work, not a second copy of those steps here.

---

## Choosing other purchase documents {#when-to-use-which-purchase-document}

Use the document your finance and procurement policy names for each situation. This table points to the right guide; follow the linked applet for step-by-step behaviour.

| Situation | Where to read more |
|-----------|---------------------|
| Supplier should charge you less (return, error, rebate, duplicate bill) | This applet — purchase credit note. |
| You need to charge the supplier more (under-billing, extra cost to supplier) | [Purchase Debit Note (Internal) Applet](/applets/purchase-workflow/internal-purchase-debit-note-applet/) |
| Physical return of goods with a dedicated return process | [Purchase Return (Internal) Applet](/applets/purchase-workflow/internal-purchase-return-applet/) — may handle stock and paperwork; the credit note may still be the financial record depending on setup. |
| Refund flows your company separates from standard credits | [Purchase Refund Note (Internal) Applet](/applets/purchase-workflow/internal-purchase-refund-note-applet/) |

Related purchase flow guides (navigation and training live there):

- [Purchase Order (Internal) Applet](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Purchase GRN (Internal) Applet](/applets/purchase-workflow/internal-purchase-grn-applet/)
- [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/)
- [Supplier Delivery Order Applet](/applets/purchase-workflow/supplier-delivery-order-applet/)

---

## Settings (for administrators) {#settings-for-administrators}

These live under **Settings** in the applet. Names match what users usually see in the sidebar.

| Area | What it is for |
|------|----------------|
| Default selection | Default company, branch, or location for new documents. |
| Field settings | Required or hidden fields on forms. |
| Printable format settings | Printed or PDF output for this applet. |
| Branch settings | Branch-specific defaults (for example print format per branch). |
| Webhook | Events to other systems when data changes. |
| Feature visibility | Which menus and features appear. |
| Client-side permission listing | Fine control over buttons such as FINAL, SAVE, DISCARD, VOID. |
| Role pricing scheme link | Links roles to pricing where used. |
| Permission Wizard | Map roles to applet functions. |
| Permission set listing | Reusable permission packages. |
| User / Team / Role permission listing | Who can do what. |
| Release notes | What changed in the applet. |
| Applet log | Operational log for support. |

**Personalization** (separate menu) lets each user adjust personal default selection and sidebar order without changing company-wide settings.

---

## If something is wrong {#if-something-is-wrong}

| Problem | What to try |
|---------|-------------|
| Cannot create a document | Ask admin to check create permission and default selection (company/branch). |
| FINAL, SAVE, DISCARD, or VOID missing | Permissions, client-side permission listing, or feature visibility; finance or admin can adjust. |
| A trained tab disappeared | Field settings or feature flags may hide it—admin review. |
| File Import not in the menu | May be off for your role or hidden in settings. |
| Tabs vs panels | Same data; tenant UI mode only. |

Still stuck? Note your user name, document number (if any), and what you clicked, then contact your BigLedger administrator or internal help desk.

---

## Frequently asked questions {#frequently-asked-questions}

What is the difference between a purchase credit note and a supplier invoice?  
An invoice from the supplier normally increases what you owe. A purchase credit note reduces that balance or corrects an earlier posting—see [Purpose and overview](#what-is-a-purchase-credit-note).

When should I use a credit note instead of a debit note?  
Use a credit note when the outcome is “we pay less” or “take this off our account.” Use a debit note when policy says you must charge the supplier more. See [Choosing other purchase documents](#when-to-use-which-purchase-document).

When should I use a credit note instead of a purchase return?  
Use [Purchase Return (Internal) Applet](/applets/purchase-workflow/internal-purchase-return-applet/) when your process is driven by physical returns and stock movement; use this applet for the financial credit note (often both apply—follow training).

How do I link a credit note to an existing purchase invoice?  
On create, **KO For** pulls from **Purchase GRN**, **Purchase Order**, or **Supplier Delivery Order**, not directly from a purchase invoice screen—see [KO For tab](#ko-for-tab-create). For **invoice**-level linking or settlement, use **Doc Link** or **ARAP** when visible, or follow [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/). Your finance team defines the exact matching rules.

Can I post a standalone credit note without a prior invoice?  
Often yes when policy allows; optional KO For does not apply to every tenant. Confirm with finance before assuming settlement behaviour.

Does a posted credit note reduce supplier balance?  
In typical AP setups a posted credit reduces obligation or offsets invoices depending on ARAP, knock-off, and contra configuration. Use the **ARAP** tab on the document and your finance reporting to confirm numbers.

Can I edit a credit note after it is posted?  
Usually not, or only limited fields, depending on permissions and rules. Corrections may require a new document or void flow—ask finance.

What is the difference between Void and Discard?  
**DISCARD** is shown for drafts: there is no posting status yet, or status is DRAFT, while the document is not locked and discard is not hidden in applet settings. **VOID** is shown when posting status is **FINAL** (posted), the document is not locked, and either void is not hidden in applet settings or your user has the client-side permission that forces the void button to show. If a button is missing, check lock state, feature visibility, and permissions.

Why is FINAL or SAVE missing?  
Usually permissions or feature visibility. Admin can check Permission Wizard, client-side permission listing, and feature visibility for this applet.

File import failed—what should I check first?  
Open the import record and read the **Checking** tab; fix **Delimeter** and column layout to match **Sample Format**. For column semantics, use [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) File Import guidance.

What is the Line Items menu versus the Line Items tab or Lines tab?  
The **Line Items** menu searches across documents. On **Create Purchase Credit Note** the tab is **Line Items**; on an existing document the tab is **Lines**—same line list, different screen.

What does Self Billed mean on the list?  
The list column **Self Billed ?** reflects the document/supplier self-billed flag used for e-invoice. Supplier-side setup is described with purchase invoice and e-invoice training; use the flag only as your organisation directs.

---

## Related documentation {#related-documentation}

<a id="what-happens-after-you-post"></a>

- [Purchase Invoice (Internal) Applet](/applets/finance/internal-purchase-invoice-applet/) — invoice, knock-off, ARAP, file import templates, self-billed context.
- [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) — submission status and operational follow-up.
- [Purchase Order (Internal) Applet](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Purchase GRN (Internal) Applet](/applets/purchase-workflow/internal-purchase-grn-applet/)
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
| KO / knock-off | Matching this credit to other purchase documents. **KO For** on create imports lines from **Purchase GRN**, **Purchase Order**, or **Supplier Delivery Order** so you do not re-key; invoice-side settlement often uses **Doc Link** or **ARAP**. |
| Self-billed | E-invoice mode tied to `einvoice_self_billed` on the document/supplier; changes which e-invoice panels apply—see Purchase Invoice and e-invoice guides. |
| VOID | Cancels a posted (**FINAL**) document when shown, subject to lock and settings. |
