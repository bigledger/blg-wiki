---
title: "Internal Payment Voucher Applet"
description: "End-to-end internal payment voucher processing: create vouchers, manage expenses and payments, handle settlements and adjustments, and export or import vouchers in bulk."
tags:
- internal-payment-voucher
- finance
- accounts-payable
- payments
- settlement
- contra
- intercompany
- import
- export
weight: 20
---

## Purpose and Overview

The **Internal Payment Voucher Applet** streamlines the full lifecycle of internal payment vouchers, from creation and expense capture to settlement, adjustments, and final posting. It brings together voucher header details, expense lines, payment lines, and traceability so finance teams can process payments with speed and control across the main menus: **Internal Payment Voucher**, **File Import**, **File Export**, **Intercompany**, **Settlement Adjustment**, and **Expenses Adjustment**.

{{< callout type="info" >}}
**Core Concept**: The applet links **who** is paid (entity/supplier) to **what** is paid (expense lines) and **how** it is settled (payment lines, contra, and adjustments) while preserving posting and audit traceability.
{{< /callout >}}

## About the Applet

- **Purpose**: Create, track, and finalize internal payment vouchers with settlement, adjustments, and audit controls.
- **Target Users**: Accounts Payable clerks, finance executives, treasury/payment operations, and finance controllers.
- **Key Features**: Voucher lifecycle management, expense and line-item capture, payment and settlement handling, adjustments and contra, intercompany processing, file import/export, and operational controls like **Final/Discard/Void**, **Send Email**, **Single/Multiple Print**, and **Clone**.

## Key Features Overview

### Who Benefits from This Applet?

**Accounts Payable and Finance Executives:**
- Fast voucher creation and controlled edits
- Clear visibility of expenses, payments, and balances
- Built-in actions to final, discard, or void

**Treasury and Payment Operations:**
- Organized payment lines and settlement tracking
- Export-ready payment files for bank processing
- Better coordination of payment timing and method

**Finance Managers and Controllers:**
- Review-ready documents and settlement consistency
- Trace document visibility before period close
- Audit trails for compliance

**Auditors and Compliance:**
- Full history of voucher changes and status
- Traceability from voucher to posting
- Attachment and document linkage

### What Problems Does This Solve?

**The Manual Payment Voucher Problem:**

Manual payment vouchers often lead to:
- Missing or inconsistent expense details
- Slow approvals and late payments
- Unclear settlement balances
- Weak audit trails and poor traceability

**The Internal Payment Voucher Applet Solution:**

- **Structured voucher capture** with header, expenses, and payments
- **Built-in settlement controls** and adjustments
- **Contra handling** to offset balances
- **Intercompany processing** for cross-entity settlement
- **Export-ready files** for downstream payment runs
- **Audit-ready visibility** through trace and logs

## Key Features Overview

{{< cards >}}
  {{< card title="Voucher Management" subtitle="Create, edit, and finalize internal payment vouchers" link="#voucher-management" >}}
  {{< card title="Line Item and Expenses" subtitle="Capture expense details with cost coding" link="#line-item-and-expenses" >}}
  {{< card title="Payments and Settlement" subtitle="Add payment lines and manage settlement" link="#payments-and-settlement" >}}
  {{< card title="Adjustments and Contra" subtitle="Handle expenses and settlement adjustments" link="#adjustments-and-contra" >}}
  {{< card title="File Import" subtitle="Bulk creation of payment vouchers" link="#file-import" >}}
  {{< card title="File Export (CSV)" subtitle="Generate payment export files by date" link="#file-export-csv" >}}
  {{< card title="Intercompany Processing" subtitle="Track unprocessed and processed intercompany" link="#intercompany-processing" >}}
  {{< card title="Trace and Audit" subtitle="Trace documents and audit logs" link="#trace-and-audit" >}}
{{< /cards >}}

{{< figure src="/images/internal-payment-voucher-applet/internal-payment-voucher-overview.png" alt="Internal Payment Voucher overview infographic" caption="Infographic highlighting challenges, solutions, and beneficiary roles." >}}

internal-payment-voucher-overview

## Key Concepts

### Understanding the Payment Voucher Framework

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Who** is paid? | Entity or Supplier | Vendor ABC Trading |
| **What** is paid? | Expense Line Item | Freight Charge, RM 2,500 |
| **How** is it settled? | Payment Line and Settlement | Bank transfer, contra offset |
| **Where** does it post? | AR/AP and Trace Document | Posting to AP and Cashbook |

{{< callout type="tip" >}}
**Example**: A payment voucher for freight charges is created, linked to the supplier, assigned cost coding, paid via bank transfer, and traced to the final posting for audit.
{{< /callout >}}

### Payment Voucher Hierarchy Structure

```
Organization
│
├── Entities/Suppliers ──> WHO is paid?
│   │
│   └── Voucher Header ──> Core document details
│       │
│       ├── Account & Address Details
│       ├── Expense Lines & Cost Coding
│       └── Payment Lines & Settlement
│
└── Adjustments & Contra ──> Balance corrections
    │
    └── Trace Document ──> Posting visibility
```

**Flow Through the Hierarchy:**

1. **Organization**: Company policies and controls
2. **Entity**: Supplier or payee
3. **Voucher Header**: Branch, date, currency, reference
4. **Expenses**: Line items and cost allocation
5. **Payments**: Method and settlement details
6. **Adjustments/Contra**: Corrections and offsets
7. **Trace Document**: Posting status and audit

### The "Settlement Triangle" of Payments

| Component | Role | Example |
|-----------|------|---------|
| **Voucher Header** | The document to be paid | IPV-2026-00045 |
| **Payment Lines** | How the payment is executed | Bank transfer, cheque |
| **Settlement/Contra** | How the balance is cleared | Offset against AP invoice |

This triangle keeps payment processing consistent and auditable. If one side changes, the other two must be reviewed to keep the voucher balanced.

---

## Quick Start Guide

{{< figure src="/images/internal-payment-voucher-applet/internal-payment-voucher-quick-start.png" alt="Quick start infographic for Internal Payment Voucher" caption="Role-based quick start flow for creating, reviewing, and exporting vouchers." >}}

### For Finance Executives: Create Your First Payment Voucher

1. Go to **Internal Payment Voucher** from the sidebar.
{{< figure src="/images/internal-payment-voucher-applet/pv.png" alt="Internal Payment Voucher listing" caption="Listing view with filters, actions, and email template selection." >}}
2. Click **+** and fill main details (branch, company, date, currency, reference).
{{< figure src="/images/internal-payment-voucher-applet/pv-add.png" alt="Add Internal Payment Voucher button" caption="Plus button on the listing used to create a new voucher." >}}
3. Open **Account** and select the entity, billing, and shipping details.
{{< figure src="/images/internal-payment-voucher-applet/pv-entity.png" alt="Account tab with Entity Details" caption="Entity Details fields for the payee in the Account tab." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-entity-select.png" alt="Select Entity dialog" caption="Entity selection list used to populate Account details." >}}

4. Open **Expenses** and add line items with amounts and cost coding.

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses.png" alt="Expenses tab with item list and Select Item" caption="Expenses tab with line list and item selection panel." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses-line.png" alt="Add Item form - Item Details" caption="Add Item form showing Item Details fields." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-batch.png" alt="Add Item form - Batch Number" caption="Batch Number tab for lot-controlled items." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-sn.png" alt="Add Item form - Serial Number" caption="Serial Number tab for serialized items with scan/import." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-bi.png" alt="Add Item form - Item Details (Main Details)" caption="Item Details main fields for the selected item." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-cost.png" alt="Add Item form - Costing Details" caption="Costing Details tab for cost allocation and pivot view." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-issue-link.png" alt="Add Item form - Issue Link" caption="Issue Link tab for linking related issues or tickets." >}}

5. Open **Payment** and add payment lines to match the payable amount.

{{< figure src="/images/internal-payment-voucher-applet/pv-payment.png" alt="Payment tab in voucher edit" caption="Payment tab ready for settlement lines." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-add.png" alt="Add Settlement drawer" caption="Add Settlement form with Settlement Group and Method." >}}

**Settlement Type Reference (examples; depends on your configured payment methods):**

| Settlement Type | When to Use | Notes |
|-----------------|-------------|-------|
| **Cash** | Cash payment at point of processing | Posts to cashbook when finalized |
| **Bank Transfer** | Bank-to-bank payment | Capture bank reference if required |
| **Cheque** | Cheque-based payment | Record cheque number and date |
| **Contra/Offset** | Offset against related documents | Reduces open balance without cash movement |
| **Other (FPX/e-Wallet)** | Digital payment channels | Use if configured in your settlement methods |

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-data.png" alt="Payment lines with totals" caption="Payment line list showing total payment and balances." >}}

6. Review **AR/AP** or **Settlement Adjustment** if the balance is not zero.

{{< figure src="/images/internal-payment-voucher-applet/pv-arap.png" alt="AR/AP tab summary" caption="AR/AP summary for settlement, contra, and outstanding balances." >}}

7. Add **Doc Link** or **Attachments** if approvals or invoices must be stored.

{{< figure src="/images/internal-payment-voucher-applet/pv-doc-link.png" alt="Doc Link tab" caption="Doc Link tab for linking related documents." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-attach.png" alt="Attachments tab" caption="Attachments tab for uploading supporting files." >}}

8. Click **Save** for draft or **Final** to lock the voucher.

{{< figure src="/images/internal-payment-voucher-applet/pv-save.png" alt="Save action in voucher edit" caption="Save button on the voucher form." >}}

**What happens next?** Managers or controllers can review and finalize, and the trace document will reflect posting status when available.

{{< callout type="tip" >}}
**Pro Tip**: Use **Send Email** and **Single/Multiple Print** from the listing to speed up communication and approvals.
{{< /callout >}}

---

### For Managers/Controllers: Review and Finalize

1. Open **Internal Payment Voucher** and filter by status or date.
{{< figure src="/images/internal-payment-voucher-applet/pv-stat-date.png" alt="Advanced search filters" caption="Status and date range filters for the listing." >}}
2. Review **Main Details**, **Expenses**, and **Payment** tabs for completeness.
{{< figure src="/images/internal-payment-voucher-applet/pv-edit.png" alt="Edit Internal Payment Voucher - Main Details" caption="Edit view showing Main Details fields and actions." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses-edit.png" alt="Expenses tab in edit view" caption="Expenses tab with line items and totals." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-edit.png" alt="Payment tab in edit view" caption="Payment tab showing settlement lines and totals." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-payment-edit-1.png" alt="Edit Payment form" caption="Edit Payment form with Settlement Type, Method, Date, and Amount." >}}

3. Check **Settlement Adjustment** or **Contra** if balances do not align.

{{< figure src="/images/internal-payment-voucher-applet/pv-contra.png" alt="Contra tab in voucher edit" caption="Contra tab listing offsets and balances." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-contra-add.png" alt="Add Contra button" caption="Plus button used to add a contra document." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-contra-add-1.png" alt="Select document to contra" caption="Selection list for choosing documents to offset." >}}

4. Review **Trace Document** (if available) to confirm posting readiness.

{{< figure src="/images/internal-payment-voucher-applet/pv-trace-doc.png" alt="Trace Document tabs" caption="Trace Document tabs for Journal, Cashbook, Points, Tax, and Inventory." >}}

**Trace Document Differences**

| Trace Type | What It Represents | When It Appears | Why It Matters |
|------------|--------------------|----------------|----------------|
| **Journal Txn** | General ledger postings | After voucher is **Final** and GL posting is created | Confirms debit/credit accounts and amounts |
| **Cashbook Txn** | Cash or bank movements | After voucher is **Final** and settlement method posts to cash/bank | Validates cash/bank impact and references |
| **Points Txn** | Points ledger movement | Only when points-based settlement is used | Confirms points redemption or accrual entries |
| **Tax Txn** | Tax-related postings | When tax is applied on expense lines | Validates tax amount and tax account mapping |
| **Inv Txn** | Inventory movement postings | When expenses affect inventory items | Confirms stock impact and valuation entries |

5. Click **Final** to approve, or **Query** offline if corrections are needed.

{{< figure src="/images/internal-payment-voucher-applet/pv-final.png" alt="Final action in Trace Document view" caption="Final button highlighted with Trace Document tab open." >}}

---

### For Admins: Initial System Setup

1. Configure **Settings > Application Settings** to show or hide key tabs.

{{< figure src="/images/internal-payment-voucher-applet/pv-app-setting.png" alt="Application Settings" caption="Application Settings for field visibility and tab configuration." >}}

2. Set defaults in **Settings > Default Selection** for faster entry.

{{< figure src="/images/internal-payment-voucher-applet/pv-deff-setting.png" alt="Default Selection settings" caption="Default Selection settings for branch and location defaults." >}}

3. Define **Printable Format Settings** for voucher output.

{{< figure src="/images/internal-payment-voucher-applet/pv-print-format.png" alt="Printable Format Settings listing" caption="Printable Format Settings listing for voucher templates." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-print-add.png" alt="Add Printable Format" caption="Add Printable Format form with upload area." >}}

4. Configure **Email Template** for voucher notifications.

{{< figure src="/images/internal-payment-voucher-applet/pv-email.png" alt="Email Template listing" caption="Email Template list for voucher notifications." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-email-add.png" alt="Create Email Template form" caption="Create Email Template form with printable format and template body." >}}

5. Review **Permissions** and field visibility for role-based access.

{{< figure src="/images/internal-payment-voucher-applet/pv-perm-setting.png" alt="Permission Set settings" caption="Permission Set listing for role-based access." >}}

6. Test a full voucher flow (create → payment → final → trace).



---

### For Treasury/Payment Ops: Generate a Payment Export (CSV)

1. Open **File Export** from the sidebar.

{{< figure src="/images/internal-payment-voucher-applet/pv-export.png" alt="Payment Voucher File Export listing" caption="File Export listing with Generate CSV and export history." >}}

2. Select the transaction date range.

{{< figure src="/images/internal-payment-voucher-applet/pv-export-date.png" alt="File Export date range filters" caption="Choose transaction date range before generating CSV." >}}

3. Click **Generate CSV** to download the payment file.

{{< figure src="/images/internal-payment-voucher-applet/pv-generate-csv.png" alt="Generate CSV action" caption="Generate CSV button in File Export." >}}

4. Confirm the export appears in the listing.

{{< figure src="/images/internal-payment-voucher-applet/pv-saved-gene.png" alt="Generated export entry" caption="Export listing showing a generated CSV with download action." >}}

---

### For Finance Operations: Bulk Import Payment Vouchers

1. Open **File Import** from the sidebar.
{{< figure src="/images/internal-payment-voucher-applet/pv-file-import.png" alt="File Import listing" caption="File Import listing with uploaded files and statuses." >}}
2. Download and fill the import template (Excel/CSV). The Excel/CSV template file can be download from File Export menu

3. Upload the file and review the **Checking** tab.
{{< figure src="/images/internal-payment-voucher-applet/pv-import-check.png" alt="File Import Checking tab" caption="Checking tab showing validation results." >}}
4. Fix errors and re-upload if needed.
5. Confirm the import and review the created vouchers.


{{< callout type="tip" >}}
**New rollout checklist**: Validate a full workflow from draft to final, including payment lines, adjustments, and trace document visibility.
{{< /callout >}}

---

## Payment Allocation and Settlement Tracking

Payment vouchers are only complete when the settlement position is clear. This section explains how to confirm what is paid, what is offset, and what remains outstanding.

### How to Check Your Settlement Position

1. Open the voucher and go to the **Payment** tab to review payment lines.
2. Check **Settlement Adjustment** for corrections or balance fixes.
3. Use **AR/AP** (edit view) to verify outstanding and settled amounts.
4. Recheck totals after any **Expenses** or **Payment** edits.

### Key Features

- Real-time recalculation when payments or expenses change
- Settlement adjustment workflows for corrections
- Contra support for offsetting related documents

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

### Tips for Finance Teams

- Recheck settlement after editing expense lines
- Use adjustments for late corrections instead of reissuing vouchers
- Confirm AR/AP tab balance before finalizing

---

## Voucher Management

The main workflow centers on the **Internal Payment Voucher** menu:

- **List and filter vouchers** with advanced search and column toggles
- **Create, edit, and clone** vouchers from the listing
- **Final, discard, or void** vouchers based on status and control policies
- **Send email** and **print** vouchers from the listing (email requires a selected template)
- **Template selection** for Send Email is available directly on the listing toolbar

{{< figure src="/images/internal-payment-voucher-applet/pv.png" alt="Internal Payment Voucher listing (alternate view)" caption="Listing view for Internal Payment Voucher." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-edit.png" alt="Internal Payment Voucher create/edit form" caption="Create/Edit form with tabs for details, expenses, and payment." >}}

**Common Statuses:**

| Status | Meaning | Typical Action |
|--------|---------|----------------|
| **Draft** | In progress | Continue editing and save |
| **Final** | Approved and locked | Proceed to posting/trace |
| **Discarded** | Cancelled before final | No posting impact |
| **Voided** | Cancelled after final | Audit trail retained |

**Create/Edit Tabs (Core):**

- **Main Details**: Document header fields (branch, date, currency, reference).
- **Account**: Entity, billing, and shipping details.
- **Expenses**: Line items and cost coding.
- **Payment**: Payment lines and settlement alignment.
- **Department Hdr**: Department header coding.
- **Doc Link**: Link to related documents.

**Create/Edit Tabs (Edit-Only or Conditional):**

- **Expenses Adjustment**: Correct expense allocation after creation.
- **AR/AP**: Review outstanding and settled balances.
- **Settlement Adjustment**: Correct settlement mismatches.
- **Contra**: Offset balances against related documents.
- **Trace Document**: Posting trace and downstream status.
- **Attachments**: Supporting documents and approvals.
- **Export**: Export voucher data when enabled.
- **Sales Commission**: Link commission records when configured.

---

## Voiding Payment Vouchers

Use **Void** to cancel a voucher **after** it has been finalized, while keeping an audit trail. For drafts, use **Discard** instead.

### When to Use Void (Common Scenarios)

- The voucher was finalized with the wrong entity or amount.
- The payment was cancelled or should not proceed.
- The expense lines were materially incorrect and must be reversed before re‑issuing.
- The voucher was duplicated and needs to be cancelled cleanly.

### When to Use Discard Instead

- The voucher is still in **Draft** and was created in error.
- You want to abandon edits without creating a posting trail.

### How to Void a Payment Voucher (User Guide)

1. Open **Internal Payment Voucher** from the sidebar.
2. Filter and select the **Final** voucher you want to void.
{{< figure src="/images/internal-payment-voucher-applet/pv-filter-final.png" alt="Search Filter for Posting Status FINAL" caption="Filter using Posting Status into FINAL to make it faster to search for Payment Voucher which have been FINAL" >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-final-result.png" alt="Search result for FINAL" caption="All the payment voucher in the listing is with Posting Status FINAL" >}}

3. Click **Void** from the listing action bar.
{{< figure src="/images/internal-payment-voucher-applet/pv-void.png" alt="Void button" caption="Click in the VOID button to void the Payment Voucher" >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-void-confirm.png" alt="Confirmation on void document" caption="Pop out confirmation to make sure user really want to VOID the Payment Voucher" >}}

4. Confirm the action in the prompt dialog. If you void from the edit view, you will be asked to **re‑enter the document number** to confirm.

{{< figure src="/images/internal-payment-voucher-applet/pv-void-success.png" alt="Successfuly VOID the payment voucher" caption="Pop out success message on voiding the document" >}}

5. Verify the status becomes **Voided** by using the Search Filter.
{{< figure src="/images/internal-payment-voucher-applet/pv-void-done.png" alt="Search recent VOID Payment Voucher" caption="Use the Search Filter to search for the VOID document using the Posting Status" >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-void-result.png" alt="Show all the voided payment voucher" caption="All the voided Payment Voucher will show in the Payment Voucher Listing" >}}

6. Open the voucher, then go to **Trace Document** in the edit view to review the posting trace; review **Applet Log** for audit confirmation.

{{< figure src="/images/internal-payment-voucher-applet/pv-void-before.png" alt="Payment Voucher before void" caption="Payment Voucher before void" >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-after-void.png" alt="Payment Voucher after void" caption="Payment Voucher after void" >}}


### Handling “Ready” or Posted Vouchers

If a voucher is already **Final**, exported, or has settlement/trace entries:

- **Check Trace Document** to see what has posted (Journal/Cashbook/Tax/Inv/Points). Note that Trace Document may still show the original postings even after a void, depending on your configuration.
- **Confirm settlement status** in **Payment**, **AR/AP**, or **Settlement Adjustment**.
- If your policy requires, **coordinate with finance control** before voiding.
- If **Void** is not allowed, use **adjustments/contra** to correct balances and keep the audit trail intact.

---

## Line Item and Expenses

Use the **Expenses** tab to capture detailed costs:

- Line items with quantities and amounts
- Pricing details and taxes
- Department or cost coding for segment, project, profit center, and dimension
- Item references such as serial, bin, or batch when applicable
- Optional issue links and delivery details

---

## Payments and Settlement

The **Payment** tab manages how the voucher is paid:

- Multiple payment lines per voucher
- Multi-currency and forex handling when enabled
- Settlement alignment with expenses and adjustments
- Reviewable AR/AP position for outstanding balances

**Tip:** If the forex button is enabled, review the exchange rate before finalizing to avoid posting variance.

---

## Adjustments and Contra

For corrections and balancing:

- **Expenses Adjustment**: Fix or reallocate expense line issues
- **Settlement Adjustment**: Correct settlement mismatches
- **Contra**: Offset balances against related documents

Use the **Settlement Adjustment** and **Expenses Adjustment** menus for a full listing view and audit.

{{< figure src="/images/internal-payment-voucher-applet/pv-adjust-set.png" alt="Settlement Adjustment listing" caption="Settlement Adjustment listing for payment vouchers." >}}

{{< figure src="/images/internal-payment-voucher-applet/pv-expenses.png" alt="Expenses Adjustment listing" caption="Expenses Adjustment listing for payment vouchers." >}}

---

## Intercompany Processing

The **Intercompany** menu separates work into two queues:

- **Unprocessed**: Pending intercompany transactions to be linked or resolved
- **Processed**: Completed intercompany links for audit

This supports cross-entity payment flows without losing traceability.

{{< figure src="/images/internal-payment-voucher-applet/pv-intercompany.png" alt="Intercompany transaction listing" caption="Intercompany listing with unprocessed and processed tabs." >}}

### Where Intercompany Data Comes From

Intercompany records are generated from **Internal Payment Vouchers** that are flagged for intercompany processing. Once a voucher is saved and finalized, the system creates intercompany entries that appear in the **Unprocessed** queue for linking or resolution. Availability depends on your intercompany configuration and permissions.

### How to Create an Intercompany Transaction

1. Create or open an **Internal Payment Voucher**.
2. Go to **Account** and open the **Intercompany** sub‑tab (if enabled).
3. Select the intercompany entity/branch or required intercompany fields.
4. Save and **Final** the voucher.
5. Open **Intercompany** from the sidebar to view the new record under **Unprocessed**.
6. Link or resolve it, then confirm it moves to **Processed**.

**Tip:** If the Intercompany sub‑tab is hidden, enable it in **Settings > Application Settings** or check your role permissions.

---

## File Import

Bulk creation is available through **File Import**:

1. Upload the source file (Excel/CSV as provided by your template).
2. Validate data in the checking view.
3. Resolve errors and confirm the import.
4. Open a sample voucher to verify header, expenses, and payment lines.

{{< figure src="/images/internal-payment-voucher-applet/pv-file-import.png" alt="File Import listing" caption="File Import listing with uploaded files and statuses." >}}

---

## File Export CSV

Generate payment voucher exports for downstream payment runs:

1. Open **File Export**.
2. Select the transaction date range.
3. Click **Generate CSV** to download the file.
4. If the file is empty, confirm the vouchers are **Final** and within the date range.

{{< figure src="/images/internal-payment-voucher-applet/pv-export.png" alt="Payment Voucher file export listing" caption="File Export screen for generating voucher CSV output." >}}

---

## Trace and Audit

- **Where to trace a payment voucher**: Open **Internal Payment Voucher** from the sidebar, select a voucher, and go to **Trace Document** in the edit view. Trace tabs appear after the voucher is **Final**.
- **Trace Document**: View posting trace and downstream status (available after finalization).
- **Applet Log**: Review who changed what, and when (Settings > Applet Log).

Use these tools to support audits and period close review.

---

## Document Links and Attachments

- **Doc Link**: Connect vouchers to related documents for traceability.
- **Attachments**: Store invoices, approvals, and supporting files.
- **Sales Commission**: Link commission records when enabled.

---

## Configuration and Settings

Configure the applet under **Settings**:

- **Application Settings**: Field visibility, tab enablement, and validation behavior.
- **Default Selection**: Set defaults for branch, currency, and common fields.
- **Printable Format Settings**: Control voucher print layout and branding.
- **Email Template**: Configure email content used by Send Email.
- **Feature Visibility**: Show or hide menu items and features by role.
- **Permissions**: Client-side permission sets and user/team/role assignments.
- **Webhook**: Configure outbound notifications for downstream systems.
- **Applet Log**: System audit trail for voucher actions.
- **Release Notes**: Track changes delivered to the applet.

{{< figure src="/images/internal-payment-voucher-applet/pv-app-setting.png" alt="Internal Payment Voucher settings" caption="Settings page for field visibility, defaults, and templates." >}}

---

## Related Applets

- **[Supplier Maintenance Applet](/applets/supplier-maintenance-applet/)**: Manage supplier master data used in payment vouchers.
- **[Chart of Account Applet](/applets/chart-of-account-applet/)**: Define GL accounts used for expenses and postings.
- **[General Ledger Applet](/applets/general-ledger-applet/)**: Review the final journal postings from payment vouchers.
- **[Cashbook Applet](/applets/cashbook-applet/)**: Validate cash and bank movements tied to payment vouchers.

---

## Summary

The Internal Payment Voucher Applet provides a controlled, auditable workflow for managing internal payments. It combines voucher entry, expense and payment management, settlement adjustments, intercompany handling, and file import/export in one place, with clear traceability for finance and compliance.

---

## FAQ

**Q: Why is the Final button disabled?**
A: Required fields may be missing, or your role does not have final permission. Check Main Details, Expenses, and Payment tabs.

**Q: Why is the Payment or Expenses tab hidden?**
A: It can be disabled in Application Settings or by role-based field configuration.

**Q: Why does my voucher show an outstanding balance?**
A: Payment lines and settlement adjustments do not fully match the expense total. Review payments, contra, and adjustments.

**Q: How do I export payment files for the bank?**
A: Go to **File Export**, pick the transaction date range, and click **Generate CSV**.

**Q: Where can I trace a payment voucher?**
A: Open the voucher from **Internal Payment Voucher** and go to **Trace Document** in the edit view. Trace tabs appear after the voucher is **Final**.

**Q: Can I link a voucher to related documents?**
A: Yes. Use **Doc Link** to connect related documents and keep traceability intact.

**Q: Why is the export file empty?**
A: Check that vouchers are **Final** and the transaction date range matches the voucher dates.

**Q: Why can't I select a supplier/entity?**
A: The supplier may be inactive or missing in master data, or your role lacks permission.

**Q: Why is Send Email missing or disabled?**
A: Email can be hidden in Application Settings or your role does not have permission; also confirm an Email Template is selected.

**Q: Why don't I see Intercompany records?**
A: You may not have access to intercompany data, or there are no transactions within your branch or date scope.
