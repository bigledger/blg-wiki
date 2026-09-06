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
4. Have it reviewed (purchase invoices have no approval workflow)
5. Finalise it, which posts it

**Common Mistakes**:
- ❌ Not checking three-way match
- ❌ Ignoring price variances
- ❌ Processing duplicate invoices
- ❌ Wrong GL date for period-end

---

## Who does what, in what order

Purchasing at a multi-branch business splits across three desks. The order matters more than the clock.

**The buyer** raises purchase orders — by hand, from a requisition or quotation, from a CSV, or from a replenishment run that reads stock balances rather than memory. They finalise the order (which puts its lines into the open queue), send it, and watch the **Purchase Order Queue** for anything overdue.

**The warehouse** receives against the order. They count first, then record what actually arrived on a Purchase GRN, capture serials and batches, attach the delivery note, and finalise. A short delivery leaves the balance in the queue for a later receipt; nothing needs adjusting.

**Accounts payable** books the supplier's bill by knocking off the GRN, checks the quantities and the price against the supplier's paper, and finalises. That is the point at which stock goes up, the input tax becomes claimable and the creditor balance appears. Later they settle it, from the invoice's own Payment tab or in a batch through a Payment Voucher.

The one thing that should not drift between the three desks: **which receipt path your company uses.** GRN → Purchase Invoice, or GRN Stock In → Purchase Invoice No Stock In. Mixing them counts stock twice or not at all, and nothing warns anyone.

---

## Quick Reference Tables

### Purchase Order Approval Levels *(optional)*

Approvals are off until someone creates an Approval Setting. Each level names an approver
designation, a quorum and a **Min Approval Amount**; the amount decides how many levels a PO must
clear, not who sees it.

| Level | Approver designation | Min Approval Amount | Quorum |
|---|---|---|---|
| 1 | Branch manager | RM 0 | 1 |
| 2 | Senior manager | RM 5,000 | 1 |
| 3 | Finance director | RM 25,000 | 1 |

Full setup in [Document Approvals](/guides/document-approvals/).

### Document Requirements Checklist

| Task | Required Documents |
|------|-------------------|
| **Create PO** | Quotation, requisition (if applicable) |
| **Send PO** | Approved PO document |
| **Create GRN** | Delivery order, packing list, PO |
| **Process Invoice** | Supplier invoice, PO, GRN |
| **Make Payment** | Approved invoice, bank details |

### Where each task lives

| Task | Applet and menu |
|------|----------------|
| **New purchase order** | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) > Purchase Order > Create |
| **Approve a purchase order** | The link in the approval e-mail, or Purchase Order (Internal) > Approval Request |
| **What is still outstanding** | Purchase Order (Internal) > Purchase Order Queue |
| **Ordered vs received / ordered vs invoiced** | Purchase Order (Internal) > PO Line with GRN KO / PO Line with PI KO |
| **New goods receipt** | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) > Internal Purchase GRN > Create |
| **New supplier invoice** | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) > Internal Purchase Invoice > Create |
| **Pay several invoices at once** | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) > Internal Payment Voucher > Create |
| **Supplier lookup** | [Supplier](/applets/master-data/supplier-applet-1/) |
| **Purchase analysis** | [Purchase Report](/applets/purchase-workflow/purchase-report-applet/) |

---

## Handling Common Issues

### Issue: PO Stuck in Approval

**Symptoms**: PO submitted several days ago, no approval
**Quick Fix**:
1. Open the PO's **Generic Doc Approval** tab and check the Email Notification Status — if it reads
   `APPROVER_EMAIL_IS_EMPTY` the approver was never told
2. Check who the current approver is and chase them yourself — BigLedger sends no reminders and has
   no escalation
3. There is no delegation or stand-in approver for these documents. If the approver is away, either
   wait, or add a second person at that level and resubmit

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

### Documentation
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - Complete process
- [Module Documentation](/modules/purchasing/) - All features
- [Supplier Setup](/applets/master-data/supplier-applet-1/) - Supplier management

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
- [Supplier Management](/applets/master-data/supplier-applet-1/) - Supplier maintenance
