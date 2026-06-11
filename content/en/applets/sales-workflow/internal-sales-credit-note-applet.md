---
title: "Sales Credit Note (Internal) Applet"
description: "Correct, adjust, or reverse previously issued sales invoices using account code items, with contra and settlement support"
tags:
- sales-workflow
- credit-note
- accounts-receivable
- financial-adjustment
- contra-settlement
---

## Purpose and Overview

The **Internal Sales Credit Note Applet** is used to **correct, adjust, or reverse previously issued sales invoices**. It provides a controlled and auditable way to manage sales corrections and receivable adjustments, ensuring accurate financial reporting and clean audit trails.

Common use cases include:

- Incorrect pricing or billing amounts
- Returned goods or service reversals
- Sales discounts issued after invoicing
- Marketplace fees or post-sales adjustments (e.g. Shopee, Lazada)

{{< callout type="info" >}}
**Core Concept**: A Sales Credit Note **reduces the customer's outstanding balance** either by **Contra** (offsetting against existing or future invoices) or **Settlement** (where actual cash movement occurs). Credit Notes do **not** affect inventory quantities — they are purely accounting adjustments posted to the General Ledger (GL).
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Finance & Accounts Receivable Teams:**
- **Accurate Adjustments**: Post credit notes directly to GL accounts with full traceability
- **Contra Management**: Offset credit notes against open invoices without cash movement
- **Settlement Tracking**: Record actual refunds and cash movements linked to credit notes
- **Audit Trail**: Maintain complete history of all credit adjustments for compliance

**Sales & Customer Service Teams:**
- **Quick Corrections**: Issue credit notes for pricing errors or post-invoice discounts
- **Customer Satisfaction**: Process returns and service reversals efficiently
- **Marketplace Reconciliation**: Handle platform fees and adjustments (Shopee, Lazada, etc.)

**Operations & Management:**
- **Bulk Processing**: Import credit notes in bulk for high-volume adjustments
- **Status Control**: Manage document lifecycle from Draft to Final with proper approval workflows
- **Financial Reporting**: Ensure credit adjustments are accurately reflected in financial statements

### What Problems Does This Solve?

**The Post-Invoice Adjustment Challenge:**

After an invoice is finalized, corrections cannot be made directly to the original document. Common scenarios include:

- Customer was overbilled due to pricing errors
- Goods were returned after invoicing
- Marketplace deducted commission fees not reflected in the original invoice
- Contractual discounts need to be applied retroactively

**The Internal Sales Credit Note Solution:**

- **GL-Direct Posting** — Credit notes use Account Code Type items that post directly to General Ledger accounts
- **Contra & Settlement** — Two distinct methods to handle credit: bookkeeping offset or actual cash refund
- **Non-Inventory** — Purely financial adjustments that do not affect stock quantities
- **Full Lifecycle** — Draft, Final, Void, and Discard statuses with proper accounting controls
- **Bulk Import** — Template-based import for high-volume credit processing

## Key Features Inventory

{{< cards >}}
  {{< card title="Credit Note Creation" subtitle="Create credit notes with account code items for GL-direct posting" link="#quick-start-guide" >}}

  {{< card title="Contra Handling" subtitle="Offset credit notes against existing or future customer invoices" link="#contra-handling" >}}

  {{< card title="Settlement Processing" subtitle="Record actual cash refunds linked to bank and cashbook modules" link="#settlement-processing" >}}

  {{< card title="Bulk Import" subtitle="Import credit notes in bulk using downloadable templates" link="#importing-sales-credit-notes" >}}
{{< /cards >}}

## Key Concepts

### Contra vs Settlement

Understanding the difference between Contra and Settlement is essential for correct accounting treatment.

| Aspect | Contra | Settlement |
|--------|--------|------------|
| **Purpose** | Offset against existing/future invoices | Record actual cash movement |
| **Cash Movement** | No | Yes |
| **Use Case** | Overbilling corrections, credits applied to next invoice | Cash/bank refund, credit card refund, marketplace payout |
| **Integration** | Internal document linking | Cashbook / Bank modules |
| **When to Use** | Non-cash adjustments | When real financial transactions occur |

### Account Code Items

Credit Notes use **Account Code Type** items rather than inventory items. These items:

- Post **directly to GL accounts** (e.g. Sales Revenue Adjustment, Discount Given)
- Are **non-inventory** — they do not affect stock quantities
- Must be created and linked to the correct GL code before use

Common Account Code Items include:
- Sales Discount
- Marketplace Commission Fee
- Service Reversal
- Administrative Charge

### Document Statuses

Each Sales Credit Note follows a defined lifecycle:

| Status | Description | Accounting Impact |
|--------|-------------|-------------------|
| **Draft** | Editable, work in progress | None |
| **Final** | Posted to GL, locked for editing | Debits GL account, Credits Trade Debtors |
| **Void** | Reverses a finalized document | Reverses original posting |
| **Discard** | Cancelled before posting | None |

{{< callout type="warning" >}}
Only **Final** documents affect financial reports. Ensure GL mappings are verified before finalizing.
{{< /callout >}}

### Accounting Logic (Debit / Credit)

When a Sales Credit Note is **Finalized**, the system posts:

| Entry | Account |
|-------|---------|
| **Debit** | GL account linked to the Account Code Item |
| **Credit** | Trade Debtors (Customer Account) |

This reduces customer receivables and adjusts the corresponding revenue or expense accounts. All entries are fully traceable for audit and reporting.

## Quick Start Guide

### Step 1: Ensure Account Code Items Exist

Before creating a Credit Note, ensure the required **Account Code Type items** are set up. You can create them via:

**Option A — Doc Item Maintenance Applet:**
1. Click **Plus (+)** to create a new item
2. Enter **Item Code** and **Item Name** (e.g. Sales Discount, Marketplace Fee)
3. Set **Item Type** = **Account Code Type**
4. Go to the **Company Linking** tab — select the company and assign the **Default GL Code**
5. Save the item

**Option B — Chart of Account Applet (Recommended):**
1. Open the **Chart of Account Applet**
2. Navigate to **GL Code Create Item**
3. Search for the relevant **GL Category** and select the required **GL Code**
4. Click **Create Item** — the system automatically creates and links the item as an Account Code Type

{{< callout type="tip" >}}
**Best Practice**: Use the Chart of Account Applet method to ensure accurate GL-Item mapping.
{{< /callout >}}

### Step 2: Create a New Credit Note

1. Open the **Internal Sales Credit Note Applet**
2. Click the **Plus (+)** button on the listing screen
3. Fill in the **Main Details Tab** — Branch, Location, Sales Agent, Transaction Date
4. Go to the **Account Tab** — select an existing Customer or create a new one
5. Go to the **Line Tab** — select the Account Code Item and enter the amount

### Step 3: Finalize the Document

1. Review all details for accuracy
2. Change the status from **Draft** to **Final**
3. The system posts the debit/credit entries to the GL

### Step 4: Apply Contra or Settlement (if applicable)

- **Contra**: Go to the Contra Tab to offset against open invoices
- **Settlement**: Record actual cash refunds through the Settlement process

## Feature Deep Dive

### Listing Screen Navigation

The **Listing Screen** provides a centralized view of all Sales Credit Notes with powerful search and filter capabilities.

**Search By:**
- Customer
- Branch
- Sales Agent

**Filter By:**
- Creation Date
- Transaction Date Range
- Posting Status: Draft, Final, Void, Discard

**Common Actions:**
- View transaction details
- Edit Draft documents
- Track posting, contra, and settlement status
- Audit historical credit adjustments

### Credit Note Creation Details

#### Main Details Tab

Configure the transaction header information:

| Field | Description |
|-------|-------------|
| **Branch** | The branch issuing the credit note |
| **Location** | Storage/operational location |
| **Sales Agent** | Agent responsible for the transaction |
| **Transaction Date** | Date of the credit note |
| **Reference Number** | Optional external reference |
| **Remarks / Notes** | Additional notes or justification |
| **Currency** | Transaction currency (Forex supported) |

{{< callout type="info" >}}
Default values may auto-populate based on user personalization settings.
{{< /callout >}}

#### Account Tab

- Select an existing **Customer**, or click **Plus (+)** to create a new customer on the fly
- The selected customer controls available Contra and Settlement options

#### Line Tab

1. Select the **Account Code Item** (must be Account Code Type)
2. Enter the **Amount**
3. Add optional **Line Remarks**

Examples of line items:
- Marketplace commission fee
- Post-invoice discount
- Service or billing adjustment

### Contra Handling

Contra is used to offset the credit note against **existing or future invoices** without any cash movement.

**Steps:**
1. Go to the **Contra Tab**
2. Click **Plus (+)**
3. The system displays open invoices for the **same customer and branch**
4. Enter the contra amount
5. Click **Add**

**Typical Use Cases:**
- Overbilling corrections
- Credit applied to next invoice
- Internal accounting adjustments

### Settlement Processing

Settlement is used when **actual money is exchanged** as part of the credit note.

**Examples:**
- Cash or bank refund
- Credit card refund
- Marketplace payout after deducting fees

**Behavior:**
- Integrated with **Cashbook / Bank modules**
- Updates payment and reconciliation records
- Creates corresponding bank transaction entries

{{< callout type="warning" >}}
Use Settlement **only** when real financial transactions occur. For bookkeeping offsets, use Contra instead.
{{< /callout >}}

### Importing Sales Credit Notes

For high-volume credit processing, the applet supports bulk import:

1. Download the **Sales Credit Note Import Template**
2. Fill in required fields offline
3. Upload the completed file to create records in bulk

**Recommended For:**
- Marketplace adjustments (monthly reconciliation)
- Bulk discount processing
- High-volume credit operations

## Configuration & Settings

### App Settings

Administrators can configure the following options:

| Setting | Description |
|---------|-------------|
| Field Visibility | Show or hide specific fields (e.g. Settlement Date) |
| User Permissions | Control who can edit settlement details |
| Posting Restrictions | Define workflow rules for posting and approval |

### Personalization

Users can define personal defaults to reduce manual input:

| Setting | Description |
|---------|-------------|
| Default Branch | Pre-fill the branch field on new credit notes |
| Default Location | Pre-fill the location field on new credit notes |

## FAQ

{{< callout type="info" title="Can I use inventory items in a Sales Credit Note?" >}}
No. Sales Credit Notes use **Account Code Type** items only. These post directly to GL accounts and do not affect stock quantities. If you need to adjust inventory, use the appropriate inventory adjustment applet instead.
{{< /callout >}}

{{< callout type="info" title="When should I use Contra vs Settlement?" >}}
Use **Contra** for non-cash adjustments where you want to offset the credit against existing or future invoices. Use **Settlement** only when actual money changes hands (e.g. bank refund, credit card refund). Most internal adjustments should use Contra.
{{< /callout >}}

{{< callout type="info" title="Can I void a finalized Credit Note?" >}}
Yes. Changing the status to **Void** reverses the accounting entries posted during finalization. The original document remains in the system for audit purposes.
{{< /callout >}}

{{< callout type="info" title="Does a Credit Note affect inventory?" >}}
No. Sales Credit Notes are purely accounting adjustments. They reduce customer receivables and adjust GL accounts but do not change stock quantities.
{{< /callout >}}

{{< callout type="info" title="Can I create Credit Notes in foreign currency?" >}}
Yes. Forex transactions are supported, subject to system configuration. The currency can be set in the Main Details Tab during creation.
{{< /callout >}}

## Applet Reference

### Menu Items

| Action | Description |
|--------|-------------|
| **Create (+)** | Create a new Sales Credit Note |
| **Search** | Search by Customer, Branch, or Sales Agent |
| **Filter** | Filter by date range and posting status |
| **Import** | Bulk import credit notes via template |
| **Export** | Export credit note data |

### Settings

| Setting | Description |
|---------|-------------|
| Field Visibility | Configure visible fields on forms |
| User Permissions | Control access to settlement editing |
| Posting Restrictions | Define approval and posting workflows |

### Personalization

| Setting | Description |
|---------|-------------|
| Default Branch | Auto-fill branch on new documents |
| Default Location | Auto-fill location on new documents |

## Summary

The **Internal Sales Credit Note Applet** provides a controlled and auditable way to manage sales corrections and receivable adjustments. Key takeaways:

- **Account Code Items** are required — credit notes post directly to GL, not inventory
- **Contra** for non-cash offsets, **Settlement** for actual refunds
- **Draft to Final** lifecycle ensures proper review before GL posting
- **Bulk Import** available for high-volume processing
- **Full audit trail** for compliance and financial reporting

{{< callout type="tip" >}}
**Best Practice**: Always verify GL mappings before finalizing. Prefer Contra for non-cash adjustments and reserve Settlement for actual money movements.
{{< /callout >}}
