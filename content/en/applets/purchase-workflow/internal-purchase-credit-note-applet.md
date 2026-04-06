---
title: "Internal Purchase Credit Note Applet"
description: "Step-by-step help for purchase credit notes: create documents, finalize or void, use line items and file import, and find settings when something is hidden."
tags:
  - purchase-workflow
  - purchase-credit-note
  - internal-purchase
  - e-invoice
  - procurement
  - file-import
weight: 80
date: 2026-04-06
lastmod: 2026-04-08
draft: false
---

{{< callout type="warning" >}}
**Internal Purchase Credit Note Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## What is a purchase credit note? {#what-is-a-purchase-credit-note}

In **purchasing**, a **credit note** (you may also hear **supplier credit** or **purchase credit note**) is a formal record that **reduces what your company owes a supplier**—or **corrects** what you already recorded—when something changes after a purchase or invoice. Common reasons include **returned goods**, **wrong quantities or prices**, **agreed rebates**, or **duplicate billing**. Think of it as the mirror of a **supplier invoice**: an invoice says “pay more”; a credit note says “pay less” or “take this amount off the account.”

In BigLedger, an **internal purchase credit note** is that record kept **inside your ERP**, with the same kind of structure as other purchase documents: header details, supplier account, and lines—so finance and procurement stay aligned.

## What this applet is for

The **Internal Purchase Credit Note** applet is where you **create, review, and post** those credit notes: for example returns, rebates, or corrections linked to your purchase process. You work with a familiar document: **main details**, **supplier account** (who you are crediting and where goods or invoices relate), and **line items** (what is being credited and for how much).

Depending on how your company configured BigLedger, you may also use **e-invoicing**, **settlement (ARAP)**, **contra**, **attachments**, **exports**, a separate **Line Items** screen to work across many documents at once, and **File Import** to bring in data from a spreadsheet.

## What problems does this solve? {#what-problems-does-this-solve}

**Without a structured credit-note process**, teams often juggle **email**, **spreadsheets**, and **informal notes**. That makes it hard to prove **what was agreed**, match credits to **invoices or receipts**, and keep **procurement and finance** on the same numbers.

**With this applet**, you get:

- **One official list** of purchase credit notes instead of scattered records.
- **Clear draft vs posted** behaviour so people know when a document is still editable.
- **Header + supplier + lines** in one place—easier audits and fewer “wrong total” mistakes.
- **Optional links** to e-invoice, settlement, contra, and related purchase flows when your company turns them on.
- **Bulk work** through **Line Items** search and **File Import** when many lines need updating at once.

{{< callout type="info" >}}
**Can’t see a button or menu?** Your administrator controls which menus and buttons appear (feature visibility, field settings, and permissions). If something you expect is missing, ask your **admin**—it is often turned off on purpose for your role or company policy.
{{< /callout >}}

## Who uses it

| Who | Typical use |
|-----|-------------|
| **Procurement** | Create and update credit notes, supplier details, and lines. |
| **Finance** | Finalize (**post**) documents, void or discard when allowed, e-invoice and settlement steps. |
| **Operations** | Attachments, exports, or bulk work through **File Import**. |

### Benefits by role

**Procurement**

- Enter supplier credits in the same pattern as other purchase documents (faster training, fewer errors).
- Fix line-level details on one document or across many via **Line Items** when your process allows it.

**Finance**

- **Post** when the credit is ready for accounting or statutory flows (e-invoice, ARAP, etc., if enabled).
- **Void** or **discard** drafts when policy allows—less clutter and clearer audit trail than informal reversals.

**Operations**

- **File Import** for high-volume line data; **attachments** and **exports** when your company uses them for evidence or hand-off to other systems.

## Key Features

{{< cards >}}
{{< card title="Quick Start" subtitle="By role + detailed steps" link="#quick-start-guide" >}}
{{< card title="Key concepts" subtitle="Supplier, document, lines" link="#key-concepts-for-purchase-credit-notes" >}}
{{< card title="Problems solved" subtitle="Why use the applet" link="#what-problems-does-this-solve" >}}
{{< card title="Purchase credit notes" subtitle="Listing, create, edit, and posting" link="#purchase-credit-notes-in-detail" >}}
{{< card title="After you post" subtitle="What to expect next" link="#what-happens-after-you-post" >}}
{{< card title="Line Items" subtitle="Search and edit lines across documents" link="#line-items" >}}
{{< card title="File Import" subtitle="Upload CSV and review results" link="#file-import" >}}
{{< card title="Settings" subtitle="For administrators" link="#settings-for-administrators" >}}
{{< card title="FAQ" subtitle="Common questions" link="#frequently-asked-questions" >}}
{{< card title="If something is wrong" subtitle="Common fixes" link="#if-something-is-wrong" >}}
{{< /cards >}}

{{< figure src="/images/internal-purchase-credit-note-applet/internal-purchase-credit-note-applet-overview-infographic.png" alt="Overview of the Internal Purchase Credit Note applet: documents, line items, and import" caption="Overview of purchase credit notes, the Line Items workspace, and file import in one place." >}}

---

## Key concepts for purchase credit notes {#key-concepts-for-purchase-credit-notes}

Every credit note ties together **who** you are dealing with, **which document** you are working on, and **what** is being credited on each line.

### The three pieces that work together

| Piece | Question it answers | Typical example |
|-------|---------------------|-----------------|
| **Supplier account** | *Who* is this credit for, and where do bill/ship details apply? | Supplier A, Bill To / Ship To as on your master data. |
| **Document (header)** | *Which* credit note is this—dates, references, status? | Draft PCN-2026-0042, linked reference to PO or invoice if your setup uses it. |
| **Line items** | *What* is credited—items, quantities, amounts? | Return 10 units of SKU X at agreed price; rebate line as a service line if your chart allows it. |

{{< callout type="tip" >}}
**Plain-language check:** Before you **post**, confirm the **supplier** matches the commercial agreement, the **header** matches your internal reference (PO, GRN, invoice), and every **line** matches what procurement and finance agreed to credit.
{{< /callout >}}

### How this maps to your screen

- **Main Details** and related header tabs → the **document**.
- **Account** → the **supplier** side.
- **Line Items** (inside the document) or the **Line Items** menu → individual **credit lines** (one document vs many documents).

Exact tab names and optional areas (**Payment**, **Department**, **Knock-off**, **E-Invoice**, **ARAP**, etc.) depend on your company’s configuration.

---

## Quick Start Guide {#quick-start-guide}

Get up and running with the tasks people do most often. Start with **your role** below, then use the **step-by-step** sections for full detail.

### For procurement: create and maintain credit lines

**Goal:** Record a supplier credit with the right supplier, header, and lines—while the document is still a **draft** if your process says so.

1. Open **Internal Purchase Credit Note** and click **Create** or **+**.
2. Complete **Main Details** (dates and references your company requires).
3. On **Account**, pick the **supplier** and addresses.
4. Add or adjust **Line Items** (items, quantities, amounts).
5. **Save** the document. Use **Line Items** (menu) only when you need to search or edit lines **across many** credit notes.

*Full walkthrough:* [Create a purchase credit note](#create-a-purchase-credit-note) · [Search and open existing credit notes](#search-and-open-existing-credit-notes) · [Work on many lines at once (Line Items)](#work-on-many-lines-at-once-line-items)

### For finance: finalize or cancel

**Goal:** Move approved credits to **posted** (or cancel drafts) so downstream accounting and compliance steps can run.

1. Open the document from **Internal Purchase Credit Note** or search the list.
2. Check **supplier**, **totals**, and **lines** against your approval rules.
3. Use **Final** (or **FINAL**) to **post** when ready—or **Void** / **Discard** when your policy allows.
4. If your tenant uses them, complete **E-Invoice**, **ARAP**, **Contra**, or **Knock-off** only as trained.

*Full walkthrough:* [Finalize, void, or discard (finance)](#finalize-void-or-discard-finance) · [Understanding draft vs posted](#understanding-draft-vs-posted) · [What happens after you post?](#what-happens-after-you-post)

### For operations: bulk data and evidence

**Goal:** Load many lines from a file or attach evidence without re-keying everything.

1. Use **File Import** to upload a CSV, pick the **delimiter**, then **Submit** and review **Checking** for errors.
2. Use **Line Items** (menu) to find and fix specific lines after import if needed.
3. On an open document, use **Attachment** or **Export** if your process requires files or hand-offs.

*Full walkthrough:* [Import rows from a CSV file](#import-rows-from-a-csv-file) · [Line Items](#line-items) · [Purchase credit notes in detail](#purchase-credit-notes-in-detail) (attachments/exports)

---

**Step-by-step detail (all roles)**

### Create a purchase credit note {#create-a-purchase-credit-note}

**Goal:** Start a new credit note and save it as a working document.

1. Open the applet and go to **Internal Purchase Credit Note** (main list).
2. Click **Create** or **+**.
3. Fill in **Main Details** (dates, references, and other header fields your company requires).
4. Open **Account** and select the **supplier** and **Bill To** / **Ship To** addresses as needed.
5. Open **Line Items** and add each line (item, quantity, amounts—whatever your form shows).
6. If you see optional tabs such as **Payment**, **Department**, or **Knock-off (KO)**, complete them only if your process says so.
7. Click **Create** or **Save** to store the document.

**Tip:** Your screen might use **tabs across the top** or **panels you expand**—both are normal; your admin chooses the layout.

### Finalize, void, or discard (finance) {#finalize-void-or-discard-finance}

**Goal:** Move a credit note to a **posted** state, or cancel it when your rules allow.

1. Find the document on **Internal Purchase Credit Note** or open it from the list.
2. Use the action your process describes:
   - **Final** (or **FINAL**) — marks the document as posted / confirmed for downstream use.
   - **Void** or **Discard** — cancels or removes a draft according to your company rules.
3. If you do not see these buttons, your role may not include posting, or your administrator hid them—ask **finance or IT admin**.

**Self-billed:** Some setups show **Self-billed** on the list—use it only if your company trained you for that flow.

### Search and open existing credit notes {#search-and-open-existing-credit-notes}

1. Stay on **Internal Purchase Credit Note**.
2. Use **search** or **filters** at the top of the list (your columns may include document number, dates, amounts, e-invoice fields, and status).
3. Click a row to **open** and view or edit (if you have edit rights).

### Work on many lines at once (Line Items) {#work-on-many-lines-at-once-line-items}

**Goal:** Find lines from different credit notes (or linked purchase flows) and open one line to edit.

1. Open **Line Items** from the left menu.
2. Use search and filters to narrow the list.
3. Click a row to open **Edit Line Item**.
4. Update **Item details**, **serial / batch / bin** (if shown), **costing** or **pricing** (if shown), or **issue link** (if shown).
5. Save. To remove a line, use **Delete** if available—often you must confirm twice.

### Import rows from a CSV file {#import-rows-from-a-csv-file}

**Goal:** Upload a spreadsheet and check that the system accepted it.

1. Open **File Import** from the left menu.
2. Click **Create** or **+** to start a new import.
3. Choose the **delimiter** (often comma or semicolon—pick what matches your file).
4. Upload your file (drag-and-drop or browse). Use **Sample format** if your company provided a template.
5. Click **Submit** to run the import.
6. Open the import record to see **Details** (status, errors, who created it) and the **Checking** tab for row-by-row validation messages.
7. Fix the file if there are errors and try again as your admin instructs.

{{< callout type="tip" >}}
**New to the applet?** After trying the steps above, explore **Personalization** to set **personal defaults** (faster data entry) and adjust **sidebar** order if your admin allows it.
{{< /callout >}}

---

## Understanding draft vs posted {#understanding-draft-vs-posted}

You will usually see two kinds of state:

| What you see | What it means in practice |
|--------------|---------------------------|
| **Draft / not final** | You can still change most fields; the document is not fully locked for accounting yet. |
| **Posted / final** | The document is confirmed for your process; editing may be limited or blocked. |

Exact labels depend on your tenant. If you are unsure whether you may still edit, ask **finance**.

---

## What happens after you post? {#what-happens-after-you-post}

After you **Final** / **post** a purchase credit note, your company’s BigLedger setup decides what happens next. Typical patterns include:

- **Payables (AP)** — the posted credit usually **reduces** what you owe the supplier or **offsets** an existing invoice, depending on how **ARAP**, **Knock-off (KO)**, or **Contra** are configured. Your finance team defines the exact behaviour.
- **E-invoicing** — if **E-Invoice** is in use, a posted document may need to follow **country or network rules** (submission, cancellation, or replacement). Follow your local procedure and training.
- **Stock and costing** — some implementations adjust **inventory valuation** or **cost** when lines are linked to returns or receipts. If you are unsure, ask **finance or inventory admin**; do not assume every credit note moves stock.
- **Audit trail** — posted documents are often **harder to change**; corrections may require a **new** document or a controlled reversal per policy.

**What you should do:** After posting, confirm with **finance** whether any **follow-up** step is required (e.g. settlement run, e-invoice status check, payment batch). Labels and menus differ by tenant.

---

## Purchase credit notes in detail {#purchase-credit-notes-in-detail}

### Main menu: Internal Purchase Credit Note

This is the **home list** for all purchase credit notes.

- **Create (+)** — starts a new document (if you have permission).
- **Final**, **Void**, **Discard**, **Self-billed** — may appear on the list or inside a document; visibility depends on your role and settings.
- Use column chooser and pagination if you have many documents.

### While creating or editing one document

Typical areas (not all may show for every company):

- **Main Details** — header information.
- **Account** — supplier entity, billing and shipping addresses.
- **Line Items** — products or services being credited.
- **Payment**, **Department**, **Knock-off (KO)** — optional; follow internal procedure.

When you **edit** an existing document, you may also see tabs such as **E-Invoice**, **ARAP**, **Trace document**, **Contra**, **Doc link**, **Attachment**, and **Export**. Treat each as your company training describes—many are optional or country-specific.

---

## Line Items {#line-items}

**Line Items** is **not** the same as the **Line Items** tab inside one credit note. This menu is a **separate list** so you can search **across documents** and jump straight into editing **one line**.

Use it when you need to correct line-level data, trace items, or work through a large set of lines without opening each document header first.

---

## File Import {#file-import}

Use **File Import** when your company moves data in bulk from CSV files instead of typing each line.

- Each import has a **status** so you can see whether it finished or failed.
- Always read the **Checking** results before assuming the data is live in your main lists.
- If the **File Import** menu is missing, your administrator may have hidden it or restricted it to certain roles.

---

## Settings (for administrators) {#settings-for-administrators}

These live under **Settings** in the applet. Names match what users usually see in the sidebar.

| Area | What it is for |
|------|----------------|
| **Default selection** | Default company, branch, or location for new documents. |
| **Field settings** | Which fields are required or hidden on forms. |
| **Printable format settings** | How printed or PDF outputs look for this applet. |
| **Branch settings** | Branch-specific defaults (for example default print format per branch). |
| **Webhook** | Sending events to other systems when something changes. |
| **Feature visibility** | Which menus and features appear for users. |
| **Client-side permission listing** | Fine control over buttons (for example posting actions) on screens. |
| **Role pricing scheme link** | Links roles to pricing where used. |
| **Permission Wizard** | Map roles to applet functions. |
| **Permission set listing** | Reusable permission packages. |
| **User / Team / Role permission listing** | Who can do what. |
| **Release notes** | What changed in the applet. |
| **Applet log** | Operational log for support. |

**Personalization** (separate menu) lets each user adjust **personal default selection** and **sidebar** order without changing company-wide settings.

---

## Works with other purchase documents

Your **Line Items** search and company setup may link credit lines to other purchase flows, such as **purchase orders**, **goods received (GRN)**, **requisitions**, or **delivery** documents. Ask your implementation team which links apply to you.

### When to use which purchase document? {#when-to-use-which-purchase-document}

Use the document your **finance and procurement policy** names for each situation. The table below is **plain-language guidance** only—your tenant may use different names or combine steps.

| Situation | Often use | Short explanation |
|-----------|-----------|-------------------|
| Supplier should **charge you less** (return, error, rebate, duplicate bill) | **Purchase credit note** (this applet) | Records **reduction** of what you owe or correction of what you already recorded. |
| You need to **charge the supplier more** (under-billing, extra cost to supplier) | [Internal Purchase Debit Note](/applets/purchase-workflow/internal-purchase-debit-note-applet/) | Increases what the supplier owes **you** or adjusts payables the other way—follow your policy. |
| Physical **return** of goods with a dedicated return process | [Internal Purchase Return](/applets/purchase-workflow/internal-purchase-return-applet/) | May handle **stock movement** and paperwork; the credit note may still be the **financial** record depending on setup. |
| **Money back** or refund flows your company separates from standard credits | [Internal Purchase Refund Note](/applets/purchase-workflow/internal-purchase-refund-note-applet/) | Use when trained for **refund-specific** processing—not every company uses this alongside credit notes. |

**Related guides:**

- [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Internal Purchase GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/)
- [Internal Purchase Debit Note Applet](/applets/purchase-workflow/internal-purchase-debit-note-applet/)
- [Internal Purchase Return Applet](/applets/purchase-workflow/internal-purchase-return-applet/)
- [Internal Purchase Refund Note Applet](/applets/purchase-workflow/internal-purchase-refund-note-applet/)
- [Supplier Delivery Order Applet](/applets/purchase-workflow/supplier-delivery-order-applet/)

---

## If something is wrong {#if-something-is-wrong}

| Problem | What to try |
|---------|-------------|
| I cannot **create** a document | Ask admin to check your **create** permission and **default selection** (company/branch). |
| **Final**, **Void**, **Discard**, or **Save** is missing | Often **permissions** or **feature visibility**; finance or admin can adjust. |
| A tab I was trained on is gone | **Field settings** or feature flags may hide it—admin review. |
| **File Import** is not in the menu | May be turned off for your role or hidden in settings. |
| My screen uses panels instead of tabs (or the opposite) | Both are valid; your company chose a layout. |

Still stuck? Note your **user name**, **document number** (if any), and **what you clicked**, then contact your **BigLedger administrator** or internal help desk.

---

## Frequently asked questions {#frequently-asked-questions}

**What is the difference between a purchase credit note and a supplier invoice?**  
An **invoice** from the supplier normally **increases** what you owe. A **purchase credit note** **reduces** that balance or **corrects** an earlier posting—see [What is a purchase credit note?](#what-is-a-purchase-credit-note).

**When should I use a credit note instead of a debit note?**  
Use a **credit note** when the outcome is “**we pay less**” or “**take this off our account**.” Use a **debit note** when your policy says you must **charge the supplier more** or adjust the other way. See [When to use which purchase document?](#when-to-use-which-purchase-document).

**Can I edit a credit note after it is posted?**  
Often **no**, or only with **limited** fields—depends on permissions and company rules. If you need a correction, finance may ask for a **new** document or a controlled process. Check [Understanding draft vs posted](#understanding-draft-vs-posted).

**What is the difference between Void and Discard?**  
Both **cancel** or remove work in progress in many setups, but **exact meaning** depends on your configuration and training. If you are unsure which to use, ask **finance** before clicking—especially if the document was already **final**.

**Why is Final (post) or Save missing on my screen?**  
Usually **permissions** or **feature visibility**. Your admin can check **Permission Wizard**, **client-side permission listing**, and **feature visibility** for this applet.

**File Import failed—what should I check first?**  
Open the import record and read the **Checking** tab: fix **delimiter**, **required columns**, **invalid item or supplier codes**, and **date/number formats** to match your template. See [Import rows from a CSV file](#import-rows-from-a-csv-file).

**What is the Line Items menu versus the Line Items tab inside a document?**  
The **tab** belongs to **one** credit note. The **Line Items** **menu** searches **across documents** so you can open and edit a single line without opening each header first. See [Line Items](#line-items).

**What does Self-billed mean on the list?**  
Some companies use **self-billed** flows for specific statutory or commercial arrangements. Use it **only** if your organisation trained you for it.

---

## Related Documentation Links

- [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Internal Purchase GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/)
- [Internal Purchase Debit Note Applet](/applets/purchase-workflow/internal-purchase-debit-note-applet/)
- [Internal Purchase Return Applet](/applets/purchase-workflow/internal-purchase-return-applet/)
- [Internal Purchase Refund Note Applet](/applets/purchase-workflow/internal-purchase-refund-note-applet/)
- [Supplier Delivery Order Applet](/applets/purchase-workflow/supplier-delivery-order-applet/)
