---
title: "Consignee Stock Transfer Applet"
description: "User guide for consignee stock movement: maintain consignee locations, issue stock out, receive stock back, and finalize transfers."
tags:
- consignee-stock-transfer
- consignment
- inventory-workflow
- stock-movement
- goods-issued-note
- goods-received-note
weight: 58
date: 2026-04-27
lastmod: 2026-06-16
draft: false
---

## Purpose and overview

Use this applet to control stock that moves between your business and consignee locations.
Consignment means your company still owns the stock, but it is physically stored at another party's location (for example a customer site or partner-managed location) until it is used or sold.

It has three working areas in the menu:

- **Consignee Listing** for maintaining consignee locations.
- **Consignment Goods Issued Note** for stock going out to consignee side.
- **Consignment Goods Received Note** for stock coming back in.

In both note flows, users work from listing -> create/edit document -> add line items -> **CREATE** or **SAVE** -> **FINAL** when ready.

![Consignee Stock Transfer overview](/images/consignee-stock-transfer-applet/consginee-stock-transfer-overview.png)

---

## Before you begin

- You need valid **locations** for source and destination.
- You need active **items** in item master so users can pick from **Search Item**.
- Users need access to the relevant applet menu and action permissions for create/final/discard/void.
- Team policy should define when to use **FINAL**, **DISCARD**, and **VOID**.

---

## Who uses this applet

| Role | Main responsibility |
|------|----------------------|
| Warehouse / inventory operations | Create issued and received notes, enter locations, add quantities, and complete posting. |
| Inventory controller / supervisor | Review listing, perform bulk **FINAL** carefully, and monitor transfer status. |
| Admin | Maintain consignee location master data and applet settings (field/default configuration). |

---

## Key features

{{< cards >}}
  {{< card title="Consignee Listing" subtitle="Maintain consignee locations used in transfer documents" link="#consignee-listing" >}}
  {{< card title="Goods Issued Flow" subtitle="Record stock issued to consignee side" link="#consignment-goods-issued-note" >}}
  {{< card title="Goods Received Flow" subtitle="Record stock received back from consignee side" link="#consignment-goods-received-note" >}}
  {{< card title="Real-world scenarios" subtitle="Demo stock, returns, partial return, corrections" link="#real-world-scenarios" >}}
  {{< card title="Balance after transfers" subtitle="Reconcile issued vs received quantities" link="#where-to-see-balance-after-transfers" >}}
  {{< card title="Line Item Control" subtitle="Search item, quantity, and serial/batch/bin handling" link="#line-items-and-item-detail-editing" >}}
  {{< card title="Status Actions" subtitle="FINAL, DISCARD, and VOID actions from listing and edit flow" link="#status-reference" >}}
{{< /cards >}}

---

## Quick start

**Role: Warehouse / operations**

Goal: create your first completed transfer document.

1. Open the applet and go to **Consignment Goods Issued Note** (outbound) or **Consignment Goods Received Note** (inbound), based on the physical movement.
2. On listing, click **+** (Create).
3. In **Details**, complete:
   - **Location From** (source)
   - **Location To** (destination)
   - **Stock Transfer Good Issue Date**
   - Optional fields:
     - **Tracking ID**: transfer-trace identifier for operations follow-up.
     - **Reference #**: your internal reference (for example PO number, job number, or request number).
     - **Doc Description** and **Remarks**: free-text context for your team.
4. Open **Line** and click **+** to open **Create Line Item**.
5. In **Search Item**, type the item code or item name into the search field, then select the correct item from the results. If nothing appears, confirm with your administrator that the item is active in item master.
6. In **Item Details**, enter **Quantity** and any required serial/batch/bin details.
7. Click **ADD** to return the line into the document.
8. Back on the document, click **CREATE**.
9. Review and click **SAVE** if you make changes.
10. Click **FINAL** only after confirming the physical transfer is correct.

![Create document details tab](/images/consignee-stock-transfer-applet/2.png)

What happens next:

- After **CREATE**, the document exists in the listing and can be reopened.
- After **FINAL**, the document is posted and key fields become read-only.
- **FINAL** records stock movement in inventory ledger: stock decreases at **Location From** and increases at **Location To**. For wrong finalization, see [Wrong quantity or location](#scenario-wrong-quantity-or-location).

---

## Real-world scenarios {#real-world-scenarios}

The examples below use the same item and locations so you can follow stock **out**, **back in**, and **remaining balance**.

| Example value | Meaning |
|---------------|---------|
| Item `FG-DEMO-001` | Product sent to the partner for customer demonstrations |
| **Location From** `WH-MAIN` | Your warehouse |
| **Location To** `L-PARTNER-SHOWROOM` | Partner showroom (consignee location from **Consignee Listing**) |
| **Tracking ID** `DEMO-MAR-2026` | Shared reference on issued and received notes |

### Scenario: Send stock to a partner showroom {#scenario-send-to-partner-showroom}

**Situation:** You send **10 units** of `FG-DEMO-001` from your warehouse to a partner showroom for customer demonstrations. Your company still owns the stock.

1. Confirm **L-PARTNER-SHOWROOM** exists in **Consignee Listing** (see [Consignee Listing and organization master data](#consignee-listing)).
2. Open **Consignment Goods Issued Note** → click **+** → **Create Goods Issued Note**.
3. **Details** tab:
   - **Location From** = `WH-MAIN`
   - **Location To** = `L-PARTNER-SHOWROOM`
   - **Stock Transfer Good Issue Date** = transfer date
   - **Tracking ID** = `DEMO-MAR-2026` (optional but helps match later returns)
4. **Line** tab → **+** → **Search Item** → select `FG-DEMO-001` → **Quantity** = `10` → **ADD**.
5. Click **CREATE**, review, then **FINAL** on the edit screen or from the listing.

**How to track this issued note**

- **Consignment Goods Issued Note Listing** — search or filter by **Doc No**, **Posting Status** (**DRAFT** / **FINAL**), **Tracking ID**, or **Reference #**.
- Reopen the row to view **Edit Goods Issued Note** (**Details** and **Line**).
- Use listing export icons (PDF / spreadsheet) if you need an audit copy.

After **FINAL**, inventory decreases at **Location From** and increases at **Location To** (10 units now sit at the partner location in the ledger).

### Scenario: Retailer returns unsold units {#scenario-retailer-returns-unsold}

**Situation:** The partner returns **4 unsold units** of `FG-DEMO-001` to your warehouse.

There is no separate “return document type”—use **Consignment Goods Received Note**.

1. Open **Consignment Goods Received Note** → click **+** → **Create Goods Received Note**.
2. **Details** tab:
   - **Location From** = `L-PARTNER-SHOWROOM` (stock leaving the consignee side)
   - **Location To** = `WH-MAIN` (stock returning to your warehouse)
   - **Stock Transfer Good Issue Date** = receipt date
   - **Tracking ID** = `DEMO-MAR-2026` (same ID as the original issue, if you use tracking)
3. **Line** tab → **+** → select `FG-DEMO-001` → **Quantity** = `4` → **ADD**.
4. Click **CREATE**, then **FINAL**.

After **FINAL**, 4 units move back from the partner location to your warehouse.

### Scenario: Partial return {#scenario-partial-return}

**Situation:** You issued **10** units but only **4** came back—the other **6** remain at the partner showroom.

- Record the **4** units on a **Consignment Goods Received Note** as in [Retailer returns unsold units](#scenario-retailer-returns-unsold).
- You do **not** need a special “partial return” document type—enter only the quantity physically returned on the **Line** tab.
- When more units return later, create **another** received note for the remaining quantity (for example **6** units) with the same **Location From** / **Location To** and the same **Tracking ID** if you use one.

See [Where to see balance after transfers](#where-to-see-balance-after-transfers) for how to reconcile **10 issued − 4 received = 6 remaining** at the consignee location.

### Scenario: Wrong quantity or location {#scenario-wrong-quantity-or-location}

**Situation:** The transfer was entered with the wrong quantity or the wrong **Location From** / **Location To**.

| When you notice | Document state | What to do |
|-----------------|----------------|------------|
| Before posting | **DRAFT** | Fix fields on the edit screen, or **DISCARD** on the listing and create a new note. |
| After posting | **FINAL** (issued note) | Select the row on **Consignment Goods Issued Note Listing** → **VOID** → create a new issued note with the correct locations and quantities. |
| After posting | **FINAL** (received note) | **VOID** is not available on the received listing. Follow your administrator's correction process. |

Confirm locations and quantities **before** **FINAL**—posted documents cannot be edited like a normal draft.

---

## Where to see balance after transfers {#where-to-see-balance-after-transfers}

This applet does **not** provide a dedicated “consignee balance” screen. Use the steps below to see what remains after issues and receipts.

**1. Reconcile issued vs received in this applet**

For the same item and location pair (and **Tracking ID** / **Reference #** if you use them):

| Step | Menu | What to check |
|------|------|----------------|
| Total sent out | **Consignment Goods Issued Note Listing** | Sum **Qty** on **FINAL** notes where **Location To** is the consignee location |
| Total returned | **Consignment Goods Received Note Listing** | Sum **Qty** on **FINAL** notes where **Location From** is the consignee location |
| Remaining at consignee | Calculation | **Issued qty − Received qty** (for example 10 − 4 = **6** still at partner) |

Open each **FINAL** document and review the **Line** tab for exact quantities.

**2. Stock on hand by location (outside this applet)**

For ledger **balance at a location** (not just transfer documents), use your organisation's **inventory / stock-on-hand report or inquiry** by **Location**—typically in inventory or reporting modules, not in this applet's sidebar.

**3. Consignee Listing locations**

Locations in **Consignee Listing** (including names such as **STOCK-IN-TRANSIT** when your setup uses them) are master-data records linked to **Company Name** and **Branch Name**. They define which names appear in **Location From** / **Location To**; they are not a balance report by themselves.

---

## Detailed workflows

### Consignee Listing {#consignee-listing}

**Role: Admin / master data owner**

Use **Consignee Listing** to maintain **location** records used as consignee destinations and sources in transfer documents. Click **+** to open **Create Location** (**Details** and **Address** tabs).

![Consignee listing and applet menu](/images/consignee-stock-transfer-applet/1.png)

**Connection to organization master data**

Consignee locations are tied to your organisation setup—not a separate consignee “party” picker on transfer notes:

- **Company Name** (required) — dropdown from company / organisation master data.
- **Branch Name** — dropdown from branch master data for that company.
- **Location Code** and **Location Name** (required) — identify the consignee site (for example `L-PARTNER-SHOWROOM`).

After **SAVE**, the location appears in **Location From** and **Location To** on **Consignment Goods Issued Note** and **Consignment Goods Received Note** when your user and configuration allow it. Company and branch records are maintained in your organisation / company setup (outside this applet); **Consignee Listing** creates the **location** record linked to that company and branch.

Minimum setup checklist for a usable consignee location record:

1. Create or update the consignee location entry (**Create Location**).
2. Complete **Location Code**, **Location Name**, and **Company Name** (and **Branch Name** when required).
3. Complete **Address** tab fields when your policy requires them.
4. **SAVE** and verify the location appears in transfer document location dropdowns.

What happens if setup is incomplete:

- Incomplete or invalid location records may not appear in **Location From** or **Location To** pickers when users create transfer documents.
- If users cannot select a location during transfer creation, fix location master completeness first before troubleshooting note flow.

### Consignment Goods Issued Note

**Role: Warehouse issuing stock**

Use this flow when stock moves **out** from your side.

- Listing title: **Consignment Goods Issued Note Listing**
- Create/edit title changes between **Create Goods Issued Note** and **Edit Goods Issued Note**
- Main tabs: **Details**, **Line**
- Listing actions include **FINAL**, **DISCARD**, and **VOID** (subject to settings/permission)

![Issued note listing actions](/images/consignee-stock-transfer-applet/5.png)

When to use each action:

- **CREATE**: first save of a new note.
- **SAVE**: update an existing created note.
- **FINAL**: post draft document.
- **DISCARD**: discard draft active document.
- **VOID**: reverse a final active issued document (from listing).

### Consignment Goods Received Note

**Role: Warehouse receiving stock back**

Use this flow when stock moves **back in** from consignee side.

The **Received Note** flow is identical to the **Issued Note** flow above (same tabs, steps, and fields). The only differences are:

- Movement direction is inward (return/receipt back to your side).
- **VOID** action is not provided in the received note listing flow.

- Listing title: **Consignment Goods Received Note Listing**
- Create/edit title changes between **Create Goods Received Note** and **Edit Goods Received Note**
- Main tabs: **Details**, **Line**
- Listing actions include **FINAL** and **DISCARD**

When to use each action:

- **CREATE**: first save of a new note.
- **SAVE**: update an existing created note.
- **FINAL**: post draft document.
- **DISCARD**: discard draft active document.

### Line items and item detail editing

**Role: Warehouse / inventory operations**

From both issued and received documents:

1. Open **Line**.
2. Click **+** to open **Create Line Item**.
3. In **Search Item**, pick item.
4. In **Item Details**, confirm:
   - **Item Code**
   - **Item Name**
   - **Quantity** (must be at least 1)
5. If applicable, complete additional tabs:
   - **Serial Number**
   - **Bin Number**
   - **Batch Number**
6. Click **ADD** for new line, or **SAVE** for line edit.
7. Use **DELETE** in line editor if a line should be removed.

![Search item in create line item](/images/consignee-stock-transfer-applet/3.png)

![Item details tab](/images/consignee-stock-transfer-applet/4.2.png)

![Item details with tracking tabs](/images/consignee-stock-transfer-applet/4.png)

Concrete example:

- If you issue 12 units of item `FG-1001` to a consignee location, set quantity to `12` and confirm matching serial or batch values if the item requires tracking.
- Which tracking tabs appear depends on item subtype configured in item master. If you expect a tracking tab and it is missing, ask your administrator to verify item tracking setup.

---

## Status reference

This applet uses two status dimensions:

- **Record status** (for example **TEMP**, **ACTIVE**) describes document record condition.
- **Posting status** (for example **DRAFT**, **FINAL**, **VOID**, **DISCARDED**) describes transaction posting stage.

Most daily work states:

- **Ready to edit**: ACTIVE + DRAFT
- **Posted**: ACTIVE + FINAL
- **Cancelled/reversed**: ACTIVE + VOID or posting status DISCARDED (for discarded drafts)

| Status / action | Meaning | User impact |
|-----------------|---------|-------------|
| **TEMP** | Temporary header created but not complete yet. | Not ready for normal transaction processing; complete required fields first. |
| **ACTIVE** | Active business record state. | Document can still be worked on based on posting status. |
| **DRAFT** (posting status) | Not posted yet. | Can be edited, finalized, or discarded (if active). |
| **FINAL** (posting status) | Posted transaction. | Header and line editing is restricted; new line creation is blocked. |
| **VOID** (posting status, issued flow) | Final document voided. | Used to reverse a previously final issued note. |
| **DISCARDED** (posting status) | Draft removed from active process. | Treated as non-active for normal processing. |

How **TEMP** moves forward:

- TEMP commonly appears during early document creation before required header/location data is complete.
- Once required details are completed and the applet converts the record into active workflow state, users can proceed with normal create/save/final actions.

---

## If something is wrong

| Symptom | Likely reason | What to do |
|--------|---------------|------------|
| **CREATE** button is disabled | Required fields in **Details** are incomplete, or line requirements are not met. | Complete **Location From**, **Location To**, transfer date, and at least one valid line item. |
| **FINAL** button is disabled on listing | Selected rows are not valid draft active documents. | Select only rows with posting status **DRAFT** and status **ACTIVE**. |
| **VOID** is unavailable in issued note listing | Only final active rows can be voided. | Select a row with posting status **FINAL** and status **ACTIVE**. |
| Cannot add new lines | Document is already **FINAL** or **VOID**. | Use your correction process (for example VOID + recreate) based on company policy. |
| Date field cannot be edited | Transaction date setting is restricted by configuration. | Ask admin to review applet date behavior settings. |

---

## Related documentation

- **[Stock Transfer Applet](/applets/inventory-workflow/stock-transfer-applet/)** - broader internal stock movement process outside consignee-specific flow.
- **[Customer Consignment Applet](/applets/sales-workflow/customer-consignment-applet/)** - consignment operation context and transfer out/receive business process.
- **[Consignment GIN (Internal) Applet](/applets/inventory-workflow/internal-consignment-gin-applet/)** - related goods issue process for consignment tracking.
- **[Consignment Billing (Internal) Applet](/applets/sales-workflow/internal-consignment-billing-applet/)** - downstream billing after consignment movement/consumption.

---

## FAQ

### Which menu should I use: Issued Note or Received Note?

Use **Consignment Goods Issued Note** when stock moves out to consignee side. Use **Consignment Goods Received Note** when stock comes back in.

### What is the difference between this applet and the Stock Transfer Applet?

Use this applet when movement is specifically tied to consignee/consignment process. Use **Stock Transfer Applet** for broader internal stock transfer workflows that are not consignee-specific.

### What happens if I click FINAL on the wrong document by mistake?

For issued flow, follow your company process for **VOID** on eligible final documents. For received flow, follow administrator-controlled correction process. Do not continue downstream processing until the mistaken posting is corrected.

### Can I finalize multiple documents at once?

Yes. Listing supports selecting multiple rows and clicking **FINAL**. Only draft active rows are processed.

### Can I transfer stock between two consignee locations, or only between my warehouse and a consignee?

The screen supports transfer between sending and receiving locations that are available to your user and configuration. Whether consignee-to-consignee transfer is allowed depends on your location setup and policy; confirm with your administrator.

### What is the difference between DISCARD and VOID?

- **DISCARD** applies to draft documents (not posted yet).
- **VOID** applies to final documents (issued note flow) when you need reversal.

### Can I edit a document after FINAL?

Not as a normal draft edit flow. Finalized documents are treated as posted, and main editable controls are restricted.

### Why is CREATE or ADD disabled?

Usually because required values are missing, especially **Location From**, **Location To**, transfer date, item, or valid quantity.

### How do I handle a partial return?

Create a **Consignment Goods Received Note** with only the quantity physically returned on **Line**. Remaining units stay at the consignee location until you post another received note. See [Partial return](#scenario-partial-return) and [Where to see balance after transfers](#where-to-see-balance-after-transfers).

### Where can I see balance after issue and receipt?

Reconcile **FINAL** issued and received notes in this applet, or use stock-on-hand by location in your inventory reports. See [Where to see balance after transfers](#where-to-see-balance-after-transfers).

### Does Consignee Listing connect to organization locations?

**Consignee Listing** creates **location** records linked to **Company Name** and **Branch Name** from organisation master data. Those locations then appear in **Location From** / **Location To** on transfer documents. See [Consignee Listing](#consignee-listing).

### Do I need serial, bin, or batch every time?

Only when the selected item type requires that tracking method. The relevant tab appears based on item subtype.

---

## Glossary

- **Consignee**: a party or location holding stock that your company still owns until usage/sale conditions are met.
- **Goods Issued Note (GIN)**: document for stock moving out from your side.
- **Goods Received Note (GRN)**: document for stock moving back in.
- **Line Item**: one item row in a document, including quantity and tracking details.
- **Posting Status**: processing stage of a document, such as **DRAFT**, **FINAL**, or **VOID**.
- **FINAL**: action that posts a document as completed transaction.
- **DISCARD**: action that removes a draft from active processing.
- **VOID**: action that reverses a finalized document in the issued flow.
