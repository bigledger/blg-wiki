---
title: "Purchase Invoice Supplier Access (Internal) Applet"
description: "Secure portal for suppliers to view and manage purchase invoices, payments, and document history"
tags:
  - supplier-portal
  - purchase-invoices
  - vendor-management
  - financial-transparency
  - payment-tracking
weight: 260
date: 2026-05-04
lastmod: 2026-05-04
---

## Purpose and Overview

The **Internal Purchase Invoice Supplier Access Applet** provides a secure, self-service interface for vendors and suppliers to view their financial transactions with your organization. This applet reduces administrative overhead by allowing suppliers to track invoice status, payment history, and linked documents directly.

{{< callout type="info" >}}
**Core Concept**: A **Supplier Portal** provides restricted, real-time access to purchase invoice (PI) data, ensuring transparency and reducing manual inquiries.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Supplier Finance Teams:**

- 24/7 visibility into invoice status (Submitted, Approved, Paid)
- Track payment history and reconciliation data
- Reconcile their accounts receivable with your organization's system

**Supplier Logistics & Sales:**

- Verify line item details and quantities received
- Access supporting documents and attachments (e.g., Delivery Orders, Proof of Delivery)
- Download PDF copies of finalized purchase invoices

**Internal Procurement & Accounts Payable Teams:**

- Reduced volume of "where is my payment?" emails and calls
- Simplified dispute resolution through shared data access
- Improved vendor relationships through financial transparency

### What Problems Does This Solve?

**The Information Gap Problem:**
Without a supplier portal:

- Suppliers constantly call for payment updates
- Manual reconciliation is time-consuming and error-prone
- Disputes over invoice amounts take days to resolve via email

**The Supplier Access Solution:**

- **Shared Data Source** - One "gold standard" invoice record for both parties
- **Self-Service Status** - Suppliers check payment dates and status themselves
- **Secure File Access** - Instant download of official documents and attachments
- **Linked Document Visibility** - See related documents like Contra or Doc Links

## Key Features Overview

{{< cards >}}
{{< card title="Invoice Listing" subtitle="Comprehensive view of all historical and current invoices" link="#invoice-listing" >}}

{{< card title="Payment Tracking" subtitle="Real-time visibility into payment status and history" link="#payment-tracking" >}}

{{< card title="Document Center" subtitle="Download PDF invoices and view attachments" link="#document-center" >}}

{{< card title="Account Reconciliation" subtitle="View account details and contra entries" link="#account-reconciliation" >}}
{{< /cards >}}

{{< figure src="/images/internal-purchase-invoice-supplier-access-applet/internal-purchase-invoice-supplier-access-applet-overview-infographic.png" alt="Internal Purchase Invoice Supplier Access Flow: From Invoice Creation to Payment Settlement" caption="Seamless Financial Transparency: A visual overview of how internal purchase invoices, line items, and payment settlements are synchronized between the organization and the supplier portal." >}}

---

## Key Concepts

### Understanding the Supplier Access Framework

Every supplier portal must address three fundamental aspects. The Purchase Invoice Supplier Access Applet provides structured handling:

| Aspect                  | Component                   | Practical Example                    |
| ----------------------- | --------------------------- | ------------------------------------ |
| **Who** is viewing?     | Authorized Supplier User    | Vendor's Accounts Receivable Manager |
| **What** is visible?    | Finalized Purchase Invoices | Project PI #10234 for RM 5,000       |
| **How** is it accessed? | Secure Portal Login         | Unique Supplier Access Link/Login    |

### Hierarchy Structure

Think of the supplier access flow as a structured hierarchy:

```
Organization (The Customer)
│
└── Supplier Entity ──→ WHO is accessing?
    │
    └── Purchase Invoices ──→ WHAT is being viewed?
        │
        ├── Main Details ──→ Header info (Date, Amount, Status)
        ├── Line Items ──→ Itemized breakdown
        ├── Payment History ──→ Settlement details
        └── Attachments ──→ Digital copies of original docs
```

### The "Golden Trio" of Supplier Access

To effectively manage expectations, it is crucial to understand how these three pillars work together:

| Component            | Analogy         | Definition                                                                           | System Impact                                        |
| -------------------- | --------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------- |
| **Purchase Invoice** | The "Bill"      | The official record of goods/services provided and the amount owed.                  | Becomes the single source of truth for both parties. |
| **Payment Status**   | The "Checkmark" | The real-time indicator of whether an invoice is unpaid, partially paid, or settled. | Eliminates manual payment inquiries.                 |
| **Supplier Access**  | The "Key"       | The secure permission set that allows a vendor to see ONLY their own data.           | Ensures data privacy and security.                   |

---

## Quick Start Guide

### For Supplier Accounts: Checking Payment Status

**Goal:** Quickly identify which invoices have been paid and which are pending.

1. **Login**: Access the **Supplier Portal** using your provided credentials.
2. **Filter**: On the **Invoice Listing**, use the advanced search to filter by "Outstanding" or specific date ranges.
3. **View Detail**: Click on an invoice row to open the full view.
4. **Check Payment**: Navigate to the **Payment** tab to see linked payment vouchers and settlement dates.

{{< figure src="/images/internal-purchase-invoice-supplier-access-applet/invoice-listing.png" alt="Invoice Listing showing all invoices with status and outstanding amounts" caption="Invoice Listing: Monitor all your invoices and their real-time payment status." >}}

---

### For Supplier Logistics: Verifying Shipments

**Goal:** Confirm that line items match what was delivered.

1. **Locate Invoice**: Search for the relevant PI number in the **Invoice Listing**.
2. **Review Lines**: Go to the **Line Items** tab to see the itemized list, quantities, and unit prices.
3. **Check Attachments**: Switch to the **Attachment** tab to view uploaded Delivery Orders (DO) or inspection reports.

{{< figure src="/images/internal-purchase-invoice-supplier-access-applet/line-items-view.png" alt="Line Items view showing itemized breakdown of the purchase" caption="Line Items View: Verify quantities and pricing for each item delivered." >}}

---

## Status Lifecycle

From the supplier's perspective, invoices typically follow this lifecycle:

| Status                   | Meaning                                                    | Action Required                         |
| ------------------------ | ---------------------------------------------------------- | --------------------------------------- |
| **Draft / Pending**      | The invoice is being processed internally by the customer. | None - Check back later.                |
| **Approved / Finalized** | The invoice is confirmed and awaiting payment.             | Verify that amounts match your records. |
| **Partially Paid**       | A portion of the invoice has been settled.                 | Check **Payment** tab for details.      |
| **Settled / Paid**       | The invoice is fully paid.                                 | Reconcile with your bank statement.     |

---

## Feature Deep Dive

### Invoice Listing & Advanced Search

The main dashboard provides a powerful grid with filtering capabilities. You can toggle columns to show only the information you need, such as `Invoice Date`, `Total Amount`, `Amount Outstanding`, and `Status`.

### Detailed View Tabs

The detailed view is broken down into several specialized tabs:

- **Main Details**: Header level information including currency, branch, and overall status.
- **Account**: Financial coding and account-level summaries.
- **Line Items**: Item-by-item breakdown of the purchase.
- **Payment**: List of all payment transactions linked to this invoice.
- **Department Header**: Tag the invoice with a Dimension, Profit Center, or Project for management reporting.
- **Contra**: Visibility into any contra entries or set-offs applied to the invoice.
- **Doc Link**: Links to related system documents (e.g., Goods Received Notes).
- **Attachment**: Repository for digital files like PDFs, images, or spreadsheets.
- **Export**: Export the invoice to a predefined printable format.

{{< figure src="/images/internal-purchase-invoice-supplier-access-applet/payment-tab.png" alt="Payment tab showing settlement details" caption="Payment Tracking: View all payments and settlements made against the invoice." >}}

## Configuration & Settings

Suppliers can personalize their experience in **Settings**:

- **Sidebar Customization**: Organize the menu for easier navigation.
- **Default Selections**: Set preferred branches or date filters as defaults.
- **Field Configuration**: (Admin only) Controls which fields are visible to the supplier users.

## FAQ

**Q: Can I edit an invoice if I find a discrepancy?**
A: No, the portal is "Read-Only". If you find an error, please contact the procurement department of the customer organization with the specific PI number.

**Q: Where can I download a PDF copy of my invoice?**
A: In the **Export** tab or sometimes via a "Print" button on the **Main Details** tab, depending on the customer's configuration.

**Q: Why can't I see all my historical invoices?**
A: Your access might be limited to a specific date range (e.g., the last 12 months) or specific branches as configured by the customer admin.

**Q: Can I have multiple users for my supplier account?**
A: Yes. The customer organization's admin can invite multiple contacts from your company to have their own individual portal accounts.
