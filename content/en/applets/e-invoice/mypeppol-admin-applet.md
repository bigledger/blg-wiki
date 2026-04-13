---
title: "My Peppol Admin Applet"
description: "Manage Peppol network documents - send invoices to suppliers, receive from customers, track e-invoice submissions, and reconcile documents"
tags:
- peppol
- e-invoice
- document-exchange
- supplier-integration
- customer-integration
weight: 175
---

## Purpose and Overview

The My Peppol Admin Applet is your company-facing interface for managing every document sent and received through the Peppol network. It bridges LHDN e-invoice submission (handled in My E-Invoice Admin Applet) with actual Peppol network distribution, and provides full lifecycle tracking from the moment a document enters the system to its final delivery or receipt.

{{< callout type="info" >}}
**Integration Point**: This applet works in tandem with the My E-Invoice Admin Applet. LHDN submission happens there; Peppol distribution and tracking happens here.
{{< /callout >}}

### Who Benefits from This Applet?

**Accounts Payable:**
- Send purchase invoices and debit notes to suppliers via Peppol
- Monitor outgoing document delivery status
- Trigger manual processing for urgent documents
- Handle transmission errors in the outgoing queue

**Accounts Receivable:**
- Receive sales invoices from customers via Peppol
- Monitor all incoming documents from the Peppol network
- Process received e-invoices into the accounting system

**Finance Teams:**
- Oversee the full Peppol document flow end-to-end
- Run reconciliation checks between LHDN submissions and Peppol history
- Manage company Peppol ID registrations
- Review monthly queue and history reports
- Configure printable formats for sent and received documents

### What Problems Does This Solve?

**The Manual Peppol Management Problem:**
Prior to a centralized admin applet, exchanging e-invoices via Peppol involved:
- Disconnected workflows between LHDN submission and Peppol distribution
- Blind spots when an e-invoice got stuck or failed transmission
- Messy, unorganized receiving workflows for inbound documents from customers
- Complex reconciliation across disparate platforms

**The My Peppol Admin Solution:**
- **Centralized queues** - Instantly see what is pending, what succeeded, and what failed.
- **End-to-end tracing** - Track documents using the same Process ID from LHDN through to Peppol delivery.
- **Automated workflows** - Background cron jobs handle document processing 24/7.
- **Integrated Reconciliation** - Dedicated checks to ensure internal documents match Peppol records.

## Key Features Overview

{{< cards >}}
  {{< card title="Posting Queue" subtitle="Pre-submission staging area for outgoing documents" link="#1-posting-queue" >}}

  {{< card title="Waiting Queue" subtitle="Documents pending Peppol processing after LHDN validation" link="#2-waiting-queue" >}}

  {{< card title="Internal Submission" subtitle="Track all documents you're sending out via Peppol" link="#3-internal-submission-sending-documents" >}}

  {{< card title="External Reception" subtitle="Monitor all documents you're receiving via Peppol" link="#4-external-reception-receiving-documents" >}}

  {{< card title="Monthly Reports" subtitle="Queue and history reports for auditing and reconciliation" link="#5-monthly-reports" >}}

  {{< card title="Reconciliation" subtitle="Match LHDN submissions against Peppol delivery history" link="#6-reconciliation" >}}

  {{< card title="Peppol Config" subtitle="Manage company Peppol ID registrations" link="#7-peppol-config" >}}

  {{< card title="Peppol Testbed" subtitle="Test Peppol document receiving in a sandbox environment" link="#9-peppol-testbed" >}}
{{< /cards >}}

<br/>

![My Peppol Admin Applet Overview](/images/my-peppol-admin-applet/my-peppol-admin-applet-overview-infographic.png)

<br/>

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Finance/Admins: Initial Setup
**Goal:** Configure your company to send and receive Peppol documents.
1. **Register Peppol ID**: Go to **Peppol Config > Peppol ID Registration**. Enter your company details and register your official ID (e.g., `0195:XXXXXXXXX` for Malaysia).
2. **Review Print Formats**: Under **Settings**, set up your "To Peppol Printable Format" and "From Peppol Printable Format".
3. **Sandbox Testing**: Use the **Peppol Testbed** to simulate receiving a document before going fully live.

### For Accounts Payable: Fixing Outgoing Errors
**Goal:** Track and resubmit a failed outgoing document.
1. **Check the Queue**: Go to **Internal Submission > Queue**. Look for documents with an Error status.
2. **Identify Issue**: Click the row to review the specific transmission or validation error.
3. **Resubmit**: Select the document checkbox and click **Submit**. (Note: Only one document can be resubmitted at a time).
4. **Verify Delivery**: Check the **To Peppol AP** or **History** tab a few minutes later to confirm success.

### For Accounts Receivable: Processing Received Invoices
**Goal:** Retrieve a customer invoice sent directly to your Peppol ID.
1. **Check Incoming List**: Go to **External Reception > From Peppol AP**.
2. **Review Details**: Click the newest document to verify the Supplier ID, Tax ID, and transaction amounts.
3. **Move to ERP**: Process the validated document into your core accounting flow (handled automatically in most downstream configurations).
4. **Verify History**: The document moves to the **History** tab once successfully processed.

---

## How It Works: Document Flow

**Outgoing Documents (Sending to Suppliers/Customers):**
```
Document Created in ERP
    ↓
Posting Queue (pre-submission staging)
    ↓
LHDN Submission (My E-Invoice Admin)
    ↓
Waiting Queue (ready for Peppol dispatch)
    ↓
Automatic or Manual Processing
    ↓
Internal Submission → To Peppol AP (sent)
    ↓
Internal Submission → Queue (errors) or History (success)
```

**Incoming Documents (Receiving from Suppliers/Customers):**
```
Supplier/Customer sends via Peppol
    ↓
External Reception → From Peppol AP (received)
    ↓
External Reception → Queue (errors) or History (success)
```

---

## 1. Posting Queue

The Posting Queue is the **pre-submission staging area** for outgoing documents before they are submitted to LHDN. It uses the `bl_fi_generic_doc_peppol_posting_queue` entity.

{{< figure src="/images/my-peppol-admin-applet/posting-queue.png" alt="Posting Queue showing list of documents with Submit, Export, and Withdraw buttons" caption="Posting Queue: Pre-submission staging area where outgoing documents await LHDN processing." >}}

### Columns Displayed

| Column | Description |
|--------|-------------|
| **Doc Version** | e-Invoice schema version (e.g. `1.1.1`) |
| **Doc No.** | Internal document reference number |
| **Doc Short Code** | Mapped short code for the document type |
| **Company** | Company code associated with the document |
| **Entity Name** | Trading partner name |
| **Original Ref. No** | Original e-invoice reference number |
| **Document Date** | Transaction date (YYYY-MM-DD) |
| **Amount** | Transaction amount |
| **Status** | Current `process_status` — `UNPROCESSED` or processed |

### Actions

- **Select & Process**: Select rows with `UNPROCESSED` status (checkbox enabled) and trigger the **postToProcess()** action to push them forward in the workflow.
- **View Details**: Click any row to open the document detail panel.

{{< figure src="/images/my-peppol-admin-applet/view-posting-queue-details.png" alt="View Posting Queue detail panel showing specific document details like Version, Type, No, Company, and Currency" caption="View Posting Queue: Click any row to inspect the full Document Details, Account, and Lines before submitting." >}}

{{< figure src="/images/my-peppol-admin-applet/view-posting-queue-account.png" alt="View Posting Queue showing the Account tab with Entity Details like TIN, Identity Type, and Contact Number" caption="Account Details: Verify trading partner information such as the Tax Identification Number (TIN) before proceeding." >}}

{{< figure src="/images/my-peppol-admin-applet/view-posting-queue-lines.png" alt="View Posting Queue showing the Lines tab with Item Code, Item Name, Tariff Code, and Quantities" caption="Line Items: Inspect individual items, amounts, and tax configurations attached to the document." >}}

{{< callout type="tip" >}}
**Tip**: Checkboxes only appear on rows with `UNPROCESSED` status. Already-processed documents are view-only.
{{< /callout >}}

---

## 2. Waiting Queue

The Waiting Queue holds documents that have been successfully validated by LHDN and are now queued for Peppol network distribution.

{{< figure src="/images/my-peppol-admin-applet/waiting-queue.png" alt="Waiting Queue showing list of documents with Process, Export, and Withdraw buttons" caption="Waiting Queue: Documents that have passed LHDN validation gather here before being dispatched to the Peppol network." >}}

### How Documents Enter the Waiting Queue

1. Invoice submitted to LHDN via My E-Invoice Admin Applet
2. LHDN validates the document → status becomes `"Submitted"`
3. Document is automatically moved to the Waiting Queue with status `UNPROCESSED`

### Processing Methods

**Automatic Processing:**
- Scheduled cron jobs process documents at set intervals
- No manual intervention required
- Typical processing time: minutes

**Manual Processing:**
- Select rows with `UNPROCESSED` status
- Click the process button to dispatch immediately — calls `postToProcess()`
- Useful for urgent documents that cannot wait for the next cron cycle

{{< callout type="tip" >}}
**Normal Operation**: The Waiting Queue should clear quickly. Documents lingering here may indicate processing delays or Peppol configuration issues.
{{< /callout >}}

---

## 3. Internal Submission (Sending Documents)

Track all documents your company is sending to trading partners via the Peppol network.

### 3a. To Peppol AP

The primary log of all outgoing documents successfully dispatched to the Peppol Access Point.

{{< figure src="/images/my-peppol-admin-applet/internal-submission-to-peppol-ap.png" alt="Internal Submission To Peppol AP listing showing all outgoing Peppol documents with Sender and Receiver IDs" caption="To Peppol AP: Track all documents dispatched by your company to the Peppol edge node, verifying Sender and Receiver routing rules." >}}

{{< figure src="/images/my-peppol-admin-applet/internal-submission-to-peppol-ap-details.png" alt="Internal Submission To Peppol Edit detail view showing Document No, Document Type, Currency, Issue Date, Amounts, Process ID, and Buyer's Info" caption="To Peppol AP Details: View individual document specifics, tax totals, and importantly, the Process ID to trace the exact transaction." >}}

{{< figure src="/images/my-peppol-admin-applet/internal-submission-to-peppol-ap-export.png" alt="Internal Submission To Peppol Edit panel showing the Export tab with Printable Format dropdown and EXPORT AS PDF button" caption="Export Sent Documents: Select a custom 'To Peppol' printable format and export the document as a PDF." >}}

**Key Information Tracked:**
- Document identifiers (Type, No., Original Ref.)
- Peppol routing numbers (Sender ID, Receiver ID, Org ID)
- Trading partner details (Name, ID, Tax ID for both Buyer and Supplier)
- Transaction values (Amounts, Dates, e-Invoice Version `1.1.1` and Code)

### 3b. Queue (Error Handling — Outgoing)

Documents that fail transmission or validation during outgoing Peppol processing appear here.

{{< figure src="/images/my-peppol-admin-applet/internal-submission-queue.png" alt="Internal Submission Queue listing showing documents with transmission errors like AS4_ERROR and TRANSPORT_ERROR" caption="Internal Submission Queue: Monitor and resubmit documents that failed to reach the Peppol network due to routing or validation errors." >}}

**Actions Available:**
- **Submit**: Resubmit a selected stuck document. Only one document can be submitted at a time.
- **View Details**: Click a row to inspect exact validation errors.

{{< figure src="/images/my-peppol-admin-applet/internal-submission-queue-details.png" alt="Internal Submission Queue Edit view showing document details with Delete and Submit action buttons" caption="Queue Action Panel: Review details for a stuck document and click Submit to manually retry transmission." >}}

**Temporary Workaround (if resubmission fails):**
1. Note the error type and document number
2. Contact technical support
3. Provide the document GUID and document number
4. Backend team resolves and resubmits

### 3c. History (Successfully Sent)

Complete archive of all outgoing documents that were successfully transmitted via Peppol. Use this to confirm delivery and audit your Peppol transmission volume.

{{< figure src="/images/my-peppol-admin-applet/internal-submission-history.png" alt="Internal Submission History listing showing successfully transmitted documents with Sent Dates and Amounts" caption="Internal Submission History: The permanent ledger of all successful outgoing Peppol transmissions." >}}

---

## 4. External Reception (Receiving Documents)

Monitor and manage all documents sent to your company by suppliers or customers via the Peppol network.

### 4a. From Peppol AP

Lists all incoming documents received on your company's Peppol ID.

{{< figure src="/images/my-peppol-admin-applet/external-reception-from-peppol-ap.png" alt="External Reception From Peppol AP listing showing incoming invoices with Process IDs and Buyer details" caption="From Peppol AP: Central hub for monitoring all inbound documents sent from your trading partners directly to your Peppol ID." >}}

**Key Information Tracked:**
- **Process ID**: The unique Peppol process identifier
- Originator references and Document types
- Counterparty details to ensure the invoice is legitimate
- Amounts and line items for processing

{{< figure src="/images/my-peppol-admin-applet/external-reception-from-peppol-ap-details.png" alt="External Reception From Peppol Edit detail view showing Document No, Document Type, Amounts, and Buyer's Info" caption="From Peppol AP Details: Inspect the precise header information sent by the supplier, including all calculated tax totals." >}}

{{< figure src="/images/my-peppol-admin-applet/external-reception-from-peppol-ap-export.png" alt="External Reception From Peppol Edit panel showing the Export tab with Printable Format dropdown and EXPORT AS PDF button" caption="Export Received Documents: Use custom printable formats to export incoming Peppol documents as PDFs for your records." >}}

### 4b. Queue (Error Handling — Incoming)

Documents that fail processing upon receipt appear here. Common issues include format validation failures, missing mandatory fields, or Peppol ID mismatches. Requires backend intervention for resolution.

### 4c. History (Successfully Received)

Archive of all incoming documents that were successfully processed into your ERP.

{{< callout type="warning" >}}
**Known Issue**: A mapping issue may occasionly prevent the History list from displaying received documents correctly. This is a known issue being tracked for resolution.
{{< /callout >}}

---

## 5. Monthly Reports

The Monthly Reports section provides summary views for auditing document flow over a date range.

### Queue Report
Displays a per-company summary of documents that passed through the queue, logging Start/End dates, and user modification history.

### History Report
Displays a per-company summary of successfully processed documents over a reporting period.

{{< callout type="info" >}}
**Note**: The Queue Report and History Report currently display sample data. Live API integration is actively being developed.
{{< /callout >}}

---

## 6. Reconciliation

The Reconciliation section lets Finance teams cross-match documents across different stages of the pipeline to identify gaps or mismatches.

### IRB Internally Submitted vs Submission History
Compares documents submitted internally to LHDN against what appears in the Peppol submission history. Highlights mismatches in Supplier Amount vs Buyer Amount and tracks the **Remaining Time To Request** for dispute claims.

### IRB Externally Submitted vs Internal Gendoc
Compares externally received Peppol documents against internally generated documents to detect discrepancies.

---

## 7. Peppol Config

Administrative control for managing your company's Peppol network registrations.

### Peppol ID Registration
Register and manage your company's Peppol IDs. Supports Create, Edit, and View details indicating your registration status.

{{< figure src="/images/my-peppol-admin-applet/peppol-id-registration.png" alt="Peppol ID Registration listing and Create panel showing Special Identifier, Business Identifier, and Company Info mapping" caption="Peppol ID Registration: Officially register your business entity onto the Peppol network by providing your authorized identification codes." >}}

### Registered Companies
View and manage all companies under your profile that are registered on the Peppol network. Settings automatically sync with the **Organisation Applet**.

{{< figure src="/images/my-peppol-admin-applet/peppol-registered-companies.png" alt="Registered Companies listing showing active entities on the Peppol network" caption="Registered Companies: Validate your internal organizational units that are active and ready to transact on Peppol." >}}

---

## 8. Settings

Configure applet-level behaviour and document formatting:
- **Default Settings & Field Configuration**: Customize selections and visible columns.
- **Printable Format Settings**: Add and Edit formats for `To Peppol` and `From Peppol` communications.
- **Webhook**: Set up endpoints for real-time Peppol transaction alerts.
- **Permissions Framework**: Role-based access control governed by User, Team, and Role permission sets.

---

## 9. Peppol Testbed

A secure sandbox where you can simulate receiving documents. Use the **Receiving Test History** to validate connectivity and parsing logic before turning your official Peppol ID live.

---

## 10. Integration Points

### With My E-Invoice Admin Applet
Documents flow from LHDN submission (My E-Invoice Admin) into the Waiting Queue (My Peppol Admin) automatically once validated. The same **Process ID** is used across both systems for end-to-end traceability.

### With Peppol AP Admin Applet
- **Peppol AP Admin** is the internal staff tool for managing all tenants' Peppol routing.
- **My Peppol Admin** is the company-facing view strictly showing your internal documents.

---

## 11. Frequently Asked Questions

**Q: What is the difference between the Posting Queue and the Waiting Queue?**
A: Important distinction: The Posting Queue is the pre-LHDN staging area. The Waiting Queue holds documents *after* LHDN validates them, ready for Peppol dispatch. Both must clear for a document to successfully reach the recipient.

**Q: Can I manually resubmit a failed document?**
A: Yes. Go to **Internal Submission > Queue**, select the document checkbox, and click **Submit**. Note: The system restricts resubmission to one document at a time.

**Q: How do I know if an outbound invoice was properly delivered?**
A: Check **Internal Submission > To Peppol AP**. Once it clears processing, it will permanently appear in your **Internal Submission > History**.

**Q: I keep seeing a mismatch in the Reconciliation tab. What does this mean?**
A: This usually means the amount logged natively in your system differs from the exact data processed by LHDN/Peppol. Check the "Remaining Time To Request" field; you only have a limited window to raise disputes or corrections with LHDN once submitted.

**Q: Why don’t my Queue Reports show current data?**
A: The Monthly Reports functionality (Queue and History Reports) is currently undergoing an API upgrade and may display sample sandbox data. Rely on the direct Queue or History lists under Internal/External sections for live data.

**Q: Do I need to set up my Peppol ID here AND in the Organisation Applet?**
A: No. Peppol Config settings are synchronized globally. Changes made here will reflect in the Organisation Applet automatically.

{{< callout type="info" >}}
**Need Help?** Contact your system administrator or support team for assistance with advanced Peppol configuration, transmission issues, or deep reconciliation discrepancies.
{{< /callout >}}
