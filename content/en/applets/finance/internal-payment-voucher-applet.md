---
title: "Payment Voucher (Internal) Applet"
description: "Comprehensive internal payment voucher management system for expense settlement, contra handling, adjustments, and audit traceability"
tags:
- payment-voucher
- internal-payment
- accounts-payable
- settlement
- contra
- intercompany
- file-import
- file-export
weight: 20
---

## Purpose and Overview

The **Payment Voucher (Internal) Applet** is a structured tool for creating, reviewing, finalizing, and tracing internal payment vouchers. It combines expense entry, payment method selection, settlement control, and posting visibility in one workflow.

{{< callout type="info" >}}
**Core Concept**: The applet links **who** is paid (entity or supplier) to **what** is paid (expense lines) and **how** it is settled (payment lines, contra, and adjustments).
{{< /callout >}}

### Who Benefits from This Applet?

**Accounts Payable and Finance Executives:**
- Faster voucher creation and updates
- Clear visibility of expense, payment, and balance position
- Controlled actions such as **Final**, **Discard**, and **Void**

**Managers and Controllers:**
- Easier document review before finalization
- Better control of settlement and correction flows
- Stronger posting and audit traceability

**Treasury and Payment Operations:**
- Structured payment lines for payment execution
- Export-ready payment files for bank processing
- Better control of payment timing and method

**Auditors and Compliance Teams:**
- Full history of voucher status and changes
- Traceable links to posting impact
- Supporting attachments and document relationships

### What Problems Does This Solve?

**The Manual Payment Voucher Problem:**

Manual processes often cause:
- Missing or inconsistent expense details
- Slow review and delayed payment processing
- Unclear settlement balances
- Weak traceability for posting and audit

**The Payment Voucher (Internal) Applet Solution:**

- **Structured voucher capture** for header, expenses, and payment lines
- **Controlled settlement handling** with adjustments and contra
- **Trace-ready posting visibility** through Trace Document and logs
- **Bulk file operations** for import and export
- **Role-based controls** for finance operations and approvals

## Key Features Overview

{{< cards >}}
  {{< card title="Voucher Management" subtitle="Create, edit, and finalize internal payment vouchers" link="#for-daily-users" >}}
  {{< card title="Line Item and Expenses" subtitle="Capture expense details with cost coding" link="#line-item-and-expenses" >}}
  {{< card title="Payments and Settlement" subtitle="Select payment method and settlement lines" link="#payments-and-settlement" >}}
  {{< card title="Adjustments and Contra" subtitle="Correct post-final mismatches and offset balances" link="#adjustments-and-contra" >}}
  {{< card title="Intercompany Processing" subtitle="Process unprocessed and processed intercompany queues" link="#intercompany-processing" >}}
  {{< card title="File Import" subtitle="Bulk upload payment vouchers" link="#file-import" >}}
  {{< card title="File Export (CSV)" subtitle="Generate payment export files by date" link="#file-export-csv" >}}
  {{< card title="Trace and Audit" subtitle="Validate posting impact and audit logs" link="#reporting-and-audit" >}}
{{< /cards >}}

{{< figure src="/images/internal-payment-voucher-applet/internal-payment-voucher-overview.png" alt="Payment Voucher (Internal) overview infographic" caption="Overview of payment voucher processing, settlement control, and traceability." >}}

## Key Concepts

### Understanding the Payment Voucher Framework

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is paid? | Entity or Supplier | Vendor ABC Trading |
| **What** is paid? | Expense Line Item | Freight Charge, RM 2,500 |
| **How** is it settled? | Payment Line and Method | Bank transfer, cash, cheque |
| **Where** does it post? | GL and Cashbook Trace | Freight expense GL and cashbook |

{{< callout type="tip" >}}
**Real-World Example**: A freight expense voucher is created for a supplier, settled by bank transfer, finalized, and then traced to journal and cashbook postings.
{{< /callout >}}

### Payment Voucher Hierarchy Structure

Think of payment voucher processing as a structured flow:

```
Organization
│
├── Entity/Supplier ──> WHO is paid?
│   │
│   └── Voucher Header ──> Core document details
│       │
│       ├── Account Details
│       ├── Expense Lines
│       └── Payment Lines
│
└── Adjustments and Contra ──> Balance corrections
    │
    └── Trace Document ──> Posting visibility
```

**Flow Through the Hierarchy:**

1. **Organization**: Company policies and controls
2. **Entity/Supplier**: Payee and account details
3. **Voucher Header**: Date, branch, currency, and references
4. **Expenses**: Expense lines and allocations
5. **Payment**: Settlement method and payment amounts
6. **Adjustments/Contra**: Corrections and offsets when needed
7. **Trace Document**: Posting verification and audit tracking

### The "Golden Triangle" of Payments

| Component | Role | Example |
|-----------|------|---------|
| **Voucher Header** | The payment document | IPV-2026-00045 |
| **Payment Lines** | How payment is executed | Bank transfer, cheque |
| **Contra** | How balance is offset | Offset against related AP document |

**How they link:**
1. You create the voucher header and expense lines.
2. You add payment lines to settle the amount.
3. You use contra only when a true document offset is required.
4. You verify the final balance in AR/AP before finalizing.

---

## Quick Start Guide

Get started quickly with these essential workflows.

{{< figure src="/images/internal-payment-voucher-applet/internal-payment-voucher-quick-start.png" alt="Quick start infographic for Payment Voucher (Internal)" caption="Role-based quick start guide for finance users, managers, and admins." >}}

### For Finance Executives: Create Your First Payment Voucher

**Goal:** Create, balance, and save a payment voucher correctly.

1. Go to **Payment Voucher (Internal)** from the sidebar.
2. Click **+** and enter voucher header details (branch, date, currency, reference).
3. Open **Account** and select entity, billing, and shipping details.
4. Open **Expenses** and add line items with amount and allocation.
5. Open **Payment** and add payment lines to match the payable amount.
6. Review **AR/AP** balance.
7. Save as draft or click **Final** when complete.

{{< figure src="/images/internal-payment-voucher-applet/pv.png" alt="Payment Voucher listing" caption="Payment Voucher listing with actions and filters." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-add.png" alt="Add payment voucher" caption="Use the plus button to create a new voucher." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-entity.png" alt="Account tab entity details" caption="Entity details and payee information in Account tab." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses.png" alt="Expenses tab" caption="Add expense lines and costing details in Expenses tab." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment.png" alt="Payment tab" caption="Add settlement/payment lines in Payment tab." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-arap.png" alt="ARAP tab" caption="Review settlement, contra, and outstanding balance in AR/AP." >}}

{{< callout type="info" >}}
**Doc Link behavior**: Doc Link is used for KO relationships generated by document flow. Users do not manually free-link documents.
{{< /callout >}}

### For Managers/Controllers: Review and Finalize

**Goal:** Review accuracy and finalize only balanced vouchers.

1. Open **Payment Voucher (Internal)** and filter by status/date.
2. Review **Main Details**, **Expenses**, and **Payment** tabs.
3. Check **Settlement Adjustment** or **Contra** only if balances do not align.
4. Review **Trace Document** readiness.
5. Click **Final** when all checks pass.

{{< figure src="/images/internal-payment-voucher-applet/pv-edit.png" alt="Edit payment voucher" caption="Review voucher content before finalizing." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-edit.png" alt="Payment edit tab" caption="Validate payment lines and totals in edit mode." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-contra.png" alt="Contra tab" caption="Use Contra tab for valid document offset scenarios." >}}

{{< callout type="info" >}}
**Separate these two flows clearly:**
- **Payment to supplier**: Use the Payment tab to settle the supplier amount.
- **Payment to expense**: If **Expense = Payment** (for example RM100 expense and RM100 payment), voucher balance is 0, so **no contra is needed**.
{{< /callout >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-trace-doc.png" alt="Trace document tabs" caption="Trace journal, cashbook, points, tax, and other posting traces." >}}

### For Admins: Initial System Setup

**Goal:** Configure core settings for stable voucher operations.

**Step 1: Application Settings** (`Settings > Application Settings`)
- Configure tab visibility and field behavior
- Enable or disable optional flows

{{< figure src="/images/internal-payment-voucher-applet/pv-app-setting.png" alt="Application settings" caption="Application settings for feature visibility and behavior." >}}

**Step 2: Default Selection** (`Settings > Default Selection`)
- Configure default branch and location values
- Reduce manual input during voucher creation

{{< figure src="/images/internal-payment-voucher-applet/pv-deff-setting.png" alt="Default selection settings" caption="Default settings for faster and consistent data entry." >}}

**Step 3: Printable Format Settings** (`Settings > Printable Format Settings`)
- Set voucher print layout and output templates

{{< figure src="/images/internal-payment-voucher-applet/pv-print-format.png" alt="Printable format settings" caption="Manage printable templates for voucher output." >}}

**Step 4: Email Template** (`Settings > Email Template`)
- Configure voucher email subject and body templates
- Ensure correct recipient communication format

{{< figure src="/images/internal-payment-voucher-applet/pv-email.png" alt="Email template settings" caption="Email template management for voucher sending." >}}

**Step 5: Permissions and Feature Visibility**
- Control user access to actions and menus
- Verify finance roles can perform required tasks

{{< figure src="/images/internal-payment-voucher-applet/pv-perm-setting.png" alt="Permission settings" caption="Permission and role-based access control configuration." >}}

**Step 6: Test End-to-End Flow**
- Create test voucher
- Add expenses and payment lines
- Finalize and verify trace visibility

---

{{< callout type="tip" >}}
**New to the system?** Start in this order:
1. Finance users submit and save a test voucher.
2. Managers practice review and finalization.
3. Admins validate settings and permissions.
{{< /callout >}}

---

## Settlement Tracking

**Monitor settlement balances and outstanding amounts in real time.**

### What is Settlement Tracking?

Settlement Tracking shows how much of a voucher is already settled, what remains outstanding, and whether corrections are needed before finalization.

**For Finance Users:**
- Confirm payment lines match expense lines
- Avoid incorrect contra usage
- Finalize only when balance checks pass

**For Managers and Controllers:**
- Validate correction flows before final approval
- Ensure posting-impact documents are accurate

**For Treasury Operations:**
- Confirm payable position before export runs
- Reduce payment and reconciliation exceptions

### How to Check Your Settlement Position

1. Open the voucher in edit mode.
2. Review all payment lines in **Payment** tab.
3. Review **AR/AP** for outstanding and settled amounts.
4. If required, review **Settlement Adjustment** or **Contra**.
5. Recheck totals after any expense or payment update.

### Key Features

- Real-time recalculation after payment and expense edits
- Correction flow through Settlement Adjustment
- Contra support for document-to-document offsets
- AR/AP visibility for pre-final verification

### Common Scenarios

**Scenario 1: Partial Payment**
```
Voucher amount: RM 10,000
Payment recorded: RM 6,000
Status: Partially settled, RM 4,000 outstanding
```

**Scenario 2: Full Settlement with Contra**
```
Voucher amount: RM 5,000
Payment: RM 2,000
Contra offset: RM 3,000
Status: Fully settled
```

**Scenario 3: Expense and Payment Fully Matched**
```
Expense total: RM 100
Payment total: RM 100
Voucher balance: RM 0
Action: No contra required
```

### Tips for Finance Teams

- Recheck settlement after editing expense lines
- Use adjustments for correction flows instead of reissuing documents
- Finalize only after AR/AP balance validation

---

## For Daily Users

This section is your practical reference for daily voucher operations.

### Payment Voucher Listing and Edit Workspace

{{< figure src="/images/internal-payment-voucher-applet/pv.png" alt="Payment voucher listing workspace" caption="Daily workspace for searching, creating, and acting on payment vouchers." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-edit.png" alt="Payment voucher edit workspace" caption="Edit workspace with tabs for details, expenses, payment, and trace." >}}

**What You Can Do:**
- Create, edit, and clone vouchers
- Use **Final**, **Discard**, and **Void** based on status
- Send voucher email and print from listing
- Track posting visibility in Trace Document

### Common Statuses

| Status | What It Means | Typical Action |
|--------|---------------|----------------|
| **Draft** | Work in progress | Continue editing and save |
| **Final** | Finalized posting document | Trace and monitor |
| **Discarded** | Draft cancelled | No posting impact |
| **Voided** | Final document cancelled | Keep audit trail |

### Core Tabs in Edit View

- **Main Details**: Header information
- **Account**: Entity and account-related details
- **Expenses**: Expense lines and allocation
- **Payment**: Settlement/payment line input
- **Doc Link**: System-generated KO relationships

### Conditional and Advanced Tabs

- **AR/AP**: Outstanding and settled amount review
- **Settlement Adjustment**: Post-final settlement corrections
- **Expenses Adjustment**: Post-final expense corrections
- **Contra**: Offset against related documents
- **Trace Document**: Journal and cashbook visibility
- **Attachments**: Supporting files
- **Intercompany**: Cross-entity processing flow

---

## Voiding Payment Vouchers

Use **Void** when a finalized voucher must be cancelled while preserving an audit trail. Use **Discard** for drafts.

### When to Use Void (Common Scenarios)

- Finalized voucher has incorrect supplier or amount
- Payment should not proceed
- Finalized voucher must be reversed for control reasons
- Duplicate finalized voucher needs cancellation

### When to Use Discard Instead

- Voucher is still draft and should be abandoned
- You want to cancel without creating posting impact

### How to Void a Payment Voucher

1. Open **Payment Voucher (Internal)** listing.
2. Filter for **Final** vouchers.
3. Select target voucher and click **Void**.
4. Confirm the void action.
5. Verify posting status changes to **Voided**.

{{< figure src="/images/internal-payment-voucher-applet/pv-filter-final.png" alt="Filter final vouchers" caption="Filter the listing by posting status FINAL before voiding." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-void.png" alt="Void action" caption="Void action from listing toolbar." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-void-confirm.png" alt="Void confirmation" caption="Confirm void action before processing." >}}

### Handling Final or Posted Vouchers

- Check **Trace Document** to understand current posting impact
- Confirm settlement position in **Payment**, **AR/AP**, or **Settlement Adjustment**
- Coordinate with finance control when policy requires pre-void review
- If void is restricted, use adjustment or contra correction flows

---

## Feature Reference

### Line Item and Expenses

Use **Expenses** tab to capture:
- Itemized expense amounts
- Costing and allocation details
- Optional item-level references such as serial or batch

### Payments and Settlement

Use **Payment** tab to manage:
- Payment method selection (bank, cash, transfer, cheque, and configured methods)
- Multiple payment lines
- Currency and exchange-rate impact (when enabled)

### Adjustments and Contra

Use these options for corrections:
- **Expenses Adjustment** for expense-side corrections
- **Settlement Adjustment** for payment-settlement corrections
- **Contra** for valid document offset scenarios

{{< figure src="/images/internal-payment-voucher-applet/pv-adjust-set.png" alt="Settlement adjustment listing" caption="Settlement Adjustment listing for payment voucher corrections." >}}

### Intercompany Processing

Intercompany menu provides two queues:
- **Unprocessed**: Transactions pending processing
- **Processed**: Completed intercompany transactions

{{< figure src="/images/internal-payment-voucher-applet/pv-intercompany.png" alt="Intercompany listing" caption="Intercompany queue with Unprocessed and Processed tabs." >}}

#### Where Intercompany Data Comes From

Intercompany records are generated from finalized vouchers with intercompany data in Account tab.

#### How to Create an Intercompany Transaction

1. Create or edit a voucher.
2. Fill intercompany fields in **Account** tab.
3. Save and finalize the voucher.
4. Open **Intercompany** and process the new queue entry.

### File Import

Bulk upload flow:
1. Open **File Import**.
2. Upload source file.
3. Review **Checking** tab.
4. Fix errors and re-upload if needed.

{{< figure src="/images/internal-payment-voucher-applet/pv-file-import.png" alt="File import listing" caption="File Import listing with uploaded files and status tracking." >}}

### File Export CSV

Export flow:
1. Open **File Export**.
2. Select transaction date range.
3. Click **Generate CSV**.
4. Download from generated record.

{{< figure src="/images/internal-payment-voucher-applet/pv-export.png" alt="File export listing" caption="File Export listing for CSV generation and download." >}}

---

## Reporting and Audit

### Trace Document

Use **Trace Document** after finalization to verify posting results such as:
- Journal transactions
- Cashbook transactions
- Tax transactions
- Other configured traces

### Applet Log

Use **Settings > Applet Log** to review:
- Who performed each action
- What changed
- When changes occurred

This supports compliance reviews, troubleshooting, and audit validation.

---

## Configuration and Settings

Configure the applet under **Settings**:

- **Application Settings**: Field and tab behavior
- **Default Selection**: Default values for faster entry
- **Printable Format Settings**: Print/PDF layout controls
- **Email Template**: Email body and subject templates
- **Feature Visibility**: Show/hide features by role
- **Permissions**: Role and user access control
- **Webhook**: Outbound integration behavior
- **Release Notes**: Version change visibility
- **Applet Log**: Audit history

{{< figure src="/images/internal-payment-voucher-applet/pv-app-setting.png" alt="Settings page" caption="Settings page for feature control, defaults, and templates." >}}

---

## Related Applets

- **[Supplier Maintenance Applet](/applets/supplier-maintenance-applet/)**: Manage supplier master data used in payment vouchers.
- **[Chart of Account Applet](/applets/chart-of-account-applet/)**: Define GL accounts used for postings.
- **[General Ledger Applet](/applets/general-ledger-applet/)**: Review journal impact from finalized vouchers.
- **[Cashbook Applet](/applets/cashbook-applet/)**: Validate cash and bank movement tied to vouchers.

---

## Summary

The **Payment Voucher (Internal) Applet** provides a controlled and traceable workflow for internal payment processing. It combines voucher creation, expense capture, payment settlement, corrections, and audit visibility in one operational flow.

---

## FAQ

**Q: Why is the Final button disabled?**
A: Required data may be incomplete, the voucher may be unbalanced, or your role may not have final permission.

**Q: When should I use Contra?**
A: Use Contra only for valid document offset cases, not to force-match totals when expense and payment already match.

**Q: What if expense total and payment total are equal?**
A: If both are equal (for example RM100 and RM100), voucher balance is 0 and no contra is required.

**Q: How do I export payment files for the bank?**
A: Open **File Export**, select date range, click **Generate CSV**, then download from generated rows.

**Q: Where do I check posting impact?**
A: Open the voucher and go to **Trace Document** after finalization.

**Q: Why can't I see Intercompany records?**
A: You may not have access permissions, or there are no intercompany transactions in your scope.

**Q: Is Send Email used for approval workflow?**
A: No. Send Email is for sending voucher output to supplier or recipient, not for approval routing.
