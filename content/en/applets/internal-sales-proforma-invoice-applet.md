---
title: "Internal Sales Proforma Invoice Applet"
description: "Comprehensive internal billing management system for creating, editing, and tracking sales proforma invoices and line items"
tags:
  - proforma-invoice
  - sales-management
  - billing
  - internal-job-sheet
  - financial-control
weight: 170
---

## Purpose and Overview

The **Internal Sales Proforma Invoice Applet** is designed to streamline the preliminary billing process within an organization. It allows sales teams to generate proforma invoices—often referred to as **Internal Job Sheets**—which serve as draft or estimated billing documents before a final invoice is issued.

{{< callout type="info" >}}
**Core Concept**: The applet manages the lifecycle of an **Internal Job Sheet**, linking client details, project dimensions, and itemized costs into a unified document for internal review and approval.
{{< /callout >}}

{{< figure src="/images/internal-sales-proforma-invoice-applet/main-listing.png" alt="Internal Sales Proforma Invoice Main Listing" caption="Main Listing: Overview of all Internal Job Sheets with search and filtering options." >}}

## Key Features Overview

### Who Benefits from This Applet?

**Sales Teams & Agents:**

- Quickly create draft invoices for client review
- Track sales leads and CRM contacts directly on the document
- Manage complex line items with multi-UOM support

**Finance & Billing Teams:**

- Maintain oversight of pending internal billing documents
- Ensure tax compliance through integrated SST and WHT configurations
- Convert proforma documents into final financial records

**Operations & Project Managers:**

- Link billing to specific projects, profit centers, and segments
- Monitor costing and pricing details at a granular level
- Track delivery instructions and logistics data per line item

### What Problems Does This Solve?

**The Fragmented Billing Problem:**

Drafting invoices often involves manual spreadsheets, leading to:

- Disconnect between sales leads and billing documents
- Difficulty tracking project-specific costs
- Inconsistent tax application and UOM conversions
- Lack of centralized visibility for pending proforma documents

**The Internal Sales Proforma Invoice Solution:**

- **Centralized Management** - A single source of truth for all internal proforma invoices
- **Granular Control** - Extensive configuration settings to hide/show fields based on business needs
- **Financial Accuracy** - Automated tax calculations and multi-currency support
- **Dimensional Tracking** - Seamlessly link document headers and lines to Projects, Segments, and Profit Centers
- **Audit Ready** - Full history tracking and attachment support for supporting documents
- **Integration Ready** - Connects with inventory and sales modules for seamless conversion

## Key Features Overview

{{< figure src="/images/internal-sales-proforma-invoice-applet/old-way-vs-new-way-infographic.png" alt="From Manual Sheets to Digital Proformas: The Old Way (spreadsheets, missing leads, tax errors) vs The New Way (centralized, automated, project-linked)." caption="Efficiency Gains: Transitioning from fragmented manual drafting to a structured, integrated digital proforma system." >}}

{{< cards >}}
{{< card title="Document Listing" subtitle="Unified view of all Internal Job Sheets" link="#document-listing" >}}

{{< card title="Proforma Creation" subtitle="Intuitive create/edit workflow with CRM integration" link="#for-sales-agents-create-your-first-proforma" >}}

{{< card title="Line Item Management" subtitle="Detailed itemization with costing and pricing" link="#line-item-management" >}}

{{< card title="Dimensional Tracking" subtitle="Link to Projects, Segments, and Profit Centers" link="#dimensional-tracking" >}}

{{< card title="Tax & Compliance" subtitle="Configurable SST, WHT, and multi-currency support" link="#configuration--settings" >}}

{{< /cards >}}

{{< figure src="/images/internal-sales-proforma-invoice-applet/internal-sales-proforma-invoice-applet-overview-infographic.png" alt="Internal Sales Proforma Invoice Applet: The Old Way vs The New Way" caption="Internal Sales Proforma Invoice Applet Overview: Visualizing the journey from manual, fragmented processes to a centralized, digital billing solution." >}}

## Key Concepts

### Internal Job Sheet (JS) Framework

An "Internal Job Sheet" is the primary document type in this applet. It serves as the foundation for internal sales proforma invoicing.

| Aspect                     | Component            | Practical Example                             |
| -------------------------- | -------------------- | --------------------------------------------- |
| **Who** is involved?       | Client & Sales Agent | CRM Contact: "John Doe", Agent: "Sarah Smith" |
| **What** is being billed?  | Line Items           | 10x "Consulting Hours", 2x "Hardware Units"   |
| **Where** is it allocated? | Dimensions           | Project: "Alpha", Profit Center: "Services"   |

{{< callout type="tip" >}}
**Real-World Example**: A sales agent creates a proforma invoice for a client's bulk order. They select the items, apply the agreed-upon project dimensions, and set the credit terms. The document is then used as an internal reference for fulfillment before final invoicing.
{{< /callout >}}

### The "Golden Triangle" of Proformas

To effectively manage the billing flow, it is crucial to understand how **Clients**, **Items**, and **Dimensions** interact.

| Component          | Analogy     | Definition                                                 | Example                 |
| ------------------ | ----------- | ---------------------------------------------------------- | ----------------------- |
| **Client/Contact** | The "Who"   | The entity or person receiving the preliminary bill.       | **ABC Corp**            |
| **Sales Item**     | The "What"  | The actual goods or services being itemized.               | **Consulting Services** |
| **Dimensions**     | The "Where" | The internal project or department the revenue belongs to. | **Project Alpha**       |

**How they link:**

1. You identify the **Client** from the CRM.
2. You add **Sales Items** to the document, drawing from the master inventory or service list.
3. You allocate each item (or the whole header) to a **Dimension** (Project/Segment).
4. The resulting **Internal Job Sheet** provides a complete picture for both the client and internal accounting.

### Data Hierarchy

The applet follows a standard header-line structure:

```
Internal Job Sheet (Header)
│
├── Main Details (Client, Date, Currency, Terms)
│   └── Dimensions (Project, Segment, Profit Center)
│
└── Line Items (Specific Goods/Services)
    ├── Pricing & Costing (Unit Price, Tax, Discount)
    ├── Delivery Instructions (Shipping details)
    └── Extended Info (Serial Numbers, Batch Numbers)
```

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

{{< figure src="/images/internal-sales-proforma-invoice-applet/quick-start-guide-infographic.png" alt="Effortless Proforma Management: A Quick Guide for Every Role - showing workflows for Sales Agents and Managers" caption="Streamlined Billing: A visual guide for Sales Agents (Creation) and Managers (Review & Finalization)." >}}

### For Sales Agents: Create Your First Proforma

**Goal:** Generate a proforma invoice (Internal Job Sheet) in 5 steps.

1. **Navigate**: Open **Internal Sales Proforma Invoice** from the applet menu.
2. **Create New**: Click the **"+"** button to start a new document.
3. **Fill Header**:
   - Select **Company** and **Branch**.
   - Pick a **CRM Contact** and **Sales Agent**.
   - Set the **Credit Terms** and **Currency**.
4. **Add Items**:
   - Switch to the **Line Items** tab.
   - Click **"Add Item"**.
   - Search for your product/service.
   - Enter **Quantity** and **Unit Price**.
5. **Save & Finalize**: Click **Save** to keep as draft or **Finalize** (if enabled) to lock the document.

{{< figure src="/images/internal-sales-proforma-invoice-applet/create-edit-form.png" alt="Create/Edit Internal Job Sheet Form" caption="Create/Edit Form: Capturing document header details and account information." >}}

**Pro Tip**: Use the "Permit No" and "Member Card" fields if you are handling international shipments or loyalty program members.

---

### For Managers: Review and Process

**Goal:** Review team proformas and prepare them for final invoicing.

1. **Check Listing**: Go to the **Internal Sales Proforma Invoice Listing**.
2. **Filter by Status**: Look for documents in "Draft" or "Pending" status.
3. **Review Details**:
   - Open the document and verify the **Line Items** and **Pricing**.
   - Ensure **Dimensions** (Projects/Profit Centers) are correctly allocated.
4. **Finalize**: Click **Finalize** or **Final** to signal that the document is ready for conversion to a permanent invoice.

**What happens next?** Once finalized, the document can be processed by the finance team into a VAT/GST invoice or a Commercial Invoice.

---

### For Admins: Configuration & Setup

**Goal:** Tailor the applet interface to your organization's needs.

1. **Field Visibility** (`Settings > Field Configuration`):
   - Toggle on/off fields like **Permit No**, **Member Card**, or **Tracking ID**.
   - Hide entire tabs (e.g., Costing Details, Issue Link) if they aren't used.
2. **Dimension Settings**:
   - Enable/Disable **Project**, **Segment**, or **Profit Center** tracking at the header or line level.
3. **Printable Formats**:
   - Select the default layout for PDF generation.
4. **Workflow Configuration**:
   - Define status mapping (e.g., Draft -> Pending -> Approved).

{{< figure src="/images/internal-sales-proforma-invoice-applet/line-item-listing.png" alt="Line Item Listing View" caption="Line Items: Detailed view of all line items across different documents." >}}

---

## Advanced Line Item Tracking

**Go beyond simple itemization with powerful line-level controls.**

### Costing vs. Pricing

The applet allows you to track both the **Cost** to the company and the **Price** listed for the client. This is essential for:

- **Margin Analysis**: Real-time visibility into the profitability of each line.
- **Internal Transfers**: Managing costs between departments.

### Inventory & Logistics

For physical goods, you can track detailed inventory data:

- **Batch No & Serial No**: Essential for warranty tracking and quality control.
- **Bin Number**: Know exactly where in the warehouse the item is located.
- **UOM Ratios**: Handle complex units of measure (e.g., selling by "Box" while tracking stock in "Pieces").

### Dimensional Allocation

Every line item can be uniquely allocated:

- **Project Link**: Assign specific lines to different client projects.
- **Profit Center**: Distribute revenue across multiple business units within a single document.

---

## Configuration & Settings

The applet is highly configurable to suit different business models.

### Field Configuration

Admins can control nearly every field in the document header and line items.

| Setting Area          | Key Options                                                  |
| --------------------- | ------------------------------------------------------------ |
| **Main Details**      | Hide Credit Terms, Currency, CRM Contact, Tracking ID        |
| **Line Item Pricing** | Hide Unit Price (Incl/Excl Tax), Unit Discount, Qty Base/UOM |
| **Inventory Details** | Hide Bin Number, Batch Number, Serial Number                 |
| **Taxation**          | Enable/Disable SST and WHT selection                         |

### Workflow & Statuses

Define how documents progress through your internal system.

- **Custom Statuses**: Up to 5 custom header statuses and 5 line-level statuses can be enabled.
- **Labels**: Customize names for sales agents or delivery fields.

{{< figure src="/images/internal-sales-proforma-invoice-applet/settings-page.png" alt="Applet Settings Page" caption="Configuration & Settings: Tailor field visibility and system behavior." >}}

---

## FAQ

**Q: Is "Internal Job Sheet" different from a Proforma Invoice?**  
A: Technically, they are the same in this applet. "Internal Job Sheet" is the term used for the draft document that tracks the labor, materials, and overhead before a final invoice is generated.

**Q: Can I hide sensitive pricing information from certain users?**  
A: Yes. Using the **Field Configuration** settings, admins can hide costing tabs and net price fields for specific user roles.

**Q: What happens to a proforma invoice after it's finalized?**  
A: It serves as the "source of truth" for the final Sales Invoice. Finalizing locks the document to prevent further changes before the accounting department takes over.

**Q: How do I handle tax-exempt clients?**  
A: You can disable SST/WHT selection at the header or line level, or select a tax-exempt configuration from the dropdown if the client's CRM profile permits.

**Q: Can I attach supporting documents?**  
A: Yes, the **Attachment** tab allows you to upload PDFs, images, or spreadsheets (e.g., signed quotes or site photos) directly to the proforma invoice.

**Q: How do I find a proforma invoice from six months ago?**  
A: Use the **Document Listing** filters. You can search by date range, client name, or document reference number.
