---
title: "Consignment Purchasing"
description: "Manage consignment stock arrangements where you only pay for items when used or sold - improve cash flow and reduce inventory risk"
weight: 50
---

Consignment Purchasing is a special inventory arrangement where suppliers place stock at your location, but you only pay for items when you use or sell them. This reduces inventory investment and risk while ensuring stock availability.

## What is Consignment Stock?

In a consignment arrangement:

- **Supplier owns stock** even though it's physically at your location
- **You pay only when used/sold** from consignment stock
- **Supplier bears inventory risk** (damage, obsolescence)
- **You manage physical stock** (storage, handling)
- **Regular reconciliation** of stock levels and usage
- **Monthly/periodic billing** for consumed items

{{< callout type="info" >}}
**Key Benefit**: Consignment improves cash flow by deferring payment until usage, while ensuring stock availability for operations or sales.
{{< /callout >}}

## When to Use Consignment Purchasing

Consignment works well for:

- **High-value components** with unpredictable usage
- **Fast-moving spare parts** requiring immediate availability
- **Supplier-managed inventory** programs
- **Retail goods** on consignment from distributors
- **Specialized materials** with limited shelf life
- **New product trials** reducing risk
- **Seasonal items** with uncertain demand

## When NOT to Use Consignment

Avoid consignment for:

- **Low-value items** (administrative cost exceeds benefit)
- **Items you can negotiate good payment terms** anyway
- **Suppliers unwilling to bear inventory risk**
- **Items with high shrinkage risk** (difficult to track)
- **Unreliable usage tracking** systems

---

## Process Flow

```
Step 1: Consignment Agreement → Step 2: Receive Consignment Stock → Step 3: Use/Sell Items → Step 4: Monthly Reconciliation → Step 5: Process Consumption Invoice
    ↓                              ↓                                  ↓                       ↓                          ↓
Negotiate Terms            GRN to Consignment            Issue from Consignment    Count Stock             Pay for Used Items
Setup System               (No payment yet)              Track Usage               Verify Transactions     Clear Consignment
```

---

## Step 1: Establish Consignment Agreement

**Responsible Role**: Purchasing Manager

### Negotiation Points

#### Stock Ownership and Risk
- **Title**: Stock remains supplier property until consumed
- **Risk of loss**: Who bears risk of damage/theft at your location
- **Insurance**: Who insures consignment stock
- **Obsolescence**: Handling of slow-moving or obsolete stock
- **Returns**: Can you return unused stock?

#### Usage and Payment Terms
- **Pricing**: Price when consumed (fixed or variable)
- **Price protection**: If prices change during consignment period
- **Payment terms**: Net 30, Net 60 from consumption invoice
- **Minimum consumption**: Any minimum monthly commitment
- **Billing cycle**: Weekly, monthly, quarterly

#### Stock Management
- **Stock levels**: Min/max levels to maintain
- **Replenishment**: How and when supplier replenishes
- **Stock takes**: Frequency of physical counts
- **Reporting**: Usage reports to supplier
- **Access**: Supplier's right to check stock

#### Legal Terms
- **Contract duration**: Initial term and renewal
- **Termination**: Notice period and stock handling
- **Liability**: Damage, loss, theft responsibilities
- **Dispute resolution**: How issues are handled

{{< callout type="tip" >}}
**Negotiation Tip**: Consignment benefits supplier (guaranteed placement) and you (better cash flow). Negotiate favorable terms: competitive pricing, flexible minimums, risk allocation.
{{< /callout >}}

### System Setup

**Navigation**: `[Master Data > Suppliers > [Supplier] > Consignment Setup]`

#### Supplier Consignment Profile
- Enable consignment for supplier
- Consignment terms reference
- Payment terms for consumption invoices
- Default consignment location
- Responsible person (for reconciliation)

#### Item Configuration
For each consignment item:
- Flag as consignment item
- Link to consignment supplier
- Consignment pricing
- Consignment location
- Usage tracking method

#### Consignment Accounts
Set up G/L accounts:
- **Consignment Inventory**: Off-balance sheet or memo account
- **Consignment Liability**: When consumed, before invoiced
- **Purchase Expense**: Final expense account
- **Variance Account**: For discrepancies

---

## Step 2: Receive Consignment Stock

**Responsible Role**: Warehouse Staff

### Physical Receipt

When consignment stock arrives:

**Navigation**: `[Inventory > Goods Receipt > Consignment Receipt]`

#### Document Verification
- [ ] Delivery order indicates "Consignment Stock"
- [ ] Quantities match delivery note
- [ ] Items are consignment-agreed items
- [ ] Supplier is correct consignment supplier

#### Physical Process
1. Unload and count items
2. Quality inspection
3. Scan serial numbers (if applicable)
4. Verify against delivery order

### Consignment GRN

**Create special consignment receipt**:

#### GRN Details
- **GRN Type**: "Consignment Receipt"
- **Supplier**: Consignment supplier
- **Receipt Date**: Today
- **Reference**: Supplier's delivery note

#### Line Items
- **Item code**: Consignment item
- **Quantity received**: Actual quantity
- **Unit price**: Consignment agreed price (for reference)
- **Location**: Consignment storage location

#### Key Difference from Normal GRN
- **No payment created**: This is NOT a purchase yet
- **No expense recorded**: Still supplier's stock
- **Inventory tracking**: Tracked separately as consignment
- **Ownership**: Remains with supplier

### Accounting Treatment

**Memo entry only** (not on main balance sheet):
```
Consignment Inventory (Memo)          $10,000
  Consignment Stock - Supplier XYZ            $10,000

(This is tracked in system but not in main financial statements)
```

### Storage Segregation

**Physically separate consignment stock**:
- **Dedicated area**: "Consignment Stock - Supplier XYZ"
- **Clear labeling**: "CONSIGNMENT - NOT OWNED BY US"
- **Access control**: Limited access, tracked usage
- **Stock location codes**: Distinct from owned inventory

{{< callout type="warning" >}}
**Critical**: Physically segregate consignment stock. Mixing with owned stock causes reconciliation nightmares and potential supplier disputes.
{{< /callout >}}

---

## Step 3: Use or Sell Consignment Items

**Responsible Role**: Warehouse Staff / Production Staff

### Usage Process

When issuing consignment stock:

**Navigation**: `[Inventory > Issues > Consignment Issue]`

#### For Production Use

**Scenario**: Using consignment parts in manufacturing

1. **Create issue document**:
   - Source: Consignment location
   - Item: Consignment item
   - Quantity: Required quantity
   - Purpose: Production work order #XXX
   - Issue type: Consignment to Production

2. **Physical removal**: Take from consignment area

3. **System records**:
   - Reduces consignment inventory
   - Creates consumption record
   - Flags for billing to supplier

#### For Sales to Customer

**Scenario**: Selling consignment retail goods

1. **Create sales order** as normal

2. **Fulfillment**:
   - System checks stock location
   - Identifies stock as consignment
   - Creates special fulfillment document

3. **Delivery to customer**:
   - Physical goods delivered
   - Customer invoiced (your selling price)
   - System records: Consignment used

4. **Accounting entries**:
   ```
   Debit: Accounts Receivable          $15,000
   Credit: Sales Revenue                         $15,000

   (Cost entries deferred until consignment invoice processed)
   ```

### Usage Tracking

System automatically tracks:
- **Date consumed**: When issued/sold
- **Quantity consumed**: Units used
- **From which batch**: If batch tracked
- **Serial numbers**: If serialized
- **Purpose**: Work order, sales order, consumption reason
- **User**: Who issued the stock

{{< callout type="info" >}}
**Automated Tracking**: System automatically tracks all consignment usage. This forms the basis for supplier billing and reconciliation.
{{< /callout >}}

---

## Step 4: Monthly Reconciliation

**Responsible Role**: Purchasing Admin / Warehouse Supervisor

### Preparation

**At month-end**:

#### System Reports
**Navigation**: `[Reports > Inventory > Consignment Stock Report]`

**Generate**:
1. **Opening balance**: Consignment stock at start of month
2. **Receipts**: New consignment stock received
3. **Issues**: Stock consumed during month
4. **Closing balance**: Expected stock remaining
5. **Usage detail**: Itemized consumption transactions

#### Physical Count

**Conduct physical stock take**:
- Count all consignment items
- Verify quantities
- Check for damage
- Note any discrepancies

### Reconciliation Process

**Compare**:

| Item | Opening | Received | Issued | Expected Closing | Actual Count | Variance |
|------|---------|----------|--------|------------------|--------------|----------|
| Item A | 100 | 50 | 80 | 70 | 68 | -2 |
| Item B | 200 | 0 | 150 | 50 | 52 | +2 |
| Item C | 50 | 100 | 75 | 75 | 75 | 0 |

### Investigate Variances

For each variance:

#### Possible Causes
- **Short**: Damage, theft, unrecorded usage, counting error
- **Over**: Unrecorded receipts, counting error, returned from production

#### Actions
1. **Recount**: Verify physical count
2. **Check transactions**: Review all transactions during period
3. **Investigate**: Ask users about unrecorded usage
4. **Document**: Record reason for variance
5. **Adjust**: Create adjustment transaction if variance is real

### Prepare Consumption Report

**Create monthly report for supplier**:

**Contents**:
- Opening balance
- Receipts this month
- Consumption details (by date, purpose, quantity)
- Closing balance
- Physical count confirmation
- Variances and explanations
- Amount due calculation

**Send to supplier**: Usually 2-3 days before month-end

{{< callout type="tip" >}}
**Reconciliation Timing**: Reconcile BEFORE supplier sends invoice. This gives you time to resolve discrepancies before payment is due.
{{< /callout >}}

---

## Step 5: Process Consumption Invoice

**Responsible Role**: Accounts Payable

### Receive Supplier Invoice

Supplier sends monthly consumption invoice:

**Invoice should show**:
- Consignment agreement reference
- Period covered (e.g., March 2024)
- Opening balance
- Deliveries during month
- Consumption during month
- Closing balance
- Amount due (for consumption only)

### Invoice Matching

**Navigation**: `[Purchasing > Consignment > Consumption Invoice]`

#### Two-Way Match

Compare supplier invoice with your consumption records:

**Your Records**:
```
Item A: 80 units @ $50 = $4,000
Item B: 150 units @ $30 = $4,500
Item C: 75 units @ $40 = $3,000
Total: $11,500
```

**Supplier Invoice**:
```
Item A: 80 units @ $50 = $4,000
Item B: 150 units @ $30 = $4,500
Item C: 75 units @ $40 = $3,000
Total: $11,500
```

**Status**: ✓ Clean match

#### Handle Discrepancies

**If quantities don't match**:
1. Review your consumption records
2. Check supplier's records
3. Refer to monthly reconciliation
4. Resolve before processing invoice

**If prices don't match**:
1. Check consignment agreement pricing
2. Verify no price change notification
3. Query with supplier if incorrect
4. Get revised invoice or approval for price change

### Invoice Processing

#### Create Consumption Invoice
- **Link to consignment agreement**
- **Link to consumption records**
- **Enter supplier invoice details**
- **Verify amounts match**

#### Accounting Entries

**When invoice processed**:
```
Debit: Purchase Expense / COGS       $11,500
Debit: Input Tax (if applicable)      $2,070
Credit: Accounts Payable                      $13,570

(Memo entry: Reduce consignment inventory)
```

**Result**:
- Expense recognized (when consumed, not when received)
- Payable to supplier created
- Consignment inventory reduced
- Proper matching principle applied

### Payment

Pay per normal payment terms:
- Usually Net 30 or Net 60 from consumption invoice
- Standard payment process
- Remittance advice shows consumption period

{{< callout type="success" >}}
**Matching Principle**: Expenses are recognized when items are consumed (used/sold), not when received. This matches revenue with costs for accurate profitability.
{{< /callout >}}

---

## Special Scenarios

### Scenario 1: Returning Unused Consignment Stock

**Situation**: Excess consignment stock, supplier agrees to take back

**Process**:
1. **Notify supplier**: Request return authorization
2. **Physical preparation**: Pack items for return
3. **Create return document**:
   - Type: Consignment Return
   - Quantity returning
   - Reason for return
4. **Ship to supplier**
5. **System entry**: Reduces consignment inventory
6. **Accounting**: Remove from memo consignment account

**No payment impact**: Stock was never purchased

### Scenario 2: Damaged Consignment Stock

**Situation**: Consignment items damaged at your location

**Process**:

**Minor damage (normal wear)**:
- Document damage
- Inform supplier
- Usually supplier absorbs (part of consignment risk)

**Significant damage (negligence)**:
- Immediate notification to supplier
- Investigation of cause
- Determine liability per agreement
- If your liability:
  - Offer to purchase damaged items
  - Or pay compensation
  - Remove from consignment inventory

### Scenario 3: Price Change During Consignment Period

**Situation**: Supplier announces price increase mid-month

**Process**:

**Check agreement**:
- Price protection clause?
- How are price changes handled?

**Typical handling**:
- **Old price for existing stock** at time of change
- **New price for new deliveries** after change date
- **Consume old stock first** (FIFO)

**System setup**:
- Adjust pricing effective date
- Track separately in system
- Bill correct price based on consumption date

---

## Benefits and Risks

### Benefits

**For Your Company**:
- **Improved cash flow**: Pay only when used/sold
- **Reduced inventory investment**: Supplier finances inventory
- **Lower inventory risk**: Supplier bears obsolescence risk
- **Better stock availability**: Stock always available
- **Reduced storage cost**: Less owned inventory to store

**For Supplier**:
- **Secured placement**: Guaranteed shelf space
- **Reduced competition**: Exclusive or preferred position
- **Better demand visibility**: See actual usage patterns
- **Customer loyalty**: Strengthened relationship

### Risks

**For Your Company**:
- **Usage tracking burden**: Must accurately track consumption
- **Reconciliation overhead**: Monthly reconciliation required
- **Liability for loss**: May be liable for damage/theft
- **Dependency**: Reliance on supplier for replenishment
- **Physical segregation**: Extra storage complexity

**For Supplier**:
- **Cash flow impact**: Finance inventory for customer
- **Stock at risk**: Damage, obsolescence at customer site
- **Reconciliation disputes**: Disagreements on consumption
- **Collection risk**: Customer disputes or delayed payment

{{< callout type="warning" >}}
**Key Success Factor**: Accurate, reliable usage tracking and regular reconciliation. Poor tracking leads to disputes, supplier distrust, and potential termination of arrangement.
{{< /callout >}}

---

## Best Practices

### For Purchasing

1. **Negotiate favorable terms**: Price, risk allocation, minimums
2. **Clear agreement**: Document all terms in written contract
3. **Reliable suppliers only**: Strong relationship and trust required
4. **Monitor performance**: Supplier's replenishment responsiveness
5. **Regular review**: Periodically review if consignment still beneficial

### For Warehouse

1. **Strict segregation**: Keep consignment stock physically separate
2. **Clear labeling**: Label all consignment stock clearly
3. **Accurate tracking**: Record all issues immediately
4. **Regular counts**: Frequent physical verification
5. **Secure storage**: Prevent theft, damage, mixing

### For Accounts Payable

1. **Monthly reconciliation**: Before processing invoice
2. **Match consumption**: Verify against your records
3. **Query discrepancies**: Resolve before payment
4. **Timely payment**: Pay per terms to maintain relationship
5. **Proper accounting**: Use correct consignment accounts

### Key Success Factors

1. **Robust system**: Automated tracking of consignment transactions
2. **Accurate data**: Real-time, accurate consumption recording
3. **Regular communication**: Frequent supplier contact
4. **Clear ownership**: Everyone understands stock ownership
5. **Mutual trust**: Both parties committed to arrangement success

---

## Performance Metrics

Track consignment effectiveness:

| Metric | Purpose | Target |
|--------|---------|--------|
| **Consignment turnover** | How fast stock is used | > 6x per year |
| **Reconciliation variance %** | Tracking accuracy | < 2% |
| **Stock-out incidents** | Supplier replenishment performance | 0 per month |
| **Dispute resolution time** | Relationship health | < 3 days |
| **Cash flow benefit** | Financial impact | Calculate savings |

---

## Terminating Consignment Arrangements

### Planned Termination

When ending consignment by mutual agreement:

1. **Provide notice** per agreement (e.g., 90 days)
2. **Stop new receipts**: No new consignment stock
3. **Consume existing stock**: Use remaining inventory
4. **Final reconciliation**: Full stock take and settlement
5. **Return unused stock**: Per agreement terms
6. **Final invoice**: Process last consumption invoice
7. **Close accounts**: Clear all consignment records

### Forced Termination

If terminating due to issues:

1. **Document problems**: Performance issues, disputes
2. **Provide formal notice**: Legal notice of termination
3. **Conduct physical count**: Joint count if possible
4. **Dispute resolution**: Negotiate settlement
5. **Legal action**: If cannot resolve amicably

---

## Related Documentation

### Workflows
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - Regular purchasing process
- [Invoice-First Workflow](/guides/purchasing-guides/invoice-first-workflow) - Prepayment scenarios

### Daily Operations
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note) - GRN procedures
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing) - Invoice handling

### Module Documentation
- [Purchasing Module](/modules/purchasing/) - Complete purchasing features
- [Inventory Module](/modules/inventory/) - Inventory management
- [Supplier Maintenance](/applets/supplier-maintenance-applet/) - Supplier setup

{{< callout type="success" >}}
**Workflow Mastery**: Consignment purchasing provides significant cash flow and risk benefits when implemented with strong usage tracking, regular reconciliation, and clear supplier agreements.
{{< /callout >}}
