---
title: "Direct GRN Workflow"
description: "Skip purchase orders and go directly to goods receipt - ideal for walk-in purchases, urgent deliveries, and local supplier transactions"
weight: 20
---

The Direct GRN Workflow bypasses the purchase order stage and allows you to receive goods directly into inventory. This simplified workflow is perfect for situations where creating a formal PO would slow down operations without adding value.

## When to Use Direct GRN Workflow

This workflow is ideal for:

- **Walk-in purchases** from local suppliers
- **Emergency purchases** requiring immediate delivery
- **Small-value items** below PO threshold
- **Retail store restocking** from known suppliers
- **Regular deliveries** with standing arrangements
- **Local hardware purchases** for immediate needs
- **Emergency repairs** requiring immediate parts

{{< callout type="warning" >}}
**Control Consideration**: Direct GRN bypasses PO approval controls. Set policies for when this workflow can be used and implement retrospective approval for accountability.
{{< /callout >}}

## When NOT to Use This Workflow

Avoid Direct GRN for:

- **High-value purchases** requiring approval
- **First-time suppliers** needing vetting
- **Items requiring competitive quotes**
- **Budget-controlled purchases**
- **Import purchases** requiring advance documentation
- **Capital equipment** needing formal approval

For these situations, use the [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow).

## Process Flow

```
Step 1: Purchase Goods → Step 2: Receive at Warehouse → Step 3: Create GRN → Step 4: Process Invoice → Step 5: Make Payment
    ↓                         ↓                           ↓                  ↓                       ↓
Staff Buys Goods      Physical Delivery           Create Receipt       Match Invoice        Pay Supplier
From Supplier         To Warehouse                In System            To GRN               Per Terms
```

**Key Difference from Standard Flow**: No PO creation or approval before purchase.

---

## Step 1: Purchase Goods from Supplier

**Responsible Role**: Authorized Staff (Purchasing, Warehouse, Maintenance)

### Authorization Requirements

Before making direct purchases:

#### Establish Clear Policies
- **Maximum value**: Per-transaction limit (e.g., $500)
- **Approved suppliers**: List of trusted local suppliers
- **Authorized staff**: Who can make direct purchases
- **Purchase categories**: What can be bought directly (consumables, small tools, emergency parts)
- **Documentation required**: Receipts, quotes, justification

{{< callout type="info" >}}
**Policy Example**: "Staff may make direct purchases up to $500 from approved suppliers for consumables and emergency repairs. All purchases must have original receipt and verbal supervisor approval."
{{< /callout >}}

### Purchasing Process

When making the purchase:

#### 1. Verify Need
- [ ] Item genuinely needed immediately
- [ ] Budget available for purchase
- [ ] Supplier is approved or reputable
- [ ] Price is reasonable

#### 2. Get Verbal Approval
- Contact supervisor or manager
- Explain need and urgency
- Confirm purchase amount
- Get verbal authorization

#### 3. Make Purchase
- **Buy from supplier**
- **Get official receipt/invoice**:
  - Supplier name and details
  - Tax invoice number (if applicable)
  - Date of purchase
  - Item description and quantity
  - Unit price and total
  - Tax amount
- **Keep all documentation**

#### 4. Document Justification
Make notes for later entry:
- Why was direct purchase necessary?
- Why couldn't standard PO process be used?
- Who approved the purchase?
- Business impact if not purchased immediately

### Getting Goods to Warehouse

**If purchased nearby**:
- Transport goods directly to warehouse
- Hand over to warehouse staff with receipt
- Explain purchase reason

**If delivered by supplier**:
- Coordinate delivery time
- Ensure warehouse staff expect delivery
- Provide copy of receipt/invoice in advance

{{< callout type="tip" >}}
**Best Practice**: Take photos of items at purchase point, especially for high-value or critical items. This provides evidence and helps with later documentation.
{{< /callout >}}

---

## Step 2: Receive Goods at Warehouse

**Responsible Role**: Warehouse Staff

### Pre-Receipt Checks

When goods arrive without prior PO:

#### Verify Legitimacy
- [ ] Staff member present to explain purchase
- [ ] Receipt/invoice provided
- [ ] Purchase appears authorized
- [ ] Items look appropriate for business

{{< callout type="warning" >}}
**Red Flags**: If receiving unexpected goods without staff present or documentation, hold items and contact purchasing manager before accepting.
{{< /callout >}}

### Physical Receipt

#### 1. Count and Inspect
- Verify quantity matches receipt
- Check for damage
- Verify items are as described
- Test if applicable (equipment, tools)

#### 2. Quality Check
- Items are correct type/specification
- Items are in good condition
- Packaging intact
- Expiry dates acceptable (if applicable)

#### 3. Documentation
- Collect original receipt/invoice
- Get delivery note if separate delivery
- Take photos if needed
- Note any discrepancies

### Temporary Holding

If immediate GRN entry isn't possible:

1. **Move to receiving area**
2. **Tag items** with:
   - Date received
   - Received by (name)
   - Quantity
   - Temporary holding tag
3. **Store securely**
4. **Create GRN within same day**

{{< callout type="info" >}}
**Control Point**: Items in temporary holding are not yet in inventory system. Process GRN same day to maintain inventory accuracy.
{{< /callout >}}

---

## Step 3: Create GRN in System

**Responsible Role**: Warehouse Staff or Purchasing Admin

### Navigation
`[Purchasing > Goods Receipt > New GRN without PO]`

or

`[Inventory > Goods Receipt > Direct Receipt]`

### GRN Header Information

#### Document Details
- **GRN Number**: Auto-generated
- **GRN Date**: Today's date (or actual receipt date)
- **GRN Type**: Select "Direct GRN" or "Without PO"
- **Receipt Mode**: Walk-in purchase, Emergency, Other

#### Supplier Information
- **Supplier**: Select from supplier master
  - If supplier not in system: Create supplier first or use "Cash Supplier" account
- **Supplier Invoice Number**: From receipt/invoice
- **Supplier Invoice Date**: Date on receipt
- **Reference**: Your internal reference (optional)

#### Purchase Justification
- **Reason Code**: Emergency, Urgent, Small Value, Standing Order
- **Remarks**: Brief explanation
  - Example: "Emergency repair parts for production line breakdown"
- **Approved By**: Name of person who authorized

{{< callout type="tip" >}}
**New Supplier Quick Add**: Many systems allow quick supplier creation during GRN entry for one-time or infrequent suppliers. Use this for walk-in purchases from new suppliers.
{{< /callout >}}

### GRN Line Items

For each item purchased:

#### Item Selection

**If item exists in inventory master**:
1. Click **Add Item**
2. Search and select item code
3. Description auto-fills
4. Proceed to quantity entry

**If item doesn't exist** (new item):
1. Click **Add Non-Stock Item** or **Add New Item**
2. Enter item description
3. Select item category/group
4. Specify if should be added to inventory master
5. Proceed to quantity entry

#### Quantity and Pricing

**Required entries**:
- **Quantity**: Actual quantity received
- **Unit of Measure**: EA, PC, KG, BOX, etc.
- **Unit Price**: Price per unit (from receipt)
- **Currency**: If different from base currency
- **Tax Code**: VAT/GST code
- **Tax Amount**: From receipt or auto-calculated

**Price fields**:
- **Invoice Price**: Price on supplier receipt
- **Actual Cost**: Invoice price minus any immediate discounts
  - Usually same for direct purchases
  - Adjust if discount applied at purchase point

#### Account Coding

Assign expense/asset account:

- **G/L Account**: Expense account
  - Office Supplies
  - Repair & Maintenance
  - Small Tools
  - Emergency Purchases
  - Other Operating Expenses

- **Cost Center**: Department or project
  - Production Department
  - Maintenance
  - Administration
  - Emergency Repairs

- **Project Code**: If purchase for specific project

{{< callout type="info" >}}
**Accounting Impact**: Since there's no PO, the GRN directly creates accounting entries. Ensure G/L account and cost center are correct.
{{< /callout >}}

### Serial Number Entry

For serialized items:

#### When Required
- Electronics (computers, phones, tablets)
- Power tools and equipment
- Instruments and measuring devices
- Items with warranties
- Asset-tagged items

#### Entry Process
1. Click line item
2. Click **Serial Numbers** button
3. **Scan or type** each serial number
4. System validates:
   - No duplicates
   - Correct format
   - Count matches quantity
5. Save serial entries

### Storage Location

Allocate to warehouse locations:

#### Location Assignment
1. Click line item
2. Click **Storage Location**
3. Assign location:
   - **Warehouse**: If multiple warehouses
   - **Zone**: Area in warehouse
   - **Bin/Rack**: Specific location
   - **Quantity**: Items in location

#### Direct to Use
If items for immediate use (not storage):
- **Location**: "Direct Use" or "Consumption"
- **Quantity**: Full quantity
- **Note**: "For immediate use in [purpose]"

{{< callout type="tip" >}}
**Emergency Repairs**: For items purchased for immediate repair use, you can allocate to "Maintenance Consumption" location and issue to job immediately after GRN.
{{< /callout >}}

### Document Attachment

Attach all supporting documents:

#### Required Documents
1. **Supplier Receipt/Invoice**
   - Original tax invoice or receipt
   - Must be clear and readable
   - Scan or photograph

2. **Approval Evidence** (if not in system):
   - Email authorization
   - Approval form
   - Manager's written approval

3. **Additional Documents**:
   - Delivery note (if separate)
   - Photos of items (for high-value)
   - Warranty cards
   - Product manuals

#### Upload Process
1. Click **Attachments** tab
2. For each document:
   - Click **Add Document**
   - Select document type
   - Choose file
   - Add description: "Supplier invoice" or "Purchase approval"
   - Upload
3. Verify all attached before confirming

---

## Step 4: GRN Confirmation and Posting

### Pre-Confirmation Review

Before confirming, verify:

#### Data Accuracy
- [ ] All items entered correctly
- [ ] Quantities match physical count
- [ ] Prices match receipt
- [ ] Tax calculated correctly
- [ ] G/L accounts assigned
- [ ] Serial numbers entered (if applicable)
- [ ] Storage locations assigned

#### Documentation Complete
- [ ] Supplier invoice/receipt attached
- [ ] Approval documented
- [ ] Justification noted
- [ ] Additional docs attached

#### Authorization Check
- [ ] Purchase within policy limits
- [ ] Supplier is approved/acceptable
- [ ] Explanation provided for direct purchase
- [ ] Required approvals obtained

### Confirm and Post GRN

1. **Click Review Summary**
2. **Verify totals**:
   - Total quantity
   - Total value
   - Tax amount
   - Grand total
3. **Click Confirm GRN**
4. **System processes**:
   - Creates GRN document
   - Updates inventory quantities
   - Creates accounting entries
   - Generates notifications
5. **Print GRN** for filing

### Accounting Entries Created

**For inventory items**:
```
Debit: Inventory (at actual cost)        $500
Debit: Input Tax                          $90
Credit: GRN Accrual / Payables                   $590
```

**For expense items** (non-stock):
```
Debit: Expense Account                   $500
Debit: Input Tax                          $90
Credit: GRN Accrual / Payables                   $590
```

{{< callout type="info" >}}
**Accounting Note**: GRN without PO creates accrual until invoice is processed. This ensures expenses are recorded in correct period even if invoice processing is delayed.
{{< /callout >}}

### Post-Confirmation Tasks

1. **File documents**:
   - Print GRN copy
   - Attach physical receipt
   - File in pending invoice folder

2. **Update whiteboard/tracker**:
   - Note GRN number
   - Mark as awaiting invoice
   - Set follow-up date

3. **Notify accounts**:
   - Inform AP that GRN is created
   - Provide GRN number
   - Mention expected invoice

4. **Issue items if needed**:
   - If for immediate use, create issue document
   - Link to GRN for traceability

---

## Step 5: Process Purchase Invoice

**Responsible Role**: Accounts Payable

### Invoice Matching Options

#### Option A: Invoice Same as Receipt

If supplier's receipt serves as tax invoice:

1. **Navigate to GRN**
2. **Click Convert to Invoice**
3. **System creates invoice**:
   - Copies all GRN details
   - Invoice number = Receipt number
   - Invoice date = Receipt date
   - Amount = GRN amount
4. **Review and confirm**
5. **Post invoice**

This is most common for direct purchases where receipt IS the invoice.

#### Option B: Formal Invoice Received Later

If supplier sends separate formal invoice:

**Navigation**: `[Purchasing > Purchase Invoices > New Invoice]`

1. **Invoice Header**:
   - Invoice number (from supplier)
   - Invoice date
   - Supplier
   - **Reference GRN**: Link to GRN

2. **Two-Way Matching**:
   - System compares GRN vs Invoice
   - **GRN**: What you received and recorded
   - **Invoice**: What supplier is charging

3. **Check for Variances**:
   - **Quantity**: Should match (already received)
   - **Price**: Should match receipt
   - **Amount**: Should match GRN total

4. **Handle Variances**:
   - **No variance**: Auto-match and approve
   - **Minor variance**: Document and approve
   - **Major variance**: Contact supplier

{{< callout type="warning" >}}
**Common Issue**: Supplier invoice shows different price than receipt. This happens with:
- Prices including/excluding tax confusion
- Rounding differences
- Additional charges added later
- Receipt price was estimate only
{{< /callout >}}

### Invoice Approval

#### Approval Rules for Direct GRN Invoices

| Situation | Approver | Notes |
|-----------|----------|-------|
| Clean match, within policy | Auto-approve or Supervisor | Standard process |
| No receipt, only invoice | Purchasing Manager | Missing receipt justification |
| Price variance from receipt | AP Manager | Explanation required |
| Over policy limit | Finance Manager | Retrospective approval |

### Posting Invoice

Once approved:

1. **Post invoice** to payables
2. **System creates entries**:
   ```
   Debit: GRN Accrual              $590
   Credit: Accounts Payable               $590
   ```
   (Reverses accrual, creates payable)

3. **Invoice appears** in payment due list
4. **Payment scheduled** per terms

---

## Step 6: Make Payment

**Responsible Role**: Accounts Payable / Treasury

### Payment Processing

Same as standard workflow:

1. **Review due invoices**
2. **Create payment batch**
3. **Generate payment**:
   - Bank transfer
   - Check
   - Cash (if petty cash purchase)
4. **Post payment**
5. **Send remittance advice**

For detailed payment procedures, see [Standard Procurement Workflow - Step 6](/guides/purchasing-guides/standard-procurement-workflow#step-6-make-payment-to-supplier).

### Cash Purchases

If purchased with petty cash:

#### Petty Cash Reimbursement

1. **Staff submits**:
   - Original receipt
   - Petty cash claim form
   - GRN number (for reference)

2. **AP verifies**:
   - Receipt is valid tax invoice
   - GRN exists in system
   - Amount matches

3. **Reimburse staff**:
   - From petty cash
   - Or via payroll

4. **Record in system**:
   - Petty cash payment
   - Linked to invoice/GRN

{{< callout type="tip" >}}
**Cash Control**: Set limits on cash purchases (e.g., max $200 cash). Larger amounts must use company account for better control and audit trail.
{{< /callout >}}

---

## Special Scenarios

### Scenario 1: Walk-In Purchase from Hardware Store

**Situation**: Production machine broke down, need immediate replacement parts.

**Process**:
1. **Maintenance staff**:
   - Gets verbal approval from supervisor
   - Drives to hardware store
   - Purchases parts: $350
   - Gets tax invoice/receipt

2. **Returns to warehouse**:
   - Delivers parts and receipt to warehouse
   - Explains emergency need

3. **Warehouse staff**:
   - Verifies parts match receipt
   - Creates Direct GRN:
     - Supplier: XYZ Hardware
     - Items: List each part
     - Prices: From receipt
     - Reason: "Emergency machine repair"
     - Approved by: Supervisor name
   - Attaches receipt scan
   - Confirms GRN

4. **Immediate use**:
   - Issues parts to maintenance work order
   - Links to machine repair job

5. **Accounts**:
   - Converts GRN to invoice
   - Schedules payment per terms (Net 30)
   - Sends payment to hardware store

**Timeline**: Purchase to inventory in < 2 hours

### Scenario 2: Local Supplier Regular Deliveries

**Situation**: Daily bread delivery to cafeteria, standing arrangement.

**Process**:
1. **Daily delivery**:
   - Supplier delivers bread at 6 AM
   - Leaves delivery note
   - Weekly invoice sent Friday

2. **Cafeteria staff**:
   - Receives goods
   - Counts items
   - Signs delivery note
   - Gives to warehouse

3. **Warehouse (daily)**:
   - Creates Direct GRN for day's delivery
   - Supplier: ABC Bakery
   - Items: From delivery note
   - Location: Cafeteria Inventory
   - Confirms GRN

4. **Accounts (weekly)**:
   - Receives supplier's weekly invoice
   - Matches to week's GRNs
   - Verifies total
   - Posts invoice
   - Pays weekly/monthly per agreement

**Advantage**: Daily inventory accuracy without daily invoicing.

### Scenario 3: Emergency Equipment Rental

**Situation**: Need forklift rental for 1 day due to equipment breakdown.

**Process**:
1. **Warehouse manager**:
   - Contacts rental company
   - Agrees daily rate: $200
   - Company delivers forklift

2. **Receive forklift**:
   - Rental agreement signed
   - Forklift in use

3. **Create Direct GRN**:
   - Supplier: Equipment Rental Co.
   - Item: "Forklift rental - 1 day"
   - Quantity: 1
   - Unit price: $200
   - G/L Account: Equipment Rental Expense
   - Reason: "Emergency - forklift breakdown"
   - Attach rental agreement

4. **Invoice processing**:
   - Rental company sends invoice next day
   - Match to GRN
   - Post and pay

**Note**: For service purchases like rentals, Direct GRN documents receipt of service for expense accrual.

---

## Controls and Compliance

### Control Points

Even without PO approval, maintain controls:

#### 1. Policy Limits
- **Value limits**: Per transaction and per period
- **Category restrictions**: What can be bought directly
- **Supplier restrictions**: Approved suppliers only

#### 2. Retrospective Review
- **Daily review**: All direct GRNs by supervisor
- **Weekly review**: Summary by manager
- **Monthly analysis**: Spend patterns, policy compliance

#### 3. Documentation Requirements
- **Mandatory receipt**: No receipt = no GRN
- **Justification**: Why direct purchase was necessary
- **Approval trail**: Who authorized purchase

#### 4. Segregation of Duties
- **Purchaser**: Cannot approve own GRN
- **Receiver**: Must be different from purchaser
- **Processor**: AP separate from purchasing/receiving

{{< callout type="warning" >}}
**Audit Risk**: Direct purchases bypass normal controls. Compensate with strong retrospective review and clear accountability.
{{< /callout >}}

### Compliance Checklist

Before closing month:

- [ ] All direct purchases have receipts attached
- [ ] All direct GRNs have justification
- [ ] All approvals documented
- [ ] Policy limits not exceeded
- [ ] Supplier tax invoices valid
- [ ] Expenses coded to correct accounts
- [ ] No duplicate entries
- [ ] All invoices matched to GRNs

### Reporting and Analysis

Track direct purchase metrics:

| Metric | Purpose | Action Threshold |
|--------|---------|------------------|
| **Direct GRN value %** | Monitor use of simplified process | > 10% of total purchases |
| **Average direct GRN value** | Ensure within policy | > $500 per transaction |
| **Direct GRNs per user** | Identify heavy users | > 10 per month |
| **Direct GRNs without receipt** | Documentation compliance | Any occurrence |
| **Emergency purchases** | Analyze if genuinely emergency | > 5 per month |

---

## Advantages and Limitations

### Advantages

**Speed**:
- No PO approval wait time
- Goods available immediately
- Emergency needs addressed quickly

**Simplicity**:
- Fewer steps
- Less paperwork
- Faster processing

**Flexibility**:
- Handle irregular purchases
- Support walk-in buying
- Accommodate last-minute needs

**Practicality**:
- Matches real-world situations
- Suits small local purchases
- Reduces administrative burden

### Limitations

**Reduced Control**:
- No pre-approval of spend
- Harder to enforce budgets
- Risk of unauthorized purchases

**Less Visibility**:
- No advance notice of commitment
- Harder to track pending spend
- Cash flow forecasting gaps

**Audit Challenges**:
- Retrospective justification harder
- Risk of missing documentation
- More manual review needed

**Risk of Misuse**:
- Personal purchases disguised as business
- Favoring certain suppliers without quotes
- Circumventing normal approval processes

{{< callout type="info" >}}
**Balance Required**: Use Direct GRN for genuine operational needs, but maintain policies and reviews to prevent misuse. Most organizations should have >90% of spend through standard PO process.
{{< /callout >}}

---

## Best Practices

### For Staff Making Direct Purchases

1. **Always get approval** before purchase (even if verbal)
2. **Get proper tax invoice** at time of purchase
3. **Keep all documentation** together
4. **Deliver to warehouse** same day
5. **Explain urgency** clearly for retrospective review

### For Warehouse Staff

1. **Process GRN same day** as receipt
2. **Verify with purchaser** if unexpected delivery
3. **Check receipt matches goods** received
4. **Attach documentation** before confirming
5. **Alert manager** if something seems irregular

### For Accounts Payable

1. **Match invoice to GRN** within 1 day
2. **Verify receipt attached** (no receipt = query)
3. **Check justification** is reasonable
4. **Flag policy breaches** for review
5. **Process payment** per normal terms

### For Managers

1. **Review daily** all direct GRNs
2. **Question unusual** purchases
3. **Enforce policies** consistently
4. **Analyze patterns** monthly
5. **Adjust policies** based on actual needs

---

## Transitioning from Direct GRN

When to move to Standard Procurement:

### Indicators for Change

**Move to Standard PO if**:
- Same supplier being used frequently (>5 times/month)
- Regular predictable needs
- Value increasing significantly
- Need better price negotiation
- Budget control becoming important

**Example Transition**:
- **Month 1-3**: Direct GRN for office supplies from local supplier
- **Month 4**: Realize spending $2,000/month
- **Action**: Negotiate monthly contract, implement blanket PO
- **Result**: Better pricing, controlled budget, maintained convenience

---

## Related Documentation

### Similar Workflows
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - Full PO process
- [Direct Invoice Workflow](/guides/purchasing-guides/direct-invoice-workflow) - Skip GRN too

### Daily Operations
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note) - Detailed GRN procedures
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing) - Invoice matching

### Setup and Configuration
- [Purchasing Module](/modules/purchasing/) - Module overview
- [Inventory Module](/modules/inventory/) - Stock management
- [Supplier Maintenance](/applets/supplier-maintenance-applet/) - Supplier setup

{{< callout type="success" >}}
**Workflow Mastery**: Direct GRN provides operational flexibility for immediate needs while maintaining inventory accuracy and financial control through proper documentation and retrospective review.
{{< /callout >}}
