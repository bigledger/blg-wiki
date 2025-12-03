---
title: "Goods Received Note Processing"
description: "Complete guide to receiving goods, creating GRNs, scanning serials, and allocating stock - ensuring accurate inventory"
weight: 12
---

Master the critical process of receiving goods and creating accurate Goods Received Notes (GRNs) that update inventory and enable invoice processing.

## What is a GRN?

A **Goods Received Note (GRN)** is a document that records:
- What goods were physically received
- When they were received
- What quantity was received
- The condition of goods
- Who received them
- Where they're stored

{{< callout type="info" >}}
**Why GRNs Matter**: GRNs are critical for inventory accuracy, invoice matching, and financial reporting. Errors in GRNs cascade through your entire system.
{{< /callout >}}

## Before You Start

### Prerequisites
- [ ] PO exists in system (for standard receipts)
- [ ] Warehouse space available
- [ ] Receiving area clear
- [ ] Scanning equipment ready (if serialized items)
- [ ] Your user account has GRN creation permission

### What You Need
- Purchase Order copy (print or on screen)
- Supplier's Delivery Order (DO)
- Packing list
- Physical goods being delivered
- Mobile device or computer for data entry

### Estimated Time
- **Simple receipt** (1-5 items, no serials): 15-30 minutes
- **Complex receipt** (many items, serialized): 1-2 hours

---

## Pre-Delivery Preparation

### Day Before Delivery

**Check Expected Deliveries**:

**Navigation**: `[Purchasing > Expected Deliveries]` or `[Reports > Expected GRNs]`

**Review**:
- POs with delivery due tomorrow/this week
- Quantities expected
- Special requirements
- Storage space needed

**Prepare**:
- [ ] Print PO copies for reference
- [ ] Clear receiving area
- [ ] Allocate storage locations
- [ ] Brief receiving staff
- [ ] Prepare tools (barcode scanner, camera, tape measure)
- [ ] Coordinate forklift availability (if needed)

### Morning of Delivery

**30 minutes before** delivery window:
- [ ] Re-check expected deliveries
- [ ] Have PO copies ready
- [ ] Receiving area organized
- [ ] Staff assigned and briefed
- [ ] Equipment tested and ready

{{< callout type="tip" >}}
**Preparation = Speed**: 10 minutes of preparation saves 30 minutes of chaos when the truck arrives. Be ready!
{{< /callout >}}

---

## Physical Receipt Process

### Step 1: Delivery Vehicle Arrives

**Immediate actions**:

**Greet Driver**:
- Welcome professionally
- Direct to receiving bay/area
- Brief on process and expected time

**Collect Documents**:
- Delivery Order (DO) from driver
- Packing list
- Any special documents (certificates, warranties)

**Verify Documents**:
- [ ] Supplier name matches expected delivery
- [ ] DO number present
- [ ] PO number referenced
- [ ] Quantity summary shown
- [ ] Date is current

**Quick Check Against PO**:
- Is this the right delivery for your PO?
- Quantity range matches expectation?
- Delivery address is correct (your location)?

{{< callout type="warning" >}}
**Red Flag**: If DO doesn't reference your PO number, or supplier is unexpected, STOP and verify before unloading. Might be wrong delivery.
{{< /callout >}}

### Step 2: Unload Goods

**Unloading process**:

**Safe Unloading**:
1. Use appropriate equipment (forklift, pallet jack, dolly)
2. Follow safety procedures
3. Place in designated receiving area
4. Keep packages intact for counting
5. Group by item type if mixed delivery

**Initial Inspection During Unload**:
- **Visible damage**: Note any damaged packages
- **Wet/crushed packages**: Separate immediately
- **Leaking containers**: Handle carefully, isolate
- **Temperature-sensitive**: Move to appropriate area quickly

**Package Count**:
- Count total packages/cartons
- Match to DO package count
- Note discrepancies
- Get driver to acknowledge any shortage

**Photos**:
- Take photos of:
  - Overall delivery (all packages)
  - Any damage (before opening)
  - Package labels and markings
  - Vehicle license plate

### Step 3: Physical Counting

**Open packages** (per your policy):
- Sample: Open 10-20% of packages to verify contents
- Full: Open all packages and count all items
- Risk-based: Open based on item value and supplier trust

**Count Methodology**:

**Small Items** (screws, small parts):
- Count by weight (if uniform weight)
- Count sample, then by package
- Use counting scales if available

**Medium Items** (most products):
- Physical count one by one
- Group in tens/twenties for easier tracking
- Two-person count for high-value items

**Large Items** (machinery, equipment):
- Visual count
- Check serial numbers
- Verify model numbers

**Documentation**:
- Note count on receiving slip
- Initial if count different from DO
- Get second person to verify large discrepancies

{{< callout type="tip" >}}
**Counting Accuracy**: Count twice, enter once. Taking extra 2 minutes to verify count saves hours of reconciliation later.
{{< /callout >}}

### Step 4: Quality Inspection

**Visual Inspection**:
- [ ] Correct item (matches PO description)
- [ ] Correct model/part number
- [ ] No physical damage
- [ ] Packaging intact
- [ ] No rust, corrosion, or deterioration
- [ ] Labels and markings present

**Specific Checks**:

**For Food/Chemicals**:
- Expiry date acceptable
- Batch number recorded
- Safety data sheet provided
- Storage temperature appropriate

**For Electronics**:
- Model number matches
- Serial numbers present
- Power specifications correct
- Accessories included

**For Machinery**:
- Model matches order
- Serial plate present and readable
- Accessories/parts included
- Manuals and certificates provided

**Functional Testing** (if policy requires):
- Power on test
- Basic function test
- Calibration check (for instruments)
- Performance within spec

**Failed Inspection**:
If items don't pass quality checks:
1. Set aside failed items
2. Photo document issues
3. Note on DO
4. Get driver acknowledgment
5. Decide: Reject, or accept with claims

---

## Creating GRN in System

### Step 5: Navigate and Start GRN

**Navigation**: `[Purchasing > Goods Receipt > New GRN]`

**Or**: Quick create (+ icon) > "Goods Receipt Note"

**Select GRN Type**:
- **With PO**: Standard receipt against PO (most common)
- **Without PO**: Direct GRN for walk-in purchases
- **Consignment Receipt**: Consignment stock receipt
- **Return to Supplier**: If immediately rejecting

**For Standard GRN** (with PO):
1. Click **New GRN** or **New Receipt**
2. Select **Against Purchase Order**
3. Search for PO number
4. System loads PO details

### Step 6: Enter GRN Header

**Document Information**:
- **GRN Number**: Usually auto-generated (leave blank)
- **GRN Date**: Defaults to today (change if backdating authorized)
- **PO Number**: Already selected or select now
- **Supplier**: Auto-filled from PO

**Delivery Information**:
- **DO Number**: Enter supplier's DO number
- **DO Date**: Date on DO
- **Vehicle Number**: Delivery vehicle plate
- **Driver Name**: Driver's name
- **Received By**: Your name (usually auto-filled)

**Time Information**:
- **Arrival Time**: When vehicle arrived
- **Start Time**: When unloading started
- **Completion Time**: When finished (can enter later)

**Delivery Condition**:
- **Condition**: Select (Good, Damaged, Partial)
- **Remarks**: Note any issues or special circumstances

### Step 7: Enter Line Items

**System displays PO line items**:

For each line item from PO:

**Quantity Fields**:
- **Ordered Qty**: What was ordered (from PO) - read-only
- **Received Qty**: What you actually received - **ENTER THIS**
- **Rejected Qty**: Damaged/failed items - enter if applicable
- **UOM**: Unit of measure - verify correct

**Scenarios**:

**Full Delivery**:
```
Ordered: 100
Received: 100
Rejected: 0
Status: Fully Received
```

**Partial Delivery**:
```
Ordered: 100
Received: 80
Rejected: 0
Backorder: 20
Status: Partially Received
```

**Delivery with Damage**:
```
Ordered: 100
Received: 95 (good items)
Rejected: 5 (damaged)
Status: Partial - Rejected Items
```

**Over-Delivery**:
```
Ordered: 100
Received: 110
Status: Over-Delivered (system warns)
```

**Line Item Details**:
- **Batch Number**: If batch-tracked items
- **Manufacturing Date**: If applicable
- **Expiry Date**: If applicable
- **Rejection Reason**: If items rejected
- **Line Notes**: Any notes for this item

{{< callout type="warning" >}}
**Over-Delivery Alert**: If receiving more than ordered, system warns. Get supervisor approval before accepting excess. Don't automatically accept over-deliveries.
{{< /callout >}}

### Step 8: Serial Number Entry

**For serialized items** (electronics, equipment, tools, assets):

**Navigate to Serial Entry**:
1. Click on line item
2. Click **Serial Numbers** button or tab
3. Serial entry screen opens

**Scanning Process**:

**With Barcode Scanner**:
1. Place cursor in serial number field
2. Scan barcode on item
3. Serial auto-enters
4. Press Enter
5. Repeat for each item
6. System counts serials entered

**Manual Entry**:
1. Type serial number from label
2. Press Enter
3. System validates format
4. System checks for duplicates
5. Enter next serial

**System Validations**:
- ✓ No duplicate serials in system
- ✓ Serial format matches requirements
- ✓ Count of serials = Received quantity
- ✓ All required serials entered

**Serial Entry Tips**:
- Scan in batches (all serials for one carton, then next)
- Have second person call out serials while you scan
- If scanner fails, photograph serial labels and enter later
- Double-check first few entries for accuracy

**What if Serial Number Unreadable?**
1. Try cleaning label
2. Check if backup label exists
3. Take photo for record
4. Contact supplier for serial number
5. Create temporary serial reference
6. Update when supplier confirms

{{< callout type="info" >}}
**Serial Number Importance**: Serials are critical for:
- Warranty claims (no serial = no warranty)
- Asset tracking (which specific unit is where)
- Returns and exchanges (identify exact unit)
- Theft/loss claims (proof of ownership)
{{< /callout >}}

### Step 9: Storage Location Allocation

**Assign physical storage locations**:

**Navigate to Location**:
1. Click line item
2. Click **Storage Location** or **Allocate** button
3. Location assignment screen opens

**Location Structure**:
```
Warehouse: Main Warehouse
Zone: A (Fast-moving)
Aisle: 03
Rack: R-07
Level: 2 (chest height)
Bin: B-05
```

**Full Location Code**: `MAIN-A-03-R07-L2-B05`

**Assignment Methods**:

**Method 1: System Suggests**:
- System suggests location based on:
  - Item category
  - Available space
  - Historical location
  - Turnover rate
- Accept or modify suggestion

**Method 2: Manual Selection**:
- Know where item goes
- Navigate location hierarchy
- Select specific location
- Enter quantity for location

**Method 3: Scan Location**:
- Scan location barcode
- System auto-fills location
- Enter quantity
- Fastest method if labels exist

**Split Quantity Across Locations**:

If storing in multiple locations:
```
Item: Widget A, Total: 200 units

Location 1: MAIN-A-03-R07-L2-B05 - 150 units
Location 2: MAIN-B-05-R12-L1-B03 - 50 units

Total: 200 units ✓
```

**Location Strategy**:
- **Fast-moving**: Near dispatch area, chest height
- **Bulk items**: Lower levels, pallet positions
- **Small items**: Upper shelves with access equipment
- **Heavy items**: Ground level, bottom racks
- **Hazardous**: Designated safe area with controls

**Label Storage Location**:
- Apply location label to shelf/bin
- Place items in assigned location
- Ensure items don't block location barcode
- Keep location organized (FIFO arrangement)

{{< callout type="tip" >}}
**Location Accuracy**: Accurate location assignment is critical. Wrong locations mean:
- Can't find stock when needed
- Picking delays
- Inventory count errors
- Frustrated staff
Take time to assign and label correctly!
{{< /callout >}}

### Step 10: Document Attachment

**Attach all supporting documents**:

**Navigation**: Click **Attachments** tab or **Add Document**

**Required Documents**:

**1. Delivery Order (DO)**:
- Supplier's delivery document
- Must show your signature/stamp
- Photo or scan of physical DO

**2. Packing List**:
- Detailed item listing from supplier
- Shows package numbers
- Weights and dimensions

**3. Purchase Invoice** (if delivered with goods):
- Original supplier invoice
- Often comes with delivery
- If not, will attach to invoice entry later

**4. Quality Certificates** (if applicable):
- Certificate of Analysis (COA)
- Test certificates
- Calibration certificates
- Material certificates

**5. Damage Evidence** (if applicable):
- Photos of damaged items
- Photos of damaged packaging
- Photos showing extent of damage
- Video if significant damage

**How to Attach**:

**Mobile Photo**:
1. Use mobile camera
2. Photo each document
3. Upload via mobile app or email to system
4. Fastest method at receiving area

**Scan**:
1. Take documents to scanner
2. Scan multi-page as single PDF
3. Upload to GRN
4. Better quality for records

**File Upload**:
1. Click Add Document
2. Browse to file
3. Select document type from dropdown
4. Add description
5. Upload

**Document Naming**:
- DO-[Supplier]-[Date]-[DONumber]
- PackingList-[Supplier]-[Date]
- Damage-[Item]-[Date]

{{< callout type="warning" >}}
**Audit Requirement**: GRN without attached DO and packing list is incomplete and may not pass audit. Always attach documents before confirming.
{{< /callout >}}

---

## Final Steps

### Step 11: Review and Verify

**Pre-Confirmation Checklist**:

**Data Accuracy**:
- [ ] All received quantities entered correctly
- [ ] Serial numbers match count
- [ ] Storage locations assigned
- [ ] Batch/expiry dates entered (if applicable)
- [ ] Rejection reasons documented

**Documentation**:
- [ ] DO attached
- [ ] Packing list attached
- [ ] Damage photos attached (if applicable)
- [ ] Quality certificates attached (if applicable)

**Physical Alignment**:
- [ ] All items physically placed in assigned locations
- [ ] Rejected items segregated in quarantine area
- [ ] Receiving area cleared
- [ ] Delivery vehicle departed

**Review Summary**:
Click **Review** or **Summary** button

**Verify**:
- Total quantity received
- Total value
- Number of line items
- Number of documents attached
- Any items rejected
- Any items back-ordered

### Step 12: Confirm and Post GRN

**Final Confirmation**:

1. **Click Confirm GRN** or **Post GRN**

2. **System processes**:
   - Validates all data
   - Checks for errors
   - Creates GRN document
   - Updates inventory quantities
   - Updates PO receipt status
   - Creates accounting entries
   - Triggers notifications

3. **Accounting Entries Created**:
```
Debit: Inventory (at PO cost)        $10,000
Debit: Input Tax                      $1,800
Credit: GRN Accrual                           $11,800
```

4. **Inventory Updated**:
   - Stock quantity increased
   - Stock value updated
   - Available in assigned locations
   - Serials registered

5. **PO Status Updated**:
   - Fully Received (if complete)
   - Partially Received (if partial)
   - Closed (if fully received and no more expected)

**System Confirmation**:
- Success message displayed
- GRN number confirmed
- Print option offered

### Step 13: Print and File

**Print GRN**:
1. Click **Print GRN**
2. Review print preview
3. Print copy for:
   - Physical file
   - Warehouse records
   - Accounts payable (if no direct system access)

**Filing**:
- File GRN with attached DO
- Place in "Pending Invoice" folder
- Organized by supplier or date
- Easily accessible for invoice matching

**Notifications**:
System automatically notifies:
- Purchasing admin (GRN completed)
- Accounts payable (ready for invoice matching)
- Requestor (if PO had requestor)

{{< callout type="success" >}}
**Milestone Complete**: GRN is confirmed, inventory updated, and ready for invoice matching. Well done!
{{< /callout >}}

---

## Handling Exceptions

### Partial Delivery

**Scenario**: Ordered 100, received 80

**Process**:
1. Create GRN for 80 received
2. PO remains open for 20 balance
3. Document reason (supplier out of stock, etc.)
4. Contact supplier:
   - When will balance be delivered?
   - Separate delivery or next regular order?
5. Set reminder to follow up
6. When balance arrives, create second GRN against same PO

### Damaged Goods

**Scenario**: 10 items damaged in transit

**Process**:
1. **Segregate** damaged items immediately
2. **Photo document** damage thoroughly
3. **Create GRN**:
   - Received Qty: 90 (good items)
   - Rejected Qty: 10 (damaged)
   - Reason: Damage in transit
4. **Driver acknowledgment**: Get driver to sign/initial damage note on DO
5. **Notify supplier** immediately (email + call)
6. **Request replacement** or credit note
7. **Quarantine area**: Keep damaged goods in quarantine
8. **Wait for supplier decision**:
   - Return damaged goods
   - Dispose (with authority)
   - Accept with discount
9. **Process credit note** when received

### Wrong Items Delivered

**Scenario**: Ordered Item A, received Item B

**Process**:
1. **STOP**: Do not receive wrong items into inventory
2. **Verify**: Triple-check it's wrong (not just different packaging)
3. **Photo evidence**: Document wrong items
4. **Contact supplier** immediately
5. **Options**:
   - **Reject completely**: Driver takes back, nothing received
   - **Accept temporarily**: Create GRN with "On Hold" status
6. **If rejecting**:
   - Note on DO: "Rejected - wrong items"
   - Driver signs acknowledgment
   - Items return with driver
   - No GRN created
7. **If accepting temporarily**:
   - Create GRN with hold status
   - Quarantine items
   - Wait for supplier resolution
   - Reverse GRN if items return

### Over-Delivery

**Scenario**: Ordered 50, received 60

**Process**:
1. **System warns** about over-delivery
2. **Get supervisor approval** before accepting
3. **Check**:
   - Warehouse space available?
   - Price same as ordered quantity?
   - Budget available for extra?
4. **If accepting excess**:
   - Receive all 60
   - Note over-delivery in remarks
   - Expect revised invoice for 60
   - Ensure accounting is notified
5. **If rejecting excess**:
   - Receive only 50
   - Reject 10 items
   - Driver takes back 10
   - Note on DO
6. **Contact supplier**:
   - Confirm acceptance or rejection
   - Clarify invoice amount

### Invoice Delivered with Goods

**Scenario**: Supplier includes invoice with delivery

**Process**:
1. **Receive goods normally** (create GRN)
2. **Collect invoice** from driver
3. **Attach to GRN** as supporting document
4. **Forward to AP**: After GRN confirmed
   - Physical copy, or
   - Scan and email, or
   - System notification (AP can access attached invoice)
5. **AP processes** invoice normally with GRN reference

---

## Best Practices

### Do's
- ✅ Count accurately, count twice if needed
- ✅ Scan all serial numbers
- ✅ Assign storage locations immediately
- ✅ Attach all documents before confirming
- ✅ Photo document any damage
- ✅ Process GRN same day as receipt
- ✅ Segregate damaged/rejected items
- ✅ Communicate issues immediately

### Don'ts
- ❌ Rush counting to get driver moving
- ❌ Accept damaged goods without documentation
- ❌ Leave items in receiving area overnight
- ❌ Mix consignment with owned stock
- ❌ Skip serial number entry
- ❌ Create GRN without physical goods present
- ❌ Guess on quantities
- ❌ Accept over-deliveries without approval

{{< callout type="warning" >}}
**Critical Error**: Creating GRN before physically receiving goods inflates inventory, creates accounting errors, and fails audits. NEVER create GRN for goods not actually received.
{{< /callout >}}

---

## Tips for Efficiency

### Speed Up Receiving

**Pre-Preparation**:
- Review expected deliveries night before
- Pre-print PO copies
- Clear receiving area in advance
- Pre-assign storage locations
- Brief team on special requirements

**Batch Processing**:
- Process one PO/delivery at a time
- Complete before moving to next
- Don't leave GRNs half-done

**Mobile Entry**:
- Use mobile devices at receiving area
- Enter data as you count
- Real-time serial scanning
- Upload photos immediately
- No need to return to desk

**Team Approach**:
- One person counts/scans
- Another person enters data
- Third person organizes storage
- Parallel activities save time

### Maintain Accuracy

**Count Methodology**:
- Count in groups (tens, twenties)
- Use counting trays or bins
- Mark counted items
- Two-person count for high-value

**Serial Number Accuracy**:
- Scan slowly and carefully
- Verify scans are captured
- Check count matches
- Keep serials in order (easier to find later)

**Location Precision**:
- Use location barcodes
- Verify location exists and is correct
- Label items with location
- Update location maps if needed

---

## Troubleshooting

### Error: "PO Not Found"

**Cause**: PO number incorrect or PO not in system
**Fix**:
1. Verify PO number on DO
2. Search in system (might be typed wrong)
3. Contact purchasing admin
4. If no PO: Use Direct GRN workflow

### Error: "Cannot Receive More Than Ordered"

**Cause**: Trying to receive more than PO quantity
**Fix**:
1. Verify physical count is correct
2. Check if over-delivery is legitimate
3. Get supervisor approval
4. System may allow with approval override

### Error: "Serial Number Already Exists"

**Cause**: Serial number already in system
**Fix**:
1. Verify you scanned/typed correctly
2. Check if item was previously received
3. If duplicate serial, contact supplier
4. Might be supplier error (duplicated serial)

### Error: "Location Does Not Exist"

**Cause**: Storage location code invalid
**Fix**:
1. Verify location code is correct
2. Check location exists physically
3. Create location in system if new
4. Use location picker instead of manual entry

---

## Related Documentation

### Workflows
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow) - Complete purchasing process
- [Direct GRN Workflow](/guides/purchasing-guides/direct-grn-workflow) - GRN without PO
- [Purchasing Overview](/user-guide/daily-tasks/purchasing-overview) - Daily task guide

### Next Steps
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing) - Matching invoices to GRNs
- [Creating Purchase Orders](/user-guide/daily-tasks/creating-purchase-order) - Creating POs

### Module Documentation
- [Purchasing Module](/modules/purchasing/) - All purchasing features
- [Inventory Module](/modules/inventory/) - Inventory management
- [Warehouse Management](/modules/inventory/) - Storage and locations

{{< callout type="success" >}}
**Mastery Milestone**: When you can receive deliveries smoothly, create accurate GRNs quickly, and maintain perfect inventory accuracy, you've mastered goods receipt!
{{< /callout >}}
