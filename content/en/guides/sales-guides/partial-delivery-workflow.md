---
title: "Partial Delivery Workflow"
description: "Managing split shipments and multiple delivery scheduling when full order cannot be delivered at once"
weight: 50
---

The Partial Delivery Workflow handles situations where a sales order must be delivered in multiple shipments due to stock availability, customer request, or logistical constraints. This workflow ensures proper tracking, invoicing, and payment collection across multiple deliveries.

## Workflow Overview

```
Sales Order Creation → Identify Partial Delivery Need →
First Delivery (Available Items) → Partial Invoice & Payment →
Stock Arrival/Preparation → Second Delivery → Final Invoice & Payment →
Order Completion
```

{{< callout type="info" >}}
**Flexibility**: Partial deliveries maintain customer satisfaction when immediate full delivery isn't possible while keeping sales moving forward.
{{< /callout >}}

## When to Use This Workflow

Use Partial Delivery Workflow when:
- **Stock shortage**: Some items available, others out of stock or backordered
- **Customer request**: Customer wants available items immediately, will wait for rest
- **Large orders**: Phased delivery over multiple trips due to size/volume
- **Progressive availability**: Items become available at different times
- **Mixed products**: Some ready-stock, others made-to-order
- **Delivery constraints**: Vehicle capacity limitations
- **Installation scheduling**: Different items require different installation dates

{{< callout type="warning" >}}
**Complexity Alert**: Partial deliveries add complexity to tracking, invoicing, and collection. Only use when necessary. If possible, wait for complete stock before delivery.
{{< /callout >}}

---

## Common Partial Delivery Scenarios

### Scenario 1: Stock Shortage at Order Time

**Situation**:
- Customer orders 5 items
- 3 items in stock, 2 out of stock
- Expected restock in 1 week

**Options**:
- **A**: Deliver 3 now, 2 when restocked (Partial Delivery)
- **B**: Wait 1 week, deliver all 5 together (Standard Delivery)

**Choose Partial Delivery If**:
- Customer needs some items urgently
- Customer willing to accept split delivery
- Uncertain restock date for remaining items
- Customer satisfaction improved by partial delivery

### Scenario 2: Customer-Requested Split Delivery

**Situation**:
- Customer has multiple locations
- Wants items delivered to different addresses
- Or wants delivery spread over time

**Example**:
- Office furniture order
- Deliver desks this week (office ready)
- Deliver chairs next week (still renovating)

### Scenario 3: Large Order Vehicle Capacity

**Situation**:
- Full order too large for single delivery vehicle
- Requires multiple trips

**Example**:
- Restaurant equipment order
- First trip: Kitchen equipment
- Second trip: Dining furniture

### Scenario 4: Progressive Installation

**Situation**:
- Items require sequential installation
- Cannot install all at once

**Example**:
- Home appliance package
- Day 1: Deliver and install built-in oven
- Day 2: Deliver and install cooktop (after oven installed)

---

## Detailed Process Steps

### Step 1: Create Sales Order (Same as Standard)

**Responsible**: Sales Admin

1. Follow [Standard Sales Workflow Step 1-2](standard-sales-workflow#step-1-open-customer-profile-in-system)
2. **Create complete sales order** with ALL items customer wants
3. **Collect appropriate deposit**:
   - Option A: Deposit on full order value
   - Option B: Deposit on first delivery only
   - Option C: Proportional deposit (e.g., 30% of each delivery)
4. **Note in Sales Order**:
   - "Partial Delivery Expected"
   - Reason for partial delivery
   - Expected timeline for complete delivery

---

### Step 2: Determine First Delivery Items

**Responsible**: Sales Admin + Warehouse

#### Identify Available Stock:

1. **Check Stock Availability**:
   - Review each item in sales order
   - Check current stock levels
   - Identify:
     - ✅ Available now (can deliver immediately)
     - ⏳ Backordered (expected date: ___)
     - 🚫 Out of stock (no expected date)

2. **Create Delivery Plan**:
   - **Delivery 1**: Items available now
   - **Delivery 2**: Items expected [Date]
   - **Delivery 3**: Remaining items (if needed)

3. **Communicate with Customer**:
   - Explain partial delivery situation
   - Present delivery plan:
     - "We can deliver [Items A, B, C] immediately"
     - "[Items D, E] will be available on [Date]"
     - "Would you like us to proceed this way?"
   - Get customer approval
   - Document customer agreement

4. **Update Sales Order**:
   - Note agreed delivery schedule
   - Flag as "Partial Delivery Approved"
   - Set reminders for subsequent deliveries

{{< callout type="tip" >}}
**Customer Communication**: Be proactive and transparent about partial delivery. Surprises frustrate customers. Clear communication maintains trust.
{{< /callout >}}

---

### Step 3: Process First Delivery

**Responsible**: Sales Admin, Warehouse, Driver

#### Create First Delivery Order:

1. **Generate Partial Delivery Order**:
   - From original Sales Order
   - Select items for first delivery
   - Create Delivery Order #1
   - Note: "Delivery 1 of 2" or "Partial Delivery"

2. **Prepare Partial Invoice**:
   - **Option A: Partial Invoice** (Recommended):
     - Invoice only items being delivered now
     - Example: If delivering 3 of 5 items, invoice those 3
     - Clearer for customer and accounts

   - **Option B: Full Invoice with Partial Delivery Note**:
     - Invoice all items in order
     - Note which items delivered today, which pending
     - Can be confusing for payment

3. **Calculate Partial Payment**:

   **Example**:
   - Total Order: $5,000
   - Deposit Paid: $1,500
   - Delivering items worth: $3,000 (60% of order)
   - Balance due for this delivery: $______

   **Payment Calculation Methods**:

   **Method 1: Proportional**:
   - Customer pays for items delivered
   - First delivery items value: $3,000
   - Less proportional deposit: $900 (30% of $3,000)
   - Balance due now: $2,100
   - Remaining deposit for 2nd delivery: $600

   **Method 2: Apply All Deposit to First Delivery**:
   - First delivery items value: $3,000
   - Less full deposit already paid: $1,500
   - Balance due now: $1,500
   - Second delivery: Full balance due

   **Method 3: Customer Pays Balance Only on Final Delivery**:
   - Deliver first items, no additional payment
   - Collect full balance on final delivery
   - Higher risk if customer refuses final delivery

4. **Execute Delivery**:
   - Follow [Standard Sales Workflow Steps 3-9](standard-sales-workflow#step-3-confirm-deliveryinstallation-date-and-add-to-trip-listing)
   - Warehouse picks items for Delivery 1
   - Generate Delivery Order and Partial Invoice
   - Load and deliver items
   - Obtain customer signature
   - Take delivery photos
   - Collect payment (if applicable)

5. **Delivery Documents**:
   - Delivery Order clearly marked:
     - "Delivery 1 of 2"
     - Lists only items in this delivery
     - Notes remaining items pending
   - Partial Invoice (if using):
     - Shows items delivered
     - Shows payment for these items
     - Notes remaining items to follow

{{< callout type="warning" >}}
**Customer Signature**: Customer signs acknowledging receipt of THESE specific items. Make clear that more items are coming. Customer should not sign as if order is complete.
{{< /callout >}}

---

### Step 4: Update System After First Delivery

**Responsible**: Sales Admin

1. **Record Partial Delivery in System**:
   - Update Sales Order status: "Partially Delivered"
   - Mark delivered items as "Delivered"
   - Mark pending items as "Awaiting Stock"
   - Record delivery date for delivered items

2. **Record Partial Payment**:
   - If payment collected for first delivery
   - Record amount against sales order
   - Update balance due
   - Calculate remaining balance for final delivery

3. **Outstanding Items Tracking**:
   - List items still pending
   - Expected availability dates
   - Set reminders for follow-up
   - Monitor stock arrival

4. **Customer Communication**:
   - Confirm first delivery completed
   - Remind of pending items
   - Update expected delivery date for remaining items
   - Maintain customer awareness

---

### Step 5: Prepare for Subsequent Deliveries

**Responsible**: Sales Admin + Warehouse

#### Monitor Stock for Remaining Items:

1. **Track Incoming Stock**:
   - Check purchase orders for backordered items
   - Monitor expected arrival dates
   - Coordinate with purchasing/suppliers
   - Update customer on any delays

2. **When Stock Arrives**:
   - Verify items received
   - Inspect quality
   - Update inventory system
   - **Immediately notify customer**:
     - "Good news! The remaining items have arrived"
     - "We can schedule delivery"
     - "When would be convenient?"

3. **Schedule Second Delivery**:
   - Coordinate with customer
   - Add to trip listing
   - Follow same preparation process

---

### Step 6: Process Final Delivery

**Responsible**: Sales Admin, Warehouse, Driver

1. **Generate Final Delivery Order**:
   - Create Delivery Order for remaining items
   - Note: "Delivery 2 of 2 - Final" or "Completing Order [SO Number]"

2. **Generate Final Invoice** (if using partial invoices):
   - Invoice remaining items
   - Show previous delivery/payment
   - Calculate final balance due

3. **Calculate Final Payment**:
   - Total Order Value: $5,000
   - Previous Delivery Payment: $3,000
   - **Final Balance Due**: $2,000
   - Verify customer understands amount

4. **Execute Final Delivery**:
   - Warehouse picks remaining items
   - Load and deliver
   - Obtain customer signature
   - Take delivery photos
   - **Collect final payment**

5. **Verify Order Completion**:
   - **Check with customer**: "This completes your order [SO Number]. You've received all [X] items. Is everything satisfactory?"
   - Ensure customer agrees order is complete
   - No items missing or damaged

{{< callout type="info" >}}
**Final Verification**: Before marking order complete, explicitly confirm with customer that ALL items have been received and order is complete to their satisfaction.
{{< /callout >}}

---

### Step 7: Complete Sales Order

**Responsible**: Sales Admin

1. **Update System**:
   - Mark all items as "Delivered"
   - Sales Order status: "Completed"
   - All invoices: "Paid"
   - Delivery complete date recorded

2. **Final Documentation**:
   - File all delivery orders together
   - File all invoices together
   - Attach all payment receipts
   - All photos archived

3. **Financial Reconciliation**:
   - Verify total payments = Total order value
   - All partial payments recorded correctly
   - Accounts receivable updated
   - No outstanding balance

4. **Customer Follow-Up**:
   - Send thank you message
   - Confirm complete satisfaction
   - Provide warranty information
   - Request feedback or review

---

## Best Practices for Partial Deliveries

### Communication:
- **Set Expectations Early**: Tell customer about partial delivery before first delivery
- **Keep Customer Updated**: Proactive communication about pending items
- **Clear Documentation**: Every document clearly notes "Partial" or "X of Y"
- **Confirm Completion**: Explicitly confirm when order is complete

### Documentation:
- **Clear Labeling**: All DOs and invoices labeled clearly as partial
- **Tracking**: Maintain clear tracking of what's delivered and what's pending
- **Photos**: Take photos of each delivery
- **System Notes**: Detailed notes in system about partial delivery plan

### Financial:
- **Clear Payment Terms**: Customer understands payment schedule upfront
- **Track Partial Payments**: System accurately tracks multiple payments against one order
- **Balance Transparency**: Customer always knows remaining balance
- **Deposit Management**: Clear how deposit applies to multiple deliveries

### Operations:
- **Minimize Partial Deliveries**: Only use when necessary
- **Batch Items**: Try to deliver in as few trips as possible
- **Coordinate Scheduling**: Schedule subsequent deliveries efficiently
- **Complete Quickly**: Don't let partial deliveries drag on for months

---

## Special Cases

### Case 1: Three or More Deliveries

**When**: Very large order, items available at different times

**Process**:
- Same as above, repeated for each delivery
- Label: "Delivery 1 of 3", "Delivery 2 of 3", "Delivery 3 of 3 - Final"
- Track carefully - complexity increases with each additional delivery
- Consider batching deliveries to reduce trips

### Case 2: Customer Cancels Remaining Items

**Scenario**: After first delivery, customer no longer wants remaining items

**Process**:
- Confirm cancellation in writing/email
- Calculate refund if applicable:
  - Total order value: $5,000
  - Delivered: $3,000
  - Deposit paid: $1,500
  - Refund: $1,500 - $3,000 = -$1,500 (customer owes $1,500) OR refund if deposit exceeded delivered value
- Update sales order: "Partially Delivered, Remainder Cancelled"
- Release reserved stock for remaining items
- Process refund/collect balance as appropriate

### Case 3: Different Delivery Addresses

**Scenario**: Same order, items go to different locations

**Process**:
- Create separate delivery orders for each address
- Each DO shows specific address
- May require different delivery days
- Charge delivery fees if applicable
- Track each address delivery separately
- Customer signature at each location

### Case 4: Partial Delivery with Installation

**Scenario**: Some items need installation, delivered at different times

**Process**:
- Schedule installation for each delivery as needed
- Day 1: Deliver + Install items A, B
- Day 2: Deliver + Install items C, D
- Coordinate installation team for each delivery
- Customer signs completion after each installation

---

## Invoicing Options Comparison

### Option A: Multiple Partial Invoices (Recommended)

**Structure**:
- Invoice 1: Items in first delivery
- Invoice 2: Items in second delivery

**Pros**:
- Clearer for customer (pays for what received)
- Easier accounting (matches delivery)
- Less confusion
- Better payment tracking

**Cons**:
- Multiple invoice numbers for one order
- More administrative work

### Option B: Single Full Invoice with Partial Delivery Notes

**Structure**:
- One invoice for all items
- Notes indicate which items delivered when
- Payment schedule noted

**Pros**:
- Single invoice for entire order
- Less paperwork

**Cons**:
- Can confuse customer (invoiced for items not yet received)
- Payment allocation complex
- Customer may dispute paying for undelivered items

**Recommendation**: Use Option A (Multiple Partial Invoices) for clarity and customer satisfaction.

---

## Common Issues and Solutions

### Issue 1: Customer Refuses to Pay Balance on Final Delivery

**Scenario**: Customer already has most items, refuses to pay for final delivery.

**Prevention**:
- Collect adequate deposit upfront
- Consider collecting balance for each delivery as it arrives
- Don't over-deliver on first shipment relative to payment

**Solution**:
- Politely but firmly explain payment terms
- Show signed sales order with total amount
- If necessary, take back undelivered items
- Legal action for breach of contract (last resort)

### Issue 2: Indefinite Delay on Remaining Items

**Scenario**: Items for second delivery never arrive or long delayed.

**Solution**:
- Keep customer informed of delays
- Offer alternatives:
  - Substitute similar products
  - Partial refund for undelivered items
  - Store credit for future purchases
- Don't let order hang indefinitely (set max 90 days)
- Close order with partial completion if necessary

### Issue 3: Customer Loses Track of What's Delivered

**Scenario**: Customer calls asking about items already delivered or disputes items pending.

**Prevention**:
- Clear delivery documentation
- Provide customer with itemized list of delivered vs pending
- Photos of each delivery

**Solution**:
- Reference delivery orders with customer signatures
- Show delivery photos
- Email summary after each delivery listing what's complete and what's pending

### Issue 4: Payment Allocation Confusion

**Scenario**: Customer made payments but unclear which delivery they cover.

**Prevention**:
- Issue receipts clearly referencing delivery
- Maintain payment schedule document
- System tracks payments per delivery

**Solution**:
- Review all payment receipts
- Match dates with deliveries
- Reconcile with customer together
- Create clear payment history document

---

## Partial Delivery vs. Backorder

### Partial Delivery:
- Customer receives some items now
- Remaining items delivered later
- Customer aware and agrees to split delivery
- Active process

### Backorder:
- Entire order on hold until all items available
- Customer waits for complete order
- Deliver everything together when ready
- Passive waiting

**When to Choose**:
- **Partial Delivery**: Customer wants available items immediately
- **Backorder**: Customer prefers to wait for complete delivery

---

## Success Metrics

**Partial Delivery Rate**:
- % of orders requiring partial delivery: Track trend (lower is better)
- Target: < 10% of orders

**Completion Time**:
- Average days from first to final delivery: Target < 14 days
- Orders taking > 30 days: Target < 2%

**Customer Satisfaction**:
- Customer complaints about partial delivery: Target < 1%
- Customer acceptance rate when offered partial delivery: Target > 80%

**Financial**:
- Payment collection rate on partial deliveries: Target 100%
- Average deposit vs order value: Target > 30%

---

## Related Workflows

- **[Standard Sales Workflow](standard-sales-workflow)** - Complete order delivery process
- **[Credit Sales Workflow](credit-sales-workflow)** - Partial delivery on credit terms
- **[Returns & Exchanges](returns-exchanges-workflow)** - If partial delivery items need return

---

{{< callout type="tip" >}}
**Minimize Partials**: While this workflow enables partial delivery when needed, always prefer complete deliveries when possible. Partial deliveries add complexity and cost. Work with purchasing to improve stock availability.
{{< /callout >}}

---

*Partial deliveries balance customer service with operational reality. Handle professionally with clear communication and documentation to maintain customer satisfaction despite split shipments.*
