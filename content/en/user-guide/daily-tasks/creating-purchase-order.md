---
title: "Creating Purchase Orders"
description: "Step-by-step guide to creating purchase orders - from supplier selection to approval and transmission"
weight: 11
---

Learn how to create accurate, complete purchase orders that ensure smooth procurement and delivery.

## Before You Start

### What You Need
- [ ] Supplier is set up in system
- [ ] Items exist in inventory master (or will create as non-stock)
- [ ] Quotation from supplier
- [ ] Budget approval (if required)
- [ ] Delivery address confirmed
- [ ] Your user account has PO creation permission

### Estimated Time
- **Simple PO** (1-3 items, known supplier): 5-10 minutes
- **Complex PO** (multiple items, new supplier): 15-30 minutes

{{< callout type="info" >}}
**Quick Tip**: Gather all information before starting. Having the quotation, item details, and delivery requirements ready makes PO creation much faster.
{{< /callout >}}

---

## Step-by-Step Instructions

### Step 1: Navigate to PO Creation

**Path**: `[Purchasing > Purchase Orders > New PO]`

**Or**: Use quick create button (+ icon) > "Purchase Order"

### Step 2: Fill PO Header

#### Required Fields

**Supplier Information**:
- **Supplier**: Start typing supplier name, select from dropdown
  - If supplier not found: Create supplier first via Master Data > Suppliers
- **Supplier Contact**: Select contact person (usually auto-filled)
- **Currency**: Auto-filled from supplier master, change if needed

**Document Information**:
- **PO Number**: Usually auto-generated (leave blank for auto)
  - Manual entry: Only if required by your process
- **PO Date**: Defaults to today (change if backdating authorized)
- **Required Date**: When you need the goods delivered
  - Tip: Add buffer for supplier lead time + shipping

**Delivery Details**:
- **Delivery Address**: Your warehouse/receiving location
  - Click dropdown to select different location if needed
- **Delivery Instructions**: Special delivery requirements
  - Example: "Deliver to Loading Bay 2, after 2 PM"

#### Optional Fields

**Terms and Conditions**:
- **Payment Terms**: Auto-filled from supplier (e.g., Net 30)
- **Delivery Terms**: Incoterms (EXW, FOB, CIF, etc.)
- **Freight Terms**: Who pays shipping
- **Tax Treatment**: Standard, zero-rated, exempt

**Reference Information**:
- **Your Reference**: Internal reference (requisition number, project code)
- **Buyer Name**: Your name (usually auto-filled)
- **Department**: Your department
- **Remarks**: Any special notes for supplier

{{< callout type="tip" >}}
**Delivery Date Tip**: Set required date realistically. Allow time for:
- Supplier processing: 1-2 days
- Production/packing: Per item lead time
- Shipping: Ground 3-7 days, Sea 30-60 days, Air 3-5 days
- Buffer for delays: Add 10-20%
{{< /callout >}}

### Step 3: Add Line Items

Click **Add Line Item** or **Add Item** button

#### For Inventory Items (Existing in System)

**Item Selection**:
1. Click in **Item Code** field
2. Start typing item code or description
3. Select from dropdown
4. Description and details auto-fill

**Quantity and Pricing**:
- **Quantity**: Enter quantity needed
- **Unit of Measure**: Auto-filled (EA, PC, KG, etc.)
  - Change if ordering in different UOM
- **Unit Price**: Enter price from quotation
- **Currency**: Inherited from header
- **Discount %**: If applicable
- **Tax Code**: Auto-filled based on item and supplier
  - Change if different treatment for this purchase

**Additional Details**:
- **Required Date**: Line-specific delivery date (if different from header)
- **G/L Account**: Expense or inventory account
  - For inventory items: Usually auto-filled
  - For expense items: Select appropriate account
- **Cost Center**: Department or cost center
- **Project Code**: If purchase for specific project
- **Line Notes**: Special instructions for this item

#### For Non-Stock Items (Services, One-time Purchases)

**Item Entry**:
1. Click **Add Non-Stock Item** or toggle item type
2. **Description**: Enter full description
   - Example: "Consulting services - system implementation"
3. **Quantity**: Enter quantity (often 1 for services)
4. **Unit of Measure**: Select appropriate (EA, HR, DAY, etc.)
5. **Unit Price**: Enter price
6. **Tax Code**: Select appropriate tax treatment
7. **G/L Account**: Select expense account
   - Professional Fees, Consulting, Repairs, etc.
8. **Cost Center**: Department
9. **Project**: If applicable

{{< callout type="warning" >}}
**Common Mistake**: Forgetting to assign G/L account for non-stock items. This will cause issues later when processing invoices.
{{< /callout >}}

#### Price Fields: Invoice Price vs. Actual Cost

**Why two price fields?**
- **Invoice Price**: What appears on supplier's invoice
- **Actual Cost**: Real cost after rebates and discounts

**When they differ**:
```
Example 1: Volume Rebate
Invoice Price: $100
Volume Rebate: -$5 (paid quarterly)
Actual Cost: $95

Example 2: Payment Discount
Invoice Price: $100
Early Payment Discount: -$2 (if paid within 10 days)
Actual Cost: $98 (if taking discount)

Example 3: Year-End Rebate
Invoice Price: $100
Year-End Rebate: -$3 (paid annually)
Actual Cost: $97
```

**How to enter**:
1. Always enter **Invoice Price** as supplier's quoted price
2. Enter **Actual Cost** if you know rebates/discounts apply
3. If unsure, enter same value for both
4. Finance team will adjust later based on rebate agreements

### Step 4: Attach Supporting Documents

Click **Attachments** tab or **Add Document** button

#### Required Documents

**Supplier Quotation**:
- **Type**: Select "Quotation"
- **File**: Select quotation file (PDF, Excel, image)
- **Description**: "Supplier quotation ref Q-20240315"
- This is CRITICAL for audit trail and variance resolution

**Purchase Requisition** (if applicable):
- Internal request document
- Approval emails
- Budget approval

**Specifications** (if applicable):
- Technical specifications
- Drawings or designs
- Quality requirements
- Test certifications required

#### How to Attach

**Method 1: Drag and Drop**
1. Open file location on your computer
2. Drag file to attachment area
3. Drop file
4. Add description
5. Click Upload

**Method 2: Browse and Select**
1. Click **Add Document** or **Browse**
2. Navigate to file location
3. Select file
4. Click Open
5. Add description
6. Click Upload

**Method 3: Scan Directly** (if scanner integrated)
1. Place document on scanner
2. Click **Scan Document**
3. Scanner captures
4. Add description
5. Click Upload

{{< callout type="info" >}}
**File Format Tips**:
- **PDF**: Best for formal quotations, multi-page documents
- **Excel**: Good for detailed price lists, BOMs
- **Images (JPG, PNG)**: Quick snapshots, price tags
- **Email (.eml)**: Email quotations with attachments
{{< /callout >}}

### Step 5: Review PO Totals

Before submitting, verify totals:

**Check**:
- **Subtotal**: Sum of all line items before tax
- **Discount**: If any discount applied
- **Tax Amount**: Calculated based on tax codes
- **Total**: Final amount supplier will invoice

**Verify**:
- [ ] Subtotal matches your calculation
- [ ] Tax rate is correct (check quotation)
- [ ] Total matches supplier's quote
- [ ] Currency is correct

**If totals don't match**:
1. Check each line item price
2. Verify quantities
3. Check tax codes
4. Review discount entries
5. Compare to original quotation

### Step 6: Save Draft (Optional)

If not ready to submit:
- Click **Save as Draft**
- PO saved but not submitted for approval
- Can edit later
- Status: Draft

**When to use**:
- Waiting for more information
- Need to verify details with supplier
- Gathering approvals offline
- End of workday, will complete tomorrow

### Step 7: Submit for Approval

When ready:
1. Click **Submit for Approval**
2. System validates required fields
3. Fix any errors highlighted
4. Confirm submission

**System checks**:
- All required fields completed
- At least one line item
- Quotation attached (if required by policy)
- Budget available (if budget control enabled)
- Within your authorization limit

**Approval routing**:
- System routes based on PO value
- Approver receives notification
- You receive confirmation of submission
- Status changes to: Pending Approval

{{< callout type="tip" >}}
**Expedite Approval**: For urgent POs, notify approver via phone or chat after submitting. Mention PO number and urgency.
{{< /callout >}}

---

## After Submission

### Track Approval Status

**Navigation**: `[Purchasing > Purchase Orders > My POs]`

**Status meanings**:
- **Pending Approval**: With approver, awaiting decision
- **Approved**: Approved, ready to send to supplier
- **Rejected**: Rejected, see comments for reason
- **On Hold**: Temporarily held, pending information

### If PO is Rejected

**Actions**:
1. Open rejected PO
2. Read approver's comments
3. Fix issues identified
4. Make necessary changes
5. Resubmit for approval

**Common rejection reasons**:
- Price too high (get better quote)
- Wrong budget code
- Missing quotation
- Supplier not approved
- Over budget (get budget increase)
- Insufficient justification

### If PO is Approved

**Next steps**:
1. Open approved PO
2. Review final version
3. Send to supplier (see next section)

---

## Sending PO to Supplier

### Electronic Transmission (Recommended)

**Navigation**: Open approved PO > Click **Send to Supplier**

**Process**:
1. **System generates** PDF of PO
2. **Email auto-populated** with supplier contact
3. **Email template** loads with standard message
4. **Customize message** if needed:
   ```
   Dear [Supplier],

   Please find attached our Purchase Order [PO-XXXX] for [items description].

   Required delivery date: [Date]
   Delivery address: [Address]

   Please confirm receipt and expected delivery date.

   Thank you.
   ```
5. **Click Send**
6. **System records** transmission date and time
7. **PO status** updates to: Sent to Supplier

### Print and Fax/Mail

**If supplier prefers paper**:

**Print**:
1. Open approved PO
2. Click **Print** or **Print Preview**
3. Review print format
4. Print on company letterhead (if required)
5. Sign (if signature required by policy)

**Transmit**:
- **Fax**: Fax to supplier's fax number
- **Mail**: Mail to supplier address
- **Hand Deliver**: Deliver in person if local

**Record Transmission**:
1. In PO screen, click **Mark as Sent**
2. Enter send date
3. Enter send method (Fax/Mail)
4. Add notes: "Faxed to 555-1234"
5. Save

### Supplier Portal (If Available)

If supplier has portal access:
1. PO automatically appears in their portal
2. They receive notification
3. They can acknowledge receipt electronically
4. System updates status automatically

---

## Following Up with Supplier

### Get PO Confirmation

**Within 24-48 hours**, expect supplier to:
- Confirm receipt of PO
- Accept the order, or
- Raise questions/issues

**If no response**:
1. **Day 2**: Send follow-up email
2. **Day 3**: Call supplier
3. **Day 4**: Escalate to purchasing manager

### Handle Supplier Response

#### Supplier Accepts PO
**They confirm**:
- PO received
- Order accepted
- Delivery date confirmed

**Your action**:
- Update expected delivery date in system (if different)
- Set reminder to follow up closer to delivery
- No further action until delivery

#### Supplier Raises Issues

**Common issues**:

**Price Changed**:
- Supplier: "Price is now $105, not $100"
- Your action: Verify if authorized, get approval, or negotiate

**Delivery Date Not Possible**:
- Supplier: "Can deliver March 30, not March 15"
- Your action: Check if acceptable, update PO, or find alternative

**Item Discontinued**:
- Supplier: "Item no longer available"
- Your action: Request alternative, or cancel PO and find new supplier

**Minimum Order Not Met**:
- Supplier: "Minimum order is 100, you ordered 50"
- Your action: Increase quantity, or accept higher per-unit price

**Action for Issues**:
1. Discuss with supplier
2. Negotiate resolution
3. If significant change: Get new approval
4. Update PO if needed
5. Re-send amended PO to supplier

{{< callout type="warning" >}}
**Never Assume**: Don't assume supplier accepted PO just because they didn't respond. Always get explicit confirmation, especially for high-value or urgent orders.
{{< /callout >}}

---

## Common Scenarios

### Scenario 1: Regular Office Supplies Order

**Situation**: Monthly restocking from regular supplier

**Details**:
- Supplier: Office Supply Co. (existing)
- Items: 10 items, all in system
- Value: $850
- Quotation: Email price list

**Steps**:
1. Create new PO
2. Select supplier
3. Add 10 line items quickly (type item codes)
4. Prices auto-fill from price book
5. Attach email price list
6. Submit (auto-approved < $1,000)
7. Send to supplier
8. Done in 8 minutes

### Scenario 2: Equipment Purchase (High Value)

**Situation**: New machine for production

**Details**:
- Supplier: XYZ Machinery Inc.
- Item: 1 machine (non-stock)
- Value: $45,000
- Quotation: Detailed proposal PDF

**Steps**:
1. Create new PO
2. Select supplier
3. Add non-stock item: "CNC Machine Model 2000"
4. Quantity: 1, Price: $45,000
5. G/L Account: Fixed Assets - Machinery
6. Cost Center: Production
7. Attach quotation (multi-page PDF)
8. Add notes: "Installation and training included"
9. Submit for approval
10. Requires CFO approval (>$25,000)
11. Follow up on approval status
12. Once approved, send to supplier
13. Get delivery schedule confirmation

### Scenario 3: Import Purchase (Foreign Currency)

**Situation**: Raw materials from overseas

**Details**:
- Supplier: International Materials Co. (Singapore)
- Items: 3 items
- Value: SGD 28,000
- Terms: FOB Singapore, prepayment 50%

**Steps**:
1. Create new PO
2. Select supplier
3. Currency: SGD (auto-filled)
4. Exchange rate: System uses current rate
5. Add 3 line items in SGD
6. Delivery terms: FOB Singapore
7. Payment terms: 50% advance, 50% on B/L
8. Attach proforma invoice
9. Add notes: "Prepayment required, arrange LC"
10. Submit for approval
11. Send to supplier when approved
12. Coordinate with finance for LC arrangement

---

## Tips for Efficiency

### Speed Up PO Creation

**Use Templates**:
- Save frequent orders as templates
- Modify template instead of starting from scratch
- Update template periodically

**Favorite Items**:
- Mark frequently ordered items as favorites
- Quick access to common items
- Reduces search time

**Copy Previous PO**:
- Find similar previous PO
- Use "Copy PO" function
- Modify as needed
- Faster than creating from scratch

**Keyboard Navigation**:
- Learn tab order of fields
- Use enter/tab instead of mouse clicks
- Type-ahead search for suppliers/items
- Keyboard shortcuts for save, submit

### Maintain Accuracy

**Verification Checklist**:
- [ ] Supplier name correct
- [ ] All items correctly described
- [ ] Quantities match requirement
- [ ] Prices match quotation
- [ ] Currency correct
- [ ] Delivery date realistic
- [ ] Delivery address correct
- [ ] G/L accounts correct
- [ ] Quotation attached
- [ ] Special instructions noted

**Double-Check Critical Fields**:
- **Unit price**: Most common error
- **Quantity**: Second most common
- **Delivery date**: Often unrealistic
- **Currency**: Easy to miss
- **G/L account**: Affects financial reporting

---

## Troubleshooting

### Error: "Supplier Not Found"

**Cause**: Supplier not in system
**Fix**:
1. Search thoroughly (alternate names)
2. If truly not in system: Create supplier first
3. Navigation: Master Data > Suppliers > New Supplier
4. Return to PO creation after supplier created

### Error: "Item Not Found"

**Cause**: Item code doesn't exist
**Fix**:
1. Verify item code with supplier
2. Search by description
3. If truly new item: Create item first (if policy) or use non-stock item

### Error: "Budget Exceeded"

**Cause**: PO exceeds available budget
**Fix**:
1. Check budget availability report
2. If budget is available: Check if coded to correct budget line
3. If truly over budget: Get budget increase approval
4. Attach budget approval to PO

### Error: "Cannot Submit for Approval"

**Cause**: Validation failed
**Fix**:
1. Read error message carefully
2. Check all required fields completed
3. Ensure at least one line item
4. Verify quotation attached (if required)
5. Fix highlighted errors
6. Try submit again

---

## Best Practices

### Do's
- ✅ Always attach supplier quotation
- ✅ Set realistic delivery dates
- ✅ Include clear delivery instructions
- ✅ Use correct G/L accounts
- ✅ Review totals before submitting
- ✅ Follow up for supplier confirmation
- ✅ Update PO if terms change

### Don'ts
- ❌ Create PO without quotation
- ❌ Rush through data entry
- ❌ Assume supplier will deliver by your date without confirmation
- ❌ Ignore currency differences
- ❌ Code all purchases to "General Purchases"
- ❌ Leave delivery address blank
- ❌ Submit for approval before reviewing

{{< callout type="success" >}}
**Mastery Milestone**: When you can create accurate POs quickly and suppliers consistently deliver as expected, you've mastered PO creation!
{{< /callout >}}

---

## Related Documentation

### Workflows
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - Complete purchasing process
- [Purchasing Overview](/user-guide/daily-tasks/purchasing-overview) - Daily task guide

### Next Steps
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note) - Receiving deliveries
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing) - Processing supplier invoices

### Module Documentation
- [Purchasing Module](/modules/purchasing/) - All purchasing features
- [Supplier Maintenance](/applets/supplier-maintenance-applet/) - Managing suppliers
- [Inventory Items](/applets/inv-item-maintenance-applet/) - Item master data
