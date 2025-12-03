---
title: "Standard Sales Workflow"
description: "Complete order-to-delivery sales process with deposit collection, scheduled delivery, and payment reconciliation"
weight: 10
---

The Standard Sales Workflow is the most comprehensive sales process in BigLedger, covering the complete journey from customer order through delivery and final payment reconciliation. This workflow is ideal for businesses selling appliances, furniture, electronics, or any products requiring scheduled delivery and deposit collection.

## Workflow Overview

This workflow involves all key teams working together in a coordinated sequence:

```
Sales Admin → Customer Profile → Sales Order → Deposit Collection →
Delivery Scheduling → Warehouse Preparation → Stock Conversion →
Invoice & DO Generation → Delivery Execution → Payment Collection →
Accounts Reconciliation
```

{{< callout type="info" >}}
**Process Duration**: Typically 1-7 days from order to delivery, depending on stock availability and customer's preferred delivery date.
{{< /callout >}}

## When to Use This Workflow

Use the Standard Sales Workflow when:
- Customer requires scheduled delivery (not immediate)
- Deposit collection is required before delivery
- Stock needs to be reserved and prepared
- Serial number tracking is necessary
- Multiple team coordination is involved
- Formal delivery documentation is required

{{< callout type="warning" >}}
**Not Suitable For**: Walk-in cash sales with immediate delivery (use [Cash Sales Workflow](cash-sales-workflow) instead) or credit-approved customers (use [Credit Sales Workflow](credit-sales-workflow)).
{{< /callout >}}

## Detailed Process Steps

### Step 1: Open Customer Profile in System

**Responsible**: Sales Admin

**Objective**: Ensure customer exists in system with accurate information

#### Actions:

1. Navigate to **Sales & CRM Module** → **Customer Maintenance**
2. Search for existing customer by:
   - Customer name
   - Phone number
   - Email address
   - Customer code

3. **If customer exists**: Verify and update information if needed
4. **If new customer**: Create new customer profile

#### Required Customer Information:

- **Basic Details**
  - Full name (individual) or company name
  - Contact person name (for companies)
  - Primary phone number
  - Email address
  - Billing address
  - Delivery address (if different)

- **Business Information**
  - Customer type (Individual/Company)
  - Tax registration number (if applicable)
  - Industry/Business type
  - Payment terms (if pre-approved)

- **Communication Preferences**
  - Preferred contact method
  - WhatsApp number
  - Best time to contact

{{< callout type="tip" >}}
**Best Practice**: Always collect complete customer information upfront. Missing details cause delays in delivery scheduling and payment collection.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] Customer name spelled correctly
- [ ] Phone number includes country/area code
- [ ] Delivery address complete with landmarks
- [ ] Email address format valid
- [ ] Tax details correct (if required)

---

### Step 2: Create Sales Order and Collect Deposit

**Responsible**: Sales Admin

**Objective**: Generate formal sales order and secure deposit payment

#### Creating the Sales Order:

1. Navigate to **Sales Module** → **Create Sales Order**
2. Select the customer from dropdown (search by name or code)
3. Set the **Order Date** (usually today's date)
4. Add items to the order:
   - Click **Add Item**
   - Search and select product by name or code
   - Enter **Quantity**
   - Verify **Unit Price** (should auto-populate from pricebook)
   - Check any applicable **Discounts**
   - Confirm **Tax** calculation

5. Review order totals:
   - Subtotal (before tax)
   - Tax amount
   - **Grand Total**

#### Deposit Collection:

6. In the **Payment** section:
   - Enter **Deposit Amount** (percentage or fixed amount based on policy)
   - Select **Payment Method**:
     - Cash
     - Bank Transfer
     - Credit Card
     - Cheque
   - Enter **Payment Reference** (if applicable)
   - For bank transfers: Attach transfer slip photo/screenshot

7. Calculate and display **Balance Due**:
   - Balance Due = Grand Total - Deposit Amount

8. **Save and Confirm** the sales order
9. System generates **Sales Order Number** (e.g., SO-2024-00123)

#### Deposit Collection Methods:

**Cash Payment**:
- Count cash in front of customer
- Issue printed receipt immediately
- Place cash in register/safe
- Record in cash collection log

**Bank Transfer**:
- Verify transfer slip details match order amount
- Check account number and date
- Take photo or scan transfer slip
- Attach to sales order in system
- Verify payment received in bank (same day or next day)

**Credit Card**:
- Process through POS terminal
- Attach card receipt to sales order
- Customer signs card slip
- File both merchant and customer copies

**Cheque**:
- Verify cheque details:
  - Correct payee name
  - Amount matches (numbers and words)
  - Signed and dated
  - Post-dated not too far ahead
- Take photo of cheque (front and back)
- Deposit cheque promptly
- Note cheque number on sales order

{{< callout type="tip" >}}
**Deposit Policy**: Many businesses collect 10-50% deposit. Higher-value items typically require larger deposits. Define your policy clearly and apply consistently.
{{< /callout >}}

#### Sales Order Documentation:

10. **Print Sales Order** (2 copies):
    - Customer copy (give to customer immediately)
    - Office copy (for warehouse and admin file)

11. Customer acknowledgment:
    - Customer signs office copy
    - Customer receives their copy with deposit receipt

#### Validation Checkpoints:

- [ ] All items added with correct quantities
- [ ] Pricing verified and discounts applied correctly
- [ ] Tax calculation accurate
- [ ] Deposit amount meets minimum policy requirement
- [ ] Payment method recorded correctly
- [ ] Payment reference/proof attached
- [ ] Customer signed acknowledgment
- [ ] Balance due clearly communicated to customer

{{< callout type="warning" >}}
**Common Mistake**: Not collecting sufficient deposit upfront leads to issues with customer commitment and cancellations. Follow your company's deposit policy strictly.
{{< /callout >}}

---

### Step 3: Confirm Delivery/Installation Date and Add to Trip Listing

**Responsible**: Sales Admin

**Objective**: Schedule delivery date and coordinate logistics

#### Scheduling Process:

1. Discuss with customer:
   - **Preferred delivery date** (check stock availability)
   - **Preferred time slot**:
     - Morning (9 AM - 12 PM)
     - Afternoon (2 PM - 5 PM)
     - Specific time (if customer requires)
   - **Delivery address** confirmation
   - **Contact person** who will receive delivery
   - **Phone number** for delivery day coordination

2. Check internal constraints:
   - **Stock availability** (confirm items in warehouse)
   - **Delivery capacity** (check trip listing for that day)
   - **Geographic route** (optimize delivery routing)
   - **Special requirements** (installation crew needed?)

#### Adding to Trip Listing:

3. Navigate to **Logistics** → **Trip Listing**
4. Select the **Delivery Date**
5. Click **Add Delivery** or find existing trip for that route
6. Enter delivery details:
   - Sales Order Number
   - Customer Name
   - Delivery Address
   - Contact Number
   - Estimated Time
   - Special Instructions (e.g., "Call 30 mins before", "Use back entrance")

7. Assign to delivery route:
   - Group by geographic area
   - Optimize sequence to minimize travel time
   - Consider time windows requested by customers

8. **Save** trip listing entry

#### Installation Scheduling (if applicable):

If products require installation:
- Coordinate installation team availability
- Allocate sufficient time (e.g., 1-2 hours per installation)
- Ensure tools and materials are prepared
- Confirm customer understands installation time

#### Customer Communication:

9. Confirm delivery details with customer:
   - Delivery date: [specific date]
   - Time window: [morning/afternoon/specific time]
   - Driver will call 30 minutes before arrival
   - Ensure someone available to receive
   - Prepare space for installation (if applicable)

10. Add customer to WhatsApp delivery coordination group (optional)

11. Set reminder in system for 1 day before delivery

{{< callout type="info" >}}
**Trip Listing Benefits**: Organizing deliveries by route and date improves delivery efficiency by 30-40% and reduces fuel costs significantly.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] Delivery date confirmed and recorded
- [ ] Time window agreed with customer
- [ ] Delivery address verified and complete
- [ ] Contact person and phone number confirmed
- [ ] Added to trip listing for correct date
- [ ] Delivery route optimized
- [ ] Special instructions noted
- [ ] Stock availability confirmed for delivery date
- [ ] Installation scheduled (if needed)
- [ ] Customer received confirmation

{{< callout type="tip" >}}
**Best Practice**: Always call customer 1 day before delivery to re-confirm. This reduces failed deliveries due to customer unavailability.
{{< /callout >}}

---

### Step 4: Print Daily Sales Orders and Trip Listing

**Responsible**: Sales Admin

**Objective**: Provide physical documents for warehouse and delivery teams

#### Daily Morning Routine:

**Every day at start of business (e.g., 8:00 AM):**

1. **Print Sales Orders for the Day**:
   - Navigate to **Sales Module** → **Sales Orders**
   - Filter by:
     - Delivery Date = Today
     - Status = Confirmed/Awaiting Delivery
   - Select all relevant orders
   - Click **Print Multiple** or print individually
   - Print 2 copies of each:
     - Copy 1: For warehouse (picking and packing)
     - Copy 2: For driver (delivery confirmation)

2. **Print Trip Listing**:
   - Navigate to **Logistics** → **Trip Listing**
   - Filter by Date = Today
   - Review all scheduled deliveries:
     - Verify completeness
     - Check for any last-minute changes
     - Confirm optimal routing
   - **Print Trip Listing** (2 copies):
     - Copy 1: For driver (main reference)
     - Copy 2: For admin office (tracking)

#### What to Include in Prints:

**Sales Order Print Should Show**:
- SO Number
- Customer Name and Contact
- Delivery Address
- Items ordered (with quantities and descriptions)
- Serial numbers (if already assigned)
- Special instructions
- Total amount and balance due

**Trip Listing Print Should Show**:
- Date
- Route/Area
- Sequential delivery order
- For each delivery:
  - SO Number
  - Customer Name
  - Address (with landmarks)
  - Phone Number
  - Estimated Time
  - Special Notes
- Total deliveries for the day

#### Distribution:

3. **Distribute to Teams**:
   - **Warehouse Helper**: Sales Orders for stock picking
   - **Delivery Driver**: Trip Listing + Sales Orders for each delivery
   - **Admin File**: Keep copies for tracking and reference

4. **Brief warehouse team**:
   - Review priority orders
   - Highlight any special handling requirements
   - Confirm expected preparation timeline
   - Note any installation requirements

5. **Brief delivery team**:
   - Walk through route and sequence
   - Discuss time commitments
   - Review special instructions
   - Confirm vehicle and equipment ready

{{< callout type="warning" >}}
**Important**: Print these documents EVERY morning, even if you think the team already knows. Physical documents prevent confusion and provide legal proof of instructions.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] All sales orders for today printed
- [ ] Trip listing complete and accurate
- [ ] Route sequence optimized
- [ ] Special instructions highlighted
- [ ] Copies distributed to correct teams
- [ ] Warehouse team briefed
- [ ] Delivery team briefed
- [ ] Admin copies filed

---

### Step 5: Warehouse Stock Preparation

**Responsible**: Warehouse Helper

**Objective**: Pick, verify, and prepare stock for delivery

#### Stock Picking Process:

1. **Receive Sales Orders** from admin:
   - Review all orders for the day
   - Prioritize by delivery sequence
   - Check for any special handling notes

2. **For Each Sales Order**:

   **Locate Items**:
   - Check **Racking Location** in system or warehouse map
   - Navigate to storage location
   - Verify item by:
     - Product code
     - Description
     - Visual inspection

   **Pick Correct Quantity**:
   - Count items carefully
   - For serialized items: Select specific units
   - Check item condition:
     - No damage
     - Clean and presentable
     - All accessories included
     - Packaging intact

3. **Record Serial Numbers**:
   - **Critical for serialized products** (electronics, appliances, etc.)
   - On the Sales Order paper document, write down:
     - Item name/code
     - Serial number(s)
     - Racking location picked from
   - For multiple units: Record ALL serial numbers

   **Example**:
   ```
   Item: LED TV 55"
   Model: SNTV-55X
   Serial Numbers:
   - SN12345678
   - SN12345679
   Picked from: Rack A3, Level 2
   ```

4. **Note Racking Information**:
   - Record exact location for inventory tracking
   - Note any stock transfers if moved
   - Update racking if location changed

#### Quality Check:

5. **Inspect Each Item**:
   - Physical condition: No scratches, dents, defects
   - Completeness: All parts, accessories, manuals included
   - Functionality: Test if possible (turn on, basic check)
   - Packaging: Original boxes, protective materials

6. **Prepare for Delivery**:
   - Add extra protective packaging if needed
   - Label items with Sales Order Number
   - Group items by sales order
   - Place in staging area

#### Documentation:

7. **Update Sales Order Document**:
   - Write ALL serial numbers on printed SO
   - Note racking locations
   - Initial/sign that picking is complete
   - Add time completed
   - Note any issues or stock discrepancies

8. **Alert Admin** if:
   - Any items not available (out of stock)
   - Item condition not acceptable
   - Serial numbers don't match system
   - Need to substitute alternative product

{{< callout type="tip" >}}
**Accuracy is Critical**: Recording serial numbers correctly prevents major issues with warranty claims, returns, and inventory tracking. Take your time and double-check.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] All items located successfully
- [ ] Correct quantities picked
- [ ] Serial numbers recorded accurately
- [ ] Racking locations noted
- [ ] Items inspected for quality
- [ ] All accessories and parts included
- [ ] Items properly labeled with SO number
- [ ] Protective packaging added
- [ ] Sales Order document updated with notes
- [ ] Admin notified of completion or issues

{{< callout type="warning" >}}
**Common Mistakes**:
- Recording wrong serial numbers
- Forgetting to note racking location
- Picking damaged items
- Missing accessories
Always double-check before moving to next step.
{{< /callout >}}

---

### Step 6: Admin Converts Stock in System

**Responsible**: Sales Admin

**Objective**: Update system inventory based on warehouse picking information

#### Stock Conversion Process:

1. **Receive Picked Sales Orders** from warehouse:
   - Collect all sales orders with serial numbers recorded
   - Verify warehouse helper's notes are complete and legible
   - Check for any issue flags or notes

2. **For Each Sales Order**:

   **Navigate to Sales Order in System**:
   - Open **Sales Module** → **Sales Orders**
   - Find the specific Sales Order by number
   - Open for editing/processing

3. **Enter Serial Numbers**:
   - For each serialized item in the order:
     - Click on item line
     - Find **Serial Number** field
     - Enter serial number(s) from warehouse document
     - **Double-check accuracy**: Compare with paper document
   - If multiple units: Enter all serial numbers
   - System may validate serial numbers against inventory

4. **Update Stock Status**:
   - Change order status from "Confirmed" to **"Stock Allocated"** or **"Ready for Delivery"**
   - System automatically:
     - Reserves stock for this order
     - Updates available inventory quantities
     - Records serial number assignments
     - Adjusts racking quantities

5. **Verify Inventory Deduction**:
   - Check that inventory shows:
     - Quantity reduced by items allocated
     - Serial numbers marked as "allocated"
     - Racking balance updated
   - If discrepancies: Investigate immediately

#### Handle Stock Issues:

**If Stock Shortage Discovered**:
- Mark items as "Backorder"
- Notify customer of delay
- Offer alternatives:
  - Wait for restock (provide date)
  - Accept partial delivery now
  - Substitute similar product
  - Cancel and refund deposit
- Update delivery schedule accordingly

**If Wrong Serial Numbers**:
- Verify with warehouse helper
- Correct in system immediately
- Re-verify inventory accuracy

{{< callout type="info" >}}
**Why Convert Stock?**: This step reserves the specific items for the customer and ensures accurate inventory tracking. It prevents double-allocation of the same serial numbered items.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] All serial numbers entered accurately
- [ ] Serial numbers match warehouse document
- [ ] Stock status updated to "Allocated" or "Ready"
- [ ] Inventory quantities reduced correctly
- [ ] Racking balance updated
- [ ] No system errors or warnings
- [ ] Stock reservation confirmed
- [ ] Any issues flagged and resolved
- [ ] Customer notified if changes to order

---

### Step 7: Print Invoice and Delivery Order

**Responsible**: Sales Admin

**Objective**: Generate formal delivery and billing documents

#### Document Generation Process:

1. **Verify Readiness**:
   - Confirm stock is converted and allocated
   - Verify serial numbers entered
   - Check delivery date is confirmed
   - Ensure any customer changes are updated

2. **Generate Invoice**:

   **Navigate to Sales Order**:
   - Open the confirmed Sales Order
   - Review all details one final time:
     - Items and quantities
     - Pricing and discounts
     - Tax calculations
     - Serial numbers
     - Delivery information

   **Create Invoice**:
   - Click **Generate Invoice** or **Convert to Invoice**
   - System auto-populates:
     - Invoice Number (e.g., INV-2024-00123)
     - Invoice Date
     - Due Date (based on payment terms)
     - Items from sales order
     - Serial numbers
     - Pricing and tax
   - Review **Invoice Totals**:
     - Subtotal
     - Tax Amount
     - **Grand Total**
     - Deposit Already Paid
     - **Balance Due** (this is what customer owes on delivery)

   **Finalize Invoice**:
   - Save and **Confirm** invoice
   - System marks invoice as "Issued"

3. **Generate Delivery Order (DO)**:

   **From the Same Sales Order**:
   - Click **Generate Delivery Order**
   - System creates DO with:
     - DO Number (e.g., DO-2024-00123)
     - DO Date (delivery date)
     - Customer details
     - Delivery address
     - Items with quantities
     - Serial numbers
     - Special delivery instructions

   **Delivery Order Should Include**:
   - All items being delivered
   - Serial numbers clearly listed
   - Quantity verification checkboxes
   - Customer signature section
   - Delivery date and time fields
   - Delivery team signature
   - Photo evidence checklist

   **Finalize Delivery Order**:
   - Review all details
   - Save and **Confirm**
   - Mark as "Ready for Dispatch"

#### Print Documents:

4. **Print Invoice** (3 copies):
   - Copy 1: Customer (for payment and records)
   - Copy 2: Driver (collect payment based on this)
   - Copy 3: Office File (admin filing)

5. **Print Delivery Order** (3 copies):
   - Copy 1: Customer (keep after signing)
   - Copy 2: Driver (return with signature to office)
   - Copy 3: Office File (admin filing)

#### Document Verification:

6. **Review Printed Documents**:
   - All information clear and readable
   - Serial numbers match between Invoice and DO
   - No printing errors or cut-off text
   - Amounts calculated correctly
   - Balance due is prominent and clear

7. **Prepare Delivery Package**:
   - Clip Invoice and DO together
   - Attach sales order (with serial numbers)
   - Add any special instructions
   - Include customer contact details
   - Note installation requirements (if any)

#### Loading Preparation:

8. **Notify Warehouse Helper**:
   - Stock ready for loading
   - Provide Invoice and DO copies
   - Highlight any special handling
   - Confirm delivery date/time

9. **Brief Delivery Team**:
   - Review delivery documents
   - Explain balance due collection
   - Discuss any special instructions
   - Confirm customer contact protocol

{{< callout type="tip" >}}
**Print Quality**: Ensure printouts are clear and professional. These are legal documents and customer-facing. Poor quality reflects badly on your business.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] Invoice generated and confirmed
- [ ] Invoice number assigned
- [ ] Grand total and balance due correct
- [ ] Deposit amount deducted properly
- [ ] Delivery Order generated and confirmed
- [ ] DO number assigned
- [ ] Serial numbers listed on both documents
- [ ] All copies printed clearly
- [ ] Documents match (invoice, DO, SO)
- [ ] Delivery package prepared
- [ ] Warehouse helper notified
- [ ] Delivery team briefed

{{< callout type="warning" >}}
**Critical**: The Balance Due on the invoice MUST match what customer was told during order. Discrepancies cause serious problems during delivery. Verify before printing.
{{< /callout >}}

---

### Step 8: Load Items for Delivery

**Responsible**: Warehouse Helper

**Objective**: Load verified stock onto delivery vehicle safely

#### Loading Process:

1. **Receive Delivery Documents**:
   - Get Invoice and DO from admin
   - Match with previously picked items
   - Verify SO numbers match

2. **Final Pre-Loading Check**:
   - Count items against DO
   - Verify serial numbers match documents
   - Check item condition one final time:
     - No damage occurred during storage
     - Packaging still intact
     - All accessories present
   - If any issues found: Alert admin immediately

3. **Prepare Vehicle**:
   - Ensure delivery truck/van is:
     - Clean and dry
     - Sufficient space
     - Protective blankets available
     - Straps and tie-downs ready
   - Position vehicle for easy loading

4. **Load Items Systematically**:

   **Loading Sequence** (reverse delivery order):
   - Last delivery items loaded first (back of vehicle)
   - First delivery items loaded last (near door)
   - Heavy items on bottom
   - Fragile items on top
   - Secure all items

   **For Each Item**:
   - Handle carefully
   - Use protective blankets/padding
   - Secure with straps to prevent movement
   - Keep items upright (check orientation labels)
   - Separate items by sales order if possible

   **Fragile Items**:
   - Extra padding and protection
   - Mark clearly "Fragile" or "Handle With Care"
   - Position away from heavy items
   - Secure to prevent sliding

5. **Loading Verification**:
   - Driver and warehouse helper jointly verify:
     - All items loaded match DO
     - Quantities correct
     - Serial numbers spot-checked
     - All accessories included
     - Proper securing of all items
   - Both sign/initial loading checklist

6. **Provide Documents to Driver**:
   - Invoice (customer copy + driver copy)
   - Delivery Order (customer copy + return copy)
   - Trip Listing
   - Any special instruction sheets
   - Customer contact information

7. **Final Vehicle Check**:
   - Doors secured
   - Items won't shift during transport
   - Emergency equipment present
   - Driver has phone and charger
   - Fuel sufficient for all deliveries

{{< callout type="tip" >}}
**Loading Efficiency**: Organize by delivery route. First delivery near the door saves time and reduces handling damage. Plan the load before starting.
{{< /callout >}}

#### Installation Tools (if applicable):

If installation required:
- [ ] Tool kit complete
- [ ] Installation materials (screws, brackets, etc.)
- [ ] Power tools charged
- [ ] Measuring tape and level
- [ ] Cleaning supplies
- [ ] Safety equipment

#### Validation Checkpoints:

- [ ] All items verified against DO
- [ ] Serial numbers spot-checked
- [ ] Items properly protected
- [ ] Loading sequence follows delivery route
- [ ] Heavy items secured at bottom
- [ ] Fragile items protected and marked
- [ ] All items tied down and secured
- [ ] Documents provided to driver
- [ ] Loading checklist signed by both parties
- [ ] Vehicle safe for transport
- [ ] Installation tools loaded (if needed)

{{< callout type="warning" >}}
**Liability Alert**: Both warehouse helper and driver share responsibility for verifying items loaded. Damage during transport can be disputed if loading wasn't verified properly.
{{< /callout >}}

---

### Step 9: Delivery Execution

**Responsible**: Delivery Driver

**Objective**: Deliver items to customer, obtain proof, and collect payment

#### Pre-Delivery Preparation:

1. **Review Trip Listing**:
   - Understand all deliveries for the day
   - Note time commitments
   - Plan route and sequence
   - Identify any special requirements

2. **Morning Vehicle Check**:
   - Fuel level adequate
   - Tires and vehicle condition
   - All items loaded properly
   - Documents organized and ready
   - Phone charged and functioning

#### For Each Delivery:

3. **Customer Communication**:
   - **Call customer 30 minutes before arrival**:
     - "Good morning, this is [Name] from [Company]"
     - "We're delivering your order [SO Number] today"
     - "We'll arrive in approximately 30 minutes"
     - "Is there anyone home to receive?"
     - "Do you need any special assistance?"
   - Confirm address and landmarks
   - If customer not available: Coordinate timing or reschedule

4. **Upon Arrival**:
   - Park safely and appropriately
   - Greet customer professionally
   - Introduce yourself and company
   - Reference customer's Sales Order
   - Explain delivery and verification process

5. **Unload and Verify Items**:

   **With Customer Present**:
   - Unload items one by one
   - Show customer each item
   - Read out from Delivery Order:
     - Item description
     - Quantity
     - Serial number
   - Customer inspects each item:
     - Verify it's the correct product
     - Check for visible damage
     - Test basic functionality (if possible)
     - Confirm all accessories included

   **Document Verification**:
   - Customer reviews Delivery Order
   - Customer checks items match their Sales Order
   - Confirm quantities
   - Verify serial numbers (customer may note them down)

6. **Handle Delivery Issues**:

   **If Item Damaged**:
   - Document damage with photos immediately
   - Note on Delivery Order
   - Customer initials damage note
   - Contact admin/office for instructions
   - Discuss options:
     - Leave item and arrange replacement
     - Don't deliver; return to warehouse
     - Accept item with discount

   **If Wrong Item**:
   - Do NOT leave incorrect item
   - Contact office immediately
   - Verify serial numbers and product codes
   - Arrange correct item delivery
   - Apologize for inconvenience

   **If Customer Refuses Delivery**:
   - Understand reason
   - Try to resolve if possible
   - Document reason for refusal
   - Contact office for guidance
   - Get customer signature refusing delivery
   - Return items to warehouse

#### Installation (if applicable):

7. **Perform Installation**:
   - Ask customer where to place/install
   - Verify location suitable (power outlet, space, etc.)
   - Protect customer's floors and walls
   - Install according to manufacturer guidelines
   - Test functionality completely
   - Clean up installation area
   - Provide basic operation instructions
   - Answer customer questions

8. **Warranty and Documentation**:
   - Provide warranty cards
   - Explain warranty terms
   - Show customer product manual
   - Provide company contact information
   - Explain after-sales service

#### Delivery Confirmation:

9. **Obtain Customer Signature**:
   - Present Delivery Order for signing
   - Ensure customer reviews before signing:
     - Items delivered match DO
     - Quantities correct
     - Serial numbers noted
     - Condition acceptable
   - Customer signs in designated area
   - Print customer name clearly
   - Add date and time
   - Customer keeps their copy of DO

10. **Photo Evidence**:
    - Take clear photos showing:
      - Delivered items in customer's location
      - Serial number labels (close-up)
      - Installation completed (if applicable)
      - Customer's satisfied approval (optional selfie)
      - Overall delivery scene
    - **Upload photos to WhatsApp group** immediately:
      - Label with SO Number
      - Brief caption: "SO-2024-00123 delivered to [Customer Name]"
    - Alternatively: Upload to company system/app if available

{{< callout type="tip" >}}
**Photo Evidence is Critical**: Photos protect both company and driver from false claims. Take photos even if customer seems completely satisfied. Upload immediately while at customer location.
{{< /callout >}}

#### Payment Collection:

11. **Collect Balance Due**:

    **Reference Invoice**:
    - Show customer the Invoice
    - Point out:
      - Grand Total
      - Deposit Already Paid
      - **Balance Due Now**
    - Clearly state amount to collect

    **Accept Payment Methods**:

    **Cash**:
    - Count cash with customer present
    - Verify amount matches balance due
    - If customer gives larger notes: Provide change
    - Write receipt or mark invoice "Paid in Cash"
    - Customer signs invoice as proof of payment
    - Secure cash safely

    **Cheque**:
    - Verify cheque details:
      - Correct company name as payee
      - Amount matches (numbers and words)
      - Dated (not post-dated too far)
      - Signed by customer
    - Take photo of cheque (front and back)
    - Write customer name and SO number on back
    - Mark invoice "Paid by Cheque #[number]"
    - Customer signs invoice

    **Bank Transfer**:
    - Customer shows transfer confirmation/receipt
    - Verify details:
      - Correct company account
      - Amount matches balance due
      - Transaction date
      - Reference number
    - Take clear photo of transfer slip/phone screen
    - Mark invoice "Paid by Transfer - Ref: [number]"
    - Customer signs invoice

    **Financing Agreement** (AEON, JCL, etc.):
    - Customer signs agreement documents
    - Verify all fields completed:
      - Customer information
      - Product details
      - Financing terms
      - Signature and date
    - Give customer their copy
    - Keep company copies
    - Mark invoice "Financed through [Company]"
    - Customer signs invoice

12. **Provide Receipt/Documentation**:
    - Customer keeps:
      - Delivery Order (signed copy)
      - Invoice (customer copy, marked as paid)
      - Warranty cards
      - Product manuals
      - Financing agreement (customer copy)
    - Thank customer for their business
    - Provide company contact for any questions
    - Remind of warranty and service options

#### Post-Delivery:

13. **Update Trip Listing**:
    - Mark delivery as completed
    - Note time delivered
    - Note any issues or special occurrences

14. **Organize Documents**:
    - Keep all signed DOs together
    - Keep all payment documents (cash, cheques, receipts)
    - Keep financing agreements
    - Keep photos evidence accessible
    - Organize by SO number for easy office matching

15. **Move to Next Delivery**:
    - Review next stop on trip listing
    - Call next customer 30 minutes before arrival
    - Repeat process

{{< callout type="info" >}}
**Professional Service**: Your attitude and professionalism during delivery significantly impacts customer satisfaction and likelihood of repeat business. Be courteous, patient, and helpful.
{{< /callout >}}

#### End of Day:

16. **Return to Office/Warehouse**:
    - Complete all deliveries
    - Return any undelivered items (with documentation why)
    - Bring all documents and payments
    - Debrief with admin on any issues

#### Validation Checkpoints (Per Delivery):

- [ ] Customer called 30 minutes before arrival
- [ ] All items unloaded and verified with customer
- [ ] Serial numbers checked
- [ ] Item condition inspected by customer
- [ ] Installation completed (if applicable)
- [ ] Customer signature obtained on DO
- [ ] Photos taken and uploaded to WhatsApp/system
- [ ] Balance due collected in full
- [ ] Payment method documented
- [ ] Invoice marked as paid and signed
- [ ] Customer received all documentation
- [ ] Customer satisfied and questions answered
- [ ] Trip listing marked complete

{{< callout type="warning" >}}
**Never Leave Without**:
1. Customer signature on Delivery Order
2. Photo evidence uploaded
3. Payment collected (or clear documentation why not)
These three items are non-negotiable for every delivery.
{{< /callout >}}

---

### Step 10: Return Documents and Payments to Admin

**Responsible**: Delivery Driver

**Objective**: Hand over all physical documents and collected payments

#### End-of-Day Handover:

1. **Prepare Documents for Handover**:
   - Organize all documents by Sales Order number
   - Separate different payment types
   - Ensure all documents signed and complete
   - Review for any missing items

2. **What to Hand Over**:

   **Documents**:
   - [ ] Signed Delivery Orders (office copies)
   - [ ] Signed Invoices (office copies, marked paid)
   - [ ] Financing Agreements (AEON, JCL - all copies)
   - [ ] Cheques collected
   - [ ] Bank transfer slips (originals or photos)
   - [ ] Credit card receipts (if applicable)
   - [ ] Any customer notes or special requests
   - [ ] Trip listing (marked with completions)
   - [ ] Failed delivery documentation (if any)

   **Payments**:
   - [ ] Cash (counted and organized)
   - [ ] Cheques (with photos taken)
   - [ ] Transfer slips/receipts
   - [ ] Financing agreements completed

3. **Cash Handling**:
   - Count cash before giving to admin
   - Organize by denomination if significant amount
   - Place in envelope or cash bag
   - Note total amount on envelope
   - List SO numbers for each cash payment

4. **Handover Process**:

   **With Admin Present**:
   - Give verbal summary of day:
     - Number of deliveries completed
     - Any failed/rescheduled deliveries
     - Total payments collected
     - Any customer issues or complaints
     - Any damage or return situations

   **Joint Verification**:
   - Admin and driver review together:
     - Count cash jointly - verify against records
     - Check all cheques present and verified
     - Confirm transfer slips received
     - Verify financing agreements complete
     - Check all DOs have signatures
     - Verify photo evidence uploaded

   **Sign Handover Log**:
   - Driver signs that all documents/payments handed over
   - Admin signs that all documents/payments received
   - Note date and time
   - List SO numbers included
   - Note any discrepancies

5. **Discuss Issues**:
   - Report any delivery problems
   - Explain any payment discrepancies
   - Discuss customer feedback (positive or negative)
   - Highlight any follow-up needed
   - Report any items returned to warehouse

6. **Confirm Photo Uploads**:
   - Admin checks that photos uploaded for all deliveries
   - If missing: Upload immediately while driver present
   - Ensure photos clearly show SO number and items

{{< callout type="tip" >}}
**Complete Handover**: Don't rush this step. Taking 15-30 minutes to properly hand over prevents hours of reconciliation problems later.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] All signed Delivery Orders handed over
- [ ] All signed Invoices handed over
- [ ] All financing agreements handed over
- [ ] All cash counted and verified
- [ ] All cheques checked and verified
- [ ] All transfer slips provided
- [ ] Cash count matches admin records
- [ ] All DOs have customer signatures
- [ ] All photos uploaded to WhatsApp/system
- [ ] Trip listing marked complete
- [ ] Any issues explained and documented
- [ ] Handover log signed by both parties
- [ ] Admin satisfied with documentation
- [ ] Driver debriefed on any problems

{{< callout type="warning" >}}
**Accountability**: The handover process establishes clear chain of custody for payments and documents. Both driver and admin are accountable. Never skip or rush this step.
{{< /callout >}}

---

### Step 11: Admin Reconciles Payments with System

**Responsible**: Sales Admin

**Objective**: Match physical payments to system records and confirm amounts

#### Reconciliation Process:

1. **Prepare for Reconciliation**:
   - Clear workspace
   - Have all documents from driver
   - Open system to Sales Orders
   - Have calculator ready
   - Prepare reconciliation checklist

2. **For Each Sales Order Delivered**:

   **Open in System**:
   - Find Sales Order by number
   - Review order details:
     - Grand Total
     - Deposit Paid
     - Balance Due

   **Match Physical Documents**:
   - Locate corresponding:
     - Signed Delivery Order
     - Signed Invoice
     - Payment evidence (cash, cheque, transfer slip, agreement)

3. **Verify Payment Amount**:

   **Check Payment Matches**:
   - Payment collected = Balance Due shown in system
   - If discrepancy: Investigate immediately

   **Common Discrepancy Reasons**:
   - Pricing changed after order
   - Discount applied at delivery
   - Partial payment accepted
   - Extra charges added (delivery fee, installation)
   - Customer dispute or deduction

   **If Amount Doesn't Match**:
   - Check invoice vs system (which is correct?)
   - Review with driver (was there negotiation?)
   - Contact customer if needed
   - Escalate to manager for resolution
   - **Do not proceed until resolved**

4. **Verify Payment Method**:

   **Cash**:
   - Count physical cash for this SO
   - Match against invoice marked amount
   - Verify customer signed invoice
   - Check cash is genuine (not counterfeit)
   - Record in cash book
   - Place cash in safe/register

   **Cheque**:
   - Verify cheque details:
     - Payee name correct
     - Amount matches balance due (numbers and words)
     - Signed by customer
     - Date current (not post-dated too far)
     - Account details visible
   - Check photo was taken
   - Write SO number on back of cheque
   - Prepare for bank deposit
   - Record in cheque register

   **Bank Transfer**:
   - Review transfer slip/screenshot
   - Verify details:
     - Correct company account number
     - Amount matches balance due
     - Transaction reference number
     - Date of transfer
   - **Check bank account online**:
     - Verify funds actually received
     - Match reference number
     - Confirm amount
   - If not yet received: Mark as "Pending Verification"
   - Record in transfer log

   **Financing Agreement** (AEON, JCL):
   - Verify agreement fully completed:
     - All customer information filled
     - Product details correct
     - Financing amount matches balance due
     - Customer signature and date
     - All required fields completed
   - Check both customer and company copies
   - Scan/photo company copy
   - Prepare for submission to finance company
   - Record as "Financed - Pending Approval"

5. **Update System**:

   **Record Payment**:
   - In Sales Order/Invoice section
   - Click **Record Payment** or **Add Payment**
   - Enter details:
     - Payment Date (delivery date)
     - Amount Received
     - Payment Method
     - Reference Number (cheque #, transfer ref, agreement #)
   - **Upload Supporting Documents**:
     - Photo of cheque
     - Transfer slip image
     - Financing agreement scan
   - Save and confirm

   **Update Order Status**:
   - Mark Sales Order as **"Delivered"**
   - Mark Invoice as **"Paid"** or **"Partially Paid"**
   - System updates:
     - Accounts Receivable balance
     - Customer payment history
     - Sales reporting

6. **Verify System Balance**:
   - After recording payment, check:
     - Invoice shows Fully Paid (or correct balance)
     - No remaining balance due (unless partial payment)
     - Customer account updated
   - If balance still showing: Check payment recorded correctly

#### Daily Reconciliation Summary:

7. **Create Daily Summary Report**:
   - List all deliveries completed today
   - For each delivery show:
     - SO Number
     - Customer Name
     - Grand Total
     - Deposit (previous)
     - Balance Collected Today
     - Payment Method
     - Status

   **Calculate Totals**:
   - Total Cash Collected: $____
   - Total Cheques Collected: $____
   - Total Transfers: $____
   - Total Financed: $____
   - **Grand Total Collected: $____**

8. **Physical Count Verification**:
   - Count total cash in hand
   - Match against summary total
   - Count cheques and match total
   - Verify all transfer slips present
   - If discrepancy: Find and resolve immediately

9. **Flag Any Issues**:
   - Payments not matching
   - Missing documents
   - Unsigned delivery orders
   - Customer disputes
   - Incomplete financing agreements
   - Transfer funds not yet received

{{< callout type="info" >}}
**Reconcile Daily**: Never let reconciliation accumulate. Reconcile every evening after deliveries. Errors are much harder to track down days later.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] All delivered SOs reconciled
- [ ] Payment amounts match system balance due
- [ ] All payment methods verified
- [ ] Cash counted and matches records
- [ ] Cheques verified and logged
- [ ] Bank transfers confirmed received
- [ ] Financing agreements complete
- [ ] All payments recorded in system
- [ ] System balances updated correctly
- [ ] Invoices marked as paid
- [ ] Sales orders marked as delivered
- [ ] Daily summary report completed
- [ ] Physical cash matches summary
- [ ] All discrepancies investigated and resolved
- [ ] Documents filed properly

{{< callout type="warning" >}}
**Critical Control Point**: Reconciliation is your primary control against errors, fraud, and disputes. Any discrepancy must be resolved same day. Never mark items as reconciled if amounts don't match.
{{< /callout >}}

---

### Step 12: Confirm Delivery and Pass Documents to Accounts

**Responsible**: Sales Admin

**Objective**: Final confirmation and handover to accounts department

#### Final Confirmation:

1. **Verify Delivery Completion**:
   - All items delivered as per DO
   - Customer signature obtained
   - Photo evidence uploaded and accessible
   - Payment collected (or documented reason if not)
   - System fully updated

2. **Quality Assurance Check**:
   - Review delivery photos
   - Check customer satisfaction (any issues reported?)
   - Verify serial numbers delivered match system
   - Confirm no damage or complaint reports
   - Check for any follow-up needed (installation, service, etc.)

3. **Final System Updates**:
   - Sales Order Status: **"Completed"**
   - Invoice Status: **"Paid"** (or appropriate status)
   - Delivery Order Status: **"Delivered and Confirmed"**
   - Customer Account: Balance updated
   - Inventory: Serial numbers marked as delivered
   - Any notes or special situations documented

#### Document Preparation for Accounts:

4. **Organize Document Package**:

   **Physical Documents to Include**:
   - [ ] Original Sales Order (with all signatures)
   - [ ] Signed Delivery Order (with customer signature)
   - [ ] Customer-signed Invoice (marked paid)
   - [ ] Deposit receipt (from step 2)
   - [ ] Final payment evidence:
     - Cash receipt
     - Cheque (or cheque copy)
     - Bank transfer slip
     - Financing agreement
   - [ ] Any adjustment notes or authorizations
   - [ ] Photos printed (or accessible digitally)

   **Digital Documents/Evidence**:
   - Ensure system has:
     - Scanned/uploaded DOs
     - Payment receipt images
     - Delivery photos
     - Email confirmations
     - Any customer communications

5. **Create Accounts Handover Summary**:

   **Summary Sheet Should Include**:
   - SO Number
   - Customer Name
   - Invoice Number
   - Invoice Date
   - Delivery Date
   - Grand Total
   - Deposit Amount (and date)
   - Balance Collected (and date)
   - Payment Methods
   - Status: Complete/Pending/Issues
   - Notes

6. **Financial Summary**:
   - Total Revenue (Grand Total)
   - Total Deposits Previously Received
   - Total Balance Collected Today
   - By Payment Method:
     - Cash
     - Cheque
     - Bank Transfer
     - Financing
   - Any Outstanding Items

#### Handover to Accounts:

7. **Schedule Handover**:
   - Accounts team typically prefers batch handovers
   - Daily handover: End of each business day
   - OR weekly handover: Every Friday
   - Follow your company's procedure

8. **Handover Meeting**:

   **With Accounts Team Present**:
   - Present document package
   - Walk through summary
   - Explain any unusual situations:
     - Discounts given
     - Payment plans
     - Disputes or adjustments
     - Pending financing approvals
   - Answer any questions
   - Provide context for any deviations

9. **Accounts Team Verification**:
   - Accounts staff reviews:
     - Documents complete
     - Amounts match system
     - Proper approvals for adjustments
     - Payment evidence adequate
     - Ready for financial posting

10. **Sign Handover Log**:
    - Admin signs: Documents handed over
    - Accounts signs: Documents received
    - Date and time recorded
    - List SO numbers included
    - Note any issues or pending items

11. **Address Any Queries**:
    - If accounts finds issues: Resolve immediately
    - If documents missing: Retrieve and provide
    - If amounts don't reconcile: Investigate together
    - **Do not complete handover until accounts satisfied**

#### Post-Handover Actions:

12. **Update Handover Status in System**:
    - Mark SO as "Handed to Accounts"
    - Record handover date
    - Note accounts officer who received
    - Change status to prevent further changes

13. **File Admin Copies**:
    - Keep copies for sales department records
    - File by date or SO number
    - Ensure easy retrieval if needed
    - Follow company retention policy

14. **Customer Follow-Up** (optional but recommended):
    - Send thank you message/email
    - Request feedback or review
    - Confirm satisfaction
    - Remind of warranty and support
    - Build relationship for future sales

15. **Close Sales Cycle**:
    - Sales cycle now complete
    - Customer can be contacted for:
      - Repeat purchases
      - Referrals
      - Testimonials
      - Loyalty programs
    - Archive all documentation

{{< callout type="tip" >}}
**Clean Handover**: A well-organized handover to accounts saves everyone time and prevents back-and-forth requests for missing documents. Invest time in proper organization.
{{< /callout >}}

#### Validation Checkpoints:

- [ ] Delivery fully confirmed in system
- [ ] All documentation complete
- [ ] Physical documents organized
- [ ] Digital documents uploaded
- [ ] Handover summary prepared
- [ ] Financial totals calculated
- [ ] Any issues documented and explained
- [ ] Accounts team verified documents
- [ ] Handover log signed by both parties
- [ ] Admin copies filed properly
- [ ] System status updated
- [ ] Customer follow-up scheduled (if applicable)
- [ ] Sales cycle closed

{{< callout type="info" >}}
**Accounts Integration**: Proper handover to accounts ensures timely financial reporting, accurate revenue recognition, and clean audit trails. This step closes the sales-to-cash cycle.
{{< /callout >}}

---

## Complete Workflow Summary

### Timeline Overview:

| Step | Responsible | Typical Duration | Critical Points |
|------|------------|------------------|-----------------|
| 1. Customer Profile | Sales Admin | 5-10 minutes | Accurate information |
| 2. Sales Order & Deposit | Sales Admin | 15-20 minutes | Correct pricing, adequate deposit |
| 3. Delivery Scheduling | Sales Admin | 5-10 minutes | Customer confirmation, route optimization |
| 4. Print Documents | Sales Admin | 5 minutes daily | Every morning routine |
| 5. Stock Preparation | Warehouse Helper | 30-60 min per order | Serial number accuracy |
| 6. Stock Conversion | Sales Admin | 5-10 minutes | Serial number verification |
| 7. Invoice & DO Generation | Sales Admin | 10-15 minutes | Document accuracy |
| 8. Loading | Warehouse Helper | 30-45 minutes | Verification and securing |
| 9. Delivery Execution | Driver | 1-3 hours per route | Customer signature, photos, payment |
| 10. Document Return | Driver | 15-30 minutes | Complete handover |
| 11. Payment Reconciliation | Sales Admin | 30-45 minutes | Amount verification |
| 12. Accounts Handover | Sales Admin | 15-30 minutes | Document completeness |

**Total Duration**: Typically 1-7 days from order to completion

### Success Metrics:

**Process Efficiency**:
- Order-to-delivery time: Target < 3 days
- First-delivery success rate: Target > 95%
- Payment collection rate: Target 100%
- Documentation accuracy: Target 100%

**Customer Satisfaction**:
- On-time delivery rate: Target > 95%
- Delivery damage rate: Target < 1%
- Customer complaint rate: Target < 2%
- Payment dispute rate: Target < 1%

**Financial Control**:
- Deposit collection rate: Target 100%
- Daily reconciliation completion: Target 100%
- Payment discrepancy rate: Target < 0.5%
- Accounts handover timeliness: Target same day

## Common Mistakes and How to Avoid Them

### 1. Insufficient Deposit Collection
**Mistake**: Accepting too small a deposit or no deposit.
**Impact**: Customer cancellations, cash flow problems.
**Solution**: Enforce minimum deposit policy (e.g., 30-50%). No exceptions without manager approval.

### 2. Incorrect Serial Numbers
**Mistake**: Recording wrong serial numbers or skipping this step.
**Impact**: Warranty issues, inventory chaos, customer disputes.
**Solution**: Double-check at warehouse and again at system entry. Verify before delivery.

### 3. Missing Customer Signatures
**Mistake**: Driver forgets to get signature or accepts delivery without it.
**Impact**: Customer can dispute delivery, no legal proof.
**Solution**: Make signature mandatory. Driver cannot mark complete without uploading signed DO.

### 4. No Photo Evidence
**Mistake**: Forgetting to take delivery photos.
**Impact**: Cannot prove condition or completion if customer complains.
**Solution**: Make photos mandatory part of delivery checklist. Upload before leaving customer location.

### 5. Payment Collection Errors
**Mistake**: Accepting wrong amount, not verifying cheque details, trusting verbal "I'll transfer later".
**Impact**: Revenue loss, reconciliation problems, bad debts.
**Solution**: Always verify amount matches invoice. Get payment or clear written agreement before leaving.

### 6. Poor Communication
**Mistake**: Not calling customer before delivery, not updating team on issues.
**Impact**: Failed deliveries, wasted trips, customer frustration.
**Solution**: Mandatory customer call 30 mins before arrival. WhatsApp group for real-time updates.

### 7. Delayed Reconciliation
**Mistake**: Waiting days or weeks to reconcile payments.
**Impact**: Cannot find discrepancies, documents lost, disputes harder to resolve.
**Solution**: Reconcile same day, every day. No exceptions.

### 8. Incomplete Handover to Accounts
**Mistake**: Missing documents, unclear notes, partial information.
**Impact**: Accounts delays, audit issues, revenue reporting errors.
**Solution**: Use checklist. Accounts must verify and sign before handover complete.

## Tips for Smooth Operations

### For Sales Admin:
- Start each day by printing all delivery documents
- Keep customer communication proactive
- Maintain detailed notes in system
- Reconcile before going home each day
- Build good relationships with warehouse and drivers

### For Warehouse Helpers:
- Organize racking clearly with labels
- Always double-check serial numbers
- Report stock discrepancies immediately
- Keep warehouse clean and organized
- Verify items before marking as picked

### For Delivery Drivers:
- Plan route efficiently before starting
- Always call customers 30 minutes ahead
- Be professional and courteous
- Take photos even if customer seems happy
- Count cash carefully with customer present
- Hand over documents completely at end of day

### For Accounts Team:
- Verify documents same day received
- Flag issues immediately to sales admin
- Maintain organized filing system
- Reconcile bank deposits daily
- Follow up on pending financing approvals

## Related Workflows

When standard sales workflow doesn't fit, consider these alternatives:

- **[Credit Sales Workflow](credit-sales-workflow)** - For approved customers with no deposit
- **[Cash Sales Workflow](cash-sales-workflow)** - For walk-in immediate sales
- **[Instalment Sales Workflow](instalment-sales-workflow)** - For AEON, JCL financing
- **[Partial Delivery Workflow](partial-delivery-workflow)** - When splitting shipments
- **[Installation Scheduling Workflow](installation-scheduling-workflow)** - Complex installations
- **[Returns & Exchanges Workflow](returns-exchanges-workflow)** - Post-delivery issues

## Need Help?

{{< callout type="info" >}}
**Questions or Issues?**
- Consult your sales manager for policy questions
- Contact IT support for system issues
- Refer to [Sales Module Documentation](/modules/sales-crm/) for features
- See [User Guide Daily Tasks](/user-guide/daily-tasks/) for step-by-step instructions
{{< /callout >}}

---

*This workflow represents best practices for standard sales processes. Adapt to your business needs while maintaining critical control points like deposit collection, documentation, and reconciliation.*
