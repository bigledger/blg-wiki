---
title: "Internal Consignment Billing Applet"
description: "Comprehensive financial system for converting consignment stock issues into final sales invoices and financial settlements"
tags:
- sales-workflow
- consignment-billing
- order-fulfillment
- finance
- accounts-receivable
weight: 50
---

{{< callout type="warning" >}}
**Daily cashier report applet user guide still under progress**

**Work in Progress: This documentation is currently under development. Visual assets (screenshots) and further details will be added soon.**
{{< /callout >}}

## Purpose and Overview

The **Internal Consignment Billing Applet** is a specialized financial tool designed to manage the process of invoicing goods that have been previously issued on consignment. It allows teams to convert Goods Issue Notes (GINs) or previous consignment transfers into final sales invoices once the goods are sold or used by the consignee, ensuring accurate financial recognition and inventory-to-revenue synchronization.

{{< callout type="info" >}}
**Core Concept**: A **Consignment Billing** record is the financial finalization of a previous physical stock movement, moving the asset from "Consignment Out" to "Revenue" within the organization's ERP.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Sales Representatives & Account Managers:**
- Precise tracking of current consignment sales performance
- Accurate calculation of commissions and incentives based on finalized billing
- Visibility into which client-held stock is ready for invoicing
- Reduced friction in reconciling monthly sales reports from consignees

**Finance & Accounts Receivable Managers:**
- Automated conversion of physical GIN records into financial invoice documents
- Reliable aging and AR tracking for long-term consignment partners
- Improved month-end consolidation of inter-company or external consignment revenue
- Reduced manual effort through template-based and bulk billing tools

**Stock Controllers & Auditors:**
- Seamless visibility into the path from stock issue to final sale
- Complete audit trails of every consignment billing transaction
- Verification that billed quantities match previously issued consignment notes
- Prevention of duplicate billing or orphaned consignment stock records

### What Problems Does This Solve?

**The Consignment-to-Cash Gap Problem:**

Managing stock held by third parties or internal branches through consignment involves significant reconciliation challenges:
- Difficulty in tracking which specific physical issues (GINs) have been finalized as sales
- Discrepancies between physical consumption reports and final system invoicing
- Manual errors or delays in applying the correct contract price to consignment sales
- Lack of centralized visibility into the total outstanding consignment value
- Complex tax and currency conversion issues at the point of billing

**The Consignment Billing Solution:**

- **Direct GIN Mapping Engine** - Instant conversion of one or multiple consignment issues into a single invoice
- **Consumption-Based Billing** - Precise control over the volume of consignment stock being billed per cycle
- **Bulk Import Capabilities** - Efficiently process high-volume consignment cycles using standardized Excel templates
- **Integrated Audit Logic** - Every invoice is tied back to its original physical movement for complete traceability
- **Real-Time Financial Sync** - Automatically updates revenue, tax, and AR accounts upon document finalization

## Key Features Overview

{{< cards >}}
  {{< card title="Billing Conversion" subtitle="Directly convert consignment issues into final sales invoices" link="#billing-workflow" >}}

  {{< card title="GIN-to-Invoice Link" subtitle="Maintain complete traceability to original stock movements" link="#traceability" >}}

  {{< card title="Bulk File Import" subtitle="Upload large consignment billing cycles via templates" link="#bulk-import" >}}

  {{< card title="Consignee Dashboard" subtitle="View all outstanding consignment stock for a specific entity" link="#consignee-view" >}}

  {{< card title="Financial Rules" subtitle="Automated tax and pricing application per billing cycle" link="#financial-parameters" >}}

  {{< card title="Audit & Reporting" subtitle="Detailed history of consignment finalizations and settlements" link="#audit-trails" >}}
{{< /cards >}}

## Key Concepts

### The Consignment Invoicing Framework

To manage the strategic transition from physical asset to revenue, the applet follows a structured logic:

| Stage | Action | Impact |
|-------|--------|--------|
| **Consignment GIN** | Physical stock issued to consignee. | Stock moves to "Transit/Consignment" location. |
| **Billing Cycle** | Consumption report received from consignee. | **Consignment Billing Applet** used to create invoice. |
| **Final Invoice** | Transaction finalized. | **Revenue recorded**, AR updated, Stock finalized. |

{{< callout type="tip" >}}
**Real-World Example**: A distributer issues RM 5,000 worth of parts to a service sub-contractor. Using this applet at the end of the month, they select the original GIN, tick the items the contractor has used, and the system automatically generates an invoice for the specific consumed amount while keeping the remaining stock in the consignment account.
{{< /callout >}}

### From Stock to Revenue

The system facilitates the financial culmination of an order:

```
Physical Supply Chain
│
├── Inventory Out ──→ Consignment Goods Issue Note (GIN)
│   │
│   └── Consignment Billing ──→ Financial Recognition & Invoicing
│       │
│       └── Settlement ──→ Payment received from Consignee
```

---

## Quick Start Guide

### For Sales: Finalizing Your Monthly Billings

**Goal:** Convert a consignee's sales report into a finalized system invoice.

1. **Navigate**: Go to **Consignment Billing** and click **"+"**.
2. **Select Entity**: Choose the Consignee or Branch you are billing.
3. **Select Issues**:
   - Access the **Consignment Issue List** within the applet.
   - select the relevant GINs that match the current consumption report.
   - Update quantity or items if only a partial billing is required.
4. **Review & Create**: Verify the total amount and taxes, then click **Create**. The system will generate the invoice linked to those specific GINs.

---

### For Finance: Bulk Processing via Import

**Goal:** Process a wide range of consignment billings across multiple branches.

1. **Get Template**: Go to **File Import** and download the Consignment Billing template.
2. **Populate Details**: Fill in the GIN numbers, items, and billing quantities based on your consolidations.
3. **Upload & Verify**: Upload the file to the applet. The system will validate that the GINs exist and are not yet fully billed.
4. **Finalize All**: Click **Process All** to generate the batch of invoices for the month.

---

## Configuration & Settings

Configure the billing environment through the **Settings** section:

- **Consignment Locations**: Define which inventory locations are used for consignment tracking.
- **Import Mapping**: Customize the Excel column headers for bulk billing uploads.
- **Document Prefixes**: (Where applicable) Configure specific billing series for consignment-related invoices.
- **Personalization**: Customize filters in the billing list to view by Merchant, Consignee, or Status.

---

## FAQ

**Q: Can I bill a single GIN partially over multiple months?**
A: Yes. The system tracks the remaining balance of every GIN. You can select a GIN and bill only a portion of the items; the remainder stays available for future billing cycles.

**Q: What if the pricing has changed since the original consignment was issued?**
A: This applet allows you to apply current prices or specific contract prices during the billing phase, regardless of the price used on the original stock movement note.

**Q: Can I see which GINs are still outstanding?**
A: Yes, you can use the **Consignment Listing** or integration with the stock applets to see all GINs that have not yet been fully converted into invoices.

**Q: Does it support Inter-company Consignments?**
A: Yes. If your organization uses inter-company entities for inventory management, the applet can bridge the transaction to create a purchase record in the receiving company automatically.

---
