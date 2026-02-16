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
weight: 100
---

## Purpose and Overview

The Internal Receipt Voucher Applet manages internal receipt voucher operations from start to finish. You can create and edit vouchers, maintain line items, add payment and contra details, perform settlement adjustments, and import vouchers in bulk. The applet helps finance teams standardize receipt processing, preserve audit traceability, and keep postings aligned with branch and accounting controls.

{{< callout type="info" >}}
This applet supports complex financial workflows including multi-currency transactions, bin/batch tracking for inventory-related items, and multi-level approval processes (Checked By / Approved By).
{{< /callout >}}

## Video Walkthrough

Watch this video to see how to use the Internal Receipt Voucher Applet:

{{< youtube tnTYuYGV6J4 >}}

{{< callout type="tip" >}}
If video playback is blocked by browser/network policy, open directly: <https://www.youtube.com/watch?v=tnTYuYGV6J4>
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

