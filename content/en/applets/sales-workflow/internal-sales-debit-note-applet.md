---
title: "Internal Sales Debit Note Applet"
description: "Streamlined system for managing internal intercompany debit adjustments, post-billing charges, and account reconciliations."
tags:
- sales-management
- intercompany
- debit-note
- financial-control
- internal-billing
weight: 80
---

## Purpose and Overview

**TL;DR:** It allows your branch to officially charge another internal branch *extra money* to correct a past transaction that was under-billed.

The **Internal Sales Debit Note Applet** manages upward revisions to internal sales invoices between branches, subsidiaries, or divisions within your organization. When your branch has under-billed an internal customer, this applet lets you issue a debit note that simultaneously updates both parties' ledgers through automated intercompany transaction matching.

{{< callout type="info" >}}
**Core Concept**: Issue a Debit Note from one branch → system automatically increases your branch's **Accounts Receivable** and creates a matching **Internal Purchase Debit Note** at the destination branch, keeping both ledgers perfectly synchronized.
{{< /callout >}}

A Webinar to get to know about the functionalities of the Internal Sales Debit Note Applet:

<div style="max-width:560px; margin:24px auto;">
  <div style="position:relative; padding-bottom:56.25%; height:0; overflow:hidden;">
    <iframe
      src="https://www.youtube.com/embed/BlC3GtLoHzo"
      style="position:absolute; top:0; left:0; width:100%; height:100%;"
      frameborder="0"
      allowfullscreen>
    </iframe>
  </div>
</div>

### What is the Internal Sales Debit Note Applet? (Explained Simply)

Imagine your company has two branches: **HQ (in Kuala Lumpur)** and **Branch A (in Penang)**.

1. HQ sends some laptops to Branch A and bills them **RM 5,000**.
2. Later, HQ realizes they forgot to include the **RM 200 delivery fee** on that bill.
3. HQ needs to tell Branch A, *"Hey, you actually owe us an extra RM 200."*

Instead of sending emails back and forth and doing manual data entry twice, HQ uses the **Internal Sales Debit Note Applet** to create an official document for that extra RM 200.

**The "Magic" Part:** When HQ hits "FINAL" on this document, the system automatically does two things:
- It updates HQ's records to say they will receive RM 200 (Accounts Receivable).
- It automatically creates a matching document over at Branch A's system (an Internal Purchase Debit Note), telling Branch A they need to pay the extra RM 200 (Accounts Payable).

No one has to type it in twice. It prevents Branch A from forgetting to pay, and it keeps everyone on the exact same page. A "Debit Note" in this context basically means an **"Additional Charge"** or an **"Upward Revision"** to a previous invoice.

### Relationship to Other Applets

This applet acts as a bridge between several other parts of the system:
- **Internal Sales Invoice Applet (The Origin):** You usually create a Debit Note because an original invoice was incorrect. When creating a debit note, you "tag" or link the original Internal Sales Invoice so everyone knows *why* there is an extra charge.
- **Internal Purchase Debit Note Applet (The Destination):** This is the mirror image. Finalizing a Sales Debit Note here automatically triggers the creation of an Internal Purchase Debit Note at the receiving branch's account.
- **General Ledger (Accounting Core):** Once approved and finalized, this applet sends the financial data straight to the core accounting system, automatically hitting the Revenue account for the issuing branch and the Expense account for the receiving branch.
- **Approval Workflow Applets:** If the extra charge is large, the system uses the Workflow rules to pause the document and route it to a manager or director for approval before it can become Final.

## Key Features Overview

### Who Benefits from This Applet?

**Sales & Operations Teams:**
- Correct under-billed internal invoices without manual coordination
- Real-time visibility into document statuses (Draft, Final, Void)
- Link debit notes directly to originating internal sales invoices
- Attach supporting documents for audit readiness

**Finance & Accounting Teams:**
- Eliminate manual intercompany reconciliation at month-end
- Immediate GL postings for both issuing and receiving branches
- Complete audit trail from creation through finalization
- Accurate cost-center and profit-center tagging via Department Header

**Management & Branch Directors:**
- Real-time visibility into branch-to-branch adjustments
- Control over internal pricing compliance via approval workflows
- Consolidated view of all intercompany debit activity
- Data-driven analysis of inter-branch service volumes

## Key Menu Functions

When utilizing this applet, users have access to several key functions to manage their daily workflows:

**1. Create/Edit Document**
- Create new additional charges (Debit Notes).
- Select the destination branch, describe why the charge is occurring, and add specific item codes and amounts.
- Tag original internal invoices, department codes, and cost centers.

**2. File Import**
- Upload an Excel or CSV file containing hundreds of extra charges at once.
- A massive time-saver for month-end reconciliation if many small items were under-billed.

**3. Intercompany Transaction Listing (Manual processing)**
![Intercompany Dashboard](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_21c7678b2dd3810c82bbe3f3b68ca14881b930766766b4938dcbb1dd5f0a48f6.png)

- View a dedicated dashboard tracking the status of intercompany syncs.
- **Inbound vs Outbound:** View transactions originating from your branch (Outbound) and coming to your branch (Inbound).
- **Unprocessed vs Processed:** Track documents waiting to be automatically synced versus those that have successfully completed the intercompany transfer. 

**4. Search and Advanced Filters (Listing Page)**
The smart search and advanced filter functionality on the main listing page allows users to efficiently locate specific debit notes:
- **Customer Filter:** Select a specific customer from the dropdown list to view all related debit notes.
- **Branch Filter:** Select "All" or drill down into one specific branch.
- **Sales Agent Filter:** Track performance or follow up on specific agents' transactions.
- **Posting Status:** Filter by Draft (in progress), Final (completed), Void (cancelled), or Discarded to track the current state of each note.
- **Active Status:** View debit notes that are currently Active or Inactive within the system.
- **Date Filters:** Refine search by Transaction Date, Update Date, or Creation Date.

**5. Applet Settings**
- Configure branch mappings, default accounts, workflow approval chains, printable formats, and knock-off rules.

**6. Personal Default Settings**
- Save favorite defaults (like preferred branch or currency) to speed up continuous data entry.

### What Problems Does This Solve?

**The Manual Internal Adjustment Problem:**

Traditional intercompany adjustments rely on emails and isolated accounting entries. Common issues include:
- Out-of-sync books between branches (Branch A books a receivable, Branch B forgets to book the payable)
- No traceable link between the original invoice and the adjustment
- Month-end reconciliation delays matching internal debits across entities
- Missing approval trails when internal pricing or quantities change
- Double data entry by separate regional finance teams

**The Internal Sales Debit Note Applet Solution:**

- **Single Point of Entry** — Create the debit note once; the system automatically updates both entities
- **Intercompany Sync** — Auto-generates the corresponding Internal Purchase Debit Note at the receiving branch
- **Complete Traceability** — Every adjustment links to an original internal sales invoice or account
- **Approval Workflows** — Configurable routing ensures the right people authorize changes
- **Error Reduction** — Eliminates out-of-balance intercompany accounts at month-end

## Key Features Overview

{{< cards >}}
  {{< card title="Create Debit Notes" subtitle="Quick creation with links to original invoices" link="#for-operations-creating-your-first-internal-debit-note" >}}

  {{< card title="Intercompany Sync" subtitle="Auto-create matching purchase debit notes" link="#intercompany-transaction-flow" >}}

  {{< card title="Approval Workflow" subtitle="Configurable multi-level authorization" link="#for-managers-reviewing-internal-adjustments" >}}

  {{< card title="File Import" subtitle="Bulk upload debit note entries" link="#file-imports" >}}

  {{< card title="Document Tabs" subtitle="Main Details, Account, Lines, Settlement, and more" link="#document-tabs-overview" >}}

  {{< card title="Audit Trail" subtitle="Full activity log of every document action" link="#audit-trail" >}}

  {{< card title="Export & Print" subtitle="PDF export and configurable print formats" link="#export--print" >}}

  {{< card title="Personalization" subtitle="Save default settings for faster data entry" link="#personalization" >}}
{{< /cards >}}

## Key Concepts

### Intercompany Transaction Flow

When you finalize an Internal Sales Debit Note, the system executes an automated two-sided posting:

```
Issuing Branch (HQ)                          Receiving Branch (Branch A)
─────────────────────                        ───────────────────────────
Creates Internal Sales                       System auto-creates Internal
Debit Note (+RM 500)                         Purchase Debit Note (+RM 500)
     │                                            │
     ▼                                            ▼
Accounts Receivable ▲                        Accounts Payable ▲
(HQ is owed +RM 500)                        (Branch A owes +RM 500)
```

{{< callout type="tip" >}}
**Real-World Example**: HQ realizes they under-billed Branch A for inventory by RM 500. HQ issues an Internal Sales Debit Note. The system automatically updates HQ's receivables by +RM 500 and provisions Branch A's payables by +RM 500—keeping everything in sync without either party doing double entry.
{{< /callout >}}

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Operations: Creating Your First Internal Debit Note

**Goal:** Issue a debit note to correct an under-billed internal customer.

1. **Navigate**: Go to **Internal Sales Debit Note** from the sidebar
2. **Create Header**: Fill in the **Main Details** tab:
   - Select the **internal customer** (destination branch)
   - Set the **document date** and **currency**
   - Add a **description** (e.g., "Additional transport charges for PO-2024-001")
3. **Set Account Info**: Switch to the **Account** tab:
   - Select or confirm the **billing entity**
   - Verify the **billing** and **shipping addresses**
4. **Add Line Items**: Switch to the **Lines** tab:
   - Click **"Add Line"**
   - Select the **Item Code** or choose an account-based entry
   - Enter **Quantity** and **Unit Price** (or direct **Amount**)
   - Repeat for each adjustment line
5. **Tag Department** *(if visible)*: Switch to the **Department Hdr** tab:
   - Assign the relevant **department** and **cost center**
6. **Attach Supporting Docs** *(if visible)*: Switch to the **Attachments** tab:
   - Upload the original purchase order, correspondence, or any supporting evidence
7. **Create**: Click **CREATE** → Document is saved in **Draft** status

**Creation Action Controls (Top Right)**
*   **Reset**: Clears all entered data and restores the form to its original blank state.
*   **Save**: Saves any changes made without finalizing, allowing you to update the draft later.
*   **Final**: Finalizes the debit note, locking it as complete.

**What happens next?**

```
Draft → Click FINAL → GL entries posted 
                     → Intercompany Purchase Debit Note auto-created at destination branch
```

You can also **RESET** the form at any time before creating to clear all fields.

---

### For Managers: Reviewing Internal Adjustments

**Goal:** Review and authorize debit notes before finalization.

1. **Open the Document**: Navigate to the debit note listing and select the document to review
2. **Verify Details**:
   - **Main Details**: Confirm the internal customer and document description
   - **Account**: Check that the correct billing entity is selected
   - **Lines**: Verify item codes, quantities, and amounts are accurate
   - **Attachments**: Review supporting documentation
3. **Check Trace Document** *(if visible)*: Confirm the debit note links to the correct upstream internal sales invoice
4. **Decide**:
   - **Approve / Finalize**: Click **FINAL** → System posts GL entries and generates the intercompany document
   - **Return for Correction**: Inform the creator of any discrepancies before finalization
   - **Void** *(if already finalized in error)*: Click **VOID** → Reversal entries are posted

---

### For Admins: Initial System Setup

**Goal:** Configure the applet so your teams can start issuing internal debit notes.

**Step 1: Configure Branch Settings** (`Settings > Branch Settings`)
- Map internal customers/suppliers for each branch
- Configure branch-specific default accounts

**Step 2: Configure Workflow Settings** (`Settings > Workflow Settings`)
- Define approval routing rules (e.g., debit notes above RM 1,000 require Regional Controller approval)
- Set up workflow steps and authorized approvers

**Step 3: Configure Default Settings** (`Settings > Default Settings`)
- Set default currency, numbering format (e.g., `ISDN-2024-00100`), and other document defaults

**Step 4: Configure Field Configuration** (`Settings > Field Configuration`)
- Control which fields are mandatory, optional, or hidden during document creation

**Step 5: Configure Knock-Off Settings** (`Settings > Knock-Off Settings`)
- Define rules for how debit notes can be knocked off against other internal documents

**Step 6: Configure Printable Format** (`Settings > Printable Format Settings`)
- Customize the PDF export layout, company logo, header/footer text, and included fields

**Step 7: Test the Full Flow**
- Create a test debit note as an operations user
- Finalize it and verify the intercompany purchase debit note is generated at the destination branch
- Verify GL postings on both sides

---

{{< callout type="tip" >}}
**New to the system?** Start with the basics:
1. Operations staff: Create a test Internal Sales Debit Note in Draft mode and explore each tab
2. Managers: Practice reviewing and finalizing a test document
3. Admins: Review **Configuration & Settings** below for detailed setup guides
{{< /callout >}}

---

### Document Lifecycle

Every Internal Sales Debit Note follows a predictable lifecycle:

| Status | What It Means | What Happens Next |
|--------|---------------|-------------------|
| **Draft** | Created but not yet finalized | Edit freely, add/remove lines |
| **Final** | Locked and posted to the GL | Intercompany document generated; no further edits |
| **Void** | Cancelled after finalization | Reversal GL entries posted; intercompany document also voided |

### Document Tabs Overview

When creating or editing a debit note, the screen is organized into tabs. Here is a breakdown of what you do in each tab:

| Tab | What It Is For (In Simple Terms) |
|-----|--------------------------------|
| **Main Details** | The header. You pick the internal customer (e.g., Branch A) and state the basic details (date, currency, remarks). |
| **Account** | Where to send the bill. It has sub-tabs for Billing Address, Shipping Address, and the Intercompany Sync status. |
| **Lines** | The core of the debit note. This is where you actually add the "stuff" you are charging for (e.g., "Delivery Fee", Qty: 1, Price: RM 200). It contains its own detailed sub-menus for things like Costing Details and Serial Numbers. |
| **Settlement** | How it's being paid. For internal transactions, this is often left blank as it's settled via contra, but if a specific intercompany payment method is used, it's recorded here. |
| **Department Hdr** | The accounting tags. This is where you specify which exact internal department or project should receive credit for this revenue (e.g., tagging the "IT Support" cost center). |
| **KO For (Knock-Off)** | Linking against outstanding documents. If Branch A already owes you money from 5 different invoices, you can link ("knock-off") this debit note against those specific balances to clean up the ledgers. |
| **Contra** | Offsetting balances. If you owe Branch A RM 500, and they owe you RM 500, you can "Contra" (cancel out) the debts against each other so no actual cash needs to transfer. |
| **ARAP** | A dashboard showing the current Accounts Receivable / Accounts Payable balances between the branches. A snapshot of "Who owes Who." It shows exactly how much money the destination branch still owes you, and how much you might owe them at this moment. |
| **Attachments** | Upload supporting proof (PDFs, images) like the original purchase order or email correspondence. |
| **Trace Document** | A visual map showing how this document is connected to others (e.g., seeing the exact Internal Purchase document that was auto-generated at the destination branch). |
| **E-Invoice** | For tax compliance (if enabled for your region). This tab tracks the status of submitting the invoice to the government tax authority (e.g., LHDN in Malaysia). It shows if the submission was successful or if the government rejected it. |
| **Export** | Generate a printable PDF of the Debit Note. |

#### Deep Dive: Main Details Tab
![Main Details Overview](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_14a7809355449c24c22c87013ec80e8b160ff8fb12a1f08d9e74f720e1fd70b8.png)

This tab captures the fundamental information about the debit note. Beyond standard dates and currencies, it includes important tracking fields:
*   **Tracking ID & Client Documents (1-5):** These optional fields are used to input reference numbers from external systems. For example, if you are issuing a debit note for extra freight costs, you would put the logistics provider's tracking number in the "Tracking ID" field. If your branch uses a separate third-party system to generate repair requests, you would put that system's ID into "Client Doc 1 No." This cross-references the ERP internal debit note with outside physical shipments or external software.
*   **Debit Terms & Due Date:** You select the agreed-upon payment terms (e.g., Net 30). The system will then automatically calculate and lock in the "Due Date."
*   **Currency & Rates:** Defines the transaction currency. If it differs from the Base Currency, the system integrates with a Forex data source to calculate the exact Exchange Rate at the time of the transaction.

#### Deep Dive: E-Invoice Tab
If the E-Invoice feature is enabled (e.g., for LHDN compliance in Malaysia), this tab manages the automated tax authority submission process. The form is broken down into several key sections:

**1. Submission Details (Top Section)**
This section deals with *how* the document is sent to the tax authority.
*   **Submission Type:** Determines how the tax authority analyzes the document.
    *   **INDIVIDUAL:** The most common setting for Business-to-Business (B2B) transactions. It submits this specific debit note directly to the tax authority as a standalone document. *Note: You must have a complete Account and Billing Address selected first.*
    *   **CONSOLIDATED:** Used when grouping many smaller transactions into a single aggregated submission for the tax authority (typically used for high-volume B2C retail where buyers don't require their own individual tax invoice).
    *   **SINGLE-GENERAL:** A specific general submission format, used for distinct retail or standardized billing scenarios that don't fit the individualized model. *Note: You must have a complete Account and Billing Address selected first.*
*   **Submission Type 2:** An additional, optional clarification field sometimes required by specific tax authority regulations depending on the nature of the transaction.
*   **Skip E-Invoice Toggle:** Can be used to explicitly exclude this document from government reporting (e.g., for certain purely internal adjustments that are exempt from tax reporting).

**2. Tracking & Reference Fields (Auto-Populated)**
Most fields in this section are locked (`readonly`) because they are strictly controlled by the system or rely on the government's response.
*   **Document No & Document Type:** Auto-filled based on the ERP system's internal tracking (e.g., `INTERNAL_SALES_DEBIT_NOTE`).
*   **Document Date:** The date the transaction occurred, auto-filled from the "Main Details" tab.
*   **E-invoice Number & UUID (Universally Unique Identifier):** These fields will start empty. When you successfully submit the E-Invoice, the government tax authority will generate an official UUID and an official E-Invoice Number. The system will automatically save them here as proof of registration.

**3. Original E-Invoice Links (Crucial for Debit Notes)**
*   **Original E-invoice Ref No & Ref UUID:** Because a Debit Note adjusts a *previous* invoice, the tax authority strictly requires you to link this new adjustment back to the exact invoice it modifies. Clicking the arrow `>` next to "Original E-invoice Ref No" allows you to search for and select the original finalized invoice, which will automatically fill in the UUID.

**4. Billing Period (Middle Section)**
If this debit note is related to a recurring service or a specific block of time (like rent or subscription fees), you define the timeframe here.
*   **E-Invoice Billing Frequency:** How often the billing occurs (e.g., Monthly, Annually, or Not Applicable).
*   **Billing Period Start / End Date:** The specific date range the extra charge covers. This ensures the tax authority maps the revenue to the correct duration.

**5. Buyer's Info (Bottom Section)**
This section contains the tax identity of the destination branch.
*   **Buyer Info & Address:** Automatically populated from the "Account" tab's billing address. However, these fields can be manually overridden here specifically for the tax submission if the billing address differs from the official registered tax address.
*   **Tax Identifiers:** Important fields like the Buyer's ID No, Tax ID, and SST ID are verified here. The submission to the government will fail if these are incorrect.
*   **Validation URL:** Once successfully submitted to and approved by the government tax authority, an official QR code and URL are generated at the very bottom of the page to prove the document's legal validity.

#### Deep Dive: Account Tab
![Account Tab Search](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_31bd232830790bfedd6dd14adf9d521ace0d6d45875c034034744fd21181c98a.png)
![Account Tab Create](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_6ff15c4c20dea5e78cf299aba5fbbae4e6b45758c170d7605825f07c3cc71186.png)

While most of this tab contains standard business information (who the internal customer is, and where to bill/ship), it contains one crucial sub-tab that powers this applet's main feature:
*   **Entity Details, Bill To, Ship To:** Standard fields to select the destination branch, and verify their exact Billing and Shipping addresses.
    *   **Quick Create:** If the customer you need is not available in the list, you don't need to abruptly halt your workflow or open a separate customer management app. Simply toggle the switch at the top to **Create and Edit mode**, fill in the new customer details, and the system saves it instantly. Once created or if they already existed, use **Select mode** to pick them from the list.
*   **Intercompany Sub-Tab:** This is the core engine of the applet. When you finalize this debit note, this sub-tab acts as a live monitor for the intercompany sync. It displays the **Transaction Status** and tracks the generation of the exact **Internal Purchase Debit Note** sent to the destination branch's system. If there are any errors or delays in the sync between branches, the status is tracked here.

#### Deep Dive: Lines Tab
![Lines Tab Selection](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_f0445bd93b9002f7a0d46fb920ca6cd70da21dd33bfc809e10c2ad6014f135ac.png)

This is where you specify the exact charges. While adding internal items is standard, there are a few unique features available when you edit a line item:
*   **Costing & Pricing Details:** You can view the exact cost metrics and markup for the item being billed to the destination branch.
*   **Delivery Details (From & To):** A sub-tab to manage shipment-specific information including trip number, driver, vehicle details, job start/end dates, delivery status, recipient name, and quantities.
*   **Serial Number (Scan & Import):** Two sub-tabs are available if the debit note involves moving tracked physical inventory. You can either manually "Scan" to add serials or "Import" a file to bulk-upload tracked serials and batches.
*   **Issue Link:** A unique sub-tab that allows you to link this specific line item charge to an external ticketing system (like a Jira ticket or internal helpdesk issue) for traceability.

#### Deep Dive: Settlement Tab
How do you actually record a payment for an internal debit note? Often, internal transactions are left as "outstanding" so they can be bundled and handled via "Contra" later. However, if a branch settles the charge immediately:
1.  Navigate to the **Settlement** tab and click **ADD**.
2.  Select a **Settlement Method** (e.g., Cash, Points/Rebate Points, or Corporate Credit Card).
3.  Fill in the specific details. For credit cards, it supports standard entries like Card Type (VISA/MASTERCARD) and Card Expiry. For points, it displays the point currency conversion rate.
4.  Enter the exact monetary amount settled and any remarks.

#### Deep Dive: Department Hdr Tab
This tab is designed for extremely precise internal reporting. If HQ charges Branch A for something, you might want to know *exactly which team* in Branch A caused the charge. Instead of just billing the "General Branch," it allows you to tag four specific accounting dimensions:
*   **Segment / G/L Dimension:** Typically used to categorize revenue by broader business streams or legal entities (e.g., tagging this charge specifically to the 'Retail Division' vs 'Wholesale Division').
*   **Profit Centre:** Allows you to attribute the transaction to a specific department (e.g., if you are charging Branch A for an IT software license, you can tag Branch A's specific "IT Helpdesk" profit center so their budget takes the hit, not Branch A's general fund).
*   **Project:** If the debit note is related to a specific internal initiative (e.g., "Warehouse Relocation 2024"), you can link the cost directly to that project's budget.

**KO For (Knock-Off For)**
This tab also provides dedicated sub-tabs designed to organize and link related sales documents:
*   **Delivery Order:** Lists delivery documents linked to the transaction for quick search.
*   **Job Sheet:** Shows job-related documents easily locatable via branch and customer.
*   **Sales Order:** Efficiently links directly to upstream sales order records.

#### Deep Dive: Contra Tab
![Contra Tab Summary](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_414411e36aba01c12afa5cb6dac652a018e8bc4a2160763955e5462135f56b55.png)

**The core concept:** Why transfer real money back and forth between bank accounts if you can just call it even? 
The Contra tab is where you resolve debts without actually transferring cash. 

**Scenario:** 
Let's say HQ owes Branch A RM 1,000 for a previous shipment. 
Today, HQ issues this new Internal Sales Debit Note, charging Branch A RM 500 for a marketing campaign. 
Instead of Branch A wiring RM 500 back to HQ (which is a waste of time and bank fees), HQ can use the **Contra** tab on this Debit Note. HQ selects the old RM 1,000 debt they owe and "knocks off" the RM 500 charge against it. 
**The Result:** The RM 500 marketing charge is considered fully paid, and HQ's outstanding debt to Branch A is reduced to RM 500. No cash actually moved!
*   **How it works:** When you create a Contra entry, the system automatically checks the AR/AP (who owes who) balances of both documents.
*   **Contra Amount & Dates:** It calculates the exact amount of debt to be canceled out. Depending on your system settings, you can edit the specific **Transaction Date** of the contra to make sure it aligns with your monthly financial closings.
*   **Reversals:** If a mistake is made, you can easily delete a finalized Contra entry using the "DELETE" button (which requires double-confirmation), automatically restoring the outstanding balances to both ledgers.

#### Deep Dive: ARAP Tab
![ARAP Tab View](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_b6fc662f59214dc4315cb691d02a861605e82fb97e00d1046e81296d364c89eb.png)

You can think of the ARAP (Accounts Receivable / Accounts Payable) tab as a **Read-Only Financial Dashboard**. It is not a status bar for the whole company; rather, it's a specific summary of *this exact document*. It shows five locked fields:
*   **Product & Services:** The total monetary value of all the line items you added.
*   **Settlement:** How much of this document has already been paid for (via the Settlement tab).
*   **Doc Open Amount:** The invoice value minus any initial settlements.
*   **Contra:** How much of this debt was canceled out by offsetting it against another existing intercompany document.
*   **Outstanding:** The final, real-time remaining balance that the destination branch still owes on this specific debit note.

#### Deep Dive: Trace Document Tab
Because this applet relies heavily on automation, the **Trace Document** tab exists to show you exactly what the system is doing behind the scenes once you finalize a debit note. It acts as an automated audit trail. 

Instead of guessing if the transaction went through over to the other branch, this tab provides a visual map showing:
*   **Upstream Documents:** The original Internal Sales Invoice that prompted this Debit Note in the first place.
*   **Downstream Documents:** The exact **Internal Purchase Debit Note** that the system automatically generated and pushed into the destination branch's system. The system even links the document ID here so you can trace it directly.
*   **General Ledger (GL) Postings:** For the accountants, it breaks down the exact bookkeeping journal entries across five specific sub-tabs:
    *   **Journal Txn:** The core double-entry accounting (Debits and Credits) hitting your main Accounts Receivable and Revenue ledgers.
    *   **Cashbook Txn:** If any immediate payment was made via the "Settlement" tab, it shows exactly how that cash hit your bank ledger.
    *   **Points Txn:** If the settlement involved redeeming loyalty points or rebates, the point deduction is tracked here.
    *   **Tax Txn:** Shows strictly the tax portion (e.g., SST or VAT) separated out for government reporting.
    *   **Inv Txn (Inventory):** If this debit note involved returning or moving physical stock, it tracks the exact value of the inventory entering or leaving the warehouse.

#### Deep Dive: Attachments Tab
This tab acts exactly as your permanent filing cabinet for **Proof**. Because issuing a debit note means you are legally charging another branch extra money, auditors will want to see *why*. 
You use this tab to upload the "receipts"—such as PDF email approvals from the Branch Manager, scanned delivery invoices proving an extra charge, or screenshots of internal chat logs explicitly authorizing the difference.

#### Deep Dive: Export Tab
The Export tab provides options to reprint or save the active document. First, select the desired printable format from the dropdown menu (configured by your administrator). Once chosen, export the document as a PDF file by clicking **Export as PDF**. This serves as a formal printable representation for record-keeping or physical sign-offs.

---

## Configuration & Settings

Fine-tune the applet behavior to match your organizational processes. Access all settings from the **Settings** menu in the sidebar. These application-wide options are controlled by admins and affect all users.

### Applet Settings (`Settings > Applet Settings`)
Admins can choose which tabs to show or hide in the applet interface, helping to streamline the user experience by completely removing unused sections.

### Branch Settings (`Settings > Branch Settings`)
![Branch Settings](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_Settings_&_Personalization_2c7bc853144ee26223616f3c3f6d45b8c74c44445cfd4fba1129d52cd61049f8.png)

Configure branch-specific behaviors:
- Map internal customers and suppliers per branch
- Set default GL accounts for intercompany transactions
- **Permissions Wizard**: Control user access and permissions within the applet, ensuring that the right people have appropriate levels of document access.

### Workflow Settings (`Settings > Workflow Settings`)
Control the approval flow:
- **Multi-Level Approvals**: Define sequential approval chains (e.g., Branch Manager → Regional Controller → Finance)
- **Threshold-Based Routing**: Auto-approve documents below a certain amount; require additional approvers above it
- **Role-Based Access**: Restrict who can create, edit, finalize, or void documents

### Default Settings (`Settings > Default Settings`)
![Default Settings](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_Settings_&_Personalization_4905d09f800466e1a157dcdae2bae4b3d12b7ddc516cba88ba6a51ae29db0f8c.png)

Set system-wide defaults:
- Default currency for new documents
- Running number format and sequence
- Default document date behavior

### Field Configuration (`Settings > Field Configuration`)
Control field visibility and validation:
- Make specific fields mandatory or optional
- Hide unused fields to simplify the creation form
- Configure field-level validation rules

### Knock-Off Settings (`Settings > Knock-Off Settings`)
Define knock-off behavior:
- Rules for matching debit notes against outstanding internal documents
- Auto-knock-off thresholds and tolerance settings

### Printable Format Settings (`Settings > Printable Format Settings`)
Customize PDF exports:
- Company logo and branding
- Header/footer text
- Which fields to display on printed output
- Page size and orientation

---

## Audit Trail

#### Applet Log (`Settings > Applet Log`)

The Applet Log records every action taken within the applet—creates, updates, finalizations, voids, and more. This is your go-to tool for compliance, troubleshooting, and investigations.

**What You Can See:**

| Column | Description | Example |
|--------|-------------|---------|
| **Table Name** | Which data was affected | `sales_debit_note_hdr`, `sales_debit_note_dtl` |
| **Action** | Type of action | CREATE, UPDATE, FINAL, VOID |
| **Action Date** | When it occurred | 2024-03-15 10:30 AM |
| **Action By** | Who performed it | john.tan@company.com |
| **Description** | What changed | "Status changed from DRAFT to FINAL" |

**Common Use Cases:**

- **Investigating a disputed adjustment**: Filter by document number to see full history
- **Month-end audit prep**: Export all FINAL actions for the period
- **Tracking who voided a document**: Filter by Action = VOID for a specific date range

---

## Export & Print

Use the **Export** tab on any document to generate PDF output using your configured printable format. Useful for:
- Sending formal debit note copies to the destination branch
- Archiving finalized documents for audit
- Printing physical copies for filing

---

## Personalization

Personalization allows individual users to customize certain settings to fit their personal preferences, **overriding the default application-wide configurations** set by admins. For example, User A might set Branch A as their personal default location, while User B selects Branch B, tailoring the application to their individual role.

#### Personal Default Settings
![Personalization](/images/internal-sales-debit-note-applet/Internal_Sales_Debit_Note_Settings_&_Personalization_772f7bfa58516319b14b79973555f0323f29958c8e8a34477519ab98188da19a.png)

Save your frequently used defaults to speed up document creation:
- Default branch and currency
- Default cost center and department
- Preferred listing filters and sort order

Access via **Personalization > Personal Default Settings** in the sidebar.

---

## File Imports

The **File Import** page is a powerful tool designed to simplify and accelerate the process of entering multiple Sales Debit Notes into the system. Instead of manually inputting each record one by one, users can prepare data in a CSV file and upload it all at once.

![File Import Interface](/images/internal-sales-debit-note-applet/File_Import_-_Internal_Sales_Debit_Note.png)

Bulk-create debit note line items by uploading a formatted file:

1. Click the **(+)** button to download the standard import CSV template.
2. Fill in the required line item details (item codes, quantities, amounts).
3. Click **Choose File** (or drag and drop) to select the completed file.
4. Click **Apply** to submit the file. The system will process it and display any errors that need correction.
5. If successful, you will receive a confirmation message.

This is especially useful when processing a large volume of adjustments at once, reducing manual entry errors drastically during month-end closings.

---

## FAQ

**Q: Does finalizing an Internal Sales Debit Note immediately affect the General Ledger?**  
**A:** Yes. When you click **FINAL**, GL entries are posted immediately—increasing your branch's receivable and, via intercompany sync, increasing the destination branch's payable.

**Q: Can I edit a debit note after finalizing it?**  
**A:** No. Once finalized, the document is locked because GL postings have been made. If you need to make corrections, void the document and create a new one, or issue an Internal Sales Credit Note to offset it.

**Q: What if I need to void a finalized debit note?**  
**A:** Click the **VOID** button on the edit screen (if you have permission). The system will post reversal GL entries and void the corresponding intercompany purchase debit note at the destination branch.

**Q: Does the destination branch need to manually accept the auto-generated purchase debit note?**  
**A:** This depends on your intercompany configuration. It can be set to auto-finalize at the destination branch, or to arrive as a Draft requiring their finance team's acknowledgment.

**Q: Where can I find the corresponding Internal Purchase Debit Note created at the destination branch?**  
**A:** Open your finalized Internal Sales Debit Note and check the **Trace Document** tab. It shows all linked upstream and downstream documents, including the auto-generated purchase debit note.

**Q: Can I link one debit note to multiple original internal invoices?**  
**A:** Yes. Add multiple line items, each referencing a different original Internal Sales Invoice. This consolidates adjustments into a single document.

---

## Related Applets to Internal Sales Debit Note

The Internal Sales Debit Note Applet does not work in isolation; it operates within a broader system ecosystem. Understanding its connection with related applets is vital for accurate financial reporting.

### Doc Item Maintenance Applet
![Doc Item Account Setup](/images/internal-sales-debit-note-applet/Related_Applets_-_Internal_Sales_Debit_Note_12ee5625ed31cafce4d4ac3ed3627c0fcf9d7baef6940effad2a4ed24366e381.png)

**Purpose:** Manages the creation and editing of item codes used in various transactions.

**Relation to Sales Debit Note:** 
The items you select when creating a sales debit note (such as specific charges or fees) must be pre-configured here.
*   The item's **Type** must be set to "Account Type," which deliberately links it to a General Ledger (GL) code rather than a physical product in a warehouse.
*   You assign this item to specific company branches via the **Company Linking** tab, ensuring the system recognizes which branches are allowed to use it.
*   When a GL Code is matched to an item here, you guarantee correct accounting classification downward into your sales debit notes.

### Chart of Account Applet
![Chart of Account General View](/images/internal-sales-debit-note-applet/Related_Applets_-_Internal_Sales_Debit_Note_14a469ad615e4e412eba67b6267efad5b65a069ecc4280abca7904031f5ca296.png)
![GL Code Specifics](/images/internal-sales-debit-note-applet/Related_Applets_-_Internal_Sales_Debit_Note_529ae7682d81c4742baafbab1668f756b7690ba27ac8c6be1de2de20c16c1fb6.png)

**Purpose:** The central applet for managing your organization's financial accounts and GL codes.

**Relation to Sales Debit Note:** 
Before you can link an item in the Doc Item Maintenance applet, the underlying GL Code must physically exist. You create or verify these in the **GL Code Create Item** page. 

**Prerequisite Workflows:**
1.  **Create the GL Code** (Chart of Accounts Applet)
2.  **Create the Item & Link the GL Code** (Doc Item Maintenance Applet)
3.  **Use the Item** (Internal Sales Debit Note Applet)

By ensuring these prerequisites are met, any Internal Sales Debit Note transaction you finalize will automatically and cleanly map revenue and expenses to the exact correct accounts.

**Q: How do I bulk-create debit notes or line items?**  
**A:** Use the **File Import** feature. Download the template, fill in your data, and upload. The system validates and imports all entries at once.

**Q: What does the "KO For" (Knock-Off) tab do?**  
**A:** It allows you to import and link outstanding documents to be knocked off against this debit note—useful for netting internal balances between branches.
