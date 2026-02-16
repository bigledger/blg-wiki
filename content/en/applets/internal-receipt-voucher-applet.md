---
title: "Internal Receipt Voucher Applet v2"
description: "Manage internal receipt vouchers, including line items, payments, contras, settlement adjustments, and bulk imports."
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

 The Internal Receipt Voucher Applet is a comprehensive tool designated for managing internal receipt transactions within the ERP system. It facilitates the end-to-end lifecycle of a receipt voucher, from creation and line item management to payment processing, contra handling, and settlement adjustments. It serves as a central hub for recording internal cash inflows, tracking associated documents, and ensuring proper financial coding across branches, projects, and profit centers.

{{< callout type="info" >}}
This applet supports complex financial workflows including multi-currency transactions, bin/batch tracking for inventory-related items, and multi-level approval processes (Checked By / Approved By).
{{< /callout >}}

## Video Walkthrough

Watch this video to see how to use the Internal Receipt Voucher Applet:

{{< youtube tnTYuYGV6J4 >}}

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

Menu structure and routing definitions can be found in `src/app/models/menu-items.ts` and `src/app/app.routing.ts`.

## Key Features and workflows

### 1. Internal Receipt Voucher Management
The primary workflow revolves around the **Internal Receipt Voucher** menu. Users can:
- **List Vouchers**: View a paginated list of existing vouchers with filtering capabilities.
- **Create/Edit Vouchers**: Enter header details such as Branch, Company, Location, Document Number, Reference, Transaction Date, and Currency.
- **Entity Linking**: Link vouchers to specific Entities, Billing Addresses, Shipping Addresses, and Contacts.

### 2. Line Item Management
For each voucher, users can add detailed line items. This includes:
- **Inventory Details**: Specify items, quantities, and unit prices.
- **Bin & Batch Tracking**: specialized support for assigning Bin Numbers and Batch Numbers (`LineItemBinNumberListingComponent`, `LineItemBatchNumberListingComponent`).
- **Issue Links**: Link line items to specific issues or tickets, with support for time logging (`IssueLinkEditComponent`, `LogTimeComponent`).
- **Cost Allocation**: Allocate costs to Segments, Projects, Profit Centers, and Dimensions via tree selectors.

### 3. Financial Processing
- **Payments**: Add and edit payment details directly within the voucher (`AddPaymentComponent`, `EditPaymentComponent`).
- **Contras**: Handle contra entries to offset balances against other accounts (`AddContraComponent`).
- **Settlement Adjustments**: Perform adjustments to settlements where necessary (`AddSettlementAdjustmentComponent`).

### 4. Workflow and Approvals
The applet supports a verification workflow:
- **Checked By**: Assign an employee to check the voucher details.
- **Approved By**: Assign an employee to give final approval.

### 5. File Import
The **Import Receipt Voucher** feature allows for bulk creation of vouchers from external files, streamlining high-volume data entry.

## Settings and Configuration

The applet offers extensive configuration options under the **Settings** menu:

- **Application Settings** (`field-settings`): Toggle visibility of specific fields and potential validation rules.
- **Default Selection**: Set default values for common fields to speed up data entry.
- **Printable Format Settings**: Configure how the receipt vouchers appear when printed.
- **Branch Settings**: Define specific settlement behaviors and rules per branch.

## Data Model (Conceptual)

**Internal Receipt Voucher Header** (`IRVMain`)
- **Core**: `docNo`, `reference`, `transactionDate`, `branch`, `company`, `location`.
- **Financial**: `currency`, `currencyRate`, `groupDiscount`, `creditTerms`.
- **Logistics**: `shipVia`, `trackingID`, `permitNo`.
- **Coding**: `salesAgent`, `salesLead`.

**Departmental/Cost Coding** (`IRVDepartment`)
- `segment`, `dimension`, `profitCenter`, `project`.

**Status Flags** (`IRVPosting`)
- `journalStatus`, `inventoryStatus`, `membershipStatus`, `cashbookStatus`, `taxStatus`.

## Technical Architecture

The applet is built using a Micro-Frontend architecture with Angular.
- **State Management**: Uses NgRx for state management (e.g., `ColumnViewModelStates`, `SessionStates`).
- **UI Layout**: Utilizes a flexible column layout system (`ViewColumnFacade`) supporting split-views (List + Detail/Create).
- **Services**: Dedicated services for each functional area (e.g., `InternalReceiptVoucherPagesService`, `SettlementAdjustmentService`) manage the view stacks and business logic.

## Related Applets

The Internal Receipt Voucher Applet interacts with several other core modules:

- **[Customer Applet](/applets/customer-applet/)**: For selecting entities and managing customer billing/shipping details.
- **[Chart of Account Applet](/applets/chart-of-account-applet/)**: For defining the underlying GL accounts used in vouchers and contras.
- **[General Ledger Applet](/applets/general-ledger-applet/)**: Where the final financial postings and journals from receipt vouchers are recorded.

