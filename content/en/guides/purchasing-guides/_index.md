---
title: "Purchasing Guides"
description: "Comprehensive procurement workflows for different business scenarios - from standard PO processes to direct invoicing"
weight: 35
bookCollapseSection: false
---

Master the art of procurement with flexible workflows designed for real-world business scenarios.

---

## 🚀 Get Started / Setup

New to purchasing in BigLedger? Start with the standard workflow to learn the full procurement cycle.

{{< cards >}}
  {{< card link="/guides/purchasing-guides/standard-procurement-workflow" title="📋 Standard Procurement Workflow" subtitle="Complete PO → GRN → Invoice flow — start here to understand the full purchasing process" >}}
  {{< card link="/guides/purchasing-guides/direct-grn-workflow" title="📦 Direct GRN Workflow" subtitle="Skip PO creation — ideal for walk-in purchases or urgent deliveries" >}}
{{< /cards >}}

**Before you begin, ensure:**
- Supplier master data is configured in [Supplier Maintenance](/applets/master-data/supplier-applet-1/)
- Inventory items are set up in [Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/)
- Chart of accounts includes purchase expense and tax accounts
- *(Optional)* Purchase order or requisition approvals are configured, if you want them — see [Document Approvals](/guides/document-approvals/)

{{< callout type="tip" >}}
**First time?** Use the [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) as your default. Only use simplified workflows when there's a clear business reason to skip steps.
{{< /callout >}}

---

## 📝 Daily Tasks

Guides for everyday purchasing operations your team performs.

### Standard Workflows

{{< cards >}}
  {{< card link="/guides/purchasing-guides/standard-procurement-workflow" title="Standard Procurement Workflow" subtitle="Complete PO → GRN → Invoice flow with three-way matching for full control and audit trail" >}}
  {{< card link="/guides/purchasing-guides/direct-grn-workflow" title="Direct GRN Workflow" subtitle="Skip PO creation and go directly to goods receipt — ideal for walk-in purchases or urgent deliveries" >}}
  {{< card link="/guides/purchasing-guides/direct-invoice-workflow" title="Direct Invoice Workflow" subtitle="Process purchases without PO or GRN — perfect for services, utilities, and non-stock items" >}}
{{< /cards >}}

### Special Scenarios

{{< cards >}}
  {{< card link="/guides/purchasing-guides/invoice-first-workflow" title="Invoice-First Workflow" subtitle="Handle situations where invoice arrives before goods delivery with proper tracking and matching" >}}
  {{< card link="/guides/purchasing-guides/consignment-purchasing" title="Consignment Purchasing" subtitle="Manage consignment stock where you only pay when items are used or sold" >}}
{{< /cards >}}

---

## ⚠️ Common Scenarios / Pitfalls

Watch out for these frequent purchasing issues:

| Scenario | What Happens | How to Handle |
|----------|-------------|---------------|
| **Partial deliveries** | Only some items arrive | Create GRN for received quantity, keep PO open for balance |
| **Price changed since PO** | The knocked-off invoice shows the ordered price; the supplier's paper shows theirs | Settle it before FINAL — a draft can be discarded, a finalised invoice can only be voided or credited |
| **Goods damaged in transit** | Stock quality issue | GRN for good items, reject damaged, request credit note from supplier |
| **Invoice lost or delayed** | Month-end close blocked | Track outstanding GRNs, follow up with supplier, accrue for close |
| **Urgent after-hours purchase** | No time for the standard process | Use the Direct GRN workflow and write the reason and who agreed it into the remarks — that sentence is the whole audit trail |
| **Duplicate PO created** | Double-ordering risk | Check existing POs before creating new ones; search by supplier |

{{< callout type="warning" >}}
**Check PO ↔ GRN ↔ Invoice yourself.** The knock-off puts the real quantities and prices on your screen, but nothing compares them to the supplier's paper for you and nothing flags a difference. The check happens before you click FINAL on the invoice, or it does not happen.
{{< /callout >}}

---

## 📊 Reporting Usage

Track your procurement performance and spending health.

**Where the numbers actually live:**

- **[Purchase Report](/applets/purchase-workflow/purchase-report-applet/)** — purchase analysis across purchase orders, GRNs and invoices.
- **Purchase Order Queue** (inside the Purchase Order applet) — the open-queue rows: lines you have committed to and not yet received or invoiced. This is your outstanding-orders list.
- **PO Line with GRN KO** and **PO Line with PI KO** (same applet) — your ordered lines set against what has actually been received, and against what has been invoiced.
- **[Creditor Report](/applets/finance/creditor-report-applet/)** and **[Debtor and Creditor Report](/applets/finance/debtor-and-creditor-report-applet/)** — what you owe suppliers, by age.
- **[Stock Availability](/applets/inventory-workflow/stock-availability-applet/)** — including *GRN quantity*: goods received and not yet invoiced.

**Reporting tips:**
- Check the Purchase Order Queue weekly and chase anything overdue.
- Use *PO Line with GRN KO* to find orders that were partly delivered and forgotten — those are what the CLOSE button on the order is for.
- Review creditor ageing before each payment run.

## Core Purchasing Concepts

### Matching is a knock-off, not a scoring engine

The controlled purchase path uses three documents:

1. **Purchase Order** — what you ordered and the agreed price
2. **Goods Received Note** — what actually arrived and was counted
3. **Purchase Invoice** — what the supplier is charging you

They are tied together by **knock-off**: each document pulls the previous one's open lines in from the open queue, so the quantities on the bill are the quantities from the bay, and the quantities from the bay are set against the quantities you ordered.

{{< callout type="warning" >}}
**There is no variance engine.** BigLedger has no tolerance bands, no variance report and no automatic flag when a supplier bills a different quantity or price than you ordered. The knock-off brings the real numbers onto your screen; noticing that they differ from the supplier's paper is a person's job, and the moment to do it is before you click FINAL on the invoice.
{{< /callout >}}

### Which document does what

| Document | Moves stock? | Posts to the ledger? |
|---|---|---|
| Purchase Order | No | No |
| Purchase GRN | **No** | **No** |
| Purchase GRN Stock In *(alternative path)* | Yes, stock in | Yes |
| Purchase Invoice | **Yes, stock in** | **Yes** |
| Purchase Invoice No Stock In *(pairs with GRN Stock In)* | No | Yes |
| Payment Voucher | No | Yes |

Your company uses **either** GRN → Purchase Invoice **or** GRN Stock In → Purchase Invoice No Stock In. Mixing a document from each pair either counts your stock twice or never counts it, with no warning.

### Document Flow Overview

```
Standard Flow:
Purchase Requisition → Purchase Order → Goods Receipt → Purchase Invoice → Payment
     (Optional)          (Required)       (Required)        (Required)      (Required)

Simplified Flows:
Direct GRN: Goods Receipt → Purchase Invoice → Payment
Direct Invoice: Purchase Invoice → Payment
```

## Key User Roles

Different team members handle different parts of the purchasing process:

### Purchasing Admin
- Creates and manages purchase orders
- Coordinates with suppliers
- Manages supplier relationships
- Monitors procurement compliance

### Warehouse Staff
- Receives goods deliveries
- Verifies quantities and quality
- Scans serial numbers
- Updates stock locations
- Creates goods received notes

### Accounts Payable
- Processes supplier invoices
- Performs three-way matching
- Handles payment processing
- Resolves invoice discrepancies
- Maintains supplier accounts

{{< callout type="info" >}}
**Role Separation**: For proper internal controls, the same person should not create POs, receive goods, AND process invoices. Implement segregation of duties based on your organization's size.
{{< /callout >}}

## Essential Setup Requirements

Before processing purchases, ensure these are configured:

### 1. Supplier Master Data
- Supplier accounts with complete information
- Payment terms and conditions
- Tax registration details
- Bank account information
- Contact persons and communication channels

### 2. Inventory Items
- Item master data for purchased goods
- Default suppliers and lead times
- Reorder points and quantities
- Standard costs and price history
- Storage locations and bin allocations

### 3. Chart of Accounts
- Purchase expense accounts
- Asset accounts for capital items
- Tax accounts (input tax/VAT)
- Accrual accounts for goods-in-transit
- Prepayment accounts

### 4. System Configuration
- *(Optional)* Approval levels and approvers for requisitions and purchase orders
- Document numbering sequences
- Default tax codes
- Tolerance levels for matching
- Notification settings

## Integration with Other Modules

Purchasing integrates seamlessly with:

- **[Inventory Module](/modules/inventory/)** - Stock updates and warehouse management
- **[Financial Accounting Module](/modules/financial-accounting/)** - Purchase accounting and AP
- **[Fixed Asset](/applets/finance/fixed-asset-applet/)** - Capital equipment, once purchased

## Document Management

Every purchasing transaction requires proper documentation:

### Documents to Upload
- **Purchase Orders** - Original PO sent to supplier
- **Delivery Orders (DO)** - Supplier's delivery note
- **Packing Lists** - Detailed item listing
- **Purchase Invoices** - Supplier's invoice
- **Quality Certificates** - For regulated items
- **Inspection Reports** - Quality control documentation

{{< callout type="tip" >}}
**Digital Filing**: Scan and attach all supporting documents to transactions. This creates a complete audit trail and enables paperless operations.
{{< /callout >}}

## Common Purchasing Scenarios

### Scenario 1: Regular Inventory Replenishment
**Workflow**: Standard Procurement
**Process**: Create PO from reorder point → Receive goods → Match invoice → Pay supplier

### Scenario 2: Emergency Purchase from Local Supplier
**Workflow**: Direct GRN
**Process**: Purchase goods → Bring to warehouse → Create GRN → Enter invoice → Pay

### Scenario 3: Professional Services
**Workflow**: Direct Invoice
**Process**: Receive service invoice → Review and approve → Process payment

### Scenario 4: Import with Prepayment
**Workflow**: Invoice-First
**Process**: Receive proforma invoice → Make prepayment → Track shipment → Receive goods → Settle final invoice

### Scenario 5: Consignment Stock Agreement
**Workflow**: Consignment Purchasing
**Process**: Receive consignment goods → Use items as needed → Process monthly consumption invoice

## Approval Levels

Purchase approvals are **optional** and switched off until you create an Approval Setting. They
cover purchase requisitions, purchase orders and stock requisitions only.

Each level names an approver designation, a quorum, and a **Min Approval Amount**. The amount does
not choose a different approver — it decides how many levels the document must clear:

| Level | Approver designation | Min Approval Amount | Quorum |
|---|---|---|---|
| 1 | Department manager | RM 0 | 1 |
| 2 | Finance director | RM 25,000 | 1 |

An RM 3,000 requisition needs level 1 only; an RM 60,000 requisition needs both. Full setup in
[Document Approvals](/guides/document-approvals/).

{{< callout type="warning" >}}
**BigLedger will not enforce your spending policy for you.** Even where approvals are configured, a
purchase order can still be finalised by hand while an approval is pending — approval sets a
document to FINAL when it completes, it does not block FINAL. If a threshold matters, control who
holds the finalise permission as well.
{{< /callout >}}

## Common Issues and Solutions

### Issue: Partial Deliveries
**Solution**: Use the Standard Procurement Workflow. Create GRN for received quantity, keep PO open for balance.

### Issue: Price Changed Since PO
**Solution**: You will see it when you knock the GRN off onto the invoice — your screen shows the ordered price, the supplier's paper shows theirs. Settle it before you finalise; a draft invoice can be discarded, a finalised one can only be voided or credited.

### Issue: Goods Damaged in Transit
**Solution**: Create GRN for good items, reject damaged items, request credit note from supplier.

### Issue: Invoice Lost or Delayed
**Solution**: Track outstanding GRNs, follow up with supplier, accrue for month-end close.

### Issue: Urgent Purchase After Hours
**Solution**: Use Direct GRN workflow, document reason, get retrospective approval.

## Next Steps

### For Daily Operations
Explore the detailed daily task guides:
- [Purchasing Overview](/user-guide/daily-tasks/purchasing-overview) - Quick reference for daily purchasing
- [Creating Purchase Orders](/user-guide/daily-tasks/creating-purchase-order) - Detailed PO creation guide
- [Goods Received Note](/user-guide/daily-tasks/goods-received-note) - GRN processing procedures
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing) - Invoice matching and approval

### For Implementation
Review the module documentation:
- [Purchasing Module Overview](/modules/purchasing/) - Complete module capabilities
- [Supplier Maintenance](/applets/master-data/supplier-applet-1/) - Supplier master data setup
- [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/) - Item master for purchasing

{{< callout type="success" >}}
**Getting Started**: New to purchasing in BigLedger? Start with the [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) to learn the complete process, then explore simplified workflows as needed.
{{< /callout >}}
