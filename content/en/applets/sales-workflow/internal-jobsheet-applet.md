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
**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Internal Jobsheet Applet** is a versatile tool designed to capture and manage detailed service records, task completions, and associated costs. It bridges the gap between field work or internal tasks and the financial systems of the organization by integrating account management, line item tracking, and payment processing.

{{< callout type="info" >}}
**Core Concept**: A **Jobsheet** serves as the central record for "Who" requested the work (Account/Entity), "What" was done (Line Items/Service Notes), and "How" it impacts the budget (Payments/Contras/Departments).
{{< /callout >}}

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

## Key Features Overview

{{< cards >}}
  {{< card title="Jobsheet Management" subtitle="Create, edit, and track comprehensive service records" link="#jobsheet-creation--management" >}}

  {{< card title="Account & Entity Detail" subtitle="Manage billing, shipping, and customer relationships" link="#account--entity-selection" >}}

  {{< card title="Line Item Tracking" subtitle="Detailed recording of services, parts, and labor" link="#line-item-tracking" >}}

  {{< card title="Payment & Contra" subtitle="Integrated financial processing and settlements" link="#integrated-payments--contras" >}}

  {{< card title="Departmental Reporting" subtitle="Allocate and track jobs by internal cost centers" link="#departmental-allocation" >}}

  {{< card title="Draft & History" subtitle="Save progress and maintain a full audit trail" link="#draft-management--audit" >}}
{{< /cards >}}

## Key Concepts

### Understanding the Jobsheet Framework

The system organizes service delivery into three primary pillars to ensure data integrity and operational clarity:

| Aspect | Component | Practical Example |
|--------|-----------|------------------|
| **Entity** | Account & Entity Details | Customer Nama, CRM Contact, Billing Address |
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

## Quick Start Guide

Get your team up and running with these standard workflows.

### For Technicians: Creating a New Jobsheet

**Goal:** Document a service visit in 5 simple steps.

1. **Navigate**: Go to **Internal Jobsheet** and click **"+" (Create)**
2. **Select Account**: Search and select the Customer or CRM Contact.
3. **Fill Main Details**: Enter the job title, date, and select the relevant **Department**.
4. **Add Services**: 
   - Go to the **Line Items** tab
   - Click **"Add Line"**
   - Select the service/item and enter the quantity/amount
   - Add detailed notes in the **Service Note** section
5. **Save/Submit**: Click **Save** to keep as a draft or **Create** to finalize the record.

---

### For Managers: Reviewing and Editing

**Goal:** Ensure job accuracy and departmental alignment.

1. **Check Listing**: Open the **Jobsheet Listing** to see all active entries.
2. **Review Details**: Click on a jobsheet to verify the billing info, shipping address, and line item accuracy.
3. **Adjust If Needed**: Update the department or modify line items to correct entries.
4. **Finalize**: Approve the jobsheet for processing by the finance department.

---

### For Finance: Handling Settlements

**Goal:** Record payments or apply contras to completed jobs.

1. **Locate Job**: Open the finalized jobsheet from the listing.
2. **Access Finance Tab**: Go to the **Payment/Contra** section.
3. **Apply Settlement**: Enter payment details or select an existing credit to perform a contra.
4. **Verify Balance**: Ensure the settlement matches the jobsheet total for accurate accounting.

---

## Configuration & Settings

To tailor the applet to your specific business needs, use the **Settings** section:

- **Department Setup**: Configure which departments can be associated with jobsheets.
- **Address defaults**: Set default billing and shipping behaviors.
- **Personalization**: Customize columns in the listing view for specific user roles.
- **Applet Settings**: Enable or disable specific tabs like **Account** if they are not required for your workflow.

---

## FAQ

**Q: Can I save a jobsheet partially and finish it later?**
A: Yes, use the **Save** button to keep the jobsheet in **Draft** status. You can return to it via the Listing view anytime.

**Q: Can I link a jobsheet to a CRM contact instead of a full Customer record?**
A: Yes, the applet supports choosing between existing Employees, CRM Contacts, or Main Customer entities.

**Q: What is the "Contra" feature used for?**
A: Contra is used to offset the cost of a jobsheet against an existing credit or another transaction, simplifying the settlement process without needing cash exchange.

**: Can I track parts used from inventory in a jobsheet?**
A: Yes, by adding line items that are linked to your inventory master data, you can track precisely which parts were consumed during the job.

---
