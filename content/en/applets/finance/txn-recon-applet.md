---
title: "Transaction Reconciliation Applet"
description: "Verify and reconcile payment gateway statements against internal system records, manage transaction disputes, and maintain synchronized cash records."
tags:
- finance
- reconciliation
- audit-trail
- payment-gateways
- financial-control
weight: 100
---

## Purpose and Overview

The **Transaction Reconciliation Applet** is a core financial control tool designed to verify that electronic payments in your system perfectly match the external statements from your payment gateways (e.g., iPay88, GoPay). It acts as a specialized auditor, ensuring that every cent recorded by your POS or sales team has actually been received by the merchant provider.

### TL;DR: The Core Concept

Think of this applet as a digital "Spot the Difference" game between two lists:

*   **List A (Your System)**: What your POS or Sales applet says should have been paid.
*   **List B (The Bank/Gateway)**: What the payment gateway actually deposited into your account.

When they match, you are safe. When they don't, you have a **Dispute** that needs investigation before you lose revenue.

### When is this Applet used?

This applet is essential for businesses processing high volumes of non-cash transactions:

*   **Daily Payment Verification**: Reconciling yesterday’s credit card or e-wallet sales against the gateway's settlement report to ensure zero "leakage."
*   **Gateway Settlement Audits**: Verifying that the net funds settled into your bank account match the gross sales minus the gateway's transaction fees.
*   **Dispute Investigation**: Pinpointing transactions where a customer was charged but no sale was recorded in your POS, or vice versa.
*   **Hardware/Network Failure Recovery**: Detecting missing transactions caused by internet outages during the payment authorization process.

{{< callout type="info" >}}
**Core Concept**: This applet compares your **System Transaction Log** (Internal Truth) with your **Payment Channel Statement** (External Truth). Mismatches are flagged as **Disputes** for immediate investigation.
{{< /callout >}}

### Why is this Important in Accounting?

Reconciliation is the bedrock of financial integrity. This applet supports several critical accounting objectives:

*   **Valuation & Allocation (Existence)**: It proves that the "Accounts Receivable - Gateway" on your balance sheet is backed by real, verified transactions. It satisfies the audit assertion of **Existence**.
*   **Revenue Assurance**: By detecting "System Txn Log Disputes," it prevents revenue loss from sales that were recorded internally but never actually processed or paid by the gateway.
*   **Cash Control & Security**: It serves as a deterrent against internal fraud, ensuring that staff cannot manipulate sales records without being caught during the reconciliation process.
*   **Fee Transparency**: It allows the Finance team to verify that the gateway is charging the correct commission rates as per your service agreement.

### What is the Transaction Reconciliation Applet? (Explained Simply)

Imagine your shop processes 500 Credit Card sales in a single day.
1. Your POS system shows the total as **RM 25,000**.
2. The bank sends you a statement saying they only processed **RM 24,800**.

**Where is the missing RM 200?**
The Transaction Reconciliation Applet allows you to upload that bank statement and automatically pinpoint the specific transactions that are missing or mismatched. It eliminates the need for manual spreadsheet comparisons, saving hours of accounting work.

### Relationship to Other Applets

This applet sits between your sales operations and your final bookkeeping:
- **POS / Sales Applets**: These systems generate the "System Transaction Logs" that serve as the internal truth.
- **Bank Reconciliation Applet**: While this applet focuses on *gateways* (iPay88, etc.), the Bank Recon applet focuses on final current account settlement.
- **General Ledger Applet**: Once reconciliation is completed and verified, it ensures the balances in your GL for "Gateway Receivables" are accurate and audit-ready.

## Key Features Overview

### Who Benefits from This Applet?

**Finance & Accounts Teams:**
- Automate the reconciliation of high-volume payment gateway statements
- Maintain a clear status of payment channel health (Processing, Reviewed, Approved)
- Rapidly identify and resolve cash-in-hand discrepancies

**Internal Auditors:**
- Access a complete digital history of every reconciliation ever performed
- Verify that "Disputes" are being followed up on and resolved
- Ensure that the "System Log" for a period perfectly matches the bank's reality

**Operational Managers & HODs:**
- Approve completed reconciliation statements through specialized workflows
- Verify the accuracy of branch-level cash management
- Resolve disputes arising from failed gateway transactions or hardware errors

### What Problems Does This Solve?

**The "High-Volume Nightmare" Problem:**
Manually checking 10,000 transaction IDs against a PDF statement is impossible to do accurately. This applet takes a 10,000-line CSV and reconciles it in seconds.

**The "Missing Settlement" Revenue Leak:**
Payment gateways occasionally fail to settle a transaction, or a staff member might accidentally record a "Credit Card" sale that was actually "Cash." This applet flags these errors immediately so they can be fixed before the books are closed.

**Unresolved Disputes:**
Mismatches are often forgotten if they aren't tracked. By categorizing mismatches as "System Txn Log Disputes" or "PC Txn Disputes," the applet ensures they stay visible until they are resolved.

## Key Features Overview

{{< cards >}}
  {{< card title="Statement Upload" subtitle="Support for iPay88, GoPay, 7E, and more" link="#upload-statement-tab" >}}

  {{< card title="Auto Matching" subtitle="One-click reconciliation based on intelligent ID matching" link="#for-accountants-performing-auto-matching" >}}

  {{< card title="Manual Matching" subtitle="Granular human-verified matching for complex items" link="#manual-matching-tab" >}}

  {{< card title="Dispute Reports" subtitle="Dedicated tracking for system vs. channel mismatches" link="#report-tab" >}}

  {{< card title="Workflow Statuses" subtitle="From 'Processing' to 'Reviewed and Approved'" link="#document-lifecycle" >}}

  {{< card title="Company Scoping" subtitle="Manage recons by specific business unit and branch" link="#configuration--settings" >}}
{{< /cards >}}

{{< figure src="/images/txn-recon-applet/transaction-reconciliation-applet-overview-infographic.png" alt="Transaction Reconciliation Applet Overview: Problems, Solution, and Benefits" caption="Transaction Reconciliation Overview: Moving from high-volume manual matching and revenue leaks (The Problems) to intelligent auto-matching and real-time dispute reporting (The Solution) for Accountants, Auditors, and Finance Directors (Who Benefits)." >}}

## Key Concepts

### Reconciliation Workflow

Reconciliation in this applet follows a structured three-step process:
1.  **Preparation**: Uploading the external statement and defining the opening/closing context.
2.  **Matching**: Running the Auto-Matching engine and manually pairing any leftovers.
3.  **Approval**: Moving the document from "Processing" to "Reviewed and Approved" after verifying disputes.

### Document Lifecycle

Reconciliation statements move through the following statuses to ensure accountability:

| Status | What It Means |
|--------|---------------|
| **Processing** | The initial data entry and matching phase. |
| **Ready for review** | Matching is complete; the Finance Officer is ready for an HOD to check the work. |
| **Pending amendment** | An approver found an error and sent it back for correction. |
| **Approved by HOD** | Head of Department has verified the reconciliation. |
| **Reviewed and Approved** | Finalized and locked status. |

## Quick Start Guide

### For Accountants: Performing Auto-Matching

**Goal:** Quickly reconcile a Month-End iPay88 statement.

1.  **Navigate**: Go to **Payment Channel** > **Add (+)**.
2.  **Define Context**:
    - Select your **Company** and **Branch**.
    - Click the search icon next to **Payment Channel System Log** to link to your internal records.
    - Enter the **Opening/Closing Dates** and **Balances** from your iPay88 portal.
3.  **Upload**: Click the **Upload Statement** tab.
    - Choose your **Import Format** (e.g., `IPay88`).
    - Drag your CSV file into the **File Uploader**.
4.  **Match**: Click the **Auto Matching** button at the top right.
5.  **Review**: Check the results. Matched records are hidden from the pending lists; mismatches move to the **Report** tab.

---

### For Managers: Authorizing a Reconciliation

**Goal:** Verify a Finance Officer's work and approve the statement.

1.  **Open Statement**: Look for documents in the listing with the status **Ready for review**.
2.  **Verify Totals**: Confirm the recorded **Closing Balance** in the applet matches the physical bank statement.
3.  **Review Disputes**: Go to the **Report** tab and look at the "System Txn Log Dispute" list. Ask: *"Why did we record these 5 sales if the bank says they never received money?"*
4.  **Confirm**: If everything is reconciled or explained, change the status to **Approved by HOD**.

---

### For Admins: Applet Configuration

**Goal:** Set up the legal entities and permissions.

1.  **Create Company**: Go to **Company** > **Create Company**. Fill in the mandatory **Company Code**, **Registration No**, and **Currency**.
2.  **Configure Formats**: Ensure your payment gateway's CSV format matches the selection in the "Upload Statement" tab.
3.  **Permissions**: Use **Settings > Permission Set Listing** to grant users access to "Auto Matching" or "Reconcile" buttons.

---

## Document Tabs Overview

The Transaction Recon Applet organizes the workflow into four primary tabs. Use these tabs to move from initial data entry to final approval.

#### Deep Dive: Details Tab

**Concept: Defining the Audit Scoping.**
This tab sets the legal and temporal boundaries for the reconciliation. You are defining exactly **"Who"** is being reconciled and **"When"** the transaction window occurred.

*   **Company & Branch**: Selects the legal entity and physical cost center. This ensures that the reconciliation is scoped to the correct sub-ledger.
*   **Payment Channel System Log**: You select the specific internal data stream (e.g., "Main Terminal iPay88"). This tells the system which internal records to pull for comparison.
*   **Opening/Closing Balance**: You input the starting and ending totals from your gateway portal. These are the **Control Totals** that the system must match to ensure a "balanced" reconciliation.
*   **Status**: Manages the **Financial Approval Cycle**. Moving a document from *Processing* to *Approved by HOD* locks the audit trail and signals that the reconciliation is verified.

#### Deep Dive: Upload Statement Tab

**Concept: Importing External Evidence.**
This tab is where the "External Truth" enters the system.

*   **Import Format**: You select the gateway type (e.g., iPay88, 7-Eleven). This tells the system how to read the columns in your CSV file, ensuring that **Transaction IDs** and **Amounts** are mapped correctly for auto-matching.
*   **File Uploader**: The portal for your gateway statement. This file serves as the **Primary Audit Evidence**.
*   **PC Statement Name**: A descriptive label for the file, used to simplify future audit lookups.

---

#### Deep Dive: Manual Matching Tab

**Concept: Resolving Mismatched Logic.**
Even with Auto-Matching (which uses Transaction ID + Amount), some items require human intervention. This tab is the workspace for **Manual Verification**.

*   **System Txn Log (Pending)**: Shows internal transactions that haven't been seen by the bank yet. Use this to identify **Missing Settlements**.
*   **Payment Channel Txn (Pending)**: Shows statement lines that haven't been linked to a sale. These often signify **Unrecorded Revenue**.
*   **Match Action**: Allows you to pair records manually. This is used when the "Substance" is the same but the "Form" (like the ID string) differs slightly between systems.

#### Deep Dive: Report Tab

**Concept: Dispute Accountability.**
Anything appearing in this tab represents a breakdown in the financial chain. This is the **Management Exception Report**.

*   **System Txn Log Dispute**: Lists internal sales with no bank record. This is a **Revenue Leak** risk.
*   **Payment Channel Txn Dispute**: Lists money in the bank with no internal sale record. This is an **Accounting Completeness** risk.
*   **Reconcile Button**: Once you have investigated and fixed the error (e.g., by recording the missing sale), you use this button to "clear" the dispute and finalize the record.

---

## Configuration & Settings

### Company Profile (`Company > Create/Edit`)
The Transaction Recon applet requires a properly configured Company profile to maintain legal and financial compliance.

| Section | Mandatory Fields | Purpose |
|---------|------------------|---------|
| **Details** | Code, Name, Registration No, Currency | Defines the legal identity of the reconciler. |
| **Address** | City, Country, State | Used for generating formal reconciliation reports. |
| **Contact** | Phone, Email, Website | Internal references for audit follow-ups. |

### System Settings (`Settings`)
- **Permission Set Listing**: Controls who can perform sensitive actions like deleting a statement log or approving a reconciliation.
- **Organisation Constants**: Defines the underlying codes used for Business Registration Numbers and Contact Info mapping across the ERP.

---

## FAQ

**Q: What is "Auto Matching" and how does it work?**  
**A:** Auto-Matching is an intelligent engine that looks at your uploaded statement and your internal logs. It automatically pairs them if the **Transaction ID** and **Amount** are identical. This usually resolves 90-95% of your records instantly.

**Q: Why do some transactions show as "Disputes"?**  
**A:** A dispute occurs when there is a one-sided entry. Either your system says you received money and the bank doesn't show it (Missing Funds), or the bank shows money received that you haven't recorded (Unrecorded Sale).

**Q: Can I re-upload a statement if I found an error in the first file?**  
**A:** While in "Processing" status, you can reset the statement and re-upload. However, once the status is moved to "Approved", the data is locked for audit integrity.

**Q: What do I do if I have a "Payment Channel Txn Dispute"?**  
**A:** This usually means a customer paid you, but no one recorded the sale in your POS or Receipt applet. You should find the missing sale, record it, and then the transaction will be ready to match.

**Q: Does this applet support multiple branches?**  
**A:** Yes. You can scope your reconciliation to a specific **Branch** in the Details tab. Each branch can have its own separate reconciliation schedule and HOD approval.

---

## Related Applets

### Bank Reconciliation Applet
**Purpose:** Reconciles high-volume cash and current account bank statements.  
**Relation:** While Transaction Recon focuses on e-wallets/gateways, Bank Recon covers your actual bank accounts.

### General Ledger Applet
**Purpose:** The central bookkeeping record for your entire organization.  
**Relation:** Reconciled data provides "Verified" balances for your gateway receivables in the G/L.

### Internal Receipt Voucher Applet
**Purpose:** Confirms receipt of funds for intercompany or customer transactions.  
**Relation:** Reconciled transactions are often the "Proof of Payment" required to finalize a Receipt Voucher.
