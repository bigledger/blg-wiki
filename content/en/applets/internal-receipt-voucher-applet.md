---
title: "Internal Receipt Voucher Applet"
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

### Introduction

The Internal Receipt Voucher Applet is a comprehensive financial tool designed to streamline the management of internal receipt transactions within your ERP system. It serves as a central hub for recording cash inflows, tracking associated documents, and ensuring financial accuracy across your organization's branches and profit centers.

With this applet, finance teams can handle the entire lifecycle of a receipt voucher—from initial creation and line item entry to payment processing, contra handling, and final settlement. It eliminates manual tracking errors and provides a unified workspace for all receipt-related activities.

---

### Core Capabilities

**Voucher Management & Listing**

The applet provides a powerful dashboard to list and manage all internal receipt vouchers. Users can easily search, filter, and sort vouchers by status (Draft, Final, Void), document number, or date. Key actions like Printing, Finalizing, Discarding, and Voiding vouchers are accessible directly from the main listing, ensuring quick processing of daily transactions.

![Internal Receipt Voucher Listing](/screenshots/internal-receipt-voucher/listing.png)

**Detailed Voucher Creation**

Creating a receipt voucher is a structured process divided into logical tabs to ensure data integrity:
- **Main Details**: Capture essential header information such as Branch, Location, Transaction Date, and Currency. This section also supports multi-level approval workflows (Checked By / Approved By).
- **Account**: Link the voucher to specific Entities (Customers/Payees). You can manage complex billing and shipping addresses, ensuring the receipt is attributed to the correct party.

![Edit Voucher Main Details](/screenshots/internal-receipt-voucher/main-details.png)

**Comprehensive Financial Processing**

The applet goes beyond simple data entry by integrating robust financial processing tools:
- **Revenue & Expenses**: Record detailed line items for products or services (Revenue) or operational costs (Expenses).
- **Settlement**: Manage payments directly within the voucher. You can add multiple settlement methods (e.g., Cash, Bank Transfer) and track the total settlement amount against the voucher value.
- **Settlement Adjustment**: Handle discrepancies or adjustments to settlements, ensuring your ledger always balances.

![Edit Voucher Settlement](/screenshots/internal-receipt-voucher/settlement.png)

---

### User Guide: Creating a Receipt Voucher

Follow this step-by-step flow to create and finalize a new Internal Receipt Voucher.

#### 1. Initialize the Voucher
Navigate to the **Internal RCT Voucher** menu and click the **+ (Add)** button. You will be taken to the creation screen.

#### 2. Enter Main Details
In the **Main Details** tab, fill in the required fields:
- **Branch & Location**: Select the issuing branch.
- **Transaction Date**: The date of the receipt.
- **Currency**: The currency of the transaction (defaults to the system base currency).
- **Workflow**: If your organization requires it, assign a "Checked By" and "Approved By" user.

#### 3. Assign an Entity (Account)
Switch to the **Account** tab to link the voucher to a payer.
- Click **Select Entity** to open the search dialog.
- Search for the customer or payee by name or code.
- Once selected, their details (Address, Contact Info, GL Code) will auto-populate.

![Select Entity](/screenshots/internal-receipt-voucher/select-entity.png)

![Entity Details](/screenshots/internal-receipt-voucher/entity-details.png)

Use **Select Payee Entity** to assign the final payee profile when required by your workflow.

![Payee Entity Details](/screenshots/internal-receipt-voucher/payee-entity.png)

Use **Select Shipping Entity** when shipping/contact details need to differ from the main entity.

![Select Shipping Entity](/screenshots/internal-receipt-voucher/select-shipping-entity.png)

#### 4. Add Line Items (Revenue/Expenses)
Go to the **Revenue** tab (for income) or **Expenses** tab (for costs).
- Click **Add Item**.
- Select the relevant item or service code.
- Enter the Quantity and Unit Price.
- Assign Cost Centers (Project, Segment) if necessary for departmental tracking.

#### 5. Record Settlement
Move to the **Settlement** tab to record how the money was received.
- Click the **+** button to add a settlement.
- **Settlement Method**: Choose the method (e.g., Bank Transfer, Cash, Cheque).
- **Amount**: Enter the amount received.
- **Reference**: Add a transaction reference number (e.g., Bank Ref No).
- Click **Add** to save the settlement.

![Settlement Tab Overview](/screenshots/internal-receipt-voucher/settlement-tab.png)

![Add Settlement](/screenshots/internal-receipt-voucher/add-settlement.png)

![Add Settlement Form](/screenshots/internal-receipt-voucher/add-settlement-form.png)

#### 6. Finalize
Once all details are verified:
- Click **Save** to keep it as a Draft.
- Click **Final** to post the voucher to the ledger. This action will generate the GL entries and lock the voucher from further editing.

---

### User Guide: Import Receipt Voucher (Bulk Upload)

Use **Import Receipt Voucher** when you need to upload many receipt vouchers from a CSV file in one process.

#### 1. Open Import Screen
Navigate to **Import Receipt Voucher** from the left menu, then click **+ (Add)** to start a new import batch.

![Import Listing](/screenshots/internal-receipt-voucher/import-listing.png)

#### 2. Upload File
In **Upload Master Data**:
- Select the file delimiter (for example, `COMMA`).
- Drag and drop the file or click **Upload File**.
- Optionally download or follow the sample format link before upload.

![Upload Master Data](/screenshots/internal-receipt-voucher/import-upload-master-data.png)

#### 3. Validate in Checking Tab
After upload, open the **Checking** tab to review validation results by row and column (for example, branch code errors or missing mandatory values).

![Import Checking Tab](/screenshots/internal-receipt-voucher/import-checking-tab.png)

#### 4. Review Import Status
In the **Main** tab, check processing details such as:
- File Name and File Size
- Import Format
- Process Status (`DONE`, `FAILED`, `VALIDATING_DATA`, or `UNPROCESSED`)
- Error Message (when available)

![Import Main Tab Status](/screenshots/internal-receipt-voucher/import-main-tab-status.png)

#### 5. Troubleshoot Failed Batches
If a batch shows **FAILED**:
- Open the batch from the import listing.
- Read the error message and review invalid rows in **Checking**.
- Correct the source CSV and upload a new batch.

---

### Settings & Configuration

The **Settings** menu allows administrators to tailor the applet to organizational needs:
- **Application Settings**: Toggle the visibility of specific fields (e.g., Permit No, Tracking ID) to simplify the UI for users.
- **Default Selection**: Set default values for frequently used fields like "Currency" or "Payment Terms" to speed up data entry.
- **Branch Settings**: Configure how settlements behave for specific branches.

### Related Applets

To fully utilize the Internal Receipt Voucher Applet, familiarity with these related modules is recommended:
- **[Customer Applet](/applets/customer-applet/)**: For managing customer entities.
- **[Chart of Account Applet](/applets/chart-of-account-applet/)**: For GL account definitions.
- **[General Ledger Applet](/applets/general-ledger-applet/)**: For viewing the financial impact of your vouchers.
- **[Accounts Receivable Applet](/applets/accounts-receivable-applet/)**: For managing outstanding customer debt.
- **[Cashbook Applet](/applets/cashbook-applet/)**: For bank reconciliation.
