---
title: "Credit Sales Workflow"
description: "Sales process for credit-approved customers with payment terms, no upfront deposit required"
weight: 20
---

The Credit Sales Workflow is designed for established business customers who have been approved for credit terms. This streamlined process eliminates deposit collection, allowing faster order processing while maintaining proper controls through credit limits and payment terms.

## Workflow Overview

```
Customer Credit Verification → Sales Order Creation →
Delivery Scheduling → Stock Preparation → Invoice Generation →
Delivery Execution → Invoice Submission → Payment Collection (Later)
```

{{< callout type="info" >}}
**Key Difference**: No deposit required. Customer pays according to agreed credit terms (e.g., Net 30, Net 60 days) after delivery.
{{< /callout >}}

## When to Use This Workflow

Use Credit Sales Workflow when:
- Customer has **pre-approved credit terms**
- **Credit limit is sufficient** for the order value
- Customer has **good payment history**
- Business relationship is established and trusted
- **B2B transactions** with corporate customers
- Regular repeat customers with volume purchases

{{< callout type="warning" >}}
**Do NOT Use For**:
- New customers without credit approval
- Customers exceeding credit limits
- Customers with overdue payments
- Individual walk-in consumers
- High-risk transactions
{{< /callout >}}

## Prerequisites

Before processing credit sales, ensure:

### 1. Customer Credit Approval

**Customer Must Have**:
- Completed credit application form
- Credit approval from management/credit committee
- **Assigned credit limit** (e.g., $10,000, $50,000)
- Defined **payment terms** (Net 15, Net 30, Net 60, Net 90)
- Signed credit terms agreement
- Valid trade references verified
- Financial documents reviewed (if required)

### 2. Credit Status Check

**Before Every Credit Sale, Verify**:
- [ ] Customer credit limit not exceeded
- [ ] No overdue invoices (or within acceptable tolerance)
- [ ] Account status is "Active" (not "On Hold" or "Suspended")
- [ ] Credit terms are current (not expired)
- [ ] Recent payment behavior acceptable

### 3. System Configuration

**Customer Profile Must Include**:
- Credit limit amount
- Payment terms (number of days)
- Credit status (Approved/On Hold/Suspended)
- Credit approval date and approver
- Outstanding balance
- Available credit = Credit Limit - Outstanding Balance

{{< callout type="tip" >}}
**Credit Management**: Regularly review customer credit status. Customers with excellent payment records can have limits increased; those with payment issues should have limits reduced or credit suspended.
{{< /callout >}}

---

## Detailed Process Steps

### Step 1: Verify Customer Credit Status

**Responsible**: Sales Admin

**Objective**: Confirm customer is eligible for credit purchase

#### Credit Verification Process:

1. **Open Customer Profile**:
   - Navigate to **Sales & CRM** → **Customer Maintenance**
   - Search and open customer record

2. **Review Credit Information**:
   - **Credit Limit**: $_____
   - **Payment Terms**: Net ___ Days
   - **Outstanding Balance**: $_____
   - **Available Credit**: $_____ (Limit - Outstanding)
   - **Credit Status**: Active / On Hold / Suspended
   - **Overdue Invoices**: Check aging report

3. **Check This Order Against Available Credit**:

   **Calculate**:
   - Current Order Value: $_____
   - Current Outstanding Balance: $_____
   - Total if order approved: $_____ (Order + Outstanding)
   - Credit Limit: $_____
   - **Will this exceed limit?** Yes / No

4. **Decision Matrix**:

   | Situation | Action |
   |-----------|--------|
   | Within credit limit + Good payment history | **Proceed with order** |
   | Within credit limit + Some overdue items | **Escalate to manager** for approval |
   | Exceeds credit limit slightly | **Request payment** on old invoices first, or **manager approval** |
   | Exceeds credit limit significantly | **Require deposit** or **decline credit terms** |
   | Account on hold/suspended | **Cannot proceed** with credit, offer cash terms instead |

5. **Document Decision**:
   - If approved: Note in sales order
   - If escalated: Get written/email approval from manager
   - If declined: Explain to customer politely, offer alternatives

{{< callout type="warning" >}}
**Never Skip Credit Check**: Processing orders that exceed credit limits creates collection problems and bad debt risk. Always verify before proceeding.
{{< /callout >}}

#### Alternative Solutions if Credit Limit Exceeded:

**Option A: Partial Payment**
- Customer pays down outstanding balance
- Frees up available credit
- Then process new order on credit

**Option B: Deposit for This Order**
- Customer pays deposit for current order
- Remainder on credit terms
- Keeps within overall credit limit

**Option C: Cash Terms for This Order**
- Full payment before or on delivery
- Preserves credit line for future orders
- Common for unusually large orders

**Option D: Credit Limit Increase**
- Customer requests limit increase
- Management reviews and approves
- Update credit limit in system
- Then process order

{{< callout type="tip" >}}
**Professional Communication**: When discussing credit limits with customers, be courteous but firm. Frame it as "company policy" rather than doubting the customer personally.
{{< /callout >}}

---

### Step 2: Create Sales Order (Without Deposit)

**Responsible**: Sales Admin

**Objective**: Generate sales order with credit terms applied

#### Sales Order Creation:

1. **Navigate to Sales Module**:
   - Click **Create Sales Order**
   - Select customer (system auto-loads credit terms)

2. **Verify Auto-Populated Credit Terms**:
   - **Payment Terms**: Should show "Net 30" (or customer's specific terms)
   - **Due Date**: System calculates automatically (Order Date + Terms)
   - **Credit Limit Warning**: System may show if approaching limit

3. **Add Items to Order**:
   - Select products/services
   - Enter quantities
   - Verify pricing (may have special contract pricing)
   - Apply any negotiated discounts
   - Confirm tax calculations

4. **Review Order Totals**:
   - Subtotal
   - Discounts
   - Tax
   - **Grand Total**
   - **Payment Terms**: Net ___ Days
   - **Due Date**: [Specific Date]

5. **Important Differences from Standard Sales**:
   - **No deposit section** (or deposit = $0)
   - **Balance due = Grand Total** (entire amount)
   - **Payment due date shown prominently**
   - System marks as "Credit Sale"

6. **Add Business Details**:
   - **Purchase Order Number** (if customer provides)
   - **Reference Number** (customer's internal reference)
   - **Delivery Instructions**
   - **Billing Address** (may differ from delivery address)
   - **Contact Person** for delivery

7. **Internal Notes**:
   - Credit approval reference
   - Any special payment arrangements
   - Customer relationship notes
   - Previous order history reference

#### Sales Order Approval:

8. **Credit Sales May Require Approval**:
   - Orders above certain value (e.g., $5,000)
   - New credit customers (first few orders)
   - Customers approaching credit limit
   - Special pricing or terms

9. **Submit for Approval** (if required):
   - Click **Submit for Approval**
   - System routes to manager
   - Manager reviews and approves/rejects
   - Sales admin notified of decision

10. **Confirm Sales Order**:
    - Once approved, **Confirm** the order
    - System generates **Sales Order Number**
    - Order status: "Confirmed - Credit Terms"

#### Documentation:

11. **Print Sales Order** (3 copies):
    - Customer copy (signed by customer)
    - Warehouse copy (for picking)
    - Office file copy

12. **Customer Acknowledgment**:
    - Customer reviews order
    - Customer signs acknowledging:
      - Items ordered
      - Pricing
      - Payment terms (Due Date)
      - Delivery requirements
    - Customer receives their signed copy

{{< callout type="info" >}}
**Purchase Order Matching**: Many corporate customers issue Purchase Orders. Always record the PO number in your sales order and ensure details match their PO to avoid payment disputes.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] Customer credit status verified
- [ ] Credit limit not exceeded
- [ ] Payment terms correct (Net ___ Days)
- [ ] Due date calculated correctly
- [ ] Customer PO number recorded (if applicable)
- [ ] Pricing and discounts approved
- [ ] Delivery details complete
- [ ] Manager approval obtained (if required)
- [ ] Sales order confirmed in system
- [ ] Customer signed acknowledgment
- [ ] No deposit collected (as expected for credit sale)

---

### Step 3-8: Standard Processing

**The following steps are identical to Standard Sales Workflow**:

- **Step 3**: Confirm Delivery Date and Add to Trip Listing
- **Step 4**: Print Daily Sales Orders and Trip Listing
- **Step 5**: Warehouse Stock Preparation (Serial Numbers)
- **Step 6**: Admin Converts Stock in System
- **Step 7**: Print Invoice and Delivery Order
- **Step 8**: Load Items for Delivery

{{< callout type="info" >}}
**Reference Standard Workflow**: For detailed instructions on these steps, refer to [Standard Sales Workflow Steps 3-8](standard-sales-workflow#step-3-confirm-deliveryinstallation-date-and-add-to-trip-listing).
{{< /callout >}}

**Key Differences to Note**:

1. **Invoice Shows Credit Terms**:
   - Payment Terms: Net 30 Days
   - Invoice Date: [Date]
   - **Due Date: [Invoice Date + 30 Days]**
   - Amount Due: [Full Amount]
   - No deposit deducted

2. **Delivery Order Includes Credit Terms**:
   - Clear note: "Payment Terms: Net 30 Days"
   - Due Date displayed
   - Customer reminded of payment expectations

---

### Step 9: Delivery Execution (No Payment Collection)

**Responsible**: Delivery Driver

**Objective**: Deliver items and obtain signature - NO payment collection at delivery

#### Pre-Delivery:

1. **Review Delivery Documents**:
   - Note that this is a **Credit Sale**
   - **Do NOT collect payment** at delivery
   - Invoice due date shown for customer reference
   - Customer will pay later according to terms

2. **Customer Communication**:
   - Call customer 30 minutes before arrival (standard)
   - Confirm delivery address and contact person

#### Delivery Process:

3. **Deliver and Verify Items**:
   - Unload items with customer present
   - Verify each item against Delivery Order:
     - Product description
     - Quantity
     - Serial numbers
   - Customer inspects items for:
     - Correct products
     - Good condition
     - All accessories included

4. **Handle Any Issues** (same as standard):
   - Damaged items: Document and contact office
   - Wrong items: Contact office, don't leave incorrect items
   - Missing items: Verify and coordinate replacement

5. **Installation** (if applicable):
   - Perform installation as required
   - Test functionality
   - Clean up work area
   - Provide operation instructions

#### Documentation and Signature:

6. **Obtain Customer Signature on Delivery Order**:
   - Customer reviews DO
   - Customer signs confirming:
     - Items received
     - Quantities correct
     - Serial numbers noted
     - Condition acceptable
   - Customer acknowledges credit terms
   - Customer keeps their copy of DO

7. **Provide Invoice to Customer**:
   - Give customer their copy of Invoice
   - Point out key information:
     - Invoice Number
     - Invoice Date
     - **Total Amount Due**: $_____
     - **Payment Terms**: Net 30 Days
     - **Due Date**: [Specific Date]
     - Payment instructions (bank details, etc.)
   - Customer understands payment is expected by due date

8. **Photo Evidence**:
   - Take delivery photos (same as standard workflow)
   - Photo of delivered items
   - Photo of serial number labels
   - Photo showing installation (if applicable)
   - Upload to WhatsApp group/system immediately

{{< callout type="warning" >}}
**DO NOT Collect Payment**: For credit sales, driver should NOT collect any payment at delivery. If customer offers payment, politely explain it should go through accounts department. Provide accounts contact information.
{{< /callout >}}

#### What Driver Should NOT Do:

- ❌ Collect cash payment
- ❌ Accept cheques
- ❌ Process credit card payments
- ❌ Negotiate payment terms
- ❌ Promise payment extensions

#### What Driver SHOULD Do:

- ✅ Deliver items professionally
- ✅ Get customer signature on DO
- ✅ Provide invoice with clear due date
- ✅ Take photo evidence
- ✅ Answer questions about the products
- ✅ Refer payment questions to accounts department

#### If Customer Wants to Pay Immediately:

9. **Customer Insists on Paying Now**:
   - Thank customer for willingness to pay early
   - **Option A** (Preferred): Direct customer to pay through proper channels
     - Bank transfer to company account
     - Online payment portal (if available)
     - Cheque mailed to office
     - Visit office to pay accounts department
   - **Option B**: If company policy allows driver payment collection
     - Accept payment (cash, cheque, card)
     - Issue temporary receipt
     - Mark invoice "Paid at Delivery"
     - Customer signs invoice
     - Process through accounts on return to office

{{< callout type="tip" >}}
**Early Payment Discount**: Some companies offer small discounts (e.g., 2%) for payment within 10 days. If customer pays early, ensure discount is applied according to policy.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] All items delivered as per DO
- [ ] Customer verified items and condition
- [ ] Installation completed (if required)
- [ ] Customer signature obtained on DO
- [ ] Invoice provided to customer with clear due date
- [ ] Photo evidence taken and uploaded
- [ ] Customer understands payment terms
- [ ] No payment collected at delivery (unless special case)
- [ ] Customer has accounts contact information

---

### Step 10: Return Documents to Admin

**Responsible**: Delivery Driver

**Objective**: Hand over signed delivery documents (no payment to hand over)

#### End-of-Day Handover:

1. **Prepare Documents**:
   - Signed Delivery Orders
   - Office copy of Invoices (not paid)
   - Trip listing marked complete
   - Any customer notes

2. **Handover to Admin**:
   - Give all signed DOs
   - Give invoice copies (marked as credit sale)
   - Confirm delivery photos uploaded
   - Report any delivery issues
   - Discuss customer interactions

3. **No Payment Handover**:
   - Since credit sale, no cash/cheques to hand over
   - Exception: If customer paid despite credit terms, hand over payment with clear note

4. **Debrief**:
   - Report successful deliveries
   - Mention any customer feedback
   - Highlight any concerns
   - Confirm all documentation complete

{{< callout type="info" >}}
**Simpler Handover**: Credit sales handover is simpler than standard sales since there's no payment reconciliation needed at this stage. Focus is on confirming delivery completion.
{{< /callout >}}

---

### Step 11: Admin Confirms Delivery in System

**Responsible**: Sales Admin

**Objective**: Update system that delivery completed, invoice is now receivable

#### Delivery Confirmation:

1. **Verify Delivery Documentation**:
   - Signed Delivery Order received
   - Photos uploaded and accessible
   - Customer signature clearly visible
   - Serial numbers match system

2. **Update System Status**:
   - Open Sales Order
   - Change status to **"Delivered"**
   - Confirm Delivery Date (actual date delivered)
   - Attach delivery photos to record
   - Add any delivery notes

3. **Confirm Invoice Status**:
   - Invoice status: **"Issued - Awaiting Payment"**
   - Invoice Due Date: [Confirm correct date]
   - Amount Outstanding: [Full invoice amount]
   - Payment Terms: Net ___ Days

4. **Update Accounts Receivable**:
   - System automatically updates AR:
     - Customer owes full invoice amount
     - Due date recorded
     - Aging starts from invoice date
   - Customer's credit limit:
     - Available credit reduced by invoice amount
     - Will restore when customer pays

5. **Set Payment Follow-Up Reminder**:
   - Set system reminder:
     - First reminder: 7 days before due date
     - Second reminder: 1 day before due date
     - Follow-up: On due date (if not paid)
     - Escalation: 7 days after due date (if still not paid)

{{< callout type="tip" >}}
**Proactive Collection**: Don't wait until due date to follow up. Remind customers 7 days before due date to ensure they're prepared to pay on time.
{{< /callout >}}

---

### Step 12: Submit Invoice to Customer Accounts Department

**Responsible**: Sales Admin or Accounts Receivable Team

**Objective**: Ensure customer's accounts team has invoice for processing

#### Invoice Submission Process:

1. **Prepare Invoice Package**:
   - Original signed invoice
   - Copy of Delivery Order (with customer signature)
   - Copy of Sales Order
   - Copy of customer's Purchase Order (if applicable)
   - Proof of delivery photos (if required)
   - Any supporting documents

2. **Determine Submission Method**:

   **Electronic Submission** (Most Common):
   - Email invoice to customer's accounts department
   - Email subject: "Invoice [Number] - Due [Date] - [Company Name]"
   - Email body:
     - Professional greeting
     - Invoice details summary
     - Payment terms and due date
     - Bank transfer details
     - Contact for questions
   - Attach:
     - Invoice PDF
     - Delivery Order PDF
     - Any required supporting documents

   **Physical Submission**:
   - Mail original invoice to customer billing address
   - Include all supporting documents
   - Consider registered mail for large amounts
   - Keep proof of mailing

   **Portal Upload**:
   - Some large companies have supplier portals
   - Upload invoice and supporting documents
   - Follow their specific requirements
   - Note submission reference number

3. **Invoice Submission Best Practices**:
   - Submit within 24 hours of delivery
   - Address to correct department/person
   - Include all required documents
   - Clear payment instructions
   - Reference customer's PO number
   - Professional communication

4. **Confirm Receipt**:
   - Request confirmation of receipt
   - Note confirmation in system
   - If no confirmation after 2-3 days: Follow up
   - Ensure invoice entered in customer's system

{{< callout type="warning" >}}
**Submission Delays = Payment Delays**: Many payment delays are caused by late invoice submission. Submit invoices immediately after delivery to ensure customer can process payment on time.
{{< /callout >}}

---

### Step 13: Payment Collection Process

**Responsible**: Accounts Receivable Team (with Sales Admin support)

**Objective**: Collect payment according to credit terms

#### Payment Monitoring:

1. **Track Payment Due Dates**:
   - Maintain AR aging report
   - Monitor upcoming due dates
   - Prioritize high-value invoices
   - Track customer payment patterns

2. **Payment Reminder Schedule**:

   **7 Days Before Due Date**:
   - Send friendly reminder email/WhatsApp
   - "Hi [Name], friendly reminder that Invoice [Number] for $[Amount] is due on [Date]. Please let us know if you have any questions."
   - Confirm customer has invoice
   - Verify payment being processed

   **1 Day Before Due Date**:
   - Second reminder
   - "Invoice [Number] for $[Amount] is due tomorrow [Date]. Please confirm payment status."
   - More urgent tone but still professional

   **On Due Date**:
   - Check if payment received
   - If not received: Follow up
   - "Invoice [Number] is due today. Can you confirm payment status?"
   - Request estimated payment date if delayed

   **After Due Date** (Overdue):
   - **Day 1-7**: Polite inquiry
     - "Invoice [Number] was due on [Date]. Can you please advise when we can expect payment?"
   - **Day 8-15**: More firm follow-up
     - Phone call to accounts contact
     - Escalate to their manager if no response
   - **Day 16-30**: Serious action
     - Hold new orders (put customer on credit hold)
     - Senior management communication
     - Consider late payment fees (if in terms)
   - **Day 31+**: Collection action
     - Formal demand letter
     - Consider legal action
     - Engage collection agency
     - Write-off assessment

#### Payment Receipt:

3. **When Payment Received**:

   **Bank Transfer** (Most Common):
   - Check bank account for incoming transfer
   - Match by:
     - Amount
     - Customer name
     - Invoice reference number
   - If amount doesn't match exactly: Investigate
     - Customer may have deducted discount
     - Customer may have offset with credit note
     - Customer may have paid multiple invoices together
     - Payment error

   **Cheque**:
   - Receive cheque from customer (mail or in-person)
   - Verify cheque details
   - Deposit to bank
   - Wait for cheque to clear (3-7 days)
   - Only mark as paid after clearance

   **Online Payment**:
   - Payment received through portal/gateway
   - System notification
   - Verify amount and invoice reference
   - Confirm funds received in account

4. **Record Payment in System**:
   - Open Invoice in system
   - Click **Record Payment**
   - Enter:
     - Payment Date (date received in bank)
     - Amount Received
     - Payment Method
     - Transaction Reference
     - Bank Account Received Into
   - Attach payment proof (bank statement screenshot, transfer slip)
   - Save and confirm

5. **System Updates Automatically**:
   - Invoice status: **"Paid"**
   - Customer AR balance: Reduced by payment amount
   - Customer credit limit: Available credit restored
   - Aging report: Invoice removed from aging

6. **Issue Payment Receipt**:
   - Generate official receipt
   - Email to customer
   - File in payment records

#### Partial Payments:

7. **If Customer Pays Partial Amount**:
   - Record partial payment in system
   - Invoice status: "Partially Paid"
   - Outstanding balance: [Original Amount - Partial Payment]
   - Follow up for remaining balance
   - Agree on payment plan if necessary

#### Payment Disputes:

8. **If Customer Disputes Invoice**:
   - Listen to customer concern:
     - Pricing discrepancy?
     - Quantity error?
     - Quality issue?
     - Missing credit note?
     - Damaged goods?
   - Investigate thoroughly:
     - Review Sales Order
     - Check Delivery Order
     - Review photos
     - Check pricing agreement
   - Resolve fairly:
     - If customer right: Issue credit note
     - If company right: Explain with evidence
     - If unclear: Escalate to manager
   - Document resolution
   - Adjust invoice if necessary
   - Maintain good relationship

{{< callout type="tip" >}}
**Relationship Management**: Credit customers are typically your best, most valuable customers. Handle payment collection professionally and preserve the relationship even when following up on overdue payments.
{{< /callout >}}

---

## Key Differences: Credit Sales vs. Standard Sales

| Aspect | Credit Sales | Standard Sales |
|--------|-------------|----------------|
| **Deposit** | None | Required (10-50%) |
| **Payment Timing** | Net 30/60/90 days after delivery | Before or on delivery |
| **Customer Type** | Pre-approved business customers | Any customer |
| **Credit Check** | Required before every order | Not applicable |
| **Driver Payment Collection** | No | Yes |
| **Invoice Submission** | Submit to customer accounts dept | Provide at delivery |
| **Payment Follow-Up** | Structured AR collection process | Minimal (already paid) |
| **Credit Risk** | Higher (extending credit) | Lower (prepaid) |
| **Admin Workload** | Higher (AR management) | Lower |
| **Customer Convenience** | Higher (pay later) | Lower (pay upfront) |

---

## Credit Management Best Practices

### Credit Approval Process:

1. **New Customer Credit Application**:
   - Require formal credit application
   - Check trade references (3+ references)
   - Review financial statements (if available)
   - Check credit bureau report (if applicable)
   - Set appropriate credit limit based on:
     - Customer financial strength
     - Expected order volume
     - Industry standards
     - Risk assessment

2. **Credit Limit Guidelines**:
   - Start conservative (e.g., $5,000 - $10,000 for new customers)
   - Increase gradually based on payment performance
   - Review limits quarterly or semi-annually
   - Exceptional customers: Higher limits with board approval

3. **Payment Terms Assignment**:
   - Net 30: Standard for most customers
   - Net 15: Preferred, can offer small discount (e.g., 1%)
   - Net 60: For established customers with excellent history
   - Net 90: Only for very large, stable corporate customers
   - Consider early payment discounts: "2/10 Net 30" = 2% discount if paid within 10 days

### Credit Monitoring:

4. **Regular Credit Review**:
   - Monthly: Review AR aging report
   - Identify customers with overdue balances
   - Flag customers approaching credit limits
   - Review payment patterns and trends

5. **Credit Hold Triggers**:
   - Put customer on credit hold if:
     - Payment overdue > 30 days
     - Exceeds credit limit
     - Returned cheques
     - Consistent late payments
     - Financial distress indicators
   - Require payment before releasing new orders
   - Can lift hold once payment received

6. **Credit Limit Adjustment**:
   - **Increase** if:
     - Excellent payment history (always on time)
     - Growing order volume
     - Customer requests with justification
     - Strong financial position
   - **Decrease** if:
     - Payment delays
     - Financial concerns
     - Reduced order volume
     - Industry downturn affecting customer

### AR Collection Strategies:

7. **Proactive Communication**:
   - Build relationships with customer accounts contacts
   - Call regularly, not just for collections
   - Understand customer payment processes
   - Anticipate and resolve issues early

8. **Payment Incentives**:
   - Early payment discounts
   - Volume discounts
   - Preferred customer status
   - Better payment terms for excellent payers

9. **Consequences for Late Payment**:
   - Polite but firm follow-up
   - Late payment fees (if in agreement)
   - Credit hold for new orders
   - Revert to cash terms if necessary
   - Legal action as last resort

### Risk Mitigation:

10. **Reduce Credit Risk**:
    - Diversify customer base (don't over-rely on one customer)
    - Set conservative credit limits initially
    - Require deposits for unusually large orders even from credit customers
    - Consider credit insurance for very large customers
    - Monitor customer financial health
    - React quickly to payment issues

{{< callout type="warning" >}}
**Bad Debt Prevention**: The best way to handle bad debts is to prevent them. Thorough credit approval, appropriate limits, and proactive collection are essential.
{{< /callout >}}

---

## Common Challenges and Solutions

### Challenge 1: Customer Exceeds Credit Limit

**Scenario**: Regular customer wants to place order but would exceed credit limit.

**Solutions**:
- **Option A**: Customer pays down existing balance first
- **Option B**: Request manager approval for temporary limit increase
- **Option C**: Require deposit for this order to keep within limit
- **Option D**: Split order into multiple deliveries over time
- **Option E**: Permanent credit limit increase if justified

### Challenge 2: Slow-Paying Customer

**Scenario**: Customer consistently pays 10-15 days late, never within terms.

**Solutions**:
- Have frank conversation about payment expectations
- Offer early payment discount as incentive
- Reduce credit limit to minimize exposure
- Require tighter terms (Net 15 instead of Net 30)
- Put on credit hold for new orders until current balance paid
- Revert to cash or deposit terms if no improvement

### Challenge 3: Payment Disputes

**Scenario**: Customer refuses payment claiming issues with goods or pricing.

**Solutions**:
- Listen to customer concerns without being defensive
- Investigate thoroughly using delivery photos, signed documents
- Verify against Sales Order and customer PO
- If customer is right: Issue credit note or offer remedy
- If company is right: Provide evidence respectfully
- Find middle-ground compromise if necessary
- Escalate to management if unresolved
- Maintain relationship even during dispute

### Challenge 4: Payment Received But Can't Match Invoice

**Scenario**: Payment in bank but reference number unclear, can't identify which invoice.

**Solutions**:
- Contact customer accounts: "We received $[Amount] on [Date], please confirm which invoice(s) this payment is for"
- Check amount against open invoices - may match exactly
- Review customer PO numbers
- Check recent deliveries
- Ask customer to provide remittance advice
- Establish better payment reference protocol with customer

### Challenge 5: Customer Financial Distress

**Scenario**: Customer showing signs of financial trouble (late payments, bounced cheques, requesting extended terms).

**Solutions**:
- Immediate credit hold - no new credit sales
- Require cash terms for new orders
- Accelerate collection on outstanding invoices
- Consider offering payment plan for existing debt
- Monitor customer situation closely
- Be prepared to write off if necessary
- Protect company by not extending additional credit

---

## Success Metrics for Credit Sales

### Key Performance Indicators:

**Collection Effectiveness**:
- **Days Sales Outstanding (DSO)**: Target < 45 days
  - Formula: (Accounts Receivable / Total Credit Sales) × Number of Days
- **Collection Rate**: Target > 98%
- **Average Days to Payment**: Target = Payment Terms (e.g., 30 days for Net 30)

**Credit Management**:
- **Bad Debt Ratio**: Target < 1% of credit sales
- **Overdue Ratio**: Target < 5% of AR overdue
- **Credit Hold Rate**: Target < 2% of customers

**Operational Efficiency**:
- **Invoice Submission Time**: Target < 24 hours after delivery
- **Payment Posting Time**: Target same day as received
- **Dispute Resolution Time**: Target < 7 days

---

## Related Workflows

- **[Standard Sales Workflow](standard-sales-workflow)** - For customers requiring deposits
- **[Cash Sales Workflow](cash-sales-workflow)** - For immediate payment transactions
- **[Partial Delivery Workflow](partial-delivery-workflow)** - Split shipments on credit
- **[Returns & Exchanges](returns-exchanges-workflow)** - Handling returns for credit customers

---

## Need Help?

{{< callout type="info" >}}
**Questions about Credit Sales?**
- Consult credit manager for credit limit questions
- Escalate collection issues to AR supervisor
- Refer to [Accounts Receivable Management](/business-operations/account-receivable/) for AR processes
- See [Customer Maintenance Applet](/applets/customer-maintenance-applet/) for credit setup
{{< /callout >}}

---

*Credit sales enable stronger business relationships and higher order volumes, but require disciplined credit management and proactive collection to minimize risk.*
