---
title: "My E-invoice Admin Applet"
description: "Electronic invoice creation and formatting for BigLedger compliance operations"
tags:
- einvoice-module
- electronic-invoicing
- compliance
- digital-transformation
- regulatory
weight: 400
---

## Introduction

### Purpose and Scope

The effective management of e-invoices is a strategic imperative for maintaining compliance with the Lembaga Hasil Dalam Negeri (LHDN) and ensuring operational efficiency. This guide explains how to use the **My E-Invoice Admin Applet**, the central tool for this process.

The My E-Invoice Admin Applet is designed to manage both individual and consolidated transaction submissions to LHDN. It serves as the primary interface for users to manage, review, and cancel their e-invoice submissions, ensuring that all activities adhere to LHDN requirements.

The applet handles a variety of transaction documents, including:

- Sales Invoices
- Credit Notes
- Debit Notes
- Posted Cash Bills
- Sales Refunds
- Self-Billed Invoices

This guide outlines the complete, end-to-end e-invoice lifecycle within the applet, from initial posting and validation to LHDN submission, review, and handling of rejections and cancellations.

### Key Process Stages Overview

The e-invoice lifecycle is structured across several distinct stages. Understanding this workflow is critical for effective management.

{{< steps >}}
### Pre-Submission
**Posting Queue & Batch Pool**

The initial collection and validation point for all transactions before they are prepared for LHDN submission.
---
### LHDN Submission
**Internal Submission Queue & To IRB E-Invoice**

The final gateway where transactions are formally transmitted to LHDN and their immediate status can be monitored.
---
### Post-Submission
**Internal Submission History**

The permanent archive where all successfully validated e-invoices are stored for review and record-keeping.
---
### Rejection & Cancellation
**Rejection Request & Cancellation Queue**

Manages the time-sensitive process of requesting, approving, and troubleshooting e-invoice rejections and cancellations.
{{< /steps >}}

## Pre-Submission Transaction Management

{{< tabs items="Posting Queue, Batch Pool" >}}
{{< tab >}}
### The Posting Queue - The Initial Checkpoint

The **Posting Queue** is the first critical control point where all finalized transactions from various source applets (e.g., POS applet, sales applet) initially appear. Its primary function is to verify data integrity and ensure all mandatory fields are present before submission to LHDN.

**Core Functions:**

- **Transaction Aggregation**: Consolidates all finalized documents into a single, manageable list.
- **Verification**: The system verifies that mandatory fields required for LHDN submission have been populated.
- **Manual Submission**: Users can manually select a transaction and submit it directly to the Internal Submission Queue or move it to the Batch Pool.
- **Automated Submission**: The system can be configured to automatically process and submit valid transactions, typically every 15 to 20 minutes.
- **Reviewing Details**: Click on any transaction to review comprehensive details, including the core document information, buyer details, and all associated line items.

Transactions designated for consolidated submission or that fail initial validation are moved to the **Batch Pool**.
{{< /tab >}}
{{< tab >}}
### The Batch Pool - Managing Consolidated & Incomplete Transactions

The **Batch Pool** is the primary staging area for two key scenarios:
1.  Managing documents for a planned **consolidated submission**.
2.  Holding transactions that have **failed initial validation** due to missing information.

#### Consolidated Submissions

The Batch Pool stores documents designated for consolidated e-invoice submission. These must be submitted to LHDN before the 7th of the following month. If a customer requests an individual e-invoice, that transaction can be removed from the pool and processed for immediate submission.

#### Error Handling

The Batch Pool also holds documents with missing mandatory fields. To correct these errors:

1.  Click on a document in the Batch Pool to open its details.
2.  Scroll to the **Validation Error** section at the bottom.
3.  The system will display a specific error message (e.g., "missing some item classification item text type").
4.  Navigate back to the original source document, update it with the correct information, and then resubmit the transaction from the Batch Pool.

Once a transaction is validated, it proceeds to the **Internal Submission Queue**.
{{< /tab >}}
{{< /tabs >}}

## LHDN Submission and Verification

{{< tabs items="Submission Queue, Monitoring, History" >}}
{{< tab >}}
### The Internal Submission Queue - The Final Gateway to LHDN

The **Internal Submission Queue** is the final stage before a transaction is transmitted to the LHDN/IRB system.

-   **Submission Methods**: Transactions arrive here either through manual submission or the system's automated process.
-   **Successful Submission**: Upon success, the transaction is removed from this queue and transferred to the **Internal Submission History**.
-   **Failed Submission**: If LHDN rejects a submission, the transaction remains in this queue with a "submission failed" status. To resolve this, click the transaction and navigate to the **from lhdn** tab to see the specific error message from LHDN (e.g., "CD is required," which indicates the buyer's city is missing).

All transactions being submitted can be monitored in the **To IRB E-Invoice** menu.
{{< /tab >}}
{{< tab >}}
### Monitoring in the "To IRB E-Invoice" Menu

The **To IRB E-Invoice** menu is the central dashboard for monitoring active submissions and performing immediate post-submission actions, especially within the critical **72-hour window** following LHDN validation.

{{< cards >}}
  {{< card title="View Submission Status" >}}
    Users can view the real-time status. `in queue` indicates the transaction is not yet sent to LHDN, while `submitted` confirms it has been sent.
  {{< /card >}}
  {{< card title="Send Buyer Notification" >}}
    To email the e-invoice to the buyer, click into a transaction, navigate to the notification section, and click **send**.
  {{< /card >}}
  {{< card title="Export E-Invoice" >}}
    Download a PDF copy of the official e-invoice at any time by clicking the **export** button.
  {{< /card >}}
  {{< card title="Request Rejection" >}}
    Initiate a rejection request directly from this screen. This is only available for successfully validated e-invoices.
  {{< /card >}}
{{< /cards >}}
{{< /tab >}}
{{< tab >}}
### Reviewing in the Internal Submission History

The **Internal Submission History** is the official, permanent archive for all transactions successfully submitted to and validated by LHDN.

Users can verify the final validation status:

-   **Document Accepted**: Initial status indicating the submission is accepted by the system, pending full LHDN validation.
-   **Document is Valid**: Definitive confirmation that LHDN has validated the e-invoice. Click the transaction and view the **from lhdn** tab for the detailed validation response.
{{< /tab >}}
{{< /tabs >}}

## Post-Validation: Rejection and Cancellation

### Initiating a Rejection Request

The process for rejecting or canceling a validated e-invoice is highly time-sensitive.

{{< callout type="warning" >}}
**The 72-Hour Rule**
A rejection request must be initiated within **72 hours** of the e-invoice's validation by LHDN. The system automatically blocks any cancellation attempts after this window has expired.
{{< /callout >}}

**Key Rules:**

1.  **Request Origin**: Requests can be initiated by internal staff or customers (via the customer portal). All requests appear in the **Rejection Request** menu under the **Cancellation** tab.
2.  **Applicable Documents**: Cancellation can be requested for Sales Invoices, Credit Notes, Debit Notes, and Sales Credit Notes. Self-billed and consolidated e-invoices cannot be canceled this way.
3.  **Reviewing a Request**: Click on any request to view its details, the reason for cancellation, and a timer showing the remaining time to process it.

### Processing a Rejection Request

It is the user's responsibility to act on all rejection requests within the 72-hour window. When reviewing a request, a user can **approve**, **reject**, or place the request **on hold**.

If approved, select one of three **Processing Logic** options:

{{< cards >}}
  {{< card title="1. Regenerate new e-invoice" >}}
    **Action**: Cancels the current e-invoice with LHDN and automatically creates a new one for resubmission.
    **Impact**: The original source document is not modified. Ideal for correcting minor errors.
  {{< /card >}}
  {{< card title="2. Void original document" >}}
    **Action**: Cancels the e-invoice and voids the original source document.
    **Impact**: **Irreversible**. A new source document must be created to restart the process.
  {{< /card >}}
  {{< card title="3. New reversal document" >}}
    **Action**: Does not cancel the current e-invoice. Instead, it creates and submits a corresponding reversal document to neutralize the original.
    **Impact**: The system generates a reversal document (e.g., a Sales Invoice creates a Sales Credit Note).
  {{< /card >}}
{{< /cards >}}

Failures during cancellation are tracked in the **Cancellation Queue**.

## Troubleshooting Common Failures

### Resolving LHDN Submission Failures

Submission failures are a normal part of the process. The system provides direct feedback from LHDN to help resolve issues quickly.

1.  **Identify the Failure**: Navigate to the **Internal Submission Queue** and find the transaction marked `submission failed`.
2.  **Diagnose and Correct**: Click the transaction and go to the **from lhdn** tab. Read the specific error message from LHDN (e.g., "CD is required," means the buyer's city is missing). Correct the data in the original source document and resubmit.