---
title: "Purchase Debit Note (Internal) Applet"
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

The **Purchase Debit Note (Internal) Applet** is your branch's gateway for managing incoming intercompany adjustments. While a standard invoice records the initial purchase, a **Purchase Debit Note** is used to accurately record an **increase** in what you owe an internal supplier after the original transaction has been posted.

### TL;DR: The Mirror Relationship

This applet is just the "other side" of a **Sales Debit Note**.

*   **Branch A (Supplier)** forgot to charge you for something (like a delivery fee).
*   **Branch A** issues an **Sales Debit Note (Internal)** to say: *"I'm charging you extra."*
*   **You (Branch B)** receive an **Purchase Debit Note (Internal)** to say: *"I owe you extra."*

They are mirror images. One branch issues the charge (Sales), and your branch accepts the liability (Purchase).

### When is this Applet used?

You will find a record in this applet (or create one manually) in the following common business scenarios:

*   **Price Under-billing Corrections**: If a supplier branch accidentally billed you at RM 10.00 per unit instead of the agreed RM 12.00, this applet records the additional RM 2.00 per unit to correct the record.
*   **Omitted Surcharges**: When tertiary costs—such as urgent freight, specialized handling, or insurance fees—were discovered or calculated *after* the original Purchase Invoice was finalized.
*   **Internal Service Recognition**: For recording monthly management fees, IT support costs, or shared-service allocations issued by HQ to your branch.
*   **Audit & Year-End Adjustments**: To reflect valuation corrections requested by auditors to ensure that inter-branch payables and receivables are perfectly balanced before closing the books.

{{< callout type="info" >}}
**Core Concept**: This applet represents an **Incoming Additional Charge**. When finalized, it increases your branch's **Accounts Payable** and recognizes an additional expense in your Profit & Loss statement. In most cases, these documents arrive **automatically** when the supplier branch finalizes their Sales Debit Note.
{{< /callout >}}

### Why is this Important in Accounting?

Maintaining a disciplined Purchase Debit Note (Internal) process is critical for several key accounting objectives:

*   **Intercompany Elimination & Consolidation**: For a group of companies to produce accurate consolidated financial statements, intercompany receivables must perfectly offset intercompany payables. This applet ensures that when your supplier branch records an asset, you record an identical liability, preventing month-end "out-of-balance" discrepancies during group consolidation.
*   **Completeness & Accuracy Assertions**: Financial audits require that all liabilities belonging to a period are recorded (**Completeness**) and stated at the correct value (**Accuracy**). This applet allows you to book corrections even after an original invoice is closed, ensuring your Balance Sheet truthfully reflects your obligations.
*   **Expense Matching (Accrual Principle)**: Accounting standards require expenses to be recognized in the same period as the related business activity. By using a Debit Note to correct under-billing, you ensure the additional cost hits the Profit & Loss statement in the correct fiscal period, maintaining the integrity of your performance reporting.
*   **Input Tax Integrity**: When a supplier branch issues an additional charge, it often includes a tax portion (SST/GST/VAT). This applet ensures you accurately capture and claim the **Input Tax** on these adjustments, preventing your branch from overpaying its net tax liability to the government.

### What is the Purchase Debit Note (Internal) Applet? (Explained Simply)

Imagine your company has two branches: **HQ (in Kuala Lumpur)** and **Branch A (in Penang)**.

1. HQ ships laptops to Branch A and originally bills them **RM 5,000**.
2. Later, HQ discovers they forgot to include a **RM 200 delivery fee**.
3. HQ creates an Sales Debit Note (Internal) for the extra RM 200 and clicks **FINAL**.

**What happens on Branch A's side?**

The system automatically creates an **Purchase Debit Note (Internal)** worth RM 200 in Branch A's applet. Branch A's finance team can now see:
- *"We owe HQ an extra RM 200 for delivery charges."*
- The document is already linked to HQ's original debit note.
- Branch A's Accounts Payable is updated automatically.

A "Purchase Debit Note" in this context means an **"Incoming Additional Charge"** — your branch is on the receiving end of an upward revision from an internal supplier.

### Relationship to Other Applets

This applet sits at the receiving end of the intercompany debit note workflow:
- **Sales Debit Note (Internal) Applet (The Origin):** When a supplier branch finalizes a Sales Debit Note targeting your branch, this applet automatically receives the corresponding Purchase Debit Note. They are mirror documents.
- **Purchase Invoice (Internal) Applet (The Original Transaction):** The debit note typically adjusts a previous Purchase Invoice (Internal). You can trace back to see the original transaction that was under-billed.
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

**The Purchase Debit Note (Internal) Applet Solution:**

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

{{< figure src="/images/internal-purchase-debit-note-applet/purchase debit note applet-overview-infographic.png" alt="Purchase Debit Note (Internal) Applet Overview: Problems, Solution, and Benefits" caption="Purchase Debit Note (Internal) Overview: Moving from disjointed intercompany adjustments (The Problems) to automated, synchronized, and traceable financial control (The Solution) for Procurement, Finance, and Management (Who Benefits)." >}}

## Key Concepts

### Intercompany Transaction Flow

When the supplier branch finalizes an Sales Debit Note (Internal), the system executes an automated two-sided posting:

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
**Real-World Example**: HQ realizes they under-billed Branch A for inventory by RM 500. HQ issues an Sales Debit Note (Internal). Your branch (Branch A) automatically receives an Purchase Debit Note (Internal) for RM 500 — your payables increase, HQ's receivables increase, and everything stays in sync without double entry.
{{< /callout >}}

### Document Lifecycle

Every Purchase Debit Note (Internal) follows a predictable lifecycle:

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
4. **Cross-Reference**: Check the **Trace Document** tab to see the originating Sales Debit Note (Internal)
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
3. **Check Trace Document** *(if visible)*: Confirm the debit note links to the correct upstream Sales Debit Note (Internal)
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
- Have the supplier branch create and finalize an Sales Debit Note (Internal) targeting your branch
- Verify the corresponding Purchase Debit Note (Internal) appears automatically in your applet
- Finalize it and verify GL postings are correct on both sides

---

{{< callout type="tip" >}}
**New to the system?** Start with the basics:
1. Operations staff: Open an existing Purchase Debit Note (Internal) and explore each tab
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
| **Trace Document** | A visual map showing how this document is connected to others — the originating Sales Debit Note (Internal), the GL postings, and any downstream documents. |
| **Doc Link** | Link this purchase debit note to related documents such as delivery orders, job sheets, or purchase orders for complete traceability. |
| **E-Invoice** | For tax compliance (if enabled for your region). Tracks the status of submitting the document to the government tax authority (e.g., LHDN in Malaysia). |
| **Attachments** | Upload supporting proof (PDFs, images) like the original purchase order, email correspondence, or delivery receipts. |
| **Export** | Generate a printable PDF of the Purchase Debit Note. |

#### Deep Dive: Main Details Tab
{{< figure src="/images/internal-purchase-debit-note-applet/main-details.png" alt="Purchase Debit Note Main Details" caption="Main Details: Capture the document's legal and financial header data." >}}
This tab captures the header-level data that defines the transaction's legal and financial identity. It ensures **Internal Control & Auditability** across your entire organization.

*   **Tenant, Company, & Branch Document IDs**: These are the three levels of system-generated numbers displayed at the top. In a decentralized ERP, they provide **Internal Control**. The Tenant ID offers a globally unique reference for HQ audits, while the Branch ID maintains local sequence integrity for tax compliance, preventing "missing document" gaps in your records.
*   **Branch & Location**: The specific physical and legal units where the transaction is recorded. This defines the **Accounting Unit**, ensuring the liability is recognized in the correct sub-ledger and that the expense hits the specific branch's Profit & Loss statement rather than being misallocated.
*   **Transaction Date**: Determines the **Reporting Period**. In accrual accounting, this date dictates which fiscal month or quarter the document will impact, ensuring expenses are matched to the period in which they occurred.
*   **Tracking ID**: A unique identifier linking the financial entry to its physical source (e.g., a shipment number). This ensures the **"Occurrence" assertion** during an audit—proving that the charge is tied to a verifiable business event.
*   **Client Documents (1-5)**: Reference fields for the supplier's original document numbers. This is your primary tool for **Intercompany Reconciliation**. Recording the supplier's original Sales Debit Note or Invoice number here enables the system to "match" records between branches, which is critical for month-end consolidation.
*   **Currency, Forex Source, & Rate**: Fields managing exchange rate governance. By enforcing a standardized **Forex Source**, the system ensures both branches use the same rate, eliminating "unrealized exchange gain/loss" discrepancies that often plague group consolidation.
*   **Debit Terms & Due Date**: The credit period (e.g., Net 30) and the automatically calculated payment date. These drive **Liquidity Management** by feeding directly into your **Accounts Payable Aging** reports, allowing you to forecast cash outflows accurately.

#### Deep Dive: Account Tab
{{< figure src="/images/internal-purchase-debit-note-applet/account-tab.png" alt="Purchase Debit Note Account Tab" caption="Account Tab: Identify the internal supplier and counterparty branch." >}}
**Concept: Identifying your Internal Supplier.**
In this tab, you are selecting the **"Counterparty"**—the specific branch that is issuing the charge to you. Precise selection here ensures that your branch’s liability perfectly offsets their receivable during consolidation.

*   **Entity ID & Entity Branch**: The core identifiers for the internal supplier. This is critical for **Intercompany Eliminations**. Under standard consolidation rules, revenues and expenses between branches must net to zero. Selecting the exact issuing branch ensures your branch's **Accounts Payable** perfectly matches their **Accounts Receivable**, preventing imbalances in the consolidated financial statements.

{{< figure src="/images/internal-purchase-debit-note-applet/bill-to-address.png" alt="Bill To Address" caption="Bill To Address: Legal billing information for tax compliance." >}}
*   **Bill To Address**: Captures the legal billing name and statutory **Tax ID**. This defines the **Legal Debtor**, ensuring the debt is attributed to the correct legal entity and that tax records are compliant with regional regulations.

{{< figure src="/images/internal-purchase-debit-note-applet/ship-to-address.png" alt="Ship To Address" caption="Ship To Address: Physical delivery destination for inventory valuation." >}}
*   **Ship To Address**: Captures the physical delivery destination. This follows the principle of **Substance Over Form**. While the "Bill To" establishes the legal liability, the "Ship To" identifies where the physical risk and rewards of ownership (Inventory) are transferred, which impacts **Inventory Valuation** and **Tax Jurisdiction**.
*   **Intercompany Sub-Tab**: A live monitor for sync status. This ensures **Data Integrity** by confirming that the document remains electronically linked to the originating branch's records, guaranteeing that any updates are reflected on both sides of the transaction.

#### Deep Dive: Lines Tab

{{< figure src="/images/internal-purchase-debit-note-applet/lines-tab.png" alt="Purchase Debit Note Lines Tab" caption="Lines Tab: Specify the economic substance and cost allocation of the charge." >}}
**Concept: Selecting the Economic Substance.**
This is where you select **"What"** you are being charged for. Each line defines a specific commitment of value and where that cost should be allocated.

*   **Item Code & Name**: These identify the specific goods or services being charged. In accounting, this ensures **Measurement & Recognition** accuracy—linking the expenditure to the correct inventory category or expense account.
*   **Quantity & Unit Price**: These fields define the **Basis of Valuation**. The system uses these to calculate the total transaction value. Accurate entry is critical for ensuring that the legal debt recorded matches the physical quantity of goods or services received.
*   **SST/GST/VAT**: The tax configuration applied to the line. This ensures **Tax Ledger Separation**, automatically calculating the tax liability or claimable amount to be posted to the government's respective tax accounts.
*   **Unit Discount**: Records deductions directly at the line level. This ensures that the net expenditure recognized in your P&L is accurate and follows the principle of **Accrual-Basis Accounting** (recording the expense net of trade discounts).
*   **Department (Segment, Profit Center, Project)**: These are "tags" for **Responsibility Accounting**. By assigning a cost center or project code here, you ensure that the expense is segmentally reported, allowing management to track the performance and budget consumption of specific departments or initiatives.
*   **Landed Costing (Moving/Weighted Average)**: Found in the costing sub-tab, these fields track the total cost of acquisition. Following **IAS 2 (Inventories)**, these costs are capitalized, ensuring that the inventory on your balance sheet is valued correctly, including all costs required to bring the goods to their current location.

#### Deep Dive: Payment Tab

This tab manages how the liability is settled or funded.

*   **Settlement Method**: Defines the portal of payment (e.g., Cash, Card, or Points). This determines the **Cash Flow Impact**. In accounting terms, selecting "Cash" indicates an immediate reduction in liquidity, while "Card" or deferred methods might impact different liability accounts.
*   **Points (Gold/Silver/Rebate)**: A specialized settlement type for internal loyalty or reward schemes. This manages **Deferred Revenue & Loyalty Liability** impacts within the branch network.
*   **Payment Amount & Date**: The specific value and timing of the settlement. This is vital for **Bank/Cash Reconciliation**, ensuring that the system's ledger matches your physical bank statements or cash-on-hand.

#### Deep Dive: Department Hdr Tab

**Concept: Organizational Responsibility.**
While the *Lines Tab* lets you split costs between teams, the **Department Hdr** assigns the **entire document** to a high-level Business Unit. This ensures the debit note appears on the correct department's Profit & Loss statement during financial consolidation.

*   **Segment & G/L Dimension**: Defines the highest level of **Segmented Reporting**. This ensures that the debit note is recognized in the correct business unit's financial statements during consolidation.
*   **Profit Centre & Project**: These act as the final destinations for **Budget Allocation**. By tagging the document header here, you ensure that the charge hits the correct internal budget, supporting **Responsibility Accounting** and departmental cost tracking.

#### Deep Dive: Contra Tab

This tab facilitates the **"Right of Offset" (IAS 32)**, allowing you to net debts without physical cash transfer.

*   **Document Linkage**: Connects this Purchase Debit Note directly to an outstanding Sales Invoice or Credit Note from the same branch.
*   **Contra Amount**: The specific value being "netted off." This ensures **Settlement Accuracy**, reducing the outstanding balance on both sides of the intercompany ledger simultaneously.
*   **Transaction Date**: The date the offset is legally recognized, ensuring that your **Aging Reports** and **Working Capital** calculations are updated in the correct reporting period.

#### Deep Dive: ARAP Tab

{{< figure src="/images/internal-purchase-debit-note-applet/arap-tab.png" alt="Purchase Debit Note ARAP Tab" caption="ARAP Tab: Real-time reconciliation of charges, offsets, and balances." >}}
**Concept: Reconciliation Dashboard.**
**ARAP** (Accounts Receivable / Accounts Payable) is a real-time monitor of the document’s financial equation:
> **Gross Charges (Lines)** - **Offsets (Contra)** - **Cash Payments** = **Outstanding Balance.**

*   **Product & Services**: The gross liability recognized from the line items.
*   **Settlement & Contra**: Tracks the total reductions in liability from payments or offsets.
*   **Outstanding Balance**: The remaining net liability. This ensures that the **Accounting Equation (A = L + E)** is maintained for this specific document and that your AP sub-ledger remains in balance with the General Ledger.

#### Deep Dive: Trace Document Tab

{{< figure src="/images/internal-purchase-debit-note-applet/trace-document-tab.png" alt="Purchase Debit Note Trace Document Tab" caption="Trace Document: Visual map of intercompany links and GL entries." >}}
**Concept: Double-Entry Transparency.**
This tab allows you to lookup exactly how the system updated your financial records. It "traces" the digital record into the actual **General Ledger (GL)** notebooks of the branch.

*   **Journal Txn**: Displays the entries in the **General Ledger**, ensuring that every debit has an offsetting credit.
*   **Cashbook & Tax Txn**: Shows the impact on your cash position and tax liability, verifying that **Tax Reporting** and **Cash Controls** are functioning as intended.
*   **Inventory Txn**: Tracks the movement and valuation changes in your stock, providing an audit trail for **Stock Valuation** and physical inventory control.

#### Deep Dive: E-Invoice, Attachments, & Export

{{< figure src="/images/internal-purchase-debit-note-applet/einvoice-attachments-export.png" alt="Purchase Debit Note Statutory Records" caption="E-Invoice & Attachments: Statutory digital records and audit proof." >}}
**Concept: Statutory Digital Records.**
The **E-Invoice** tab manages the legal submission of this adjustment to government tax portals (like LHDN). It ensures your debit note is an officially recognized tax document, complete with the required UUID and digital signatures.

*   **E-Invoice Tab**: Manages the legal "digital record" status of the document. This is vital for **Statutory Compliance** in jurisdictions requiring electronic tax reporting, ensuring the document is officially recognized by the government portal.
*   **Attachments Tab**: Stores digital "proof of delivery," supplier invoices, or email correspondence. This satisfies the **"Audit Trail" requirement**, providing the physical evidence needed to support the digital record during year-end audits.
*   **Export Tab**: Allows you to extract data for external audit or analysis. This facilitates **Data Portability**, ensuring that your financial records are accessible for reporting outside the ERP system.

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

**Q: How does an Purchase Debit Note (Internal) get created?**  
**A:** In most cases, it is **automatically generated** when an internal supplier branch finalizes an Sales Debit Note (Internal) targeting your branch. However, you can also **manually create** one if needed.

**Q: Does finalizing an Purchase Debit Note (Internal) affect the General Ledger?**  
**A:** Yes. When you click **FINAL**, GL entries are posted immediately — increasing your branch's payable and recording the expense in the appropriate accounts.

**Q: Can I edit a purchase debit note after finalizing it?**  
**A:** No. Once finalized, the document is locked because GL postings have been made. If you need to make corrections, void the document and create a new one.

**Q: What if I need to void a finalized purchase debit note?**  
**A:** Click the **VOID** button on the edit screen (if you have permission). The system will post reversal GL entries and update the intercompany balances accordingly.

**Q: Where can I see the originating Sales Debit Note (Internal) from the supplier branch?**  
**A:** Open your Purchase Debit Note (Internal) and check the **Trace Document** tab. It shows all linked upstream and downstream documents, including the originating Sales Debit Note.

**Q: Can I use Contra to settle this debit note against other intercompany documents?**  
**A:** Yes. Use the **Contra** tab to offset this debit note against outstanding receivables or other intercompany balances, eliminating the need for actual cash transfers between branches.

**Q: What is the difference between the "Save" and "Final" buttons?**  
**A:** **Save** updates the document in its current status (Draft) without posting to the GL. **Final** locks the document, posts GL entries, and makes it uneditable. Always verify all details before clicking Final.

**Q: Why can't I see the File Import menu?**  
**A:** The File Import feature requires the **SHOW_FILE_IMPORT_MENU** client-side permission. Contact your administrator to enable it.

---

## Related Applets to Purchase Debit Note (Internal)

The Purchase Debit Note (Internal) Applet does not work in isolation; it operates within a broader system ecosystem.

### Sales Debit Note (Internal) Applet
**Purpose:** Manages outgoing debit notes issued by your branch to charge other internal branches.

**Relation to Purchase Debit Note:**  
These are mirror documents. When the supplier branch finalizes an Sales Debit Note (Internal), the system automatically generates the corresponding Purchase Debit Note (Internal) in your applet. Changes on one side (e.g., voiding) are reflected on the other.

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
3. **Use the Item** (Purchase Debit Note (Internal) Applet)
