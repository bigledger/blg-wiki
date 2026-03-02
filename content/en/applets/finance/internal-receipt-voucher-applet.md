---
title: "Internal Receipt Voucher Applet"
description: "End-to-end internal receipt voucher processing: create vouchers, manage line items and payments, handle settlement adjustments, and import vouchers in bulk."
tags:
- internal-receipt-voucher
- finance
- accounts-receivable
- settlement
- payments
- contra
- import
weight: 10
---


## Purpose and Overview

The **Internal Receipt Voucher Applet** streamlines the end-to-end process of managing internal receipt vouchers. It enables finance teams to create, edit, and import vouchers, manage line items, payments, contras, and settlement adjustments—all while maintaining audit traceability and compliance with branch/accounting controls.

{{< callout type="info" >}}
**Core Concept:** This applet unifies receipt processing, settlement, and adjustments in a single workflow, supporting multi-currency, inventory tracking, and multi-level approvals.
{{< /callout >}}

---

## Who Benefits from This Applet?

**Finance Executives & Accountants:**
- Create vouchers, record receipts, manage corrections
- Bulk import for high-volume processing

**Finance Reviewers & Controllers:**
- Validate settlements and postings before period close
- Ensure compliance and readiness

**Auditors & Compliance:**
- Review voucher history, adjustments, and references
- Ensure audit trail and traceability

---

## Key Features Overview

{{< cards >}}
  {{< card title="Voucher Management" subtitle="Create, edit, and track internal receipt vouchers" link="#voucher-management" >}}
  {{< card title="Line Item & Cost Coding" subtitle="Detailed line entry, inventory, and cost allocation" link="#line-item-management" >}}
  {{< card title="Payments & Contras" subtitle="Allocate receipts, manage contra entries, and settlements" link="#financial-processing" >}}
  {{< card title="Bulk Import" subtitle="Import receipt vouchers in bulk from files" link="#file-import" >}}
  {{< card title="Approval Workflow" subtitle="Checked By / Approved By flows" link="#workflow-and-approvals" >}}
  {{< card title="Settings & Configuration" subtitle="Customizable fields, defaults, and printable formats" link="#settings-and-configuration" >}}
{{< /cards >}}

---

## What Problems Does This Solve?

**Manual voucher processing is slow, error-prone, and hard to audit.**

**The Internal Receipt Voucher Applet Solution:**
- Digitalizes voucher creation and approval
- Automates settlement and contra management
- Supports bulk import for high volume
- Maintains a full audit trail and compliance
- Integrates with customer, chart of account, and general ledger applets

---

## Key Concepts & Data Model

| Component | Description | Example |
|-----------|-------------|---------|
| Voucher Header | Core details: branch, company, date, currency, etc. | Branch: HQ, Date: 2026-02-23 |
| Line Item | Item, quantity, cost coding, inventory details | Item: Widget A, Qty: 10 |
| Payment/Contra | Receipt allocation, contra entries, settlement | Payment: RM 1,000, Contra: Offset AR |
| Import | Bulk onboarding of vouchers | Upload Excel file |
| Approval | Checked By / Approved By workflow | Finance Exec → Controller |

**Data Model Structure:**

```
Receipt Voucher
│
├── Header (Branch, Company, Date, Currency, etc.)
├── Line Items (Item, Qty, Cost Coding, Inventory)
├── Payments & Contras (Allocation, Settlement)
├── Import (Bulk Upload)
└── Approval (Checked By, Approved By)
```

---

## Quick Start Guide

### For Finance Executives: Create & Submit a Voucher

1. **Go to Internal RCT Voucher** from the sidebar
2. **Create Voucher**: Click **Add**, fill in main details (branch, company, date, reference, currency)
3. **Add Line Items**: Enter items, quantities, cost coding, and inventory details
4. **Add Payments/Contras**: Allocate receipts, add contra lines if needed
5. **Save & Submit**: Save as draft or submit for approval

{{< figure src="/screenshots/internal-receipt-voucher/listing.png" alt="Internal Receipt Voucher listing" caption="Voucher listing view with filters and actions." >}}

---

### For Reviewers/Controllers: Approve & Finalize

1. **Check Pending Vouchers**: Go to **Pending Approvals**
2. **Review Details**: Open voucher, verify header, line items, and settlements
3. **Approve or Query**: Approve for posting, or query for corrections

---

### For Admins: Bulk Import Vouchers

1. **Go to Import Receipt Voucher**
2. **Upload File**: Select and upload the source file (Excel/CSV)
3. **Check & Review**: Validate imported data in the Checking tab
4. **Finalize**: Resolve errors, confirm import status

{{< figure src="/screenshots/internal-receipt-voucher/import-listing.png" alt="Import listing" caption="Bulk import listing and monitoring view." >}}

---

## Voucher Management

The main workflow centers on the **Internal Receipt Voucher** menu:

- **List Vouchers**: Paginated, filterable list of vouchers
- **Create/Edit**: Enter header details, link entities, and save
- **Entity Linking**: Link to customers, billing/shipping addresses, and contacts

{{< figure src="/screenshots/internal-receipt-voucher/main-details.png" alt="Main details form" caption="Main details section for voucher setup." >}}
{{< figure src="/screenshots/internal-receipt-voucher/entity-details.png" alt="Entity details section" caption="Entity details for account and contact linkage." >}}
{{< figure src="/screenshots/internal-receipt-voucher/select-entity.png" alt="Select entity dialog" caption="Select entity workflow for linking account records." >}}

---

## Line Item Management

For each voucher, add detailed line items:
- **Inventory Details**: Items, quantities, unit prices
- **Bin & Batch Tracking**: Assign bin/batch numbers
- **Cost Allocation**: Allocate to segments, projects, profit centers, dimensions
- **Issue Links**: Link to issues/tickets, log activities

{{< figure src="/screenshots/internal-receipt-voucher/image-1771214574661.png" alt="Line item and accounting details" caption="Line item entry and accounting-related details." >}}
{{< figure src="/screenshots/internal-receipt-voucher/image-1771214585248.png" alt="Additional line item details" caption="Additional line item fields and references." >}}

---

## Financial Processing

- **Payments**: Add/edit payment details for receipt allocation
- **Contras**: Offset balances against other accounts
- **Settlement Adjustments**: Adjust settlements as needed

{{< figure src="/screenshots/internal-receipt-voucher/settlement-tab.png" alt="Settlement tab" caption="Settlement tab for viewing and maintaining settlement entries." >}}
{{< figure src="/screenshots/internal-receipt-voucher/add-settlement-form.png" alt="Add settlement adjustment" caption="Add settlement adjustment form." >}}

---

## Workflow and Approvals

The applet supports a robust approval workflow:
- **Checked By**: Assign employee to check voucher
- **Approved By**: Assign employee for final approval

---

## File Import

**Import Receipt Voucher** enables bulk creation of vouchers:
1. Upload source file
2. Validate and review imported data
3. Resolve errors and finalize

{{< figure src="/screenshots/internal-receipt-voucher/import-upload-master-data.png" alt="Import upload master data" caption="Upload/import setup for master data mapping." >}}
{{< figure src="/screenshots/internal-receipt-voucher/import-checking-tab.png" alt="Import checking tab" caption="Checking tab to validate imported voucher content." >}}
{{< figure src="/screenshots/internal-receipt-voucher/import-main-tab-status.png" alt="Import main tab status" caption="Main tab status to track import processing outcomes." >}}

---

## Settings and Configuration

Configure the applet under **Settings**:
- **Application Settings**: Toggle field visibility, set validation rules
- **Default Selection**: Set default values for faster entry
- **Printable Format Settings**: Customize print layouts
- **Branch Settings**: Define branch-specific settlement rules

---

## Troubleshooting & FAQ

**Cannot save voucher?**
- Check required header fields (branch, company, date, reference, currency)

**Entity/account not selectable?**
- Check master data and user permissions

**Import errors?**
- Review Checking tab and source format mapping

**Settlement mismatch?**
- Review contra/payment lines and settlement adjustments

**Posting discrepancies?**
- Confirm Chart of Account mapping and GL posting status

---

## Related Applets

- **[Customer Applet](/applets/customer-applet/)**: For selecting entities and managing customer details
- **[Chart of Account Applet](/applets/chart-of-account-applet/)**: For defining GL accounts
- **[General Ledger Applet](/applets/general-ledger-applet/)**: For final postings and journals

---

## Summary

The Internal Receipt Voucher Applet delivers a controlled, auditable workflow for internal receipt handling—combining voucher entry, line-item and financial management, settlement tools, and bulk import, with seamless integration into core finance processes.

## Video Walkthrough

Watch this video to see how to use the Internal Receipt Voucher Applet:

{{< youtube tnTYuYGV6J4 >}}

{{< callout type="tip" >}}
If video playback is blocked by browser/network policy, open directly: <https://www.youtube.com/watch?v=tnTYuYGV6J4>
{{< /callout >}}

### What the Video Demonstrates

Based on the walkthrough, the video explains these practical scenarios:

- **Receipt against customer invoices**
  - Create receipt, select branch/customer, record settlement, then offset against sales invoice(s).
  - You can offset manually (choose invoice) or use auto offset behavior.
- **Receipt for other income (no invoice)**
  - Create receipt, choose the payer account, add revenue line with the correct income account, add settlement, then finalize.
- **Sales Credit Note flow (extra discount/rebate)**
  - Create credit note after invoice issuance, add discount line, then offset against the related sales invoice.
- **Sales Debit Note flow (extra charge such as delivery)**
  - Create debit note with account and line amount, then offset later together with receipt/invoice flows.
- **E-Invoice options in credit/debit note flow**
  - Choose Individual or Consolidated mode, and fill related reference fields when available.

{{< callout type="warning" >}}
Key control highlighted in the video: always ensure outstanding balance is fully cleared before closure (for example, no remaining AR/AP offset balance).
{{< /callout >}}

## Primary Menus

The applet is organized into the following primary sections:

- **Internal RCT Voucher**
  - The core interface for listing, creating, and editing internal receipt vouchers.
  - Manage line items, payments, contras, and attachments.
- **Import Receipt Voucher**
  - A dedicated tool for bulk importing receipt vouchers from external files.
- **Settlement Adjustment**
  - Manage and view settlement adjustments associated with receipt vouchers.
- **Settings**
  - **System Configuration**: Configure application-wide settings, default selections, printable formats, and branch-specific settlement settings.

## User Roles and Benefits

- Finance Executive / Accountant: creates vouchers, records receipts, and handles corrections.
- Finance Reviewer / Controller: validates settlement and posting readiness before period close.
- Auditor / Compliance Reviewer: reviews voucher history, adjustments, and linked references.

## Key Behaviors and Business Rules

1) Voucher Header and Core Details
- Typical fields: branch, company, location, document number, reference, transaction date, currency, exchange rate.
- Optional operational fields may include shipping, tracking, permit number, and remarks.
- Approval flow support includes Checked By and Approved By.

2) Line Item and Cost Coding
- Add/edit line items and assign dimensions such as segment, project, profit center, and dimension.
- Supports inventory-related controls such as bin and batch selections when applicable.

3) Payment, Contra, and Settlement
- Add/edit payment lines for receipt allocation.
- Maintain contra entries for offset and balancing scenarios.
- Add/edit settlement adjustments when reconciliation corrections are needed.
- For receipt scenarios, contra/offset can be adjusted later if the initial allocation is incorrect.

4) Import Flow
- Use Import Receipt Voucher for higher-volume voucher onboarding.
- Typical lifecycle includes upload/checking/review and final status handling.

5) Shared Listing Behavior
- Grid-based listing with filtering and drill-down editing.
- Two-column workflow support for list/detail navigation.

## Screens and Workflows

### 1. Internal Receipt Voucher Management
The primary workflow revolves around the **Internal Receipt Voucher** menu. Users can:
- **List Vouchers**: View a paginated list of existing vouchers with filtering capabilities.
- **Create/Edit Vouchers**: Enter header details such as Branch, Company, Location, Document Number, Reference, Transaction Date, and Currency.
- **Entity Linking**: Link vouchers to specific Entities, Billing Addresses, Shipping Addresses, and Contacts.

{{< figure src="/screenshots/internal-receipt-voucher/listing.png" alt="Internal Receipt Voucher listing" caption="Internal Receipt Voucher listing view." >}}

{{< figure src="/screenshots/internal-receipt-voucher/main-details.png" alt="Main details form" caption="Main details section for voucher setup." >}}

{{< figure src="/screenshots/internal-receipt-voucher/entity-details.png" alt="Entity details section" caption="Entity details for account and contact linkage." >}}

{{< figure src="/screenshots/internal-receipt-voucher/select-entity.png" alt="Select entity dialog" caption="Select entity workflow for linking account records." >}}

### 2. Line Item Management
For each voucher, users can add detailed line items. This includes:
- **Inventory Details**: Specify items, quantities, and unit prices.
- **Bin & Batch Tracking**: Support for assigning bin numbers and batch numbers where required.
- **Issue Links**: Link line items to related issues or tickets, with support for activity/time logging.
- **Cost Allocation**: Allocate costs to Segments, Projects, Profit Centers, and Dimensions via tree selectors.

{{< figure src="/screenshots/internal-receipt-voucher/image-1771214574661.png" alt="Line item and accounting details" caption="Line item entry and accounting-related details." >}}

{{< figure src="/screenshots/internal-receipt-voucher/image-1771214585248.png" alt="Additional line item details" caption="Additional line item fields and references." >}}

### 3. Financial Processing
- **Payments**: Add and edit payment details directly within the voucher.
- **Contras**: Handle contra entries to offset balances against other accounts.
- **Settlement Adjustments**: Perform adjustments to settlements where necessary.

{{< figure src="/screenshots/internal-receipt-voucher/settlement-tab.png" alt="Settlement tab" caption="Settlement tab for viewing and maintaining settlement entries." >}}

{{< figure src="/screenshots/internal-receipt-voucher/add-settlement-form.png" alt="Add settlement adjustment" caption="Add settlement adjustment form." >}}

### 4. Workflow and Approvals
The applet supports a verification workflow:
- **Checked By**: Assign an employee to check the voucher details.
- **Approved By**: Assign an employee to give final approval.

### 5. File Import
The **Import Receipt Voucher** feature allows for bulk creation of vouchers from external files, streamlining high-volume data entry.

{{< figure src="/screenshots/internal-receipt-voucher/import-listing.png" alt="Import listing" caption="Import Receipt Voucher listing and monitoring view." >}}

{{< figure src="/screenshots/internal-receipt-voucher/import-upload-master-data.png" alt="Import upload master data" caption="Upload/import setup for master data mapping." >}}

{{< figure src="/screenshots/internal-receipt-voucher/import-checking-tab.png" alt="Import checking tab" caption="Checking tab to validate imported voucher content." >}}

{{< figure src="/screenshots/internal-receipt-voucher/import-main-tab-status.png" alt="Import main tab status" caption="Main tab status to track import processing outcomes." >}}

## Settings and Configuration

The applet offers extensive configuration options under the **Settings** menu:

- **Application Settings**: Toggle visibility of specific fields and potential validation rules.
- **Default Selection**: Set default values for common fields to speed up data entry.
- **Printable Format Settings**: Configure how the receipt vouchers appear when printed.
- **Branch Settings**: Define specific settlement behaviors and rules per branch.

## Data Model (Conceptual)

**Receipt Voucher Header**
- **Core**: Document No, Reference, Transaction Date, Branch, Company, Location.
- **Financial**: Currency, Exchange Rate, Group Discount, Credit Terms.
- **Logistics**: Ship Via, Tracking ID, Permit No.
- **Commercial**: Sales Agent, Sales Lead.

**Department / Cost Coding**
- Segment, Dimension, Profit Center, Project.

**Posting Status**
- Journal Status, Inventory Status, Membership Status, Cashbook Status, Tax Status.

## Form Architecture

- Structured form flow for voucher header, line items, and settlement operations.
- Two-column user experience for faster list/detail navigation.
- Role-based access and action visibility based on user permissions.

## Demo Script (Quick Walkthrough)

1) Create Voucher
- Open Internal RCT Voucher and click add.
- Fill main details (branch/company/date/reference/currency).
- Select entity and save draft or final document.

2) Add Financial Details
- Add line items and complete department coding.
- Add payment and contra lines if required.
- Enter settlement adjustment when applicable.

3) Import (Optional)
- Open Import Receipt Voucher.
- Upload the source file and complete checking.
- Review main tab status and resolve any failed rows.

4) Review and Approve
- Set Checked By and Approved By assignments.
- Re-open listing to verify status and traceability.

5) Discount/Charge Adjustment Scenarios (From Video)
- Use **Sales Credit Note** when giving additional discount/rebate after invoice creation.
- Use **Sales Debit Note** when charging additional amount (for example delivery charges).
- Offset the related documents and confirm there is no remaining open balance.

## Troubleshooting

- Cannot save voucher: verify required header fields (branch/company/date/reference/currency) are complete.
- Entity or account not selectable: check master data availability and user permissions.
- Import errors: inspect Checking tab details and validate source format mapping.
- Settlement mismatch: review contra/payment lines and settlement adjustment entries.
- Posting discrepancies: confirm Chart of Account mapping and downstream GL posting status.

## Technical Architecture

The applet is designed for scalable enterprise operations:
- Supports a split-view interface for efficient listing and editing.
- Applies permission-based behavior for secure access to actions.
- Organizes voucher, import, settlement, and settings features in dedicated work areas.

## Related Applets

The Internal Receipt Voucher Applet interacts with several other core modules:

- **[Customer Applet](/applets/customer-applet/)**: For selecting entities and managing customer billing/shipping details.
- **[Chart of Account Applet](/applets/chart-of-account-applet/)**: For defining the underlying GL accounts used in vouchers and contras.
- **[General Ledger Applet](/applets/general-ledger-applet/)**: Where the final financial postings and journals from receipt vouchers are recorded.

## Summary

The Internal Receipt Voucher Applet provides a controlled, auditable workflow for internal receipt handling. It combines voucher entry, line-item and financial detail management, settlement correction tools, and bulk import support in one applet, with clear integration into customer, chart of account, and general ledger processes.


