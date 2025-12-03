---
title: "Purchase Invoice Processing"
description: "Complete guide to matching supplier invoices with POs and GRNs, handling variances, and processing payments"
weight: 13
---

Master the critical process of matching supplier invoices to purchase orders and goods receipts, ensuring accurate payments and financial records.

## What is Invoice Processing?

Purchase invoice processing involves:
- Receiving supplier invoices
- Matching invoices to POs and GRNs (three-way matching)
- Verifying quantities, prices, and calculations
- Resolving discrepancies
- Obtaining approvals
- Posting to accounts payable
- Scheduling payment

{{< callout type="info" >}}
**Why Three-Way Matching?**: Matching PO (what you ordered), GRN (what you received), and Invoice (what you're being charged) prevents overpayment, duplicate payments, and fraud.
{{< /callout >}}

## Before You Start

### Prerequisites
- [ ] Supplier invoice received
- [ ] PO exists (for standard purchases)
- [ ] GRN completed (for goods purchases)
- [ ] Supporting documents available
- [ ] Your user account has invoice processing permission

### What You Need
- Supplier's invoice (original)
- PO number (usually on invoice)
- GRN number (if goods receipt)
- Calculator for verification
- Access to previous invoices for comparison

### Estimated Time
- **Clean match** (invoice matches PO/GRN exactly): 5-10 minutes
- **With variances** (discrepancies to resolve): 20-60 minutes
- **Service invoice** (no PO/GRN): 10-15 minutes

---

## Invoice Receipt

### Step 1: Receive and Log Invoice

**Invoice arrival channels**:

**Email** (most common):
- Save PDF to designated folder
- Forward to AP inbox
- Note receipt date

**Mail/Post**:
- Open mail
- Date stamp invoice
- Scan immediately
- Forward physical copy to filing

**Supplier Portal**:
- Download PDF from portal
- Save to invoice folder
- Mark as downloaded

**Hand Delivery**:
- Get acknowledgment from deliverer
- Scan or process immediately

**Initial Log**:
When invoice arrives:
1. Log in receiving register or system
2. Note: Date received, supplier, invoice number, amount
3. Assign to processor
4. Set due date reminder

### Step 2: Initial Invoice Validation

**Quick checks before processing**:

**Valid Tax Invoice Requirements**:
- [ ] Supplier name and address
- [ ] Tax registration number (if VAT/GST invoice)
- [ ] Unique invoice number
- [ ] Invoice date
- [ ] Your company name (not another customer!)
- [ ] Description of goods/services
- [ ] Quantity and price
- [ ] Tax calculation shown separately
- [ ] Total amount
- [ ] Payment terms
- [ ] Supplier bank details (for payment)

**Red Flags**:
- ❌ Duplicate invoice number (check previous invoices)
- ❌ Wrong company name (might be for different entity)
- ❌ Suspiciously low/high amount
- ❌ Bank account different from usual (fraud risk)
- ❌ Invoice date in future
- ❌ Poor quality/unprofessional format
- ❌ Tax calculations incorrect

{{< callout type="warning" >}}
**Fraud Alert**: If bank account suddenly changes on invoice, CALL the supplier (don't email!) using known phone number to verify. Invoice email fraud is common.
{{< /callout >}}

**If Invoice Fails Validation**:
1. Hold invoice, don't process
2. Contact supplier for clarification/correction
3. Document issue in system
4. Wait for corrected invoice

---

## Processing Standard Invoice (With PO and GRN)

### Step 3: Navigate and Start Invoice Entry

**Navigation**: `[Purchasing > Purchase Invoices > New Invoice]`

**Or**: `[Accounts Payable > Supplier Invoices > New]`

**Select Invoice Type**:
- **Against PO**: Standard invoice (most common)
- **Against GRN**: Direct match to goods receipt
- **Without PO/GRN**: Service invoice (direct entry)

**For Standard Invoice**:
1. Click **New Invoice** or **New Purchase Invoice**
2. Select **Against Purchase Order** or **Against GRN**
3. Continue to next step

### Step 4: Enter Invoice Header

**Document Information**:
- **Invoice Number**: Enter exactly as on supplier invoice
  - System checks for duplicates
  - If duplicate warning: Verify not already processed
- **Invoice Date**: Date on invoice (not received date)
- **Received Date**: When you received it (auto-fills to today)
- **Due Date**: Calculated from invoice date + payment terms
  - Or manual entry if due date stated on invoice
- **GL Date**: Accounting period to record expense
  - Usually same as invoice date
  - Change for period-end adjustments

**Supplier Information**:
- **Supplier**: Start typing name, select from dropdown
  - System auto-fills supplier details
- **Currency**: Auto-filled from supplier/invoice
  - Change if invoice in different currency
- **Exchange Rate**: If foreign currency
  - System uses current rate
  - Override if invoice shows specific rate

**Reference Information**:
- **PO Number**: Select PO this invoice is for
  - Search by PO number
  - Or search by supplier and date range
- **GRN Number**: Select GRN if matching to GRN
  - May auto-populate from PO
  - Or select manually
- **Supplier Reference**: Their reference from invoice
- **Your Reference**: Internal reference if needed

{{< callout type="tip" >}}
**Quick Find PO**: If PO number is on invoice (usually is), use PO search. Fastest method to find correct PO.
{{< /callout >}}

### Step 5: Match Invoice to PO/GRN (Three-Way Matching)

**System displays**:
- PO lines (what you ordered)
- GRN lines (what you received)
- Invoice entry fields (what you're being charged)

**For each line item**:

#### Review PO and GRN Information
```
Purchase Order:
Item A: 100 units @ $10.00 = $1,000

Goods Receipt:
Item A: 95 units received (5 short)

Expected Invoice:
Item A: 95 units @ $10.00 = $950
```

#### Enter Actual Invoice Information

**Invoice Line Fields**:
- **Item**: Auto-filled from PO/GRN
- **Description**: Auto-filled, verify matches invoice
- **Quantity**: Enter quantity on invoice
- **Unit Price**: Enter price on invoice
- **Amount**: Auto-calculated (Qty × Price)
- **Tax Code**: Auto-filled, verify correct
- **Tax Amount**: Enter tax amount from invoice

**System Performs Matching**:

**Compares**:
1. **PO vs Invoice**: Ordered price vs invoiced price
2. **GRN vs Invoice**: Received quantity vs invoiced quantity
3. **PO vs GRN**: Ordered vs received (already known)

**Matching Scenarios**:

**Clean Match** ✓:
```
PO: 100 @ $10 = $1,000
GRN: 100 received
Invoice: 100 @ $10 = $1,000
Status: Clean match, no variance
```

**Quantity Variance** ⚠:
```
PO: 100 @ $10 = $1,000
GRN: 95 received (5 short)
Invoice: 100 @ $10 = $1,000
Issue: Invoice for 100 but only received 95
```

**Price Variance** ⚠:
```
PO: 100 @ $10.00 = $1,000
GRN: 100 received
Invoice: 100 @ $11.50 = $1,150
Issue: Price increased $1.50/unit = $150 total
```

**Amount Variance** ⚠:
```
PO: 100 @ $10 = $1,000
GRN: 100 received
Invoice: 95 @ $10 = $950 (correct)
         + Freight $200 (not on PO)
         Total: $1,150
Issue: Additional freight charge
```

### Step 6: Handle Variances

**System flags variances**:
- Red/yellow highlights
- Variance report
- Tolerance check (within acceptable range?)

#### Quantity Variance Resolution

**Scenario**: Invoice 100 units, GRN shows 95 received

**Actions**:
1. **Verify GRN is correct**: Check physical receipt records
2. **Check if partial delivery**: Is balance still coming?
3. **Contact supplier**:
   - "We received 95, your invoice shows 100"
   - Request revised invoice for 95, OR
   - Confirm balance is coming (wait for second GRN)
4. **Resolution options**:
   - **Wait**: For revised invoice
   - **Adjust**: Enter 95 on invoice (with approval)
   - **Hold**: Until balance delivered and second GRN created
5. **Document**: Note in invoice remarks why adjusted

#### Price Variance Resolution

**Scenario**: PO price $10, invoice price $11.50

**Actions**:
1. **Check PO**: Verify PO price is correct
2. **Check quotation**: What was quoted price?
3. **Contact purchasing**:
   - Was price increase authorized?
   - Did supplier notify of increase?
   - Is there a contract locking price?
4. **Contact supplier** if unauthorized increase
5. **Resolution options**:
   - **Reject invoice**: Request invoice at PO price
   - **Accept with approval**: Get manager approval for increase
   - **Negotiate**: Split the difference
   - **Return goods**: If significant increase and unacceptable
6. **Document**: Approval for price variance

{{< callout type="info" >}}
**Tolerance Levels**: Many systems have tolerance thresholds:
- ±2% or $50 (whichever lower): May auto-approve
- ±5% or $200: Requires supervisor approval
- >5% or >$200: Requires manager approval
Check your company's tolerance policy.
{{< /callout >}}

#### Additional Charges (Freight, Handling, etc.)

**Scenario**: Invoice includes $200 freight not on PO

**Actions**:
1. **Check delivery terms**:
   - FOB: Freight should be on invoice
   - Delivered: Freight should be included in unit price
2. **Verify charge is legitimate**:
   - Check delivery documents
   - Typical for this supplier/route?
   - Amount reasonable?
3. **Options**:
   - **Accept**: If legitimate and reasonable (get approval if needed)
   - **Query**: If unclear or seems high
   - **Reject**: If not per agreement
4. **How to enter**:
   - Add separate line item for freight
   - G/L Account: Freight-In or add to purchase cost
   - Get approval if required

### Step 7: Verify Tax Calculation

**Tax Verification Steps**:

**1. Check Tax Rate**:
```
Item Category: Standard rated goods
Expected Tax Rate: 18% (example)
Invoice Tax Rate: Should be 18%
```

**2. Verify Tax Calculation**:
```
Subtotal: $1,000
Tax (18%): $180
Total: $1,180

Manual check: $1,000 × 0.18 = $180 ✓
```

**3. Check Tax Treatment**:
- **Standard rated**: Normal VAT/GST rate
- **Zero-rated**: 0% rate (should show on invoice)
- **Exempt**: No tax (invoice shouldn't show tax)

**Common Tax Issues**:

**Issue**: Tax amount doesn't match calculation
**Fix**: Check if rounding, or contact supplier

**Issue**: Wrong tax rate applied
**Fix**: Contact supplier for corrected invoice

**Issue**: Tax on exempt items
**Fix**: Query with supplier, should not be taxed

**Issue**: Mixed tax rates on invoice
**Fix**: Verify each item's tax treatment separately

{{< callout type="warning" >}}
**Tax Compliance**: Incorrect tax invoices mean you can't claim input tax credit. Ensure invoice meets tax requirements before processing.
{{< /callout >}}

### Step 8: Attach Supporting Documents

**Navigation**: Click **Attachments** tab

**Required Documents**:

**1. Supplier Invoice** (PDF or scan):
- Original tax invoice
- All pages
- Clear and legible

**2. Purchase Order**:
- Usually already attached to PO in system
- If not, attach copy

**3. Goods Received Note**:
- Usually linked in system
- If physical process, attach copy

**4. Correspondence** (if applicable):
- Email approvals for variances
- Supplier responses to queries
- Manager approvals for exceptions

**Upload Process**:
1. Click **Add Document**
2. Select file (PDF, image, email)
3. Choose document type: "Supplier Invoice"
4. Add description: "Tax invoice INV-12345"
5. Upload
6. Repeat for additional documents

### Step 9: Review Invoice Totals

**Before submitting, verify**:

**Calculations Check**:
```
Line items subtotal: $2,000
Freight/charges: $200
Subtotal: $2,200
Tax (18%): $396
Invoice Total: $2,596
```

**Compare to Physical Invoice**:
- [ ] Subtotal matches
- [ ] Tax amount matches
- [ ] Total amount matches exactly
- [ ] Currency is correct
- [ ] All line items entered

**If Totals Don't Match**:
1. Recheck each line item
2. Verify tax calculation
3. Check for missing lines
4. Check for additional charges
5. Compare to invoice line-by-line

---

## Approval Workflow

### Step 10: Submit for Approval

**When ready**:
1. Click **Submit for Approval**
2. System validates:
   - All required fields complete
   - Invoice total entered
   - Tax calculations reasonable
   - Matching status (within tolerance or approved)
   - Documents attached
3. Fix any validation errors
4. Confirm submission

**System Routes Invoice**:

Based on:
- Invoice amount
- Variance percentage
- Matching status
- Expense type
- Your approval limits

**Approval Hierarchy Example**:

| Situation | Approver | Typical Time |
|-----------|----------|--------------|
| Clean match < $5,000 | Auto-approved or Supervisor | Same day |
| Clean match > $5,000 | Manager | 1 day |
| Variance < 5% | Supervisor | 1 day |
| Variance 5-10% | Manager | 2 days |
| Variance > 10% | Senior Manager | 3-5 days |
| Price increase | Purchasing Manager | 2 days |

**Notification**:
- Approver receives email/system notification
- You receive confirmation of submission
- Status changes to: Pending Approval

### Step 11: Track Approval Status

**Navigation**: `[Purchasing > Purchase Invoices > My Invoices]`

or `[Accounts Payable > Invoice Status]`

**Status Meanings**:
- **Pending Approval**: With approver, awaiting decision
- **Approved**: Approved, ready to post
- **Rejected**: Rejected, see comments
- **Query**: Approver has questions
- **On Hold**: Temporarily held

**If Invoice is Queried or Rejected**:

**Actions**:
1. Read approver's comments
2. Understand the issue
3. Take corrective action:
   - Get more information
   - Contact supplier
   - Correct data entry error
   - Get additional approvals
4. Respond to approver or resubmit

**Common Rejection Reasons**:
- Price variance not explained
- Missing supporting documents
- Duplicate invoice
- Invoice for wrong company
- Service not confirmed received
- Budget not available

---

## Posting Invoice

### Step 12: Post Approved Invoice

**Once approved**:

**Navigation**: Open approved invoice

**Final Review**:
- [ ] All approvals received
- [ ] Documents attached
- [ ] Amounts correct
- [ ] GL date correct for period
- [ ] Tax treatment correct

**Post Invoice**:
1. Click **Post Invoice** or **Confirm Invoice**
2. System processes
3. Accounting entries created
4. Payable recorded
5. Payment scheduled

**Accounting Entries Created**:

**For Inventory Purchase**:
```
Debit: Inventory                      $1,000
Debit: Freight-In                        $200
Debit: Input Tax                         $216
Credit: Accounts Payable - Supplier            $1,416
```

**For Expense Purchase**:
```
Debit: Office Supplies Expense        $500
Debit: Input Tax                        $90
Credit: Accounts Payable - Supplier            $590
```

**Invoice Status Updates**:
- Status: Posted/Confirmed
- Payable amount: Recorded
- Due date: Active for payment
- Supplier account: Balance increased

### Step 13: Schedule Payment

**System automatically**:
- Adds to payment due list
- Calculates due date
- Flags for payment run

**Payment will be processed**:
- On or before due date
- As part of payment batch
- Per payment terms

**Early Payment Discount**:
If invoice has discount terms (e.g., 2/10 Net 30):
- System flags for early payment
- Calculates discount amount
- Schedules for discount date if possible

{{< callout type="tip" >}}
**Payment Terms**: "2/10 Net 30" means:
- 2% discount if paid within 10 days
- Full amount due in 30 days
- 2% for 20 days = 36% annual return!
- Usually worth paying early to capture discount.
{{< /callout >}}

---

## Processing Service Invoices (No PO/GRN)

### For Services, Utilities, Subscriptions

**Navigation**: `[Accounts Payable > Purchase Invoices > New Direct Invoice]`

**Process**:

**1. Enter Invoice Header**:
- Invoice number, date, due date
- Supplier
- Currency
- Reference

**2. Enter Line Items**:
- Description: Clear service description
- Quantity: Usually 1, or hours/days
- Unit price
- Tax code
- **G/L Account**: Expense account (Critical!)
- **Cost Center**: Department
- **Project**: If applicable

**3. Service Verification**:
Before processing:
- [ ] Service was actually received
- [ ] Service recipient confirms satisfactory
- [ ] Amount matches agreement/quotation
- [ ] No duplicate invoice

**4. Attach Documents**:
- Supplier invoice
- Service agreement/contract
- Service completion certificate (if applicable)
- Approval email

**5. Submit for Approval**:
- Routes to service recipient and manager
- Approvers verify service received
- Standard approval workflow

**6. Post When Approved**:
- Creates expense and payable
- Schedules payment

{{< callout type="info" >}}
**Service Invoice Key Difference**: No PO or GRN to match against. Rely on service confirmation from recipient. Always get confirmation before paying!
{{< /callout >}}

---

## Special Scenarios

### Credit Notes (Returns/Adjustments)

**When supplier issues credit note**:

**Scenario**: Returned damaged goods, supplier credits you

**Process**:
1. **Receive credit note** from supplier
2. **Create credit note** in system:
   - Navigation: `[Purchasing > Credit Notes > New]`
   - Type: Purchase credit note
3. **Link to original invoice** (if crediting specific invoice)
4. **Enter credit details**:
   - Items being credited
   - Quantities
   - Amounts
   - Reason
5. **Attach documents**:
   - Supplier's credit note
   - Return authorization
   - Correspondence
6. **Submit for approval**
7. **Post credit note**:
   - Reduces payable
   - Can offset against future invoices
   - Or request refund

**Accounting Entry**:
```
Debit: Accounts Payable              $200
Credit: Inventory (or Expense)              $180
Credit: Input Tax                             $20
```

### Duplicate Invoice

**Scenario**: Supplier sends same invoice twice

**Prevention**:
- System checks invoice number for duplicate
- Warning message if duplicate found

**If Detected**:
1. **Verify**: Is it truly duplicate?
   - Same invoice number
   - Same date
   - Same amount
2. **Check**: Was original already paid?
3. **Action**:
   - If duplicate: Reject, don't process
   - If revised: Process as revision, note reference to original
4. **Inform supplier**: "Invoice already processed, payment scheduled for [date]"

### Consolidated Invoice (Multiple Deliveries)

**Scenario**: One invoice covering multiple GRNs

**Process**:
1. **Enter invoice** as usual
2. **Link to multiple GRNs**:
   - System may allow multiple GRN selection
   - Or enter lines manually matching each GRN
3. **Verify totals** match all GRNs combined
4. **Process normally**

### Partial Invoice Payment

**Scenario**: Dispute on part of invoice, want to pay undisputed portion

**Process**:
1. **Create partial payment**:
   - Note disputed amount
   - Calculate payable portion
2. **Hold disputed portion**:
   - Create debit note or adjustment
3. **Communicate with supplier**:
   - Explain partial payment
   - Provide remittance showing breakdown
4. **Resolve dispute**:
   - Process balance when resolved
   - Or issue debit note if not owed

---

## Best Practices

### Do's
- ✅ Process invoices within 1-2 days of receipt
- ✅ Always verify three-way match
- ✅ Investigate all variances before approving
- ✅ Attach all supporting documents
- ✅ Verify tax calculations
- ✅ Communicate with suppliers about issues
- ✅ Document resolutions clearly
- ✅ File physical invoices systematically

### Don'ts
- ❌ Process invoices without checking for duplicates
- ❌ Ignore price variances
- ❌ Pay before goods/services received
- ❌ Assume bank account details are correct (verify changes)
- ❌ Rush through invoice entry
- ❌ Skip service confirmations
- ❌ Process invoices with errors
- ❌ Create invoices for unconfirmed goods

{{< callout type="success" >}}
**Quality Over Speed**: Taking 10 minutes to process invoice correctly prevents days of work fixing errors and recovering overpayments.
{{< /callout >}}

---

## Tips for Efficiency

### Batch Processing
- Process all invoices from one supplier together
- Group similar invoices (all clean matches first)
- Set aside complex invoices for dedicated time
- Don't mix invoice processing with other tasks

### Use Technology
- Scan invoices immediately upon receipt
- Use OCR for data extraction
- Mobile apps for approvals
- Automated matching where available
- Email-to-system integration

### Maintain Files
- Organize by supplier or invoice date
- Separate: Pending, Processing, Approved, Paid
- Digital folder structure mirrors physical
- Regular cleanup of old files

### Communication
- Establish supplier contacts for invoice queries
- Template emails for common queries
- Regular reconciliation meetings with key suppliers
- Proactive communication on payment status

---

## Monthly Tasks

### Month-End Procedures

**Before closing month**:
- [ ] All invoices received processed
- [ ] All GRNs have been invoiced or accrued
- [ ] Reconcile supplier statements
- [ ] Review aged payables
- [ ] Process credit notes
- [ ] Accrue for goods received but not invoiced
- [ ] Review open POs for commitments

**Accruals for GRBNI** (Goods Received But Not Invoiced):
```
For GRNs without invoices at month-end:

Debit: Inventory/Expense         $5,000
Credit: GRN Accrual                      $5,000

(Reverses next month when invoice received)
```

---

## Troubleshooting

### Error: "Duplicate Invoice Number"

**Cause**: Invoice number already in system
**Fix**:
1. Search for existing invoice
2. Verify if truly duplicate
3. If duplicate: Reject new invoice
4. If different: Check if supplier reused number (contact them)

### Error: "Cannot Match to GRN"

**Cause**: GRN not completed or not found
**Fix**:
1. Verify GRN exists in system
2. Check if goods actually received
3. Contact warehouse to complete GRN
4. Wait for GRN before processing invoice

### Error: "Tax Calculation Error"

**Cause**: Tax amount doesn't match system calculation
**Fix**:
1. Check tax rate is correct
2. Verify tax treatment (standard, zero, exempt)
3. Check for rounding differences
4. Manually override if necessary (with approval)

### Error: "Budget Exceeded"

**Cause**: Invoice exceeds available budget
**Fix**:
1. Verify correct budget code
2. Check budget availability
3. Request budget increase if legitimate
4. Get approval to proceed over budget

---

## Related Documentation

### Workflows
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - Complete purchasing process
- [Direct Invoice Workflow](/guides/purchasing-guides/direct-invoice-workflow) - Service invoices
- [Purchasing Overview](/user-guide/daily-tasks/purchasing-overview) - Daily tasks guide

### Related Tasks
- [Creating Purchase Orders](/user-guide/daily-tasks/creating-purchase-order) - PO creation
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note) - GRN procedures

### Module Documentation
- [Purchasing Module](/modules/purchasing/) - All purchasing features
- [Financial Accounting Module](/modules/financial-accounting/) - AP and payments
- [Supplier Maintenance](/applets/supplier-maintenance-applet/) - Supplier management

{{< callout type="success" >}}
**Mastery Milestone**: When you can process invoices accurately, quickly identify and resolve variances, and maintain excellent supplier relationships, you've mastered invoice processing!
{{< /callout >}}
