---
title: "Standard Procurement Workflow"
description: "Complete purchase order to payment process with three-way matching for full audit trail and financial control"
weight: 10
---

The Standard Procurement Workflow is the most comprehensive and controlled purchasing process, providing full visibility from order placement through payment. This workflow uses three-way matching (PO, GRN, Invoice) to ensure accuracy and prevent errors.

## When to Use This Workflow

Use the Standard Procurement Workflow for:

- **Regular supplier purchases** with negotiated pricing
- **High-value purchases** requiring approval and audit trail
- **Inventory replenishment** from established suppliers
- **Capital equipment** and fixed asset purchases
- **Contract-based purchases** with agreed terms
- **Imported goods** requiring tracking and documentation

{{< callout type="tip" >}}
**Best Practice**: Make this your default workflow for most purchases. The additional steps provide valuable controls and visibility that prevent costly errors.
{{< /callout >}}

## Complete Process Flow

```
Step 1: Supplier Setup → Step 2: Create PO → Step 3: Send PO → Step 4: Receive Goods → Step 5: Process Invoice → Step 6: Make Payment
    ↓                       ↓                   ↓                  ↓                    ↓                      ↓
Admin Setup         Admin Creates       Auto/Manual       Warehouse Receives    Accounts Matches      Accounts Pays
Master Data         Order Document      Transmission      Physical Goods        Invoice to PO/GRN     Supplier
```

## Prerequisites

Before starting, ensure these are in place:

### System Setup
- [x] Supplier account created and active
- [x] Items configured in inventory master
- [x] Purchase approval workflows configured
- [x] Chart of accounts for purchases set up
- [x] Tax codes configured
- [x] Document numbering sequences active

### User Permissions
- **Purchasing Admin**: Can create and modify POs
- **Warehouse Staff**: Can create GRNs
- **Accounts Payable**: Can process invoices and payments

---

## Step 1: Open Supplier Account

**Responsible Role**: Purchasing Admin / Accounts Setup

Before placing orders, the supplier must be registered in the system.

### Navigation
`[Master Data > Suppliers > New Supplier]`

### Required Information

#### Basic Details
- Supplier name and trading name
- Business registration number
- Tax registration number (VAT/GST/SST)
- Supplier category (Local/Import, Product type)
- Currency (if different from base currency)

#### Contact Information
- Billing address
- Delivery address (if different)
- Primary contact person
- Phone and email
- Website

#### Financial Terms
- Payment terms (e.g., Net 30, Net 60)
- Credit limit
- Default payment method
- Bank account details for payment
- Early payment discount terms (if any)

#### Purchasing Details
- Default price book or contract
- Lead time (days)
- Minimum order quantity
- Order cut-off time
- Preferred delivery days

### Actions
1. Click **New Supplier**
2. Fill in all required fields (marked with *)
3. Attach supporting documents:
   - Business registration certificate
   - Tax registration certificate
   - Bank account details
   - Company profile
4. Set supplier status to **Active**
5. Click **Save**

{{< callout type="warning" >}}
**Compliance Check**: Verify tax registration numbers with authorities before activating suppliers. Invalid tax numbers can cause problems with tax claims.
{{< /callout >}}

---

## Step 2: Create Purchase Order

**Responsible Role**: Purchasing Admin

Create a formal purchase order documenting what to buy, from whom, at what price.

### Navigation
`[Purchasing > Purchase Orders > New PO]`

### PO Header Information

#### Document Details
- **PO Number**: Auto-generated or manual entry
- **PO Date**: Order date (default: today)
- **Required Date**: When you need the goods
- **Reference**: Your internal reference/requisition number

#### Supplier Information
- **Supplier**: Select from dropdown
- **Supplier Contact**: Select contact person
- **Delivery Address**: Your warehouse/receiving location
- **Billing Address**: For invoice delivery

#### Terms and Conditions
- **Payment Terms**: Auto-filled from supplier master
- **Delivery Terms**: EXW, FOB, CIF, etc.
- **Currency**: Base or foreign currency
- **Exchange Rate**: If foreign currency
- **Tax Treatment**: Standard rated, zero-rated, exempt

### PO Line Items

For each item to purchase:

#### Item Selection
- **Item Code**: Select from inventory master
- **Item Description**: Auto-filled, can modify
- **Quantity**: Order quantity
- **Unit of Measure**: EA, KG, BOX, etc.
- **Unit Price**: Per-unit price

#### Pricing Details
- **Invoice Price**: Price on supplier's invoice
- **Actual Cost**: Invoice price minus rebates/discounts
- **Discount %**: If applicable
- **Tax Code**: VAT/GST code
- **Tax Amount**: Auto-calculated

#### Additional Information
- **Required Date**: Line-specific delivery date
- **G/L Account**: Expense or asset account
- **Cost Center**: Department or project code
- **Notes**: Special instructions for this line

### Costing File Attachment

Upload the supplier's quotation or pricing document:

#### Supported Formats
- Excel (.xlsx, .xls) - Quotations and price lists
- PDF (.pdf) - Formal quotations
- Images (.jpg, .png) - Price lists or catalogs
- Email (.eml, .msg) - Email quotations

#### Upload Steps
1. Click **Attachments** tab
2. Click **Add Document**
3. Select **Quotation** as document type
4. Choose file from your computer
5. Add description (e.g., "Supplier quotation ref Q-2024-001")
6. Click **Upload**

{{< callout type="info" >}}
**Audit Trail**: Always attach the original quotation or price list. This supports your pricing during audits and helps resolve discrepancies.
{{< /callout >}}

### Invoice Price vs. Actual Cost

Understanding the difference is crucial:

- **Invoice Price**: The price printed on the supplier's invoice
- **Actual Cost**: Your real cost after rebates and discounts

**Example**:
```
Invoice Price: $100
Volume Rebate: -$5 (5%)
Payment Discount: -$2 (2% for early payment)
Actual Cost: $93
```

The system tracks both for accurate:
- Accounts payable (pay invoice price to supplier)
- Cost of goods (record actual cost in inventory)
- Rebate tracking (manage rebate claims)

### Approval Routing

After completing the PO:

1. Click **Submit for Approval**
2. System routes based on:
   - Total PO value
   - Item category
   - Supplier status
   - Your approval limits
3. Approver receives notification
4. Approver reviews and approves/rejects
5. You receive approval notification

#### Approval Levels Example
| PO Value | Approver | Typical Time |
|----------|----------|--------------|
| < $1,000 | Supervisor | 2 hours |
| $1,000 - $5,000 | Manager | 1 day |
| $5,000 - $25,000 | Finance Manager | 2 days |
| > $25,000 | CFO | 3-5 days |

{{< callout type="tip" >}}
**Expedite Approvals**: For urgent purchases, notify approvers via phone or email after submitting. Include the PO number and business justification.
{{< /callout >}}

### Common Mistakes to Avoid

**Incorrect pricing**: Always use the currency specified in the quotation
- **Wrong**: Convert to base currency before entry
- **Right**: Enter in quotation currency, let system convert

**Missing attachments**: PO without quotation creates audit issues
- **Wrong**: "I'll attach it later"
- **Right**: Attach before submitting for approval

**Unclear delivery dates**: Vague dates cause supply chain issues
- **Wrong**: "ASAP" or "End of month"
- **Right**: Specific date (e.g., "2024-12-15")

**Wrong G/L account**: Incorrect expense classification
- **Wrong**: All purchases to "General Purchases"
- **Right**: Specific accounts (Raw Materials, Office Supplies, Equipment)

---

## Step 3: Send PO to Supplier

**Responsible Role**: Purchasing Admin

Once approved, transmit the PO to the supplier.

### Transmission Methods

#### Electronic Transmission (Recommended)
1. **Email Integration**
   - Navigate to approved PO
   - Click **Send to Supplier**
   - System generates PDF
   - Email auto-populated with supplier contact
   - Add custom message if needed
   - Click **Send**
   - System logs transmission date/time

2. **Supplier Portal**
   - If supplier has portal access
   - PO automatically appears in their dashboard
   - They acknowledge receipt electronically
   - System updates PO status to "Acknowledged"

#### Manual Transmission
1. **Print PO**
   - Click **Print Preview**
   - Review PO format
   - Print on company letterhead
   - Sign if required
2. **Fax or Email**
   - Send to supplier
   - Manually update PO status to "Sent"
   - Note transmission details in PO notes

### PO Confirmation

After sending:

1. **Wait for acknowledgment** from supplier
2. **Verify order details**:
   - Confirm price matches quotation
   - Verify delivery date is acceptable
   - Check any special requirements
3. **Update expected delivery** date if supplier confirms different date
4. **Flag issues** if supplier cannot fulfill order
5. **Create new PO** if original is rejected

{{< callout type="warning" >}}
**Critical Check**: Always get supplier confirmation, especially for high-value orders. Assumptions about accepted orders cause supply chain disruptions.
{{< /callout >}}

---

## Step 4: Receive Goods at Warehouse

**Responsible Role**: Warehouse Staff / Receiving Clerk

When goods arrive, perform physical receipt and create GRN.

### Pre-Delivery Coordination

**24 hours before delivery**:
- [ ] Review expected deliveries in system
- [ ] Check warehouse capacity and space
- [ ] Assign receiving staff
- [ ] Prepare receiving area
- [ ] Print PO copy for reference
- [ ] Prepare scanning equipment

### Physical Receipt Process

When supplier's vehicle arrives:

#### 1. Document Verification
- **Delivery Order (DO)**: Get from driver
- **Packing List**: Verify included
- **Check DO details**:
  - Supplier name matches expected delivery
  - DO date is current
  - Your PO number is referenced
  - Total quantity matches expectation

#### 2. Physical Unloading
- Unload all items carefully
- Inspect for visible damage
- Separate damaged items immediately
- Count total packages/cartons
- Verify package count matches DO

#### 3. Quantity Verification
- Open packages (sample or all, depending on policy)
- Count actual items
- Compare to:
  - PO quantity (what you ordered)
  - DO quantity (what they claim to deliver)
- Note any discrepancies

#### 4. Quality Inspection
- **Visual inspection**:
  - Check for physical damage
  - Verify correct items
  - Check expiry dates (if applicable)
  - Verify model/part numbers
- **Functional testing** (if required):
  - Test equipment powers on
  - Verify specifications
  - Check calibration (for instruments)
- **Documentation check**:
  - Certificates of conformance
  - Warranties and manuals
  - Safety data sheets (for chemicals)

### System GRN Entry

**Navigation**: `[Purchasing > Goods Receipt > New GRN]`

#### GRN Header

**Document Information**:
- **GRN Number**: Auto-generated
- **GRN Date**: Receipt date (today)
- **PO Number**: Select PO being received
- **Supplier**: Auto-filled from PO
- **DO Number**: Enter supplier's DO number
- **Received By**: Your name (warehouse staff)

**Delivery Information**:
- **Vehicle Number**: Delivery vehicle plate number
- **Driver Name**: Delivery driver name
- **Arrival Time**: When vehicle arrived
- **Completion Time**: When unloading finished

#### Match DO with PO

The system displays the PO lines:

1. **Review PO line items**
2. **Match with DO line items**
3. **Verify**:
   - Item codes match
   - Descriptions match
   - Ordered quantities are correct

{{< callout type="info" >}}
**Three-Way Document Check**: You're now comparing PO (what you ordered) with DO (what supplier claims) with Physical Count (what actually arrived). Any mismatch needs investigation.
{{< /callout >}}

#### Enter Received Quantities

For each line item:

**If quantity matches PO**:
- Received Qty = PO Qty
- Status = "Fully Received"

**If quantity is less than PO**:
- Received Qty = Actual quantity
- Backorder Qty = PO Qty - Received Qty
- Status = "Partially Received"
- Note reason (e.g., "Supplier out of stock", "Damaged in transit")

**If quantity is more than PO**:
- System warns about over-delivery
- Get supervisor approval
- Decide: Accept excess or reject
- Note reason for acceptance

**If item is damaged**:
- Received Qty = Good items only
- Rejected Qty = Damaged items
- Status = "Partial - Rejected Items"
- Take photos of damage
- Note damage details

### Serial Number Scanning

For serialized items (electronics, equipment, tools):

#### Navigate to Serial Entry
1. Click on line item
2. Click **Serial Numbers** button
3. Scan or enter serial numbers

#### Scanning Process
- **Use barcode scanner**: Scan each item's serial number
- **Manual entry**: Type if no scanner available
- **System validates**: Checks for duplicates
- **Count verification**: System confirms count matches received quantity

#### Serial Number Validation
System checks:
- [ ] No duplicate serials in system
- [ ] Serial format is valid
- [ ] Count matches received quantity
- [ ] All required serials entered

{{< callout type="warning" >}}
**Critical for Warranty**: Serial numbers are essential for warranty claims, returns, and asset tracking. Don't skip this step for serialized items.
{{< /callout >}}

### Stock Allocation to Racking

Assign physical storage locations:

#### Location Assignment
1. **Click line item**
2. **Click Storage Location** button
3. **For each item or batch**:
   - **Zone**: Warehouse area (e.g., Zone A)
   - **Aisle**: Aisle number (e.g., Aisle 3)
   - **Rack**: Rack identifier (e.g., Rack R-07)
   - **Level**: Shelf level (e.g., Level 2)
   - **Bin**: Specific bin (e.g., Bin B-05)
   - **Quantity**: Items in this location

#### Location Strategy
- **Fast-moving items**: Near dispatch area
- **Bulk items**: Lower levels for easy access
- **Small items**: Upper shelves with step access
- **Heavy items**: Ground level or bottom racks
- **Hazardous items**: Designated safe area

#### Complete Location Format
Example: `A-03-R07-L2-B05`
- Zone A
- Aisle 3
- Rack 07
- Level 2
- Bin 05

### Document Attachment

Before confirming GRN, upload documents:

#### Required Documents
1. **Delivery Order (DO)**
   - Supplier's delivery document
   - Must be signed by your receiving staff
   - Photo/scan of physical DO

2. **Packing List**
   - Detailed list of items
   - Package numbers
   - Weights and dimensions

3. **Purchase Invoice** (if delivered with goods)
   - Original tax invoice
   - Payment copy
   - Supporting documents

4. **Quality Certificates**
   - Certificate of Analysis (for materials)
   - Test certificates (for equipment)
   - Calibration certificates (for instruments)

5. **Damage Evidence** (if applicable)
   - Photos of damaged items
   - Photos of damaged packaging
   - Incident report

#### Upload Process
1. **Click Attachments tab**
2. **For each document**:
   - Click **Add Document**
   - Select document type
   - Choose file
   - Add description
   - Upload
3. **Verify all required documents attached**

{{< callout type="tip" >}}
**Mobile Photo Upload**: Use mobile app to photograph documents at receiving area and upload directly. Faster than scanning later.
{{< /callout >}}

### Final GRN Confirmation

Before saving:

#### Pre-Confirmation Checklist
- [ ] All received quantities entered
- [ ] Serial numbers scanned for all serialized items
- [ ] Storage locations assigned
- [ ] DO and packing list attached
- [ ] Damage documented (if any)
- [ ] Quality inspection passed
- [ ] Discrepancies noted and approved

#### Save and Confirm
1. **Click Review Summary**
2. **Verify totals**:
   - Total quantity received
   - Total value
   - Number of line items
   - Documents attached
3. **Click Confirm GRN**
4. **System processes**:
   - Updates inventory quantities
   - Updates PO receipt status
   - Creates accounting entries
   - Sends notifications
5. **Print GRN copy** for file

#### Post-GRN Status

**PO Status Updates**:
- **Fully Received**: All items received, PO closed
- **Partially Received**: Some items received, PO remains open for balance
- **Multiple GRNs**: If delivering in batches, multiple GRNs link to one PO

**Inventory Status**:
- **Stock increased**: Items added to available stock
- **Value updated**: Inventory value increased by purchase cost
- **Locations active**: Items available in specified locations

{{< callout type="success" >}}
**Milestone Complete**: Goods are now in your warehouse, tracked in inventory, and allocated to storage. Stock is available for use or sale.
{{< /callout >}}

### Handling Exceptions

#### Partial Delivery
**Scenario**: Ordered 100, received 80

**Actions**:
1. Create GRN for 80 received
2. PO remains open for balance of 20
3. Note reason for shortage
4. Contact supplier for balance delivery
5. Set expected date for balance
6. System tracks outstanding 20 units

#### Damaged Goods
**Scenario**: 10 items damaged in transit

**Actions**:
1. Reject damaged items (don't receive into stock)
2. Note rejection in GRN
3. Photograph damage
4. Get driver to acknowledge damage on DO
5. Contact supplier immediately
6. Request replacement or credit note
7. Keep damaged goods in quarantine area
8. Process credit note when received

#### Over Delivery
**Scenario**: Ordered 50, received 60

**Actions**:
1. Get supervisor approval
2. Check warehouse capacity
3. Verify pricing is same
4. **If accepting excess**:
   - Receive all 60
   - Note over-delivery
   - Expect revised invoice
5. **If rejecting excess**:
   - Receive only 50
   - Reject 10 items
   - Get driver to take back excess
   - Note on DO

#### Wrong Items Delivered
**Scenario**: Ordered Item A, received Item B

**Actions**:
1. Do NOT receive wrong items into stock
2. Reject entire delivery or wrong line
3. Photograph evidence
4. Get driver acknowledgment
5. Contact supplier immediately
6. Return wrong items
7. Request correct items
8. Keep PO open

---

## Step 5: Process Purchase Invoice

**Responsible Role**: Accounts Payable Clerk

Match supplier invoice with PO and GRN, then process for payment.

### Invoice Receipt

When invoice arrives (mail, email, or with delivery):

#### Invoice Checklist
Verify invoice contains:
- [ ] Supplier details (name, address, reg no.)
- [ ] Tax invoice number
- [ ] Invoice date
- [ ] Tax registration number
- [ ] Your PO number
- [ ] Your DO/GRN reference
- [ ] Line item details
- [ ] Unit prices
- [ ] Quantities
- [ ] Tax calculation
- [ ] Total amount
- [ ] Payment terms
- [ ] Bank account details

{{< callout type="warning" >}}
**Tax Compliance**: Invoice must be a valid tax invoice to claim input tax. Check tax number, format, and required fields per your tax regulations.
{{< /callout >}}

### System Invoice Entry

**Navigation**: `[Purchasing > Purchase Invoices > New Invoice]`

#### Invoice Header

**Document Details**:
- **Invoice Number**: Enter supplier's invoice number
- **Invoice Date**: Date on supplier's invoice
- **Due Date**: Based on payment terms (e.g., invoice date + 30 days)
- **Supplier**: Select supplier
- **Currency**: Match invoice currency

**Matching Reference**:
- **PO Number**: Select PO
- **GRN Number**: Select GRN (if PO has multiple GRNs, select relevant one)

#### Three-Way Matching

System automatically compares:

**Purchase Order (What you ordered)**:
- Item A: 100 units @ $10 = $1,000
- Item B: 50 units @ $20 = $1,000
- Total: $2,000

**Goods Receipt (What you received)**:
- Item A: 95 units (5 short)
- Item B: 50 units (complete)

**Purchase Invoice (What you're being charged)**:
- Item A: 100 units @ $10 = $1,000
- Item B: 50 units @ $22 = $1,100
- Total: $2,100

#### Identifying Discrepancies

System flags:

**Quantity Variance**:
- Invoice shows 100, but GRN shows 95 received
- **Reason**: Short delivery or invoicing error
- **Action Required**: Contact supplier for adjustment

**Price Variance**:
- PO shows $20, Invoice shows $22
- **Reason**: Price increase or invoicing error
- **Action Required**: Verify with purchasing team

**Amount Variance**:
- Expected total: $1,950
- Invoice total: $2,100
- Variance: $150 over
- **Action Required**: Investigate before approval

### Resolving Variances

#### Minor Variances (Within Tolerance)

If variance is within company policy (e.g., ±2% or $50):

1. **Document reason**: Note in invoice remarks
2. **Get approval**: From purchasing or supervisor
3. **Process invoice**: Accept with noted variance
4. **Track variance**: For supplier performance review

#### Major Variances (Outside Tolerance)

If variance is significant:

1. **Hold invoice**: Don't process
2. **Contact supplier**:
   - Email/call supplier's accounts
   - Reference PO, GRN, and invoice numbers
   - Explain variance
   - Request investigation
3. **Wait for resolution**:
   - Revised invoice, or
   - Credit note for overcharge, or
   - Explanation and authorization to pay
4. **Document resolution**: Attach correspondence
5. **Process corrected invoice**

#### Common Variance Scenarios

**Scenario 1: Partial Delivery, Full Invoice**
- **Issue**: Invoice for 100 units, GRN shows 80 received
- **Resolution**: Request revised invoice for 80 units only

**Scenario 2: Price Increase Not Authorized**
- **Issue**: Invoice price higher than PO price
- **Resolution**: Purchasing verifies if increase was authorized; if not, request credit note

**Scenario 3: Freight Charges Not on PO**
- **Issue**: Invoice includes freight not mentioned in PO
- **Resolution**: Verify if freight is included in unit price or should be paid separately; get authorization

**Scenario 4: Early Payment Discount**
- **Issue**: Invoice shows discount if paid within 10 days
- **Resolution**: Flag for priority payment to capture discount

### Tax Verification

Verify tax calculation:

#### Tax Rate Check
- **Standard rate**: 18% (example, check your jurisdiction)
- **Zero-rated**: 0% (exports, certain goods)
- **Exempt**: No tax (financial services, education)

#### Tax Calculation Verification
```
Example:
Subtotal: $1,000
Tax (18%): $180
Total: $1,180

Verify:
- Tax rate matches item category
- Tax amount = Subtotal × Rate
- Total = Subtotal + Tax
```

#### Input Tax Claim
Ensure invoice qualifies for input tax credit:
- [ ] Valid tax invoice format
- [ ] Supplier's tax number valid
- [ ] Tax amount separately stated
- [ ] Invoice within claim period
- [ ] Purchase is for business use

{{< callout type="info" >}}
**Tax Audit Trail**: Invalid tax invoices mean you can't claim input tax credit. This increases your cost by the tax amount. Always verify tax invoice validity.
{{< /callout >}}

### Invoice Approval Routing

After entering invoice:

1. **System validation**:
   - Three-way match status
   - Variance within tolerance
   - Tax calculation correct
   - All required fields completed

2. **Approval routing**:
   - **Clean match**: Auto-approve or supervisor review
   - **Minor variance**: Manager approval
   - **Major variance**: Senior manager approval
   - **Price increase**: Purchasing approval

3. **Approver actions**:
   - Reviews invoice vs PO/GRN
   - Checks variance explanation
   - Approves or rejects with reason
   - Invoice moves to payment queue

#### Approval Hierarchy

| Situation | Approver | Timeline |
|-----------|----------|----------|
| Clean three-way match | Auto or Supervisor | Immediate |
| Quantity variance < 5% | AP Manager | 1 day |
| Price variance < 10% | Purchasing Manager | 2 days |
| Major discrepancy | Finance Manager | 3-5 days |

### Document Attachment

Attach invoice documentation:

#### Required Attachments
1. **Original Invoice**: Scanned or PDF
2. **Supporting Documents**:
   - Delivery order (if not already attached to GRN)
   - Packing list
   - Weight notes (for weight-based items)
3. **Correspondence** (if applicable):
   - Email confirming price changes
   - Credit note authorizations
   - Variance approvals

#### Upload Process
1. Click **Attachments** tab
2. Add each document
3. Verify invoice image is readable
4. Check all pages uploaded
5. Confirm attachments before approval

### Posting Invoice

Once approved:

1. **Review final invoice**:
   - Verify all approvals received
   - Check all documents attached
   - Confirm accuracy

2. **Post invoice**:
   - Click **Post Invoice**
   - System creates accounting entries
   - Updates payables
   - Generates payment due

3. **Accounting entries created**:
   ```
   Debit: Purchase Expense / Inventory   $1,000
   Debit: Input Tax                         $180
   Credit: Accounts Payable                        $1,180
   ```

4. **Invoice status**: Posted, awaiting payment

5. **Payment due date**: Calculated based on terms

{{< callout type="success" >}}
**Invoice Processed**: Invoice is now in payables, matched to PO and GRN, and scheduled for payment on due date.
{{< /callout >}}

---

## Step 6: Make Payment to Supplier

**Responsible Role**: Accounts Payable / Treasury

Process payment to supplier per payment terms.

### Payment Scheduling

**Navigation**: `[Accounts Payable > Payment Processing > Payment Run]`

#### Review Due Invoices

System shows invoices due for payment:

**Filter criteria**:
- **Due date**: Today or earlier
- **Supplier**: Specific supplier or all
- **Currency**: Group by currency
- **Payment method**: Bank transfer, check, cash

**Invoice list displays**:
- Invoice number
- Invoice date
- Due date
- Amount due
- Supplier
- Payment terms
- Discount available (if early payment)

#### Early Payment Discounts

Some suppliers offer discount for early payment:

**Example**:
- **Terms**: 2/10 Net 30
- **Meaning**: 2% discount if paid within 10 days, otherwise full amount due in 30 days

**Calculation**:
```
Invoice amount: $1,000
Payment within 10 days: $980 (2% discount = $20 saved)
Payment after 10 days: $1,000 (no discount)
```

**Decision**:
- Calculate annual return of discount
- 2% for 20 days = 36% annual return
- Usually worthwhile to pay early

{{< callout type="tip" >}}
**Cash Flow Optimization**: Early payment discounts typically offer excellent returns. Pay early to capture discount, even if using credit facilities.
{{< /callout >}}

### Payment Batch Creation

Group invoices for efficient payment:

#### Batch Selection
1. **Select invoices** to pay
2. **Group by**:
   - Supplier (one payment per supplier)
   - Currency (separate batches per currency)
   - Payment method (bank transfer vs check)
3. **Create payment batch**
4. **System calculates** total payment

#### Batch Verification
- [ ] All due invoices included
- [ ] No duplicate payments
- [ ] Correct supplier bank details
- [ ] Correct payment amount
- [ ] Discounts calculated correctly
- [ ] Foreign exchange rates current (if applicable)

### Payment Methods

#### Bank Transfer (Most Common)

**Process**:
1. **Generate payment file**:
   - System creates bank file format (ISO20022, BAI, proprietary)
   - Includes: Supplier bank details, amount, invoice reference
2. **Upload to bank**:
   - Login to online banking
   - Upload payment file
   - Authorize payment
3. **Record payment in system**:
   - Mark invoices as paid
   - Record payment date
   - Save bank confirmation reference

**Bank Details Required**:
- Beneficiary name
- Bank name
- Bank account number
- Bank code/routing number
- SWIFT code (international)
- Payment reference (invoice number)

#### Check Payment

**Process**:
1. **Generate check**:
   - Print check from system
   - Or write manual check
2. **Physical signing**:
   - Get authorized signatories to sign
   - Two signatures if required by policy
3. **Mail or hand-deliver** to supplier
4. **Record in system**:
   - Check number
   - Check date
   - Mark invoices as paid

#### Electronic Wallet / Payment Gateway

**Process**:
1. **Initiate payment** in gateway
2. **Confirm payment** via OTP/2FA
3. **Record transaction ID** in system
4. **Mark invoices as paid**

### Payment Posting

After payment is executed:

#### System Recording
1. **Navigate to posted payment batch**
2. **For each payment**:
   - **Payment date**: Actual payment date
   - **Payment reference**: Bank confirmation or check number
   - **Payment amount**: Actual paid amount
3. **Post payments**
4. **System creates accounting entries**:
   ```
   Debit: Accounts Payable   $1,180
   Credit: Bank Account              $1,180
   ```

#### Supplier Account Update
- **Invoice status**: Paid
- **Payment posted to**: Supplier account
- **Outstanding balance**: Reduced
- **Payment history**: Updated

### Payment Confirmation

Send payment advice to supplier:

#### Remittance Advice
System generates remittance advice showing:
- Payment date
- Payment amount
- Payment method
- Payment reference
- Invoice numbers being paid
- Amounts for each invoice

#### Transmission
- **Email**: Auto-send from system
- **Print**: Mail with check
- **Supplier portal**: Available for download

{{< callout type="info" >}}
**Supplier Relations**: Always send remittance advice. Suppliers need this to match payment to invoices and update your account.
{{< /callout >}}

### Payment Reconciliation

#### Bank Reconciliation
1. **Download bank statement**
2. **Match payments in system** with bank statement
3. **Verify amounts** match exactly
4. **Resolve differences**:
   - Timing differences (payment in transit)
   - Bank charges
   - Foreign exchange differences
5. **Mark as reconciled**

#### Supplier Statement Reconciliation
1. **Request statement** from supplier (monthly)
2. **Compare** with your payables records
3. **Identify differences**:
   - Invoices not recorded
   - Payments not received
   - Credits not processed
4. **Resolve differences** with supplier
5. **Confirm zero balance** (if all settled)

---

## Complete Process Summary

### Timeline Example

**Day 1: Order Placement**
- Morning: Supplier account opened (if new)
- 10:00 AM: PO created and submitted for approval
- 2:00 PM: PO approved
- 3:00 PM: PO sent to supplier
- 4:00 PM: Supplier confirms order

**Day 15: Goods Delivery** (based on 2-week lead time)
- 8:00 AM: Supplier calls to schedule delivery
- 10:00 AM: Goods arrive at warehouse
- 10:00-11:00 AM: Physical receipt and inspection
- 11:00-12:00 PM: GRN entry, serial scanning, location allocation
- 12:00 PM: GRN confirmed, inventory updated

**Day 17: Invoice Processing** (invoice arrives 2 days after delivery)
- 9:00 AM: Invoice received via email
- 9:30 AM: Invoice entered in system
- 10:00 AM: Three-way matching completed
- 10:30 AM: Invoice submitted for approval
- 2:00 PM: Invoice approved
- 2:15 PM: Invoice posted

**Day 45: Payment** (30 days from invoice date)
- Morning: Invoice appears in payment due list
- 11:00 AM: Payment batch created
- 11:30 AM: Payment file uploaded to bank
- 12:00 PM: Payment authorized
- 12:30 PM: Payment posted in system
- 1:00 PM: Remittance advice sent to supplier

**Total Cycle**: 45 days from order to payment

### Key Performance Metrics

Track these to optimize the process:

| Metric | Target | Measurement |
|--------|--------|-------------|
| PO Approval Time | < 24 hours | Submission to approval |
| GRN Completion Time | < 2 hours | Delivery to GRN confirmation |
| Invoice Matching Time | < 1 day | Invoice receipt to posting |
| Payment Cycle Time | Per terms | Invoice date to payment |
| Three-Way Match Rate | > 95% | Clean matches without variance |
| On-Time Payment Rate | > 98% | Payments within terms |

### Common Problems and Solutions

#### Problem: PO Stuck in Approval
**Symptoms**: PO submitted days ago, no approval
**Solutions**:
- Check approver availability (on leave?)
- Review approval routing (correct approver?)
- Escalate to backup approver
- Use delegation feature for absent approvers

#### Problem: GRN Quantity Mismatch
**Symptoms**: Can't match invoice because GRN quantity wrong
**Solutions**:
- Check if partial delivery expected
- Verify warehouse counted correctly
- Check if items in quarantine/inspection
- Create additional GRN if more delivered later
- Adjust GRN if counting error (with approval)

#### Problem: Invoice Won't Match
**Symptoms**: System shows variance, won't auto-match
**Solutions**:
- Review variance report details
- Check if price on PO matches quote
- Verify GRN quantities are correct
- Contact supplier for explanation
- Get approval for justified variances
- Request revised invoice if supplier error

#### Problem: Payment Delayed
**Symptoms**: Due date passed, payment not made
**Solutions**:
- Check if invoice approved
- Verify bank details are correct
- Confirm payment run included invoice
- Check if supplier on payment hold
- Review cash flow availability
- Communicate delay to supplier if cash flow issue

---

## Best Practices

### For Purchasing Admins

1. **Maintain accurate POs**: Errors here cascade through the entire process
2. **Always attach quotations**: Essential for audit trail and dispute resolution
3. **Set realistic delivery dates**: Allow buffer for supplier delays
4. **Verify supplier details**: Wrong bank details delay payments
5. **Follow up on confirmations**: Don't assume PO is accepted

### For Warehouse Staff

1. **Count carefully**: Inventory accuracy depends on accurate receiving
2. **Document everything**: Photos of damage, notes on DO
3. **Scan all serials**: Can't claim warranty without serial number proof
4. **Allocate locations immediately**: Don't leave items in receiving area
5. **Reject damaged goods**: Accepting damage complicates returns

### For Accounts Payable

1. **Process invoices promptly**: Delays cause payment terms breaches
2. **Investigate variances thoroughly**: Small errors indicate bigger issues
3. **Capture early payment discounts**: Excellent financial returns
4. **Maintain supplier relationships**: Good communication prevents disputes
5. **Reconcile regularly**: Catch issues before they become major problems

### Internal Controls

1. **Segregation of duties**:
   - Different people: Create PO, Receive goods, Process invoice
   - Prevents: Fraud and collusion
   - Reduces: Errors and oversights

2. **Approval limits**:
   - Set based on: Value, risk, user level
   - Enforced by: System workflow
   - Prevents: Unauthorized purchases

3. **Three-way matching**:
   - Compares: PO, GRN, Invoice
   - Identifies: Quantity, price, amount variances
   - Prevents: Overpayment, duplicate payment, fraud

4. **Document retention**:
   - Keep: All POs, GRNs, invoices, payments
   - Period: Per legal requirements (typically 7 years)
   - Format: Electronic or paper, organized by date/supplier

{{< callout type="success" >}}
**Process Mastery**: You now understand the complete standard procurement workflow from supplier setup through payment. This forms the foundation for all purchasing activities.
{{< /callout >}}

## Related Documentation

### Daily Operations
- [Creating Purchase Orders](/user-guide/daily-tasks/creating-purchase-order) - Detailed PO creation guide
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note) - GRN procedures
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing) - Invoice matching guide

### Alternative Workflows
- [Direct GRN Workflow](/guides/purchasing-guides/direct-grn-workflow) - Skip PO, direct to goods receipt
- [Direct Invoice Workflow](/guides/purchasing-guides/direct-invoice-workflow) - No PO or GRN needed
- [Invoice-First Workflow](/guides/purchasing-guides/invoice-first-workflow) - Invoice before delivery

### Module Documentation
- [Purchasing Module](/modules/purchasing/) - Complete module overview
- [Supplier Maintenance](/applets/supplier-maintenance-applet/) - Supplier management
- [Inventory Module](/modules/inventory/) - Stock management integration
