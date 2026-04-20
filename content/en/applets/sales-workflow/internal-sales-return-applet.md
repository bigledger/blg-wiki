---
title: "Sales Return (Internal) Applet"
description: "Record customer returns after sales, keep stock and balances accurate, and align warehouse and finance on one return document."
tags:
- sales-return
- customer-returns
- refund-management
- inventory-adjustment
- workflow-approval
weight: 60
date: 2026-04-06
lastmod: 2026-04-20
draft: false
---

## Purpose and Overview

A **sales return** is a document for **goods or credit** your **customer** sends back **after** a sale has already been recorded. The **Sales Return (Internal)** applet is where you enter that return, save your work as you go, and **finalize** it when the business approves—so **inventory** and **what the customer owes** stay accurate, and **warehouse** and **finance** can rely on the same official record where your setup supports it.

### Video Overview

{{< youtube WxLCxGMR6Ls >}}

The walkthrough matches the flows in this guide: listing and **Create Internal Sales Return**, **Main Details**, **Account**, **Lines**, and **SAVE** / **FINAL** with the posting statuses described below.

![Sales Return (Internal) Applet Overview - Manual Chaos vs Integrated Workflow](/images/internal-sales-return-applet/internal-sales-return-overview-infographic.png)

**Who uses this:**
- **Sales Teams** — Create return documents, select customers, track status
- **Warehouse Staff** — Receive returned goods, verify items physically
- **Finance Teams** — Process refunds, generate credit notes, handle settlements

### When to use Internal Sales Return after settled customer sales (e-invoice)

This section covers **when you need an Internal Sales Return** (or a related document) **after** customer sales have already been **invoiced and settled**, including **cash sales** and other sales, and the invoice is part of your **e-invoice** process. Typical causes are **defective goods**, **wrong items shipped**, or **amount errors** on the invoice. In those cases you usually create a follow-on document that **balances the original customer invoice**.

The **Internal Sales Return** applet is one supported path for that. A **Sales Credit Note (Internal)** can serve a similar balancing role depending on your process and configuration. For the credit-note path, see **[Sales Credit Note (Internal) Applet](/applets/sales-workflow/internal-sales-credit-note-applet/)** (also listed under **[Related applets](#related-applets)**).

#### Cancel and re-invoice vs sales return (72-hour rule of thumb)

Use the table below when the original sales invoice has **already been submitted for e-invoice**. Confirm all timings and legal rules with your **finance or tax team**; limits can change and may differ by jurisdiction or tenant configuration.

| Situation | What you can do | Typical next document |
|-----------|------------------|------------------------|
| Still **within 72 hours** of submission (per your organisation’s rule) | **Cancel** the original sales invoice and **issue a new** sales invoice with corrected details | New customer sales invoice |
| **More than 72 hours** have passed | You **cannot cancel** the original sales invoice | **Internal Sales Return** or **Sales Credit Note (Internal)** to balance the original invoice before further customer invoicing reflects the correction |

---

## Document Status Reference

| Posting Status | Meaning | What You Can Do |
|----------------|---------|------------------|
| **DRAFT** | Being created/edited | SAVE, FINAL, Edit all fields |
| **FINAL** | Locked and posted | VOID, View, Process receipts/settlements |
| **VOID** | Cancelled | View only |
| **DISCARDED** | Discarded draft | View only |

{{< callout type="warning" >}}
Once marked **FINAL**, documents cannot be easily edited.
{{< /callout >}}

---

## Before you start

- **Original sale document** — You can start a return without selecting a prior document, but you will usually either use the **Search** tab to pick an **internal sales invoice** or **internal sales cashbill**, or type the original **invoice number** in **Reference** on **Main Details** so the return is traceable. For **e-invoice** linking, you must be able to identify the correct **original** customer invoice when your process requires it.
- **Customer (entity)** — The customer must exist and be selectable on the **Account** tab (**Entity ID** / **Entity Name**). If the customer is missing, complete customer maintenance first (or ask your administrator).
- **Who creates the return** — Any user who has permission to create **Internal Sales Returns** may create the return; your company may still assign this task by policy (it does **not** have to be the same person who created the original sale).
- **Return reasons** — The **Reason** list on **Main Details** is configured in the system. If codes are missing or wrong, ask your administrator to update master data before you rely on them for reporting.

---

## Glossary

| Term | Meaning in this guide |
|------|------------------------|
| **Invoice (internal sales invoice)** | In **Search**, **Search By Invoice** looks up prior **internal sales invoices**—the usual “bill later” customer sale document your tenant posts to accounts receivable. |
| **Cashbill (internal sales cashbill)** | In **Search**, **Search By Cashbill** looks up prior **internal sales cashbills**—typically **pay-now / over-the-counter** style sales (often retail). Same return applet; different source document type. |
| **UOM** | Unit of measure (for example **EA**, **BOX**). Each return line uses the item’s units for quantity and pricing. |
| **Tariff Code** | Classification used on a line where your tenant requires it for tax or customs reporting. |
| **Contra / offset** | Applying the customer’s credit from this return against **other open receivable documents** instead of paying cash out. |
| **Credit note** | A financial document that **reduces what the customer owes** (or records a refund path), often without moving stock; your settlement screen may offer credit-note-style methods depending on configuration. |
| **UUID (Original E-invoice Ref UUID)** | A unique identifier stored next to the **Original E-invoice Ref No** on the **E-Invoice** screen; it is usually filled when you pick the main document reference. |
| **Posting queue** | In **My Invoice Admin**, the first stage where the system checks that mandatory buyer or customer data is present before e-invoice submission. |
| **Batch pool** | A holding area in **My Invoice Admin** for documents that are **not** ready for individual submission (for example, missing mandatory data); they are processed in batch once issues are fixed. |
| **Individual submission** | A path in **My Invoice Admin** where a return can be **submitted** to the tax platform as its own document (when data is complete). |
| **Validation queue** | After submission, a stage where responses are checked; users with access may also run **manual validation** to speed processing. |
| **QR code / validation URL** | Shown on a successful validated submission so the buyer can verify the e-invoice. |

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Sales Teams: Create Your First Return

**Goal:** Create a sales return document with precise navigation through tabs.

**Open Create Screen:** Go to **Sales Return (Internal)** → click the **+** button on the toolbar. A new screen opens titled **Create Internal Sales Return** with multiple tabs.

**Search tab** (shown when your tenant enables it):

The tab is labelled **Search**. Inside it, use **Search By Customer**, **Search By Invoice**, or **Search By Cashbill** to find the prior **internal sales invoices** or **internal sales cashbills** you are returning against. You may **skip** this tab and instead type the original **invoice number** in **Reference** on **Main Details**.

**Main Details Tab** (usually after **Search**):

   - **Branch:** Select branch from the dropdown (for example **Head Office**).
   - **Location:** Select location (typically after branch).
   - **Delivery Branch** and **Delivery Location:** When shown, complete them; selecting the main branch can pre-fill related delivery fields. The screen warns if delivery branch or location **differs** from the header branch or location.
   - **Transaction Date:** Open the date picker and select the return date.
   - **Reason:** Choose from the configured list (for example defective or wrong product).
   - **Remarks:** Optional notes (recommended for audit).
   - **Reference:** Optional header reference; if you did not use **Search**, enter the **original invoice number** here for traceability.

{{< figure src="/images/internal-sales-return-applet/sales-main-details-tab.png" alt="Main Details Tab - showing Branch, Location, Transaction Date, and other header fields" caption="Fill in Main Details tab with Branch, Location, Transaction Date, Reason, and Remarks." >}}

{{< callout type="info" >}}
If this return must be reported under **e-invoice**, complete **[Linking this return to the original e-invoice](#linking-this-return-to-the-original-e-invoice)** (in the **E-invoice** section below) **before** you click **FINAL**.
{{< /callout >}}

**Account Tab** (click tab at top):
   - Click **Entity Details** sub-tab (if not already selected)
   - Click the **Entity ID** or **Entity Name** field (clickable field with cursor icon)
   - Customer selection dialog opens - search and select customer
   - Form auto-fills with: Entity Type, Status, Currency, Email, Phone Number, etc.
   - Review **Bill To** and **Ship To** sub-tabs (addresses auto-populated from customer record)

{{< figure src="/images/internal-sales-return-applet/sales-account-tab.png" alt="Account Tab - Entity Details showing Entity ID, Status, Entity Type, Currency, and other customer fields" caption="In Account tab, click Entity ID field to select customer. Fields auto-populate with customer information." >}}

**Lines Tab** (click tab at top):
   - Click button to add line items (look for "+" or "Add" button in Lines listing)

{{< figure src="/images/internal-sales-return-applet/sales-lines-iteam-add-1.png" alt="Lines Tab - showing plus button to add line items and existing items list" caption="In Lines tab, click the '+' button to add items to return." >}}

   - **Select Item dialog opens** - showing list of available items
   - Search or scroll to find the item being returned
   - Click on item to select it

{{< figure src="/images/internal-sales-return-applet/sales-lines-iteam-add-2.png" alt="Select Item dialog - showing searchable list of items with Item Code, Item Name, and UOM columns" caption="Search and select the item being returned from the item list." >}}

   - **Add Item** screen opens with its own tabs:
     - **Item Details tab** → **Main Details sub-tab**:
       - **Item Code/Name:** Auto-filled from selection
       - **Sales Agent:** Select if required
       - **UOM:** Select unit of measure
       - **Pricing Scheme:** Select pricing method
       - **Unit Price STD (Exclusive of tax):** Verify or adjust price
       - **Quantity Base:** Enter quantity being returned
       - **Quantity by UOM:** Enter quantity in selected unit
       - **Tariff Code:** Select tariff classification if required
       - When shown, complete **E-Invoice Tax Type Code**, **SST/GST/VAT** (and related tax fields), and **Txn Amount** (transaction amount) as required; amounts and tax lines recalculate before you confirm the line.
     - Add **Serial Numbers** (tab) if product is serialized
     - Review **Costing Details** (tab) - confirms calculations
   - Click **ADD** button (top right) to add line item
   - Repeat for multiple items

{{< figure src="/images/internal-sales-return-applet/sales-lines-iteam-add-3.png" alt="Add Item screen - Item Details showing Item Code, Item Name, Sales Agent, UOM, Pricing Scheme, Unit Price, and Quantity fields" caption="Fill in item details including quantity, unit price, and other required fields. Click ADD to add item to return." >}}

**Review Totals:** Check calculated totals at bottom of screen

**Save or Finalize:**
   - **CREATE** (create screen, top right): Saves a new return once **Main Details** and **Account** validations pass; your session then continues on the saved **Internal Sales Return** for further lines, **SAVE**, and **FINAL**.
   - **SAVE** (edit screen, top right): Saves as **DRAFT** (still editable, not yet posted).
   - **FINAL** (edit screen): Locks the document as **FINAL** (posted according to your tenant’s rules).

**What's next?** Once FINAL → Warehouse receives goods → Finance processes refund → Customer gets credit/refund

**Pro Tip:** Keep as **DRAFT** while gathering information. Only click **FINAL** when ready to post (cannot easily undo).

---

### E-invoice: linking, FINAL, and My Invoice Admin

#### Linking this return to the original e-invoice

Linking tells the e-invoice service **which original customer invoice** this return balances, using the validated or submitted invoice list your tenant allows.

1. Save the return at least once (**SAVE** or **CREATE**) so it appears in the listing, then open it again. The screen title reads **Internal Sales Return** with **SAVE** and **FINAL** in the header when you are editing an existing document.
2. Open the **E-Invoice** tab (available on the **edit** screen; it is **not** a tab on the first-time **Create Internal Sales Return** screen).
3. Open the **Submission** sub-tab under **E-Invoice**.
4. Set **Original E-invoice Ref No**, **Original E-invoice Ref UUID**, and **Document Date**. Use the arrow control next to **Original E-invoice Ref No** to open **Select E-Invoice Main Doc Ref No** and pick an eligible invoice; related fields can fill automatically after selection.
5. Choose **Submission Type** and other required fields shown on the form. **Skip E-Invoice** appears only if your process allows skipping—use it only under instructions from your administrator or finance team.
6. Complete any remaining **Buyer’s Info** fields required on the same screen, then continue with **SAVE** until you are ready to use **FINAL**.

#### After FINAL: My Invoice Admin and e-invoice queues

This section applies **only** if your organisation uses **e-invoicing** and **My Invoice Admin**. If you are unsure whether it applies to you, ask your **finance or tax** team. Warehouse staff usually **do not** perform these steps; finance or centralised e-invoice operators typically do.

After you click **FINAL** on a return that participates in e-invoice, the document is handed off to **My Invoice Admin**. The exact labels and permissions depend on your tenant, but the usual flow is:

1. **Posting queue** — validates that mandatory customer or buyer information exists.
2. **Individual submission vs batch pool** — if data is complete, the document can move to an **individual submission** queue; otherwise it may remain in a **batch pool** until issues are resolved.
3. **Submit** — authorised users submit the document to the tax platform. Some environments auto-submit on a delay on the order of **15–20 minutes**; others require manual **Submit** for immediate processing.
4. **Validation queue** — automatic checks run on responses; **manual validation** may be available to clear errors faster.
5. **QR code and validation URL** — when validation succeeds, these appear on the submission record for customer-facing verification.

---

### For Warehouse Staff: Process Returned Goods

**Goal:** Coordinate physical receipt of returned items based on finalized return documents.

**Access Finalized Returns:**
   - Go to **Sales Return (Internal)** applet
   - Use Advanced Search or filter
   - Filter by **Posting Status: FINAL** (finalized returns)
   - Click on a return document to view details

![Warehouse Access Finalized Returns](/images/internal-sales-return-applet/warehouse-access-finalized-returns.png)

**Review Return Details:**
   - **Main Details tab:** Check branch, location, transaction date, return reason
   - **Account tab:** Verify customer information
   - **Lines tab:** Review items to be returned (Item Code, quantities, prices)
   - Print return document if needed (look for Print button or use browser print)

**Physical Receipt Process:**
   - Verify physical items match the return document:
     - Check item codes and descriptions
     - Count quantities
     - Inspect condition (saleable, damaged, defective)
     - Verify serial/batch numbers if applicable
   - Place items in appropriate storage location based on your warehouse procedures
   - For damaged/defective items, follow your organization's quarantine procedures

**Document Discrepancies:**
   - If actual received items differ from document, coordinate with sales/management
   - They may need to edit the return document (if still in DRAFT) or create adjustments
   - Add notes in **Main Details tab > Remarks** field if you have edit access

### Inventory and stock

When a return reaches **FINAL**, the system **posts** the document. That posting drives **inventory and accounting** results according to your tenant’s rules (which items, branches, and locations are affected is controlled by configuration on the return header, lines, and related inventory setup).

**Physical stock** is still under your warehouse policy: put returned units into the correct bin or zone (saleable shelf, quarantine, scrap path, and so on). The applet records **quantities** (and delivery-related fields when shown); it does **not** replace your written procedures for **where** to put defective goods on the floor.

{{< callout type="info" >}}
Your operational task is to make **physical goods** match the **documented** return and to follow **storage and quarantine** rules. If quantities or items do not match, escalate before you assume the system stock is correct.
{{< /callout >}}

**Common Scenarios:** 
- **Defective items:** Store in designated defective/quarantine area per warehouse policy
- **Restockable items:** Return to regular inventory locations
- **Quantity discrepancies:** Report to sales team for document adjustment
- **Wrong items received:** Coordinate with sales/customer service for resolution

---

### For Finance Teams: Process Refund

**Goal:** Complete financial settlement and issue refund or credit.

**Access returns:**
   - Go to **Sales Return (Internal)** applet  
   - Use Advanced Search or filter
   - Open the return (often **FINAL** for review; see below for **adding** settlements)

**Review financial details:**
   - **Main Details tab:** Return date, customer, **Reference**, totals
   - **Account tab:** Customer and addresses
   - **Lines tab:** Returned lines, tax, discounts, and totals

**Add or edit settlements on the Payment tab**

Settlements are maintained on the **Payment** tab of the return.

1. Open the return while it is still **DRAFT** if you need to **add** a new settlement line (the **+** button in the payment list uses the tooltip **Create**; it is **hidden** once the document is **FINAL**, **VOID**, or **DISCARDED**, or when the document is locked).
2. Click **Payment**.
3. Click the **+** (**Create**) control in the payment toolbar.
4. The **Add Payment** screen opens. Choose **Settlement Groups** and **Settlement Method**, then complete any fields your tenant shows for that method (labels vary by method).
5. Click **ADD** to save the settlement line back to the listing.
6. Use the grid (**Date**, **Amount**, **Details**, **Remarks**) to review lines. When the document is in edit mode, compare **Total Payment** with **Doc Open Amount** and **Doc ARAP Balance** if those totals appear—they are read-only checks on the screen.

![Finance Process Settlement - Payment Tab](/images/internal-sales-return-applet/finance-process-settlement-1.png)

Typical settlement outcomes (wording depends on master data):

- Methods that **credit the customer** without immediate cash movement  
- Methods that represent **direct refund**  
- **Contra / offset** against other open receivables  

![Finance Process Settlement - Settlement Methods](/images/internal-sales-return-applet/finance-process-settlement-2-settelment-methods.png)

**After FINAL:** The payment grid is for **review**; new settlement lines must be added **before** **FINAL** (or via your organisation’s adjustment process if you allow changes after posting).

**Complete and Verify:**
   - Verify accounting entries if integrated with general ledger
   - Generate and send credit note or refund confirmation to customer
   - Coordinate with customer service to inform customer of refund status

{{< callout type="tip" >}}
If integrated with accounting system, journal entries are automatically posted to GL accounts (Accounts Receivable, Sales Returns, Inventory).
{{< /callout >}}

{{< callout type="info" >}}
Settlement workflow varies by organization. If **Payment** is not visible or settlement is handled elsewhere, follow your finance team’s standard procedure.
{{< /callout >}}

---

## Common Daily Tasks

**Task: Create a return**
→ Sales Return (Internal) → Click `+` → Optional **Search** tab (**Search By Customer** / **Search By Invoice** / **Search By Cashbill**) → Fill **Main Details** / **Account** / **Lines** → **SAVE**; complete **[E-invoice](#e-invoice-linking-final-and-my-invoice-admin)** if required → **FINAL**

**Task: Find a return**
→ Use Search or filter by status/customer/date → Click to open

**Task: Process returned goods**
→ Filter Posting Status: FINAL → Open document → Review Lines tab → Physically receive goods

**Task: Process refund or credit**
→ Open return → **Payment** tab → while **DRAFT**, use **+** (**Create**) → **Add Payment** → **Settlement Groups** / **Settlement Method** → **ADD** → **FINAL** when ready (or review **FINAL** document per policy)

**Task: Export returns report**
→ Set date filter → Select filters → Click Export → Choose format

---

## Best Practices

**Sales Teams:**
- Get proof of purchase before creating return
- Document return reasons clearly
- Take photos for defective items
- Complete all required fields

**Warehouse Staff:**
- Verify physical items match document quantities
- Inspect condition before storing
- Follow quarantine procedures for defective items
- Report discrepancies immediately

**Finance Teams:**
- Verify goods received before processing refund
- Generate credit notes promptly
- Keep audit trail of all transactions

---

## Screen and tab reference

Some tabs are **hidden** per tenant applet settings. If a tab below is missing, your administrator may have turned it off.

### Create Internal Sales Return (first-time create screen)

| Tab | Purpose |
|-----|---------|
| **Search** | Find prior **internal sales invoices** or **internal sales cashbills** (subtabs **Search By Customer**, **Search By Invoice**, **Search By Cashbill**). Optional. |
| **Main Details** | Branch, location, delivery branch/location (when shown), dates, reason, remarks, reference, currency-related fields (when shown). |
| **Account** | Customer entity, **Bill To**, **Ship To**, **Intercompany** (subtabs). |
| **Lines** | List and maintain return lines; open **Add Item**. |
| **Delivery Details** | Delivery-related header information when enabled. |
| **Payment** | Payment/settlement lines when enabled (same **Payment** component as edit, subject to posting status). |
| **Department Hdr** | Segment, **G/L Dimension**, **Profit Centre**, **Project** for analytical posting when enabled. |

### Edit Internal Sales Return (saved document)

All **Create** tabs may appear again on edit, plus commonly:

| Tab | Purpose |
|-----|---------|
| **E-Invoice** | **Submission**, **Progress** (after **FINAL** when e-invoice is enabled), **Notification**, **Cancellation** (when shown). |
| **ARAP** | Accounts-receivable / payable view for the document when enabled. |
| **Payment Adjustment** | Adjust settlement lines when enabled. |
| **TraceDocument** | Trace posting of the generic document when enabled. |
| **Contra** | Contra linking when enabled. |
| **Doc Link** | Document links when enabled. |
| **Attachments** | Files attached to the return when enabled. |
| **Export** | Export actions when enabled. |

### Add Item (line editor)

| Tab / panel | Purpose |
|-------------|---------|
| **Item Details** | Contains **Main Details** (and nested fields) for the line. |
| **Serial Number**, **Batch Number**, **Bin Number** | Shown when the item uses those tracking types. |
| **Costing Details** | Shows costing breakdown for the line when enabled. |
| **Issue Link** | Issue-tracking links when used in your tenant. |

---

## Related applets

Use these when you need the **original sale**, an **alternative financial correction**, or **e-invoice submission** tracking:

- **[Sales Invoice (Internal) Applet](/applets/sales-workflow/internal-sales-invoice-applet/)** — Create and manage customer **invoices** you may later return against (**Search By Invoice**).
- **[Sales Credit Note (Internal) Applet](/applets/sales-workflow/internal-sales-credit-note-applet/)** — Adjust or reverse invoiced amounts when a **credit note** is the right tool instead of (or as well as) a stock return.
- **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)** — Queues, submission, validation, and notification flows after returns are **FINAL** and sent for **e-invoice** processing.

---

## Frequently Asked Questions

**Q: What is a cashbill, and how is it different from an invoice?**  
A: In **Search**, **Search By Invoice** finds **internal sales invoices** (the usual “sell now, collect on account” invoice). **Search By Cashbill** finds **internal sales cashbills** (commonly **cash or immediate-payment** sales, such as over the counter). Pick the tab that matches how the original sale was recorded. See the **Glossary** rows for **Invoice** and **Cashbill**.

**Q: Can I do a partial return—only some items or quantities from an original invoice?**  
A: **Yes.** Enter only the **lines and quantities** you are actually returning; you do not need to copy every line from the original sale unless your policy says so. Use **Search** or **Reference** so the return stays traceable to the right customer and invoice.

**Q: What happens to the customer’s loyalty points or discounts when they return an item?**  
A: This applet records **return lines and amounts** you enter; **loyalty points**, **promotions**, and **discount clawbacks** depend on how your organisation set up **membership**, **POS**, **pricing**, and **settlement** rules. There is **no single answer** in the return screen alone—confirm with **finance** or your **loyalty/POS administrator**.

**Q: Who gets notified when a return is created—how does each team know it is their turn?**  
A: By default, users see returns in the **listing** and by **posting status**; **automatic emails or tasks to warehouse or finance** only happen if your tenant added **workflow, alerts, or integrations**. Agree internally who watches **DRAFT** vs **FINAL** returns. For **e-invoice**–related notifications, use **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)** (for example email or queue features your organisation enabled).

**Q: Should I cancel and re-invoice, or create a sales return?**  
A: See **[Cancel and re-invoice vs sales return (72-hour rule of thumb)](#cancel-and-re-invoice-vs-sales-return-72-hour-rule-of-thumb)**. Within the stated window you may cancel and re-invoice; after that window, use a **sales return** or **sales credit note** to balance the original invoice. Always confirm with finance or tax.

**Q: Do I have to use the Search tab?**  
A: No. You can skip **Search** and still type the original invoice in **Reference** on **Main Details**, then complete **E-Invoice** linking on the edit screen if required.

**Q: Where do I set the original e-invoice reference?**  
A: On the saved return, open **E-Invoice** → **Submission**. Use **Original E-invoice Ref No** and **Select E-Invoice Main Doc Ref No** as described in **[Linking this return to the original e-invoice](#linking-this-return-to-the-original-e-invoice)**.

**Q: What happens after FINAL for e-invoice?**  
A: See **[After FINAL: My Invoice Admin and e-invoice queues](#after-final-my-invoice-admin-and-e-invoice-queues)**. If your company does not use e-invoice, that section does not apply.

**Q: Can I use a sales credit note instead of a return?**  
A: Often yes for **financial** balancing; see [Sales Credit Note (Internal) Applet](/applets/sales-workflow/internal-sales-credit-note-applet/). Credit notes and returns serve different operational needs (returns usually drive **stock** movements); your finance team defines which to use.

**Q: What happens if I accidentally click FINAL?**  
A: Once marked **FINAL**, the document is locked and posted. You will need to **VOID** it and create a new return if changes are required. Keep **DRAFT** until you are certain.

**Q: Can I edit a FINAL document?**  
A: No. **FINAL** documents are locked. **VOID** and recreate, or use adjustment processes your company allows.

**Q: What's the difference between SAVE and FINAL?**  
A: **SAVE** keeps **DRAFT** (editable, not fully posted). **FINAL** locks and posts (inventory and accounting impacts per your rules). Use **SAVE** while gathering data.

**Q: Do I need to add settlements before clicking FINAL?**  
A: Yes, if you need **new** settlement lines: the **+** (**Create**) control on **Payment** is available only while the document is **not** **FINAL** / **VOID** / **DISCARDED** and not locked. After **FINAL**, the grid is for review unless your process allows adjustments elsewhere.

**Q: What if the physical items received don't match the document?**  
A: Report discrepancies to sales. If the return is still **DRAFT**, they can edit it. If **FINAL**, they may need adjustments or a void/re-create.

**Q: How do I void a return?**  
A: Open a **FINAL** document and use **VOID** in the action area. **DRAFT** documents should be **DISCARD**ed or deleted per your process.

**Q: Can warehouse staff edit return documents?**  
A: Depends on permissions; many users have view-only access to **FINAL** returns.

**Q: What if I can't see the Payment tab?**  
A: It may be hidden by configuration or role. Follow your finance team’s offline settlement process if payments are done elsewhere.

**Q: What posting status should I filter for active work?**  
A: **DRAFT** for in-progress returns; **FINAL** for receiving and settlement review. Skip **VOID** and **DISCARDED** unless auditing.

**Q: How do I pick a return reason?**  
A: Choose the code that best matches the customer’s situation. If the list is wrong, ask your administrator to update master data.
