---
title: "Jobsheet (Internal) Applet"
description: "Comprehensive management system for internal job sheets, service tracking, and integrated financial processing"
tags:
- service-management
- jobsheet
- task-tracking
- internal-operations
- billing-integration
weight: 200
---

### 🚀 TL;DR: What Is This Applet For?

**This applet is a worklog with billing context.** You use it to record what service work was done, for which customer, using what parts or labour — so that the finance team can turn it into an invoice without asking follow-up questions.

Think of it like a **restaurant kitchen order**: the kitchen writes down what was prepared (Jobsheet), and the cashier uses that to print the customer's bill (Sales Invoice). The customer never sees the kitchen order — it's internal.

```
Do the work → record it in [Jobsheet] → finance converts to [Sales Invoice] → customer pays
```

It is **not** a commission tool, not a stock system, and not a customer-facing document. It sits between "work was done" and "customer gets billed."

| If you want to... | Use this Applet | Role |
| :--- | :--- | :--- |
| **Record a service job** (what was done, who requested it, what parts were used) | **This Applet (Internal Jobsheet)** | The **Worklog** (Recording) |
| **Convert a job into a sales invoice** (bill the customer) | **Internal Sales Invoice Applet** | The **Billing Counter** (Charging) |
| **Pull jobsheet lines into a quotation or inquiry** | **Sales Inquiry / Quotation Applet** | The **Pre-Sales Desk** (Quoting) |

---

## Purpose and Overview

The **Internal Jobsheet Applet** is a versatile tool designed to capture and manage detailed service records, task completions, and associated costs. It bridges the gap between field work or internal tasks and the financial systems of the organization by integrating account management, line item tracking, and payment processing.

### The "Workshop Job Card" Analogy

If you have ever taken a car to a mechanic, you already understand what a Jobsheet is:

#### 1. This Applet (The Workshop Job Card — Operational)
*   **The Analogy**: You are the **Workshop Manager**. When a customer brings in a car, you open a **Job Card**. You write down the customer's name, what they complained about, what parts were replaced, how many hours the technician worked, and what the final cost is.
*   **The Reality**: This is where you **record the work**. You capture the service entity (who), the line items (what was done and what parts were used), the technician assigned, and the financial settlement (payment or contra).
*   **Accounting Importance**: **To ensure every service is billable and traceable.** Without a Jobsheet, there is no formal record of what was done. You cannot invoice a customer for work that was never documented, and you cannot track the cost of parts consumed during a job.

#### 2. The Sales Invoice Applet (The Cashier Counter — Billing)
*   **The Analogy**: Once the car is fixed, the **Cashier** takes the Job Card and converts it into a **Receipt** for the customer to pay.
*   **The Reality**: The Sales Invoice Applet is where the Jobsheet's line items are pulled into a formal billing document. The Jobsheet is the **source of truth** for what was done; the Invoice is the **financial claim** sent to the customer.
*   **Accounting Importance**: This is where **Revenue is Recognized**. The Jobsheet records the cost; the Invoice records the income. Both must exist for the accounting books to balance.

| Feature | **Internal Jobsheet** | **Internal Sales Invoice** |
| :--- | :--- | :--- |
| **Your Role** | **"Recording the Work"** | **"Charging the Customer"** |
| **Document Type** | Service Record | Financial Claim |
| **Primary User** | Technician / Service Manager | Finance / Billing Team |
| **Analogy** | The **Workshop Job Card** | The **Customer Receipt** |

{{< callout type="info" >}}
**New Employee Note**: If your job is to document what was done on-site or in the workshop, you will spend most of your time in **this applet**. You will only move to the **Sales Invoice Applet** when it is time to bill the customer for the completed work.
{{< /callout >}}

{{< callout type="info" >}}
**Core Concept**: A **Jobsheet** serves as the central record for "Who" requested the work (Account/Entity), "What" was done (Line Items/Service Notes), and "How" it impacts the budget (Payments/Contras/Departments).
{{< /callout >}}

---

## Before You Begin

Before creating your first Jobsheet, confirm the following are in place. Skipping any of these is the most common reason a new user gets stuck on the Create screen.

### Required master data
- **Customer master records** — at least one Customer, Employee, or CRM Contact must exist for the Account → Entity Details step.
- **Branch and Location records** — both are mandatory on every Jobsheet. If your company only operates from one branch, set it as the default in Personalization → Default Selection so you don't have to choose it every time.
- **Item / service catalogue** — at least one item, part, or service must exist before you can add anything to the Lines tab.

### Required upstream documents (typical, not strictly required)
- **Service Note** — if your workflow begins with a customer complaint, the Service Note is normally created first in the Internal RMA Applet. You can then link it from the Search tab when opening the Jobsheet.

### Required permissions
- **Read access to Internal Jobsheets** — controlled by the `TNT_API_DOC_INTERNAL_JOBSHEETS_READ_TGT_GUID` permission. Without it, the applet does not appear in the menu.
- **Tenant Admin / Tenant Owner** roles unlock cross-branch visibility. Without these, you only see Jobsheets for your assigned branch.
- **Show Transaction Date** permission — controls whether the Transaction Date field is visible on Main Details.

### Configuration to confirm before first use
- **Default Branch and Location** — set in Personalization so they pre-fill on every new Jobsheet.
- **Application Settings** — confirm which tabs your workflow uses. Search, Payment, Department Hdr, Contra, Delivery Details, Attachments, Doc Link, Export, and Convert can each be hidden if not needed.
- **Workflow Settings** — if you want Jobsheets to carry a status of their own, configure the workflow statuses and transitions first so the Workflow Status field has meaningful values to choose from. This is a status track filtered by role, not an approval flow.
- **Printable Format** — if you plan to use the Export tab to print Jobsheets as PDF, set up at least one Printable Format template.

---

## Who Uses This Applet

| Role | Main Responsibility |
|------|--------------------|
| **Service Technician / Field Worker** | Open a new Jobsheet at the start of a job; record what was done, parts used, hours billed, and any payment collected on-site. |
| **Service Manager / Operations Manager** | Review draft Jobsheets, correct line items, tag the job to the right department, and finalise records so finance can bill. |
| **Finance / Billing Team** | Apply payments, post contras against existing customer credits, and convert finalised Jobsheets into Sales Invoices or Receipt Vouchers. |
| **Warehouse / Dispatch Team** | Use the Delivery Details tab to confirm that physical parts on the Jobsheet have been dispatched against a Delivery Order or Packing Order. |
| **Admin** | Configure Application Settings, tab visibility, default Branch/Location selections, printable formats, and workflow rules. |

---

## Who Benefits and What This Solves

### Who Benefits from This Applet?

**Service Technicians & Field Workers:**
- Clear documentation of work performed
- Real-time capturing of materials and hours used
- Easy access to customer billing and shipping information
- Mobile-friendly interface for on-site updates

**Operations & Department Managers:**
- Full visibility into all active and completed job sheets
- Ability to track resource allocation and job efficiency
- Department-level reporting for better cost control
- Seamless review and approval of service records

**Finance & Billing Teams:**
- Direct link between service delivery and financial transactions
- Reduction in data entry errors from paper-to-digital migration
- Integrated support for payments, contras, and adjustments
- Accurate departmental cost center allocation

### What Problems Does This Solve?

**The Disconnected Service Workflow Problem:**

Traditional service tracking often relies on loose papers, manual logs, or separate systems that don't talk to accounting. Common issues include:
- Lost or illegible service records
- Delays in billing customers for services rendered
- Difficulty in tracking internal job costs by department
- Lack of centralized history for recurring service tasks
- Manual reconciliation of payments against job records

**The Internal Jobsheet Solution:**

- **Centralized Digital Repository** - All job sheets stored in one searchable location
- **Integrated Account Management** - Directly link jobs to CRM contacts and billing profiles
- **Granular Line Item Tracking** - Detail every service and part used with precision
- **Financial Synchronization** - Record payments and contras within the same workflow
- **Departmental Accountability** - Tag every job to a specific department for transparent reporting

---

## Key Features at a Glance

{{< cards >}}
  {{< card title="Main Details & Job Header" subtitle="Set branch, location, technician, dates, and workflow status" link="#2-main-details-tab" >}}

  {{< card title="Account & Entity Details" subtitle="Manage the customer, Bill To, and Ship To addresses" link="#3-account-tab" >}}

  {{< card title="Line Items (Parts & Labour)" subtitle="Detailed recording of services, parts, and labour" link="#4-lines-tab" >}}

  {{< card title="Payment & Contra" subtitle="Record deposits and offset against existing credits" link="#6-payment-tab" >}}

  {{< card title="Departmental Reporting" subtitle="Allocate jobs to segment, profit centre, dimension, or project" link="#7-department-hdr-tab" >}}

  {{< card title="Audit Chain (Doc Link)" subtitle="See the upstream source and downstream invoice for every job" link="#10-doc-link-tab" >}}
{{< /cards >}}

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-overview-infographic.png" alt="Internal Jobsheet Applet Overview - Challenges (lost paperwork, billing delays, inaccurate tracking), Solution (digital worklog, seamless invoicing, real-time parts tracking), and User Roles (Technicians, Operations Managers, Finance Teams)" caption="Service-to-Cash Workflow: Eliminating disconnected service bottlenecks by centralizing digital job recordings, integrated parts tracking, and automated financial settlements." >}}

---

## Key Concepts

### Understanding the Jobsheet Framework

The system organizes service delivery into three primary pillars to ensure data integrity and operational clarity:

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Entity** | Account & Entity Details | Customer Name, CRM Contact, Billing Address |
| **Service** | Line Items & Notes | Repair Service, Replacement Parts, Labor Hours |
| **Finance** | Payment & Contra | Downpayments, Credit Settlements, Departmental Budget |

{{< callout type="tip" >}}
**Real-World Example**: A technician performs an air-con service (SERVICE) for a corporate client (ENTITY). They record the refrigerant used as a line item, tag it to the "Maintenance Department" (FINANCE), and the system automatically prepares the data for the next billing cycle.
{{< /callout >}}

### Jobsheet Lifecycle Structure

The workflow follows a logical progression from initiation to completion:

```
Organization
│
├── Department ──→ WHERE the cost/credit is attributed
│   │
│   └── Account/Entity ──→ WHO is the recipient of the service
│       │
│       └── Jobsheet Header ──→ Main details, dates, and references
│           │
│           ├── Line Items ──→ SPECIFIC work performed or items used
│           │
│           └── Payments/Contras ──→ FINANCIAL impact and settlements
```

---

## Detailed Menu & Tab Explanation

Below is the complete functional breakdown of every tab inside the Jobsheet form. For each tab, we explain what it does, what data it holds, and why it matters from an accounting perspective.

### 1. Search Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-search-tab.png" alt="Search Tab - quickly locate existing service notes or customers by serial number" caption="Search Tab: The reception desk of the jobsheet, preventing duplicate records and enabling fast retrieval of service history." >}}

*   **What it is**: A quick-lookup panel that lets you find an existing **Service Note** or locate a customer by **Serial Number** before creating a new Jobsheet.
*   **The Analogy**: The **Reception Desk** at a workshop. Before opening a new Job Card, the receptionist checks if this customer or device has been in before.
*   **Data Source**: Searches across existing Service Notes and customer/serial number records in the system.
*   **Accounting Importance**: Prevents **Duplicate Records**. If a customer calls back about the same issue, you can pull the original Jobsheet instead of creating a new one, keeping the billing history clean and avoiding double-charging.

> This tab can be hidden via **Application Settings** if your workflow does not require it.

---

### 2. Main Details Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-main-details-tab.png" alt="Main Details Tab - primary job header information including technician and branch" caption="Main Details Tab: Capturing the core operational details of the job, including responsible staff and service location." >}}

*   **What it is**: The **header** of the Jobsheet. This is where you fill in the core identifying information for the job.
*   **The Analogy**: The **top section of a Job Card** — the customer's name, the date the car came in, the mechanic assigned, and the job reference number.
*   **Key Fields**:

| Field | Purpose |
|-------|---------|
| **Branch / Location** | Which physical site is performing the work |
| **Job Sheet Date** | The official date the job was opened |
| **Technician** | The staff member responsible for the work |
| **Sales Agent** | The person who brought in the business (for commission tracking) |
| **Reference** | An external reference number (e.g., customer's own PO number) |
| **Credit Terms** | Payment terms agreed with the customer (e.g., Net 30) |
| **CRM Contact** | Links the job to a CRM lead or contact record |
| **Member Card** | Links to a loyalty or membership program |
| **Remarks** | Free-text notes about the job |
| **Workflow Status** | The current stage in your internal process, from the workflow attached in Settings |
| **Related Service Notes** | Links to any upstream Service Note documents |

*   **Accounting Importance**: The **Branch** and **Date** fields are critical for **Period-End Reporting**. A job dated in the wrong month will appear in the wrong financial period, causing mismatches in monthly revenue and cost reports.

---

### 3. Account Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-account-tab.png" alt="Account Tab - managing debtor entity details and billing relationships" caption="Account Tab: Defining the primary debtor and link to CRM contacts for the service job." >}}

The Account tab has three sub-tabs that together define **who** this job is for and **where** documents should be sent.

#### 3a. Entity Details
*   **What it is**: The primary customer or entity linked to this Jobsheet.
*   **The Analogy**: The **Customer Profile Card** — who owns the car being serviced.
*   **Data Source**: Pulls from the Customer master, Employee records, or CRM Contacts.
*   **Accounting Importance**: This is the **Debtor Record**. When the Jobsheet is converted to an Invoice, the system uses this entity to post the Accounts Receivable entry. A wrong entity means the invoice goes to the wrong debtor account.

#### 3b. Bill To

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-bill-to-subtab.png" alt="Bill To Sub-tab - specifying the formal billing address for tax and compliance" caption="Bill To: Ensuring the financial claim is sent to the correct legal address for accounting accuracy." >}}

*   **What it is**: The billing address — where the invoice should be sent.
*   **The Analogy**: The **Registered Office Address** of the company paying the bill (which may differ from where the work was done).
*   **Accounting Importance**: Critical for **Tax Compliance**. The billing address determines which tax jurisdiction applies to the transaction. An incorrect address can result in the wrong tax rate being applied.

#### 3c. Ship To
*   **What it is**: The delivery or service address — where the work was physically performed or goods delivered.
*   **The Analogy**: The **Site Address** where the technician actually went to do the work.
*   **Accounting Importance**: Used for **Logistics Costing** and **Delivery Reconciliation**. If your company charges travel or delivery fees, the Ship To address is the basis for calculating those costs.

---

### 4. Lines Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-lines-tab.png" alt="Lines Tab - detailed breakdown of services performed, parts used, and labor hours" caption="Lines Tab: The technical body of the jobsheet where parts consumption and billable services are recorded." >}}

*   **What it is**: The **body** of the Jobsheet — the detailed list of every service performed, every part used, and every hour billed.
*   **The Analogy**: The **Parts & Labour Breakdown** on a mechanic's invoice. Each row is one item: "Engine Oil (2L) — RM 40" or "Labour: 2 hours — RM 100."
*   **Key Actions**:
    *   **Add Line** — Manually add a new service or part.
    *   **Edit Line** — Modify an existing line item's quantity, price, or description.
*   **Accounting Importance**: This is the **Cost of Goods Sold (COGS) and Revenue Detail**. Every line item here directly maps to a product or service in your inventory or service catalog. The system uses these lines to:
    1.  Calculate the **total billable amount** for the Jobsheet.
    2.  Deduct **stock** from inventory if physical parts are used.
    3.  Feed the correct **revenue account codes** when the Jobsheet is converted to an Invoice.

> The **Line Items** sidebar menu provides a separate master listing of all line items across all Jobsheets — useful for managers who need a cross-job view of parts consumption.

#### When the ADD button is disabled

If the **ADD** button at the bottom of the Add Line Item screen is greyed out, one of the following is missing. The system will not let you add the line until every condition is satisfied:

| What's missing | Why the system blocks ADD | Fix |
|---|---|---|
| **Quantity, Net Amount, Net Amount with Tax, or Transaction Amount** is empty or zero on Item Details → Main | Every line must have a positive quantity and a calculated amount before it can be saved | Enter a quantity of 1 or more. The amount fields auto-calculate from the item's unit price — if they stay at 0.00, check that the item's price exists in the master pricing record. |
| **Serial Number required but none added** (the Serial Number tab shows a counter of `0`) | The item is configured in the master as serial-tracked, and the system requires at least one serial number per unit before the line is valid | Open the **Serial Number** tab inside Add Line Item and add as many serial numbers as the quantity. If the customer doesn't have the serials yet, reduce the quantity to 0 or remove the line. |
| **Department form on the line is invalid** | A line-level Department / Profit Centre dropdown has been left empty when one is required by your applet settings | Open the per-line Department section and pick a value, or ask the admin to make the field optional. |

Master-data prerequisites that determine which conditions apply:

- **Item flagged as serial-tracked in the Item Master** → Serial Number tab becomes mandatory.
- **Item flagged as batch-tracked** → Batch Number tab requires `batch_no`, `qty`, `issue_date`, and `expiry_date` before save.
- **Item flagged as bin-tracked** → Bin Number tab requires `bin_code`, `container_measure`, `container_qty`, `container_uom`, and `qty`.
- **Item has no sales price defined in the master** → the amount fields stay at 0.00, which fails the `min(0)` validator on totals.

If you've checked all of the above and the button is still disabled, look for red underlines on any field inside the Item Details, Serial, Batch, Bin, or Department sub-tabs — Angular hides invalid fields until you visit them.

---

### 5. Contra Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-contra-tab.png" alt="Contra Tab - offsetting jobsheet balances against existing customer credits" caption="Contra Tab: Managing financial settlements by netting off outstanding balances against prior credits." >}}

*   **What it is**: A way to offset the Jobsheet's balance against an existing credit — instead of collecting cash, you "net off" what the customer owes against a credit they already have.
*   **The Analogy**: Imagine a customer overpaid on a previous job and has a RM200 credit sitting on their account. Instead of paying cash for this new job, you apply that credit to reduce the amount owed. That's a contra.
*   **Key Actions**:
    *   **Add Contra** — Select a source document (e.g., a credit note) to offset against this Jobsheet.
    *   **Select Document** — Browse and pick the credit document to apply.
*   **Accounting Importance**: Contra entries keep the books clean without cash changing hands. Instead of two separate transactions (pay cash, then refund cash), one contra entry settles both sides simultaneously. This reduces bank reconciliation work and avoids unnecessary cash movements.

> This tab is available in both Create and Edit modes.

---

### 6. Payment Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-payment-tab.png" alt="Payment Tab - recording deposits and direct payments received against the job" caption="Payment Tab: Capturing real-time cash collections and upfront deposits associated with the service work." >}}

*   **What it is**: A record of any payments received directly against this Jobsheet (e.g., a deposit or full payment collected on-site).
*   **The Analogy**: The **Cash Register Receipt** given to the customer at the workshop counter before a formal invoice is raised.
*   **Key Actions**:
    *   **Add Payment** — Record a cash, card, or bank transfer payment.
    *   **Edit Payment** — Modify an existing payment record.
*   **Accounting Importance**: Payments recorded here create a **Debit to Cash/Bank** and a **Credit to the Customer's Account**. This is essential for:
    1.  **Deposit Tracking** — If a customer pays 50% upfront, this tab records it so the final invoice only charges the remaining 50%.
    2.  **Cash Flow Accuracy** — Finance can see real-time cash collected from service jobs without waiting for a formal invoice to be raised.

> This tab can be hidden via **Application Settings** if your workflow requires all payments to go through the Invoice Applet instead.

---

### 7. Department Hdr Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-department-tab.png" alt="Department Hdr Tab - allocating job costs and revenue to internal profit centers" caption="Departmental Classification: Tagging the job to specific internal teams or projects for month-end reporting." >}}

*   **What it is**: Four dropdown fields that tag this Jobsheet to the correct internal team, division, or project inside your company. Think of it like a **branch dropdown — but with four levels of detail instead of one**.

**The simple version**: Your company has multiple departments — Service, Sales, IT, etc. When a technician from the Service department completes a job, someone needs to tell the system "this job belongs to the Service department." That's all this tab does. At month end, finance can then ask "how much did the Service department earn this month?" and the system already knows, because every job was tagged.

The tab has four dropdowns, each one a different way of labelling who owns the job:

| Field | What it is | Example |
|-------|-----------|---------|
| **Segment** | The broadest label — which part of the business? | "Retail" vs "Corporate" vs "Government" |
| **Profit Centre** | Which specific team or branch did this job? | "KL Service Team" or "Penang Branch" |
| **G/L Dimension** | An extra custom tag your finance team defined for their own reporting needs | "North Region" or "Product Line A" |
| **Project** | If this job is part of a bigger ongoing project, link it here | "Senheng Maintenance Contract 2026" |

None of these affect the customer or the invoice. They are purely internal labels so management can slice the numbers at month end — by branch, by team, by project — without manually sorting through every job.

> This tab can be hidden via **Application Settings** if your organization does not use these classifications.

---

### Edit-Only Tabs

The following tabs only appear when **editing** an existing Jobsheet (not during initial creation). They unlock additional capabilities once the record has been saved.

### 8. Delivery Details Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-delivery-details-tab.png" alt="Delivery Details Tab - read-only view of linked physical stock movements" caption="Delivery Tracking: Providing visibility into dispatched parts and logistics associated with the jobsheet." >}}

*   **What it is**: A **read-only** view of delivery records that have been linked to this Jobsheet. You cannot create or add deliveries from here — this tab only displays records that already exist in the Delivery system.
*   **The Analogy**: The **Dispatch Log** at the back of the workshop — a read-only copy that shows which trips were dispatched against this job. The actual dispatch is arranged by the warehouse, not the technician.
*   **Why it is empty / why you cannot add anything**: Delivery records are created and managed in the **Delivery Order (Internal) Applet** or **Packing Order Applet**. Once a delivery is created there and linked to this Jobsheet's line items, it automatically appears here. If no deliveries have been dispatched against this job yet, the tab will be empty — that is expected behaviour, not a permission issue.
*   **What the tab shows** (once deliveries exist): Trip No, Driver Name, Vehicle No, Job Start Date, Job End Date, Delivery Status, Recipient Name, Qty.
*   **Accounting Importance**: Links the service record to physical stock movements, ensuring inventory deductions are traceable back to the originating job. Prevents stock discrepancies where parts were dispatched but never tied to a document.

---

### 9. Attachments Tab

*   **What it is**: A file repository for documents related to this Jobsheet — photos, signed forms, warranties, inspection reports, etc.
*   **The Analogy**: The **physical folder** clipped to the Job Card at a workshop, containing the customer's signature, before/after photos, and any warranty paperwork.
*   **Key Actions**:
    *   **Add Attachment** — Upload a file (image, PDF, etc.) to the Jobsheet record.
    *   **View Attachment** — Open and review an existing attached file.
*   **Accounting Importance**: Attachments serve as **supporting evidence** for audit purposes. If a customer disputes a charge, the signed job approval or photo evidence attached here is the proof that the work was authorised and completed.

---

### 10. Doc Link Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-doc-link-tab.png" alt="Doc Link Tab - traceability between upstream orders and downstream invoices" caption="Audit Chain: Visualizing the full lifecycle of the document from source request to final settlement." >}}

*   **What it is**: A traceability panel showing which documents this Jobsheet was **copied from** and which documents were **copied from** this Jobsheet.
*   **Sub-tabs**:
    *   **Copied From** — Shows the upstream document (e.g., a Sales Order or Service Note) that this Jobsheet originated from.
    *   **Copied To** — Shows downstream documents (e.g., a Sales Invoice) that were created using this Jobsheet as a source.
*   **The Analogy**: The **paper trail** on a Job Card — "this job came from Work Order #123" and "this job was billed as Invoice #456."
*   **Accounting Importance**: This is the **Audit Chain**. Auditors and finance teams can trace any invoice back to the original service request, and any service request forward to its final billing document. Without this, you cannot prove the full lifecycle of a transaction.

---

### 11. Export Tab

*   **What it is**: A PDF export tool for printing the Jobsheet as a formatted document.
*   **Key Actions**:
    *   Select a **Printable Format** (configured in Settings).
    *   Click **Export as PDF** to generate the printable version.
*   **The Analogy**: The **Print button** — turning the digital Job Card into a physical document you can hand to the customer or file away.
*   **Accounting Importance**: The printed Jobsheet serves as a **source document** for manual filing and customer sign-off. In some workflows, the customer signs the printed Jobsheet to authorise billing before the invoice is raised.

---

### 12. Convert Tab

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-convert-tab.png" alt="Convert Tab - one-click conversion of jobsheet to receipt voucher" caption="Financial Conversion: A direct action to finalize a job and replace it with a formal receipt." >}}

*   **What it is**: A one-click action to convert the Jobsheet directly into an **Internal Receipt Voucher**.
*   **Important**: This action **cancels the current Jobsheet** and creates a Receipt Voucher in its place.
*   **The Analogy**: Tearing up the Job Card and replacing it with a Receipt — used when the job was simple enough that a full invoice isn't needed, just a proof of payment.
*   **Accounting Importance**: A Receipt Voucher is a simpler financial document than an Invoice. Converting to one is appropriate for cash-on-the-spot jobs where no credit terms or formal billing cycle is needed. It closes the job financially in one step.

---

## Status Reference

A Jobsheet has **three status fields running at the same time**, which is the single thing most likely to confuse a new user. They each answer a different question.

| Field | Question it answers | Typical values |
|---|---|---|
| **Record Status** | Is the record itself in use? | ACTIVE, INACTIVE, TEMP |
| **Posting Status** | Has the document been committed to the books? | (blank / Draft), FINAL, VOID, DISCARDED |
| **Workflow Status** | Where does the work physically stand? | CREATED, IN-PROGRESS, COMPLETED, ON-HOLD |

For everyday work you mostly care about **Posting Status**. A normal lifecycle reads: **Draft → FINAL → (VOID if reversed)**. **DISCARD** applies to drafts only; **VOID** applies to FINAL only — the two buttons never appear at the same time. See the FAQ and Troubleshooting sections for what each action does and when buttons are hidden.

---

## How the Applets Work Together (The Full Service Lifecycle)

To understand exactly where the Jobsheet fits, follow this **Record ➡ Quote ➡ Bill ➡ Deliver** chain:

### 1. THE RECORD (This Applet: Internal Jobsheet)
**What happens**: A technician or service manager opens a new Jobsheet. They document the customer, the work performed, the parts used, and any on-site payments collected.
*   **Role**: This applet is the **Workshop Log**. It captures the operational reality of what happened.
*   **Analogy**: Writing the Job Card at the workshop.

### 2. THE QUOTE (Sales Inquiry / Quotation Applet)
**What happens**: Before or after a job, a sales rep may pull the Jobsheet's line items into a **Sales Inquiry** or **Quotation** to give the customer a formal price estimate. The system allows "Jobsheet Item" as a source when adding lines.
*   **Role**: These applets are the **Pre-Sales Desk**. They use the Jobsheet as a reference to build a customer-facing price document.
*   **Analogy**: The service advisor showing the customer a written estimate based on the mechanic's findings.

### 3. THE BILL (Internal Sales Invoice Applet)
**What happens**: Once the job is complete and approved, the Finance team converts the Jobsheet into a **Sales Invoice**. The line items, account details, and pricing flow directly from the Jobsheet into the Invoice.
*   **Role**: The Sales Invoice Applet is the **Cashier Counter**. It takes the workshop record and turns it into a legal financial claim.
*   **Analogy**: The cashier printing the final receipt for the customer to pay.

### 4. THE DISPATCH (Packing Order / Delivery Order Applet)
**What happens**: If the job involves physical goods being sent to the customer (e.g., replacement parts shipped to a site), a **Packing Order** or **Delivery Order** can be created using the Jobsheet as a knock-off source.
*   **Role**: These applets handle the **Physical Movement** of goods linked to the job.
*   **Analogy**: The warehouse team packing and shipping the parts that the mechanic ordered.

---

### Key Takeaway for New Employees
*   If you are the one **doing the work** (technician, service manager)? Use **This Applet**.
*   If you are the one **quoting the customer** before the job? Use the **Sales Inquiry / Quotation Applet**.
*   If you are the one **billing the customer** after the job? Use the **Sales Invoice Applet**.
*   If you are the one **shipping parts** to the customer? Use the **Packing Order / Delivery Order Applet**.

---

### 1. Internal Sales Invoice Applet (The Cashier Counter)
*   **The Analogy**: This is the **Cashier** who takes the completed Job Card and prints the final bill.
*   **The Reality**: The Sales Invoice Applet pulls line items and account details from the Jobsheet to create a formal, billable document. When you click "Create Invoice," the ERP links the two documents together.
*   **Accounting Importance**: This is where **Revenue is Recognized** in the books. The Jobsheet records the cost of doing the work; the Invoice records the income earned. Without this link, your P&L will show costs without matching revenue.

### 2. Sales Inquiry / Quotation Applet (The Pre-Sales Desk)
*   **The Analogy**: The **Service Advisor** who shows the customer a written estimate before the work begins.
*   **The Reality**: When adding line items in a Sales Inquiry or Quotation, users can select "Jobsheet Item" as the source — pulling lines directly from an existing Jobsheet. This avoids re-keying data and ensures the quote matches the actual work scope.
*   **Accounting Importance**: Ensures **Price Consistency**. The quoted price and the actual billed price come from the same source, reducing disputes and credit note adjustments later.

### 3. Packing Order / Delivery Order Applet (The Dispatch Bay)
*   **The Analogy**: The **Warehouse Team** that packs and ships the parts ordered during the job.
*   **The Reality**: If a Jobsheet involves physical goods being dispatched to a customer site, a Packing Order can be raised using the Jobsheet as a knock-off source. This links the stock movement to the original service record.
*   **Accounting Importance**: Ensures **Inventory Accuracy**. Parts consumed during a job are properly deducted from stock, preventing phantom inventory — items that appear in the system but have already been used.

### 4. Internal Sales Inquiry Applet (The Intake Form)
*   **The Analogy**: The **Intake Form** filled out before the job even starts — capturing what the customer wants before committing to a Jobsheet.
*   **The Reality**: A Sales Inquiry can reference Jobsheet items as a source for its own line items, creating a traceable chain from initial inquiry through to job completion and billing.
*   **Accounting Importance**: Provides a **Complete Audit Trail** from the first customer contact to the final payment, which is essential for dispute resolution and revenue forecasting.

---

## Quick Start Guide

Get your team up and running with these standard workflows.

### For Technicians: Creating a New Jobsheet

**Goal:** Document a service visit in 5 simple steps.

1. **Navigate**: Go to **Internal Jobsheet** and click **"+" (Create)**
2. **Search First** *(optional)*: Use the **Search** tab to check if a Service Note or prior job exists for this customer.
3. **Fill Main Details**: Enter the job title, date, assign the **Technician**, and select the relevant **Branch**.
4. **Set the Account**: Go to the **Account** tab → **Entity Details** and select the Customer or CRM Contact. Set **Bill To** and **Ship To** addresses.
5. **Add Services**:
   - Go to the **Lines** tab
   - Click **"Add Line"**
   - Select the service/item and enter the quantity/amount
6. **Save/Submit**: Click **Save** to keep as a draft or **Create** to finalize the record.

---

### For Managers: Reviewing and Editing

**Goal:** Ensure job accuracy and departmental alignment.

1. **Check Listing**: Open the **Jobsheet Listing** to see all active entries.
2. **Review Details**: Click on a jobsheet to verify the billing info, shipping address, and line item accuracy.
3. **Adjust If Needed**: Update the department in the **Department Hdr** tab or modify line items to correct entries.
4. **Finalize**: Approve the jobsheet for processing by the finance department.

---

### For Finance: Handling Settlements

**Goal:** Record payments or apply contras to completed jobs.

1. **Locate Job**: Open the finalized jobsheet from the listing.
2. **Access Finance Tab**: Go to the **Payment** tab.
3. **Apply Settlement**: Enter payment details or select an existing credit to perform a contra.
4. **Verify Balance**: Ensure the settlement matches the jobsheet total for accurate accounting.

---

## Configuration & Settings

To tailor the applet to your specific business needs, use the **Settings** section:

### System Configuration

| Setting | Purpose |
|---------|---------|
| **Application Settings** | Show or hide specific tabs (Search, Payment, Department Hdr) and fields (Credit Terms, Currency, Member Card, etc.) based on your workflow |
| **Default Selection** | Set the default Branch and Location pre-filled when creating a new Jobsheet |
| **Printable Format Settings** | Configure the layout and content of printed Jobsheet documents |
| **Branch Settings** | Define branch-specific rules and behaviors |
| **Workflow Settings** | Attach a workflow process so Jobsheets carry a status; defines statuses and role-filtered transitions, not approvals |

### Personalization

| Setting | Purpose |
|---------|---------|
| **Default Selection** | Each user can set their own preferred default Branch and Location |
| **Sidebar** | Customize which menu items appear in the navigation sidebar |

---

## If Something Is Wrong

Use this table when a button doesn't appear, a field is missing, or an action doesn't behave as you expected. Every entry gives you something to try before you contact your administrator.

| Symptom | Likely Cause | What To Do |
|---|---|---|
| **CREATE or SAVE button is greyed out** | The Main Details form or the Account form has a validation error | Check that **Branch** and **Location** are selected on Main Details, and that an **Entity** (customer / employee / CRM Contact) is chosen on the Account tab. Required fields show in red. |
| **FINAL button does not appear** | Posting Status is already FINAL/VOID/DISCARDED, OR the admin has enabled `HIDE_GENDOC_FINAL_BUTTON` in Application Settings | Open the Jobsheet and check its Posting Status in the header. If it's still a Draft, ask your administrator to confirm the Hide FINAL Button setting is OFF. |
| **VOID button does not appear** | The Jobsheet is not yet FINAL — VOID only shows on posted documents | If you want to cancel a draft instead, use **DISCARD**. VOID is reserved for reversing FINAL Jobsheets. |
| **DISCARD button does not appear** | The Jobsheet is already FINAL/VOID/DISCARDED, OR the admin has enabled `HIDE_GENDOC_DISCARD_BUTTON` | A FINAL Jobsheet cannot be DISCARDed — use **VOID** instead. For drafts, ask admin to confirm the Hide DISCARD setting. |
| **Search, Payment, Department Hdr, or Contra tab is missing** | The tab has been hidden in Application Settings (`HIDE_SEARCH_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_MAIN_CONTRA_TAB`) | Ask your administrator to toggle the relevant Hide setting OFF. |
| **Delivery Details, Attachments, Doc Link, Export, or Convert tab is missing** | These tabs appear in Edit mode only — never on the initial Create screen | Click **Save** first to create the draft, then reopen it from the Listing. If still missing, the corresponding HIDE setting may be on. |
| **Search returns no results for a customer or service note** | The record is INACTIVE, or the search term doesn't match the code / name | Try a partial code. If nothing matches, ask your administrator to confirm the record is Active. |
| **Pricing or sales-agent columns hidden on the Lines tab** | Visibility is gated by permission or by `HIDE_SALES_AGENT` setting | Ask your administrator to grant the pricing-visibility permission or toggle the setting OFF. |
| **Bulk FINAL from the Listing skipped some rows** | Some selected rows were already FINAL/VOID/DISCARDED, or had validation errors | Open each unprocessed row individually to see which validation failed. |
| **The Transaction Date field is missing** | Permission `SHOW_TRANSACTION_DATE` is not granted | Ask your administrator to grant the Show Transaction Date permission. |
| **ADD button on the line item screen is greyed out** | Missing quantity/amount, OR serial-tracked item with no serial numbers entered, OR an invalid per-line Department field | See [When the ADD button is disabled](#when-the-add-button-is-disabled) under the Lines tab for the full checklist. |

{{< callout type="warning" >}}
**Bulk FINAL warning**: Selecting multiple rows on the Jobsheet Listing and clicking FINAL posts every eligible draft simultaneously. Posting cannot be undone — each Jobsheet would have to be VOIDed individually. Verify your selection carefully before confirming.
{{< /callout >}}

---

## Related Applets

The Jobsheet sits in the middle of a wider service-to-cash workflow. Here is every applet that connects to it and what role it plays:

### Upstream (feeds INTO the Jobsheet)

| Applet | Relationship | Plain English |
| :--- | :--- | :--- |
| **Internal RMA Applet** (Service Note) | A Service Note is the customer's complaint/return request. The Jobsheet is opened to record the actual repair work done in response. | Customer says "my device is broken" → **Service Note**. Technician fixes it → **Jobsheet**. |
| **Sales Order (Internal) Applet** | A Sales Order commits to doing the work. The Jobsheet records what actually happened. | "We agreed to service your air-con" → **Sales Order**. "Here's what we did" → **Jobsheet**. |

---

### Downstream (Jobsheet feeds INTO these)

| Applet | Relationship | Plain English |
| :--- | :--- | :--- |
| **Sales Invoice (Internal) Applet** | The most direct downstream link. Finance pulls the Jobsheet's lines and account details to generate the customer's bill. | Jobsheet = what was done. Invoice = the bill for it. |
| **Sales Invoice No Stock-Out (Internal) Applet** | Same as above but for pure service jobs where no physical stock is deducted (e.g., labour-only jobs). | Used when the job is 100% service/labour with no parts from inventory. |
| **Sales Quotation (Internal) Applet** | A quotation can be built by pulling Jobsheet line items as a source, so the quote reflects actual work scope. | "Based on what we found, here's the price estimate" — pulled from the Jobsheet. |
| **Sales Inquiry (Internal) Applet** | Same as Quotation — inquiry lines can be sourced from a Jobsheet to avoid re-keying. | Early-stage customer discussion that references the Jobsheet's findings. |
| **Delivery Order (Internal) Applet** | If parts need to be physically delivered to the customer's site, a Delivery Order is raised from the Jobsheet. | "The parts are ready, now ship them." |
| **Packing Order Applet** | Warehouse uses the Jobsheet as a knock-off source to pack and dispatch parts linked to the job. | "Pack these specific parts from the Jobsheet and send them out." |

---

### Adjustment / Correction (after billing)

| Applet | Relationship | Plain English |
| :--- | :--- | :--- |
| **Sales Credit Note (Internal) Applet** | If the customer was overcharged or a job was cancelled after invoicing, a Credit Note reverses part of the invoice that came from the Jobsheet. | "We charged too much — here's a credit." |
| **Sales Debit Note (Internal) Applet** | If additional charges need to be added after the invoice was raised (e.g., extra parts discovered later), a Debit Note is issued. | "We missed charging for this part — here's the extra bill." |

---

### The Full Picture

{{< figure src="/images/internal-jobsheet-applet/internal-jobsheet-full-lifecycle-infographic.png" alt="Internal Jobsheet full service lifecycle - Service Note / RMA at the top, flowing down through Sales Order, Jobsheet (this applet), Sales Invoice, Delivery Order, and Credit / Debit Note at the bottom" caption="Service-to-Cash Lifecycle: how the Jobsheet connects the upstream customer request to downstream billing, dispatch, and post-invoice adjustments." >}}

<!-- ```
[Service Note / RMA]  ←  Customer reports a problem
        ↓
[Sales Order]         ←  Company commits to doing the work
        ↓
[Jobsheet] ◄──────────── YOU ARE HERE (record what was done)
        ↓
[Sales Invoice]       ←  Bill the customer
        ↓
[Delivery Order]      ←  Ship any parts (if needed)
        ↓
[Credit / Debit Note] ←  Correct the bill if needed
``` -->

---

## FAQ

**Q: Can I save a jobsheet partially and finish it later?**
A: Yes, use the **Save** button to keep the jobsheet in **Draft** status. You can return to it via the Listing view anytime.

**Q: Can I link a jobsheet to a CRM contact instead of a full Customer record?**
A: Yes, the applet supports choosing between existing Employees, CRM Contacts, or Main Customer entities in the Account tab.

**Q: What is the "Contra" feature used for?**
A: Contra is used to offset the cost of a jobsheet against an existing credit or another transaction, simplifying the settlement process without needing cash exchange.

**Q: Can I track parts used from inventory in a jobsheet?**
A: Yes, by adding line items that are linked to your inventory master data, you can track precisely which parts were consumed during the job.

**Q: How does a Jobsheet become an Invoice?**
A: Once the Jobsheet is finalized, the Finance team opens the **Internal Sales Invoice Applet** and creates a new invoice, selecting the Jobsheet as the source document. The line items and account details are automatically pulled across.

**Q: Can I see all line items across multiple Jobsheets in one view?**
A: Yes. The **Line Items** section in the sidebar provides a master listing of all line items across all Jobsheets, useful for parts consumption analysis and cross-job reporting.

**Q: What happens to the Department Hdr tab if my company doesn't use cost centers?**
A: You can hide the **Department Hdr** tab entirely via **Application Settings** so it does not appear in the Jobsheet form.

**Q: What is the minimum I must complete before SAVE / CREATE?**
A: Three things: **Branch**, **Location**, and a **Status** on the Main Details tab, plus an **Entity** (Customer, Employee, or CRM Contact) on the Account → Entity Details tab. Without these the SAVE / CREATE button stays disabled.

**Q: What happens after I click FINAL?**
A: The Posting Status changes from Draft to **FINAL**. The form becomes read-only, the FINAL and DISCARD buttons are replaced by a **VOID** button, and the Jobsheet becomes available as a source document for the Sales Invoice and Receipt Voucher applets. Any stock-tracked line items are deducted from inventory at this point.

**Q: What is the difference between DISCARD and VOID?**
A: **DISCARD** abandons a draft that has never been FINAL. **VOID** reverses a Jobsheet that has already been FINAL. The two buttons never appear at the same time — the system shows the one that applies to the current state.

**Q: Can I edit a Jobsheet after FINAL?**
A: No. Once FINAL, the form is read-only. If you need to change something, VOID the Jobsheet and create a new one, or — if an invoice has already been raised — issue a Credit Note or Debit Note against that invoice instead.

**Q: Why is the CREATE button disabled?**
A: The most common cause is a missing **Branch**, **Location**, or **Entity**. Open Main Details and the Account tab and look for red underlines. If everything looks filled, your administrator may have hidden the SAVE button via the `HIDE_GENDOC_SAVE_BUTTON` setting.

**Q: Why can't I see the Delivery Details / Convert / Attachments tab?**
A: These tabs appear in Edit mode only. Click **Save** to create the Jobsheet, reopen it from the Listing, and the additional tabs will appear. If they still don't appear, your administrator may have hidden them via Application Settings.

**Q: Can I bulk-finalize Jobsheets from the Listing?**
A: Yes. Select multiple rows and click **FINAL** on the Listing toolbar. Only eligible drafts will be finalised — rows already FINAL/VOID/DISCARDED, or rows with validation errors, are skipped. A **Bulk VOID** option is available on the same toolbar for posted Jobsheets.

**Q: What happens to inventory when I FINAL a Jobsheet with stock parts on the Lines tab?**
A: Stock-tracked line items are deducted from inventory at the Location selected on Main Details. Service-only or labour-only lines have no inventory impact. If the downstream document is a **Sales Invoice No Stock-Out**, no further stock movement happens at invoicing.

**Q: I clicked Convert — what just happened to my Jobsheet?**
A: Convert turns the Jobsheet into an **Internal Receipt Voucher** and cancels the original Jobsheet in one step. Use it only when the job was simple enough to settle in one payment, with no formal invoice needed. If you also need a Sales Invoice, do **not** use Convert — raise the invoice from the Sales Invoice applet instead.

---

## Glossary

| Term | Plain-English Definition |
|---|---|
| **Jobsheet** | A worklog that records what service work was done, for whom, using what parts or labour. The source document the finance team uses to bill the customer. |
| **Posting Status** | Whether the document has been committed to the accounting books. Blank/Draft = editable; FINAL = posted; VOID = reversed; DISCARDED = abandoned draft. |
| **Record Status** | The lifecycle state of the record itself, separate from accounting impact. ACTIVE = in use; INACTIVE = retired; TEMP = placeholder during creation. |
| **DRAFT** | A Jobsheet that has been saved but not yet FINAL. Still fully editable. |
| **FINAL** | The action of posting a Jobsheet. After FINAL the form is read-only and the Jobsheet becomes a source for billing. |
| **VOID** | The action of reversing a FINAL Jobsheet. The Jobsheet stays visible for audit; it cannot be edited. |
| **DISCARD** | The action of abandoning a draft that was never FINAL. Different from VOID, which applies after FINAL. |
| **Workflow Status** | The operational stage of the job (CREATED, IN-PROGRESS, COMPLETED, ON-HOLD). Tracks where the work physically stands, independent of whether the document has been posted. |
| **KO / Knock-off** | Pulling line items from a source document into a new document instead of re-typing them — for example, pulling Service Note lines into a Jobsheet. |
| **Contra** | When two parties owe each other money, contra offsets the amounts so only the net difference is settled. No actual cash moves. |
| **Credit Note** | A document that reduces what a customer owes — used when they were overcharged or returned goods. |
| **Debit Note** | A document that increases what a customer owes — used when extra charges are discovered after the invoice was issued. |
| **Receipt Voucher** | A simpler financial document than an invoice, used for on-the-spot cash payments where no credit terms or formal billing cycle is needed. |
| **Service Note** | An upstream document recording a customer's complaint or service request. Often the trigger for opening a Jobsheet. Lives in the Internal RMA Applet. |
| **Entity** | The Customer, Employee, or CRM Contact the Jobsheet is for. In accounting terms, the "Debtor Record" — who will eventually be billed. |
| **Bill To** | The legal billing address — where the invoice is sent. Determines the tax jurisdiction. |
| **Ship To** | The physical service or delivery address — where the work was actually performed. |
| **Profit Centre** | An internal team or branch that "owns" the Jobsheet for reporting. Lets finance answer "how much did the Service team earn this month?" without manually sorting every record. |
| **Segment** | The broadest internal grouping for reporting — e.g. Retail vs Corporate vs Government. Used on the Department Hdr tab. |
| **G/L Dimension** | A custom internal tag defined by your finance team for their own reporting needs (e.g. North Region, Product Line A). Used on the Department Hdr tab. |
| **Tenant Admin / Tenant Owner** | High-privilege roles that unlock cross-branch visibility. Without these, a user can only see Jobsheets for their assigned branch. |
