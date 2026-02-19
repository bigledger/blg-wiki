---
title: "Sales Workflow Guides"
description: "Comprehensive sales workflows for order-to-delivery processes, covering various business scenarios from standard sales to instalment agreements"
weight: 30
bookCollapseSection: false
---

Complete guides for managing your sales processes from customer order through delivery and payment collection. These workflows accommodate various business models and sales scenarios.

---

## 🚀 Get Started / Setup

New to sales in BigLedger? Start with the standard workflow to learn the complete process.

{{< cards >}}
  {{< card link="standard-sales-workflow" title="📋 Standard Sales Workflow" subtitle="The complete order-to-delivery flow — start here to understand the full sales process" >}}
  {{< card link="cash-sales-workflow" title="💵 Cash Sales Workflow" subtitle="Simplest sales flow — walk-in customers with immediate payment and delivery" >}}
{{< /cards >}}

**Before you begin, ensure:**
- Customer profiles are configured in [Customer Maintenance](/applets/customer-maintenance-applet/)
- Product catalog and pricing are set up in [Pricebook](/applets/pricebook-applet/)
- Tax codes and payment terms are defined
- User permissions for the sales module are assigned

{{< callout type="tip" >}}
**First time?** Start with the [Standard Sales Workflow](standard-sales-workflow) — it covers the complete process. Then explore specialized workflows as your business requires.
{{< /callout >}}

---

## 📝 Daily Tasks

Guides for everyday sales operations your team performs regularly.

### Core Sales Processes

{{< cards >}}
  {{< card link="standard-sales-workflow" title="Standard Sales Workflow" subtitle="Complete order-to-delivery flow with deposit collection and scheduled delivery" >}}
  {{< card link="credit-sales-workflow" title="Credit Sales Workflow" subtitle="Sales to approved customers with credit terms, no upfront deposit required" >}}
  {{< card link="cash-sales-workflow" title="Cash Sales Workflow" subtitle="Walk-in cash sales with immediate payment and delivery" >}}
{{< /cards >}}

### Specialized Sales Scenarios

{{< cards >}}
  {{< card link="instalment-sales-workflow" title="Instalment Sales Workflow" subtitle="Sales with financing agreements through AEON, JCL, or other providers" >}}
  {{< card link="partial-delivery-workflow" title="Partial Delivery Workflow" subtitle="Split shipments and multiple delivery handling" >}}
  {{< card link="installation-scheduling-workflow" title="Installation Scheduling" subtitle="Appliances and equipment requiring professional installation" >}}
{{< /cards >}}

### Post-Sales Processes

{{< cards >}}
  {{< card link="returns-exchanges-workflow" title="Returns & Exchanges" subtitle="Handling product returns and exchanges after delivery" >}}
{{< /cards >}}

---

## ⚠️ Common Scenarios / Pitfalls

Watch out for these frequent sales issues:

| Scenario | What Happens | How to Handle |
|----------|-------------|---------------|
| **Customer not in system** | Cannot create sales order | Create customer profile first with all required fields |
| **Stock not available** | Order cannot be fulfilled | Check inventory before confirming; consider partial delivery |
| **Deposit not collected** | Order processing blocked | Collect deposit per workflow requirements before proceeding |
| **Wrong pricing applied** | Customer billed incorrectly | Verify pricebook and discount rules before invoice generation |
| **Delivery rescheduled** | Customer unavailable on delivery day | Update trip listing, communicate via WhatsApp group |
| **Payment discrepancy** | Collected ≠ invoice amount | Match physical documents with system, verify deposit/balance split |

{{< callout type="warning" >}}
**Key Rule**: Always match the physical delivery order (signed by customer) against the system record before marking delivery as complete. Discrepancies caught later are much harder to resolve.
{{< /callout >}}

---

## 📊 Reporting Usage

Track your sales performance and operational health.

**Key Sales Reports:**
- **Sales Order Listing** — All orders by status (Draft, Confirmed, Delivered, Completed)
- **Delivery Order Report** — Track delivery completion and pending deliveries
- **Invoice Aging Report** — Outstanding invoices by customer and age
- **Sales by Customer** — Revenue breakdown by customer account
- **Sales by Product** — Top-selling items and revenue by product category
- **Collection Report** — Cash, cheque, and bank transfer collections by period

**Reporting tips:**
- Check outstanding deliveries daily using DO status report
- Review invoice aging weekly to follow up on overdue accounts
- Compare sales-by-product monthly to identify trends
- Use collection reports for daily cash reconciliation

## Quick Workflow Comparison

| Workflow Type | Deposit Required | Credit Check | Delivery Timing | Installation |
|---------------|-----------------|--------------|-----------------|-------------|
| **Standard Sales** | Yes (Partial/Full) | No | Scheduled | Optional |
| **Credit Sales** | No | Yes | As agreed | Optional |
| **Cash Sales** | Yes (Full) | No | Immediate | No |
| **Instalment Sales** | Yes (Varies) | Yes (by financier) | Scheduled | Optional |
| **Partial Delivery** | Yes (Partial/Full) | Depends | Multiple dates | Optional |
| **Installation Required** | Yes (Usually) | Depends | Coordinated | Yes |

## Key Roles in Sales Workflows

Understanding who does what is critical for smooth operations:

### Sales Admin
- Create and manage sales orders
- Collect deposits and payments
- Coordinate with warehouse and delivery teams
- Generate invoices and delivery orders
- Reconcile payments with accounts

### Warehouse Helper
- Pick and prepare stock based on sales orders
- Record serial numbers and rack locations
- Convert stock in system
- Load items for delivery
- Manage stock transfers

### Delivery Driver
- Arrange delivery schedules based on trip listing
- Transport goods to customers
- Obtain customer signatures on delivery orders
- Take delivery proof photos
- Collect cash, cheques, and agreements
- Return documents and payments to admin

### Accounts Team
- Verify payment amounts against system records
- Process cash, cheques, and bank transfers
- Confirm delivery completion
- Reconcile daily collections
- Update financial records

## Common Sales Process Flow

Most sales workflows follow this general pattern:

```
Customer → Sales Order → Deposit Collection → Stock Preparation →
Delivery Scheduling → Invoice Generation → Delivery Execution →
Payment Collection → Accounts Reconciliation
```

However, the specifics vary significantly based on your business model and customer type.

## Document Flow Overview

Understanding the document lifecycle helps maintain accuracy:

### Sales Order (SO)
- Created by Sales Admin
- Requires customer information and item details
- May require deposit payment
- Drives the entire process

### Delivery Order (DO)
- Generated from Sales Order
- Includes serial numbers and quantities
- Requires customer signature upon delivery
- Photo evidence uploaded to WhatsApp/system

### Invoice
- Generated after stock conversion
- Must match delivery order quantities
- Includes pricing and tax information
- Used for final payment collection

### Trip Listing
- Daily logistics planning document
- Groups multiple deliveries by route
- Printed for drivers each day
- Helps optimize delivery efficiency

### Payment Documents
- Cash collection forms
- Cheque copies
- Bank transfer slips
- Financing agreements (AEON, JCL, etc.)

## Getting Started

{{< callout type="tip" >}}
**New to sales workflows?** Start with the [Standard Sales Workflow](standard-sales-workflow) to understand the complete process. Then explore specialized workflows as needed for your business.
{{< /callout >}}

### Prerequisites

Before implementing these workflows, ensure you have:

1. **System Access**
   - Appropriate user permissions for sales module
   - Access to customer profiles
   - Inventory visibility

2. **Master Data Setup**
   - Customer profiles configured
   - Product catalog maintained
   - Pricing and tax setup complete
   - Payment terms defined

3. **Team Training**
   - All roles understand their responsibilities
   - Communication channels established (WhatsApp groups, etc.)
   - Document handling procedures agreed

4. **Physical Resources**
   - Printers for SO, DO, and trip listings
   - Mobile devices for photo uploads
   - Warehouse racking system organized
   - Delivery vehicles with proper equipment

## Integration with Other Modules

Sales workflows integrate with multiple BigLedger modules:

- **[Customer Maintenance](/applets/customer-maintenance-applet/)** - Customer profiles and credit terms
- **[Inventory Module](/modules/inventory/)** - Stock availability and serial number tracking
- **[Financial Accounting](/modules/financial-accounting/)** - Payment processing and reconciliation
- **[Pricebook Applet](/applets/pricebook-applet/)** - Pricing and discounts
- **Trip Management** - Delivery scheduling and route optimization

## Best Practices

### Data Accuracy
- Always verify customer details before creating orders
- Double-check product codes and quantities
- Record serial numbers at time of picking
- Confirm pricing and available discounts

### Communication
- Keep all team members informed of order status
- Use WhatsApp groups for real-time updates
- Confirm delivery appointments with customers
- Alert accounts team of special payment arrangements

### Documentation
- Print and file all physical documents
- Upload delivery photos immediately
- Retain customer signatures on DOs
- Keep copies of all payment documents

### Process Discipline
- Follow the prescribed workflow for each transaction type
- Don't skip validation checkpoints
- Reconcile daily to catch errors quickly
- Report issues immediately to supervisors

## Troubleshooting Common Issues

### Customer Not in System
- Create customer profile before sales order
- Ensure all required fields completed
- Verify credit terms if applicable

### Stock Not Available
- Check inventory levels before order confirmation
- Consider partial delivery if appropriate
- Coordinate with purchasing for restocking

### Payment Discrepancies
- Match physical documents with system records
- Verify deposit and balance amounts
- Check for pricing changes or discounts
- Escalate to supervisor if unresolved

### Delivery Issues
- Customer not available: Reschedule via trip listing
- Wrong address: Update customer profile immediately
- Damaged goods: Document with photos, process return
- Missing items: Check warehouse picking accuracy

## Related Documentation

### User Guides
- [Sales Overview](/user-guide/daily-tasks/sales-overview/)
- [Creating Sales Orders](/user-guide/daily-tasks/creating-sales-order/)
- [Delivery Order Processing](/user-guide/daily-tasks/delivery-order-processing/)
- [Trip Listing Management](/user-guide/daily-tasks/trip-listing-management/)
- [Sales Payment Collection](/user-guide/daily-tasks/sales-payment-collection/)

### Module Documentation
- [Sales & CRM Module](/modules/sales-crm/)
- [Inventory Management](/modules/inventory/)
- [Financial Accounting](/modules/financial-accounting/)

### Applet References
- [Customer Maintenance Applet](/applets/customer-maintenance-applet/)
- [Pricebook Applet](/applets/pricebook-applet/)

{{< callout type="warning" >}}
**Important**: These workflows represent best practices but should be adapted to your specific business requirements. Consult with your implementation team to customize workflows for your organization.
{{< /callout >}}

---

*Need help choosing the right workflow? Contact your BigLedger implementation specialist or email support@bigledger.com*
