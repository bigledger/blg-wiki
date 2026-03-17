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

### TL;DR: The Automation Engine

Think of this applet as a "Digital Clerk" that never sleeps:

*   **You define the rules**: "Watch for all Internal Sales Orders in Branch A."
*   **The clerk watches**: It scans the system for documents matching your criteria.
*   **The clerk acts**: It automatically pushes those documents to the next stage (e.g., from *Draft* to *Finalized*).

It turns manual "clicks" into automated "background events."

### When is this Applet used?

This applet is critical for organizations managing high document volumes or complex inter-branch logistics:

*   **Inter-Branch Fulfillment**: Automatically finalizing internal sales orders so that the receiving branch sees the stock in transit immediately.
*   **Mass Pricing Updates**: Processing "Price Tag" document sets in the background to avoid locking the UI during thousands of pricing changes.
*   **Automated Financial Posting**: Moving recurring internal documents (like Debit Notes) from *Draft* to *Finalized* status the moment they are generated.
*   **Logistics Acceleration**: Ensuring that return authorizations (Internal Sales Returns) are processed instantly to maintain accurate inventory levels across the group.

{{< callout type="info" >}}
**Core Concept**: The applet serves as a **Batch Listener**. It captures documents matching your **Processing Filters**, moves them into a **Processing Queue**, and logs the result in **Processing History**.
{{< /callout >}}

### Why is this Important in Automation and Operations?

Effective use of the Custom Processor drives significant gains in organizational efficiency:

*   **Operational Velocity**: Documents no longer sit in "Draft" waiting for a manager to log in. Workflows move at the speed of the system, not the speed of the staff.
*   **Data Integrity**: Because filters are pre-defined, the system never "forgets" to process a document, ensuring that your inventory and financial records are always up-to-date.
*   **Resource Optimization**: Your staff is freed from the repetitive task of manually processing thousands of low-level internal documents, allowing them to focus on high-value business exceptions.
*   **Scalability**: The background processor can handle 10,000 documents as easily as 10. As your business grows, your administrative overhead remains flat.

### What is the Custom Processor Applet? (Explained Simply)

Imagine you have a warehouse that receives 1,000 internal stock transfer orders every day.
- **Without the Applet**: A clerk has to manually open each order, check it, and click "Process" to move it to the next stage.
- **With the Custom Processor**: You create a "Filter" that says: *"Every time an Internal Sales Order is created by Company X in Branch Y, process it immediately."*

The applet automatically gathers these orders in a **Queue**, processes them in the background, and keeps a detailed **History** of everything it did.

### Relationship to Other Applets

This applet acts as the "automation layer" for your core workflows:
- **Internal Sales Order / Invoice Applets**: These applets generate the source documents that the Custom Processor handles.
- **Price Tag Applet**: The processor includes specialized history tracking for price tags, often used to automate label printing or pricing updates.
- **General Ledger Applet**: Once documents are processed (e.g., converted from DRAFT to FINAL), they flow into the audit trails and ledgers verified by this applet.

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
1.  **Server Doc Type**: The specific category (e.g., `INTERNAL_SALES_ORDER`).
2.  **Posting Status**: The state a document must be in to trigger (e.g., `DRAFT`).
3.  **Tenant & Company**: The specific organizational context.

### The Lifecycle of a Processed Document
1.  **Creation**: A document is created in another applet.
2.  **Queueing**: The Custom Processor identifies the document based on your active filters and adds it to the **Queue**.
3.  **Consumption**: The backend processor "consumes" the task and performs the action.
4.  **Logging**: The result (Success/Fail) is recorded in **Processing History**.

## Quick Start Guide

### For IT Admins: Setting Up an Automation

**Goal:** Automatically process all "Internal Sales Returns" to a finalized status.

1.  **Navigate**: Go to **Processing Filter** > **Add (+)**.
2.  **Define Filter**: 
    - Enter a unique **Filter Code** (e.g., `ISR_AUTO_FINALIZE`).
    - Select `INTERNAL_SALES_RETURN` as the **Server Doc Type**.
    - Set the **Posting Status** to `DRAFT`.
3.  **Active Status**: Ensure the **Status** is set to `ACTIVE`.
4.  **Save**: Click **Save**. The system will now begin monitor for all internal returns that match this criteria.

---

### For Operations: Monitoring the Workload

**Goal:** Check why a batch of documents hasn't been processed yet.

1.  **Check Queue**: Go to the **Processing Queue** tab.
2.  **Search**: Use the **Advanced Search** to find specific documents by date or ID.
3.  **Observe**: If documents are "stuck" in the queue, it may indicate that the filter settings are too broad or the backend service is currently busy.
4.  **Verify History**: Go to **Processing History** to see if past attempts on these documents failed.

---

### For Retail Managers: Price Tag Auditing

**Goal:** Verify recent pricing updates and tag generation.

1.  **Navigate**: Go to the **Price Tag History** tab.
2.  **Review**: Filter by **Company** and **Date**.
3.  **Trace**: Click on individual rows to see which pricing set was processed and when the labels were generated.

---

## Document Tabs Overview

#### Deep Dive: Processing Filter Tab

**Concept: Defining the Automation Logic.**
This tab is the "Brain" where you script the rules for your background robot.

*   **Filter Code**: A unique identifier for the rule (e.g., `ISO_AUTO_BRANCH_NY`). This allows you to track specific automation flows during performance audits.
*   **Server Doc Type**: You select the target document (e.g., `INTERNAL_SALES_ORDER`, `INTERNAL_SALES_INVOICE`). This defines **"What"** is being monitored.
*   **Posting Status**: The trigger status (typically `DRAFT`). The processor waits for a document to hit this state before capturing it.
*   **Status (Active / Inactive)**: The "Master Toggle." Setting a filter to *Inactive* immediately pauses that specific automation without losing your configuration settings.

#### Deep Dive: Processing Queue Tab

**Concept: Real-Time Workload Visibility.**
Anything in this tab is an active task being handled by the background engine.

*   **Pending Queue**: High-volume environments use this to monitor **Processing Latency**. If the queue length is growing, it signals that the volume of sales/stock movements is exceeding the processing frequency.
*   **Doc ID & Creation Date**: Allows you to pinpoint exactly which document is currently "on the workbench."
*   **Target Company**: Confirms that the workload is being distributed to the correct business entity.

#### Deep Dive: Processing History Tab

**Concept: The Automation Audit Trail.**
Because background tasks are usually invisible, this tab provides the **Evidence of Execution**.

*   **Success/Failure Ledger**: Every attempt by the robot is logged. This is where you find "orphaned" documents that failed to process due to validation errors (e.g., zero-priced line items).
*   **Historical Trace**: Provides the **Proof of Posting**. It satisfies auditors that documents moved from *Draft* to *Final* through an authorized and configured system rule.

#### Deep Dive: Price Tag History Tab

**Concept: Modern Retail & Electronic Shelf Labeling (ESL).**
This is a specialized auditing stream for high-velocity pricing changes, specifically designed to synchronize with physical store infrastructure.

*   **Price Set Visibility**: Tracks the background generation of barcode and label sets.
*   **Batch Integrity**: Verifies that mass pricing updates (e.g., for 5,000+ items) completed without data loss.
*   **Advanced NFC Mapping**: The system records **NFC URLs** (`nfc_url`). This allows retailers to monitor the deployment of **Electronic Shelf Labels**, where customers can tap their smartphones on a shelf tag to view real-time digital content or promotion details in the store.

---

## Configuration & Settings

### Default Selections (`Settings > Defaults`)
Configure the baseline environment for the applet.
- **Company & Branch**: Ensure the applet is focused on the correct business scope.
- **Default Page Count**: Adjust the density of the Queue and History grids for high-volume monitoring.

### Field Configuration (`Settings > Field Settings`)
Fine-tune the processing engine by enabling or disabling specific document features. This is critical for keeping the processing queue weight consistent:

*   **Lines Settings**: Toggle the processing logic for **Unit Discounts**, **Tax Schemes (SST/VAT/GST)**, and **Withholding Tax (WHT)**. Disabling these for internal-only transactions can increase processing speed.
*   **Department/Dimensions**: Enable or disable accounting tags like **Segments**, **G/L Dimensions**, **Profit Centers**, and **Projects** within your processed document batches.

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

### Internal Sales Order / Invoice Applets
**Purpose:** The source apps where the items being processed are originally created.

### Price Tag Applet
**Purpose:** Manages the visual layout and data for pricing labels. The Custom Processor handles the background generation tasks for these tags.

### General Ledger Applet
**Purpose:** Records the final financial impact of documents that have been processed from "Draft" into "Final."
