---
title: "Internal Sales Invoice (No Stock-Out) Applet"
description: "Comprehensive financial invoicing system for services, non-inventory items, and intercompany transactions without physical stock deduction"
tags:
- sales-workflow
- intercompany-billing
- financial-invoicing
- accounts-receivable
- no-stock-out
weight: 35
---

{{< callout type="warning" >}}
**Daily cashier report applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Internal Sales Invoice (No Stock-Out) Applet** is a specialized financial tool designed for invoicing scenarios where physical inventory movement is not required. It is the primary solution for billing professional services, managing intercompany transfers, and processing bulk financial-only documents without impacting real-time warehouse inventory levels.

{{< callout type="info" >}}
**Core Concept**: A **No Stock-Out Invoice** focuses purely on the financial transaction—updating accounts receivable and general ledger accounts while bypassing the warehouse Goods Issue Note (GIN) process.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Financial Accountants & Controllers:**
- Precise control over intercompany billing and financial consolidation
- Accurate GL mapping for service-based revenue streams
- Reduction in inventory reconciliation errors caused by non-physical items
- Streamlined monthly billing cycles for recurring services

**Sales & Project Teams:**
- Quick invoicing for professional services, maintenance, and consulting
- Flexibility to invoice project milestones without needing warehouse stock
- Improved turnaround time for contract-based billing
- Visibility into billing status for internal engagements

**Intercompany Relationship Managers:**
- Automated or manual mapping of transactions between related entities
- Clear audit trail of inter-entity costs and revenue transfers
- Unified view of all cross-company financial movements
- Reduction in manual entry through intercompany transaction bridging

### What Problems Does This Solve?

**The "Ghost Stock" Deduction Problem:**

Standard invoicing systems often assume a physical product is being sold, leading to operational conflicts:
- Accidental stock deductions for services (e.g., deducting "Labor" from inventory)
- Warehouse staff receiving picking lists for items that don't physically exist
- Complex inventory "adjustments" needed to fix accidental GIN generation
- Distorted inventory valuation due to non-physical item postings
- Reconciliation delays between sales and the general ledger

**The No Stock-Out Solution:**

- **Inventory-Neutral Posting** - Updates financials without triggering warehouse workflows
- **Service-First Invoicing** - Specialized support for non-inventory items and professional services
- **Intercompany Transaction Engine** - Built-in support for mapping cross-entity sales and purchases
- **Bulk Template Ingestion** - Import large volumes of invoices via Excel or CSV with automated validation
- **Financial Template Management** - Create and reuse invoice patterns for standard recurring billings

## Key Features Overview

{{< cards >}}
  {{< card title="Financial Invoicing" subtitle="Create sales invoices that bypass inventory deductions" link="#invoicing-creation" >}}

  {{< card title="Intercompany Bridge" subtitle="Seamlessly map transactions between related entities" link="#intercompany-transactions" >}}

  {{< card title="Bulk File Import" subtitle="Upload and process multiple invoices via templates" link="#bulk-import" >}}

  {{< card title="Precision Mapping" subtitle="Configure tax, discounts, and GL accounts per line" link="#line-item-management" >}}

  {{< card title="Processing Queue" subtitle="Monitor and manage pending invoices for finalization" link="#processing-listings" >}}

  {{< card title="Audit & Reporting" subtitle="Detailed history and financial traceability" link="#audit-trails" >}}
{{< /cards >}}

## Key Concepts

### Understanding Financial-Only Invoicing

To maintain accounting integrity, the system distinguishes these invoices by how they interact with the organization's backend:

| Metric | Standard Invoice | No Stock-Out Invoice |
|--------|------------------|----------------------|
| **GL Posting** | Yes | Yes |
| **AR Update** | Yes | Yes |
| **Warehouse GIN** | Yes (Automated) | **No** |
| **Inventory Levels** | Decremented | **Unchanged** |

{{< callout type="tip" >}}
**Real-World Example**: A consulting firm invoices a client for "5 Hours of Senior Consulting". Using the **No Stock-Out Applet**, they generate the invoice, record the RM 1,000 revenue in the GL, and update the Customer AR balance without the warehouse team receiving a picking list for "Consulting Hours".
{{< /callout >}}

### The Intercompany Flow

The system facilitates the "Buyer-Seller" relationship within the same group:

```
Entity A (Seller)
│
├── No Stock-Out Invoice ──→ Records Revenue
│   │
│   └── Intercompany Map ──→ Automatic Notification to Entity B
│       │
│       └── Entity B (Buyer) ──→ Receives matched Purchase Document
```

---

## Quick Start Guide

### For Finance: Creating a Service Invoice

**Goal:** Invoice a customer for non-physical services in 4 steps.

1. **Navigate**: Go to **Sales Invoice (No Stock-Out)** and click **"+"**.
2. **Select Entity**: Choose the Customer or Related Intercompany Entity.
3. **Add Line Items**:
   - Go to the **Line Items** tab.
   - Select non-inventory items (e.g., Professional Services, Maintenance).
   - Verify the **GL Account** mapping for revenue recognition.
4. **Finalize**: Click **Create/Final** to post the financial transaction. The GL and AR will update immediately.

---

### For Data Teams: Bulk Uploading Invoices

**Goal:** Process high-volume billings using an Excel template.

1. **Locate Import**: Go to the **File Import** section of the applet.
2. **Download Template**: Get the latest Sales Invoice No Stock-Out template.
3. **Populate & Upload**: Fill in client IDs, dates, items, and amounts, then upload the file.
4. **Verify & Process**: Review the imported data in the **Import Queue** for errors and click **Process All** to generate the invoices.

---

## Configuration & Settings

Customize the financial behavior through the **Settings** hub:

- **Item Configuration**: Mark specific items as "Service" to ensure they appear in this applet.
- **Intercompany Mapping Rules**: Define which departments and entities are linked for automatic transaction bridging.
- **Template Management**: Create standard invoice headers for different types of internal billing (e.g., IT Support, Management Fees).
- **Listing Personalization**: Customize filters and columns in the invoice listing for specific user roles.

---

## FAQ

**Q: Can I use this applet for physical products if I don't want to track stock?**
A: Yes, if your business process dictates that stock is managed externally or not at all, this applet allows you to sell products without the system checking or deducting inventory.

**Q: How do I handle tax on a No Stock-Out invoice?**
A: Tax logic (SST, GST, or VAT) applies the same way as a standard invoice—it is calculated based on the line item configuration and the customer's tax profile.

**Q: Is it possible to convert a No Stock-Out invoice to a standard one?**
A: Typically, these are distinct document types for audit purposes. It is better to cancel the incorrect document and create a new one in the appropriate applet.

**Q: Can I print a standard invoice layout from this applet?**
A: Yes. The system supports custom invoice templates so that the final PDF looks professional and consistent with your organization’s standard invoices.

---
