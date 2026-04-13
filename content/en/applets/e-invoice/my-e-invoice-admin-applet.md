---
title: "My E-Invoice Admin Applet"
description: "Comprehensive e-invoice lifecycle management for LHDN submission, validation, rejection handling, and cancellation compliance in Malaysia"
tags:
- e-invoice
- lhdn
- myinvois
- compliance
- malaysia
- finance
- submission
- batch-processing
weight: 165
---

## Purpose and Overview

The **My E-Invoice Admin Applet** is the central hub for managing your company's e-invoice compliance with LHDN (Lembaga Hasil Dalam Negeri) under Malaysia's MyInvois mandate. It handles the complete lifecycle of every e-invoice — from staging documents in the Posting Queue and submitting them in bulk via Batch Pool, through to rejection resolution, cancellation management, and monthly compliance reporting.

{{< callout type="info" >}}
**Core Concept**: Every document you submit goes through LHDN's MyInvois portal for validation. This applet is your control panel for that entire process — queuing, submitting, monitoring, resolving errors, and archiving results.
{{< /callout >}}

### Who Benefits from This Applet?

**Accounts Payable Teams:**
- Queue purchase invoices, credit notes, and debit notes for LHDN submission
- Track validation status of every outgoing document
- Resolve rejection errors without leaving the system
- Maintain a complete submission audit trail

**Accounts Receivable Teams:**
- Submit sales invoices to LHDN for compliance
- Monitor validation outcomes in real time
- Handle cancellation requests for validated invoices
- Ensure all issued invoices meet LHDN requirements

**Finance & Compliance Officers:**
- Oversee company-wide e-invoice compliance
- Run monthly discrepancy reports for audits
- Ensure submission deadlines are met
- Manage bulk submissions efficiently via Batch Pool

**System Administrators:**
- Configure submission settings and company details
- Manage LHDN API credentials and connectivity
- Monitor system health and batch processing queues
- Set up document type mappings and validation rules

### What Problems Does This Solve?

**The Manual E-Invoice Compliance Problem:**

Without a dedicated tool, managing LHDN e-invoice compliance is fragmented and error-prone:
- Logging into MyInvois portal separately for every submission
- No visibility into submission status without manual checking
- Difficult to track which documents have been validated or rejected
- Rejection errors require manual identification and resubmission
- No centralised audit trail for compliance reporting

**The My E-Invoice Admin Applet Solution:**

- **Posting Queue** — Stage and review documents before sending them to LHDN
- **Batch processing** — Submit hundreds of documents at once via Batch Pool
- **Inline error resolution** — View and fix rejection errors directly from the interface
- **Cancellation management** — Submit and track cancellation requests from a single screen
- **Complete audit trail** — Full history of every submission for compliance reporting
- **Monthly reports** — Discrepancy reports to reconcile your records against LHDN

## Key Features Overview

{{< cards >}}
  {{< card title="Master List" subtitle="Complete view of all e-invoice documents across all statuses" link="#1-master-list" >}}

  {{< card title="Posting Queue" subtitle="Stage and review documents before submitting to LHDN" link="#2-posting-queue" >}}

  {{< card title="Batch Pool" subtitle="Manage bulk submissions and resolve rejection errors inline" link="#3-batch-pool" >}}

  {{< card title="Internal Submission" subtitle="Track all outgoing LHDN submissions and their outcomes" link="#5-internal-submission" >}}

  {{< card title="Cancellation" subtitle="Submit and track LHDN cancellation requests" link="#7-cancellation" >}}

  {{< card title="Monthly Report" subtitle="Discrepancy reports for monthly compliance reconciliation" link="#8-monthly-report" >}}
{{< /cards >}}

{{< figure src="/images/my-e-invoice-admin-applet/my-e-invoice-admin-applet-overview-infographic.png" alt="My E-Invoice Admin Applet Overview Infographic" caption="My E-Invoice Admin Applet Overview: Streamlining LHDN compliance from submission to reconciliation." >}}

## Key Concepts

### Understanding the E-Invoice Flow

Every e-invoice submission moves through a defined lifecycle. Understanding this flow helps you act at the right stage:

| Stage | Where | What Happens |
|-------|-------|-------------|
| **Document Created** | Sales / Purchase Applet | Invoice, credit note, or debit note is generated |
| **Staged** | Posting Queue | Document queued and reviewed before submission |
| **Submitted to LHDN** | Batch Pool / Individual Pool | Document sent to MyInvois portal via API |
| **Validated** | LHDN MyInvois | LHDN checks the document against compliance rules |
| **Submitted (Accepted)** | Internal Submission → History | Document is LHDN-compliant and legally valid |
| **Rejected** | Batch Pool | Document failed validation — must be corrected |
| **Cancelled** | Cancellation | Validated document voided upon LHDN approval |

{{< callout type="tip" >}}
**Real-World Example**: Your AP team issues a purchase invoice. It enters the **Posting Queue** for review, gets submitted via **Batch Pool**, LHDN validates it, and the result appears in **Internal Submission → Submission History**. If rejected, it returns to Batch Pool for correction and resubmission.
{{< /callout >}}

### Document Statuses Explained

| Status | Meaning | Action Required |
|--------|---------|-----------------|
| **Pending** | Submitted, awaiting LHDN response | Wait — processing in progress |
| **Submitted** | Validated and accepted by LHDN | None — document is compliant |
| **Rejected** | Failed LHDN validation | Review error, correct, and resubmit |
| **Cancelled** | LHDN-approved cancellation | Document is void — reissue if needed |
| **Error** | Submission failed before reaching LHDN | Check system connectivity and retry |

### What LHDN Validates

LHDN checks every document against MyInvois compliance rules before issuing a result:

| Validation Check | What It Looks For |
|-----------------|-------------------|
| **Mandatory fields** | TIN, BRN, address, document date must all be present |
| **TIN accuracy** | Must match exactly with LHDN's registered records |
| **Tax codes** | Correct SST classification per line item |
| **Amount calculations** | Tax totals must match sum of line items |
| **Document format** | Must conform to the MyInvois schema |
| **Duplicate check** | Document not previously submitted and accepted |

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Finance Teams: Submit Your First E-Invoice

**Goal:** Get a document from staging to LHDN-validated in 5 steps.

1. **Open**: Go to **My E-Invoice Admin Applet** from the launchpad
2. **Check Queue**: Click **Posting Queue** in the left sidebar — find your document
3. **Submit**: Select the document and click **Submit** — it moves to Batch Pool for processing
4. **Monitor**: Click **Batch Pool** — the status column updates from **Pending** to **Submitted** or **Rejected**
5. **Confirm**: Click **Internal Submission → Submission History** — a **Submitted** status confirms LHDN acceptance

**What happens next?** Validated documents are available for Peppol distribution via My Peppol Admin Applet.

**Pro Tip:** Verify TIN and BRN are correct before submitting — these are the most common cause of immediate rejection.

---

### For Finance Teams: Resolve a Rejected Invoice

**Goal:** Fix a rejected document and resubmit to LHDN.

1. **Open Batch Pool**: Click **Batch Pool** in the left sidebar
2. **Find Rejected**: Look for documents with **Rejected** status
3. **Read Error**: Click the document — read the LHDN error code and error description carefully
4. **Correct**: Fix the flagged field directly in the Batch Pool interface, or return to the originating Sales/Purchase applet for larger corrections
5. **Resubmit**: Click **Resubmit** — monitor for the updated LHDN response

{{< callout type="warning" >}}
**Important**: Do not resubmit without correcting the flagged field. An unchanged rejected document will receive the same rejection from LHDN.
{{< /callout >}}

**Scenario — Wrong TIN:**
```
Document submitted → LHDN returns: "Error: Invalid TIN format"
Action: Open document in Batch Pool → correct TIN field → Resubmit
Result: LHDN accepts document → Status: Submitted
```

**Scenario — Mismatched Tax Total:**
```
Document submitted → LHDN returns: "Error: Tax amount does not match line totals"
Action: Return to Sales Applet → correct line item tax → resubmit via Posting Queue
Result: LHDN accepts document → Status: Submitted
```

---

### For Finance Teams: Run a Bulk Batch Submission

**Goal:** Submit multiple documents at once using Batch Pool.

1. **Go to Posting Queue**: Click **Posting Queue** in the sidebar
2. **Select Documents**: Tick all documents ready for submission
3. **Submit Batch**: Click **Submit** — all selected documents are sent to LHDN together
4. **Open Batch Pool**: Click **Batch Pool** to see per-document results
5. **Resolve Errors**: For any **Rejected** documents, correct and resubmit within Batch Pool

**Pro Tip:** Group submissions by document type (all sales invoices together, then credit notes) for easier error tracking.

---

### For Compliance Officers: Cancel a Validated Invoice

**Goal:** Submit a cancellation request to LHDN for a document already validated.

**Step 1: Check Eligibility**
- Confirm the document is within LHDN's cancellation window
- Prepare the reason for cancellation

**Step 2: Submit Cancellation** (left sidebar → **Cancellation**)
- Locate the validated invoice in the list
- Click **Request Cancellation**
- Enter the cancellation reason (required by LHDN)
- Submit the request

**Step 3: Monitor Status**
- **Approved** → Document status changes to **Cancelled** — reissue a corrected invoice if the transaction is still valid
- **Rejected by LHDN** → Review the rejection reason and consult the latest LHDN MyInvois guidelines

---

{{< callout type="tip" >}}
**New to the system?** Start here:
1. Finance teams — open **Posting Queue** and submit a single document first before attempting bulk batches
2. Once comfortable, use **Batch Pool** for high-volume submissions
3. Compliance officers — read the **Cancellation** section and verify LHDN policy before submitting any cancellation requests
{{< /callout >}}

---

## 1. Master List

{{< figure src="/images/my-e-invoice-admin-applet/master-list.png" alt="My E-Invoice Admin Applet Master List showing all submitted documents with tabs for Document and Document Details/Lines, columns for Section, Doc Short Code, Submission Type, Amount, and Status" caption="Master List: A consolidated view of all e-invoice documents across every status — search, filter, and export from here." >}}

The Master List is the complete view of all e-invoice documents in the system, regardless of status. Use it to search for any specific document, check its current state, or export records for reporting.

### Tabs

| Tab | What It Shows |
|-----|--------------|
| **Document** | Header-level view — one row per document |
| **Document Details/Lines** | Line-item view — individual line entries per document |

### What You Can Do

- **Search** — Find documents by document number, company, buyer, or supplier
- **Export** — Download the filtered list for external reporting
- **Filter** — Narrow by status, submission type, date range, or company
- **View Details** — Click any row to see the full document and LHDN submission outcome

{{< callout type="tip" >}}
**Best use of Master List**: Start here when you receive a query about a specific invoice — search by document number to instantly see its LHDN submission status, Process ID, and any rejection history.
{{< /callout >}}

---

## 2. Posting Queue

{{< figure src="/images/my-e-invoice-admin-applet/posting-queue.png" alt="Posting Queue listing page showing documents staged for LHDN submission with columns for Doc No, Company, Entity Name, Original amount, Document amount, Submission status, Queue status, and Validation status" caption="Posting Queue: Documents staged and ready for LHDN submission — review before sending." >}}

The Posting Queue holds documents that have been generated in Sales or Purchase applets and are ready to be submitted to LHDN. Think of it as a staging area — documents sit here until you review and submit them.

### How Documents Enter the Queue

Documents appear in the Posting Queue automatically when:
- A sales invoice is approved in the Sales Applet
- A purchase invoice is confirmed in the Purchase Applet
- A credit note or debit note is finalised

### Submitting from the Queue

1. Review the documents listed
2. Verify document amounts and entity details look correct
3. Select one or multiple documents
4. Click **Submit** — selected documents are sent to LHDN via Batch Pool

### Column Guide

| Column | What It Shows |
|--------|--------------|
| **Doc No** | Internal document number |
| **Company** | The company entity submitting the document |
| **Entity Name** | Buyer or supplier name |
| **Original Amount** | Document amount before tax |
| **Document Amount** | Total including tax |
| **Submission Status** | Current LHDN submission state |
| **Queue Status** | Position in the submission queue |
| **Validation Status** | LHDN validation outcome |

{{< callout type="warning" >}}
**Before submitting**: Verify the entity name and amounts are correct. Errors caught here are cheaper to fix than after LHDN rejection.
{{< /callout >}}

---

## 3. Batch Pool

{{< figure src="/images/my-e-invoice-admin-applet/batch-pool.png" alt="Batch Pool listing page showing bulk submission batches with per-document validation status, LHDN error codes, and inline resubmission options" caption="Batch Pool: Manage bulk submissions and resolve per-document LHDN rejection errors inline." >}}

The Batch Pool handles documents submitted in bulk. After you submit from the Posting Queue, documents appear here with their per-document LHDN validation results. Rejected documents stay in Batch Pool for inline correction and resubmission.

### How Batch Pool Works

```
Submit from Posting Queue
    ↓
Documents enter Batch Pool
    ↓
LHDN validates each document
    ↓
Submitted ✓  →  Moves to Submission History
Rejected  ✗  →  Stays in Batch Pool for correction
```

### Resolving Rejected Documents

**Step 1: Identify the error**
- Click the rejected document
- Read the LHDN **error code** and **error description**
- Identify which specific field failed validation

**Step 2: Correct inline**
- Edit the invalid field directly within Batch Pool (for minor field corrections)
- For larger structural errors, return to the originating Sales/Purchase applet

**Step 3: Resubmit**
- Click **Resubmit** on the corrected document
- Monitor for the updated LHDN response

{{< callout type="tip" >}}
**Most common rejection causes**: Invalid TIN format, missing BRN, incorrect tax code classification, or line total mismatches. Check these four fields first before looking elsewhere.
{{< /callout >}}

### Batch Pool Best Practices

✓ **Check Posting Queue before submitting** — catch obvious errors before LHDN sees them
✓ **Resolve errors the same day** — unresolved rejections delay compliance reporting
✓ **Note the error code** — each LHDN error code maps to a specific field and fix
✓ **Submit off-peak when possible** — faster LHDN response times outside business hours

❌ **Common mistakes:**
- Resubmitting without changing the rejected field — same error will return
- Ignoring the error code and guessing what to fix
- Leaving rejected documents unresolved past month-end

---

## 4. Individual Pool & Single General Pool

{{< figure src="/images/my-e-invoice-admin-applet/individual-pool.png" alt="Individual Pool listing page showing individually submitted e-invoices with document details, LHDN validation status and Process ID" caption="Individual Pool: Track documents submitted individually rather than as part of a batch." >}}

{{< figure src="/images/my-e-invoice-admin-applet/single-general-pool.png" alt="Single General Pool listing showing consolidated single submissions with document reference, amount, status and tracking details" caption="Single General Pool: Manage single general submissions and track their LHDN validation outcomes." >}}

### Individual Pool

The Individual Pool tracks documents that were submitted one at a time rather than as part of a batch. Use this when:
- A single document needs urgent submission outside the batch cycle
- You need immediate per-document LHDN feedback without waiting for a batch to complete

### Single General Pool

The Single General Pool handles single-document submissions of a general (non-batch) type. Documents here follow the same validation process as Batch Pool but are tracked separately for reporting and audit purposes.

---

## 5. Internal Submission

The Internal Submission section provides a full breakdown of all outgoing LHDN submissions, organised into sub-menus by submission type and status. Use these views to track the exact state of every document you have ever sent to LHDN.

### To IRB E-Invoice

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-to-irb-e-invoice.png" alt="To IRB E-Invoice listing showing documents sent to LHDN IRB portal with tracking number, submission date, document type and current status" caption="To IRB E-Invoice: All outgoing e-invoice submissions sent directly to LHDN's IRB portal." >}}

Shows all documents submitted to LHDN's IRB (Inland Revenue Board) e-invoice portal. This is the primary outgoing submission view for tax invoice compliance.

**Use this to:**
- Confirm a document was transmitted to LHDN
- Retrieve the IRB tracking reference number
- Check submission date and time

---

### Individual Submission

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-individual.png" alt="Individual Submission listing showing documents submitted one at a time with LHDN response status and submission timestamp" caption="Individual Submission: Track e-invoices submitted individually outside of a batch cycle." >}}

Lists all documents submitted individually (not as part of a batch). Useful when urgent documents were submitted one at a time and need separate tracking.

---

### Consolidated Submission

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-consolidated.png" alt="Consolidated Submission listing showing grouped document submissions with batch reference number, total count, submission date and LHDN validation status" caption="Consolidated Submission: Track grouped batch submissions and their overall LHDN validation results." >}}

Lists all batch (consolidated) submissions, showing the batch reference, total document count, and overall outcome. Drill into a batch to see the per-document result.

**Scenario — Monthly batch review:**
```
End of month: You submitted 150 invoices in 3 batches
Open Consolidated Submission → see all 3 batches listed
Batch 1: 50 docs → 50 Submitted ✓
Batch 2: 50 docs → 48 Submitted, 2 Rejected ✗
Batch 3: 50 docs → 50 Submitted ✓
Action: Go to Batch Pool → fix and resubmit the 2 rejected documents
```

---

### Validation Queue

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-validation-queue.png" alt="Validation Queue listing showing documents currently awaiting LHDN validation response with queue position and submission timestamp" caption="Validation Queue: Documents actively awaiting a validation response from LHDN's MyInvois portal." >}}

Shows documents that have been sent to LHDN and are awaiting a validation response. Under normal conditions this list should be short — documents pass through quickly.

{{< callout type="warning" >}}
**If documents stay in Validation Queue for more than 30 minutes**: Check LHDN API connectivity in Settings. An API outage can stall all pending validations.
{{< /callout >}}

---

### Portal Request

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-portal-request.png" alt="Portal Request listing showing requests made to the LHDN MyInvois portal with request type, reference number, request date and current status" caption="Portal Request: Track all requests made to the LHDN MyInvois portal including submission, cancellation, and query requests." >}}

Tracks every request made to the LHDN MyInvois portal — not just document submissions, but also cancellation requests and any query submissions. Use this as the raw portal-level log.

---

### Submission History

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-history.png" alt="Submission History listing showing complete archive of all LHDN submissions with Process ID, document number, submission date, status, amount and party details" caption="Submission History: Full compliance archive — every LHDN submission with its final outcome, Process ID, and document details." >}}

The Submission History is the authoritative archive of every document ever submitted to LHDN through this applet. Every row includes the final outcome, Process ID, and timestamps.

**What History Tracks:**

| Field | Details |
|-------|---------|
| **Document Number** | Internal reference number |
| **Document Type** | Invoice, credit note, debit note |
| **Submission Date** | When submitted to LHDN |
| **Status** | Submitted, Rejected, or Cancelled |
| **Process ID** | LHDN-assigned unique identifier |
| **Party Details** | Buyer or supplier information |
| **Amount** | Document total before and after tax |

**Using History for Compliance Audits:**
1. Filter by current month
2. Confirm all issued documents show **Submitted** status
3. Identify any remaining **Rejected** documents and resolve them
4. Export the filtered list for your compliance records

---

### Email Dashboard

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-email-dashboard.png" alt="Email Dashboard listing showing automated email notifications sent for e-invoice submission events with recipient address, email subject, event trigger and delivery status" caption="Email Dashboard: Audit log of all automated email notifications sent for submission events." >}}

The Email Dashboard shows every automated email notification sent by the system in response to submission events — validations, rejections, cancellations. Use this to:
- Confirm a rejection notification was delivered to the finance team
- Check if a submission confirmation was sent to the right recipient
- Troubleshoot cases where a team member claims they didn't receive an alert

---

## 6. External Reception & Reconciliation

The sidebar includes **External Reception** and **Reconciliation** sections that handle incoming e-invoices from suppliers and reconciliation of your internal records against LHDN's data.

### External Reception

| Sub-menu | Purpose |
|----------|---------|
| **Queue** | Incoming e-invoices from LHDN awaiting processing |
| **From IRB E-Invoice** | E-invoices received from the LHDN IRB portal |

### Reconciliation (Purchase)

| Sub-menu | Purpose |
|----------|---------|
| **PD Matching Q.** | Purchase documents awaiting matching against incoming e-invoices |
| **Inc. E-Invoice Match Q.** | Incoming e-invoices queued for matching against purchase documents |
| **Matched History** | Archive of successfully matched purchase document pairs |
| **Inc. Unmtch. E-Inv. Hist.** | Incoming e-invoices that could not be matched |
| **Unmatched PD Hist.** | Purchase documents that could not be matched |

### Reconciliation (Sales)

| Sub-menu | Purpose |
|----------|---------|
| **SD Matching Q.** | Sales documents awaiting matching |
| **Inc. Ecom Matcd. Q.** | Incoming e-commerce e-invoices queued for matching |
| **Matched History** | Archive of successfully matched sales document pairs |
| **Inc. Ecom Unmatcd. Hist.** | Unmatched incoming e-commerce e-invoices |
| **SD Unmatcd. Hist.** | Unmatched sales documents |

{{< callout type="info" >}}
**Note**: Detailed step-by-step documentation for External Reception and Reconciliation workflows is covered separately.
{{< /callout >}}

---

## 7. Cancellation

The Cancellation section has two sub-menus: **Rejection Requests** and **Cancellation Queue**.

{{< figure src="/images/my-e-invoice-admin-applet/cancellation.png" alt="Cancellation listing page showing rejection requests submitted to LHDN with document reference, cancellation reason, request date and LHDN approval status" caption="Cancellation → Rejection Requests: Submit and track LHDN cancellation requests for validated e-invoices." >}}

| Sub-menu | Purpose |
|----------|---------|
| **Rejection Requests** | List of cancellation requests submitted to LHDN and their approval status |
| **Cancellation Queue** | Documents staged and queued pending cancellation submission to LHDN |

Manage cancellation requests for e-invoices that have already been validated by LHDN. A cancellation voids the document — it is no longer a valid tax document once LHDN approves the request.

### When to Cancel

| Scenario | Action |
|----------|--------|
| Invoice issued to wrong party | Cancel and reissue to correct party |
| Incorrect amount or tax amount | Cancel and reissue with correct figures |
| Duplicate submission accepted by LHDN | Cancel the duplicate |
| Transaction voided or reversed | Cancel the associated e-invoice |

### LHDN Cancellation Policy

{{< callout type="warning" >}}
**Important**: LHDN imposes a cancellation time window. Requests submitted outside this window will be rejected. Always verify eligibility before initiating. Refer to the latest LHDN MyInvois guidelines for the current cancellation period.
{{< /callout >}}

### Cancellation Process

**Step 1: Locate the document**
- Go to **Cancellation** in the left sidebar
- Find the validated invoice by document number or date

**Step 2: Submit the request**
1. Click the document
2. Click **Request Cancellation**
3. Enter the cancellation reason (required by LHDN)
4. Confirm and submit

**Step 3: Monitor the outcome**

| Outcome | Status Update | Next Step |
|---------|-------------|-----------|
| **Approved by LHDN** | Document → Cancelled | Reissue a corrected invoice if transaction is still valid |
| **Rejected by LHDN** | Cancellation denied | Review reason — check if outside cancellation window |

**Scenario — Invoice sent to wrong customer:**
```
Submitted invoice INV-2024-099 to Customer A ✗
Correct recipient: Customer B
Steps:
1. Go to Cancellation → find INV-2024-099
2. Request Cancellation → reason: "Incorrect buyer entity"
3. LHDN approves → INV-2024-099 status: Cancelled
4. Create new invoice INV-2024-100 for Customer B
5. Submit INV-2024-100 via Posting Queue → LHDN validates ✓
```

### After Cancellation

Once cancelled:
- The document is no longer a valid tax document
- It remains in Submission History for audit purposes — it is not deleted
- A new invoice must be created, submitted, and validated before issuing to the customer

---

## 8. Monthly Report

The Monthly Report section has two sub-menus: **Discrepancies Report** and **History**.

{{< figure src="/images/my-e-invoice-admin-applet/monthly-report.png" alt="Monthly Report showing a Discrepancies Report with period selector, submission totals, and a breakdown of submitted vs discrepant documents by type" caption="Monthly Report → Discrepancies Report: Reconcile your submission records against LHDN data for the selected period." >}}

| Sub-menu | Purpose |
|----------|---------|
| **Discrepancies Report** | Compares your records against LHDN's to identify gaps or mismatches |
| **History** | Archive of past monthly reports for audit and comparison |

### Discrepancies Report

Use this report at month-end to confirm that every document you issued has a corresponding validated record in LHDN:

1. Select the reporting **period** (month and year)
2. Run the report
3. Review the output:
   - Documents in your system but not in LHDN → submission may have failed
   - Documents in LHDN but not in your system → investigate unexpected submissions
4. Resolve any discrepancies before closing the month

**Monthly Compliance Checklist:**
```
1. Run Discrepancies Report for the month
2. All issued documents = Submitted in LHDN ✓
3. Zero unresolved Rejected documents ✓
4. No unexpected documents in LHDN records ✓
5. Export report and file for compliance records ✓
```

---

## 9. Tools

### Bulk TIN Validation

The **Tools → Bulk TIN Validation** feature allows you to validate Taxpayer Identification Numbers (TINs) in bulk before submitting documents to LHDN. This is useful for catching invalid TINs early — before they cause rejections in Batch Pool.

**When to use:**
- Before a large batch submission — validate all buyer/supplier TINs upfront
- When onboarding new customers or suppliers — verify their TINs are LHDN-registered
- After receiving a batch of rejections due to TIN errors — identify which entities have invalid TINs

**How it works:**
1. Go to **Tools → Bulk TIN Validation**
2. Upload a file containing the TINs to validate
3. The system checks each TIN against LHDN's registered records
4. Review the results — valid TINs are confirmed, invalid ones are flagged
5. Correct flagged TINs in the originating records before submitting documents

{{< callout type="tip" >}}
**Run Bulk TIN Validation before every large batch submission.** TIN errors are the most common cause of rejection and are entirely preventable with an upfront check.
{{< /callout >}}

---

## 10. Configuration & Settings

### Company & LHDN Setup

Before submitting any documents, confirm these are configured correctly by your system administrator:

**LHDN API Credentials:**
- MyInvois client ID and client secret
- Required for all API submissions to LHDN

**Company Information:**
- Taxpayer Identification Number (TIN) — must exactly match LHDN records
- Business Registration Number (BRN)
- SST Registration Number (if applicable)
- Company address as registered with LHDN

**Document Type Mappings:**
- Maps internal document types to LHDN document type codes
- Examples: Sales Invoice → INV, Credit Note → CN, Debit Note → DN

### Submission Settings

| Setting | Purpose | Recommended |
|---------|---------|-------------|
| **Auto-Submit** | Automatically submit on document approval | Configure based on team workflow |
| **Batch Size** | Max documents per batch | 50–100 per batch |
| **Retry on Error** | Auto-retry on API timeout | Enable |
| **Rejection Notification** | Email alert on LHDN rejection | Enable for finance team |

### Connectivity Check

Always verify your LHDN API connection before running bulk submissions:

1. Go to **Settings → LHDN Connectivity**
2. Click **Test Connection**
3. Confirm status: **Connected**
4. If failed: check API credentials, then check network access

{{< callout type="warning" >}}
**Before any bulk submission**: Run a connectivity check first. Submitting during an API outage produces **Error** status documents that require manual retry — they do not auto-recover.
{{< /callout >}}

---

## 11. Integration Points

### With My Peppol Admin Applet

Validated e-invoices automatically become eligible for Peppol network distribution:

```
My E-Invoice Admin → LHDN validates → Status: Submitted
    ↓
My Peppol Admin → Waiting Queue → Peppol distribution to trading partner
```

The same **Process ID** is shared across both applets, enabling end-to-end tracking from LHDN submission through to Peppol delivery.

### With Sales & Purchase Applets

Documents originating in Sales or Purchase applets flow into this applet automatically:

- The original document number is retained for cross-reference
- Submission status reflects back on the originating document
- No manual data transfer — the integration handles it end to end

### With Organisation Applet

Company details (TIN, BRN, address) configured in the Organisation Applet are used in every e-invoice submission:

- Keep Organisation Applet details in sync with LHDN's registered records
- Any mismatch between Organisation Applet data and LHDN records causes rejections

---

## 12. Common Issues

**Document rejected immediately after submission?**
- Open Batch Pool → read the exact LHDN error code and description
- Most common: invalid TIN format, missing BRN, wrong tax code, line total mismatch
- Fix the specific field flagged — not a general edit — and resubmit

**Submission stuck in Validation Queue beyond 30 minutes?**
- Go to Settings → LHDN Connectivity → Test Connection
- If disconnected: check API credentials and network access
- If connected: LHDN may be experiencing high load — wait and monitor
- If stuck beyond 2 hours: contact support with the Process ID

**Cannot find a document in Submission History?**
- Widen the date range filter — default may be set to today only
- Search by Process ID if you have it
- If the document never appears: check Posting Queue — it may not have been submitted

**Cancellation request rejected by LHDN?**
- Most likely cause: outside the cancellation window
- Check LHDN MyInvois guidelines for current cancellation eligibility period
- If within the window: review the rejection reason code provided by LHDN

**Monthly Report shows discrepancies?**
- Check Batch Pool for unresolved rejected documents in that period
- Verify no submissions failed at the Error status (before reaching LHDN)
- Re-submit any missing documents and re-run the report

**Email notifications not being received?**
- Check Email Dashboard — confirm the notification was actually sent
- If sent but not received: check spam folders and email server allowlists
- If not sent: verify notification settings in Settings → Email Configuration

---

## 13. Quick Reference

### Menu Structure

| Menu Item | Sub-menu | Purpose |
|-----------|----------|---------|
| **Master List** | — | All documents across all statuses |
| **Posting Queue** | — | Stage and review documents before submission |
| **Batch Pool** | — | Bulk submission and inline rejection resolution |
| **Individual Pool** | — | Individually submitted documents |
| **Single General Pool** | — | Single general-type submissions |
| **Internal Submission** | To IRB E-Invoice | Outgoing submissions to LHDN IRB portal |
| | Individual Submission | Documents submitted individually |
| | Consolidated Submission | Batch submission records |
| | Validation Queue | Documents awaiting LHDN validation response |
| | Portal Request | All portal-level request logs |
| | Submission History | Full compliance archive |
| | Email Dashboard | Notification audit log |
| **External Reception** | Queue | Incoming e-invoices awaiting processing |
| | From IRB E-Invoice | E-invoices received from LHDN IRB |
| **Reconciliation (Purchase)** | PD Matching Q. | Purchase docs awaiting matching |
| | Inc. E-Invoice Match Q. | Incoming e-invoices for matching |
| | Matched History | Successfully matched purchase pairs |
| | Inc. Unmtch. E-Inv. Hist. | Unmatched incoming e-invoices |
| | Unmatched PD Hist. | Unmatched purchase documents |
| **Reconciliation (Sales)** | SD Matching Q. | Sales docs awaiting matching |
| | Inc. Ecom Matcd. Q. | Incoming e-commerce invoices for matching |
| | Matched History | Successfully matched sales pairs |
| | Inc. Ecom Unmatcd. Hist. | Unmatched e-commerce invoices |
| | SD Unmatcd. Hist. | Unmatched sales documents |
| **Cancellation** | Rejection Requests | Cancellation requests submitted to LHDN |
| | Cancellation Queue | Documents staged for cancellation |
| **Monthly Report** | Discrepancies Report | Records vs LHDN discrepancy report |
| | History | Past monthly report archive |
| **Tools** | Bulk TIN Validation | Validate TINs in bulk before submission |

### Critical Terms

**Process ID** — Unique identifier assigned by LHDN per submission. Used to track a document across My E-Invoice Admin, My Peppol Admin, and LHDN's own MyInvois portal.

**TIN** — Taxpayer Identification Number. Mandatory on every submission. Must match LHDN's registered records exactly — even a formatting difference causes rejection.

**Submitted** — LHDN has validated and accepted the document. It is a legally recognised e-invoice.

**Rejected** — LHDN validation failed. Must be corrected and resubmitted before it has any legal standing.

**Cancellation Window** — The period within which LHDN allows a validated invoice to be cancelled. Requests outside this window are automatically rejected by LHDN.

### When to Contact Support

- Documents stuck in Validation Queue beyond 2 hours with API showing Connected
- Batch Pool rejection errors with blank or unreadable error descriptions
- Cancellation denied with no clear reason code
- Process ID mismatch between My E-Invoice Admin and My Peppol Admin records
- LHDN API credentials need rotation or replacement

---

## FAQ

**Q: What is the difference between Batch Pool, Individual Pool, and Single General Pool?**
A: They track documents submitted via different methods. **Batch Pool** is for bulk submissions (multiple documents at once from Posting Queue). **Individual Pool** is for documents submitted one at a time urgently outside a batch cycle. **Single General Pool** tracks single-document general submissions that are not part of a named batch.

**Q: A document shows Submitted in Batch Pool but I can't find it in Submission History — where is it?**
A: Submission History has a date filter that defaults to a recent range. Widen the date range or search by Process ID. If it still doesn't appear, the document may still be transitioning — wait a few minutes and refresh.

**Q: Can I submit an invoice to LHDN directly without going through the Posting Queue?**
A: Posting Queue is the standard staging step, but Individual Pool and Single General Pool support direct individual submissions. Contact your system administrator if you need to bypass the batch cycle for an urgent document.

**Q: My document was rejected for "Invalid TIN" but the TIN looks correct — why?**
A: LHDN validates TIN against their own database. Common causes of mismatch: extra spaces in the TIN field, incorrect format (prefix/suffix), or the TIN belongs to a different entity. Check the exact format registered in the Organisation Applet against LHDN's records.

**Q: What happens to a rejected document — does the customer receive it?**
A: No. A rejected document has no legal standing and should not be issued to the customer. Correct it, resubmit, and wait for a **Submitted** status before treating it as a valid tax document.

**Q: Can I cancel an invoice after I have already sent it to the customer?**
A: Yes, but the cancellation must go through LHDN and be approved. Once LHDN approves, notify your customer separately that the document is void and issue a corrected replacement invoice.

**Q: How do I know if a cancelled document is still visible for audits?**
A: Cancelled documents remain permanently in Submission History with **Cancelled** status. They are never deleted — this is intentional for audit trail purposes.

**Q: The Email Dashboard shows a rejection notification was sent, but my colleague says they didn't receive it — what do I do?**
A: First confirm the recipient email address in the Email Dashboard is correct. If correct, ask the recipient to check spam/junk folders. If still missing, check whether your email server has allowlisted the sending domain. Update notification settings in Settings → Email Configuration if the address is wrong.

{{< callout type="info" >}}
**Need Help?** Contact your system administrator for LHDN API and connectivity issues. For document-specific queries, provide the **Process ID** and document number to support for the fastest resolution.
{{< /callout >}}
