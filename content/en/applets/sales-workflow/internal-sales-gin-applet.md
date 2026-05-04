---
title: "Sales GIN (Internal)"
description: "User guide for the Internal Sales GIN applet: list and search documents, create and edit goods issue notes, account and lines, settlement, then SAVE and FINAL."
tags:
- internal-sales-gin
- gin
- goods-issue-note
- sales-fulfillment
- warehouse-operations
weight: 57
date: 2026-04-26
draft: false
---

## Purpose and overview

Use this applet when you need a **Goods Issue Note (GIN)** for **internal sales**—the document that records **stock leaving** a branch or location for a customer sale. You work through **Main Details**, **Account** (customer and addresses), **Lines**, optional **Settlement**, and optional **Department Hdr** fields. When the document is complete, you **SAVE** drafts and use **FINAL** to post, following your organisation’s rules.

This guide uses the **exact screen titles and tab names** from the applet (for example **Internal Sales GIN Listing**, **Create Internal Sales GIN**, **Edit Internal Sales GIN**).

![Internal Sales GIN Applet overview infographic](/images/internal-sales-gin-applet/internal-sales-gin-overview.png)

---

## Before you begin

- You need **customers**, **items**, **branches**, and **locations** in master data; **Branch** and **Location** on **Main Details** control where stock issues from.
- **Credit Terms** and **Due Date** on **Main Details** depend on the customer: the screen notes that **Entity ID** must be selected first on **Account** → **Entity Details**.
- **Member Card** ties the document to a **loyalty / membership** record. Click the field to open member selection; membership master data and rules are maintained in **[Membership Admin Applet](/applets/membership/membership-admin-applet/)**. If your process does not use members, ask your administrator how this field should be handled in your company setup—the header form treats it as a required field in the applet code.
- **Who may create or post** is controlled by **permissions** and company policy; ask your **administrator** if you are blocked.
- For hidden tabs and hidden pricing columns, see [FAQ](#faq).

---

## Who uses this

| Role | Role in this applet |
|------|----------------------|
| **Sales / operations** | Create GINs, choose the customer, add lines from **Search Item** or **KO …** tabs, set **Reference** / **Remarks**, and move the document to **FINAL** when policy allows. |
| **Warehouse** | Confirm **Branch**, **Location**, and **Lines** match the physical issue; after **FINAL**, new lines cannot be added from the **Lines** list. |
| **Finance** | Maintain **Settlement** lines when your company records payments or allocations on the GIN; use **Contra** on the edit screen when your process links contra documents. |

---

## Key features

{{< cards >}}
  {{< card title="Listing and search" subtitle="Grid, search, filters; multi-select FINAL (see warning)" link="#listing-and-search" >}}
  {{< card title="Create and edit GIN" subtitle="RESET, CREATE, SAVE, FINAL, tabs and layout" link="#create-and-edit-internal-sales-gin" >}}
  {{< card title="Main Details and Account" subtitle="Branch, dates, member card, entity and addresses" link="#main-details-and-account" >}}
  {{< card title="Lines and Select Item" subtitle="Search Item vs KO tabs, totals, pricing visibility" link="#lines-and-select-item" >}}
  {{< card title="Settlement and department" subtitle="Settlement lines, outstanding vs PNs, department header" link="#settlement-and-department-hdr" >}}
  {{< card title="Edit-only tabs" subtitle="Contra, Doc Link, Attachments, Export, delete" link="#edit-only-tabs" >}}
{{< /cards >}}

---

## Quick start {#quick-start}

Goal: first **saved** internal sales GIN (draft on the server), ready for **FINAL** when your team agrees.

1. Open the applet and use **Internal Sales GIN Listing**.
2. Click **+** (tooltip **Create**) to open **Create Internal Sales GIN**.
3. Open **Main Details**. Set **Branch**, **Location**, **Transaction Date**, **Member Card** (click the field to select a member), and other header fields your policy requires (for example **Reference**, **Remarks**, **Currency**).
4. Open **Account** → **Entity Details**. Select the **customer** using **Entity ID**, **Entity Name**, or the picker your screen shows.
5. Open **Lines**. Click **+** (**Create**) to open **Select Item**.
6. Add at least one line from **Search Item** or from the **KO …** tab that matches your process, then complete the line flow until the line appears on the **Lines** grid.
7. Click **CREATE**. The applet opens **Edit Internal Sales GIN** with **SAVE** available.
8. Click **SAVE** after changes to header, account, lines, or settlement; click **FINAL** only when the document is complete and your policy allows posting.

If **CREATE** or **SAVE** stays disabled, complete **Main Details**, ensure **Account** → **Entity Details** is valid, and keep **at least one line** on **Lines**—those are the same checks the applet uses before save.

![Create Internal Sales GIN screen](/images/internal-sales-gin-applet/create-sales-gin.png)

### Two ways to add lines {#two-ways-to-add-lines}

**Path A — Search Item (catalog)**

1. On **Lines**, click **+**.
2. On **Select Item**, use the **Search Item** tab (or that expansion panel in vertical layout).
3. Search and add the item until it appears on the **Lines** grid.

**Path B — KO from an existing document**

1. On **Lines**, click **+**.
2. On **Select Item**, open the **KO by …** or **KO for …** tab that matches your source (for example **KO by Sales Order Item** or **KO for Delivery Order Item**—labels match the screen).
3. Choose source lines and quantities as your process allows; return until new lines appear on **Lines**.

Your administrator may configure different KO tabs for different companies or roles; follow the tab your administrator or procedure names for the sale you are fulfilling.

![Two pathways for adding line items (Path A and Path B)](/images/internal-sales-gin-applet/line-item-path-a-path-b.png)

---

## Detailed walkthrough {#detailed-walkthrough}

**How to use this section by role**

- **Sales and operations** — Focus on [Listing and search](#listing-and-search), [Create and edit](#create-and-edit-internal-sales-gin), [Main Details and Account](#main-details-and-account), and [Lines and Select Item](#lines-and-select-item) to build and post GINs.
- **Warehouse** — Pay special attention to **Branch**, **Location**, and **Lines** in those same sections so what you pick matches the document; you may use the listing to open GINs for review.
- **Finance** — Use [Settlement and Department Hdr](#settlement-and-department-hdr) and the finance parts of [Edit-only tabs](#edit-only-tabs) (**Contra**); you can skip deep line-picking detail unless your role also creates lines.

### Listing and search {#listing-and-search}

{{< callout type="info" >}}
**Sales and operations:** Search, open documents from the grid, and create new GINs with **+**. Use listing **FINAL** only when you intend to post every selected row. **Warehouse:** You will often open a row here to confirm or complete issue details on **Edit Internal Sales GIN**; treat listing **FINAL** like a bulk post—coordinate with sales before posting many rows at once.
{{< /callout >}}

- Title: **Internal Sales GIN Listing**.
- **+** starts a new draft (**Create Internal Sales GIN**).
- **Search…** and the filter icon open **advanced search** aligned to the grid: **Sales GIN No**, **Branch Name**, **Customer Name**, **Sales Agent Name**, **Created Date** (from / to), **Transaction Date** (from / to), **Created by**.
- The grid includes **Sales GIN No**, **Posting Status** (empty values show as **DRAFT** in the listing), **Branch**, **Customer Name**, **Sales Agent**, date columns, and **Created by**.
- Click a row to open **Edit Internal Sales GIN**.
- **FINAL** on the listing applies to **selected rows**: each selected document that is not already **FINAL** is posted, then the grid refreshes.

{{< callout type="warning" >}}
**Multi-select FINAL is high impact.** If you select several rows and click **FINAL**, the applet posts **every selected document** that is not already **FINAL** in one action. There is no “undo” button on this listing screen. Correcting posted documents depends on your organisation (for example void, reversal, or adjustment in the ERP or another screen). Use this only when you are sure every selected GIN should be posted, and ask your **administrator** how corrections are handled in your company setup.
{{< /callout >}}

### Create and edit Internal Sales GIN {#create-and-edit-internal-sales-gin}

{{< callout type="info" >}}
**Sales and operations** drive **RESET**, **CREATE**, **SAVE**, and **FINAL** for the document lifecycle. **Warehouse** should confirm header and line data before **FINAL** matches the physical issue. **Finance** should read [When to use CREATE, SAVE, FINAL, and RESET](#when-create-save-final) together with [Settlement and Department Hdr](#settlement-and-department-hdr) so posting lines up with settlements your policy requires.
{{< /callout >}}

**Create Internal Sales GIN**

- **RESET** clears the draft.
- **CREATE** stays disabled until **Main Details**, **Account** (entity) forms are valid and **Lines** has at least one row.

**Edit Internal Sales GIN**

- **RESET** reloads the draft from the server while the document is not **FINAL**; if it is already **FINAL**, a message explains that the document has been posted.
- **FINAL** sets posting status to **FINAL** when it is not already final.
- **SAVE** uses the same validation as **CREATE** (valid main and account entity, at least one line).

#### When to use CREATE, SAVE, FINAL, and RESET {#when-create-save-final}

- **CREATE** — Use once on **Create Internal Sales GIN** when the first version of the document is ready. It saves the new GIN to the server and opens **Edit Internal Sales GIN**, where you can continue with **SAVE** and **FINAL**.
- **SAVE** — Use on **Edit Internal Sales GIN** whenever you change header, **Account**, **Lines**, or **Settlement** and want to persist those changes without posting. Another user with access can open the same GIN and **SAVE** further changes if your permissions and business rules allow that—coordination is a policy matter, not enforced by labels alone.
- **FINAL** — Use when the document is complete and your organisation authorises **posting**. **FINAL** sends posting to the server (same posting status as the **FINAL** button on the listing when used from the grid). After **FINAL**, most header fields lock and line behaviour changes (see [FAQ — Can I edit a GIN after it has been finalised?](#faq-edit-after-final)).
- **RESET** — On create, clears the in-memory draft. On edit, reloads from the server while the document is still a draft; if the document is already **FINAL**, **RESET** does not reload and you see a message that the document has been posted.

#### Create vs Edit (which tabs you see) {#create-vs-edit}

- On **Create Internal Sales GIN**, the main work tabs are **Main Details**, **Account**, **Lines**, **Settlement**, and **Department Hdr** (the last two can be hidden by settings).
- After you click **CREATE**, you work on **Edit Internal Sales GIN**. That screen adds **Contra**, **Doc Link**, **Attachments**, and **Export**—they are not on the first-time create screen. Open each tab when you need that work; the first time you open a tab, the applet may load its content then (this is normal and does not change what the tab is for).

**Tabs (horizontal layout)**

- **Main Details**, **Account**, **Lines**, **Settlement**, **Department Hdr** on create; **Settlement** and **Department Hdr** can be hidden by settings.
- On **Edit Internal Sales GIN**, the tabs above plus **Contra**, **Doc Link**, **Attachments**, and **Export** (see [Edit-only tabs](#edit-only-tabs)).

**Vertical layout**

- When orientation is vertical, the same sections appear as **expansion panels** instead of one tab row.

**Tab order**

- Administrators can persist tab order (**SALES_GIN_DETAILS_TAB_ORDER**); your order may differ from this guide.

### Main Details and Account {#main-details-and-account}

{{< callout type="info" >}}
**Sales and operations:** Complete customer-facing header fields, **Member Card**, references, and dates. **Warehouse:** Treat **Branch** and **Location** as the source of the issue—verify they match where goods physically leave before **FINAL**.
{{< /callout >}}

**Main Details** (common fields)

- **Branch** and **Location** pickers.
- **Sales Agent** (labels may follow applet settings).
- **Member Card** — Read-only field; click it to open **member selection**. The value is stored with the document as the member card number from membership data. For **what membership means** and how cards are issued, see **[Membership Admin Applet](/applets/membership/membership-admin-applet/)**. Selecting a member links this sale to that member for loyalty or reporting; leaving the wrong member on the document does not change physical stock by itself—correct the selection before **FINAL** if your policy requires it. If your administrator requires every GIN to have a member, you must complete this field so **CREATE** / **SAVE** validation can pass; if you believe the field should be optional for your shop, ask your **administrator** (only they can confirm company rules beyond what the screen enforces).
- **Transaction Date**, **Credit Terms**, **Due Date**, **Reference**, **Remarks**, **Currency**, **Customer**, and document number fields such as **Doc No (Tenant)** / company / branch when your configuration shows them.
- **Permit No** — Optional free-text field on the header. Use it when your business or jurisdiction needs a **permit, licence, or customs / export reference** on the goods issue; leave it blank when it does not apply. The applet does not define which regulator or permit type you must use—confirm with your **administrator** or compliance team.

**Account**

- Subtabs: **Entity Details**, **Bill To**, **Ship To**.
- **Entity Details** selects the **customer**; **Bill To** and **Ship To** maintain or pick billing and shipping addresses.

### Lines and Select Item {#lines-and-select-item}

{{< callout type="info" >}}
**Sales and operations:** Add and edit lines via **Select Item** (**Search Item** or **KO …** tabs). **Warehouse:** Use the **Lines** grid to check **Item Code**, **Item Name**, **UOM**, and **Qty** against the pick or shipment; after **FINAL**, new lines cannot be added from this list.
{{< /callout >}}

**Lines** tab

- **+** adds a line while the document is not **FINAL**; after **FINAL**, the add control is disabled for new lines from this list.
- Columns include **Item Code**, **Item Name**, **UOM**, **Qty**, and price or tax columns when your role may see pricing.
- Footer shows **Total** and **Tax** in document currency.
- Click a row to open that line in the line editor flow.

**Select Item** screen

- Title: **Select Item**.
- **Search Item** plus **KO by …** / **KO for …** tabs for sales orders, delivery orders, jobsheets, purchase documents, and other sources your tenant enabled.
- **CREATE** and **SAVE** require at least one line on the grid.

### Settlement and Department Hdr {#settlement-and-department-hdr}

{{< callout type="info" >}}
**Finance:** Use this section for **Settlement**—payments or allocations on the GIN and the **Outstanding** view versus PN lines. **Sales and warehouse:** You can usually skip this tab unless your procedure asks you to confirm amounts; it does not replace picking or bin checks on **Lines**.
{{< /callout >}}

**Settlement** is where you record **settlement lines on this GIN**—for example payments or allocations captured on the same document—so finance can align what was issued with what was collected or applied. The grid lists **Date**, **Amount**, **Details**, and **Remarks** for each settlement row. The screen shows **Total** for settlement lines and an **Outstanding** figure that reflects document lines (PN lines) versus settlements in the applet’s calculation; exact accounting impact on customer balance is defined by your ERP configuration—ask **finance** or your **administrator** if you are unsure.

- **Settlement**: grid with **+** for new settlement rows (not available after **FINAL**), with **Outstanding** and currency totals where shown.
- **Department Hdr**: department header fields your configuration exposes.

![Settlement and Department Hdr section](/images/internal-sales-gin-applet/settlement-departmnet-hdr.png)

### Edit-only tabs {#edit-only-tabs}

{{< callout type="info" >}}
**Finance:** Own **Contra** (offsets / linked receivable documents) when your process uses it. **Sales or operations:** **Doc Link**, **Attachments**, and **Export** are often used for traceability, files, and extracts—open them when your workflow requires linked references or exports. **Warehouse:** **Contra** is not part of physical issue; skip unless finance asks you to verify something on screen.
{{< /callout >}}

On **Edit Internal Sales GIN** (after **CREATE**), these tabs are available alongside the main work tabs:

- **Contra** — linked contra / AR documents (finance).
- **Doc Link** — linked document references.
- **Attachments** — add or view files.
- **Export** — export actions for the current document.

**Delete**

- In vertical layout, **DELETE** can appear at the bottom of the panel stack. It shows only when your administrator enables **SHOW_DOCUMENT_DELETE_BUTTON** and the document is not **FINAL**. The first click asks you to click again; the second click confirms delete.

---

## If something is wrong {#if-something-is-wrong}

| Symptom | What is going on | What to try |
|--------|------------------|-------------|
| **CREATE** / **SAVE** disabled | Main header, account entity, or lines fail validation, or there are no lines. | Fix required fields on **Main Details**, complete **Entity Details** and **Member Card** if required, add a line from **Select Item**. |
| **+** on **Lines** disabled | Document is **FINAL**. | New lines from this list are blocked after posting; follow your void or adjustment process if something must change. |
| **RESET** on edit says the document is posted | Posting status is **FINAL**. | Treat the record as read-only for reset; use your company process for corrections. |
| **Settlement** or **Department Hdr** missing | Settings hide those tabs. | Ask your administrator to review **HIDE_SETTLEMENT_TAB** and **HIDE_DEPARTMENT_HDR_TAB**. |
| Price columns missing on lines | Role hides pricing. | Ask for **INTERNAL_SALES_GIN_DISPLAY_PRICING** if your role should see amounts. |
| **DELETE** never appears | Setting off or document **FINAL**. | Ask your administrator about delete policy. |

---

## Related documentation

- **[Membership Admin Applet](/applets/membership/membership-admin-applet/)** — member profiles and cards when you use **Member Card** on the GIN.
- **[Sales Order (Internal) Applet](/applets/sales-workflow/internal-sales-order-applet/)** — upstream orders; many **KO …** line tabs pull from sales order lines.
- **[Sales Invoice (Internal) Applet](/applets/sales-workflow/internal-sales-invoice-applet/)** — billing and receivables context on the sales journey.
- **[Internal Sales Delivery Order (Stock Out) Applet](/applets/sales-workflow/internal-sales-delivery-order-stock-out-applet/)** — delivery fulfilment; KO delivery tabs on **Select Item** relate to that flow.
- **[Sales Return (Internal) Applet](/applets/sales-workflow/internal-sales-return-applet/)** — when goods are returned after a sale.
- **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)** — e-invoice queues and submission for organisations that use it; this GIN screen set does not replace that guide.

---

## FAQ {#faq}

### What is the difference between a GIN and a sales invoice? {#faq-gin-vs-invoice}

A **GIN (Goods Issue Note)** in this applet is centred on **recording the issue of stock** from branch/location for an internal sales fulfilment flow—lines, quantities, and operational header data. A **sales invoice** is the **billing / receivables** document: prices, tax presentation, payment expectations, and invoice lifecycle. Your organisation may use GIN before invoice, invoice before GIN, or both depending on policy; the screens are separate products. For the invoice side, see **[Sales Invoice (Internal) Applet](/applets/sales-workflow/internal-sales-invoice-applet/)**.

### Do I need a sales order before I can create a GIN? {#faq-sales-order}

**No.** On **Select Item**, you can add lines from **Search Item** without any sales order (**Path A** in [Two ways to add lines](#two-ways-to-add-lines)). **Sales orders** (and other documents) are optional sources when you use a **KO by …** / **KO for …** tab (**Path B**). Use the path your procedure requires.

### Can I edit a GIN after it has been finalised? {#faq-edit-after-final}

**Mostly no.** After **FINAL**, the applet **disables** most **Main Details** fields but **keeps Remarks editable** on the header. On **Lines**, **+** for new lines is **disabled** when posting status is **FINAL**. Other changes usually need your organisation’s void, reversal, or adjustment process—ask your **administrator**.

### Why can’t I see prices on the Lines tab? {#faq-prices}

Price-related columns (**Unit Price (Inclusive of Tax)**, **SST/VAT/GST**, **Txn Amount**) are hidden unless your login passes the **INTERNAL_SALES_GIN_DISPLAY_PRICING** check. Ask your **administrator** to grant that permission if your role should see amounts.

### Why can’t I see Settlement or Department Hdr tabs? {#faq-hidden-tabs}

If **Settlement** or **Department Hdr** never appears, your administrator may have hidden those tabs in applet settings (**HIDE_SETTLEMENT_TAB** / **HIDE_DEPARTMENT_HDR_TAB**). Confirm with your administrator whether your role should see these tabs.

### What happens to stock levels when I click FINAL? {#faq-stock}

Clicking **FINAL** sends **posting** to the server (posting status becomes **FINAL**). The document model includes inventory posting flags that the backend uses; **exact stock ledger movement and timing** are determined by your ERP and configuration, not by a separate “post stock” button on this screen. Warehouse staff should treat **FINAL** as the point where the business considers the issue **posted**, and confirm with **administrator** / **finance** when stock should be picked or counted against the GIN.

### Does the listing FINAL button replace edit FINAL? {#faq-listing-vs-edit-final}

Both set posting status to **FINAL**. The listing control posts all **selected** rows that are not already final in one go—see the warning under [Listing and search](#listing-and-search).

### Can I rename tabs?

Labels come from the product; administrators can hide tabs or change order where settings allow.

### Where do I handle e-invoice for this sale?

Use **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)** and your finance process when e-invoice applies to related documents.

---

## Glossary {#glossary}

| Term | Meaning in this guide |
|------|------------------------|
| **GIN** | **Goods issue note** for internal sales: stock leaving toward fulfilment. |
| **KO (knock-off, tab names)** | On **Select Item**, **KO by …** / **KO for …** means the **system pulls line items from an existing document automatically** so you do not re-enter them by hand. The source document type is in the tab label (for example sales order or delivery order). |
| **Posting status** | **DRAFT** (in progress) versus **FINAL** (posted); the listing may show blank status as **DRAFT**. |
| **Settlement** | Payment or allocation lines on the GIN when your organisation uses that tab. |
| **UOM** | Unit of measure on a line. |
| **Reference** | Free-text reference on **Main Details** for traceability (for example to a sales order or invoice). |
| **Branch / Location** | Issue-from branch and location on **Main Details**. |

For **e-invoice queues**, batching, and validation, see **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)**—not repeated here.
