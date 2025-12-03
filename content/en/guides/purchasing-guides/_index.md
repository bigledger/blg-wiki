---
title: "Purchasing Guides"
description: "Comprehensive procurement workflows for different business scenarios - from standard PO processes to direct invoicing"
weight: 35
bookCollapseSection: false
---

Master the art of procurement with flexible workflows designed for real-world business scenarios. Not every purchase follows the same path, and BigLedger supports multiple purchasing approaches to match your business needs.

## Understanding Purchasing Workflows

Different businesses require different purchasing approaches based on their industry, supplier relationships, and operational requirements. BigLedger provides flexibility to handle:

- **Full procurement cycle** with purchase orders, goods receipt, and invoice matching
- **Simplified workflows** that skip unnecessary steps
- **Special scenarios** like consignment stock and prepayments
- **Emergency purchases** requiring expedited processing

{{< callout type="info" >}}
**Workflow Flexibility**: Choose the workflow that matches your business process. You can use different workflows for different suppliers or purchase types within the same system.
{{< /callout >}}

## Available Purchasing Workflows

### Standard Workflows

{{< cards >}}
{{< card link="/guides/purchasing-guides/standard-procurement-workflow" title="Standard Procurement Workflow" subtitle="Complete PO → GRN → Invoice flow with three-way matching for full control and audit trail" >}}
{{< card link="/guides/purchasing-guides/direct-grn-workflow" title="Direct GRN Workflow" subtitle="Skip PO creation and go directly to goods receipt - ideal for walk-in purchases or urgent deliveries" >}}
{{< card link="/guides/purchasing-guides/direct-invoice-workflow" title="Direct Invoice Workflow" subtitle="Process purchases without PO or GRN - perfect for services, utilities, and non-stock items" >}}
{{< /cards >}}

### Special Scenarios

{{< cards >}}
{{< card link="/guides/purchasing-guides/invoice-first-workflow" title="Invoice-First Workflow" subtitle="Handle situations where invoice arrives before goods delivery with proper tracking and matching" >}}
{{< card link="/guides/purchasing-guides/consignment-purchasing" title="Consignment Purchasing" subtitle="Manage consignment stock where you only pay when items are used or sold" >}}
{{< /cards >}}

## Workflow Selection Guide

Choose the right workflow for your situation:

| Your Situation | Recommended Workflow | Key Benefits |
|----------------|---------------------|--------------|
| **Standard supplier purchases** with planned orders | Standard Procurement | Full audit trail, budget control, three-way matching |
| **Walk-in purchases** from local suppliers | Direct GRN | Fast processing, immediate stock receipt |
| **Service purchases**, utilities, subscriptions | Direct Invoice | No stock tracking needed, simple processing |
| **Goods delivered** before invoice arrives | Standard Procurement | Track receivables, match invoice later |
| **Invoice arrives first** (prepayment required) | Invoice-First | Manage prepayments, track pending delivery |
| **Consignment stock** from suppliers | Consignment Purchasing | Pay only for what you use, better cash flow |

{{< callout type="tip" >}}
**Best Practice**: Use the Standard Procurement Workflow as your default for most purchases. Only use simplified workflows when there's a clear business reason to skip steps.
{{< /callout >}}

## Core Purchasing Concepts

### Three-Way Matching

The standard procurement process uses three-way matching to ensure accuracy:

1. **Purchase Order (PO)** - What you ordered and the agreed price
2. **Goods Received Note (GRN)** - What you actually received
3. **Purchase Invoice** - What the supplier is charging you

The system automatically compares these three documents to identify:
- Quantity discrepancies (ordered 100, received 95)
- Price differences (agreed $10, invoiced $12)
- Missing items or over-deliveries

{{< callout type="warning" >}}
**Control Point**: Three-way matching prevents unauthorized purchases, duplicate payments, and pricing errors. Enable this for high-value or high-risk purchases.
{{< /callout >}}

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
- Approval workflows and limits
- Document numbering sequences
- Default tax codes
- Tolerance levels for matching
- Notification settings

## Integration with Other Modules

Purchasing integrates seamlessly with:

- **[Inventory Module](/modules/inventory/)** - Stock updates and warehouse management
- **[Financial Accounting Module](/modules/financial-accounting/)** - Purchase accounting and AP
- **[Fixed Assets Module](/modules/fixed-assets/)** - Capital equipment purchases
- **[Project Accounting Module](/modules/project-accounting/)** - Project-specific procurement

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

## Approval Hierarchies

Configure approval limits based on purchase value and type:

| Purchase Value | Approver | Processing Time |
|----------------|----------|-----------------|
| < $1,000 | Supervisor | Immediate |
| $1,000 - $5,000 | Department Manager | 1 business day |
| $5,000 - $25,000 | Finance Manager | 2 business days |
| $25,000 - $100,000 | CFO | 3 business days |
| > $100,000 | CEO/Board | 5 business days |

{{< callout type="warning" >}}
**Compliance Requirement**: All purchases above your defined threshold must go through formal approval. Emergency purchases require retrospective approval and documentation.
{{< /callout >}}

## Key Performance Indicators

Track these metrics to optimize purchasing:

### Efficiency Metrics
- **PO Processing Time** - Time from requisition to PO issuance
- **Receipt Accuracy** - Percentage of GRNs matching PO
- **Invoice Matching Rate** - Percentage of clean three-way matches
- **Approval Cycle Time** - Average time in approval workflow

### Financial Metrics
- **Cost Savings** - Negotiated savings vs. list price
- **Payment Terms Compliance** - Early payment discount capture
- **Invoice Error Rate** - Percentage requiring adjustment
- **Supplier Performance** - On-time delivery and quality metrics

### Compliance Metrics
- **PO Coverage** - Percentage of spend with PO
- **Contract Compliance** - Purchases under contract
- **Audit Trail Completeness** - Documents attached to transactions
- **Approval Compliance** - Purchases within approval limits

## Common Issues and Solutions

### Issue: Partial Deliveries
**Solution**: Use the Standard Procurement Workflow. Create GRN for received quantity, keep PO open for balance.

### Issue: Price Changed Since PO
**Solution**: If within tolerance, accept invoice. If significant, get approval before processing.

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
- [Supplier Maintenance](/applets/supplier-maintenance-applet/) - Supplier master data setup
- [Inventory Item Maintenance](/applets/inv-item-maintenance-applet/) - Item master for purchasing

{{< callout type="success" >}}
**Getting Started**: New to purchasing in BigLedger? Start with the [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) to learn the complete process, then explore simplified workflows as needed.
{{< /callout >}}
