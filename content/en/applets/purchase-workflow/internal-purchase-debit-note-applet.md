---
title: "Internal Purchase Debit Note Applet"
description: "Manage incoming intercompany debit adjustments, verify additional charges from internal suppliers, and maintain synchronized payable records across branches."
tags:
- purchase-management
- intercompany
- debit-note
- financial-control
- internal-procurement
weight: 70
---

## Purpose and Overview

The **Internal Purchase Debit Note Applet** is the receiving-side counterpart of the Internal Sales Debit Note. When an internal supplier branch issues a debit note to charge your branch for under-billed goods, services, or additional fees, this applet is where that incoming charge is recorded, reviewed, and managed.

{{< callout type="info" >}}
**Core Concept**: When an internal supplier branch finalizes an Internal Sales Debit Note targeting your branch, the system **automatically creates** a corresponding Internal Purchase Debit Note in this applet. Your branch's **Accounts Payable** increases to reflect the additional amount owed to the supplier branch.
{{< /callout >}}

### What is the Internal Purchase Debit Note Applet? (Explained Simply)

Imagine your company has two branches: **HQ (in Kuala Lumpur)** and **Branch A (in Penang)**.

1. HQ ships laptops to Branch A and originally bills them **RM 5,000**.
2. Later, HQ discovers they forgot to include a **RM 200 delivery fee**.
3. HQ creates an Internal Sales Debit Note for the extra RM 200 and clicks **FINAL**.

**What happens on Branch A's side?**

The system automatically creates an **Internal Purchase Debit Note** worth RM 200 in Branch A's applet. Branch A's finance team can now see:
- *"We owe HQ an extra RM 200 for delivery charges."*
- The document is already linked to HQ's original debit note.
- Branch A's Accounts Payable is updated automatically.

A "Purchase Debit Note" in this context means an **"Incoming Additional Charge"** — your branch is on the receiving end of an upward revision from an internal supplier.

### Relationship to Other Applets

This applet sits at the receiving end of the intercompany debit note workflow:
- **Internal Sales Debit Note Applet (The Origin):** When a supplier branch finalizes a Sales Debit Note targeting your branch, this applet automatically receives the corresponding Purchase Debit Note. They are mirror documents.
- **Internal Purchase Invoice Applet (The Original Transaction):** The debit note typically adjusts a previous internal purchase invoice. You can trace back to see the original transaction that was under-billed.
- **General Ledger (Accounting Core):** Once finalized, the applet posts financial entries to the core accounting system — increasing your branch's expense accounts and payable balances.
- **Approval Workflow Applets:** If the additional charge exceeds certain thresholds, the system uses workflow rules to pause the document and route it to a manager or director for approval before finalization.

## Key Features Overview

### Who Benefits from This Applet?

**Procurement & Operations Teams:**
- Receive and review additional charges from internal supplier branches
- Real-time visibility into document statuses (Draft, Final, Void)
- Verify incoming debit notes against original purchase invoices
- Attach supporting documents and correspondence for audit readiness

**Finance & Accounting Teams:**
- Maintain accurate Accounts Payable balances with auto-synced intercompany entries
- Eliminate manual double-entry — the document arrives pre-populated
- Complete audit trail from auto-creation through finalization
- Accurate cost-center and profit-center tagging via Department Header

**Management & Branch Directors:**
- Oversight of all incoming intercompany adjustments
- Control over spend compliance via approval workflows
- Consolidated view of all additional charges received from internal suppliers
- Data-driven analysis of inter-branch cost patterns

### What Problems Does This Solve?

**The Manual Intercompany Receiving Problem:**

Traditional intercompany adjustment workflows require the receiving branch to manually re-enter charges. Common issues include:
- Forgetting to book the corresponding payable when the supplier branch issues a debit note
- No traceable link between the supplier's debit note and your branch's payable
- Out-of-sync books at month-end — the supplier says you owe RM 500, your records show RM 0
- Missing approval trails for large incoming adjustments
- Delayed month-end closings due to intercompany reconciliation gaps

**The Internal Purchase Debit Note Applet Solution:**

- **Auto-receipt of charges** — When the supplier branch finalizes their Sales Debit Note, your Purchase Debit Note appears automatically
- **Pre-populated data** — No manual re-entry; all line items, amounts, and references arrive intact
- **Intercompany sync** — Both branches stay on the same page in real-time
- **Complete traceability** — Every adjustment links back to the originating supplier branch document
- **Approval workflows** — Configurable routing ensures the right people review incoming charges
- **Error elimination** — No more out-of-balance intercompany accounts at month-end

## Key Features Overview

{{< cards >}}
  {{< card title="Auto-Received Debit Notes" subtitle="Incoming charges arrive pre-populated from internal suppliers" link="#for-procurement--operations-reviewing-incoming-debit-notes" >}}

  {{< card title="Intercompany Sync" subtitle="Mirror documents keep both branches perfectly balanced" link="#intercompany-transaction-flow" >}}

  {{< card title="Approval Workflow" subtitle="Configurable multi-level authorization for incoming charges" link="#for-managers-authorizing-incoming-charges" >}}

  {{< card title="File Import" subtitle="Bulk upload purchase debit note entries" link="#file-imports" >}}

  {{< card title="Document Tabs" subtitle="Main Details, Account, Lines, Payment, and more" link="#document-tabs-overview" >}}

  {{< card title="Audit Trail" subtitle="Full activity log of every document action" link="#audit-trail" >}}

  {{< card title="Export & Print" subtitle="PDF export and configurable print formats" link="#export--print" >}}

  {{< card title="Personalization" subtitle="Save default settings for faster data entry" link="#personalization" >}}
{{< /cards >}}

## Key Concepts

### Intercompany Transaction Flow

When the supplier branch finalizes an Internal Sales Debit Note, the system executes an automated two-sided posting:

```
Supplier Branch (HQ)                         Your Branch (Branch A)
─────────────────────                        ───────────────────────────
Creates & Finalizes Internal                 System AUTO-CREATES Internal
Sales Debit Note (+RM 500)                   Purchase Debit Note (+RM 500)
     │                                            │
     ▼                                            ▼
Accounts Receivable ▲                        Accounts Payable ▲
(HQ is owed +RM 500)                        (Branch A owes +RM 500)
```

{{< callout type="tip" >}}
**Real-World Example**: HQ realizes they under-billed Branch A for inventory by RM 500. HQ issues an Internal Sales Debit Note. Your branch (Branch A) automatically receives an Internal Purchase Debit Note for RM 500 — your payables increase, HQ's receivables increase, and everything stays in sync without double entry.
{{< /callout >}}

### Document Lifecycle

Every Internal Purchase Debit Note follows a predictable lifecycle:

| Status | What It Means | What Happens Next |
|--------|---------------|-------------------|
| **Draft** | Created (manually or auto-generated) but not yet finalized | Edit freely, verify details, add/remove lines |
| **Final** | Locked and posted to the GL | No further edits; payable is officially recorded |
| **Void** | Cancelled after finalization | Reversal GL entries posted; corresponding documents also updated |

## Key Menu Functions

When utilizing this applet, users have access to several key functions to manage their daily workflows:

**1. Purchase Debit Note (Main Listing)**
- The primary workspace. View, create, edit, and manage all purchase debit notes.
- Filter and search by document number, date, status, supplier branch, or amount.
- Create new manual debit notes or review auto-generated ones from intercompany sync.

**2. Line Items**
- A dedicated cross-document view of all individual line items across every purchase debit note.
- Useful for analysis: "How much have we been charged for delivery fees across all debit notes this quarter?"
- Powerful filtering and export capabilities.

**3. File Import**
- Upload a CSV file containing multiple purchase debit note entries at once.
- A massive time-saver for month-end reconciliation if many small items need to be recorded.

**4. Applet Settings**
- Configure branch mappings, default accounts, workflow approval chains, printable formats, and field visibility rules.

**5. Personal Default Settings**
- Save favorite defaults (like preferred branch or currency) to speed up continuous data entry.

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Procurement & Operations: Reviewing Incoming Debit Notes

**Goal:** Review an auto-generated purchase debit note and verify all details.

1. **Navigate**: Go to **Purchase Debit Note** from the sidebar
2. **Find the Document**: Look for new entries in the listing (auto-generated from supplier branch activity)
3. **Open and Verify**: Click on the document to open the edit screen
   - **Main Details**: Confirm the supplier branch, document date, currency, and description
   - **Account**: Verify the supplier entity and billing/shipping addresses
   - **Lines**: Check that item codes, quantities, and amounts match your expectations
   - **Attachments**: Review any supporting documentation uploaded by the supplier branch
4. **Cross-Reference**: Check the **Trace Document** tab to see the originating Internal Sales Debit Note
5. **Finalize or Escalate**:
   - If everything looks correct → Click **FINAL** (or route to manager for approval)
   - If discrepancies exist → Contact the supplier branch for clarification before finalizing

**What happens after finalization?**

```
Draft → Click FINAL → GL entries posted
                     → Accounts Payable updated
                     → Intercompany ledgers balanced
```

You can also **SAVE** changes before finalizing, or **DISCARD** the document if it was created in error.

---

### For Managers: Authorizing Incoming Charges

**Goal:** Review and authorize purchase debit notes before finalization.

1. **Open the Document**: Navigate to the debit note listing and select the document to review
2. **Verify Details**:
   - **Main Details**: Confirm the supplier branch and document description match known business activity
   - **Account**: Check that the correct billing entity is selected
   - **Lines**: Verify item codes, quantities, and amounts are accurate and justified
   - **Attachments**: Review supporting documentation (emails, purchase orders, delivery receipts)
3. **Check Trace Document** *(if visible)*: Confirm the debit note links to the correct upstream Internal Sales Debit Note
4. **Decide**:
   - **Approve / Finalize**: Click **FINAL** → System posts GL entries and updates intercompany balances
   - **Return for Correction**: Inform the team of any discrepancies before finalization
   - **Void** *(if already finalized in error)*: Click **VOID** → Reversal entries are posted

---

### For Admins: Initial System Setup

**Goal:** Configure the applet so your teams can manage incoming internal debit notes.

**Step 1: Configure Branch Settings** (`Settings > Branch Settings`)
- Map internal suppliers for each branch
- Configure branch-specific default accounts
- **Permissions Wizard**: Control user access and permissions within the applet

**Step 2: Configure Default Settings** (`Settings > Default Selection`)
- Set default currency for new documents
- Configure running number format and sequence
- Set default document date behavior

**Step 3: Configure Field Configuration** (`Settings > Application Settings`)
- Control which fields are mandatory, optional, or hidden during document creation
- Configure field-level validation rules

**Step 4: Configure Printable Format** (`Settings > Printable Format Settings`)
- Customize the PDF export layout, company logo, header/footer text, and included fields

**Step 5: Test the Full Flow**
- Have the supplier branch create and finalize an Internal Sales Debit Note targeting your branch
- Verify the corresponding Internal Purchase Debit Note appears automatically in your applet
- Finalize it and verify GL postings are correct on both sides

---

{{< callout type="tip" >}}
**New to the system?** Start with the basics:
1. Operations staff: Open an existing Internal Purchase Debit Note and explore each tab
2. Managers: Practice reviewing and finalizing a test document
3. Admins: Review **Configuration & Settings** below for detailed setup guides
{{< /callout >}}

---

### Document Tabs Overview

When creating or editing a purchase debit note, the screen is organized into tabs (or expandable panels, depending on your display settings). Here is a breakdown of what you do in each tab:

| Tab | What It Is For (In Simple Terms) |
|-----|--------------------------------|
| **Main Details** | The header. You see the supplier branch, document date, currency, debit terms, and description. This is where you record the basic "who, what, when" of the incoming charge. |
| **Account** | Where the bill comes from. It has sub-tabs for Entity Details, Billing Address, Shipping Address, and the Intercompany Sync status. |
| **Lines** | The core of the debit note. This lists the "stuff" you are being charged for (e.g., "Delivery Fee", Qty: 1, Price: RM 200). It contains its own detailed sub-menus for things like Costing Details and Serial Numbers. |
| **Payment** | How it's being paid. For internal transactions, this is often left blank as it's settled via contra, but if a specific intercompany payment method is used, it's recorded here. |
| **Department Hdr** | The accounting tags. Specify which internal department or cost center should bear this expense (e.g., tagging the "IT Support" cost center for a software license charge). |
| **ARAP** | A dashboard showing the current Accounts Receivable / Accounts Payable balances between the branches. A snapshot of "Who owes Who" for this specific document. |
| **Contra** | Offsetting balances. If you owe the supplier branch RM 1,000 from invoices and they owe you RM 500 from another transaction, you can "Contra" (cancel out) debts so no actual cash needs to transfer. |
| **Trace Document** | A visual map showing how this document is connected to others — the originating Internal Sales Debit Note, the GL postings, and any downstream documents. |
| **Doc Link** | Link this purchase debit note to related documents such as delivery orders, job sheets, or purchase orders for complete traceability. |
| **E-Invoice** | For tax compliance (if enabled for your region). Tracks the status of submitting the document to the government tax authority (e.g., LHDN in Malaysia). |
| **Attachments** | Upload supporting proof (PDFs, images) like the original purchase order, email correspondence, or delivery receipts. |
| **Export** | Generate a printable PDF of the Purchase Debit Note. |

#### Deep Dive: Main Details Tab

This tab captures the fundamental information about the incoming debit note. Key fields include:

*   **Supplier / Purchaser:** The internal supplier branch issuing the additional charge.
*   **Document Date & Due Date:** When the charge was issued and when payment is expected.
*   **Currency & Exchange Rates:** Defines the transaction currency. If it differs from the base currency, the system calculates the exchange rate automatically.
*   **Tracking ID & Client Documents (1-5):** Optional reference fields to cross-reference with external systems. For example, if this debit note relates to a logistics shipment, put the logistics provider's tracking number in the "Tracking ID" field.
*   **Debit Terms:** The agreed-upon payment terms (e.g., Net 30). The system automatically calculates the Due Date.
*   **Description / Remarks:** A free-text field to describe why this additional charge exists (e.g., "Additional transport charges for PO-2024-001").

#### Deep Dive: Account Tab

This tab identifies the supplier entity and manages billing/shipping addresses:

*   **Entity Details:** Select or verify the internal supplier (the branch sending the charge). This is typically auto-populated for intercompany-synced documents.
*   **Bill To / Ship To:** Standard fields for billing and shipping addresses. The "Quick Create" toggle lets you create a new entity on the fly without leaving the workflow.
*   **Intercompany Sub-Tab:** The live monitor for intercompany sync. It displays the **Transaction Status** and tracks the originating **Internal Sales Debit Note** from the supplier branch's system.

#### Deep Dive: Lines Tab

This is where you see (and verify) the exact charges:

*   **Item Code & Description:** The specific goods, services, or fees being charged.
*   **Quantity & Unit Price:** The amounts per line item. For account-based entries (non-inventory items), you can enter a direct amount.
*   **Costing & Pricing Details:** View the exact cost metrics for items being charged.
*   **Delivery Details:** A sub-tab to manage shipment-specific information including trip number, driver, vehicle details, and delivery status.
*   **Serial Number (Scan & Import):** If the debit note involves tracked physical inventory, you can scan or bulk-import serial numbers and batches.
*   **Issue Link:** Link a specific line item to an external ticketing system for traceability.

#### Deep Dive: Payment Tab

Record settlement information for this debit note:

1.  Click **ADD** to create a payment entry.
2.  Select a **Settlement Method** (e.g., Cash, Points/Rebate Points, or Corporate Credit Card).
3.  Fill in the details. For credit cards, the system supports Card Type (VISA/MASTERCARD) and Card Expiry fields. For points, it displays the point currency conversion rate.
4.  Enter the exact monetary amount settled and any remarks.

For most internal transactions, this tab remains blank as settlement occurs via **Contra** against other intercompany documents.

#### Deep Dive: Department Hdr Tab

This tab enables precise internal reporting. If HQ charges your branch for something, you want to know *exactly which team* is responsible for the cost:

*   **Segment / G/L Dimension:** Categorize the expense by broader business streams or legal entities.
*   **Profit Centre:** Attribute the transaction to a specific department so their budget absorbs the cost.
*   **Project:** Link the cost to a specific internal initiative (e.g., "Warehouse Relocation 2024").

#### Deep Dive: Contra Tab

**The core concept:** Why transfer real money between bank accounts if you can just call it even?

The Contra tab resolves debts without actually transferring cash. 

**Scenario:**
You owe HQ RM 1,000 from a previous purchase invoice.
Today, HQ charges your branch an additional RM 500 via this Purchase Debit Note.
Instead of wiring RM 500 separately, you can use the **Contra** tab to offset the charge against an outstanding receivable from HQ.

*   **How it works:** The system checks the AR/AP balances of both documents.
*   **Contra Amount & Dates:** It calculates the exact amount to cancel out. You can edit the **Transaction Date** to align with your monthly financial closings.
*   **Reversals:** If a mistake is made, you can delete a finalized Contra entry (requires double-confirmation), automatically restoring the outstanding balances.

#### Deep Dive: ARAP Tab

The ARAP (Accounts Receivable / Accounts Payable) tab is a **read-only financial dashboard** for this specific document. It shows:

*   **Product & Services:** The total monetary value of all line items.
*   **Settlement:** How much has already been paid (via the Payment tab).
*   **Doc Open Amount:** The invoice value minus any initial settlements.
*   **Contra:** How much was canceled out by offsetting against other intercompany documents.
*   **Outstanding:** The final, real-time remaining balance your branch still owes on this specific debit note.

#### Deep Dive: Trace Document Tab

The **Trace Document** tab is your automated audit trail. It shows:

*   **Upstream Documents:** The originating Internal Sales Debit Note from the supplier branch.
*   **Downstream Documents:** Any further documents generated from this purchase debit note.
*   **General Ledger (GL) Postings:** The exact bookkeeping journal entries across sub-tabs:
    *   **Journal Txn:** Core double-entry accounting (Debits and Credits) hitting your Accounts Payable and Expense ledgers.
    *   **Cashbook Txn:** If any immediate payment was made via Settlement, it shows the cash impact.
    *   **Points Txn:** If settlement involved loyalty points or rebates.
    *   **Tax Txn:** The tax portion separated out for government reporting.
    *   **Inv Txn (Inventory):** If this debit note involved physical stock movement.

#### Deep Dive: E-Invoice Tab

If the E-Invoice feature is enabled (e.g., for LHDN compliance in Malaysia), this tab manages the automated tax authority submission process:

*   **Submission Type:** INDIVIDUAL (B2B), CONSOLIDATED (high-volume B2C), or SINGLE-GENERAL.
*   **Tracking & Reference Fields:** Auto-populated document numbers, E-Invoice numbers, and UUIDs from the government tax authority.
*   **Original E-Invoice Links:** Links this adjustment back to the original invoice for tax authority compliance.
*   **Billing Period:** If the debit note relates to a recurring service, define the timeframe here.
*   **Buyer's Info:** Tax identity and address information for government submission.

#### Deep Dive: Attachments Tab

Your permanent filing cabinet for **proof**. Since a purchase debit note represents an additional charge your branch is accepting, auditors may want to see supporting evidence. Upload:
- PDF email approvals from the supplier branch
- Scanned delivery invoices
- Screenshots of correspondence authorizing the additional charge
- Original purchase orders or contracts

#### Deep Dive: Export Tab

The Export tab provides options to reprint or save the active document. Select the desired printable format from the dropdown menu (configured by your administrator). Click **Export as PDF** to generate a formal printable representation for record-keeping or physical sign-offs.

---

## Configuration & Settings

Fine-tune the applet behavior to match your organizational processes. Access all settings from the **Settings** menu in the sidebar. These application-wide options are controlled by admins and affect all users.

### Application Settings (`Settings > Application Settings`)

Control field visibility and validation:
- Make specific fields mandatory or optional
- Hide unused fields to simplify the creation form
- Configure which tabs are visible or hidden in the document interface
- Control button visibility (Final, Void, Discard, Save)

### Default Selection (`Settings > Default Selection`)

Set system-wide defaults:
- Default currency for new documents
- Running number format and sequence (e.g., `IPDN-2024-00100`)
- Default document date behavior

### Printable Format Settings (`Settings > Printable Format Settings`)

Customize PDF exports:
- Company logo and branding
- Header/footer text
- Which fields to display on printed output
- Page size and orientation

### Branch Settings (`Settings > Branch Settings`)

Configure branch-specific behaviors:
- Map internal suppliers per branch
- Set default GL accounts for intercompany transactions
- **Permissions Wizard**: Control user access and permissions within the applet, ensuring that the right people have appropriate levels of document access

---

## Audit Trail

#### Applet Log (`Settings > Applet Log`)

The Applet Log records every action taken within the applet — creates, updates, finalizations, voids, and more. This is your go-to tool for compliance, troubleshooting, and investigations.

**What You Can See:**

| Column | Description | Example |
|--------|-------------|---------|
| **Table Name** | Which data was affected | `purchase_debit_note_hdr`, `purchase_debit_note_dtl` |
| **Action** | Type of action | CREATE, UPDATE, FINAL, VOID |
| **Action Date** | When it occurred | 2024-03-15 10:30 AM |
| **Action By** | Who performed it | john.tan@company.com |
| **Description** | What changed | "Status changed from DRAFT to FINAL" |

**Common Use Cases:**

- **Investigating a disputed charge**: Filter by document number to see full history
- **Month-end audit prep**: Export all FINAL actions for the period
- **Tracking who voided a document**: Filter by Action = VOID for a specific date range

---

## Export & Print

Use the **Export** tab on any document to generate PDF output using your configured printable format. Useful for:
- Archiving finalized documents for audit
- Sending formal acknowledgment copies to the supplier branch
- Printing physical copies for filing

---

## Personalization

Personalization allows individual users to customize certain settings to fit their personal preferences, **overriding the default application-wide configurations** set by admins. For example, User A might set Branch A as their personal default location, while User B selects Branch B, tailoring the application to their individual role.

#### Personal Default Settings

Save your frequently used defaults to speed up document creation:
- Default branch and currency
- Default cost center and department
- Preferred listing filters and sort order

Access via **Personalization > Default Selection** in the sidebar.

---

## File Imports

The **File Import** page simplifies and accelerates the process of entering multiple Purchase Debit Notes into the system. Instead of manually inputting each record one by one, users can prepare data in a CSV file and upload it all at once.

Bulk-create debit note line items by uploading a formatted file:

1. Click the **(+)** button to download the standard import CSV template.
2. Fill in the required line item details (item codes, quantities, amounts).
3. Click **Choose File** (or drag and drop) to select the completed file.
4. Click **Apply** to submit the file. The system will process it and display any errors that need correction.
5. If successful, you will receive a confirmation message.

This is especially useful when processing a large volume of adjustments at once, reducing manual entry errors drastically during month-end closings.

{{< callout type="info" >}}
**Permission Required**: The File Import menu is only visible if the **SHOW_FILE_IMPORT_MENU** client-side permission is granted, or if the **HIDE_FILE_IMPORT_MENU** setting is not enabled. Contact your administrator if you cannot see this menu.
{{< /callout >}}

---

## FAQ

**Q: How does an Internal Purchase Debit Note get created?**  
**A:** In most cases, it is **automatically generated** when an internal supplier branch finalizes an Internal Sales Debit Note targeting your branch. However, you can also **manually create** one if needed.

**Q: Does finalizing an Internal Purchase Debit Note affect the General Ledger?**  
**A:** Yes. When you click **FINAL**, GL entries are posted immediately — increasing your branch's payable and recording the expense in the appropriate accounts.

**Q: Can I edit a purchase debit note after finalizing it?**  
**A:** No. Once finalized, the document is locked because GL postings have been made. If you need to make corrections, void the document and create a new one.

**Q: What if I need to void a finalized purchase debit note?**  
**A:** Click the **VOID** button on the edit screen (if you have permission). The system will post reversal GL entries and update the intercompany balances accordingly.

**Q: Where can I see the originating Internal Sales Debit Note from the supplier branch?**  
**A:** Open your Internal Purchase Debit Note and check the **Trace Document** tab. It shows all linked upstream and downstream documents, including the originating Sales Debit Note.

**Q: Can I use Contra to settle this debit note against other intercompany documents?**  
**A:** Yes. Use the **Contra** tab to offset this debit note against outstanding receivables or other intercompany balances, eliminating the need for actual cash transfers between branches.

**Q: What is the difference between the "Save" and "Final" buttons?**  
**A:** **Save** updates the document in its current status (Draft) without posting to the GL. **Final** locks the document, posts GL entries, and makes it uneditable. Always verify all details before clicking Final.

**Q: Why can't I see the File Import menu?**  
**A:** The File Import feature requires the **SHOW_FILE_IMPORT_MENU** client-side permission. Contact your administrator to enable it.

---

## Related Applets to Internal Purchase Debit Note

The Internal Purchase Debit Note Applet does not work in isolation; it operates within a broader system ecosystem.

### Internal Sales Debit Note Applet
**Purpose:** Manages outgoing debit notes issued by your branch to charge other internal branches.

**Relation to Purchase Debit Note:**  
These are mirror documents. When the supplier branch finalizes an Internal Sales Debit Note, the system automatically generates the corresponding Internal Purchase Debit Note in your applet. Changes on one side (e.g., voiding) are reflected on the other.

### Doc Item Maintenance Applet
**Purpose:** Manages the creation and editing of item codes used in various transactions.

**Relation to Purchase Debit Note:**  
The items that appear in your purchase debit note line items must be pre-configured here. The item's **Type** must be set to "Account Type" for non-inventory charges, linking it to a General Ledger (GL) code.

### Chart of Account Applet
**Purpose:** The central applet for managing your organization's financial accounts and GL codes.

**Relation to Purchase Debit Note:**  
Before items can be used in debit notes, the underlying GL Codes must exist. The prerequisite workflow is:
1. **Create the GL Code** (Chart of Accounts Applet)
2. **Create the Item & Link the GL Code** (Doc Item Maintenance Applet)
3. **Use the Item** (Internal Purchase Debit Note Applet)
