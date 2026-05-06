---
title: "Internal Consignment Purchase Order Applet"
description: "Create and manage purchase orders for consigned inventory, tracking supplier ownership, planned delivery schedules, knock-off reconciliation, and deferred billing with full posting controls and audit trails."
tags:
- purchase-workflow
- procurement
- consignment
- purchase-order
- supplier-management
- line-items
- inventory
weight: 18
date: 2026-05-06
lastmod: 2026-05-06
draft: false
---

## Purpose and Overview

The **Internal Consignment Purchase Order Applet** is where your procurement team records **purchase orders for consigned inventory**—goods that a supplier delivers to your company but retains ownership of until you consume, sell, or return them. Unlike standard purchase orders where you take immediate ownership, a consignment PO creates a holding arrangement where the supplier tracks what you have on hand and you pay only for what you actually use.

{{< callout type="info" >}}
**Core Concept**: The applet links **who** you are sourcing from (supplier), **what** consigned items you are taking on (line items with planned delivery schedule), **how** you will receive and track them (knock-off reconciliation), and **when** and **how** you will settle (deferred payment terms and billing cycles).
{{< /callout >}}

An internal consignment purchase order is a **structured, controlled** document: you build it up with line items, set validity and delivery windows, finalize it to lock the terms, and then track incoming shipments against it. Depending on your company's setup, you can also **export** the order to suppliers, link it to related documents, and manage **contra transactions** (adjustments or offsets). As goods arrive and are received, your warehouse team uses the **knock-off** process to reconcile what they received against what was ordered, and finance can then bill you (or credit the supplier account) for the consumed quantity.

## Document Status Reference {#document-status-reference}

| Posting Status | Meaning | What you can do |
|----------------|---------|-----------------|
| **DRAFT** | Work in progress | **SAVE**, **FINAL**, edit all fields, add/remove lines, update supplier details |
| **FINAL** | Posted / locked | **VIEW**, **EXPORT**, **VOID**, link to delivery orders, perform knock-off reconciliation, add attachments or related documents |

{{< callout type="warning" >}}
After **FINAL**, the consignment purchase order is locked and cannot be edited in the normal way. In most setups header fields and line items are read-only; minor fields (for example remarks or external remarks) may still be editable depending on tenant rules. If a formal amendment is required (for example quantity, validity, or payment terms), the usual options are to **VOID** the order and create a replacement, or follow your organisation's amendment process — contact your administrator for the tenant-specific procedure.
{{< /callout >}}

---

## Before You Start

- You need a **supplier** that exists in master data (you will select it on the **Account** tab). If the supplier is missing, ask your administrator to add it to master data.
- Prepare the **line items** you will source on consignment—product codes, planned quantities, delivery windows, and pricing.
- Know your company's **consignment terms**: how long goods can be held, knock-off process, billing frequency, and payment method.
- Have your **purchaser ID**, **delivery branch**, and **delivery location** ready, as these determine where consigned stock will be received.
- If your company uses **custom statuses**, **department allocation**, or **contra lines**, confirm these are enabled and have your defaults ready.
- Check your **permissions**: can you **create** consignment orders, **finalize** them, and perform **knock-off** reconciliation if needed?

If you are unsure whether knock-off, payment tabs, or department allocation apply to your login, ask your **administrator** or **procurement team lead**.

---

## Glossary {#glossary}

| Term | Meaning in this guide |
|------|------------------------|
| **Consignment Purchase Order** | A purchase order for goods that the supplier retains ownership of until your company consumes, sells, or returns them. |
| **Posting Status** | The state of the order: **DRAFT** (editable) or **FINAL** (locked for changes). |
| **Line Items** | The products or services listed on the consignment order with quantities, pricing, delivery windows, and terms. |
| **Supplier** | The vendor or consignor providing consigned goods. |
| **Validity** | The time period during which the consignment order terms are active. |
| **Planned Notification Schedule (PNS)** | The expected delivery schedule for consigned items, with dates and quantities. |
| **Knock-Off** | The reconciliation process: matching what was ordered against what was actually received and invoiced, reducing the supplier's holding claim. |
| **A/RAP** | Accounts Receivable / Accounts Payable integration—financial posting for settlement. |
| **Contra** | Offset or adjustment transactions that reduce supplier balances or inventory holdings. |
| **Credit Terms** | Payment agreement (for example Net 30, Net 60) specifying when your company pays for consumed goods. |
| **Delivery Details** | Branch, location, and scheduling information for where consigned goods arrive. |
| **Department Allocation** | Cost centre, profit centre, project, or segment coding for financial allocation of the order. |
| **Consignment Holding** | The period and quantity of goods retained by your company on the supplier's behalf. |
| **Consignor Purchase Billing** | The invoice issued by the supplier for consumed consignment items. |

---

## Key Features Overview

### Who Benefits from This Applet?

**Procurement and purchasing staff:**
- Create consignment purchase orders quickly with **Create** and a guided tab layout (**Main Details**, **Account**, **Line Items**, **Payment**, and more)
- Set validity periods and planned delivery schedules to communicate expectations to suppliers
- Attach purchase requisitions or other supporting documents to maintain full sourcing history
- Link knock-off records to track what has been received and reconciled

**Procurement managers and team leads:**
- Review all consignment orders from the **Internal Consignment Purchase Order Listing** with supplier, validity, amount, and posting status visible
- Use **FINAL** on the listing to post multiple selected orders in one action
- Monitor knock-off status and aging of consignment holdings to ensure timely reconciliation
- Export orders to PDF or other formats for supplier communication

**Warehouse and receiving staff:**
- View planned delivery schedules from **Delivery Details** tab to prepare for incoming consigned shipments
- Reference knock-off section when goods arrive to reconcile actual receipt against the order
- Confirm quantities and condition of consigned inventory before accepting delivery

**Finance and operations staff:**
- See consignment order amounts, payment terms, and posting status
- Review **A/RAP** (Accounts Payable) integration to track supplier balances and settlement
- Use **Contra** section for adjustments or offsets when needed
- Rely on structured **Payment** terms for billing cycle coordination with **Consignor Purchase Billing**

**Administrators and configuration owners:**
- Control defaults, field visibility, printable formats, branch behaviour, and permissions from **Settings**
- Enable or hide optional tabs (**Department**, **A/RAP**, **KO**, **Delivery Details**, **Contra**) based on tenant requirements
- Let users override layout with **Personalization** (for example default branch, language, and tab orientation)

### What Problems Does This Solve?

**The informal consignment arrangement problem:**

Without a structured consignment purchase order, early-stage supplier relationships often use ad hoc agreements—spreadsheets, email threads, or verbal terms. That makes it hard to know when goods arrived, what quantities are on hand, who owns what, when to pay, or what the actual holding cost is.

**The Internal Consignment Purchase Order Applet solution:**

- **Single source of truth** for each consignment arrangement, with a full header, supplier account, and line structure shared with other purchase applets in the platform
- **Clear ownership tracking** where the supplier retains title until knock-off (reconciliation) or consumption, and your company never takes general ledger inventory ownership until invoiced
- **Planned delivery scheduling** via **Delivery Details** and **Planned Notification Schedule** so your warehouse knows when to expect shipments
- **Knock-off reconciliation** to match what was ordered, what arrived, and what was invoiced—reducing supplier holdings step by step
- **Deferred payment terms** via **Payment** and **Credit Terms** so you pay only for consumed items, not for the entire holding
- **Full audit trail** and **Trace Document** tab so you can see every change, who approved it, and when posting status changed
- **Related document linking** to **Supplier Delivery Order**, **Consignor Purchase Billing**, and **Consignee Stock Transfer** so the entire consignment lifecycle stays visible

{{< figure src="/images/internal-consignment-purchase-order-applet/internal-consignment-purchase-order-applet-overview-infographic.png" alt="Internal Consignment Purchase Order Applet overview showing supplier-owned stock, planned delivery, knock-off reconciliation, and deferred billing" caption="From supplier-owned stock to settled consumption: a consignment workflow that tracks delivery, reconciliation, and billing in one document." >}}

---

## Key Concepts

### The Consignment Framework: Who, What, How, When

| Question | Answer | In this applet |
|----------|--------|-----------------|
| **Who?** | Which supplier is consigning goods to us? | **Account** tab: select supplier, confirm billing and shipping details |
| **What?** | Which products are on consignment, in what quantities? | **Line Items** tab: product codes, quantities, UOM, unit pricing |
| **How?** | How will we receive, track, and reconcile the consignment? | **Delivery Details** tab (PNS) and **KO** tab (knock-off reconciliation) |
| **When?** | When do supplier terms start/end, and when do we pay? | **Main Details** tab (validity period), **Payment** tab (credit terms), linked **Consignor Purchase Billing** |
| **How much?** | What is the total value, and how is it allocated financially? | **Line Items** (unit price × quantity), **Department** tab (cost allocation), **A/RAP** tab (financial posting) |

---

## Quick Start Guide

Follow these steps to create and finalize a consignment purchase order:

### Step 1: Create a New Order
From the **Internal Consignment Purchase Order Listing**, click **Create**. The system opens **Create Internal Consignment Purchase Order** with tabs for **Main Details**, **Account**, **Line Items**, **Payment**, and more.

### Step 2: Set Main Details
On the **Main Details** tab:
- Set **Company** and **Branch** (usually defaulted; confirm correct location)
- Enter **Transaction Date** (the date you are placing this order)
- Enter **Validity** start and end dates (the period during which supplier terms apply)
- Set **Purchaser** (the staff member owning the order)
- Confirm **Credit Terms** (for example Net 30 or Net 60 for invoiced consumption)
- Add optional **Reference** (for example RFQ number or internal PO reference)
- Enter **Remarks** (internal notes) and **External Remarks** (supplier-visible notes)
- Confirm **Currency** and **Currency Rate** if consignment is in foreign currency

### Step 3: Select and Configure Supplier
On the **Account** tab:
- Click **Search Supplier** (or similar control) to find and select the consignor (supplier retaining ownership)
- Confirm or update **Bill To** address (where supplier invoices will be sent)
- Confirm or update **Ship To** address (where consigned goods will be delivered)
- If your company tracks **Delivery Branch** and **Delivery Location** separately, confirm these are set

### Step 4: Add Line Items
On the **Line Items** tab, click **Add Line Item**:
- Search for **Product** (or service) by name, code, or category
- Enter **Quantity Base** (how many units you expect to receive on consignment)
- Confirm **UOM** (Unit of Measure—for example EA for each, BOX for box, KG for kilogram)
- Set **Unit Price** (the supplier's quoted price per unit; the system calculates line total automatically)
- If discounts apply, set the **Discount** field; if tax applies, confirm the **Tax** field shows the correct rate
- (Optional) Add internal or external **Remarks** to the line
- Click **Save** to add the line to the order

Repeat for each consigned product you are sourcing.

### Step 5: (Optional) Set Delivery Schedule
If your company uses **Delivery Details** or **Planned Notification Schedule (PNS)**:
- Click the **Delivery Details** tab
- Enter expected delivery dates, quantities, and any shipping instructions
- This helps your warehouse prepare for incoming stock and track consignment aging

### Step 6: (Optional) Configure Financial Allocation
If your company uses **Department** allocation or **Custom Status** for consignment tracking:
- Click the **Department** tab and set **Segment**, **Profit Center**, **Project**, or other dimension codes as needed
- These allocate the consignment holding cost to the right cost centre
- (Optional) Click **Custom Status** if your process requires additional workflow states

### Step 7: Review and Attach Supporting Documents
- Click the **Attachments** tab to upload or link the supplier's quotation, your purchase requisition, or internal approvals
- Click **Doc Link** tab to link related documents (for example a requisition ID or RFQ)
- This builds full traceability for compliance and auditing

### Step 8: Finalize the Order
When the consignment terms are confirmed with the supplier:
- Click **FINAL** (from the document screen or multi-select on the listing)
- The order posting status changes to **FINAL**, locking header and line fields from further edit
- The supplier can now begin shipments according to the **Validity** and **Delivery Details**

### Workflow Paths

**Path A: Staff Creating, Manager Finalizing**
1. Buyer clicks **Create** and fills **Main**, **Account**, **Line Items**, **Payment**
2. Buyer saves (status stays **DRAFT**) and notifies manager via email or comment
3. Manager opens the order, reviews line items and supplier terms
4. Manager clicks **FINAL** to lock the order; supplier receives notification

**Path B: Buyer Creating and Finalizing**
1. Buyer clicks **Create** and fills all required fields
2. Buyer clicks **FINAL** immediately; order is locked and supplier delivery can begin

---

## Detailed Walkthrough

### Main Details Tab

**Purpose**: Set the order header, validity window, and purchaser information.

{{< figure src="/images/internal-consignment-purchase-order-applet/main-details.png" alt="Main Details tab for Internal Consignment Purchase Order showing company, branch, transaction date, validity, purchaser, and credit terms" caption="Main Details: define the order header, validity period, and purchaser before adding line items." >}}

**Fields to complete:**

- **Company** — Your legal entity (usually defaulted by login branch). Confirm this is correct; most consignment orders are company-specific.
- **Branch** — The operational branch placing the order (for example Jakarta, Surabaya). Used for branch-level reporting and permissions.
- **Location** — Warehouse or plant location (optional; depends on tenant setup).
- **Transaction Date** — The date you are issuing this consignment order to the supplier. Use today's date or a past date if backdating; future dates are typically rejected.
- **Purchaser** — The staff member responsible for this order (for example "Budi Santoso, Procurement Manager"). Used for routing, approvals, and audit trail.
- **Validity** — Enter start and end dates for when this consignment arrangement is active. After the end date, no new shipments are expected unless the order is amended or a new order is created. The validity window is visible to the supplier and warehouse.
- **Credit Terms** — Select from your company's standard payment terms (for example Net 30, Net 60, COD). Credit terms apply to **invoiced consumption** (what you actually used), not the entire holding. When the supplier issues a **Consignor Purchase Billing** invoice for consumed items, this credit term determines when you pay.
- **Reference** — Enter an external reference (for example supplier RFQ number, your internal PO number, or requisition ID) to link this order to prior documents.
- **Remarks** — Internal notes visible only to your company staff.
- **External Remarks** — Notes visible to the supplier. Use this to communicate special handling, delivery instructions, or approval requirements.
- **Base Currency** and **Currency** — If the consignment is priced in a foreign currency (for example USD while your company uses IDR), select the currency and enter the **Currency Rate**. The system converts line totals and reports using this rate.
- (Optional) **End Date**, **Permit No**, **Tracking ID** — Advanced fields; fill if your company's workflow requires them.

{{< callout type="info" >}}
**Tip**: Set **Validity** to a window that matches your consignment arrangement with the supplier. If goods are expected year-round, use a 12-month window. If it is seasonal, set start/end dates to match the season. Validity helps your warehouse and finance team manage aging consignment holdings.
{{< /callout >}}

### Account Tab

**Purpose**: Select the supplier and confirm delivery and billing contact details.

{{< figure src="/images/internal-consignment-purchase-order-applet/account-tab.png" alt="Account tab for Internal Consignment Purchase Order showing supplier selection and billing and shipping addresses" caption="Account: choose the supplier and confirm bill-to and ship-to information for the consignment order." >}}

**Fields to complete:**

- **Supplier** — Click **Search Supplier** and find the consignor (the company supplying consigned goods). Only suppliers that exist in your **Master Data** will appear. If the supplier is missing, ask your administrator to add it before you can proceed.
- **Bill To** — Usually auto-populated from the supplier's master record. This is where the supplier will send invoices for consumed consignment items. Confirm the address is correct; if you need to override it, edit the fields directly.
- **Bill To Address**, **City**, **State**, **Postal Code**, **Country** — Confirm or update the full billing address.
- **Ship To** — Usually the same as **Bill To**, but you can override if consigned goods go to a different location (for example your warehouse while invoices go to accounts payable).
- **Ship To Address**, **City**, **State**, **Postal Code**, **Country** — Confirm or update the full shipping address.
- (Optional) **Delivery Branch** and **Delivery Location** — If your company manages multiple warehouses, set the specific branch and location where consigned goods will be received. This is used for routing receiving documents and knock-off reconciliation.

{{< callout type="info" >}}
**Tip**: If you frequently consign from the same supplier to the same warehouse, ask your administrator to set **Default Delivery Branch** and **Delivery Location** in applet settings so these fields auto-populate.
{{< /callout >}}

### Line Items Tab

**Purpose**: Add the products or services you are taking on consignment.

{{< figure src="/images/internal-consignment-purchase-order-applet/line-items-tab.png" alt="Line Items tab for Internal Consignment Purchase Order showing item selection and quantity and pricing entry" caption="Line Items: add the consigned products, quantities, pricing, tax, and remarks for each line." >}}

**To add a line item:**

1. Click **Add Line Item**
2. The **Select Line Item** dialog opens with tabs: **Search Item**, **Jobsheet Item**, **Quotation Item**, **Previous Consignment PO**
3. Choose the source:
   - **Search Item** — Find product by code, name, or category in your catalog
   - **Jobsheet Item** — If this consignment supports a specific project or job, pull items from the jobsheet
   - **Quotation Item** — If the supplier provided a quotation, pull items from it to avoid re-keying
   - **Previous Consignment PO** — If you consign similar items from this supplier regularly, copy lines from a prior order to speed up entry
4. Select the row; the **Add Line Item** editor opens
5. Complete the line:
   - **Quantity Base** — Enter how many units you expect to receive on consignment (for example 100 boxes)
   - **UOM** (Unit of Measure) — Confirm the unit (EA for each, BOX for box, KG for kilogram, etc.). The system defaults based on the product catalog; override if needed.
   - **Unit Price** — Enter the supplier's quoted price per unit. The system calculates **Line Total** automatically (Quantity × Unit Price).
   - **Discount** — If the supplier offers a discount (for example 5% for bulk consignment), enter the discount percentage or amount. The system recalculates the line total.
   - **Tax** — Confirm the tax rate (for example 10% VAT). If tax does not apply, leave blank or select "Tax Exempt". The system adds tax to the line total if applicable.
   - (Optional) **Remarks** — Add internal notes about this line (for example "Hold for Project X" or "Seasonal stock").
6. Click **Save** to add the line to the order

**Repeat** for each product on consignment.

{{< callout type="info" >}}
**Tip**: Use **Knock-Off** tab after the supplier delivers goods to match actual receipt against these ordered quantities. If the supplier delivers fewer items or you consume and return some stock, the knock-off reconciliation updates what you owe.
{{< /callout >}}

### Payment Tab

**Purpose**: Set payment terms and conditions for invoiced consignment.

**Fields to configure:**

- **Credit Terms** — (Usually pre-filled from **Main Details**). Specifies when you pay for consumed items (for example Net 30 = payment due 30 days after supplier invoice).
- **Payment Method** — How the supplier will be paid (for example bank transfer, check, credit note). Select from your company's configured payment methods.
- **Payment Condition** — Special conditions, if any (for example prepayment, installment, or settlement via contra).
- (Optional) **Settlement Account** — If your company uses settlement accounts for consignment, link it here.

{{< callout type="info" >}}
**Tip**: The **Payment** tab sets terms for **invoiced consumption only**. You do not pay for the entire consignment holding upfront; you pay only when the supplier issues a **Consignor Purchase Billing** invoice for items you have actually used or sold. If you return goods, the supplier may issue a credit note to offset the invoice.
{{< /callout >}}

### Delivery Details Tab

**Purpose**: Set planned delivery schedule and receiving location.

{{< figure src="/images/internal-consignment-purchase-order-applet/delivery-details-tab.png" alt="Delivery Details tab for Internal Consignment Purchase Order showing planned notification schedule and receiving details" caption="Delivery Details: record the expected delivery schedule and receiving location for consigned stock." >}}

**Fields to configure:**

- **Planned Notification Schedule (PNS)** — If your company manages delivery schedules, enter expected delivery dates and quantities:
  - **Delivery Date** — When the supplier should deliver this batch
  - **Quantity** — How many units in this delivery
  - Repeat for each planned shipment during the validity window
- **Delivery Instructions** — Special handling (for example "Keep in cool storage", "Handle fragile", "Notify warehouse manager")
- **Receiving Branch** and **Receiving Location** — Confirm where goods will be physically received (may differ from **Bill To** or **Ship To**)

{{< callout type="info" >}}
**Tip**: Use **Delivery Details** to communicate your expected receipt schedule to the supplier. The warehouse team will reference this when goods arrive and when performing knock-off reconciliation.
{{< /callout >}}

### Knock-Off (KO) Tab

**Purpose**: Reconcile consignment holdings against actual receipt and invoicing.

{{< figure src="/images/internal-consignment-purchase-order-applet/KO-tab.png" alt="KO tab for Internal Consignment Purchase Order showing reconciliation status and line matching information" caption="KO: review how ordered, received, and invoiced quantities reconcile for each line." >}}

**How knock-off works:**

1. When the supplier delivers goods and your warehouse issues a **Supplier Delivery Order** or **Internal Consignment GRN** (Goods Received Note), that receipt is linked to this purchase order
2. The warehouse or receiving staff confirms the quantities actually received (which may differ from the order if items are short-shipped or damaged)
3. When the supplier issues a **Consignor Purchase Billing** invoice for consumed items, the knock-off process matches:
   - Ordered quantity (from **Line Items**)
   - Delivered quantity (from **Supplier Delivery Order** or **GRN**)
   - Invoiced quantity (from **Consignor Purchase Billing**)
4. The system calculates what is still on consignment holding (Delivered − Invoiced = On Hand)

**To manage knock-off:**

- Review the **KO** tab to see the reconciliation status of each line item
- If there are discrepancies (for example short receipt or invoice mismatch), use the **Contra** tab to record adjustments
- Once knock-off is complete for a line, that quantity is no longer counted as a consignment holding; it moves to your accounts payable ledger
- A line is usually complete when the KO status shows fully matched or closed, the ordered, received, and invoiced quantities are aligned, and there is no remaining open balance for that line in the KO view

### Trace Document Tab

**Purpose**: View the full audit trail and posting history.

{{< figure src="/images/internal-consignment-purchase-order-applet/trace-document-tab.png" alt="Trace Document tab for Internal Consignment Purchase Order showing posting history and audit trail information" caption="Trace Document: inspect who changed the order, when posting changed, and which related records are linked." >}}

**Information visible:**

- **Created By** — Staff member who created this order
- **Created Date** — When the order was first created
- **Updated By** — Last staff member to edit the order (if applicable)
- **Updated Date** — When the order was last modified
- **Posting Status Changes** — Historical log showing when the order moved from DRAFT → FINAL → VOID, etc., with timestamps and staff names
- **Attachments Log** — When files were added or removed from the order
- **Related Documents** — Links to supplier delivery orders, GRNs, knock-offs, and consignor invoices that reference this purchase order

{{< callout type="info" >}}
**Tip**: Use **Trace Document** for compliance audits, dispute resolution with suppliers, or tracing cost allocation across multiple consignment orders.
{{< /callout >}}

### Attachments Tab

**Purpose**: Upload or link supporting documents.

**Common attachments:**

- Supplier's quotation or price list
- Your internal purchase requisition
- Delivery schedule confirmation from supplier
- Special terms or amendments (email, contract, etc.)
- Receiving inspection reports or QC notes

**To add an attachment:**

1. Click **Add Attachment** (or **Upload File**)
2. Select the file from your computer (PDF, Word, Excel, image, etc.)
3. (Optional) Add a description or label (for example "Supplier Quotation 2026-05", "Amendment via Email")
4. Click **Save**

The attachment is linked to the order and visible to all authorized staff.

---

## Finalize / Save / Reset

### SAVE

Clicking **SAVE** stores your current changes to the order while keeping **Posting Status** as **DRAFT**. You can continue editing fields, adding or removing line items, and attaching documents. Use **SAVE** frequently as you build the order so you do not lose work.

### FINAL

Clicking **FINAL** transitions the **Posting Status** to **FINAL** and locks the order:

- In most setups, **header fields** (Main Details, Account) and **line items** become read-only after FINAL
- Minor fields such as **Remarks** or **External Remarks** may still be editable, depending on tenant configuration
- The supplier can now begin fulfilling shipments according to the **Validity** and **Delivery Details**
- The order is visible to receiving staff for knock-off matching and to finance staff for payment tracking

{{< callout type="warning" >}}
**After FINAL, the order is locked for normal editing.** If you discover an error or need to change terms (for example quantity, validity, or supplier), the usual options are:

1. **VOID** the order (which cancels it and frees the quantities for a new order)
2. **Create a new order** with the corrected terms
3. Use **Contra** to record adjustments if the supplier agrees to offset the holding

For tenant-specific procedures, contact your administrator.
{{< /callout >}}

### RESET

Some applets offer a **RESET** button to discard unsaved changes and revert to the last saved version. If you have made edits but want to abandon them without saving:

1. Click **RESET** (if available on your screen)
2. The order reverts to its last saved state
3. All unsaved changes are discarded

---

## Audit Trail

The **Trace Document** tab and related audit logs show:

- **User-visible metadata**:
  - **Created By** / **Created Date** — Who initiated the order and when
  - **Updated By** / **Updated Date** — Last editor and timestamp (if applicable)
  - **Posting Status History** — Timeline of DRAFT → FINAL → VOID transitions with staff names and dates
  - **Attachments Metadata** — When files were added, removed, or replaced
  - **Related Document Links** — Timestamps showing when the order was linked to a Supplier Delivery Order, GRN, knock-off record, or Consignor Billing

- **Finance-visible metadata**:
  - **A/RAP Postings** — When accounts payable entries were created
  - **Contra Records** — Adjustments or offsets applied
  - **Department Allocations** — Cost centre assignments and financial dimension values

Use audit trail information to:
- **Track accountability** for who created or modified the order
- **Troubleshoot discrepancies** between ordered, delivered, and invoiced quantities
- **Comply with audits** by showing full history of changes and approvals
- **Dispute resolution** with suppliers (proof of what was ordered, when, and by whom)

---

## FAQ

**Q: What is the difference between Internal Consignment Purchase Order and Internal Purchase Order?**

A: The key difference is **ownership and payment timing**. In an **Internal Purchase Order**, your company is normally buying the goods for itself, so ownership transfers to you when the order is received and invoiced according to your company’s process. In an **Internal Consignment Purchase Order**, the supplier keeps ownership of the goods while they are held at your site. You pay only when the goods are consumed, sold, or otherwise billed through the consignment workflow. In short: standard purchase order = pay for goods you buy; consignment purchase order = hold supplier-owned goods and pay on consumption.

---

**Q: Do I pay for the entire consignment order upfront?**

A: No. You pay only for items that are actually consumed or sold, as invoiced by the supplier via **Consignor Purchase Billing**. The supplier tracks what you have on consignment and invoices you for what you use. Payment terms (for example Net 30) apply to the invoice amount, not the total holding.

---

**Q: What is knock-off reconciliation?**

A: Knock-off is the process of matching what you ordered on the consignment PO against what was actually delivered (Supplier Delivery Order or GRN) and what was invoiced (Consignor Purchase Billing). When all three match or are adjusted, the knock-off is complete, and that quantity is removed from your consignment holding.

---

**Q: How do I know when knock-off reconciliation is complete for a line?**

A: A line is complete when the **KO** tab shows the line as fully matched or closed, the ordered quantity equals the received quantity, and the invoiced quantity has been settled with no remaining open balance. In the UI, you should no longer see an outstanding variance for that line, and the line should stop appearing as an open consignment holding in the KO view. If your tenant shows status labels, look for a completed or closed KO status rather than an in-progress status.

---

**Q: Can I edit a consignment order after marking it FINAL?**

A: No, not in the normal way. After **FINAL**, header and line items are locked. If an amendment is needed (for example, changed quantity or validity dates), you can:
1. **VOID** the order (cancel it) and create a new one with corrected terms
2. Use **Contra** to record adjustments or offsets with supplier approval
3. Follow your company's amendment or purchase order change procedure; ask your administrator for tenant-specific steps.

---

**Q: Can I link this consignment order to a purchase requisition or RFQ?**

A: Yes. On the **Doc Link** tab, you can link this order to related purchase requisitions, quotations, or RFQs. This creates full traceability from request through fulfillment. On the **Attachments** tab, you can also upload or link the original quotation or requisition document.

---

**Q: What happens if the supplier delivers fewer items than ordered?**

A: The warehouse team performs knock-off reconciliation by recording the actual delivered quantity in the **Supplier Delivery Order** or **Internal Consignment GRN**. If the delivery is short, the knock-off shows the difference. The supplier can then deliver the balance later, or you can use **Contra** to record a formal adjustment (for example credit note for the short quantity).

---

**Q: Can I export this order to share with the supplier?**

A: Yes. Click the **Export** tab to generate a PDF, CSV, DOCX, or ZIP file. You can email this to the supplier for their records or to confirm order details before shipment. Use **External Remarks** (on **Main Details**) to include supplier-facing notes.

---

**Q: What is the A/RAP tab?**

A: **A/RAP** = Accounts Receivable / Accounts Payable. This tab shows financial posting information—how the consignment order and related invoices are recorded in your company's general ledger. For most users, this tab is informational; your finance team manages posting. If you need to adjust or review the financial entries, work with your finance lead.

---

**Q: Can I set a custom status for a consignment order?**

A: Yes, if your company has enabled custom statuses (for example "Approved", "Pending Supplier Confirmation", "On Hold"). These appear in the order header or in a dedicated **Custom Status** field. Your administrator configures which custom statuses are available and when they can be applied. Contact your administrator for details.

---

**Q: How do I handle a consignment holding that has been damaged or is becoming obsolete?**

A: Use the **Contra** tab to record an adjustment. Document the reason (for example "Damaged in warehouse", "Inventory write-off") and the amount to be credited. The supplier may issue a credit note, or your company may absorb the loss. Work with your finance team and supplier to agree on the adjustment before recording it.

---

**Q: What if the supplier goes out of business or the consignment arrangement ends before all goods are consumed?**

A: You must settle outstanding consignment holdings immediately. Work with your finance team to:
1. Record a final knock-off for all remaining consignment goods
2. Use **Contra** to adjust supplier holdings to zero
3. Either purchase the goods (move to standard inventory) or return them to the supplier (if possible)
4. Issue final payment or credit note for consumed items

Document all steps in the order's audit trail and attachments for compliance.

---

**Q: Can multiple people work on the same consignment order at the same time?**

A: Not in the normal edit mode. Only one user can open the order in **Edit** at a time. If another user is editing, you will see a "Locked by user X" message and can only view the order. Wait for the other user to save or close the order, then you can edit. For multi-user approvals, use the **Doc Link** or **Attachments** tabs to route for review and comments.

---

**Q: Where can I see all my consignment orders?**

A: Click **Internal Consignment Purchase Order Listing** from the main navigation. This grid shows all orders you can access, with columns for:
- Supplier name
- Order number / ID
- Validity period
- Line item count
- Order amount
- Posting Status (DRAFT, FINAL, VOID)

Use **Advanced Search** to filter by supplier, date range, status, or amount. Multi-select **FINAL** to post multiple orders at once.

---

## Related Applets

- **[Internal Purchase Requisition Applet](/en/applets/purchase-workflow/internal-purchase-requisition-applet/)** — Upstream: when procurement staff identify a need for consignment goods, they may create an internal purchase requisition first, then convert it or reference it when creating the consignment PO for proper approval workflow.

- **[Supplier Delivery Order](/en/applets/purchase-workflow/supplier-delivery-order-applet/)** — Downstream: when the supplier ships consigned goods to your company, they issue a delivery order. Your warehouse receives it and uses it to perform knock-off matching against this consignment PO.

- **[Internal Consignment GRN (Goods Received Note)](/en/applets/warehouse/internal-consignment-grn-applet/)** — Downstream receiving: when consigned goods arrive at your warehouse, the receiving staff issues a GRN to confirm receipt, quantity, and condition. This links to the consignment PO for knock-off reconciliation.

- **[Consignee Stock Transfer](/en/applets/warehouse/consignee-stock-transfer-applet/)** — Downstream inventory: if consigned goods need to be moved within your warehouse or to another location, this applet records the transfer. Useful for managing aging consignment holdings and stock allocation.

- **[Internal Consignor Purchase Billing](/en/applets/purchase-workflow/internal-consignor-purchase-billing-applet/)** — Downstream billing: after consuming or selling consigned items, the supplier issues a billing invoice for the consumed quantity. This applet records that invoice and links it back to the consignment PO for knock-off reconciliation and payment tracking.

- **[Internal Purchase Invoice Applet](/en/applets/purchase-workflow/internal-purchase-invoice-applet/)** — Final settlement: if items from a consignment holding are eventually purchased (not returned), a standard purchase invoice may be issued. This applet handles the final purchase transaction and payment.

---

Last updated: May 6, 2026
