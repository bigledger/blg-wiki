---
title: "Custom Processor Applet"
description: "Configure and manage automated background processing for internal sales and financial documents based on custom criteria and triggers."
tags:
- automation
- processing
- internal-sales
- batch-operations
- finance
weight: 150
---

## Purpose and Overview

The **Custom Processor Applet** is the high-performance automation exhaust for your BigLedger environment. It is designed to replace manual document handling with automated, background task execution. By monitoring specifically defined document types and statuses, it ensures that your logistics and financial workflows move forward without human intervention, reducing bottlenecks and eliminating manual status errors.

{{< callout type="tip" >}}
**TL;DR — Read this first.**

You have documents (Sales Orders, Invoices, Returns) being created constantly. Normally someone has to manually open each one and click a button to move it forward. At high volumes, that is a bottleneck.

This applet removes that bottleneck. You configure a **Processing Filter** that says: *"Every time an Internal Sales Order is created by Company X in DRAFT status — process it automatically."* The system then picks up every matching document, moves it through the workflow in the background, and logs what it did.

**Three things this applet manages:**
1. **Processor Filter** — where you define the rules (what to watch for and when to act)
2. **Processing Queue** — documents currently waiting to be processed
3. **Processing History** — a log of everything the processor has already done

The applet opens on the **Processing Queue** by default so you can immediately see what is happening.
{{< /callout >}}

### When is this Applet used?

This applet is critical for organizations managing high document volumes or complex inter-branch logistics:

- **Inter-Branch Fulfillment**: Automatically finalizing internal sales orders so that the receiving branch sees the stock in transit immediately.
- **Mass Pricing Updates**: Processing "Price Tag" document sets in the background to avoid locking the UI during thousands of pricing changes.
- **Automated Financial Posting**: Moving recurring internal documents (like Debit Notes) from *Draft* to *Finalized* status the moment they are generated.
- **Logistics Acceleration**: Ensuring that return authorizations (Internal Sales Returns) are processed instantly to maintain accurate inventory levels across the group.

{{< callout type="info" >}}
**Core Concept**: The applet serves as a **Batch Listener**. It captures documents matching your **Processing Filters**, moves them into a **Processing Queue**, and logs the result in **Processing History**.
{{< /callout >}}

### Why is this Important in Automation and Operations?

Effective use of the Custom Processor drives significant gains in organizational efficiency:

- **Operational Velocity**: Documents no longer sit in "Draft" waiting for a manager to log in. Workflows move at the speed of the system, not the speed of the staff.
- **Data Integrity**: Because filters are pre-defined, the system never "forgets" to process a document, ensuring that your inventory and financial records are always up-to-date.
- **Resource Optimization**: Your staff is freed from the repetitive task of manually processing thousands of low-level internal documents, allowing them to focus on high-value business exceptions.
- **Scalability**: The background processor can handle 10,000 documents as easily as 10. As your business grows, your administrative overhead remains flat.

### What is the Custom Processor Applet? (Explained Simply)

Imagine you have a warehouse that receives 1,000 internal stock transfer orders every day.
- **Without the Applet**: A clerk has to manually open each order, check it, and click "Process" to move it to the next stage.
- **With the Custom Processor**: You create a "Filter" that says: *"Every time an Sales Order (Internal) is created by Company X in Branch Y, process it immediately."*

The applet automatically gathers these orders in a **Queue**, processes them in the background, and keeps a detailed **History** of everything it did.

### Relationship to Other Applets

This applet acts as the "automation layer" for your core workflows:

- **[Sales Order (Internal) Applet](https://wiki.bigledger.com/applets/sales-workflow/internal-sales-order-applet/)** and **[Sales Invoice (Internal) Applet](https://wiki.bigledger.com/applets/sales-workflow/internal-sales-invoice-applet/)**: These applets generate the source documents that the Custom Processor handles.
- **[Pricebook Applet](https://wiki.bigledger.com/applets/master-data/pricebook-applet/)**: Source of pricing changes that trigger price tag sync events tracked by the processor.
- **[General Ledger Applet](https://wiki.bigledger.com/applets/finance/general-ledger-applet/)**: Once documents are processed (e.g., converted from DRAFT to FINAL), they flow into the audit trails and ledgers verified by this applet.

## Who Benefits from This Applet?

**Operations & Logistics Teams:**
- Automate the high-volume processing of internal stock and sales orders.
- Reduce bottlenecking caused by manual document approval.
- Ensure that "Price Tags" and document labels are generated consistently in the background.

**IT & System Administrators:**
- Configure complex "Processing Filters" to determine which documents are automated vs. manual.
- Monitor the health of background tasks via the **Processing Queue**.
- Troubleshoot failed processing attempts through detailed history logs.

**Finance & Audit Teams:**
- Maintain a complete "History" of automated actions for compliance.
- Ensure that "Posting Status" transitions (e.g., DRAFT to FINAL) follow pre-defined rules.
- Reduce human error in document status management.

## What Problems Does This Solve?

**The "Manual Bottleneck" Problem:**
In high-volume environments, requiring a human to click "OK" on every single document creates a massive delay. The Custom Processor removes this bottleneck by automating repetitive tasks.

**The "Human Error" Problem:**
Manual processing often leads to documents being missed or processed with incorrect statuses. The processor uses fixed filtering criteria to ensure 100% consistency.

**Delayed Documentation (Price Tags):**
In retail, price tags need to be updated instantly when prices change. This applet automates the "Processor" that handles these updates, ensuring tags are always ready and historical changes are tracked.

**Lack of Background Traceability:**
Background tasks are often "invisible." This applet provides a dedicated **Queue** and **History** interface so you can see exactly what the robot is doing in real-time.

## Key Features Overview

{{< cards >}}
  {{< card title="Custom Processing Filters" subtitle="Define exact criteria for automated document triggers" link="#processing-filter-tab" >}}

  {{< card title="Real-Time Processing Queue" subtitle="Monitor active documents awaiting automated actions" link="#processing-queue-tab" >}}

  {{< card title="Automated Posting Management" subtitle="Automatically move documents from DRAFT to FINAL status" link="#key-concepts" >}}

  {{< card title="Detailed Audit History" subtitle="Trace every automated process across multiple doc types" link="#processing-history-tab" >}}

  {{< card title="Specialized Price Tag Tracking" subtitle="Dedicated history for pricing updates and tag generation" link="#price-tag-history-tab" >}}

  {{< card title="Company & Branch Scoping" subtitle="Control automation rules by specific business units" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/custom-processor-applet/custom-processor-applet-overview-infographic.png" alt="Custom Processor Applet Overview: Problems, Solution, and Benefits" caption="Custom Processor Overview: Moving from manual document bottlenecks and human error (The Problems) to automated filters and real-time background queues (The Solution) for Operations Managers, IT Admins, and Logistics Leads (Who Benefits)." >}}

## Key Concepts

### Document Triggers & Filters
The "Brain" of the applet. You define a **Filter Code** that specifies:

1. **Server Doc Type**: The specific category (e.g., `INTERNAL_SALES_ORDER`).
2. **Posting Status**: The state a document must be in to trigger (e.g., `DRAFT`).
3. **Tenant & Company**: The specific organizational context.

### The Lifecycle of a Processed Document

1. **Creation**: A document is created in another applet.
2. **Queueing**: The Custom Processor identifies the document based on your active filters and adds it to the **Queue**.
3. **Consumption**: The backend processor "consumes" the task and performs the action.
4. **Logging**: The result (Success/Fail) is recorded in **Processing History**.

## Quick Start Guide

### For IT Admins: Setting Up an Automation

**Goal:** Automatically process all "Internal Sales Returns" to a finalized status.

1. **Navigate**: Go to **Processing Filter** > **Add (+)**.
2. **Define Filter**:
   - Enter a unique **Filter Code** (e.g., `ISR_AUTO_FINALIZE`).
   - Select `INTERNAL_SALES_RETURN` as the **Server Doc Type**.
   - Set the **Posting Status** to `DRAFT`.
3. **Active Status**: Ensure the **Status** is set to `ACTIVE`.
4. **Save**: Click **Save**. The system will now begin to monitor for all internal returns that match this criteria.

---

### For Operations: Monitoring the Workload

**Goal:** Check why a batch of documents hasn't been processed yet.

1. **Check Queue**: Go to the **Processing Queue** tab.
2. **Search**: Use the **Advanced Search** to find specific documents by date or ID.
3. **Observe**: If documents are "stuck" in the queue, it may indicate that the filter settings are too broad or the backend service is currently busy.
4. **Verify History**: Go to **Processing History** to see if past attempts on these documents failed.

---

### For Retail Managers: Price Tag Auditing

**Goal:** Verify recent pricing updates and tag generation.

1. **Navigate**: Go to the **Price Tag Sync History** tab.
2. **Review**: Filter by **Company Code** and **Store Code**.
3. **Trace**: Read the **Sales Unit Price** and **Updated Date** columns to confirm the latest price reached each branch's shelf labels.

---

## Navigation Menu

The applet has four menu items in the sidebar. The applet opens on **Processing Queue** by default.

---

### 1. Processor Filter

**Concept: Defining the Automation Logic.** This is the "Brain" where you script the rules for your background robot.

- **Filter Code**: A unique name you assign to identify this rule (e.g., `ISO_AUTO_PROCESS`). The system uses this code internally to tag every document it captures.
- **Server Doc Type**: Tells the system *which kind* of document to watch for (e.g., `INTERNAL_SALES_ORDER`).
- **Posting Status**: Tells the system *when* to act — only capture a document when it is in a specific status, such as `DRAFT`.
- **Status**: The master on/off switch. Set to `ACTIVE` to enable the rule, or `INACTIVE` to pause it without deleting it.

#### Listing

Shows all configured filters with their Filter Code, Server Doc Type, Posting Status, Company, and Status (ACTIVE/INACTIVE).

#### Create

| Field | Required | Notes |
|-------|----------|-------|
| **Filter Code** | Yes | Must be unique. Cannot be changed after saving. |
| **Server Doc Type** | Yes | The document type to watch — INTERNAL_SALES_ORDER, INTERNAL_SALES_RETURN, INTERNAL_SALES_DEBIT_NOTE, INTERNAL_SALES_CREDIT_NOTE, or INTERNAL_SALES_INVOICE. Cannot be changed after saving. |
| **Company** | No | Scope this filter to a specific company. If left blank, applies across all companies. Cannot be changed after saving. |
| **Posting Status** | Yes | The document status that triggers the processor — DRAFT or FINAL. Cannot be changed after saving. |
| **Status** | Yes | ACTIVE or INACTIVE. Setting to INACTIVE pauses this filter without deleting it. Can be changed at any time. |

{{< callout type="warning" >}}
**Most fields lock after creation.** Once a filter is saved, only **Status** and **Description** can be edited. Filter Code, Server Doc Type, Company, and Posting Status are permanently locked. If you need to change the logic, delete the filter and create a new one.
{{< /callout >}}

#### Edit

The edit form loads all saved values. Only two fields are editable:
- **Status** — toggle between ACTIVE and INACTIVE at any time
- **Description** — update the label freely

All other fields are displayed as read-only.

---

### 2. Processing Queue

**Concept: Real-Time Workload Visibility.** Anything in this tab is an active task being handled by the background engine.

- **Pending Queue**: Every document here is waiting to be processed. A long and growing queue may indicate a backlog or a paused processor.
- **Doc ID & Creation Date**: Helps you identify exactly which document was captured and when, so you can cross-reference it in the source applet.
- **Target Company**: Shows the company scope the document belongs to, useful when filters are configured across multiple entities.

A real-time view of documents that have been captured by an active filter and are waiting to be processed by the background engine.

**What the columns show:**

| Column | Notes |
|--------|-------|
| **Filter Code** | Which filter rule picked up this document |
| **Server Doc Type** | The type of document queued |
| **Posting Status** | The status the document was in when captured |
| **Txn Date / Created Date** | When the document was created |
| **Company** | Which company the document belongs to |
| **Processor** | The background processor assigned to handle it |
| **External Process Status / Error** | Whether the processor has started acting on it and any errors encountered |
| **External Response Status / Error** | The result returned after the processor attempted to act |

If the queue is growing and not shrinking, it means documents are coming in faster than the processor is handling them — or the backend processor is paused/erroring.

---

### 3. Processing History

**Concept: The Automation Audit Trail.** Because background tasks are usually invisible, this tab provides the **Evidence of Execution**.

- **Success/Failure Ledger**: Every processed document is recorded here with its outcome — so you always know whether automation completed correctly or encountered an error.
- **Historical Trace**: Links each history entry back to its source document number, letting you reconstruct the full lifecycle of any automated transaction.

A permanent, read-only audit log of every document the processor has already acted on.

**What the columns show:**

| Column | Notes |
|--------|-------|
| **Company / Processor** | Which company and processor handled this entry |
| **Server Doc Type / Client Doc Type** | The document type processed |
| **Posting Status** | The status the document was in at the time of processing |
| **Internal Doc No** | The document number from the source applet |
| **External Doc Type / Code / Submission No** | Reference details if the processor submitted the document to an external system |
| **Description** | Notes or error messages from the processing attempt |
| **Created Date / Status** | When the processing happened and whether it succeeded |

Use this to investigate why a specific document was or was not processed, and to satisfy audit requirements that status transitions happened through a configured rule.

---

### 4. Price Tag Sync History

**Concept: Modern Retail & Electronic Shelf Labeling (ESL).**
This tab is a **success-only audit log** of pricing changes that have been pushed to your external electronic shelf-label system. It is driven by a separate background processor from the document-processing flow described above.

- **Successful Sync Log**: One row per item/store/price-change that the processor confirmed the external system accepted.
- **Pricing Trace**: Lets you confirm — at the item × store level — which price is currently live on the shelf tag.
- **NFC Mapping**: The system records an **NFC URL** (`nfc_url`) for each entry. When a shopper taps their phone on the shelf tag, this URL is what their phone opens — so the row here is the source of truth for what the tag will show.

**What the columns show:**

| Column | Notes |
|--------|-------|
| **Item Code** | The internal SKU of the item whose price was synced. |
| **Item Name** | The human-readable name of the item, useful for quick visual confirmation. |
| **Scan Code** | The barcode (EAN/UPC) printed on the shelf label and scanned at POS. |
| **Company Code** | The legal entity that owns this pricing record (e.g., `GS`, `GSO`, `GSD`). |
| **Store Code** | The specific branch/outlet the label belongs to (e.g., `GS-KV-01`). |
| **Sales Unit Price** | The price that was pushed to the shelf label at this sync event. |
| **Created Date** | When the sync entry was first generated by the processor. |
| **Updated Date** | When the entry was last revised (e.g., a follow-up price change). |
| **NFC URL** | The encoded URL written into the shelf tag's NFC chip — what a shopper's phone opens on tap. |

#### How the data lands in this tab

A row only appears here **after a sync to the external ESL system has succeeded**. The pipeline is:

1. You change a price in the [Pricebook Applet](https://wiki.bigledger.com/applets/master-data/pricebook-applet/) (or any update that touches a pricing scheme link).
2. A database trigger enqueues the change for syncing.
3. The background processor wakes up (by default every **1 hour**) and pushes the change to the external ESL/tag system.
4. On a **successful** push, the processor writes one row into Price Tag Sync History.
5. On **failure or skip**, no row appears here — the queue records the failure status separately and the next processor run retries it.

> **Important:** This tab is a **success log only**. If you do not see a row for a price change you expected, it means the sync has not completed successfully yet (still pending, skipped, or failed). The Processing Queue and Processing History tabs in this applet handle internal sales documents, **not** price tag syncs, so failed price tag syncs are not visible there either.

#### Example: Tracing a weekend promotion across branches

You are the pricing manager at GadgetSphere. On Friday afternoon you scheduled a **weekend smartphone promotion** in the [Pricebook Applet](https://wiki.bigledger.com/applets/master-data/pricebook-applet/) — a flagship smartphone drops from RM 3,499 to RM 2,999, effective Saturday 00:00, across the Klang Valley retail branches.

By Saturday morning a branch supervisor at `GS-KV-03` calls: *"The shelf still shows RM 3,499. Did the sync run?"*

Here is how you use **Price Tag Sync History** to confirm:

1. **Open the tab**: Go to **Price Tag Sync History**. The grid loads, sorted by **Created Date** descending.
2. **Filter by item**: Type the smartphone's **Item Code** (e.g., `SP-FLAG-256`) into the filter row. The grid narrows to every successful sync for that SKU.
3. **Filter by store**: Add `GS-KV-03` to the **Store Code** filter.
4. **Read the result** (illustrative — your actual rows depend on your configured ESL backend):

| Item Code | Item Name | Scan Code | Company Code | Store Code | Sales Unit Price | Created Date | Updated Date |
|-----------|-----------|-----------|--------------|------------|------------------|--------------|--------------|
| SP-FLAG-256 | Flagship Smartphone 256GB | 9551234567890 | GS | GS-KV-01 | 2,999.00 | 2026-06-27 00:14:22 | 2026-06-27 00:14:22 |
| SP-FLAG-256 | Flagship Smartphone 256GB | 9551234567890 | GS | GS-KV-02 | 2,999.00 | 2026-06-27 00:14:24 | 2026-06-27 00:14:24 |
| SP-FLAG-256 | Flagship Smartphone 256GB | 9551234567890 | GS | GS-KV-03 | 3,499.00 | 2026-06-19 14:02:08 | 2026-06-19 14:02:08 |

The story tells itself: `GS-KV-01` and `GS-KV-02` both received the new RM 2,999 price shortly after midnight, but `GS-KV-03` has **no Saturday row** — the last successful sync was the previous week at RM 3,499. The shelf tag at that branch never received the new price, which means the sync to the external system either failed or has not been retried yet.

5. **Resolve the gap**: Re-trigger the sync from the [Pricebook Applet](https://wiki.bigledger.com/applets/master-data/pricebook-applet/) (re-save the pricing scheme link, which puts a fresh entry on the sync queue). Wait for the next processor cycle (default 1 hour, or ask an admin to run it sooner). Refresh **Price Tag Sync History** — a new row for `GS-KV-03` at RM 2,999.00 confirms the retry succeeded.

{{< callout type="tip" >}}
**Why the NFC URL matters.** When a shopper at `GS-KV-03` taps their phone on the shelf tag, the NFC URL stored against this sync record is what their phone opens. If the row here is stale (last update at RM 3,499), the tag is still pointing at the old promotion — a customer-trust problem that is hard to spot without this audit trail.
{{< /callout >}}

---

## Configuration & Settings

### Default Selections (`Settings > Defaults`)
Configure the baseline environment for the applet.
- **Company & Branch**: Ensure the applet is focused on the correct business scope.
- **Default Page Count**: Adjust the density of the Queue and History grids for high-volume monitoring.

### Field Configuration (`Settings > Field Settings`)
Fine-tune the processing engine by enabling or disabling specific document features. This is critical for keeping the processing queue weight consistent:

- **Lines Settings**: Toggle the processing logic for **Unit Discounts**, **Tax Schemes (SST/VAT/GST)**, and **Withholding Tax (WHT)**. Disabling these for internal-only transactions can increase processing speed.
- **Department/Dimensions**: Enable or disable accounting tags like **Segments**, **G/L Dimensions**, **Profit Centers**, and **Projects** within your processed document batches.

### Personalization (`Personalization > Default Selection`)
Users can override system-wide defaults with their own preferred **Company** and **Branch** context. This is useful for managers who only oversee a specific region and want the applet to always open with their relevant filters pre-selected.

---

## FAQ

**Q: Can I process documents other than "Sales" types?**  
**A:** Currently, the applet supports `INTERNAL_SALES_ORDER`, `INTERNAL_SALES_RETURN`, `INTERNAL_SALES_DEBIT_NOTE`, `INTERNAL_SALES_CREDIT_NOTE`, and `INTERNAL_SALES_INVOICE`. Support for further document types can be added through system-wide updates.

**Q: Does "Active" mean the process runs immediately?**  
**A:** Yes. Once a filter is set to **ACTIVE**, any document created that matches those criteria will be intercepted and added to the processing queue.

**Q: What happens if a document fails to process?**  
**A:** If an error occurs, the document will remain in the system. You can check the **Processing History** for error logs (if available) or manually process the document in its native applet to resolve any validation errors (like missing line items).

**Q: Can I create multiple filters for the same document type?**  
**A:** Yes, provided they have different **Company** or **Branch** criteria. This allows you to have different automation rules for different regions.

---

## Related Applets

The Custom Processor sits behind the scenes of several core workflows. The applets below either feed source documents into the processor or consume the results once processing completes.

### Source document applets (feed INTO the processor)

| Applet | Relationship | Plain English |
| :--- | :--- | :--- |
| **[Sales Order (Internal) Applet](https://wiki.bigledger.com/applets/sales-workflow/internal-sales-order-applet/)** | Generates `INTERNAL_SALES_ORDER` documents that an active filter can capture and auto-finalize. | Branch raises an internal order → processor picks it up → status moves from `DRAFT` to `FINAL` without manual clicks. |
| **[Sales Invoice (Internal) Applet](https://wiki.bigledger.com/applets/sales-workflow/internal-sales-invoice-applet/)** | Generates `INTERNAL_SALES_INVOICE` documents for high-volume intercompany billing. | Daily intercompany invoices auto-post to the GL the moment they are saved. |
| **[Sales Return (Internal) Applet](https://wiki.bigledger.com/applets/sales-workflow/internal-sales-return-applet/)** | Generates `INTERNAL_SALES_RETURN` documents that the processor can auto-finalize to release stock. | Branch logs a return → processor finalizes it → inventory at the receiving branch updates instantly. |
| **[Sales Debit Note (Internal) Applet](https://wiki.bigledger.com/applets/sales-workflow/internal-sales-debit-note-applet/)** | Generates `INTERNAL_SALES_DEBIT_NOTE` documents for under-billing corrections. | Recurring intercompany adjustments post automatically instead of waiting for manual approval. |
| **[Sales Credit Note (Internal) Applet](https://wiki.bigledger.com/applets/sales-workflow/internal-sales-credit-note-applet/)** | Generates `INTERNAL_SALES_CREDIT_NOTE` documents for over-billing corrections. | Credit notes flow straight through to the AR ledger of the receiving branch. |
| **[Pricebook Applet](https://wiki.bigledger.com/applets/master-data/pricebook-applet/)** | Pricing changes here trigger the **Price Tag Sync History** entries you see in this applet. | Schedule a weekend promotion in Pricebook → processor pushes new prices to every shelf label → audit row appears in Price Tag Sync History. |

### Downstream applets (consume the processor's output)

| Applet | Relationship | Plain English |
| :--- | :--- | :--- |
| **[General Ledger Applet](https://wiki.bigledger.com/applets/finance/general-ledger-applet/)** | Receives the financial impact of every `INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_DEBIT_NOTE`, and `INTERNAL_SALES_CREDIT_NOTE` that the processor moves to `FINAL`. | If the processor is paused, GL postings stop. If it runs cleanly, the GL is always current. |
