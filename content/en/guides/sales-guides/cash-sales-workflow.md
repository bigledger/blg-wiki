---
title: "Cash Sales Workflow"
description: "Quick walk-in cash sales with immediate payment and delivery"
weight: 30
---

The Cash Sales Workflow is designed for walk-in customers who want immediate purchase and delivery with full payment. This streamlined process minimizes documentation while maintaining necessary controls for cash handling and inventory tracking.

## Workflow Overview

```
Customer Walk-In → Product Selection → Cash Payment →
Invoice Generation → Stock Picking → Immediate Handover → Cash Reconciliation
```

{{< callout type="info" >}}
**Process Duration**: Typically 15-30 minutes from payment to delivery. Ideal for retail environments and quick transactions.
{{< /callout >}}

## When to Use This Workflow

Use Cash Sales Workflow when:
- **Walk-in customers** wanting immediate purchase
- **Full payment** collected before delivery
- **Immediate delivery** (customer takes goods now)
- **No credit required** (cash, card, or immediate bank transfer)
- **Retail counter sales**
- **Small to medium value transactions**
- **Stock available immediately**

{{< callout type="warning" >}}
**Not Suitable For**:
- Scheduled deliveries (use Standard Sales)
- Credit terms customers (use Credit Sales)
- Large items requiring delivery vehicle
- Special orders or back-orders
{{< /callout >}}

## Process Steps

### Step 1: Customer Inquiry and Product Selection

**Responsible**: Sales Counter Staff

1. **Greet Customer**:
   - Professional welcome
   - Understand customer needs
   - Provide product information

2. **Product Selection**:
   - Show available products
   - Check stock availability in system
   - Verify serial numbers for specific items
   - Explain features, warranty, and pricing

3. **Quick Customer Registration** (if new):
   - Name and contact number (minimum)
   - Full details can be added later if needed
   - Quick profile creation in system

---

### Step 2: Generate Invoice and Collect Payment

**Responsible**: Sales Counter Staff

#### Create Sales Invoice:

1. **Navigate to Sales Module** → **Quick Sales** or **Cash Sales**
2. **Select/Create Customer**:
   - Existing customer: Search and select
   - New customer: Create quick profile (name, phone minimum)

3. **Add Items**:
   - Scan barcode or search product code
   - Enter quantity
   - System auto-populates price
   - Apply any applicable discounts
   - Verify tax calculation

4. **Review Invoice**:
   - Subtotal
   - Discounts
   - Tax
   - **Grand Total**

5. **Generate Invoice**:
   - Click **Generate Invoice**
   - System assigns invoice number
   - Print invoice (2 copies)

#### Collect Payment:

6. **Request Payment**:
   - Clearly state total amount: "$___"
   - Accept payment method:
     - **Cash**
     - **Credit/Debit Card**
     - **Bank Transfer** (show QR or account details)
     - **E-wallet** (if supported)

7. **Process Payment**:

   **Cash Payment**:
   - Count cash with customer present
   - Verify denominations
   - Give change if needed
   - Place cash in register immediately
   - Mark invoice "PAID - CASH"

   **Card Payment**:
   - Process through POS terminal
   - Customer enters PIN
   - Wait for approval
   - Print card receipt
   - Customer signs if required
   - Attach card slip to invoice
   - Mark invoice "PAID - CARD"

   **Bank Transfer**:
   - Show QR code or account details
   - Customer transfers immediately
   - Verify transfer confirmation on customer's phone
   - Take photo of transfer confirmation
   - Mark invoice "PAID - TRANSFER"
   - Note: Funds may take time to reflect in account

8. **Issue Receipt**:
   - Stamp or mark invoice "PAID"
   - Customer signs invoice copy
   - Give customer their copy
   - Keep office copy

9. **Record Payment in System**:
   - Click **Record Payment** on invoice
   - Enter payment method and amount
   - Attach payment proof (card slip photo, transfer confirmation)
   - Mark as PAID
   - Invoice status: "Paid and Ready for Pickup"

{{< callout type="tip" >}}
**Fast Checkout**: For regular retail sales, consider using a POS system integrated with BigLedger for even faster processing.
{{< /callout >}}

---

### Step 3: Stock Picking and Verification

**Responsible**: Sales Counter Staff or Warehouse Helper

1. **Print Picking List** (if not already printed):
   - Can use invoice as picking list
   - Shows items, quantities, and serial numbers

2. **Pick Items**:
   - Locate items in warehouse/showroom
   - For serialized items: Pick specific serial numbers
   - Verify item condition
   - Check all accessories included

3. **Record Serial Numbers**:
   - Note serial numbers on invoice
   - Enter serial numbers in system:
     - Open invoice
     - Enter serial numbers for each item
     - System marks serial numbers as sold

4. **Quality Check**:
   - Inspect items for damage
   - Test functionality (if possible)
   - Ensure packaging intact
   - Verify warranty cards included

5. **Prepare for Handover**:
   - Pack items if needed
   - Add protective packaging
   - Include all accessories
   - Add warranty cards and manuals
   - Prepare shopping bag/box

---

### Step 4: Handover to Customer

**Responsible**: Sales Counter Staff

1. **Present Items to Customer**:
   - Show each item
   - Verify with invoice
   - Confirm serial numbers (read out)
   - Customer inspects items

2. **Customer Acceptance**:
   - Customer confirms:
     - Correct products
     - Quantities correct
     - Condition acceptable
     - All accessories present
   - Customer signs invoice/delivery note

3. **Provide Documentation**:
   - Customer receives:
     - Paid invoice (customer copy)
     - Warranty cards
     - Product manuals
     - Payment receipt
     - Company contact information

4. **Explain Warranty and Returns**:
   - Warranty period and terms
   - Return/exchange policy
   - Service contact information
   - Keep receipt for warranty claims

5. **Thank Customer**:
   - Professional farewell
   - Invite return visits
   - Provide company contact for questions

{{< callout type="info" >}}
**Customer Satisfaction**: Even for quick cash sales, professional service and proper documentation build customer loyalty and encourage repeat business.
{{< /callout >}}

---

### Step 5: End-of-Day Cash Reconciliation

**Responsible**: Sales Counter Staff & Admin

#### Cash Register Reconciliation:

1. **Count Cash Register**:
   - At end of shift or end of day
   - Count all cash in register:
     - Sort by denomination
     - Count each denomination
     - Calculate total

2. **Generate Sales Summary Report**:
   - From BigLedger system
   - Daily Cash Sales Report
   - Lists all cash transactions:
     - Invoice numbers
     - Amounts
     - Payment methods
   - Calculate totals by payment method:
     - Total Cash: $_____
     - Total Card: $_____
     - Total Transfer: $_____
     - **Grand Total Sales: $_____**

3. **Reconcile Cash**:
   - **Expected Cash** = Opening Float + Cash Sales - Cash Withdrawals
   - **Actual Cash** = Physical count
   - **Difference** = Actual - Expected
   - If difference:
     - Recount carefully
     - Check for unrecorded sales
     - Check for incorrect change given
     - Investigate discrepancy
     - Document variance

4. **Prepare Bank Deposit**:
   - Remove excess cash (keep float amount)
   - Prepare bank deposit slip
   - List total amount
   - Place in bank deposit bag
   - Secure properly

5. **Verify Card Sales**:
   - Total card sales in system
   - Match with card terminal batch report
   - Print card terminal settlement report
   - Verify amounts match
   - File card receipts

6. **Verify Bank Transfers**:
   - List all transfer payments received
   - Check bank account online
   - Match transfers with invoices
   - Flag any transfers not yet received
   - Follow up on pending transfers

7. **Complete Reconciliation Form**:
   - Date
   - Staff member name
   - Opening float: $_____
   - Cash sales: $_____
   - Cash count: $_____
   - Over/Short: $_____
   - Card sales: $_____
   - Transfer sales: $_____
   - Grand total: $_____
   - Staff signature
   - Supervisor verification signature

8. **Handover to Accounts**:
   - Cash deposit bag
   - Card receipts batch
   - Transfer confirmation printouts
   - Daily sales summary report
   - Reconciliation form
   - Any variance explanations

{{< callout type="warning" >}}
**Cash Control**: Strict cash handling procedures prevent loss and fraud. Always reconcile daily. Never leave discrepancies unresolved.
{{< /callout >}}

---

## Best Practices for Cash Sales

### Customer Service:
- **Speed**: Process transactions quickly but accurately
- **Friendliness**: Professional and courteous service
- **Accuracy**: Double-check items and amounts
- **Information**: Explain products, warranties, and policies clearly

### Cash Handling:
- **Immediate Registration**: Enter sales immediately in system
- **Secure Cash**: Place cash in register drawer immediately after counting
- **Count Openly**: Count cash with customer present to avoid disputes
- **Check Large Bills**: Verify authenticity of large denominations
- **Limited Float**: Keep only necessary float in register, deposit excess regularly
- **Two-Person Count**: Large cash counts should have witness

### Inventory Control:
- **Real-Time Updates**: System should update inventory immediately
- **Serial Number Accuracy**: Record serial numbers correctly for warranty
- **Stock Verification**: Regularly verify system vs physical stock
- **Loss Prevention**: Monitor high-value items carefully

### Documentation:
- **Print Everything**: Always print invoice even for small sales
- **Customer Copy**: Customer must receive paid invoice
- **File Copies**: Organize and file office copies daily
- **Digital Backup**: Ensure system has all transaction records

---

## Common Issues and Solutions

### Issue 1: Customer Wants to Return Later

**Scenario**: Customer paid but wants to collect items later.

**Solution**:
- Mark invoice "Paid - Awaiting Pickup"
- Set aside items with customer name and invoice number
- Set pickup reminder (call customer after 2-3 days if not collected)
- Maximum holding period: 7-14 days (your policy)
- After holding period: Contact customer, process refund if not collected

### Issue 2: Card Payment Declined

**Scenario**: Customer's card declined but wants to purchase.

**Solution**:
- Try different card if customer has alternative
- Suggest ATM withdrawal nearby
- Accept bank transfer (verify on phone)
- Can hold items for 1 hour while customer arranges payment
- Don't release items until payment confirmed

### Issue 3: Stock Shortage Discovered After Payment

**Scenario**: Payment collected but stock not available when picking.

**Solution**:
- Apologize sincerely to customer
- Check alternative locations/branches
- Options for customer:
  - Refund immediately
  - Wait for restock (give specific date)
  - Accept alternative product
  - Partial refund and take available items
- Process refund immediately if customer chooses that option
- Give compensation (discount voucher) for inconvenience

### Issue 4: Cash Register Short

**Scenario**: Cash count less than expected.

**Investigation**:
- Recount carefully (may have miscount)
- Check for unscanned items (theft)
- Review CCTV if available
- Check all transaction receipts
- Verify change given was correct
- Document variance with explanation
- Staff may be responsible for shortage (depending on policy)

### Issue 5: Customer Disputes Price

**Scenario**: Customer claims different price was displayed.

**Solution**:
- Check price tag on item
- Verify system pricing
- Check for any promotional pricing active
- If customer is right: Honor displayed price (legal requirement in many places)
- If system is right: Explain politely, show evidence
- Escalate to manager if needed
- Customer can choose to proceed or not purchase

---

## Cash Sales vs. Standard Sales

| Aspect | Cash Sales | Standard Sales |
|--------|-----------|----------------|
| **Payment Timing** | Before delivery | Deposit now, balance later |
| **Customer Type** | Walk-in, any customer | Scheduled customers |
| **Delivery** | Immediate | Scheduled |
| **Process Time** | 15-30 minutes | 1-7 days |
| **Documentation** | Minimal | Comprehensive |
| **Payment Collection** | 100% upfront | Partial then balance |
| **Deposit** | N/A (full payment) | Required |
| **Stock Picking** | Immediate | Scheduled |
| **Credit Check** | Not needed | Not applicable |
| **Trip Listing** | Not used | Essential |

---

## Success Metrics

**Operational Efficiency**:
- Average transaction time: Target < 10 minutes
- Customer wait time: Target < 5 minutes
- Daily reconciliation completion: Target 100%

**Accuracy**:
- Cash variance rate: Target < 0.1%
- Pricing errors: Target < 0.5%
- Stock discrepancies: Target < 1%

**Customer Satisfaction**:
- Repeat customer rate: Target > 30%
- Customer complaints: Target < 1%
- Fast service perception: Target > 90% satisfaction

---

## Related Workflows

- **[Standard Sales Workflow](standard-sales-workflow)** - For scheduled deliveries
- **[Returns & Exchanges](returns-exchanges-workflow)** - Handling cash sale returns
- **[Sales Payment Collection](/user-guide/daily-tasks/sales-payment-collection)** - Payment processing details

---

{{< callout type="tip" >}}
**Quick Service Tip**: Pre-configure common products as favorites in your POS for one-click selection. This dramatically speeds up checkout for popular items.
{{< /callout >}}

---

*Cash sales are the backbone of retail operations. Fast, accurate, and friendly service combined with proper cash controls creates successful retail operations.*
