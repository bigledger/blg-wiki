---
title: "Delivery Order Processing"
description: "Guide to generating and managing delivery orders for customer shipments"
weight: 32
---

Delivery Orders (DO) are critical documents that authorize warehouse staff to release goods and provide proof of delivery to customers. This guide covers the complete delivery order process from generation to confirmation.

## What is a Delivery Order?

A Delivery Order is an official document that:
- **Authorizes** warehouse to release specific goods
- **Lists** items, quantities, and serial numbers to be delivered
- **Confirms** delivery when signed by customer
- **Provides** legal proof of goods transferred
- **Triggers** invoice finalization and payment collection

{{< callout type="info" >}}
**Critical Document**: The signed DO is your proof that customer received the goods. Without it, customer can dispute delivery. Never skip obtaining customer signature.
{{< /callout >}}

---

## Delivery Order Generation Process

### Prerequisites

Before generating a DO:
- ✅ Sales Order confirmed
- ✅ Stock picked and verified by warehouse
- ✅ Serial numbers recorded (for serialized items)
- ✅ Stock converted in system
- ✅ Delivery date confirmed with customer

### Step-by-Step: Creating Delivery Order

**Step 1: Convert Stock in System**

1. Open confirmed Sales Order
2. Navigate to **Stock Conversion** section
3. For each item, enter:
   - Serial numbers (from warehouse document)
   - Batch numbers (if applicable)
   - Stock location (rack/bin)
4. Save stock conversion
5. System marks items as "Allocated"

**Step 2: Generate Delivery Order**

1. From Sales Order, click **Generate Delivery Order**
2. System creates DO with:
   - DO Number (e.g., DO-2024-00123)
   - Customer details
   - Delivery address
   - Items with quantities
   - Serial numbers
   - Delivery date
3. Review all details carefully
4. Click **Confirm** to finalize DO

**Step 3: Generate Invoice**

1. From same Sales Order, click **Generate Invoice**
2. System creates invoice with:
   - Invoice Number (e.g., INV-2024-00123)
   - All order items and pricing
   - Tax calculations
   - Total amount
   - Deposit deducted (if applicable)
   - Balance due
3. Verify all calculations
4. Confirm invoice

**Step 4: Print Documents**

Print 3 copies of each:

**Delivery Order Copies**:
- Customer Copy (signed copy stays with customer)
- Office Copy (returned with signature)
- File Copy (admin records)

**Invoice Copies**:
- Customer Copy (payment reference)
- Driver Copy (collect payment based on this)
- Office Copy (accounts filing)

**Step 5: Prepare Delivery Package**

1. Clip DO and Invoice together for each delivery
2. Add Sales Order (with serial numbers)
3. Include delivery address and customer phone
4. Note any special instructions
5. Hand to warehouse for loading

For complete details on the standard delivery process, see the [Standard Sales Workflow](../../guides/sales-guides/standard-sales-workflow).

---

## Delivery Execution

### Driver's Responsibilities

**Before Departure**:
- Review trip listing for the day
- Check all delivery documents present
- Verify items loaded match DOs
- Ensure tools/equipment ready

**During Delivery**:
- Call customer 30 minutes before arrival
- Unload and verify items with customer
- Read items from DO to customer
- Customer inspects condition
- Obtain customer signature on DO
- Take delivery photos
- Upload photos immediately
- Collect payment if applicable

**After Delivery**:
- Return signed DOs to office
- Hand over payments collected
- Report any issues

See [Standard Sales Workflow - Step 9](../../guides/sales-guides/standard-sales-workflow#step-9-delivery-execution) for detailed delivery execution procedures.

---

## DO Management

### Modifying Delivery Orders

**Before Delivery**:
- Can edit items/quantities
- Regenerate with updated information
- Inform warehouse and driver

**During/After Delivery**:
- Cannot modify signed DO
- If error discovered: Document and create adjustment note

### Partial Deliveries

If delivering part of an order:
1. Create DO for items being delivered
2. Mark as "Delivery 1 of 2" (or appropriate)
3. Remaining items: Create second DO later
4. See [Partial Delivery Workflow](../../guides/sales-guides/partial-delivery-workflow)

### Delivery Issues

**Customer Not Available**:
- Document attempt
- Reschedule delivery
- Update trip listing

**Wrong Address**:
- Contact customer immediately
- Get correct address
- Update system
- Redeliver (may charge fee if customer error)

**Damaged Goods**:
- Don't leave damaged items
- Document with photos
- Contact office
- Arrange replacement

---

## Best Practices

✅ **Verify Serial Numbers**: Match warehouse document to system before generating DO

✅ **Print Same Day**: Generate and print DOs on delivery day for accuracy

✅ **Clear Instructions**: Include delivery notes and contact info on DO

✅ **Photo Evidence**: Take photos of every delivery, upload immediately

✅ **Customer Signature**: Never leave without signed DO

✅ **Immediate Return**: Driver returns signed DOs same day

---

## Related Documentation

- [Creating Sales Orders](creating-sales-order) - Previous step
- [Trip Listing Management](trip-listing-management) - Delivery scheduling
- [Sales Payment Collection](sales-payment-collection) - Collecting payments
- [Standard Sales Workflow](../../guides/sales-guides/standard-sales-workflow) - Complete process

---

*Delivery Orders are the bridge between order confirmation and customer receipt. Accurate DOs and proper execution ensure smooth deliveries and happy customers.*
