---
title: "Purchase GRN Stock In (Internal) Applet"
description: "Record and control goods receipt for internal purchasing with stock-in posting, line-level verification, delivery branch handling, posting status controls, and full audit traceability."
tags:
- purchase-workflow
- grn
- goods-received-note
- stock-in
- warehouse-operations
- inventory-management
weight: 19
date: 2026-05-06
lastmod: 2026-05-06
draft: false
---

## Purpose and Overview

The **Purchase GRN Stock In (Internal) Applet** is where your team records the **physical receipt of goods** and posts those goods into stock. It is the control point between what purchasing expected, what the warehouse actually received, and what finance later matches for payment.

{{< callout type="info" >}}
**Core Concept**: This applet links **what was ordered** (purchase flow), **what arrived** (GRN line items, serial/batch/bin detail), and **what gets posted** (stock increase, branch/location allocation, and downstream invoice matching).
{{< /callout >}}

A GRN (Goods Received Note) is not just a receipt log. It is the operational document used by warehouse staff to confirm quantity, delivery site, item controls, and posting status before downstream billing and three-way matching.

## Document Status Reference {#document-status-reference}

| Posting Status | Meaning | What you can do |
|----------------|---------|-----------------|
| **DRAFT** | Work in progress | **SAVE**, edit header and lines, add serial/batch/bin details, add remarks, discard if incorrect |
| **FINAL** | Posted / locked | **VIEW**, **PRINT/EXPORT**, **VOID** (when allowed), proceed with invoice matching |
| **VOID** | Reversed posted document | View for audit and traceability; stock and financial logic follow reversal workflow |
| **DISCARDED** | Draft cancelled before posting | View history only; create a new GRN if receipt still applies |

{{< callout type="warning" >}}
After **FINAL**, the GRN is normally locked for structural edits. In most setups, header and line-item quantity fields are read-only. If a posted GRN is wrong, standard correction is **VOID** (if allowed) and recreate with correct receipt details.
{{< /callout >}}

{{< callout type="info" >}}
**What FINAL does in practice**: the document becomes the official stock-in record for the delivery branch and location. Warehouse users should expect the inventory quantity to increase immediately after posting, while purchasing and finance can use the same document for receipt confirmation and invoice matching.
{{< /callout >}}

---

## Before You Start

- Confirm the related purchase transaction exists or that you have the supplier delivery reference that will be used on the GRN.
- Confirm the receiving **Branch** and **Delivery Location** where stock should be posted.
- Prepare delivery evidence: supplier document number, delivery date, and received quantities.
- If items require tracking, prepare **serial numbers**, **batch numbers**, and **bin locations** before you start.
- Confirm currency and forex handling for non-base-currency purchases.
- Verify user permission for create, final, void, and discard actions.

{{< callout type="info" >}}
**Delivery Branch vs Branch**: use **Branch** for the organizational branch that owns the document and **Delivery Branch** for the physical site where stock is received. Example: Branch = HQ Purchasing, Delivery Branch = KL Warehouse.
{{< /callout >}}

---

## Glossary {#glossary}

| Term | Meaning in this guide |
|------|------------------------|
| **GRN** | Goods Received Note document confirming goods arrival. |
| **Stock In** | Inventory increase posted from finalized GRN lines. |
| **DRAFT** | Editable pre-posting state. |
| **FINAL** | Posted state used for downstream matching and control. |
| **VOID** | Reversal state for previously finalized GRN. |
| **DISCARDED** | Cancelled draft, not posted. |
| **Delivery Branch** | Branch where goods physically arrive, which may differ from purchasing branch. |
| **Delivery Location** | Specific receiving location/warehouse for stock posting. |
| **Serial Number** | Unique identifier tracked per unit. |
| **Batch Number** | Lot grouping identifier for batch-controlled items. |
| **Bin Number** | Storage bin/rack location inside warehouse. |
| **Three-way Matching** | Matching Purchase Order, GRN, and Purchase Invoice before payment. |

---

## Key Features Overview

### Who Benefits from This Applet?

**Warehouse / receiving teams:**
- Record actual quantity received and receiving location.
- Capture serial, batch, and bin detail at line level.
- Prevent posting errors with controlled DRAFT to FINAL workflow.

**Purchasing teams:**
- Monitor supplier fulfillment and partial deliveries.
- Compare ordered vs received quantity quickly.
- Keep clean document trail for supplier follow-up.

**Inventory control teams:**
- Ensure stock-in is posted to correct branch/location.
- Maintain line-level movement history via listing and line-items workspace.
- Track complex item controls (serial/batch/bin).

**Finance teams:**
- Use GRN as receipt proof for three-way matching.
- Control posting status before invoice settlement.
- Audit status history (DRAFT, FINAL, VOID, DISCARDED).

**Administrators:**
- Configure field visibility and defaults.
- Control branch behavior, printable formats, and custom statuses.
- Manage permission matrices for posting actions.

### What Problems Does This Solve?

Without a controlled GRN process, receiving teams often update stock based on informal notes, causing quantity mismatches, posting delays, and invoice disputes.

This applet solves that by providing:

- **Controlled stock posting** from DRAFT to FINAL.
- **Line-level receipt verification** including serial/batch/bin support.
- **Branch/location-accurate stock in** for multi-site operations.
- **Status-controlled corrections** via discard/void workflows.
- **Audit-ready document history** for operations and finance.

---

## Key Concepts

### GRN as Receiving Control Point

| Business Question | Answered by |
|-------------------|-------------|
| What was expected? | Upstream purchase document (PO/DO context) |
| What physically arrived? | GRN line items and tracked quantities |
| Where did stock go? | Delivery Branch and Delivery Location |
| Is receipt posted yet? | Posting Status (DRAFT vs FINAL) |
| Can this be corrected? | Discard (draft) or Void (posted) workflow |

### Three-Way Matching Role

A GRN is the receipt leg in **PO -> GRN -> Purchase Invoice** control. Finance checks the PO for what was ordered, the GRN for what actually arrived, and the invoice for what the supplier is billing. If quantity or price differs, the mismatch is investigated before payment.

### Worked Example

Example receipt scenario:

- Supplier: **ABC Trading Sdn Bhd**
- Branch: **HQ Purchasing**
- Delivery Branch: **KL Warehouse**
- Delivery Location: **Receiving Bay 2**
- Supplier document: **DO-45821**
- Received item: **FG-1001 Finished Goods**
- Quantity received: **12 units**
- Tracking: **Batch B2405** and **Serial SN-001 to SN-012**

In this example, the warehouse clerk opens the GRN, confirms the delivery site, enters 12 units, captures the batch and serial data, and then finalizes the document so the 12 units become visible in stock at KL Warehouse.

---

## Quick Start Guide

### Step 1: Open Listing
Go to **Internal Purchase GRN Stock In** from the sidebar.

### Step 2: Create New GRN
Click **Create** to open a new draft document.

### Step 3: Set the header correctly
Choose the company and branch that own the document, then set the transaction date to the date the goods physically arrived. Fill the supplier reference or delivery note number so the warehouse team can trace the receipt later.

### Step 4: Confirm where stock should post
Set **Delivery Branch** and **Delivery Location** before you enter quantities. If the delivery branch is wrong, the stock will post into the wrong site and your warehouse balances will not match.

### Step 5: Add the received lines
For each item on the delivery note, enter the actual received quantity. If the supplier shipped 12 boxes, enter 12 boxes, not the ordered amount if they are different.

### Step 6: Complete item controls
If the item is controlled, fill the correct serial numbers, batch number, or bin numbers before saving. For example, if you received 12 serialized items, the serial count should match the line quantity.

### Step 7: Check quantity and control totals
Review the line total, item count, and control count before saving. If the line says 12 units, the serial, batch, or bin detail must resolve to the same 12 units.

### Step 8: Save the draft
Click **SAVE** if you still need to validate the delivery note or wait for supervisor review.

### Step 9: Finalize the GRN
Click **FINAL** only after the received quantity, branch/location, and item control details are correct. Posting will add the stock into the chosen receiving location.

### Step 10: Hand off for invoice matching
After FINAL, send the GRN to purchasing or finance so they can use it for invoice matching and receipt verification.

---

## Detailed Walkthrough

### GRN Listing

The listing is your operational queue:
- Search and filter by supplier, date range, status, and branch.
- Open a row to view/edit document details.
- Perform batch actions where enabled (for example finalizing selected drafts).
- Use **VOID** only on rows in **FINAL** status.
- Use **DISCARD** only on rows in **DRAFT** status.

Use the listing when a receiving dock needs to quickly find the right document, confirm status, or check whether a receipt was already posted.

### Main/Header Information

Common header fields include:

| Field | What to enter | Why it matters |
|------|---------------|-----------------|
| **Company** | The legal entity receiving the goods | Ensures stock and audit ownership are correct |
| **Branch** | The organizational branch tied to the document | Used for document ownership and permissions |
| **Location** | The receiving warehouse or storage area | Helps route the receipt to the right inventory area |
| **Transaction Date** | The date the goods physically arrived | Used for posting and reporting |
| **Purchaser** | The buyer or procurement owner | Helps purchasing trace the receipt back to the request |
| **Credit Terms** | Supplier payment timing if the field is enabled | Used later for invoice settlement |
| **Credit Limit** | Supplier credit cap if your process uses it | Helps finance control exposure |
| **Reference** | PO number, delivery note number, or internal reference | Ties the GRN back to the upstream document |
| **Remarks** | Internal notes for your team | Useful for receiving issues or special handling |
| **External Remarks** | Notes that should appear externally | Use only if the supplier or another team needs to read it |
| **Currency / Base Currency / Currency Rate** | Select the transaction currency and rate if non-base currency applies | Makes amounts consistent for finance |
| **Delivery Branch** | The physical branch where goods are received | Determines where stock is posted |
| **Delivery Location** | The precise receiving location within the branch | Avoids stock going into the wrong warehouse |

**Important distinction**: if HQ created the order but KL Warehouse receives the goods, keep **Branch = HQ** and **Delivery Branch = KL Warehouse**.

### Line Items Workspace

The applet includes a dedicated **Line Items** menu for cross-document line visibility. Use it to review receipt quantity patterns by item and troubleshoot quantity mismatch without opening each header one by one.

### Item Details tab

Use **Item Details** for the basic receipt line. This is where you verify the item, the quantity received, and the main receipt data before control tabs are filled. If the quantity is wrong here, the rest of the document will be wrong too.

### Serial Number tab

Use **Serial Number** only for serial-controlled items. Add each serial number that was physically received. The tab is complete when the serial count matches the line quantity.

### Batch Number tab

Use **Batch Number** for lot-controlled items. Enter the batch number and quantity that belongs to the lot. This is usually required when traceability or expiry tracking matters.

### Bin Number tab

Use **Bin Number** when the warehouse stores stock in specific bins or racks. Enter the receiving split by bin so the system can place the quantity in the correct storage location.

### Costing Details tab

Use **Costing Details** when your business needs receipt-level costing, landed cost context, or similar finance-controlled detail. If your organization does not use costing detail, this section may remain minimal.

### Pricing Details tab

Use **Pricing Details** to confirm the item price context. The template shows fields such as UOM and purchase price values. A correct entry means the unit price aligns with the supplier documentation and any tax-inclusive fields are consistent.

### Issue Link tab

Use **Issue Link** when the receipt needs to be tied back to an issue, investigation, or internal tracking thread. It is most useful when a receipt has a discrepancy that must be reviewed later.

### Detail rule

The line-item area is complete only when the receipt quantity, any required serial/batch/bin data, and any required pricing/costing fields all agree with the supplier note and the actual goods in hand.

### Posting Actions and Rules

- **FINAL** posts stock movement and transitions status to FINAL. In practice, the stock becomes available in the delivery branch/location immediately after posting, and the GRN becomes the official receiving record for downstream matching.
- **VOID** is typically allowed only for FINAL documents. If a void is blocked, it usually means the document is already linked to another document or a downstream process has used it.
- **DISCARD** is typically allowed only for DRAFT documents. Use it when the draft was created in error or should not be posted.

**Void dependency check**: if VOID is blocked, check whether the GRN is already linked to an invoice, knock-off, or another dependent document. In that case, the receiving or finance team must clear or reverse the linked document first.

### Settings and Personalization

System settings available in applet navigation include:

| Setting | What it changes | Who should manage it |
|---------|-----------------|----------------------|
| **Application / Field Settings** | Field visibility and workflow behavior | Administrator / applet owner |
| **Default Selection** | Pre-filled branch and location defaults | Administrator or power user |
| **Printable Format Settings** | GRN print layout and report format | Administrator / reporting owner |
| **Branch Settings** | Branch-specific receiving behavior | Administrator / operations lead |
| **Custom Status** | Extra workflow statuses for receiving stages | Administrator / process owner |

User personalization supports personal default selection to speed up repeated receiving work.

---

## Finalize / Save / Reset

### SAVE

Use SAVE during receiving to keep the document in DRAFT while validation is in progress. This is the right action when the goods are counted but the supervisor has not yet approved final posting.

### FINAL

Use FINAL when quantity, location, and item controls are correct. FINAL:

- Posts stock into the selected delivery location.
- Locks the document for normal edits.
- Makes the GRN available to purchasing and finance for invoice matching.
- Starts the official inventory/audit record for that receipt.

### VOID

Use VOID to reverse a posted GRN (subject to permission and dependency checks). If blocked, look for invoice links, knock-off links, or other dependent documents and clear those first with the relevant team.

### DISCARD

Use DISCARD for incorrect drafts that should not be posted. A discarded document is not a stock movement and is normally used for abandoned or mistyped drafts.

### Reset behavior

If the screen provides **RESET**, it should return the current form to the last saved state. Use this when you want to abandon unsaved edits without changing posting status.

---

## Audit Trail

The applet preserves operational traceability through document metadata and status events:
- Created By / Created Date
- Updated By / Updated Date
- Posting Status transitions
- Document references and linked records
- Line-level changes through save/final flows

Use this during supplier disputes, stock variance review, and internal audit.

The audit trail is also the place to verify who posted the GRN, who last changed it, and whether a posted document was later voided or discarded.

## Troubleshooting

| Problem | What it usually means | What to do |
|---------|-----------------------|------------|
| **Create is disabled** | Missing permission or wrong user role | Ask the administrator to confirm create access |
| **FINAL is blocked** | Required fields, quantities, or control data are incomplete | Recheck header, line quantity, serial/batch/bin input, and branch/location |
| **VOID is unavailable** | The row is not FINAL or a dependent document already exists | Confirm status first, then clear invoice/knock-off dependencies |
| **Serial/batch/bin counts do not match** | Item control data does not match line quantity | Return to the item-control tab and correct the mismatch |
| **Stock posted to wrong site** | Branch vs Delivery Branch was set incorrectly | Correct the document if still draft; otherwise reverse and recreate |
| **Invoice does not match GRN** | Receipt quantity differs from billing quantity | Finance should investigate the variance before payment |

---

## FAQ

**Q: What is the difference between Purchase GRN Stock In and Purchase GIN?**

A: **GRN Stock In** records goods coming **into** inventory from suppliers. **Purchase GIN** is used for goods moving **out** in relevant purchase-side issue scenarios (for example returns/issue flows). GRN increases stock, GIN typically reduces or reallocates stock depending on process.

---

**Q: When should I use DISCARD vs VOID?**

A: Use **DISCARD** for unposted drafts. Use **VOID** for already finalized documents that require reversal.

---

**Q: Why can VOID be disabled for my selected rows?**

A: VOID is generally available only when all selected rows are in **FINAL** status and have no blocking dependency conditions.

---

**Q: What if supplier delivered partially?**

A: Record the quantity actually received on the GRN now, finalize that receipt, and create another GRN when the remaining goods arrive. Do not post the expected quantity if the supplier delivered less than that.

---

**Q: Do I need serial or batch input for every item?**

A: Only for items configured with serial or batch control. Non-controlled items can be posted without those fields, but the line quantity still needs to match the physical count.

---

**Q: Can delivery branch be different from purchasing branch?**

A: Yes. Use Delivery Branch/Location to ensure stock posts to the physical receiving site. Example: Branch = HQ Purchasing, Delivery Branch = KL Warehouse, so the document stays owned by HQ but stock lands in KL.

---

**Q: Is GRN required before purchase invoice posting?**

A: In most controlled purchasing workflows, yes. GRN is the receipt evidence for three-way matching, and finance uses it to confirm that the invoice only bills what was actually received.

---

**Q: What does three-way matching actually mean for me?**

A: It means finance checks three documents together: the purchase order for what was ordered, the GRN for what actually arrived, and the purchase invoice for what the supplier wants paid. If the quantities or amounts do not match, the invoice should be held until the difference is resolved.

---

**Q: What should I do if VOID is blocked because of a linked document?**

A: Identify the linked document first. If an invoice or other dependent document already used the GRN, finance or purchasing usually has to reverse that linked document before the GRN can be voided. If the blocking document is another warehouse process, the warehouse lead should clear it first.

---

## Related Applets

- **[Internal Purchase Order Applet](/en/applets/purchase-workflow/internal-purchase-order-applet/)** - Upstream purchasing commitment that GRN fulfills.
- **[Supplier Delivery Order Applet](/en/applets/purchase-workflow/supplier-delivery-order-applet/)** - Supplier-side delivery context often referenced during receiving.
- **[Internal Purchase Invoice (No Stock In) Applet](/en/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/)** - Downstream billing and matching against receipt evidence.
- **[Internal Purchase Debit Note Applet](/en/applets/purchase-workflow/internal-purchase-debit-note-applet/)** - Adjustment path for supplier-side claim/financial correction scenarios.
- **[Internal Purchase Return Applet](/en/applets/purchase-workflow/internal-purchase-return-applet/)** - Return workflow when received goods are rejected or sent back.
- **[Purchase GIN (Internal) Applet](/en/applets/purchase-workflow/internal-purchase-gin-applet/)** - Purchase-side goods issue companion flow.
