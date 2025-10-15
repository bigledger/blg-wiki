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
# 1.0 Introduction

## 1.1 Purpose and Scope

The effective management of e-invoices is a strategic imperative for maintaining compliance with the Lembaga Hasil Dalam Negeri (LHDN) and ensuring operational efficiency. This Standard Operating Procedure (SOP) provides a comprehensive guide to using the My E-Invoice Admin Applet, the central tool for this process.

The My E-Invoice Admin Applet is designed to manage both individual and consolidated transaction submissions to LHDN. It serves as the primary interface for users to manage, review, and cancel their e-invoice submissions, ensuring that all activities adhere to LHDN requirements.

The applet is designed to handle a variety of transaction documents, including:

* Sales Invoices
* Credit Notes
* Debit Notes
* Posted Cash Bills
* Sales Refunds
* Self-Billed Invoices

This SOP outlines the complete, end-to-end e-invoice lifecycle within the applet. It covers procedures from the initial posting of a transaction and pre-submission validation to the final LHDN submission, post-submission review, and the necessary steps for handling rejections and cancellations.

## 1.2 Key Process Stages Overview

The e-invoice lifecycle within the applet is structured across several distinct stages, each with a specific function. Understanding this workflow is critical for effective management.

1.  **Pre-Submission Queues: Posting Queue & Batch Pool** This initial stage serves as the collection and validation point for all transactions before they are prepared for LHDN submission.
2.  **LHDN Submission: Internal Submission Queue & To IRB E-Invoice** This stage acts as the final gateway where transactions are formally transmitted to LHDN and their immediate status can be monitored.
3.  **Post-Submission History: Internal Submission History** This is the permanent archive where all successfully validated e-invoices are stored for review and record-keeping.
4.  **Cancellation & Rejection: Rejection Request & Cancellation Queue** This final stage manages the time-sensitive process of requesting, approving, and troubleshooting e-invoice rejections and cancellations.

# 2.0 Pre-Submission Transaction Management

## 2.1 Stage 1: The Posting Queue - The Initial Checkpoint

The Posting Queue is the first critical control point where all finalized transactions from various source applets (e.g., p in uplet, pulse casell) initially appear. Its primary function is to serve as a checkpoint to verify data integrity and ensure all mandatory fields are present before any submission attempts are made to LHDN.

The core functions and procedures within the Posting Queue are as follows:

1.  **Transaction Aggregation**: It acts as the initial collection point for all finalized documents, consolidating them into a single, manageable list.
2.  **Verification**: This queue is a checkpoint where the system verifies that mandatory fields required for LHDN submission have been populated.
3.  **Manual Submission**: A user can manually select an individual transaction from the list and submit it directly to the Internal Submission Queue for immediate processing or move it to the Batch Pool for consolidated submission.
4.  **Automated Submission**: The system can be configured to automatically process and submit valid transactions from this queue, typically every 15 to 20 minutes.
5.  **Reviewing Details**: By clicking on any transaction, a user can review comprehensive details, including the core document information, account details (the buyer), and all associated line items.

Transactions that are designated for consolidated submission or that fail initial validation checks are systematically moved to the Batch Pool for further management.

## 2.2 Stage 2: The Batch Pool - Managing Consolidated & Incomplete Transactions

The Batch Pool is the primary staging area for two key scenarios: managing documents intended for a planned consolidated submission and holding transactions that have failed initial validation checks due to missing information.

### Consolidated Submissions

The Batch Pool stores documents that are designated for consolidated e-invoice submission. These transactions must be submitted to LHDN before the 7th of the following month. If a customer whose transaction is in the Batch Pool requests an individual e-invoice, that specific transaction can be removed from the pool and processed for immediate individual submission.

### Error Handling

The Batch Pool also holds documents from the Posting Queue that were found to be missing mandatory fields. A user can easily identify and correct these errors by following this procedure:

1.  Click on a document within the Batch Pool to open its details.
2.  Scroll to the **Validation Error** section at the bottom of the page.
3.  The system will display a specific error message indicating the missing information (e.g., "missing some item classification item text type").
4.  The user must navigate back to the original source document, update it with the correct information based on the error message, and then resubmit the transaction from the Batch Pool.

Once a transaction is validated and ready for LHDN submission, whether individually or as part of a batch, it proceeds to the Internal Submission Queue.

# 3.0 LHDN Submission and Verification Process

## 3.1 Stage 3: The Internal Submission Queue - The Final Gateway to LHDN

The Internal Submission Queue is the final, decisive stage before a transaction is formally transmitted to the LHDN/IRB system. This queue manages the direct pipeline of communication for both manual and automated submissions.

The operational mechanics of this queue are as follows:

*   **Submission Methods**: Transactions arrive here either through manual submission by a user or via the system's automated submission process.
*   **Successful Submission**: Upon a successful submission to LHDN, the transaction is immediately removed from this queue. It is then transferred to the **Internal Submission History** for permanent record-keeping.
*   **Failed Submission**: If LHDN rejects a submission, the transaction will remain listed in this queue with a status of "submission failed". To resolve this, the user must click into the transaction and navigate to the **from lhdn** tab. This tab displays the direct error message from LHDN (e.g., "CD is required," which indicates the buyer's city is missing), providing the exact reason for the failure so corrective action can be taken on the source document.

All transactions that are successfully submitted or are in the process of being submitted can be actively monitored in the "To IRB E-Invoice" menu.

## 3.2 Stage 4: Monitoring in the "To IRB E-Invoice" Menu

The "To IRB E-Invoice" menu serves as the central dashboard for monitoring active submissions and performing immediate post-submission actions. This is particularly important for actions that must be taken within the critical 72-hour window following LHDN validation.

| Feature | Procedural Description |
| :--- | :--- |
| **View Submission Status** | Users can view the real-time status of transactions. `in queue` indicates the transaction is in the internal queue but not yet sent to LHDN, while `submitted` confirms it has been sent. |
| **Send Buyer Notification** | To email the e-invoice to the buyer, a user clicks into a transaction, navigates to the notification section, and clicks **send**. |
| **Export E-Invoice** | A user can download a PDF copy of the official e-invoice at any time by clicking the **export** button within the transaction details. |
| **Request Rejection** | Users can initiate a rejection request directly from this screen. However, this option is only available for transactions that have been successfully validated by LHDN, not for those still `in queue`. |

Once an e-invoice is fully processed and validated by LHDN, its permanent and official record is stored in the **Internal Submission History**.

## 3.3 Stage 5: Reviewing in the Internal Submission History

The **Internal Submission History** is the official, permanent archive for all transactions that have been successfully submitted to and validated by LHDN. This menu provides the final, authoritative status of any e-invoice.

Users can verify the final validation status by observing the following indicators:

*   **Document Accepted**: This is an initial status indicating that the submission has been accepted by the system but is pending full validation by LHDN.
*   **Document is Valid**: This status provides definitive confirmation that LHDN has fully validated the e-invoice. By clicking into the transaction and viewing the **from lhdn** tab, the user can review the detailed validation response directly from LHDN.

While this archive marks the successful completion of a submission, procedures exist for correcting or canceling these validated documents when necessary.

# 4.0 Post-Validation: Rejection and Cancellation Procedures

## 4.1 Initiating a Rejection Request

The process for rejecting or canceling a validated e-invoice is highly time-sensitive and critical. All actions related to rejection and cancellation are governed by a strict LHDN-mandated timeframe and must be managed with precision.

The core rules and procedures for initiating a rejection are as follows:

1.  **The 72-Hour Rule**: A rejection request must be initiated within 72 hours of the e-invoice's validation by LHDN. The system will automatically block any cancellation attempts made after this window has expired.
2.  **Request Origin**: Requests can be initiated by either internal staff or customers (via the customer portal). All incoming requests appear in the **Rejection Request** menu, located under the **Cancellation** tab.
3.  **Applicable Documents**: Cancellation can be requested for Sales Invoices, Credit Notes, Debit Notes, and Sales Credit Notes. It is important to note that self-billed invoices (self purchase in) and consolidated e-invoices cannot be canceled through this process.
4.  **Reviewing a Request**: A user can click on any request to view its details, the stated reason for the cancellation, and a timer displaying the remaining time available to process it (e.g., `remaining hour for the cancellation: 49 hours`).

## 4.2 Processing a Rejection Request and Understanding Logic

It is the user's responsibility to review and act on all incoming rejection requests promptly to ensure they are processed within the mandatory 72-hour window. When reviewing a request, a user has three primary actions: **approve**, **reject**, or place the request **unhold**.

If a request is approved, the user must select one of three distinct **Processing Logic** options, each with a different outcome for the e-invoice and the original source document.

1.  **Regenerate new e-invoice**
    *   **Action**: The system cancels the current e-invoice with LHDN and automatically creates a new one for resubmission.
    *   **Impact**: The original source document is not modified. This is ideal for correcting minor errors on the e-invoice itself.
2.  **Void original document**
    *   **Action**: The system cancels the current e-invoice with LHDN and voids the original source document (e.g., the sales invoice in the accounting system).
    *   **Impact**: This is an irreversible action. The user must create an entirely new source document and restart the e-invoice submission process from the beginning.
3.  **New reversal document**
    *   **Action**: This option does not cancel the current e-invoice. Instead, the system automatically creates and submits a new, corresponding reversal document to neutralize the original.
    *   **Impact**: The system generates the reversal document based on the following logic:
        *   Sales Invoice creates a Sales Credit Note.
        *   Debit Note creates a Sales Credit Note.
        *   Credit Note creates a Sales Debit Note.
        *   Sales Refund Note creates a Receipt Voucher.
        *   Cash Bill creates a Sales Refund.

Any failures that occur during the cancellation communication with LHDN are tracked in the **Cancellation Queue** for troubleshooting.

# 5.0 Troubleshooting Common Failures

## 5.1 Resolving LHDN Submission Failures

Submission failures are a normal part of the e-invoicing process. The system is designed to capture direct feedback from LHDN, enabling users to quickly diagnose and resolve issues.

Follow this two-step procedure to handle a submission failure:

1.  **Identify the Failure**: Navigate to the **Internal Submission Queue**. Locate the transaction marked with a status of `submission failed` and click into it to view the details.
2.  **Diagnose and Correct**: Go to the final tab labeled **from lhdn**. Read the specific error message provided by LHDN (e.g., "CD is required," which means the buyer's city is missing). The user must then correct the data in the original source document and resubmit the transaction.
