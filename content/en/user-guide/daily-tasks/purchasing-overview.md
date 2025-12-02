---
title: "Purchasing Overview"
description: "Quick reference guide for daily purchasing tasks - from creating purchase orders to processing supplier invoices and payments"
weight: 10
---

Master your daily purchasing operations with this quick-reference guide covering the most common purchasing tasks you'll perform regularly.

## Your Daily Purchasing Tasks

### For Purchasing Admins
- Create and manage purchase orders
- Send POs to suppliers
- Track delivery status
- Handle supplier inquiries
- Manage supplier relationships

### For Warehouse Staff
- Receive goods deliveries
- Create goods received notes (GRN)
- Scan serial numbers
- Allocate stock to locations
- Handle delivery discrepancies

### For Accounts Payable
- Process supplier invoices
- Match invoices to POs and GRNs
- Approve invoices for payment
- Process supplier payments
- Handle invoice queries

{{< callout type="tip" >}}
**Quick Navigation**: Use the links below to jump directly to the task you need to perform.
{{< /callout >}}

## Common Purchasing Workflows

Choose the right workflow for your situation:

### Full Control: Standard Procurement
**Best for**: Regular supplier purchases, inventory replenishment
**Steps**: PO → GRN → Invoice → Payment

{{< cards >}}
{{< card link="/guides/purchasing-guides/standard-procurement-workflow" title="Standard Procurement Workflow" subtitle="Complete guide with three-way matching" >}}
{{< /cards >}}

### Quick Process: Direct GRN
**Best for**: Walk-in purchases, emergency buys, local suppliers
**Steps**: Purchase → GRN → Invoice → Payment

{{< cards >}}
{{< card link="/guides/purchasing-guides/direct-grn-workflow" title="Direct GRN Workflow" subtitle="Skip PO, go directly to goods receipt" >}}
{{< /cards >}}

### Simple: Direct Invoice
**Best for**: Services, utilities, subscriptions, non-stock items
**Steps**: Invoice → Approval → Payment

{{< cards >}}
{{< card link="/guides/purchasing-guides/direct-invoice-workflow" title="Direct Invoice Workflow" subtitle="No PO or GRN needed for services" >}}
{{< /cards >}}

### Special Cases
**Prepayment Required**: [Invoice-First Workflow](/guides/purchasing-guides/invoice-first-workflow)
**Consignment Stock**: [Consignment Purchasing](/guides/purchasing-guides/consignment-purchasing)

---

## Quick Task Guides

### Creating Purchase Orders

**When**: Need to order goods from supplier
**Time**: 10-15 minutes per PO
**Navigation**: `[Purchasing > Purchase Orders > New PO]`

{{< cards >}}
{{< card link="/user-guide/daily-tasks/creating-purchase-order" title="Creating Purchase Orders" subtitle="Detailed PO creation guide with examples" >}}
{{< /cards >}}

**Quick Steps**:
1. Select supplier
2. Add items and quantities
3. Attach quotation
4. Submit for approval
5. Send to supplier when approved

**Common Mistakes**:
- ❌ Missing quotation attachment
- ❌ Wrong delivery date
- ❌ Incorrect G/L account
- ❌ Price in wrong currency

### Processing Goods Receipt

**When**: Goods delivered to warehouse
**Time**: 30-60 minutes (including physical receipt)
**Navigation**: `[Purchasing > Goods Receipt > New GRN]`

{{< cards >}}
{{< card link="/user-guide/daily-tasks/goods-received-note" title="Goods Received Note Processing" subtitle="Complete GRN procedures and best practices" >}}
{{< /cards >}}

**Quick Steps**:
1. Count delivered goods
2. Match to PO and delivery order
3. Create GRN in system
4. Scan serial numbers
5. Allocate to storage locations
6. Attach documents and confirm

**Common Mistakes**:
- ❌ Not counting accurately
- ❌ Accepting damaged goods
- ❌ Missing serial numbers
- ❌ Wrong storage locations

### Processing Purchase Invoices

**When**: Supplier invoice received
**Time**: 5-10 minutes per invoice
**Navigation**: `[Purchasing > Purchase Invoices > New Invoice]`

{{< cards >}}
{{< card link="/user-guide/daily-tasks/purchase-invoice-processing" title="Purchase Invoice Processing" subtitle="Invoice matching and approval procedures" >}}
{{< /cards >}}

**Quick Steps**:
1. Enter supplier invoice details
2. Match to PO and GRN
3. Resolve any variances
4. Submit for approval
5. Post when approved

**Common Mistakes**:
- ❌ Not checking three-way match
- ❌ Ignoring price variances
- ❌ Processing duplicate invoices
- ❌ Wrong GL date for period-end

---

## Daily Workflow Examples

### Morning Routine (Purchasing Admin)

**08:00 - 08:30**: Review overnight orders and emails
- Check for urgent supplier requests
- Review pending PO approvals
- Respond to supplier queries

**08:30 - 10:00**: Process new purchase requests
- Review requisitions
- Create POs for approved requests
- Submit for approval
- Send approved POs to suppliers

**10:00 - 12:00**: Follow up on pending deliveries
- Check expected deliveries
- Contact suppliers for delayed orders
- Update delivery schedules
- Coordinate with warehouse

### Afternoon Routine (Accounts Payable)

**13:00 - 15:00**: Process supplier invoices
- Enter new invoices received
- Match to POs and GRNs
- Resolve variances
- Submit for approval

**15:00 - 16:30**: Payment processing
- Review due invoices
- Create payment batches
- Process payments
- Send remittance advice

**16:30 - 17:00**: End-of-day tasks
- Review pending approvals
- Chase delayed approvals
- Update payment schedules
- Prepare next day priorities

### Warehouse Staff (Receiving Hours)

**Continuous throughout day**:
- Receive deliveries as they arrive
- Create GRNs immediately
- Scan and allocate stock
- Handle exceptions
- Maintain receiving area organization

---

## Quick Reference Tables

### Purchase Order Approval Limits

| PO Value | Approver | Typical Time |
|----------|----------|--------------|
| < $1,000 | Supervisor | 2 hours |
| $1,000 - $5,000 | Manager | 1 day |
| $5,000 - $25,000 | Senior Manager | 2 days |
| > $25,000 | CFO/CEO | 3-5 days |

### Document Requirements Checklist

| Task | Required Documents |
|------|-------------------|
| **Create PO** | Quotation, requisition (if applicable) |
| **Send PO** | Approved PO document |
| **Create GRN** | Delivery order, packing list, PO |
| **Process Invoice** | Supplier invoice, PO, GRN |
| **Make Payment** | Approved invoice, bank details |

### Common Navigation Paths

| Task | Navigation Path |
|------|----------------|
| **New PO** | Purchasing > Purchase Orders > New PO |
| **Approve PO** | Purchasing > Approvals > Pending POs |
| **New GRN** | Purchasing > Goods Receipt > New GRN |
| **New Invoice** | Purchasing > Purchase Invoices > New Invoice |
| **Payment Run** | Accounts Payable > Payment Processing |
| **Supplier Inquiry** | Master Data > Suppliers > [Search] |

---

## Handling Common Issues

### Issue: PO Stuck in Approval

**Symptoms**: PO submitted several days ago, no approval
**Quick Fix**:
1. Check who is the current approver
2. Send reminder email
3. If approver on leave, request delegation
4. Escalate to backup approver if urgent

### Issue: Partial Delivery

**Symptoms**: Ordered 100 units, received only 75
**Quick Fix**:
1. Create GRN for 75 units received
2. Leave PO open for remaining 25
3. Note reason for short delivery
4. Contact supplier for balance delivery date
5. Set follow-up reminder

### Issue: Invoice Price Doesn't Match PO

**Symptoms**: System flags price variance
**Quick Fix**:
1. Check PO price vs invoice price
2. Review quotation price
3. If PO error: Get approval for correct price
4. If supplier error: Contact supplier for revised invoice
5. If authorized increase: Get purchasing confirmation

### Issue: Payment Delayed

**Symptoms**: Due date passed, supplier calling
**Quick Fix**:
1. Check if invoice is approved
2. Verify bank details are correct
3. Confirm payment run included invoice
4. If missed: Process urgent payment
5. Call supplier to explain and confirm payment date

---

## Key Performance Targets

Track your efficiency:

| Metric | Target | Your Performance |
|--------|--------|------------------|
| **PO Processing Time** | < 4 hours | Track yours |
| **GRN Completion** | Same day | Track yours |
| **Invoice Matching** | < 24 hours | Track yours |
| **Three-Way Match Rate** | > 95% clean | Track yours |
| **On-Time Payments** | > 98% | Track yours |
| **Supplier Satisfaction** | No complaints | Track yours |

{{< callout type="info" >}}
**Performance Tip**: Set personal targets and track your metrics. Continuous improvement in processing time and accuracy makes everyone's job easier.
{{< /callout >}}

---

## Efficiency Tips

### Time-Saving Techniques

**Batch Similar Tasks**:
- Process all POs in morning
- Handle all GRNs continuously
- Review invoices in afternoon
- Make one payment run per period

**Use Templates**:
- Create PO templates for regular orders
- Save favorite items for quick selection
- Use standard remarks and notes
- Bookmark frequently used screens

**Keyboard Shortcuts**:
- Learn system shortcuts
- Use tab navigation
- Quick search functions
- Copy-paste where appropriate

**Preparation**:
- Review expected deliveries in advance
- Prepare receiving area for deliveries
- Organize documents before data entry
- Check approver availability before submission

### Quality Controls

**Double-Check**:
- Prices before confirming PO
- Quantities when receiving goods
- Invoice totals before posting
- Payment amounts before authorizing

**Verify**:
- Supplier details (especially bank accounts)
- Tax invoice requirements
- Correct G/L accounts
- Proper approvals received

**Document**:
- Unusual situations
- Variances and resolutions
- Approval conversations
- Supplier commitments

---

## Getting Help

### In-System Help
- **?** icon on every screen
- Field-level tooltips
- Process help guides
- Error message explanations

### Documentation
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - Complete process
- [Module Documentation](/modules/purchasing/) - All features
- [Supplier Setup](/applets/supplier-maintenance-applet/) - Supplier management

### Human Support
- **Supervisor**: Process questions, approvals
- **Purchasing Manager**: Supplier issues, policy
- **IT Helpdesk**: System issues, access
- **Accounts Manager**: Payment queries

### Self-Learning
- Practice in training environment
- Shadow experienced colleagues
- Review past transactions
- Attend training sessions

---

## Monthly Tasks

Beyond daily operations:

### Month-End Tasks
- [ ] Ensure all GRNs for month are completed
- [ ] Process all received invoices
- [ ] Reconcile supplier statements
- [ ] Review aged payables
- [ ] Accrue for goods received but not invoiced
- [ ] Review pending POs and deliveries

### Periodic Reviews
- [ ] Supplier performance review (quarterly)
- [ ] Price benchmarking (semi-annual)
- [ ] Contract renewals (as due)
- [ ] Policy compliance audit (quarterly)
- [ ] Process improvement review (quarterly)

---

## Best Practices Summary

### Do's
- ✅ Process transactions same day
- ✅ Attach all supporting documents
- ✅ Verify critical data carefully
- ✅ Communicate proactively with suppliers
- ✅ Follow approval hierarchies
- ✅ Maintain good filing system
- ✅ Ask when unsure

### Don'ts
- ❌ Rush through data entry
- ❌ Skip required approvals
- ❌ Accept damaged goods without documentation
- ❌ Process suspicious invoices
- ❌ Ignore system warnings
- ❌ Mix personal and business purchases
- ❌ Circumvent processes

{{< callout type="success" >}}
**Efficiency Milestone**: Master these daily tasks and you'll handle purchasing operations smoothly, accurately, and efficiently, becoming a valued team member.
{{< /callout >}}

## Next Steps

### Deepen Your Knowledge
- [Creating Purchase Orders](/user-guide/daily-tasks/creating-purchase-order) - Detailed PO guide
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note) - Complete GRN procedures
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing) - Invoice matching guide

### Explore Workflows
- [Purchasing Workflow Guides](/guides/purchasing-guides/) - All workflow scenarios
- [Module Overview](/modules/purchasing/) - Complete purchasing capabilities

### Related Operations
- [Inventory Management](/modules/inventory/) - Stock control
- [Accounts Payable](/modules/financial-accounting/) - Payment processing
- [Supplier Management](/applets/supplier-maintenance-applet/) - Supplier maintenance
