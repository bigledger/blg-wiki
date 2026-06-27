---
title: "Reports & Analytics"
description: "Practical scenario guide and reporting matrix for tax authority submission logs, clearance rejection tracking, and audit compliance."
weight: 45
bookCollapseSection: false
---

The E-Invoice & PEPPOL Module provides audit and compliance analytics for tax managers, accounts receivable supervisors, and financial controllers to verify clearance statuses, audit submission queues, and monitor tax liability accuracy.

## Reporting Scenario Decision Matrix ("Which Report to Use When")

Select the appropriate report based on your specific operational or business decision scenario:

| Business Scenario / Question | Recommended Report | Primary Applet | Key Metrics & Decision Value | Actionable Business Outcome |
|------------------------------|--------------------|----------------|------------------------------|-----------------------------|
| **"Which commercial invoices were rejected by the tax authority and require TIN/BRN correction?"** | Submission Rejection & Exception Log | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) | Submission timestamp, invoice ID, error rejection code, error description. | Triggers immediate master data correction and invoice resubmission within statutory windows. |
| **"What is our total validated tax clearance volume and Output SST tax liability for the month?"** | Cleared E-Invoice Tax Audit Summary | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) | Cleared invoice count, gross invoice total, tax amount, clearance UUID count. | Reconciles tax portal totals against General Ledger Output Tax liability ledgers. |
| **"What foreign service supplier invoices require self-billed e-invoice submission?"** | Pending Self-Billed Import Audit | [MY E-Invoice for Customer & Supplier Applet](/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet/) | Foreign AP invoice ID, vendor TIN, self-billing status, submission deadline. | Ensures timely generation of self-billed e-invoices to protect input tax deductions. |
| **"What cross-border B2B documents were transmitted via the global PEPPOL access point?"** | PEPPOL Network Exchange Log | [MY PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) | PEPPOL Participant ID, UBL document type, dispatch timestamp, transmission status. | Verifies global B2B delivery confirmation with international trading partners. |

---

## Detailed Operational Reporting Guides

### 1. Daily Submission Queue Audit
- **Purpose:** Tracks real-time status of all invoices transmitted to government tax APIs (Pending vs Cleared vs Rejected).
- **Key Parameters:** Filter by Submission Status Code, Date Range, and Branch Entity.
- **Operational Utility:** Prevents uncleared invoices from being issued to customers and guarantees tax compliance.

### 2. Statutory Audit Archival Export
- **Purpose:** Generates structured compliance data packages containing cleared JSON payloads and UUID stamps for tax auditors.
- **Key Parameters:** Filter by Tax Year, Financial Quarter, and Document Type (Invoice vs Credit Note vs Self-Billed).
- **Operational Utility:** Streamlines official tax audits and eliminates manual paper compilation.
