---
title: "Invoice-First Workflow"
description: "Handle situations where supplier invoice arrives before goods delivery - manage prepayments and track pending deliveries"
weight: 40
---

The Invoice-First Workflow handles situations where you receive and must pay a supplier invoice before the goods are physically delivered. This is common in international trade, prepayment arrangements, and certain supplier relationships where payment is required upfront.

## When to Use Invoice-First Workflow

This workflow is necessary for:

- **Import purchases** requiring prepayment or deposit
- **Custom manufacturing** requiring advance payment
- **Special orders** with payment before production
- **Cash-on-delivery terms** where invoice/payment precedes delivery
- **Proforma invoice payments** for international shipments
- **Supplier credit terms** requiring advance payment
- **High-demand items** where supplier requires payment to secure stock

{{< callout type="info" >}}
**Key Characteristic**: You pay before receiving goods, creating a prepayment/advance payment asset on your books until goods are delivered.
{{< /callout >}}

## When NOT to Use This Workflow

Avoid this workflow for:

- **Standard local purchases** with normal credit terms
- **Suppliers with poor track record** (risk of non-delivery)
- **High-value purchases** without purchase protection
- **Situations where goods are immediately available**

For standard purchases, use [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow).

## Process Flow

```
Step 1: Create PO → Step 2: Receive Proforma/Invoice → Step 3: Process Prepayment → Step 4: Track Shipment → Step 5: Receive Goods → Step 6: Settle Final Invoice
    ↓                   ↓                                 ↓                         ↓                   ↓                   ↓
Order Placed      Supplier Sends Invoice         Make Advance Payment      Monitor Delivery    Create GRN          Clear Prepayment
Agreement Made    (before delivery)              Record as Prepaid         Track Status        Update Stock        Final Settlement
```

---

## Step 1: Create Purchase Order

**Responsible Role**: Purchasing Admin

### Standard PO Creation

Follow normal PO creation process:

**Navigation**: `[Purchasing > Purchase Orders > New PO]`

#### PO Details
- **Supplier**: Select supplier
- **Payment Terms**: Note prepayment requirement
  - Example: "50% advance, 50% on delivery"
  - Example: "100% prepayment required"
- **Delivery Terms**: Note shipping arrangement
  - FOB, CIF, EXW, etc.
- **Expected Delivery**: Estimated arrival date
- **Items and quantities**: As per requirement

#### Special Notations
In PO remarks/notes, clearly state:
- "Prepayment required per supplier terms"
- Prepayment percentage and amount
- When balance is due
- Delivery schedule
- Shipment tracking requirements

{{< callout type="warning" >}}
**Risk Management**: Prepaying suppliers carries delivery risk. Only prepay to trusted suppliers or use payment protection (letters of credit, trade insurance, escrow).
{{< /callout >}}

### Approval Process

PO requiring prepayment may need additional approval:

**Enhanced approval for**:
- First-time prepayment to supplier
- Large prepayment amounts
- High-risk suppliers
- International prepayments

**Additional checks**:
- [ ] Supplier track record verified
- [ ] Prepayment is standard in this industry/region
- [ ] Purchase protection considered
- [ ] Delivery date is realistic
- [ ] Budget available for prepayment

---

## Step 2: Receive Proforma Invoice or Tax Invoice

**Responsible Role**: Purchasing Admin / Accounts Payable

### Proforma Invoice vs. Tax Invoice

#### Proforma Invoice
- **Purpose**: Advance notice of charges, payment request
- **Characteristics**:
  - Labeled "Proforma Invoice"
  - Shows what will be charged
  - Not a valid tax invoice for input tax claim
  - Used for prepayment
- **Common in**: International trade, custom orders

#### Tax Invoice (in advance)
- **Purpose**: Formal invoice requiring payment before delivery
- **Characteristics**:
  - Valid tax invoice format
  - Can claim input tax when paid
  - Legal invoice document
  - Supplier records as sale
- **Common in**: Prepayment terms, COD arrangements

### Document Review

When invoice received:

#### Verify Against PO
- [ ] Supplier name matches
- [ ] PO number is referenced
- [ ] Item descriptions match
- [ ] Quantities match
- [ ] Prices match agreed prices
- [ ] Total amount matches PO
- [ ] Payment terms stated

#### Check Payment Requirements
- [ ] Payment amount (full or partial)
- [ ] Payment deadline
- [ ] Payment method accepted
- [ ] Bank account details
- [ ] Payment reference required

#### Identify Issues Early
- Price increases since PO
- Freight charges not previously mentioned
- Additional fees or surcharges
- Different payment terms than agreed

{{< callout type="tip" >}}
**Immediate Action**: If invoice doesn't match PO, contact supplier immediately before making payment. Much harder to resolve after payment.
{{< /callout >}}

---

## Step 3: Process Prepayment Invoice

**Responsible Role**: Accounts Payable

### Navigation
`[Purchasing > Purchase Invoices > New Prepayment Invoice]`

or

`[Accounts Payable > Supplier Prepayments > New Prepayment]`

### Invoice Entry

#### Invoice Header
- **Invoice Type**: Select "Prepayment" or "Proforma"
- **Invoice Number**: From supplier invoice
- **Invoice Date**: Date on invoice
- **Payment Due Date**: When payment required
- **Supplier**: Select supplier
- **PO Reference**: Link to PO
- **Currency**: Match invoice currency

#### Invoice Lines
Enter items as per invoice:
- Items from PO
- Quantities
- Prices
- Tax codes
- Total amount

#### Prepayment Specifics
- **Prepayment %**: E.g., 50% advance
- **Prepayment Amount**: Calculated or manual
- **Balance Amount**: Remaining amount due on delivery
- **Expected Delivery**: When goods will arrive

### Accounting Treatment

**Critical**: Prepayment is NOT an expense yet; it's an asset (advance payment to supplier).

#### Accounting Entry on Payment
```
Debit: Prepayments - Supplier          $10,000
Debit: Withholding Tax (if applicable)     $500
Credit: Bank Account                             $10,000
Credit: WHT Payable                                 $500
```

**Not this** (wrong):
```
Debit: Purchase Expense    $10,000  ← Wrong! Goods not received yet
Credit: Bank                        $10,000
```

{{< callout type="warning" >}}
**Accounting Critical**: Recording prepayment as expense overstates expenses in current period and understates in delivery period. Always use prepayment/advance account.
{{< /callout >}}

### Approval Workflow

Prepayment invoices require careful approval:

#### Standard Checks
- [ ] Matches approved PO
- [ ] Amount is correct prepayment %
- [ ] Supplier bank details verified
- [ ] Delivery timeline confirmed
- [ ] Budget available

#### Enhanced Checks for High Value
- [ ] Supplier financial stability verified
- [ ] Delivery penalties agreed
- [ ] Insurance or trade protection considered
- [ ] Alternative suppliers considered
- [ ] Business case strong

### Payment Processing

#### Payment Authorization
- **Additional authorization** often required for prepayments
- **Dual authorization**: Two signatories for large prepayments
- **Board approval**: Very large prepayments

#### Payment Execution
1. **Verify bank details** (call supplier to confirm)
2. **Process payment**:
   - Bank transfer (most common for international)
   - Letter of credit (for large imports)
   - Escrow (for high-risk purchases)
3. **Record payment** in system
4. **Save payment confirmation**
5. **Send copy to supplier**

#### Payment Confirmation to Supplier

**Send**:
- Payment confirmation/receipt
- Payment reference number
- Request: Delivery schedule confirmation
- Request: Tracking information when shipped

{{< callout type="info" >}}
**Follow-Up Essential**: After paying, actively track with supplier. You've paid; ensure delivery happens on time.
{{< /callout >}}

---

## Step 4: Track Shipment and Pending Delivery

**Responsible Role**: Purchasing Admin

### Create Tracking Record

**Navigation**: `[Purchasing > Pending Deliveries > Track Shipment]`

#### Tracking Information
- **PO Number**: Original PO
- **Prepayment Reference**: Prepayment invoice number
- **Supplier**: Supplier name
- **Expected Ship Date**: When supplier will ship
- **Expected Arrival**: When goods will arrive
- **Shipment Method**: Sea, air, land freight
- **Tracking Number**: AWB, BL, tracking number (when available)

#### Communication Log
Maintain log of communications:
- Dates contacted
- Response received
- Delivery updates
- Issues and resolutions

### Regular Follow-Up

#### Follow-Up Schedule
| Timing | Action |
|--------|--------|
| **Day 1** (after payment) | Confirm payment received, get production/shipping timeline |
| **Weekly** | Request status update |
| **2 weeks before expected** | Confirm shipping arrangements |
| **Upon shipping** | Get tracking number, delivery schedule |
| **If delayed** | Daily follow-up, get new ETA |

### Escalation Triggers

Escalate to management if:

- **No response** from supplier after payment
- **Significant delay** beyond promised date
- **Changed delivery terms** without agreement
- **Quality concerns** reported
- **Supplier financial issues** discovered

### Documentation

Keep organized file:
- [ ] Original PO
- [ ] Proforma/tax invoice
- [ ] Payment proof
- [ ] All email communications
- [ ] Shipping documents (when received)
- [ ] Tracking screenshots

{{< callout type="tip" >}}
**Proactive Management**: Don't wait for supplier to contact you. You've prepaid; you have the right to regular updates. Be proactive in following up.
{{< /callout >}}

---

## Step 5: Receive Goods at Warehouse

**Responsible Role**: Warehouse Staff

### Pre-Arrival Preparation

When shipment is arriving:

#### Warehouse Notification
- **Alert warehouse staff**: Delivery expected
- **Provide PO copy**: For reference
- **Special instructions**: If any
- **Inspection requirements**: Quality checks needed

#### Documentation Ready
- Original PO
- Prepayment invoice
- Packing list (from supplier)
- Import documents (for international shipments)

### Physical Receipt

Same as standard GRN process:

**Navigation**: `[Purchasing > Goods Receipt > New GRN]`

#### Verify Delivery Documents
- [ ] Delivery order/bill of lading
- [ ] Packing list
- [ ] Certificate of origin (if import)
- [ ] Quality certificates
- [ ] Customs clearance documents (if import)

#### Physical Inspection
- [ ] Count all items
- [ ] Check for damage
- [ ] Verify correct items delivered
- [ ] Check quality
- [ ] Scan serial numbers

#### GRN Creation
- **Link to PO**: Select original PO
- **Note prepayment**: Reference prepayment in remarks
- **Enter quantities**: Actual received quantities
- **Attach documents**: DO, packing list, photos
- **Confirm GRN**: Create goods receipt

### Handling Discrepancies

#### Short Delivery
**Scenario**: Ordered 100, received 80

**Actions**:
1. Create GRN for 80 received
2. Note 20 short
3. Contact supplier immediately
4. Determine: Will balance be delivered?
5. If yes: Wait for balance, keep PO open
6. If no: Request refund of prepayment for 20 units

#### Damaged Goods
**Scenario**: Items damaged in transit

**Actions**:
1. Document damage (photos, videos)
2. Get delivery driver to acknowledge
3. Create GRN for good items only
4. Reject damaged items
5. Contact supplier immediately
6. Claim: Replacement or refund
7. Insurance claim: If insured

#### Wrong Items
**Scenario**: Different items than ordered

**Actions**:
1. Do NOT accept wrong items
2. Reject delivery or hold in quarantine
3. Contact supplier immediately
4. Demand: Correct items or refund
5. Consider: Cancellation if significant breach

{{< callout type="warning" >}}
**Important**: You've prepaid, so you have strong position. Do NOT accept short or wrong deliveries without insisting on full delivery or refund.
{{< /callout >}}

---

## Step 6: Settle Final Invoice and Clear Prepayment

**Responsible Role**: Accounts Payable

### Final Invoice Processing

#### Full Prepayment Scenario (100% prepaid)

If you've paid 100% in advance:

**Navigation**: `[Purchasing > Purchase Invoices > Link to Prepayment]`

1. **Create final invoice**:
   - Link to GRN
   - Link to prepayment invoice
   - Amount = GRN value
2. **System clears prepayment**:
   ```
   Debit: Purchase Expense / Inventory   $10,000
   Credit: Prepayments - Supplier                 $10,000
   ```
3. **No payment needed**: Already paid
4. **Close transaction**: PO, GRN, invoice all closed

#### Partial Prepayment Scenario (e.g., 50% prepaid)

If you've paid 50% advance, 50% on delivery:

**Example**:
- Total order: $20,000
- Prepaid: $10,000
- Balance due: $10,000

**Process**:
1. **Receive supplier's final invoice** for $20,000
2. **Enter full invoice**:
   - Link to PO and GRN
   - Link to prepayment
   - Total: $20,000
3. **System applies prepayment**:
   ```
   Debit: Purchase Expense / Inventory   $20,000
   Credit: Prepayments - Supplier                 $10,000
   Credit: Accounts Payable                       $10,000
   ```
4. **Pay balance**: $10,000 per delivery terms
5. **Close transaction**: All complete

### Reconciliation

Verify everything matches:

| Document | Amount | Status |
|----------|--------|--------|
| **PO** | $20,000 | Fully received |
| **Prepayment** | $10,000 | Applied to invoice |
| **GRN** | $20,000 (qty received) | Complete |
| **Final Invoice** | $20,000 | $10,000 prepaid, $10,000 paid on delivery |
| **Total Paid** | $20,000 | Complete |

### Handling Variances

#### Scenario: Received Less Than Ordered

**Example**:
- Ordered and prepaid: $10,000 (100 units)
- Received: 80 units ($8,000 value)
- Shortfall: 20 units ($2,000)

**Actions**:
1. **Create invoice for what received**: $8,000
2. **Apply prepayment**: $8,000
3. **Prepayment balance**: $2,000 remains
4. **Options**:
   - **Option A**: Wait for balance delivery, keep prepayment credit
   - **Option B**: Request refund of $2,000
5. **Record decision** in system

#### Scenario: Price Changed on Final Invoice

**Example**:
- Proforma invoice (prepaid): $10,000
- Final tax invoice: $11,000 (freight added)

**Actions**:
1. **Verify change is legitimate**
2. **If agreed additional charges**:
   - Enter final invoice: $11,000
   - Apply prepayment: $10,000
   - Pay balance: $1,000
3. **If NOT agreed**:
   - Query with supplier
   - Negotiate
   - Demand original price
4. **Get approval** for variance

{{< callout type="info" >}}
**Price Protection**: If prepaying based on proforma, ensure it states "Final price, no additional charges" or get price protection clause in PO.
{{< /callout >}}

---

## Special Scenarios

### Scenario 1: Import Purchase with 50% Prepayment

**Purchase**: Machinery from overseas supplier
**Value**: $50,000
**Terms**: 50% advance, 50% before shipment

**Timeline**:

**Day 1**: PO created and approved

**Day 7**: Proforma invoice received for $50,000

**Day 10**:
- Process prepayment invoice: $25,000
- Pay 50% advance: $25,000
- Accounting: Debit Prepayments $25,000

**Day 45**: Supplier confirms ready to ship, sends invoice for balance

**Day 47**:
- Pay remaining 50%: $25,000
- Supplier ships machinery

**Day 77**: Machinery arrives at port

**Day 80**: Customs cleared, delivered to warehouse

**Day 81**:
- Create GRN: $50,000
- Physical inspection: Complete
- System clears prepayment:
  ```
  Debit: Fixed Assets - Machinery    $50,000
  Credit: Prepayments                         $50,000
  ```
- Transaction complete

### Scenario 2: Prepayment but Supplier Fails to Deliver

**Situation**: Paid 100% prepayment, supplier goes bankrupt before delivery

**Actions**:

**Immediate**:
1. Identify issue immediately (no response, news of insolvency)
2. Escalate to senior management
3. Consult legal counsel

**Recovery Efforts**:
1. **Contact supplier**: Attempt communication
2. **Demand letter**: Legal demand for refund or delivery
3. **Bankruptcy claim**: File claim in bankruptcy proceedings
4. **Insurance claim**: If purchase was insured
5. **Legal action**: Lawsuit if applicable

**Accounting**:
1. **Recognize potential loss**:
   ```
   Debit: Bad Debt / Purchase Loss    $10,000
   Credit: Prepayments                         $10,000
   ```
2. **Subsequent recovery** (if any):
   ```
   Debit: Bank                         $3,000
   Credit: Recovery Income                     $3,000
   ```

**Lessons**:
- Verify supplier financial stability before prepaying
- Use trade insurance for large prepayments
- Consider letters of credit for protection
- Never prepay 100% without strong trust/protection

{{< callout type="warning" >}}
**Risk Reality**: Prepayment carries genuine risk of non-delivery. Supplier bankruptcy, fraud, or poor performance can result in loss. Implement strong supplier vetting and consider insurance.
{{< /callout >}}

### Scenario 3: Custom Manufacturing with Milestone Payments

**Purchase**: Custom equipment with 3 milestone payments
**Value**: $100,000
**Terms**: 30% on order, 40% on completion, 30% on delivery

**Payment Structure**:

**Milestone 1**: Order Confirmation
- Payment: $30,000
- Trigger: PO signed
- Accounting: Debit Prepayments $30,000

**Milestone 2**: Manufacturing Complete
- Payment: $40,000
- Trigger: Supplier provides completion certificate and photos
- Accounting: Debit Prepayments $40,000 (total now $70,000)

**Milestone 3**: Delivery and Installation
- Payment: $30,000
- Trigger: Equipment delivered, installed, and tested
- Accounting:
  - Create GRN: $100,000
  - Clear prepayments: $70,000
  - Pay final: $30,000
  - Result: Equipment capitalized $100,000

**Controls**:
- Each payment requires proof of milestone completion
- Quality inspection at each milestone
- Right to withhold payment if issues
- Final payment only after full acceptance

---

## Best Practices

### For Purchasing

1. **Verify supplier reliability** before prepaying
2. **Negotiate payment terms**: Avoid 100% prepayment if possible
3. **Get delivery guarantees**: Penalty clauses for late delivery
4. **Use payment protection**: Letters of credit, escrow, insurance
5. **Document everything**: All communications, agreements, changes

### For Accounts Payable

1. **Always use prepayment account**: Never expense before goods received
2. **Track prepayments carefully**: Regular reconciliation
3. **Follow up on old prepayments**: Aged prepayments = potential issues
4. **Verify bank details**: Especially for new suppliers
5. **Document application**: Clear trail when clearing prepayment

### For Management

1. **Set prepayment policies**: When acceptable, limits, approvals
2. **Approve prepayments carefully**: Extra scrutiny
3. **Monitor supplier performance**: Track delivery vs. promise
4. **Manage risk**: Insurance, diversification, supplier assessment
5. **Review aged prepayments**: Monthly review of outstanding

---

## Controls and Compliance

### Key Control Points

#### 1. Prepayment Authorization
- Higher approval level than normal PO
- Business justification required
- Supplier vetting mandatory

#### 2. Payment Verification
- Verify bank account with supplier (phone)
- Dual authorization for large amounts
- Payment confirmation retained

#### 3. Delivery Tracking
- Active tracking system
- Regular follow-up schedule
- Escalation process for delays

#### 4. Reconciliation
- Monthly prepayment reconciliation
- Aged prepayment review
- Follow-up on outstanding

#### 5. Accounting Treatment
- Proper use of prepayment accounts
- Timely clearing upon delivery
- Correct period recognition

### Monthly Compliance Checklist

- [ ] All prepayments have corresponding POs
- [ ] All prepayments properly authorized
- [ ] Delivery tracking current
- [ ] No unexplained aged prepayments
- [ ] Prepayments cleared upon delivery
- [ ] Variances documented and approved
- [ ] Loss provisions for problematic prepayments

---

## Related Documentation

### Workflows
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - Standard PO process
- [Direct GRN Workflow](/guides/purchasing-guides/direct-grn-workflow) - Direct goods receipt
- [Direct Invoice Workflow](/guides/purchasing-guides/direct-invoice-workflow) - Service purchases

### Daily Operations
- [Creating Purchase Orders](/user-guide/daily-tasks/creating-purchase-order) - PO creation guide
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note) - GRN procedures
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing) - Invoice matching

### Module Documentation
- [Purchasing Module](/modules/purchasing/) - Complete purchasing features
- [Financial Accounting Module](/modules/financial-accounting/) - Prepayment accounting
- [Supplier Maintenance](/applets/supplier-maintenance-applet/) - Supplier management

{{< callout type="success" >}}
**Workflow Mastery**: Invoice-First workflow enables prepayment scenarios while maintaining proper accounting treatment and delivery tracking. Critical controls protect against prepayment risks.
{{< /callout >}}
