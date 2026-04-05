---
title: "My E-Invoice for Customer & Supplier Applet"
description: "Unified management hub for e-invoice submissions, reconciliation, and tax compliance across both sales and purchase workflows"
tags:
- e-invoice
- tax-compliance
- finance-operations
- reconciliation
- lhdn-integration
weight: 10
---

{{< callout type="warning" >}}
**Daily cashier report applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **My E-Invoice for Customer & Supplier Applet** is the centralized nerve center for an organization's electronic invoicing operations. It provides a unified interface to manage e-invoice lifecycles for both **Sales (Customer)** and **Purchase (Supplier)** transactions. By integrating directly with tax authority platforms (such as LHDN MyInvois), the applet automates the validation, submission, and reconciliation of financial documents, ensuring seamless statutory compliance.

{{< callout type="info" >}}
**Core Concept**: This applet acts as the final "Compliance Gateway," where internal financial documents are prepared, validated against tax rules, and formally submitted for government approval.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Tax Compliance Officers:**
- Centralized visibility into the compliance status of all company transactions
- Simplified management of batch and individual submission pools
- Efficient handling of document cancellations and rejections within legal timelines
- Direct access to monthly compliance reports for tax filing

**Accounts Receivable & Payable Teams:**
- Accelerated validation and submission of sales invoices to ensure faster customer payment
- Seamless reconciliation of supplier invoices against internal purchase records
- Real-time tracking of e-invoice statuses to resolve disputes quickly
- Automated notification of unsuccessful submissions for immediate correction

**Finance Managers & Controllers:**
- Reduced risk of non-compliance penalties through automated validation checks
- Comprehensive audit trails for every e-invoice event and interaction
- Improved accuracy in intercompany and external financial reconciliation
- Data-driven insights into e-invoice processing volumes and success rates

### What Problems Does This Solve?

**The E-Invoice Fragmentation Problem:**

Implementing e-invoicing often introduces complex administrative overhead, especially when managing both sales and purchases:
- Fragmented workflows where sales and purchase e-invoices are handled in different systems
- Difficulty in monitoring the real-time status of thousands of high-volume submissions
- Manual reconciliation between internal accounting entries and external tax authority validations
- High risk of missing short submission or cancellation windows required by law
- Lack of centralized reporting for month-end tax audits

**The Unified E-Invoice Solution:**

- **Dual-Side Hub** - Manage both outgoing (Sales) and incoming (Purchase) e-invoices in a single dashboard
- **Tiered Submission Management** - Organize high-volume documents into batches or focus on individual urgent pool submissions
- **Automated Posting Queue** - Seamlessly pull data from core sales and purchase modules for compliance processing
- **Intelligent Status Tracking** - Real-time monitoring of document states from "Pending" to "Valid", "Cancelled", or "Rejected"
- **Strategic Reconciliation Engine** - Built-in tools for matching internal records with tax authority data on both the sales and purchase sides

## Key Features Overview

{{< cards >}}
  {{< card title="Submission Pools" subtitle="Manage individual and batch submissions for optimal processing" link="#submission-management" >}}

  {{< card title="Sales Reconciliation" subtitle="Match outgoing sales invoices with tax authority validations" link="#sales-side-reconciliation" >}}

  {{< card title="Purchase Reconciliation" subtitle="Validate incoming supplier invoices for tax compliance" link="#purchase-side-reconciliation" >}}

  {{< card title="Posting Queue" subtitle="Monitor and prepare documents for e-invoice finalization" link="#posting-queue" >}}

  {{< card title="Cancellation Control" subtitle="Process document reversals within statutory timelines" link="#cancellation-management" >}}

  {{< card title="Monthly Reporting" subtitle="Generate comprehensive summaries for tax audits and filing" link="#reporting-and-analytics" >}}
{{< /cards >}}

## Key Concepts

### Understanding the E-Invoice Lifecycle

The applet manages the strategic movement of financial documents through several critical stages:

| Stage | Action | Impact |
|-------|--------|--------|
| **Posting Queue** | Document created in Sales/Purchase modules. | Applet pulls data and checks for missing e-invoice info. |
| **Submission Pool** | Document selected for validation. | Document is queued for individual or batch submission to LHDN. |
| **Validation** | Interaction with Tax Authority. | Status updated to **Valid** or **Rejected** (with reason codes). |
| **Reconciliation** | Post-validation check. | Internal records are formally mapped to the validated e-invoice ID. |

{{< callout type="tip" >}}
**Real-World Example**: A finance officer reviews the **Individual Pool** and finds 50 pending sales invoices. They trigger a bulk submission; the system communicates with LHDN, receives the **UUID** and **QR code** for each, and updates the **Sales Reconciliation** dashboard to "Valid".
{{< /callout >}}

### Unified Compliance Architecture

The system bridges internal systems with external regulatory bodies:

```
Internal ERP Modules (Sales/Purchase)
│
├── My E-Invoice Applet (Queue & Pool) ──→ The compliance gateway
│   │
│   └── Tax Authority API (LHDN/MyInvois) ──→ External validation
│       │
│       └── Reconciliation Dashboard ──→ Final financial confirmation
```

---

## Quick Start Guide

### For AR Staff: Processing Sales E-Invoices

**Goal:** Submit and validate outgoing invoices in 4 steps.

1. **Monitor Queue**: Go to the **Posting Queue** to view new sales invoices ready for processing.
2. **Assign to Pool**: select the documents and move them to the **Individual Pool** (for urgent) or **Batch Pool** (for bulk).
3. **Trigger Submission**: Initiate the submission process. The system will alert you if any data (like customer Tin number) is missing.
4. **Confirm Status**: Check the **Reconciliation Sales Side** view to ensure the documents are marked as "Valid".

---

### For AP Staff: Validating Supplier Invoices

**Goal:** Ensure incoming supplier invoices meet compliance standards.

1. **Check External Reception**: Go to the **External Reception** or **Purchase Reconciliation** tab.
2. **Match Records**: Match the incoming e-invoice data from the supplier with your internal Purchase Order or GRN.
3. **Verify Validity**: confirm the tax authority has validated the supplier's submission.
4. **Finalize**: Update the internal record with the verified e-invoice UUID for audit purposes.

---

## Configuration & Settings

Fine-tune the compliance environment through the **Settings** hub:

- **Submission Logic**: Configure batch sizes and retry intervals for high-volume periods.
- **Branch Mapping**: Link different physical branches to their specific tax authority credentials.
- **Notification Alerts**: Set up email or system alerts for document rejections or failed submissions.
- **Personalization**: Customize the pooling and reconciliation views to highlight high-value documents.

---

## FAQ

**Q: Can I cancel an e-invoice after it has been marked as "Valid"?**
A: Yes, but it must be done within the statutory cancellation window (e.g., 72 hours). Use the **Cancellation** tab to initiate this request.

**Q: What happens if a submission is rejected by the tax authority?**
A: The document will appear in the **Rejection** queue with a specific error code. Correct the missing information in the master data (e.g., Customer Address) and resubmit from the pool.

**Q: Does this applet handle both B2B and B2C transactions?**
A: Yes. The system can be configured to manage individual B2B submissions as well as consolidated B2C reporting requirements.

**Q: Can I see the e-invoice QR code from this applet?**
A: Once a document is successfully validated, the system retrieves the official QR code and UUID, which can then be viewed or printed via the integration with your standard invoice templates.

---
