---
title: "Sales Inquiry (Internal) Applet"
description: "Capture and manage internal sales inquiries with customer and line-item detail, posting controls, export, conversion to receipt voucher, and a dedicated line-items workspace."
tags:
- sales-workflow
- internal-sales
- sales-inquiry
- pre-sales
- line-items
- customer-management
weight: 15
date: 2026-04-11
lastmod: 2026-05-05
draft: false
---

## Purpose and Overview

The **Internal Sales Inquiry Applet** is where your team records **sales inquiries** before they become firm commitments such as quotations or sales orders. It brings together the customer (or prospect), the sales agent, line-level products or services, delivery and billing context, optional collection and contra lines, and supporting files—so everyone works from one structured document instead of scattered notes or email threads.

{{< callout type="info" >}}
**Core Concept**: The applet links **who** you are talking to (customer, member, CRM contact), **what** they are interested in (line items from search, jobsheet, quotation, or a prior inquiry), and **how** the case should proceed (delivery details, collections, attachments, final posting, export, or conversion).
{{< /callout >}}

An internal sales inquiry is typically a **draft-friendly** document: you can build it up over time, save changes, and when your process allows, mark selected records as **FINAL** from the listing or from the document screen. Depending on your company’s setup, you can also **export** the document and use **Convert** to create an **Internal Receipt Voucher** (the screen warns that converting cancels the current inquiry—treat this as a deliberate, controlled step).

## Document Status Reference {#document-status-reference}

| Posting Status | Meaning | What you can do |
|----------------|---------|-----------------|
| **DRAFT** | Work in progress | **SAVE**, **FINAL**, edit fields, add lines, update account details |
| **FINAL** | Posted / locked | **VIEW**, **EXPORT**, attempt **CONVERT** (only when enabled), add attachments or related documents (limited edits) |

{{< callout type="warning" >}}
After **FINAL**, the inquiry is locked and cannot be edited in the normal way. In most setups header fields and line items are read-only; minor fields (for example remarks or attachments) may still be editable depending on tenant rules. If a formal amendment is required, the usual options are to **VOID** and recreate the inquiry, or follow your organisation's amendment/adjustment process — contact your administrator for the tenant-specific procedure.
{{< /callout >}}

---

## Before You Start

- You need a **customer** that exists in master data (you will select it on the **Account** tab). If the customer is missing, ask your administrator to add it to master data.
- Prepare the **line items** you will need—product codes, quantities, or links to jobsheets or prior quotations if your process uses them.
- Know your **sales agent** and **credit terms** defaults, or have your company's standard policy ready.
- If your company uses **member cards** or **CRM contacts**, have that information ready.
- Decide if you will use **delivery details**, **collections**, **contra**, or **department headers**—your administrator can show you which tabs are enabled.
- Check your **permissions**: can you **create** inquiries, **finalize** them, and **convert** to receipt voucher if needed?

If you are unsure whether search tabs (Jobsheet Item, Quotation Item, Previous Sales Inquiry) apply to your login, ask your **administrator** or **finance team lead**.

---

## Glossary {#glossary}

| Term | Meaning in this guide |
|------|------------------------|
| **Inquiry** | A pre-sales document that captures customer interest, line items, and rough pricing before formal orders. |
| **Posting Status** | The state of the inquiry: **DRAFT** (editable) or **FINAL** (locked for changes). |
| **Line Items** | The products or services listed on the inquiry with quantities, pricing, and tax. |
| **Member Card** | A loyalty or membership identifier linked to the customer for rewards or special pricing. |
| **CRM Contact** | A person or contact linked to the customer account for relationship tracking. |
| **Collection** | Optional settlement terms or payment arrangement lines attached to the inquiry. |
| **Contra** | Offset transactions that reduce or balance amounts (used by finance when configured). |
| **Department Header** | Cost centre, profit centre, project, or segment codes for financial allocation. |
| **Knock-off (KO)** | Sourcing lines from another document (jobsheet, quotation, or prior inquiry) without manual re-entry. |
| **UOM** | Unit of measure (for example **EA**, **BOX**, **KG**). |
| **Convert** | Transform the inquiry into an **Internal Receipt Voucher** (final, controlled step that cancels the inquiry). |
| **Export** | Save the inquiry as PDF, CSV, DOCX, or ZIP for distribution or record-keeping. |
| **Internal Receipt Voucher** | The downstream document created when an inquiry is formally converted. |
---

## Key Features Overview

### Who Benefits from This Applet?

**Sales representatives and internal sellers:**
- Start inquiries quickly with **Create** and a guided tab layout (**Main**, **Account**, **Line Items**, and more)
- Pull lines from **Search Item**, **Jobsheet Item**, **Quotation Item**, or **Previous Sales Inquiry** so you do not re-key data
- Attach files, add contra lines, and refine pricing and tax-related fields per line before anything is committed downstream

**Sales managers and team leads:**
- Review open inquiries from the **Internal Sales Inquiry Listing** with **Posting Status**, amounts, and key dates visible
- Use **FINAL** on the listing to post multiple selected inquiries in one action (only rows that are not already final are updated)
- Open the **Line Items** menu for a cross-document line view when you need visibility without opening every header

**Finance and operations staff:**
- See transaction amounts and posting status alongside branch and customer context
- Rely on structured **Collection** and **Contra** sections when your process ties inquiries to settlement logic
- Use **Export** (PDF, CSV, DOCX, or ZIP, depending on configuration) for internal checks or handoff

**Administrators and configuration owners:**
- Control defaults, field visibility, printable formats, branch behaviour, feature visibility, and permissions from **Settings**
- Let users override layout with **Personalization** (for example default branch, location, language, tab orientation, and column layout)

### What Problems Does This Solve?

**The informal inquiry problem:**

Without a dedicated inquiry record, early-stage sales work often lives in spreadsheets, chat messages, or ad hoc documents. That makes it hard to know which version is current, who owns the customer context, or what was promised before a quotation or order exists.

**The Internal Sales Inquiry Applet solution:**

- **Single source of truth** for each inquiry, with a full header, account, and line structure shared with other internal sales applets in the platform
- **Flexible line sourcing** so items can be added from catalog search, jobsheets, quotations, or past inquiries for the same customer
- **Clear posting state** via **Posting Status** (for example **DRAFT** when empty) and **FINAL** when your process locks the document
- **Operational depth** where you need it: delivery instructions, department header fields, collections, contra, attachments, related documents, and issue links on lines
- **Controlled conversion** to **Internal Receipt Voucher** when your business rules call for it, with an explicit on-screen warning about cancelling the inquiry

---

{{< figure src="/images/internal-sales-inquiry-applet/internal-sales-inquiry-overview-infographic.png" alt="Internal Sales Inquiry Applet Overview - showing inquiry process from customer input through line items to final conversion" caption="From scattered notes to structured inquiries: centralized customer and line-item tracking with flexible sourcing, posting controls, and controlled conversion." >}}

---

## Key Features Overview

{{< cards >}}
  {{< card title="Inquiry listing & search" subtitle="Grid, advanced search, multi-select FINAL" link="#inquiry-listing" >}}

  {{< card title="Create & view documents" subtitle="Tabs or expansion panels for all sections" link="#document-structure" >}}

  {{< card title="Line items" subtitle="Add, edit, and source lines from multiple places" link="#line-items" >}}

  {{< card title="Line Items menu" subtitle="Cross-inquiry line listing and edit" link="#line-items-menu" >}}

  {{< card title="Finalize, save, reset" subtitle="Posting status and document actions" link="#finalize-save-reset" >}}

  {{< card title="Export & convert" subtitle="Print/export formats and receipt voucher" link="#export-and-convert" >}}

  {{< card title="Configuration & settings" subtitle="Defaults, fields, formats, permissions" link="#configuration--settings" >}}

  {{< card title="Personalization" subtitle="User defaults and sidebar" link="#personalization" >}}

  {{< card title="Quick Start Guide" subtitle="Steps by role" link="#quick-start-guide" >}}

  {{< card title="FAQ" subtitle="Common questions" link="#faq" >}}
{{< /cards >}}

---

## Key Concepts

### The inquiry framework

| Aspect | What it represents | Typical example |
|--------|--------------------|-----------------|
| **Who** | Customer entity, optional member card, CRM contact, sales agent | A corporate account with a named contact |
| **What** | Line items, quantities, prices, taxes, issue links | Items from search or pulled from an existing quotation |
| **How** | Delivery details, collections, contra, posting, export, convert | Draft inquiry → finalized record → export for approval → or convert to receipt voucher |

{{< callout type="tip" >}}
**Practical tip**: Select the **customer** in **Account** before using **Previous Sales Inquiry** as a line source, so the applet can narrow prior inquiries to the right entity.
{{< /callout >}}

### Listing columns you can expect

The main listing is a data grid with **advanced search**, **column layout toggle**, and **client-side pagination**. Columns are driven by your environment but commonly include:

- Document reference (primary document number column on the screen)
- **Posting Status** (blank values may display as **DRAFT**)
- **Branch**, **Customer Name**, **Sales Agent**
- **Amount Txn**
- **Updated Date**, **Created Date**, **Transaction Date**

### Tabs versus expansion panels

The create and view screens can show the same information either as **horizontal tabs** or as **stacked expansion panels**. Your administrator controls this behaviour through applet and personalization settings (for example vertical orientation and which panels start expanded). If you cannot find a section, scroll the page or expand collapsed panels.

### Line item detail tabs

When you **add** or **edit** a line, you typically work through **Item Details**, optional **Costing Details** (unless hidden by settings), **Pricing Details**, and **Issue Link**. **Edit Issue**, **Worklog**, and **Log Time** appear in the dedicated **Line Items** menu flow when your process uses those features.

---

## Quick Start Guide {#quick-start-guide}

{{< callout type="info" >}}
**Sales and operations staff:** Follow the [Eight steps to your first inquiry](#eight-steps) and [Detailed walkthrough](#detailed-walkthrough-sales). **Sales managers:** Jump to [Review and finalize inquiries](#review-and-finalize). **Administrators:** See [First-time setup](#first-time-setup).
{{< /callout >}}

### Eight steps to your first inquiry {#eight-steps}

1. Open **Internal Sales Inquiry** from the sidebar.
2. Click **+** (Create) on the listing. The **Create Internal Sales Inquiry** screen opens.
3. Click the **Main** tab. Set **Transaction Date**, **Sales Agent**, and **Credit Terms** as your policy requires.
4. Click the **Account** tab. Open **Entity Details**, click **Select Customer**, and choose the customer.
5. Click the **Line Items** tab. Click **Add** (or **+** on the line list) to open **Select Line Item**.
6. Choose a source tab: **Search Item** (manual lookup), **Jobsheet Item**, **Quotation Item**, or **Previous Sales Inquiry**. Select a row and proceed to **Add Line Item**.
7. On **Item Details**, enter **Quantity Base** (how many units), confirm **UOM** (for example **EA** for each or **BOX** for box), and set **Unit Price**. The system calculates the line total automatically; if discounts apply, set the discount field, and if tax applies, confirm the tax field shows the correct rate. Click **ADD** to save the line. Repeat for more lines.
8. Click **CREATE** (first save). The inquiry is saved and appears in listing for further edits, attachments, or finalization.

### Two common workflows

**Path 1 — Sales Staff Creating an Inquiry**

1. Create → fill Main/Account/Lines → **CREATE**
2. Reopen from listing → add more lines, attachments, related documents → **SAVE**
3. Pass to manager or finalize when ready → **FINAL** from view screen

**Path 2 — Sales Manager Finalizing Multiple Inquiries**

1. From listing, select multiple rows (checkboxes)
2. Click **FINAL**
3. System posts all selected rows that are not already **FINAL**

### Detailed walkthrough (sales) {#detailed-walkthrough-sales}

**Goal:** Create a sales inquiry with full tab-by-tab detail.

Open **Internal Sales Inquiry** → click **+**. The title is **Create Internal Sales Inquiry**.

**Main**

- Set **Transaction Date** with the date picker.
- Select or type **Sales Agent** from the configured list.
- Choose **Credit Terms** (payment or delivery terms your company uses).
- Enter **Reference** (internal or customer reference number) if needed.
- Set optional **Currency** (defaults to company currency).
- Add **Remarks** for internal notes.
- Use **Select Member** if the customer has a loyalty membership.
- Use **Select CRM Contact** if your CRM process requires linking a specific contact.

{{< figure src="/images/internal-sales-inquiry-applet/sales-main-details-tab.png" alt="Main Tab - showing Transaction Date, Sales Agent, Credit Terms, and other header fields" caption="Main: Set Transaction Date, Sales Agent, Credit Terms, Reference, and optional member or CRM links." >}}

**Account**

1. Click the **Account** tab.
2. Open **Entity Details**.
3. Click **Select Customer** (or create one if your permissions allow).
4. Review **Ship To** and **Bill To** address fields. Update if different from the customer's defaults.

{{< figure src="/images/internal-sales-inquiry-applet/sales-account-tab.png" alt="Account Tab - Entity Details showing Customer, Billing, and Shipping information" caption="Account: Select the customer and confirm shipping and billing addresses." >}}

**Line Items**

1. Click the **Line Items** tab.
2. Click **Add** or the **+** icon on the line toolbar.
3. The **Select Line Item** dialog opens. Choose a source:
   - **Search Item** — find items from the catalog manually.
   - **Jobsheet Item** — pull lines from a linked jobsheet (if enabled).
   - **Quotation Item** — copy lines from a prior quotation for the same customer (if enabled).
   - **Previous Sales Inquiry** — reuse lines from an earlier inquiry (if enabled).
4. Select a row from the chosen source.
5. The **Add Line Item** editor opens. Work through:
   - **Item Details**: Confirm **UOM**, **Quantity Base**, and **Quantity by UOM**.
   - **Costing Details** (if visible): Review or enter cost fields if your role permits.
   - **Pricing Details**: Set **Unit Price**, discounts, and tax configuration.
   - **Issue Link** (if enabled): Attach a work issue or ticket for tracking.
6. Click **ADD** to save the line. Repeat for more lines.

{{< figure src="/images/internal-sales-inquiry-applet/sales-line-items-tab.png" alt="Line Items Tab - showing list of lines with Add control and item details" caption="Lines: Use Add to select items from catalog, jobsheets, or prior documents, then enter quantities and pricing." >}}

**Optional Sections** (if enabled by your administrator):

- **Delivery Details** — shipping instructions, delivery date requests
- **Collection** — payment settlement terms
- **Department Hdr** — cost centre, profit centre, project codes for GL allocation
- **Contra** — offset amounts (used by finance when configured)

**Final Actions**

- Click **CREATE** to save the new inquiry. It enters the system in **DRAFT** status.
- The saved inquiry appears in the listing and can be reopened to add attachments, link related documents, or update lines.
- When ready, open the inquiry from the listing and click **FINAL** to post it, or select multiple rows in the listing and click **FINAL** to post several at once.

### Review and finalize inquiries {#review-and-finalize}

**Goal (Sales Manager):** Confirm and finalize open inquiries.

1. From **Internal Sales Inquiry Listing**, use **Advanced Search** if you need to filter by criteria your administrator set up (for example by branch, customer, or date range).
2. Review the grid: columns show **Posting Status**, **Customer Name**, **Sales Agent**, **Amount**, and key dates.
3. Click a row to open **View Internal Sales Inquiry**. Review all tabs: **Main**, **Account**, **Line Items**, and any settlement-related sections.
4. To post a single inquiry, click **FINAL** (if the button is enabled).
5. To post several inquiries at once:
   - Select multiple rows in the listing using the row checkboxes.
   - Click **FINAL**.
   - The system posts all selected rows that are not already **FINAL**.
6. For line-level questions without opening every inquiry, open the **Line Items** menu from the sidebar, find the line in the listing, and use **Edit Line Item** to drill in.

{{< callout type="warning" >}}
**Search scope:** If advanced search returns too many matches, the applet may show an error asking you to refine criteria. Narrow your search and run again.
{{< /callout >}}

### First-time setup {#first-time-setup}

**Goal (Administrators):** Configure the applet for your organisation.

Complete these steps when rolling out the applet:

- [ ] **Feature visibility**: **Settings → Feature Visibility** — enable or disable **Line Items**, **Settings**, **Personalization** menus per your rollout plan.
- [ ] **Default selection**: **Settings → Default Selection** — set default company, branch, location, language, and date format.
- [ ] **Field settings**: **Settings → Field Settings** — mark fields as mandatory, visible, or hidden to match sales and finance policies.
- [ ] **Printable formats**: **Settings → Printable Format Settings** — choose PDF layout for exports and prints.
- [ ] **Branch settings**: **Settings → Branch Settings** — align branch-specific behaviour if your organisation uses multiple branches.
- [ ] **Permissions**: Under **Settings**, review **Client-side permission listing**, **Permission set**, **User**, **Team**, **Role** — grant **CREATE**, **EDIT**, **FINALIZE**, **CONVERT**, and **SETTINGS** access to the right groups.
- [ ] **Webhooks** (if used): **Settings → Webhook** — connect external automation (only after staging tests).
- [ ] **Test pilot**: Create a test inquiry, add lines from each source tab you enabled, save, finalize, and export to confirm the workflow works.

---

## Working with the Inquiry Listing {#inquiry-listing}

The **Internal Sales Inquiry Listing** is the home screen for the applet.

- **Create** opens a blank document in **Create Internal Sales Inquiry**.
- **Advanced Search** runs a configured query; when results are returned as a bounded set of document keys, the grid loads those rows.
- **FINAL** applies **Posting Status** **FINAL** to every selected row that is not already final.
- **Column toggle** switches between single- and double-column layouts on wider screens.
- Row click opens **View Internal Sales Inquiry** for the selected document.

---

## Document Structure: Tabs and Panels {#document-structure}

### View screen (existing inquiry)

On **View Internal Sales Inquiry**, the main sections appear as tabs (or panels) including:

| Section | Purpose |
|---------|---------|
| **Main** | Header fields, sales agent, credit terms, references, member and CRM contact |
| **Account** | Customer entity, **Ship To**, **Bill To**, shipping and billing detail |
| **Line Items** | List of inquiry lines; shortcuts to add or edit lines |
| **Delivery Details** | Delivery messaging and scheduling-style fields your company enables |
| **Collection** | Settlement rows tied to the inquiry |
| **Department Hdr** | Department or analytical header segments |
| **Contra** | Contra entries when your process uses them |
| **Attachments** | Files linked to the document |
| **Export** | Triggers such as **EXPORT AS PDF**, **EXPORT AS CSV**, **EXPORT AS DOCX**, **EXPORT AS ZIP** |
| **Convert** | **CONVERT TO INTERNAL RECEIPT VOUCHER** with the warning that the action cancels the current inquiry |

The view toolbar also provides **RESET**, **FINAL**, and **SAVE** (unless **SAVE** is hidden by **Hide generic document save button** in settings). Use **Back** to return to the listing.

### Create screen (new inquiry)

**Create Internal Sales Inquiry** exposes **Main**, **Account**, **Line Items**, **Delivery Details**, **Collection**, **Department Hdr**, and **Contra**. Attachments are handled after save flows in your environment; follow on-screen navigation for **Add Attachments** when it appears in the inquiry journey.

---

## Line Items {#line-items}

### Select Line Item

**Select Line Item** offers four tabs:

- **Search Item** — find catalog items.
- **Jobsheet Item** — pull from jobsheet context.
- **Quotation Item** — pull from quotation lines.
- **Previous Sales Inquiry** — copy lines from an earlier inquiry for the selected customer.

Choosing a row feeds the **Add Line Item** flow.

### Add Line Item

**Add Line Item** walks through **Item Details**, optional **Costing Details**, **Pricing Details**, and **Issue Link**. Costing can be suppressed by applet settings unless a user is allowed to see it for specific cases.

### Edit Line Item

**Edit Line Item** mirrors the add layout with **SAVE** on the toolbar. Line-level behaviour may respect the inquiry’s posting status (for example stricter edits after finalization—follow your organisation’s rules).

### Related documents and contra from the inquiry flow

Dedicated columns in the page stack include **Add Related Documents** and **Add Contra** when your navigation reaches those steps—use them to link supporting evidence or contra entries without losing the inquiry context.

---

## Line Items Menu {#line-items-menu}

The separate **Line Items** route provides:

- **Line Items Listing** — a grid of lines across inquiries.
- **Edit Line Item** — focused line editing.
- **Edit Issue**, **Worklog**, and **Log Time** — when issue tracking and time logging are part of your process.

Use this area when operations or support teams need line-centric visibility.

---

## Finalize, Save, and Reset {#finalize-save-reset}

- **SAVE** persists header, account, and line changes on the view screen when available.
- **FINAL** sets posting status to **FINAL** from the view screen or for multi-selected rows on the listing.
- **RESET** reloads the document state according to your implementation—use it when you need to discard unsaved UI changes and refresh from the server copy.
- **CREATE** on the create screen saves a new inquiry for the first time.

After **FINAL**, the inquiry is locked: in most setups both header fields and line items cannot be edited. If an amendment is required after finalization, the usual paths are to **VOID** and recreate the inquiry, or follow your company's amendment process — contact your administrator for tenant-specific procedures and who may perform those actions.

---

## Export and Convert {#export-and-convert}

### Export

Under **Export**, choose the format your administrator enabled—typically **EXPORT AS PDF**, **EXPORT AS CSV**, **EXPORT AS DOCX**, or **EXPORT AS ZIP**. This is useful for internal approval packs or customer-facing summaries when your policy allows.

### Convert

**Convert** shows a clear warning: converting to an **Internal Receipt Voucher** cancels the current sales inquiry. Use this only when your finance process explicitly requires that path.

---

## Configuration & Settings {#configuration--settings}

Settings are organised under **Settings** in the applet sidebar (exact labels may vary slightly by tenant).

| Path | Typical use |
|------|-------------|
| **Settings → Default Selection** | Default company, branch, location, language |
| **Settings → Field Settings** | Visible, required, and ordered fields |
| **Settings → Printable Format Settings** | Export and print layouts |
| **Settings → Webhook** | Integrations |
| **Settings → Feature Visibility** | Which menus and actions appear |
| **Settings → Branch Settings** | Branch-specific behaviour |
| **Settings → Client-side permission listing** | Fine-grained client permissions |
| **Settings → Permission set / User / Team / Role permission listings** | Access control |

Applet-level behaviour also honours master flags such as optional **Dimension**, **Profit Centre**, **Project**, **Segment**, **SST**, and **WHT** segments, custom status slots, pricing column visibility, hiding costing details, hiding the generic document **SAVE** button, vertical versus horizontal orientation, default column layout (**SINGLE** vs **DOUBLE**), and which expansion panels open by default—configured through your platform’s settings model for this applet.

---

## Personalization {#personalization}

Under **Personalization**, users with access can adjust:

- **Personal Default Selection** — overrides for branch, location, language, default tab orientation, and default column layout (personal choices override applet defaults where allowed).
- **Sidebar** — shortcut and navigation preferences.

{{< callout type="info" >}}
Personal settings apply to the individual user. If something looks different between colleagues, compare personalization choices before raising a support ticket.
{{< /callout >}}

---

## Audit Trail and Compliance {#audit-trail}

Sales inquiries use the platform's generic document model and capture basic audit metadata that you can view as a user:

- **Created By / Created Date**: who created the inquiry and when.
- **Updated By / Updated Date**: the last user who updated the inquiry and the timestamp.
- **Posting Status changes**: when the document moved between posting states (for example DRAFT → FINAL) the change is recorded in the document history.
- **Attachments metadata**: who uploaded a file and when it was attached to the inquiry.

Where these appear depends on your tenant UI configuration — commonly you'll see `Created By` and `Created Date` on the document header, and an activity or history tab showing status transitions. For full, system-level audit logs (for example exportable logs or security audit trails), consult your administrator or compliance team who can extract those from backend tooling or logging services.

---

## FAQ {#faq}

**What is the difference between an internal sales inquiry and a quotation or sales order?**

An inquiry is an early-stage, flexible record used to capture interest, rough lines, and context. Quotations and orders (see the [Internal Sales Quotation Applet](/applets/sales-workflow/internal-sales-quotation-applet/) and [Internal Sales Order](/applets/sales-workflow/internal-sales-order-applet/)) are typically the next formal steps when pricing is firm and fulfilment is planned. Your company defines when to move from one to the other.

**Why does Convert warn that it will cancel the inquiry?**

The **Convert** action creates an **Internal Receipt Voucher** and treats the inquiry as completed in that pathway. The warning is intentional so users do not convert by mistake. If you only need a PDF for a customer, use **Export** instead.

**Can I finalize many inquiries at once?**

Yes. In **Internal Sales Inquiry Listing**, select multiple rows using the checkboxes and click **FINAL**. Rows that are already **FINAL** are skipped.

**Why is the Costing Details tab missing on a line?**

Administrators can hide costing through applet settings, or visibility may depend on your role and the item context. If you believe costing should appear, ask your administrator to review **Hide costing details** and related permission settings.

**Can I copy lines from a prior inquiry into a new one?**

Yes. Use the **Previous Sales Inquiry** tab in **Select Line Item** (when adding a line) to pull lines from a previous inquiry for the same customer.

**What should I do if advanced search says the result set is too large?**

Add more filters or narrower criteria until the search returns a smaller set. The guard exists to keep the grid responsive and protect server performance.

**Can I edit an inquiry after it is finalized?**

Limited edits may be permitted depending on your company's configuration. Check with your administrator on the exact rules. In most workflows, finalization locks the document. If a correction is needed, you may need to void and recreate, or follow your company's adjustment process.

**Who can change field labels or mandatory rules?**

Users with access to **Settings** pages (especially **Field Settings** and related permission screens). Standard sales users should route change requests through that team.

**What happens if I delete a line?**

On the view screen, use the **delete** icon on the line (if permitted). The line is removed from the inquiry. If the inquiry is already finalized, deletion may be restricted.

**Can I print an inquiry?**

Yes. Open the inquiry, then scroll to the **Export** section and click **EXPORT AS PDF** (or other format). Your administrator configured the layout template under **Printable Format Settings**.

**How do I know which inquiries are ready for conversion?**

Typically, your sales manager or finance team will indicate when an inquiry should be converted to an **Internal Receipt Voucher**. This step is intentionally controlled (with a warning) to prevent accidental conversions. Only convert when your business process explicitly requires it.

**What is the difference between Search Item and Jobsheet Item as line sources?**

- **Search Item** — Manually finds products from the catalog.
- **Jobsheet Item** — Pulls pre-configured items from an existing jobsheet, useful if you are quoting services or work tied to a specific project or job.

**Can I add lines after finalizing an inquiry?**

In most workflows, **FINAL** locks the inquiry for major edits. Check with your administrator on whether line additions are permitted after posting. If you need to add items, you may need to create a new inquiry or follow an amendment process.

**Who can finalize inquiries?**

Permission is controlled by your administrator through **Permission** settings. Typically, sales managers, team leads, or delegated staff can finalize, while general sales users only create and edit drafts.

**What if I need to change a customer after saving?**

For new drafts, update the **Account** tab and click **SAVE**. If the inquiry is already finalized, check with your administrator on the amendment or void-and-recreate process.

**How does member card selection work?**

When you select a customer on the **Account** tab, you can optionally link a **Member Card** on the **Main** tab if the customer has an active membership. This may be used for loyalty points, discounts, or reporting. Ask your administrator if member card linking is required for your sales process.

---

## Related Applets

- **[Internal Sales Quotation Applet](/en/applets/sales-workflow/internal-sales-quotation-applet/)** — Upstream: when an inquiry is approved or pricing is firm, create or convert into a formal quotation for customer approval. Use the quotation applet to generate customer-facing proposals and route for approvals if required.
- **[Internal Sales Order](/en/applets/sales-workflow/internal-sales-order-applet/)** — Downstream: once pricing and delivery are confirmed (often after a quotation), raise a sales order to start fulfilment and warehouse processes. The sales order drives pick/pack and delivery workflows.
- **[Internal Sales Invoice (Internal) Applet](/en/applets/sales-workflow/internal-sales-invoice-applet/)** — Downstream billing: after goods or services are fulfilled, invoices are raised here to post revenue and create accounting entries. The invoice applet is the final financial posting step in the order-to-cash sequence.

