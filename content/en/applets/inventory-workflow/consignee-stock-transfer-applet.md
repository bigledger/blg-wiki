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
   - **Location(Sending)**
   - **Location(Receiving)**
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
- **FINAL** records stock movement in inventory ledger: stock decreases at **Location(Sending)** and increases at **Location(Receiving)**. For wrong finalization, use **VOID** (issued flow) or your administrator's correction process (received flow).

---

## Detailed workflows

### Consignee Listing

**Role: Admin / master data owner**

Use **Consignee Listing** to maintain consignee location records used by stock transfer transactions.

![Consignee listing and applet menu](/images/consignee-stock-transfer-applet/1.png)

Minimum setup checklist for a usable consignee location record:

1. Create or update the consignee location entry.
2. Complete mandatory location identity fields (code and name).
3. Complete company/branch linkage fields required by your location setup screen.
4. Save and verify the location is active.

What happens if setup is incomplete:

- Incomplete or invalid location records may not appear in **Location(Sending)** or **Location(Receiving)** pickers when users create transfer documents.
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
| **CREATE** button is disabled | Required fields in **Details** are incomplete, or line requirements are not met. | Complete sending/receiving locations, transfer date, and at least one valid line item. |
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

Usually because required values are missing, especially sending/receiving locations, transfer date, item, or valid quantity.

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
