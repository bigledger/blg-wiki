---
title: "Creating Sales Orders"
description: "Step-by-step guide to creating sales orders in BigLedger"
weight: 31
---

A sales order is the foundation of your sales process, capturing customer requirements, products ordered, pricing, and payment terms. This guide walks you through creating sales orders efficiently and accurately.

## Before You Start

### Prerequisites

Ensure you have:
- ✅ Customer information (existing or ready to create new profile)
- ✅ Product details and stock availability confirmed
- ✅ Pricing and discount information
- ✅ Delivery requirements and timeline
- ✅ Payment method and terms agreed with customer

{{< callout type="warning" >}}
**Stock Check First**: Always verify stock availability before confirming orders to avoid disappointing customers with delays or cancellations.
{{< /callout >}}

---

## Step-by-Step: Creating a Sales Order

### Step 1: Access Sales Order Module

1. Log in to BigLedger
2. Navigate to **Sales Module** (main menu)
3. Click **Sales Orders** (or **Create Sales Order**)
4. System displays sales order creation screen

### Step 2: Select or Create Customer

#### If Customer Exists:

1. Click **Customer** field (dropdown or search box)
2. Start typing customer name, code, or phone number
3. System displays matching results
4. Select correct customer from list
5. System auto-fills customer information:
   - Billing address
   - Delivery address
   - Contact details
   - Payment terms (if credit customer)
   - Tax information

{{< callout type="tip" >}}
**Quick Search**: Use phone numbers for fastest customer search. Most unique identifier.
{{< /callout >}}

#### If New Customer:

1. Click **Create New Customer** (or + icon)
2. Enter required information:

   **Basic Details**:
   - Customer name
   - Contact person (if company)
   - Phone number (primary)
   - Email address
   - Customer type (Individual/Company)

   **Addresses**:
   - Billing address (full address with postcode)
   - Delivery address (if different from billing)

   **Additional Info**:
   - Tax registration number (if applicable)
   - Payment terms (Cash/Credit)
   - Credit limit (if credit customer)
   - Preferred contact method

3. Click **Save Customer**
4. System creates customer profile
5. Returns to sales order with customer selected

**Quick Customer Creation**: For fast orders, enter minimum information (name, phone, address). Complete profile later.

### Step 3: Enter Sales Order Details

**Order Information**:

1. **Order Date**: Auto-fills to today (change if needed)
2. **Reference Number**: Customer's PO number or reference (optional)
3. **Salesperson**: Select from dropdown (yourself or assign to colleague)
4. **Payment Terms**:
   - Auto-populates if credit customer (Net 30, Net 60)
   - Select appropriate terms for cash customers
5. **Expected Delivery Date**: Customer's preferred date

**Delivery Information**:

6. **Delivery Address**: Verify or select alternative address
7. **Delivery Instructions**: Special instructions for driver
   - Example: "Call 30 mins before. Use back entrance. 3rd floor, no elevator."
8. **Contact Person**: Person receiving delivery (if different from customer)
9. **Contact Phone**: Phone number for delivery day

### Step 4: Add Items to Order

**Adding Products**:

1. Click **Add Item** or **+ Add Line**
2. **Search for Product**:
   - Type product name, code, or barcode
   - Select from dropdown
   - Or browse product catalog

3. **For Each Item, Enter**:
   - **Quantity**: Number of units
   - **Unit Price**: Auto-fills from pricebook
   - **Discount**: % or fixed amount (if applicable)
   - **Tax**: Auto-calculates based on tax settings
   - **Notes**: Item-specific notes (optional)

4. **Verify Line Item**:
   - Description correct
   - Quantity correct
   - Price acceptable
   - Line total = (Qty × Unit Price) - Discount + Tax

5. **Add More Items**: Repeat for each product in order

**Quick Add Multiple Items**:
- Use barcode scanner for rapid entry
- Import from quotation if exists
- Copy from previous order

{{< callout type="info" >}}
**Pricing**: System uses pricebook to auto-fill prices. Check that correct price applies. Verify if customer has special pricing agreement or contract.
{{< /callout >}}

### Step 5: Apply Discounts (if applicable)

**Item-Level Discounts**:
- Applied per line item (already done in Step 4)
- Example: 10% off specific product

**Order-Level Discounts**:
1. In order totals section, find **Order Discount**
2. Enter percentage or fixed amount
3. System recalculates total
4. Add discount reason/approval (if required by policy)

**Promotional Discounts**:
- System may auto-apply active promotions
- Verify correct promotion applied
- Check terms and conditions met

**Discount Approval**:
- Large discounts may require manager approval
- Submit for approval if needed
- Wait for approval before confirming order

### Step 6: Review Order Totals

**Verify Calculations**:

```
Subtotal:         $_______  (Sum of all item totals before discounts)
Item Discounts:   $_______  (Sum of line-item discounts)
Order Discount:   $_______  (Order-level discount)
Taxable Amount:   $_______  (After discounts)
Tax (SST/VAT):    $_______  (Tax rate × taxable amount)
Shipping (if any): $_______
──────────────────
GRAND TOTAL:      $_______
```

**Check**:
- Math accurate
- Tax calculated correctly
- Discounts applied properly
- Shipping charges if applicable

### Step 7: Enter Payment Information

**Payment Type Selection**:

Choose appropriate option:
- **Cash Sale**: Full payment before/at delivery
- **Deposit + Balance**: Standard sales (most common)
- **Credit Terms**: Net 30/60/90 (approved customers only)
- **Instalment/Financing**: AEON, JCL, etc.

#### For Cash Sales:

1. Select **Payment Method**: Cash/Card/Transfer
2. Enter **Amount**: Grand Total (full amount)
3. Process payment (see [Payment Collection](sales-payment-collection))
4. Mark as **Paid**

#### For Deposit + Balance Sales:

1. **Calculate Deposit**:
   - Enter deposit % (e.g., 30%, 50%)
   - Or enter fixed deposit amount
   - System shows **Deposit Amount**

2. **Collect Deposit**:
   - Select **Payment Method**
   - Cash: Count and accept payment
   - Card: Process through terminal
   - Transfer: Show account details, verify transfer
   - Record **Transaction Reference**

3. **Balance Due**:
   - System auto-calculates:
   - Balance Due = Grand Total - Deposit
   - Note due date (delivery date)

4. **Record Deposit Payment**:
   - Click **Record Payment**
   - Enter deposit amount
   - Select payment method
   - Attach proof (transfer slip photo, card receipt)
   - Mark deposit as received

#### For Credit Sales:

1. **Verify Credit Eligibility**:
   - Customer has approved credit limit
   - Available credit sufficient for this order
   - No overdue payments
   - Account status: Active

2. **Payment Terms**:
   - Auto-fills (Net 30, Net 60)
   - Due Date calculated (Order Date + Terms)
   - No deposit required (Balance = Grand Total)

3. **Credit Authorization**:
   - May require manager approval if:
     - Order value exceeds threshold
     - Customer approaching credit limit
     - New credit customer
   - Submit for approval if needed

#### For Instalment Sales:

1. Select **Instalment - [Finance Partner]**
2. Enter **Finance Application Details**:
   - Finance company (AEON, JCL, etc.)
   - Finance amount
   - Term (months)
   - Approval reference number

3. **Down Payment** (if applicable):
   - Customer pays % downpayment
   - Collect and record
   - Remaining financed by finance company

4. **Agreement**: Note that finance agreement will be signed separately

{{< callout type="warning" >}}
**Deposit Policy**: Ensure deposit meets company minimum requirements. Insufficient deposits increase cancellation risk and tie up inventory.
{{< /callout >}}

### Step 8: Add Internal Notes

**Internal Notes Section** (not visible to customer):
- Special handling instructions
- Warehouse notes
- Delivery considerations
- Customer preferences or history
- Anything team should know

**Example Notes**:
- "Customer very particular about delivery time. Confirm 1 day before."
- "Product for customer's anniversary gift. Handle with extra care."
- "Items located in warehouse B, rack A5."

### Step 9: Review Complete Order

**Final Checklist**:

Review entire order carefully:
- [ ] Customer information correct (name, phone, address)
- [ ] All items added with correct quantities
- [ ] Pricing accurate and discounts applied
- [ ] Tax calculated correctly
- [ ] Grand total matches customer expectation
- [ ] Deposit collected (if applicable)
- [ ] Payment method recorded
- [ ] Delivery date confirmed
- [ ] Delivery address complete with instructions
- [ ] Special requirements noted

{{< callout type="tip" >}}
**Read Aloud**: Read order summary aloud to customer to confirm everything correct. Prevents misunderstandings and order changes later.
{{< /callout >}}

### Step 10: Save and Confirm Sales Order

1. **Save Draft** (optional):
   - If need to complete later
   - Saves work in progress
   - Returns to finish later

2. **Confirm Sales Order**:
   - Click **Confirm Order** or **Submit**
   - System validates all required fields
   - System assigns **Sales Order Number**
     - Example: SO-2024-001234
   - Order status: "Confirmed"

3. **System Actions** (automatic):
   - Creates order record
   - Reserves stock (soft allocation)
   - Updates customer account
   - Records deposit payment
   - Calculates balance due
   - Triggers notifications (if configured)

### Step 11: Print and Provide Documentation

**Print Sales Order**:

1. Click **Print** or **Download PDF**
2. Print multiple copies:
   - **Customer Copy**: Give to customer immediately
   - **Warehouse Copy**: For stock picking
   - **Office Copy**: Admin filing

**Sales Order Document Includes**:
- Sales Order Number (important!)
- Order Date
- Customer details
- Delivery address
- Items ordered (with quantities and pricing)
- Grand Total
- Deposit Paid
- Balance Due
- Payment Terms
- Delivery Date
- Terms and Conditions

**Customer Acknowledgment**:

3. Review order with customer
4. Customer signs acknowledgment section
5. Date signed
6. Customer receives their copy

**Deposit Receipt**:

7. If deposit collected, issue receipt:
   - Receipt number
   - Deposit amount
   - Payment method
   - Balance remaining
   - Due date

{{< callout type="info" >}}
**Customer Copy**: Customer MUST receive signed sales order copy. This is their proof of order and protects both parties if disputes arise.
{{< /callout >}}

### Step 12: Post-Order Actions

**Immediate Actions**:

1. **File Office Copy**: Organize by date or SO number
2. **Distribute Warehouse Copy**: Give to warehouse for picking (or place in pickup tray)
3. **Add to Delivery Schedule**: Enter in trip listing if delivery date set
4. **Set Reminders**:
   - Stock picking deadline
   - Delivery date reminder
   - Payment follow-up (if credit)

**Communication**:

5. **Confirm with Customer**:
   - Send confirmation SMS/Email
   - Thank customer for order
   - Remind of next steps
   - Provide contact for questions

6. **Notify Relevant Teams**:
   - Warehouse: Stock picking required
   - Delivery: Upcoming delivery
   - Accounts: Deposit received, balance pending

---

## Order Modifications

### Editing Undelivered Orders

**Can Modify If**:
- Order not yet delivered
- Stock not yet converted
- Status: "Confirmed" or "Pending"

**To Edit**:
1. Open Sales Order
2. Click **Edit** or **Modify**
3. Make changes:
   - Add/remove items
   - Change quantities
   - Update pricing
   - Modify delivery date
4. Recalculate totals
5. Adjust deposit if needed
6. Save changes
7. Inform customer of changes
8. Reprint updated sales order

{{< callout type="warning" >}}
**Stock Converted**: If stock already converted (serial numbers entered), cannot easily modify. May need to cancel and recreate order.
{{< /callout >}}

### Cancelling Orders

**Cancellation Process**:

1. Open Sales Order
2. Click **Cancel Order**
3. Enter cancellation reason
4. System changes status to "Cancelled"
5. **Refund Deposit**:
   - If deposit collected: Process refund
   - Calculate any cancellation fees (if policy)
   - Issue credit note or refund
6. **Release Stock**: Inventory allocation removed
7. **Notify Customer**: Confirm cancellation and refund

**Cancellation Fees** (optional policy):
- Before picking: No fee or minimal admin fee ($5-10)
- After picking: 10-20% restocking fee
- After delivery: Follow returns policy

---

## Special Order Types

### Custom Orders / Made-to-Order

**Process**:
1. Create sales order as normal
2. Flag as **Custom Order**
3. May require:
   - Higher deposit (50-100%)
   - Longer delivery timeline
   - Customer approval on design/specifications
   - No returns/exchanges (policy)
4. Coordinate with production/sourcing team
5. Update customer on progress

### Standing Orders / Recurring Orders

**For Regular Customers**:
1. Create template sales order
2. Save as **Recurring Order**
3. Set frequency (weekly, monthly)
4. System can auto-generate orders
5. Customer confirms or modifies each occurrence

### Drop Shipment Orders

**Customer orders, supplier ships directly**:
1. Create sales order as normal
2. Mark as **Drop Shipment**
3. Create purchase order to supplier
4. Provide customer's delivery address to supplier
5. Supplier ships directly to customer
6. Track delivery through supplier
7. Invoice customer when delivery confirmed

---

## Common Challenges and Solutions

### Challenge: Customer Can't Decide

**Solution**:
- Save order as **Quotation** instead of confirmed order
- Provide printed quotation to customer
- Set expiry date (e.g., valid 7 days)
- Follow up with customer
- Convert quotation to sales order when customer confirms

### Challenge: Price Dispute

**Situation**: Customer claims different price was discussed

**Resolution**:
- Check if special pricing applies
- Review quotation if exists
- Check for active promotions
- Escalate to sales manager
- Honor price if company error
- Explain clearly if customer mistaken
- Find compromise if possible

### Challenge: Stock Quantity Insufficient

**Discovered After Order Entry**:
1. Stop and check exact stock available
2. Options:
   - **Partial Delivery**: Customer accepts available quantity now
   - **Wait**: Delay delivery until full stock available
   - **Substitute**: Offer alternative product
   - **Cancel**: Refund deposit if customer prefers
3. Update order accordingly
4. Reset customer expectations

### Challenge: System Won't Let You Confirm

**Common Causes**:
- Required field missing (check for red highlights)
- Customer doesn't exist (create customer first)
- Price validation failed (check pricing permissions)
- Stock validation failed (override or adjust quantity)
- Payment information incomplete
- User permissions insufficient (contact admin)

**Solution**: Review error messages carefully and address each issue.

---

## Best Practices

### Accuracy
- ✅ Double-check quantities and pricing
- ✅ Verify customer information
- ✅ Confirm delivery address complete
- ✅ Ensure deposit meets policy minimum
- ✅ Read order back to customer

### Speed
- ✅ Have product codes handy
- ✅ Use keyboard shortcuts
- ✅ Save frequently-ordered items as favorites
- ✅ Use templates for common order types
- ✅ Keep customer database updated

### Customer Service
- ✅ Explain all charges clearly
- ✅ Set realistic delivery expectations
- ✅ Provide order number to customer
- ✅ Confirm contact information correct
- ✅ Thank customer for their order

### Documentation
- ✅ Always print customer copy
- ✅ Customer signs acknowledgment
- ✅ File orders systematically
- ✅ Attach deposit receipts
- ✅ Note any special arrangements

---

## Quick Reference: Order Types

| Order Type | Deposit | Delivery Timing | Use When |
|------------|---------|-----------------|----------|
| **Standard Sale** | 30-50% | Scheduled (1-7 days) | Most common scenario |
| **Cash Sale** | 100% | Immediate | Walk-in retail sales |
| **Credit Sale** | 0% | Scheduled | Approved business customers |
| **Instalment Sale** | Varies | Scheduled | Finance partner involved |
| **Custom Order** | 50-100% | Extended | Made-to-order products |
| **Drop Ship** | 30-50% | Per supplier | Direct supplier delivery |

---

## Related Documentation

- [Sales Overview](sales-overview) - Daily sales operations guide
- [Delivery Order Processing](delivery-order-processing) - Next steps after sales order
- [Trip Listing Management](trip-listing-management) - Scheduling deliveries
- [Sales Payment Collection](sales-payment-collection) - Payment processing details

### Workflow Guides
- [Standard Sales Workflow](../../guides/sales-guides/standard-sales-workflow) - Complete process
- [Credit Sales Workflow](../../guides/sales-guides/credit-sales-workflow) - Credit customer process
- [Cash Sales Workflow](../../guides/sales-guides/cash-sales-workflow) - Immediate sales
- [Instalment Sales Workflow](../../guides/sales-guides/instalment-sales-workflow) - Financing process

---

{{< callout type="tip" >}}
**Practice Makes Perfect**: Create sales orders regularly to build speed and accuracy. Most experienced sales staff can complete standard orders in under 5 minutes.
{{< /callout >}}

---

*Accurate sales order creation is the foundation of smooth operations. Take time to get it right, and the rest of the process flows naturally.*
