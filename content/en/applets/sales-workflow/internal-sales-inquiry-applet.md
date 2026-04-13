---
title: "Internal Sales Inquiry Applet"
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
lastmod: 2026-04-11
draft: false
---

## Purpose and Overview

The **Internal Sales Inquiry Applet** is where your team records **sales inquiries** before they become firm commitments such as quotations or sales orders. It brings together the customer (or prospect), the sales agent, line-level products or services, delivery and billing context, optional collection and contra lines, and supporting files—so everyone works from one structured document instead of scattered notes or email threads.

{{< callout type="info" >}}
**Core Concept**: The applet links **who** you are talking to (customer, member, CRM contact), **what** they are interested in (line items from search, jobsheet, quotation, or a prior inquiry), and **how** the case should proceed (delivery details, collections, attachments, final posting, export, or conversion).
{{< /callout >}}

An internal sales inquiry is typically a **draft-friendly** document: you can build it up over time, save changes, and when your process allows, mark selected records as **FINAL** from the listing or from the document screen. Depending on your company’s setup, you can also **export** the document and use **Convert** to create an **Internal Receipt Voucher** (the screen warns that converting cancels the current inquiry—treat this as a deliberate, controlled step).

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

### For sales staff: create your first internal sales inquiry

**Goal:** Save a new inquiry with a customer and at least one line.

1. Open **Internal Sales Inquiry** from the applet menu. You land on **Internal Sales Inquiry Listing**.
2. Click **Create** (the **+** control).
3. On **Main**, set **Transaction Date** and complete required fields such as **Sales Agent** and **Credit Terms**. Use **Select Member** or **Select CRM Contact** if your process requires them.
4. Open **Account**. Choose **Entity Details** (**Select Customer** or **Create Customer** if allowed), then set **Ship To** and **Bill To** as needed.
5. Open **Line Items**. Use **Add** to open **Add Line Item**, or step through **Select Line Item** first. Pick a source tab—**Search Item**, **Jobsheet Item**, **Quotation Item**, or **Previous Sales Inquiry**—and select a row to bring into the inquiry.
6. Complete optional sections your company uses (**Delivery Details**, **Collection**, **Department Hdr**, **Contra**) on the create screen.
7. Click **CREATE** to save.

**What happens next?** The inquiry remains editable while in draft. Open it from the listing to add attachments, related documents, or more lines, then use **SAVE** and **FINAL** when your procedure allows.

---

### For sales managers: review and finalize inquiries

**Goal:** Confirm open inquiries and post them when appropriate.

1. From **Internal Sales Inquiry Listing**, use **Advanced Search** if you need to filter by criteria your administrator configured.
2. Click a row to open **View Internal Sales Inquiry**. Review **Main**, **Account**, **Line Items**, and any settlement-related tabs.
3. To post a single document from the view screen, use **FINAL** when it is enabled.
4. To post several inquiries at once, select multiple rows in the listing (checkbox column) and click **FINAL**. Only rows that are not already **FINAL** are sent for update.
5. For line-level questions without opening every document, open the **Line Items** menu, locate the line in **Line Items Listing**, and drill into **Edit Line Item** as needed.

{{< callout type="warning" >}}
**Search scope**: If advanced search returns too many matches, the applet may show an error asking you to refine the search. Narrow your criteria and run the search again.
{{< /callout >}}

---

### For administrators: first-time setup checklist

Complete these steps when rolling out the applet.

- [ ] **Feature visibility**: **Settings → Feature Visibility** — show or hide menus (for example **Line Items**, **Settings**, **Personalization**) per your rollout plan.
- [ ] **Default selection**: **Settings → Default Selection** — set default company, branch, location, and language where applicable.
- [ ] **Field settings**: **Settings → Field Settings** — align mandatory and visible fields with your sales and finance policies.
- [ ] **Printable formats**: **Settings → Printable Format Settings** — configure how exported or printed inquiries should look.
- [ ] **Branch settings**: **Settings → Branch Settings** — align branch-specific behaviour if your organisation uses them.
- [ ] **Permissions**: **Settings → Permission** listings (client-side permission sets, permission sets, user, team, role) — grant create, edit, finalize, convert, and settings access to the right groups.
- [ ] **Webhooks** (if used): **Settings → Webhook** — connect external automation only after staging tests.
- [ ] **Personalization defaults**: Encourage users to set **Personalization → Personal Default Selection** and **Sidebar** so their layout matches daily work.

**Pilot test:** Create an inquiry, add lines from each source type you plan to use, save, finalize, export, and—only if required—run a test **Convert to Internal Receipt Voucher** in a safe environment.

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

Always confirm with your administrator how **FINAL** interacts with editing, voiding, or downstream documents in your tenant.

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

Sales inquiries participate in the platform’s generic document model (header, lines, extensions, and links). Your organisation may rely on that structure for traceability: who created or updated a record, attached files, or changed posting status. Consult your administrator or compliance team for how audit logs, document history, or external reporting tools are exposed in your deployment.

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

**What should I do if advanced search says the result set is too large?**

Add more filters or narrower criteria until the search returns a smaller set. The guard exists to keep the grid responsive and protect server performance.

**Who can change field labels or mandatory rules?**

Users with access to **Settings → Field Settings** and related permission screens. Standard sales users should route change requests through that team.

---

## Related Applets

- [Internal Sales Quotation Applet](/applets/sales-workflow/internal-sales-quotation-applet/) — formal quotes and customer proposals  
- [Internal Sales Order](/applets/sales-workflow/internal-sales-order-applet/) — order entry and fulfilment lifecycle  
