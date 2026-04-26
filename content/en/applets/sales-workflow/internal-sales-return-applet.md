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

Use this applet when a **customer returns goods or needs a credit** after a sale has already been recorded. You record the return here, keep **inventory** and **customer balance** aligned with what your company approved, and hand the same document to **warehouse** (physical goods) and **finance** (refund, settlement, or e-invoice steps where applicable).

### Video Overview

{{< youtube WxLCxGMR6Ls >}}

The video follows the same flow as this guide: the **Sales Return (Internal)** list, **Create Internal Sales Return**, **Main Details**, **Account**, **Lines**, and **SAVE** / **FINAL** with the posting statuses in [Document status reference](#document-status-reference).

![Sales Return (Internal) Applet Overview - Manual Chaos vs Integrated Workflow](/images/internal-sales-return-applet/internal-sales-return-overview-infographic.png)

**Who uses this**

| Role | Role in this applet |
|------|---------------------|
| Sales | Create and update return documents, choose the customer, add lines, move the document to **FINAL** when policy allows. |
| Warehouse | Receive and check physical goods against **FINAL** returns. |
| Finance | Add **Payment** settlement lines before **FINAL** where required, use **Contra** for offsets, complete **E-Invoice** linking when your organisation uses e-invoice. |

---

## Document status reference {#document-status-reference}

| Posting status | Meaning | What you can do |
|----------------|---------|------------------|
| **DRAFT** | Work in progress | **SAVE**, **FINAL**, edit fields your permissions allow |
| **FINAL** | Posted / locked | **VOID**, view, receive goods, review **Payment** lines (new lines use **Create** only before **FINAL**—see [Payment tab and FINAL](#payment-tab-and-final)) |
| **VOID** | Cancelled | View only |
| **DISCARDED** | Draft discarded | View only |

{{< callout type="warning" >}}
After **FINAL**, you cannot treat the document as a normal editable draft. Use **VOID** and recreate, or your company’s adjustment process, if something must change.
{{< /callout >}}

---

## Before you start

- You need a **customer** that exists in master data (**Account** tab, **Entity ID** / **Entity Name**). If the customer is missing, fix master data or ask your administrator.
- Decide how you will **trace the original sale**: either use the **Search** tab (when it appears) or type the original invoice reference on **Main Details**—see [Two ways to create a return](#two-ways-to-create-a-return).
- **Return reasons** on **Main Details** come from configuration. If the list is wrong, ask your administrator to update master data.
- **Who may create** a return is controlled by permissions; your internal policy may still say which team creates the document.

If you are unsure whether **Search**, **Payment**, **E-Invoice**, or **Contra** applies to your login, ask your **administrator** or **finance**.

---

## Glossary

| Term | Meaning in this guide |
|------|------------------------|
| **Invoice (internal sales invoice)** | In **Search**, **Search By Invoice** finds prior **internal sales invoices** (“bill later” sales posted to receivables). |
| **Cashbill (internal sales cashbill)** | In **Search**, **Search By Cashbill** finds **internal sales cashbills** (often immediate-payment / counter sales). |
| **UOM** | Unit of measure on a line (for example **EA**, **BOX**). |
| **Tariff Code** | Classification on a line when your tenant requires it. |
| **Contra / offset** | Matching this return’s credit against **other open receivable documents** using the **Contra** flow (see [Contra tab (finance)](#contra-tab-finance)). |
| **Credit note** | A financial document that reduces what the customer owes; may be combined with or separate from a stock return depending on policy. |
| **UUID (Original E-invoice Ref UUID)** | Identifier next to **Original E-invoice Ref No** on **E-Invoice**; often filled when you pick the main document reference. |
| **My Invoice Admin queues** | After **FINAL**, e-invoice submission and queue work happen in **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)**—use that guide for posting queue, batch pool, submission, and validation—not this page. |

---

## Quick Start Guide {#quick-start-guide}

{{< callout type="info" >}}
**Sales and warehouse:** Start with the eight steps and [Detailed walkthrough (sales)](#detailed-walkthrough-sales) for screen-by-screen help. Skip **[E-invoice (finance)](#e-invoice-finance)** unless your role includes e-invoice. **Finance:** Read **[Payment tab and FINAL](#payment-tab-and-final)**, **[Contra tab (finance)](#contra-tab-finance)**, and **[E-invoice (finance)](#e-invoice-finance)** when your company uses those features.
{{< /callout >}}

### Eight steps to your first saved return

1. Open **Sales Return (Internal)** in the sidebar.
2. Click **+** on the list. The **Create Internal Sales Return** screen opens.
3. Choose [Path 1 (Search) or Path 2 (manual)](#two-ways-to-create-a-return).
4. Click the **Main Details** tab. Set **Branch**, **Location**, **Transaction Date**, **Reason**, and **Reference** as your policy requires.
5. Click the **Account** tab. Open **Entity Details**, click **Entity ID** or **Entity Name**, and select the **customer**.
6. Click the **Lines** tab. Add each returned line (**Create** / **+** on the line list), complete **Item Details**, then click **ADD** on the line editor.
7. Click **CREATE** (first save). Continue on the saved return: add lines or **Payment** lines as needed, then click **SAVE** until the document is correct.
8. Click **FINAL** only when **sales, warehouse, and finance** agree the return is complete—including **Payment** lines if finance must add them before posting.

If any tab named in these steps is missing, your tenant may hide it. Ask your administrator.

### Two ways to create a return {#two-ways-to-create-a-return}

**Path 1 — From Search (when the Search tab is visible)**

1. Click the **Search** tab on **Create Internal Sales Return**.
2. Open **Search By Customer**, **Search By Invoice**, or **Search By Cashbill** (subtab labels match the screen).
3. Run the search, select the prior **internal sales invoice** or **internal sales cashbill** you are returning against.
4. Continue on **Main Details**, **Account**, and **Lines** to adjust header and lines for what is actually returned.

**Path 2 — Manual (no Search)**

1. Skip **Search** (or ignore it if your administrator hid the tab).
2. On **Main Details**, type the original **invoice or reference** in **Reference** so finance can trace the sale.
3. On **Account**, select the **customer** as in step 5 above.
4. On **Lines**, add returned items and quantities.

More field-level detail: [Detailed walkthrough (sales)](#detailed-walkthrough-sales) and [Screen and tab reference](#screen-and-tab-reference).

---

## Detailed walkthrough (sales) {#detailed-walkthrough-sales}

**Goal:** Create a sales return with full tab-by-tab detail.

Open **Sales Return (Internal)** → click **+**. The title is **Create Internal Sales Return**.

**Search** (only if your administrator enables the **Search** tab on create):

- Click **Search**.
- Use **Search By Customer**, **Search By Invoice**, or **Search By Cashbill** to find the prior invoice or cashbill. Or skip this tab and use **Reference** on **Main Details** instead ([Two ways to create a return](#two-ways-to-create-a-return)).

**Main Details**

- Select **Branch** and **Location**.
- If **Delivery Branch** and **Delivery Location** appear, complete them. The screen warns if they differ from the header branch or location.
- Set **Transaction Date** with the date picker.
- Choose **Reason** from the configured list.
- Add **Remarks** for audit when your process expects notes.
- Enter **Reference** (for example original invoice number) when you did not use **Search**.

{{< figure src="/images/internal-sales-return-applet/sales-main-details-tab.png" alt="Main Details Tab - showing Branch, Location, Transaction Date, and other header fields" caption="Main Details: Branch, Location, Transaction Date, Reason, Remarks, and Reference." >}}

{{< callout type="info" >}}
If this return must be reported under **e-invoice**, complete **[Linking this return to the original e-invoice](#linking-this-return-to-the-original-e-invoice)** on the **saved** document ( **E-Invoice** tab on edit) **before** you click **FINAL**.
{{< /callout >}}

**Account**

1. Click the **Account** tab.
2. Open **Entity Details** if needed.
3. Click **Entity ID** or **Entity Name**. Select the customer in the dialog.
4. Review **Bill To** and **Ship To**.

{{< figure src="/images/internal-sales-return-applet/sales-account-tab.png" alt="Account Tab - Entity Details showing Entity ID, Status, Entity Type, Currency, and other customer fields" caption="Account: select the customer from Entity ID or Entity Name." >}}

**Lines**

1. Click the **Lines** tab.
2. Click **Create** (**+**) on the line toolbar.
3. Select the item in the dialog.
4. On **Add Item**, open **Item Details** → **Main Details**. Confirm **UOM**, **Pricing Scheme**, **Unit Price STD**, **Quantity Base**, and **Quantity by UOM**. Complete **Tariff Code** and tax fields when shown.
5. Open **Serial Number** (or batch/bin tabs) when the item uses tracking.
6. Review **Costing Details** when shown.
7. Click **ADD** to save the line. Repeat for more lines.

{{< figure src="/images/internal-sales-return-applet/sales-lines-iteam-add-1.png" alt="Lines Tab - showing plus button to add line items and existing items list" caption="Lines: use Create (+) to add a line." >}}

{{< figure src="/images/internal-sales-return-applet/sales-lines-iteam-add-2.png" alt="Select Item dialog - showing searchable list of items with Item Code, Item Name, and UOM columns" caption="Select the item being returned." >}}

{{< figure src="/images/internal-sales-return-applet/sales-lines-iteam-add-3.png" alt="Add Item screen - Item Details showing Item Code, Item Name, Sales Agent, UOM, Pricing Scheme, Unit Price, and Quantity fields" caption="Add Item: complete quantities and pricing, then click ADD." >}}

**Totals and status**

- Check totals at the bottom of the screen before you post.

**CREATE**, **SAVE**, **FINAL**

- Click **CREATE** after **Main Details** and **Account** validate. The session continues on the saved **Internal Sales Return**.
- Click **SAVE** on the edit screen to keep **DRAFT** while you edit.
- Click **FINAL** only when the return is ready to post. Reversing a mistake after **FINAL** requires **VOID** or a controlled adjustment process.

After **FINAL**, warehouse follows your procedure to receive goods; finance follows **[Payment tab and FINAL](#payment-tab-and-final)** and **[E-invoice (finance)](#e-invoice-finance)** when those apply.

---

## For warehouse staff: process returned goods {#for-warehouse-staff-process-returned-goods}

{{< callout type="info" >}}
**Warehouse:** Use this section for physical receipt. You **do not** need **[E-invoice (finance)](#e-invoice-finance)** unless your role explicitly includes it.
{{< /callout >}}

**Goal:** Match physical goods to **FINAL** return documents.

1. Open **Sales Return (Internal)**.
2. Filter the list to **Posting Status: FINAL**.
3. Open a return. Review **Main Details**, **Account**, and **Lines**.

![Warehouse Access Finalized Returns](/images/internal-sales-return-applet/warehouse-access-finalized-returns.png)

**Physical receipt**

- Count items, check codes and condition, capture serial or batch data when required.
- Put stock away per your quarantine or restock rules.

**If the shipment does not match the document**

- Tell sales or a supervisor. They can edit only while the document is **DRAFT**. If the document is already **FINAL**, they follow your company’s adjustment or **VOID** process.

### Inventory and stock

Posting at **FINAL** drives inventory and accounting per your tenant rules. The applet records quantities; it does not replace your floor procedure for bins, quarantine, or scrap.

{{< callout type="info" >}}
If physical counts do not match the document, **escalate** before you assume system stock is correct.
{{< /callout >}}

---

## For finance teams: process refund and settlement {#for-finance-teams-process-refund}

{{< callout type="info" >}}
**Finance:** Read **[Payment tab and FINAL](#payment-tab-and-final)**, **[Contra tab (finance)](#contra-tab-finance)**, and **[E-invoice (finance)](#e-invoice-finance)**. Share **[Payment tab and FINAL](#payment-tab-and-final)** with sales so both teams expect the same behaviour after **FINAL**.
{{< /callout >}}

**Goal:** Settle the return and align receivables.

1. Open **Sales Return (Internal)** and find the return (often **FINAL** for review after warehouse work—follow your policy).
2. Review **Main Details**, **Account**, and **Lines** for amounts and tax.

### Payment tab and FINAL {#payment-tab-and-final}

{{< callout type="warning" >}}
**Sales and finance:** New settlement lines on **Payment** use the toolbar **Create** (**+**, tooltip **Create**) only while the document is **not** **FINAL**, **VOID**, or **DISCARDED**, and while the document is **not** locked. The applet hides **Create** when any of those apply. After **FINAL**, use the **Payment** grid for **review**; add or change settlement lines **before** **FINAL**, or use your organisation’s posted adjustment process.

If you are unsure whether you may still add a payment line, ask **finance** or your **administrator**.
{{< /callout >}}

**Add a settlement line (while still editable)**

1. Open the return in **DRAFT** (or any state where **Create** still appears on **Payment**).
2. Click the **Payment** tab.
3. Click **Create** (**+**).
4. On **Add Payment**, choose **Settlement Groups** and **Settlement Method**. Complete the fields your tenant shows.
5. Click **ADD** to return to the list.
6. Compare **Total Payment** with **Doc Open Amount** and **Doc ARAP Balance** when the screen shows them.

![Finance Process Settlement - Payment Tab](/images/internal-sales-return-applet/finance-process-settlement-1.png)

Typical methods (labels depend on master data) include customer credit without cash movement, direct refund, or contra-style settlement options in the method list.

![Finance Process Settlement - Settlement Methods](/images/internal-sales-return-applet/finance-process-settlement-2-settelment-methods.png)

{{< callout type="info" >}}
If **Payment** is missing, your administrator may hide the tab or your role may not include it. Follow your offline settlement procedure.
{{< /callout >}}

### Contra tab (finance) {#contra-tab-finance}

Use **Contra** on the **edit** screen when your tenant enables it and finance instructs you to **offset** this return against **other open receivable documents** instead of only using cash-style settlement lines.

Typical flow in the applet:

1. Open the **Contra** tab.
2. Open **Select Document to Contra With**. Use the advanced search to find an eligible open document (the search model is tenant-driven—often includes other **sales invoices** or receivable-related documents with outstanding balance).
3. Select rows, then click **ADD** where shown to build contra lines. **Total Contra**, **Doc Open Amount**, and **Doc ARAP Balance** on the screen help you check totals. **AUTO SETTLE** and **RESET** appear only when your settings enable them.

**Best practice:** Prefer the **Contra** tab for contra and offset work so links and amounts stay on one audited path. Confirm which document types your organisation may contra (for example open **sales invoice** or **payment voucher**) with **finance**—allowed types follow configuration and search setup, not this guide.

---

## Common daily tasks {#common-daily-tasks}

| Task | Steps |
|------|--------|
| Create a return | **Sales Return (Internal)** → **+** → [Search or manual path](#two-ways-to-create-a-return) → **Main Details** → **Account** → **Lines** → **CREATE** → **SAVE** → complete **[E-invoice (finance)](#e-invoice-finance)** if required → **FINAL** |
| Find a return | Filter by status, customer, or date → open the row |
| Receive goods | Filter **FINAL** → open document → match **Lines** to physical stock |
| Refund / settle | While **DRAFT**, **Payment** → **Create** → **Add Payment** → **ADD** → **FINAL** when ready; use **Contra** when instructed |
| Export | Use list filters → **Export** when your tenant shows the action |

---

## E-invoice (finance) {#e-invoice-finance}

{{< callout type="warning" >}}
**Finance and tax roles:** This section covers compliance and linking. **Sales and warehouse** may skip it unless trained.
{{< /callout >}}

### When to use a return after e-invoiced sales {#when-to-use-a-return-after-e-invoiced-sales}

Use the table when the original **customer sales invoice was already submitted for e-invoice**. Confirm timings and law with **finance or tax**; limits differ by jurisdiction and configuration.

The **Internal Sales Return** applet is one supported way to balance the original invoice. A **[Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/)** may also apply—see **[Related applets](#related-applets)**.

#### Cancel and re-invoice vs sales return (72-hour rule of thumb) {#cancel-and-re-invoice-vs-sales-return-72-hour-rule-of-thumb}

| Situation | What you can do | Typical next document |
|-----------|------------------|------------------------|
| Still **within 72 hours** of submission (per your organisation’s rule) | **Cancel** the original sales invoice and issue a **new** sales invoice with corrected details | New customer sales invoice |
| **More than 72 hours** have passed | You **cannot cancel** the original sales invoice | **Internal Sales Return** or **Sales Credit Note (Internal)** to balance the original invoice |

### Linking this return to the original e-invoice {#linking-this-return-to-the-original-e-invoice}

Linking tells the e-invoice service **which original customer invoice** this return balances, using the list your tenant allows.

1. Click **SAVE** or **CREATE** at least once, then reopen the return from the list. On edit, the header shows **SAVE** and **FINAL**.
2. Click the **E-Invoice** tab (it appears on the **edit** screen, not on the first **Create Internal Sales Return** screen).
3. Open **Submission** under **E-Invoice**.
4. Set **Original E-invoice Ref No**, **Original E-invoice Ref UUID**, and **Document Date**. Use the picker next to **Original E-invoice Ref No** (**Select E-invoice Main Doc Ref No**) to choose an eligible invoice when available.
5. Choose **Submission Type** and any other required fields. Use **Skip E-Invoice** only when your administrator or finance authorises it.
6. Complete **Buyer’s Info** fields if shown. **SAVE** until you are ready for **FINAL**.

### After FINAL (e-invoice only) {#after-final-e-invoice-only}

After **FINAL**, any submission, queue, validation, or buyer notification work runs in **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)**. Follow that user guide; this sales return guide does not duplicate queue steps.

---

## Best practices {#best-practices}

**Sales**

- Collect proof of purchase before you create the return.
- Write clear **Remarks** and choose accurate **Reason** codes.
- Photograph damaged goods when your policy asks for evidence.

**Warehouse**

- Match counts and condition before you put stock away.
- Use quarantine paths for defective goods.
- Report mismatches immediately.

**Finance**

- Confirm goods receipt against policy before you release funds.
- Add **Payment** lines **before** **FINAL** when the process requires it.
- Keep contra and e-invoice work in the tabs and tools your organisation approved.

---

## Screen and tab reference {#screen-and-tab-reference}

Some tabs are hidden by applet settings. If a tab is missing, ask your administrator.

### Create Internal Sales Return (first-time create screen)

| Tab | Purpose |
|-----|---------|
| **Search** | **Search By Customer**, **Search By Invoice**, **Search By Cashbill** when your administrator shows the **Search** tab. |
| **Main Details** | Branch, location, delivery fields when shown, dates, reason, remarks, reference. |
| **Account** | Customer **Entity Details**, **Bill To**, **Ship To**, **Intercompany**. |
| **Lines** | Return lines and **Add Item**. |
| **Delivery Details** | When your tenant enables delivery details on create. |
| **Payment** | Settlement lines; **Create** follows the same rules as on edit ([Payment tab and FINAL](#payment-tab-and-final)). |
| **Department Hdr** | Analytical segments when enabled. |

### Edit Internal Sales Return (saved document)

| Tab | Purpose |
|-----|---------|
| **E-Invoice** | **Submission**, **Progress**, **Notification**, **Cancellation** when enabled. |
| **ARAP** | Receivable / payable view when enabled. |
| **Payment** | Settlement listing; **Create** hidden after **FINAL** / **VOID** / **DISCARDED** or when locked. |
| **Payment Adjustment** | When enabled for posted adjustments. |
| **TraceDocument** | Posting trace when enabled. |
| **Contra** | **Select Document to Contra With**, totals, optional **AUTO SETTLE**—see [Contra tab (finance)](#contra-tab-finance). |
| **Doc Link** | Cross-document links when enabled. |
| **Attachments** | Files when enabled. |
| **Export** | Export actions when enabled. |

### Add Item (line editor)

| Tab / panel | Purpose |
|-------------|---------|
| **Item Details** | **Main Details** sub-tab for quantities, pricing, tax. |
| **Serial Number**, **Batch Number**, **Bin Number** | When the item uses tracking. |
| **Costing Details** | Costing breakdown when enabled. |
| **Issue Link** | Issue links when used. |

---

## Related applets {#related-applets}

- **[Sales Invoice (Internal) Applet](/applets/sales-workflow/internal-sales-invoice-applet/)** — Original customer invoices you return against (**Search By Invoice**).
- **[Sales Credit Note (Internal) Applet](/applets/sales-workflow/internal-sales-credit-note-applet/)** — Financial credit when a credit note is the right tool.
- **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)** — Queues and submission **after** **FINAL** for e-invoice.

---

## Frequently asked questions {#frequently-asked-questions}

**Q: What is a cashbill, and how is it different from an invoice?**  
A: **Search By Invoice** finds **internal sales invoices**. **Search By Cashbill** finds **internal sales cashbills** (often cash or immediate payment). Pick the subtab that matches how the original sale was recorded.

**Q: Can I return only part of an invoice?**  
A: Yes. Enter only the lines and quantities you are returning. Keep traceability with **Search** or **Reference**.

**Q: What happens to loyalty points or discounts?**  
A: This applet stores return lines and amounts. Points and promotions depend on other modules. Ask **finance** or your **loyalty/POS administrator**.

**Q: Who gets notified when a return is created?**  
A: Most tenants rely on the list and status filters. Automated alerts require extra setup. For e-invoice notifications, see **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)**.

**Q: Should I cancel and re-invoice, or create a sales return?**  
A: See **[Cancel and re-invoice vs sales return (72-hour rule of thumb)](#cancel-and-re-invoice-vs-sales-return-72-hour-rule-of-thumb)**. Always confirm with finance or tax.

**Q: Do I have to use the Search tab?**  
A: No. Use **Reference** on **Main Details** and pick the customer on **Account** ([Two ways to create a return](#two-ways-to-create-a-return)).

**Q: Where do I set the original e-invoice reference?**  
A: On the saved return: **E-Invoice** → **Submission**. See **[Linking this return to the original e-invoice](#linking-this-return-to-the-original-e-invoice)**.

**Q: What happens after FINAL for e-invoice?**  
A: Continue in **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)** for queues and submission. If your company does not use e-invoice, ignore this.

**Q: Can I use a sales credit note instead of a return?**  
A: Often for **financial** only corrections. Returns usually drive **stock**. Your finance team decides.

**Q: What if I click FINAL by mistake?**  
A: **FINAL** locks the document. Use **VOID** and recreate, or your adjustment process.

**Q: What is the difference between SAVE and FINAL?**  
A: **SAVE** keeps **DRAFT**. **FINAL** posts and locks.

**Q: Do I need settlements before FINAL?**  
A: If finance must record new **Payment** lines, add them **before** **FINAL** while **Create** is still available ([Payment tab and FINAL](#payment-tab-and-final)).

**Q: What if physical goods do not match the document?**  
A: Tell sales. **DRAFT** returns can be edited; **FINAL** returns need policy steps.

**Q: How do I void a return?**  
A: Open a **FINAL** document and use **VOID**. Discard **DRAFT** documents per your process.

**Q: Can warehouse staff edit returns?**  
A: Only if permissions allow; many users are view-only on **FINAL** documents.

**Q: What if Payment is missing?**  
A: Configuration or role may hide it. Ask finance for the offline process.

**Q: Which status should I filter for day-to-day work?**  
A: **DRAFT** for in-progress work; **FINAL** for receiving and settlement review.

**Q: How do I pick a return reason?**  
A: Pick the best code. If the list is wrong, ask your administrator to fix master data.
