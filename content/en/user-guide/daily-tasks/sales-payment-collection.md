---
title: "Sales Payment Collection"
description: "Comprehensive guide to collecting, recording, and reconciling sales payments"
weight: 34
---

Payment collection is a critical part of the sales cycle. This guide covers all payment methods, collection procedures, reconciliation processes, and best practices for handling customer payments safely and accurately.

## Payment Collection Points

Payments are collected at different stages depending on the sales workflow:

| Workflow Type | Deposit Collection | Balance Collection | Payment Terms |
|---------------|-------------------|-------------------|---------------|
| **Standard Sales** | At order | On delivery | Deposit + Balance |
| **Credit Sales** | None | After delivery | Net 30/60/90 days |
| **Cash Sales** | Full payment | None | 100% upfront |
| **Instalment Sales** | Varies | Via finance company | Monthly to financier |

---

## Payment Methods

### 1. Cash Payment

**Acceptance Procedure**:

1. **Count Cash with Customer Present**:
   - Count openly
   - State amount as you count
   - Recount if large amount
   - Check for counterfeit (large denominations)

2. **Provide Change** (if needed):
   - Calculate change required
   - Count change back to customer
   - Verify customer agrees with change

3. **Issue Receipt**:
   - Printed receipt from system
   - Or manual receipt if system down
   - Receipt shows:
     - Date and time
     - Amount received
     - Payment for (SO/Invoice number)
     - Receipt number
     - Staff name

4. **Secure Cash**:
   - Place in register/cash box immediately
   - Lock if leaving area
   - Never leave cash unattended

5. **Record in System**:
   - Enter payment immediately
   - Payment method: Cash
   - Amount
   - Reference: Receipt number
   - Mark invoice/order as paid

**Cash Handling Safety**:
- ✅ Count in view of security cameras
- ✅ Two staff for large amounts
- ✅ Regular bank deposits (don't accumulate)
- ✅ Limited float in register
- ✅ Vary deposit times/routes

{{< callout type="warning" >}}
**Large Cash Amounts**: For payments over $5,000 or your policy limit, encourage bank transfer instead. Reduces security risk and counting errors.
{{< /callout >}}

### 2. Credit/Debit Card Payment

**Card Payment Process**:

1. **Enter Amount** in POS terminal
2. **Select Payment Type**: Sale/Payment
3. **Customer Inserts/Taps Card**
4. **Customer Enters PIN** (if required)
5. **Wait for Approval**
6. **Print Receipts**:
   - Merchant copy (attach to invoice)
   - Customer copy (give to customer)
7. **Customer Signs** (if required by card type)
8. **Record in System**:
   - Payment method: Card
   - Amount
   - Card type (Visa/Mastercard/etc.)
   - Last 4 digits of card
   - Approval code
   - Attach card receipt image

**If Card Declined**:
- Inform customer politely
- Suggest alternatives:
  - Try different card
  - Bank transfer
  - Cash from ATM
  - Split payment across multiple cards
- Don't assume reason (insufficient funds, limit, technical issue)

**Card Payment Best Practices**:
- ✅ Verify amount on terminal matches invoice
- ✅ Keep customer copy and merchant copy separate
- ✅ Secure merchant copies for reconciliation
- ✅ Settle terminal batch daily
- ✅ Reconcile card payments with bank deposits

### 3. Bank Transfer / Online Transfer

**Providing Transfer Details**:

1. **Show Payment Instructions**:
   - Company bank name
   - Account number
   - Account name
   - Bank code/SWIFT (if needed)
   - Reference: Invoice/SO number

2. **QR Code** (if available):
   - Display QR code
   - Customer scans with banking app
   - Pre-fills amount and reference

3. **Customer Transfers**:
   - Customer uses online banking
   - Mobile banking app
   - ATM transfer
   - Over-the-counter bank transfer

**Verifying Transfer**:

**Immediate Verification** (Same Day):
1. Customer shows transfer confirmation screen/receipt
2. Check details:
   - Correct account number
   - Correct amount
   - Transaction reference number
   - Date and time
3. Take photo of confirmation
4. Mark as "Pending Verification" in system

**Actual Verification** (Check Bank Account):
1. Log into bank account online
2. Verify funds actually received
3. Match by:
   - Amount
   - Date
   - Customer name
   - Reference number
4. Once confirmed, record payment fully in system

**If Transfer Not Received**:
- Check if customer transferred to correct account
- Verify transaction reference with bank
- May take 1-2 hours for instant transfer
- Up to 1 business day for inter-bank transfer
- Contact customer if not received within expected time

{{< callout type="info" >}}
**Don't Release Goods**: For transfers, verify funds actually in your account before releasing goods. Screenshot confirmation is not sufficient - confirm in your bank account.
{{< /callout >}}

### 4. Cheque Payment

**Accepting Cheques**:

1. **Verify Cheque Details**:
   - **Payee**: Correct company name
   - **Amount**: Matches in numbers AND words
   - **Date**: Current date (not post-dated too far)
   - **Signature**: Signed by account holder
   - **Bank Details**: Bank name, account number visible
   - **No alterations**: No corrections or overwriting

2. **Record on Cheque**:
   - Write customer name on back
   - Write invoice/SO number on back
   - Your company stamp (back)

3. **Take Photo**:
   - Front of cheque
   - Back with endorsement
   - Store digitally with payment record

4. **Issue Receipt**:
   - Receipt showing cheque payment
   - Cheque number
   - Bank name
   - Amount

5. **Record as "Cheque Pending"**:
   - In system, mark as cheque payment
   - Amount
   - Cheque number
   - Bank name
   - Estimated clearance date (3-7 days)
   - Status: Pending clearance

6. **Deposit Cheque Promptly**:
   - Deposit within 1-2 business days
   - Get deposit slip
   - Record deposit date in system

7. **Confirm Clearance**:
   - After 3-7 days, check bank account
   - Verify cheque cleared
   - Update system: Payment confirmed
   - If bounced: Contact customer immediately

**Cheque Risks**:
- Cheque may bounce (insufficient funds)
- Takes days to clear
- Customer can stop payment
- Lost cheque complications

**Minimize Risk**:
- Only accept from known customers
- Check ID matches account
- For large amounts, ask for bank draft or transfer instead
- Consider charging fee for bounced cheques

### 5. Financing / Instalment Agreements

**For AEON, JCL, etc.**:

1. **Customer Signs Finance Agreement**:
   - All fields completed
   - Signatures and dates
   - Payment terms clear

2. **No Immediate Payment to You**:
   - Customer doesn't pay you directly
   - Finance company pays you (14-30 days later)
   - Customer pays finance company in instalments

3. **Record in System**:
   - Payment method: Instalment - [Finance Partner]
   - Finance agreement number
   - Amount financed
   - Status: Pending finance company payment

4. **Submit Agreement to Finance Company**:
   - With all required documents
   - Track submission
   - Follow up on payment

5. **Receive Payment from Finance Company**:
   - Usually 14-30 days after submission
   - Verify amount received
   - Record in system as final payment

See [Instalment Sales Workflow](../../guides/sales-guides/instalment-sales-workflow) for complete process.

---

## Recording Payments in System

### Step-by-Step: Recording Payment

1. **Navigate to Payment Section**:
   - From Sales Order or Invoice
   - Click **Record Payment** or **Add Payment**

2. **Enter Payment Details**:
   - **Payment Date**: Date received (not date recorded)
   - **Amount**: Exact amount received
   - **Payment Method**: Select from dropdown
   - **Reference Number**:
     - Receipt number (cash)
     - Transaction reference (transfer)
     - Approval code (card)
     - Cheque number (cheque)
   - **Bank Account**: Which account received (if multiple)
   - **Notes**: Any relevant information

3. **Attach Proof**:
   - Upload photo of:
     - Transfer slip/confirmation
     - Card receipt
     - Cheque (front and back)
     - Cash receipt

4. **Save Payment**:
   - System updates automatically:
     - Invoice balance reduced
     - Customer account updated
     - Accounts receivable adjusted
     - Payment history recorded

5. **Verify Update**:
   - Check invoice shows correct balance
   - If fully paid, status: "Paid"
   - If partial, shows remaining balance

---

## Payment Reconciliation

### Daily Cash Reconciliation

**End of Each Day** (CRITICAL):

1. **Count Cash in Register**:
   - Remove cash from register/safe
   - Sort by denomination
   - Count each denomination
   - Calculate total

2. **Generate Sales Report**:
   - From BigLedger system
   - Daily Cash Sales Report
   - Shows all cash transactions today
   - Calculate expected cash total

3. **Compare Actual vs Expected**:
   - **Expected**: Opening float + Cash sales - Cash withdrawals
   - **Actual**: Physical count
   - **Variance**: Actual - Expected

4. **If Variance**:
   - Recount carefully
   - Check for missed transactions
   - Review refunds or returns
   - Check if change given correctly
   - Document variance:
     - Over: +$10 (surplus)
     - Short: -$15 (shortage)

5. **Complete Reconciliation Form**:
   - Date
   - Staff member
   - Opening float: $_____
   - Total cash sales: $_____
   - Expected total: $_____
   - Actual count: $_____
   - Variance: +/- $_____
   - Explanation (if variance)
   - Signatures

6. **Prepare Bank Deposit**:
   - Keep float amount in register
   - Deposit rest
   - Complete deposit slip
   - Secure in deposit bag

**Acceptable Variance**: Most companies accept ±$5-10 as normal. Larger or frequent variances need investigation.

### Card Payment Reconciliation

**Daily**:

1. **Settle Card Terminal**:
   - Print batch settlement report
   - Shows all card transactions for day
   - Total amount

2. **Match with System**:
   - System card sales report
   - Compare total with terminal batch
   - Should match exactly

3. **Bank Deposit**:
   - Card payments typically deposit automatically
   - Check bank account next day
   - Verify amount matches settlement

4. **File Receipts**:
   - Keep merchant copies
   - Attach to daily reconciliation
   - Organize by date

### Bank Transfer Reconciliation

**Daily**:

1. **List Expected Transfers**:
   - From system, all transfers recorded today
   - Customer names and amounts

2. **Check Bank Account**:
   - Log into online banking
   - Review incoming transfers
   - Match each transfer to customer/invoice

3. **Update System**:
   - Transfers shown as "pending" → "Confirmed"
   - Verify amount matches
   - Record actual deposit date

4. **Flag Issues**:
   - Transfers not received
   - Wrong amounts
   - Unidentified deposits
   - Follow up with customers

### Cheque Reconciliation

**Weekly**:

1. **Track Cheques**:
   - List all cheques deposited
   - Deposit dates
   - Expected clearance dates

2. **Check Clearance**:
   - After 7 days, check bank account
   - Verify each cheque cleared
   - Update system

3. **Handle Bounced Cheques**:
   - Contact customer immediately
   - Request alternative payment
   - May charge bounced cheque fee
   - Update invoice to "Unpaid"
   - May require cash/transfer for future orders

---

## Payment Collection Best Practices

### Security

✅ **Cash Handling**:
- Count openly in view of cameras
- Two staff for amounts > $5,000
- Regular bank deposits
- Vary timing and routes
- Secure storage

✅ **Card Payments**:
- Don't store card numbers
- Secure card receipts
- Protect POS terminal
- Keep software updated

✅ **Bank Details**:
- Verify account details periodically
- Protect from phishing
- Use official banking apps only

### Accuracy

✅ **Verification**:
- Count cash carefully
- Verify transfer confirmations
- Check card approvals
- Examine cheques thoroughly

✅ **Documentation**:
- Issue receipts for every payment
- Attach proof to records
- Photo evidence
- Clear references

✅ **Recording**:
- Record payments immediately
- Don't batch at end of day
- Double-check amounts
- Verify customer/invoice correct

### Customer Service

✅ **Clear Communication**:
- State amount due clearly
- Explain payment options
- Provide clear payment instructions
- Confirm receipt of payment

✅ **Flexibility**:
- Accept multiple payment methods
- Split payments if needed (e.g., $500 cash + $500 card)
- Reasonable accommodation

✅ **Professional**:
- Count/verify discreetly
- Don't assume anything
- Polite even if payment issues
- Clear receipts and documentation

---

## Common Payment Issues

### Issue: Cash Shortage

**Scenario**: Cash count less than expected.

**Steps**:
1. Recount carefully
2. Check all transactions recorded
3. Verify change given correctly
4. Review refunds processed today
5. Check for dropped bills around area
6. Document shortage and report
7. Staff may be responsible (policy dependent)

### Issue: Transfer Shows Wrong Amount

**Scenario**: Customer transferred $500 but invoice was $550.

**Resolution**:
1. Contact customer immediately
2. Show invoice with correct amount
3. Customer transfers additional $50
4. Or apply as partial payment and follow up for balance

### Issue: Card Declined Multiple Times

**Scenario**: Customer's card keeps declining.

**Options**:
- Different card
- Cash from ATM
- Bank transfer (show QR code)
- Split payment across cards
- Come back with payment

**Don't**:
- Assume reason
- Embarrass customer
- Release goods without payment

### Issue: Cheque Bounced

**Scenario**: Customer's cheque bounced.

**Actions**:
1. Contact customer immediately
2. Inform of bounced cheque
3. Request immediate payment by cash/transfer
4. Add bounced cheque fee (if policy)
5. Update invoice to unpaid
6. May place account on hold
7. No more cheque acceptance from this customer

### Issue: Customer Disputes Amount

**Scenario**: Customer claims they owe less than invoice shows.

**Resolution**:
1. Don't argue
2. Show original signed sales order
3. Show itemized invoice
4. Verify deposit deducted correctly
5. Check for any discounts or adjustments
6. If customer right: Adjust and apologize
7. If invoice right: Explain clearly with evidence
8. Escalate to manager if unresolved
9. Never release goods until resolved

---

## Partial Payments

### Accepting Partial Payment

**When**:
- Customer financial difficulty
- Order split into multiple deliveries
- Customer requests payment plan

**Process**:
1. Negotiate payment schedule with customer
2. Record initial payment
3. System shows remaining balance
4. Set reminders for next payment
5. Follow up proactively
6. Don't release all goods until full payment (or policy)

**Payment Plan Example**:
- Total due: $2,000
- Deposit: $500 (today)
- Payment 2: $750 (2 weeks)
- Payment 3: $750 (4 weeks)
- Get written agreement
- Track schedule carefully

---

## Related Documentation

- [Sales Overview](sales-overview) - Daily sales operations
- [Creating Sales Orders](creating-sales-order) - Order entry with deposits
- [Delivery Order Processing](delivery-order-processing) - Balance collection on delivery

### Workflow Guides
- [Standard Sales Workflow](../../guides/sales-guides/standard-sales-workflow) - Complete payment process
- [Credit Sales Workflow](../../guides/sales-guides/credit-sales-workflow) - Credit terms collection
- [Cash Sales Workflow](../../guides/sales-guides/cash-sales-workflow) - Immediate payment
- [Instalment Sales Workflow](../../guides/sales-guides/instalment-sales-workflow) - Financing payments

---

{{< callout type="warning" >}}
**Daily Reconciliation is NON-NEGOTIABLE**: Never leave cash reconciliation for tomorrow. Discrepancies become impossible to resolve with time. Reconcile every single day without exception.
{{< /callout >}}

---

*Accurate payment collection and reconciliation protects company cash flow, prevents fraud, and maintains financial integrity. Handle every payment with care and professionalism.*
