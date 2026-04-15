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

{{< callout type="warning" >}}
**Internal Jobsheet Applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

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

## Key Features Overview

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

## Key Features Overview

{{< cards >}}
  {{< card title="Jobsheet Management" subtitle="Create, edit, and track comprehensive service records" link="#jobsheet-creation--management" >}}

  {{< card title="Account & Entity Detail" subtitle="Manage billing, shipping, and customer relationships" link="#account-tab" >}}

  {{< card title="Line Item Tracking" subtitle="Detailed recording of services, parts, and labor" link="#lines-tab" >}}

  {{< card title="Payment & Contra" subtitle="Integrated financial processing and settlements" link="#payment-tab" >}}

  {{< card title="Departmental Reporting" subtitle="Allocate and track jobs by internal cost centers" link="#department-hdr-tab" >}}

  {{< card title="Draft & History" subtitle="Save progress and maintain a full audit trail" link="#draft-management--audit" >}}
{{< /cards >}}

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

*   **What it is**: A quick-lookup panel that lets you find an existing **Service Note** or locate a customer by **Serial Number** before creating a new Jobsheet.
*   **The Analogy**: The **Reception Desk** at a workshop. Before opening a new Job Card, the receptionist checks if this customer or device has been in before.
*   **Data Source**: Searches across existing Service Notes and customer/serial number records in the system.
*   **Accounting Importance**: Prevents **Duplicate Records**. If a customer calls back about the same issue, you can pull the original Jobsheet instead of creating a new one, keeping the billing history clean and avoiding double-charging.

> This tab can be hidden via **Application Settings** if your workflow does not require it.

---

### 2. Main Details Tab

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
| **Workflow Status** | The current stage in your internal approval process |
| **Related Service Notes** | Links to any upstream Service Note documents |

*   **Accounting Importance**: The **Branch** and **Date** fields are critical for **Period-End Reporting**. A job dated in the wrong month will appear in the wrong financial period, causing mismatches in monthly revenue and cost reports.

---

### 3. Account Tab

The Account tab has three sub-tabs that together define **who** this job is for and **where** documents should be sent.

#### 3a. Entity Details
*   **What it is**: The primary customer or entity linked to this Jobsheet.
*   **The Analogy**: The **Customer Profile Card** — who owns the car being serviced.
*   **Data Source**: Pulls from the Customer master, Employee records, or CRM Contacts.
*   **Accounting Importance**: This is the **Debtor Record**. When the Jobsheet is converted to an Invoice, the system uses this entity to post the Accounts Receivable entry. A wrong entity means the invoice goes to the wrong debtor account.

#### 3b. Bill To
*   **What it is**: The billing address — where the invoice should be sent.
*   **The Analogy**: The **Registered Office Address** of the company paying the bill (which may differ from where the work was done).
*   **Accounting Importance**: Critical for **Tax Compliance**. The billing address determines which tax jurisdiction applies to the transaction. An incorrect address can result in the wrong tax rate being applied.

#### 3c. Ship To
*   **What it is**: The delivery or service address — where the work was physically performed or goods delivered.
*   **The Analogy**: The **Site Address** where the technician actually went to do the work.
*   **Accounting Importance**: Used for **Logistics Costing** and **Delivery Reconciliation**. If your company charges travel or delivery fees, the Ship To address is the basis for calculating those costs.

---

### 4. Lines Tab

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

---

### 5. Payment Tab

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

### 6. Department Hdr Tab

*   **What it is**: The **cost center allocation** for this Jobsheet — which internal department is responsible for or benefiting from this job.
*   **The Analogy**: The **Internal Charge-Back Form** in a large company. If the IT department calls in a technician to fix a server, the cost is "charged back" to the IT department's budget, not the general company account.
*   **Accounting Importance**: This is the foundation of **Management Accounting**. Without department tagging:
    *   You cannot produce a **Profit & Loss by Department** report.
    *   You cannot hold department heads **accountable** for their team's service costs.
    *   Month-end **cost allocation** becomes a manual, error-prone exercise.

> This tab can be hidden via **Application Settings** if your organization does not use departmental cost centers.

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
| **Workflow Settings** | Configure the approval workflow stages and status transitions for Jobsheets |

### Personalization

| Setting | Purpose |
|---------|---------|
| **Default Selection** | Each user can set their own preferred default Branch and Location |
| **Sidebar** | Customize which menu items appear in the navigation sidebar |

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

```
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
```

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

---
