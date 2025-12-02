---
title: "Sales Operations Overview"
description: "Quick reference for daily sales tasks and common operations"
weight: 30
---

A practical guide to daily sales operations in BigLedger, covering the most common tasks you'll perform as part of the sales team. This overview provides quick access to essential procedures for processing sales, managing deliveries, and collecting payments.

## Daily Sales Tasks Quick Reference

### Morning Routine (Sales Admin)

**Start of Day** (8:00-9:00 AM):
1. ✅ Print trip listing for today's deliveries
2. ✅ Print sales orders for delivery today
3. ✅ Distribute documents to warehouse and drivers
4. ✅ Brief warehouse team on priorities
5. ✅ Brief delivery team on route and special instructions
6. ✅ Check for any urgent customer follow-ups

### During the Day

**Sales Order Processing**:
- Create sales orders for new customer requests
- Collect deposits and issue receipts
- Schedule delivery appointments
- Add deliveries to trip listing
- Respond to customer inquiries

**Coordination**:
- Communicate with warehouse on stock picking
- Convert stock in system (enter serial numbers)
- Generate invoices and delivery orders
- Handle customer changes or cancellations
- Track delivery team progress

**Payment Handling**:
- Collect walk-in payments
- Process credit card transactions
- Record bank transfers
- Issue receipts

### End of Day (Sales Admin & Driver)

**4:00-6:00 PM**:
1. ✅ Driver returns with signed delivery orders
2. ✅ Driver hands over all payments collected
3. ✅ Verify delivery photos uploaded
4. ✅ Reconcile cash, cheques, and transfers
5. ✅ Update system with payments received
6. ✅ Mark deliveries as completed
7. ✅ Prepare handover to accounts
8. ✅ Follow up on any delivery issues

{{< callout type="tip" >}}
**Consistency is Key**: Following the same daily routine ensures nothing falls through the cracks. Create checklists and stick to them.
{{< /callout >}}

---

## Key Sales Workflows by Scenario

### Choose the Right Workflow

Different customer situations require different processes:

| Customer Scenario | Use This Workflow | Key Characteristics |
|-------------------|------------------|---------------------|
| Regular customer, scheduled delivery, requires deposit | [Standard Sales](../../guides/sales-guides/standard-sales-workflow) | Full order-to-delivery process |
| Approved business customer, no deposit required | [Credit Sales](../../guides/sales-guides/credit-sales-workflow) | Payment terms (Net 30/60 days) |
| Walk-in customer, immediate payment and delivery | [Cash Sales](../../guides/sales-guides/cash-sales-workflow) | Quick counter sale |
| Customer using AEON, JCL financing | [Instalment Sales](../../guides/sales-guides/instalment-sales-workflow) | Finance agreement process |
| Not all items available immediately | [Partial Delivery](../../guides/sales-guides/partial-delivery-workflow) | Multiple shipments |
| Customer wants to return product | [Returns & Exchanges](../../guides/sales-guides/returns-exchanges-workflow) | Refund or exchange |
| Product requires professional setup | [Installation Scheduling](../../guides/sales-guides/installation-scheduling-workflow) | Coordinate installation |

{{< callout type="info" >}}
**Workflow Details**: Click any workflow name above to access the complete step-by-step guide with detailed instructions.
{{< /callout >}}

---

## Essential Sales Tasks

### 1. Creating Sales Orders

**When**: Customer places an order

**Quick Steps**:
1. Open customer profile (or create new)
2. Click **Create Sales Order**
3. Add items with quantities
4. Verify pricing and apply discounts
5. Calculate total and deposit amount
6. Collect deposit payment
7. Confirm sales order

**See**: [Creating Sales Orders](creating-sales-order) for detailed instructions

---

### 2. Scheduling Deliveries

**When**: After sales order confirmed

**Quick Steps**:
1. Discuss preferred delivery date with customer
2. Check stock availability
3. Open **Trip Listing** for selected date
4. Add delivery to route
5. Optimize delivery sequence
6. Confirm with customer
7. Set reminder

**See**: [Trip Listing Management](trip-listing-management) for complete guide

---

### 3. Processing Delivery Orders

**When**: Day of delivery (before driver departs)

**Quick Steps**:
1. Warehouse provides picked items with serial numbers
2. Enter serial numbers in system
3. Generate Delivery Order
4. Generate Invoice
5. Print DO and Invoice (3 copies each)
6. Brief driver on delivery details
7. Load items and depart

**See**: [Delivery Order Processing](delivery-order-processing) for step-by-step instructions

---

### 4. Collecting Payments

**When**: Various points in sales cycle

**Payment Types**:
- **Deposit**: When sales order created
- **Balance on Delivery**: Standard and cash sales
- **After Delivery**: Credit sales (Net 30/60)
- **Instalment**: Through finance partners

**Methods**:
- Cash
- Credit/Debit Card
- Bank Transfer
- Cheque
- Financing Agreement

**See**: [Sales Payment Collection](sales-payment-collection) for detailed procedures

---

### 5. Daily Reconciliation

**When**: End of each business day

**Quick Steps**:
1. Collect all delivery documents from drivers
2. Count cash collected
3. Verify cheques received
4. Check bank transfers
5. Match payments to invoices
6. Record payments in system
7. Update order statuses
8. Complete reconciliation report
9. Hand over to accounts

**Critical**: Reconcile daily. Never let it accumulate.

---

## Common Sales Situations

### Customer Wants Credit Terms

**If**: Customer is approved business account with credit limit
- ✅ Check credit limit not exceeded
- ✅ Verify no overdue payments
- ✅ Use [Credit Sales Workflow](../../guides/sales-guides/credit-sales-workflow)
- ✅ No deposit required
- ✅ Payment due according to terms (Net 30/60)

**If**: Customer requesting credit but not approved
- ❌ Explain credit approval process
- ✅ Provide credit application form
- ✅ Process as Standard Sales in meantime
- ✅ Can switch to credit terms after approval

### Item Out of Stock

**Options**:
1. **Wait for Restock**: Customer waits, deliver when available
2. **Partial Delivery**: Deliver available items now, rest later - see [Partial Delivery Workflow](../../guides/sales-guides/partial-delivery-workflow)
3. **Substitute**: Offer alternative product
4. **Cancel**: Refund deposit if customer declines alternatives

**Best Practice**: Be proactive. Check stock before confirming order. Update customer if delays occur.

### Customer Wants to Cancel

**Before Delivery**:
- Verify reason
- If stock not yet picked: Full refund (minus admin fee if policy)
- If stock already allocated: May charge restocking fee
- Process cancellation in system
- Issue refund

**After Delivery**:
- Follow [Returns & Exchanges Workflow](../../guides/sales-guides/returns-exchanges-workflow)
- Check return policy eligibility
- Arrange collection if needed
- Inspect returned items
- Process refund if approved

### Customer Changes Order

**Before Delivery**:
- Easy to accommodate
- Add/remove items from order
- Recalculate totals
- Adjust deposit if needed
- Confirm changes with customer

**After Delivery**:
- Treated as separate transaction
- Additional items: New sales order
- Return items: Follow returns process

### Payment Discrepancy

**Scenario**: Amount received doesn't match expected balance

**Steps**:
1. Don't ignore it
2. Check invoice vs system (which is correct?)
3. Review with customer
4. Common causes:
   - Pricing changed after order
   - Discount applied but not recorded
   - Customer dispute/deduction
   - Math error
5. Resolve same day if possible
6. Escalate to manager if needed
7. Document resolution

### Delivery Failed

**Scenario**: Driver can't complete delivery (customer not home, address wrong, etc.)

**Steps**:
1. Driver documents reason
2. Driver contacts customer and admin
3. Reschedule delivery
4. Update trip listing
5. Keep items safe until redelivery
6. No additional charge if company error
7. May charge redelivery fee if customer error (policy decision)

---

## Sales Team Roles

### Sales Admin

**Primary Responsibilities**:
- Create and manage sales orders
- Collect deposits and payments
- Schedule deliveries
- Coordinate between teams
- Generate invoices and delivery orders
- Reconcile payments
- Customer communication
- Handover to accounts

**System Access Needed**:
- Sales module
- Customer maintenance
- Inventory (view)
- Trip listing
- Payment processing

### Warehouse Helper

**Primary Responsibilities**:
- Pick stock based on sales orders
- Record serial numbers
- Verify item condition
- Pack and protect items
- Load delivery vehicle
- Maintain warehouse organization

**System Access Needed**:
- View sales orders
- View stock locations
- (May not need direct system access if using printed documents)

### Delivery Driver

**Primary Responsibilities**:
- Execute deliveries per trip listing
- Call customers before arrival
- Deliver items safely
- Obtain customer signatures
- Take delivery photos
- Collect payments (if applicable)
- Return documents and payments to admin

**System Access Needed**:
- View trip listing (may use printed copy)
- Upload photos (WhatsApp or app)
- (Limited system access needed if using printed documents)

### Customer Service

**Primary Responsibilities**:
- Answer customer inquiries
- Handle complaints and issues
- Process returns and exchanges
- Follow up after delivery
- Maintain customer satisfaction

**System Access Needed**:
- Customer maintenance
- View sales orders
- Returns processing
- Communication tools

---

## Key Performance Indicators (KPIs)

### Sales Performance

**Sales Volume**:
- Daily/weekly/monthly sales value
- Number of transactions
- Average order value
- Year-over-year growth

**Conversion Rates**:
- Quotations to orders
- Repeat customer rate
- Upselling success

### Operational Efficiency

**Order Processing**:
- Order-to-delivery time (target < 3 days)
- First-time delivery success (target > 95%)
- Order accuracy (target 100%)

**Payment Collection**:
- Deposit collection rate (target 100%)
- Payment collection on delivery (target 100% for standard sales)
- Days sales outstanding - DSO (target < 45 days)

### Customer Satisfaction

**Service Quality**:
- On-time delivery rate (target > 95%)
- Customer complaints (target < 2%)
- Delivery damage rate (target < 1%)
- Return rate (target < 5%)

**Financial Control**:
- Daily reconciliation completion (target 100%)
- Payment discrepancy rate (target < 0.5%)
- Bad debt rate (target < 1%)

{{< callout type="info" >}}
**Measure What Matters**: Track these KPIs to identify improvement opportunities and maintain high service standards.
{{< /callout >}}

---

## System Navigation Quick Guide

### Creating Sales Order

```
Sales Module → Sales Orders → Create New Order
→ Select Customer → Add Items → Calculate Total
→ Record Deposit → Confirm Order
```

### Scheduling Delivery

```
Logistics → Trip Listing → Select Date
→ Add Delivery → Customer & Address
→ Assign Route → Save
```

### Generating Delivery Order & Invoice

```
Sales Orders → Open Order → Convert Stock
→ Generate Invoice → Generate Delivery Order
→ Print Documents
```

### Recording Payment

```
Sales/Accounting → Invoices → Open Invoice
→ Record Payment → Enter Amount & Method
→ Attach Proof → Confirm
```

### Processing Return

```
Sales Module → Returns/Credit Notes → Create Return
→ Link to Original Order → Select Items
→ Enter Reason → Approve → Process Refund
```

---

## Best Practices Summary

### Customer Communication
- ✅ Respond to inquiries promptly (within 2 hours)
- ✅ Set clear expectations (pricing, delivery timing, terms)
- ✅ Confirm delivery appointments 1 day before
- ✅ Follow up after delivery (2-3 days)
- ✅ Handle complaints professionally and quickly

### Documentation
- ✅ Print and distribute documents every morning
- ✅ Ensure customer signatures on all deliveries
- ✅ Take photos of every delivery
- ✅ File documents systematically
- ✅ Keep backup digital copies

### Financial Control
- ✅ Collect adequate deposits (minimum 30%)
- ✅ Verify payment before releasing goods
- ✅ Reconcile cash daily without fail
- ✅ Record payments same day received
- ✅ Follow up on overdue payments proactively

### Teamwork
- ✅ Morning briefings with warehouse and drivers
- ✅ Real-time updates via WhatsApp group
- ✅ Clear handovers between shifts
- ✅ Support each other during busy periods
- ✅ Celebrate successes together

### Problem Solving
- ✅ Address issues immediately, don't delay
- ✅ Escalate to supervisor when needed
- ✅ Document problems and solutions
- ✅ Learn from mistakes
- ✅ Continuous improvement mindset

---

## Common Mistakes to Avoid

❌ **Insufficient deposit collection** → Leads to cancellations and cash flow issues

❌ **Incorrect serial number recording** → Causes warranty and inventory nightmares

❌ **Missing customer signatures** → No proof of delivery if disputes arise

❌ **No delivery photos** → Cannot prove condition if customer complains

❌ **Delayed reconciliation** → Discrepancies harder to resolve days later

❌ **Poor communication** → Leads to missed deliveries and customer frustration

❌ **Skipping credit checks** → Results in bad debts from unqualified customers

❌ **Incomplete handover to accounts** → Creates delays and reporting errors

---

## Quick Troubleshooting

### System Issues

**Can't find customer**:
- Search by phone number or email
- Check spelling variations
- Customer may be in system under different name
- Create new if genuinely not found

**Invoice won't generate**:
- Check all required fields completed
- Verify stock allocated/converted
- Check for system errors or permissions
- Contact IT support if persists

**Payment won't record**:
- Check invoice status (must be "issued")
- Verify payment amount valid
- Check for duplicate payment entries
- Ensure payment method selected

### Process Issues

**Stock shortage discovered late**:
- Apologize to customer
- Offer immediate alternatives
- Process partial delivery if customer agrees
- Rush restock if possible
- Compensate with discount if significant issue

**Driver can't reach customer**:
- Try all customer contact numbers
- Check delivery address correct
- Look for landmarks or clarifications
- Reschedule if customer unavailable
- Update customer to call when ready

**Payment amount disputed**:
- Show customer original signed sales order
- Review any pricing changes
- Check for applicable discounts
- Verify deposit credited correctly
- Escalate to manager if unresolved

---

## Training Resources

### New Sales Staff Onboarding

**Week 1**: Learn systems and processes
- Shadow experienced sales admin
- Learn customer profile creation
- Practice sales order entry
- Understand product catalog

**Week 2**: Handle transactions with supervision
- Create sales orders (supervised)
- Process payments (supervised)
- Learn trip listing
- Observe delivery process

**Week 3**: Independent operations
- Handle sales orders independently
- Manage daily routines
- Reconcile payments
- Problem-solving skills

**Week 4+**: Mastery and specialization
- Handle complex situations
- Train newer staff
- Contribute process improvements
- Specialize in certain workflows

### Ongoing Training

- Weekly team meetings to discuss challenges
- Monthly review of KPIs and improvement areas
- Quarterly training on new features or processes
- Annual customer service and sales skills training

---

## Quick Reference Links

### Detailed Workflow Guides
- [Standard Sales Workflow](../../guides/sales-guides/standard-sales-workflow)
- [Credit Sales Workflow](../../guides/sales-guides/credit-sales-workflow)
- [Cash Sales Workflow](../../guides/sales-guides/cash-sales-workflow)
- [Instalment Sales Workflow](../../guides/sales-guides/instalment-sales-workflow)
- [Partial Delivery Workflow](../../guides/sales-guides/partial-delivery-workflow)
- [Returns & Exchanges Workflow](../../guides/sales-guides/returns-exchanges-workflow)
- [Installation Scheduling Workflow](../../guides/sales-guides/installation-scheduling-workflow)

### Step-by-Step Task Guides
- [Creating Sales Orders](creating-sales-order)
- [Delivery Order Processing](delivery-order-processing)
- [Trip Listing Management](trip-listing-management)
- [Sales Payment Collection](sales-payment-collection)

### Related Module Documentation
- [Sales & CRM Module](../../modules/sales-crm/)
- [Customer Maintenance Applet](../../applets/customer-maintenance-applet/)
- [Pricebook Applet](../../applets/pricebook-applet/)

---

{{< callout type="tip" >}}
**Bookmark This Page**: Keep this overview handy as your daily quick reference. Use the links to access detailed instructions when needed.
{{< /callout >}}

---

*Sales operations success depends on consistency, attention to detail, and teamwork. Follow established procedures, communicate effectively, and always prioritize customer satisfaction.*
