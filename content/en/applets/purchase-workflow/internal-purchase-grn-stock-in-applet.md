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
lastmod: 2026-06-15
draft: false
---

## Purpose and Overview

The **Purchase GRN Stock In (Internal) Applet** is where your team records the **physical receipt of goods** and posts those goods into stock. It is the control point between what purchasing expected, what the warehouse actually received, and what finance later matches for payment.

{{< callout type="info" >}}
**Core Concept**: This applet links **what was ordered** (purchase flow), **what arrived** (GRN line items, serial/batch/bin detail), and **what gets posted** (stock increase, branch/location allocation, and downstream invoice matching).
{{< /callout >}}

A GRN (Goods Received Note) is not just a receipt log. It is the operational document used by warehouse staff to confirm quantity, delivery site, item controls, and posting status before downstream billing and three-way matching.
![Internal Purchase GRN Stock In Overview](/images/internal-purchase-grn-stock-in-applet/internal-purchase-grn-stock-in.png)

## Before You Start

- Confirm the related purchase transaction exists or that you have the supplier delivery reference that will be used on the GRN. If receiving from a PO, confirm the PO is **FINAL** and still has **open receive quantity** before you start.
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

### The Knock-Off (KO) Workflow

Instead of typing every received item manually, the warehouse can use the **KO For** tab to pull expected lines from a **Purchase Order**, **Purchase Requisition**, or **Supplier Delivery Order**.

A source PO appears in the list only when **all** of these are true:

- The PO is **FINAL** (draft POs do not appear).
- The PO still has **open receive quantity** (not fully received on earlier GRNs).
- The GRN **supplier**, **branch**, and **location** are set and **match** the PO (supplier and branch must align).
- Your user account has permission to read that PO's branch.

This links the GRN to the upstream document, auto-fills line items, and lets you reduce quantities for partial deliveries.

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

### Warehouse Receiver: Create GRN

There are two ways to create a GRN depending on your workflow:

**Path A: Manual Entry (No Upstream Reference)**
Use this when you are receiving goods without a linked Purchase Order in the system.

![Path A: Manual Entry](/images/internal-purchase-grn-stock-in-applet/path-a.png)

1. **Open Listing**: Go to **Internal Purchase GRN Stock In** from the sidebar.
2. **Create New GRN**: Click **Create** to open a new draft document.
3. **Fill Main Details**: On the **Main Details** tab, choose the company and branch that own the document, set the transaction date, and fill the supplier reference or delivery note number.
4. **Confirm delivery site**: Set **Delivery Branch** and **Delivery Location** so stock posts correctly.
5. **Add lines manually**: Go to the Line Items workspace and use the Search Item tab to add each received item and its actual quantity.

**Path B: Knock-Off from Purchase Order (Auto-fill)**
Use this when you have a PO number and want to auto-fill the receipt lines.

![Path B: Knock-Off from Purchase Order](/images/internal-purchase-grn-stock-in-applet/path-b.png)

1. **Open Listing**: Go to **Internal Purchase GRN Stock In** from the sidebar.
2. **Create New GRN**: Click **Create** to open a new draft document.
3. **Fill header details**: On **Main Details**, set **Company**, **Branch**, **Location**, **Delivery Branch**, and **Delivery Location**.
4. **Select supplier**: On the **Account** tab, select the **same supplier** as on the PO you want to receive against. Knock-off is disabled until supplier, branch, and location are set.
5. **Use KO tab**: Open the **KO For** tab → **Purchase Order** sub-tab (or DO/Requisition, depending on your process).
6. **Select and knock-off**: Search for the PO number (at least 3 characters), select the lines, and click **KNOCK OFF**.
7. **Adjust quantities**: Review imported lines and reduce quantity if the supplier delivered a partial amount.

{{< callout type="warning" >}}
**PO not showing in KO For?** The PO must be **FINAL** in the [Purchase Order applet](/applets/purchase-workflow/internal-purchase-order-applet/) and still have **open quantity** to receive. If the PO was fully received on another GRN, it will not appear. Also confirm the GRN **supplier** and **branch** match the PO.
{{< /callout >}}

**Next Steps for Both Paths:**
8. **Complete item controls**: If items are controlled, fill the serial numbers, batch number, or bin numbers before saving.
9. **Check totals**: Review the line total, item count, and control count.
10. **Finalize**: Click **FINAL** only after everything is correct. Posting will add the stock into the chosen receiving location.

### Purchasing / Finance: After FINAL

1. **Find the GRN**: Go to the listing and filter by **FINAL** status, supplier name, or date.
2. **Verify Receipt**: Open the document to confirm what the warehouse actually received against what was ordered.
3. **Invoice Matching**: Use the finalized GRN as the receipt evidence when posting the Purchase Invoice.

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

You can filter this workspace by Item Code, Date Range, Supplier, or Status.

**Common Use Case:** 
Use the Line Items workspace when a finance user asks "did we receive item FG-1001 in March?" — simply filter by the item code and date range to get the answer instantly, without having to open and check dozens of individual GRN headers.

{{< figure src="/images/internal-purchase-grn-stock-in-applet/line-item-workspace-purgrn-stock-in.png" alt="Line Items workspace showing cross-document GRN line visibility and filters" caption="Line Items Workspace: Filter and review receipt lines across GRN documents by item, date, supplier, or status." >}}

### Item Details tab

Use **Item Details** for the basic receipt line. This is where you verify the item, the quantity received, and the main receipt data before control tabs are filled. If the quantity is wrong here, the rest of the document will be wrong too.

Key fields include:
- **Item Code / Name**: The specific product being received.
- **UOM (Unit of Measure)**: How the item is packed or counted (e.g., BOX, PCS).
- **Quantity Base**: The actual physical count received by the warehouse. Adjust this if it differs from the ordered amount.
- **Unit Price**: The cost per unit, which defaults from the knocked-off document or item master.

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

---

## Finalize / Save / Reset

### SAVE

Use SAVE during receiving to keep the document in DRAFT while validation is in progress. This is the right action when the goods are counted but the supervisor has not yet approved final posting.

### FINAL

Use FINAL when quantity, location, and item controls are correct. FINAL:

- Posts stock into the selected delivery location.
- Locks the document for normal edits.
- Starts the official inventory/audit record for that receipt.

**What happens next?** 
After FINAL, the GRN is visible in the listing with status FINAL. Purchasing and finance can search for it by supplier or date and use it for invoice matching — no separate notification is sent unless your administrator has configured a workflow trigger.

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
| **FINAL is blocked** | Required fields, quantities, or control data are incomplete | Check in this order: (1) Is Branch and Delivery Branch set? (2) Is there at least one line with a quantity greater than zero? (3) For controlled items, does serial/batch/bin count match line quantity? Fix the first failure found and try again. |
| **VOID is unavailable** | The row is not FINAL or a dependent document already exists | Confirm status first, then clear invoice/knock-off dependencies |
| **Serial/batch/bin counts do not match** | Item control data does not match line quantity | Return to the item-control tab and correct the mismatch |
| **Stock posted to wrong site** | Branch vs Delivery Branch was set incorrectly | Correct the document if still draft; otherwise reverse and recreate |
| **Invoice does not match GRN** | Receipt quantity differs from billing quantity | Finance should investigate the variance before payment |
| **PO not found in KO For (search returns nothing)** | PO not eligible for knock-off, or GRN header does not match | Check in order: (1) PO is **FINAL** and **ACTIVE**, (2) PO has **open receive qty** (not fully received), (3) GRN **supplier** matches PO supplier, (4) GRN **branch** matches PO branch, (5) you have branch read permission. If all pass, ask your administrator to confirm KO flow is enabled for PO → GRN Stock In. |

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

**Q: What is the minimum I must complete before CREATE is enabled?**

A: You must select at least a **Company** and **Branch**. For knock-off from a PO, you also need **Location** and **Supplier** set before the KO For tab will work.

---

**Q: Can I receive against a Purchase Order automatically, or do I have to type everything manually?**

A: Yes — use the **KO For** → **Purchase Order** tab. First set **Company**, **Branch**, **Location**, and **Supplier** on the GRN so they match the PO. The PO must be **FINAL** and have **remaining open quantity**. Then search, select lines, and knock off. Adjust quantities down for partial deliveries.

---

**Q: Why can't I see my PO in KO For Purchase Order?**

A: The list only shows POs that are **FINAL**, still have **open receive quantity**, and match the GRN **supplier** and **branch**. A PO that is still in draft, already fully received, or on a different supplier/branch will not appear — even if you search by PO number. Check the PO in the [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/) first.

---

## Related Applets

- **[Internal Purchase Order Applet](/en/applets/purchase-workflow/internal-purchase-order-applet/)** - Upstream purchasing commitment that GRN fulfills.
- **[Supplier Delivery Order Applet](/en/applets/purchase-workflow/supplier-delivery-order-applet/)** - Supplier-side delivery context often referenced during receiving.
- **[Internal Purchase Invoice (No Stock In) Applet](/en/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/)** - Downstream billing and matching against receipt evidence.
- **[Internal Purchase Debit Note Applet](/en/applets/purchase-workflow/internal-purchase-debit-note-applet/)** - Adjustment path for supplier-side claim/financial correction scenarios.
- **[Internal Purchase Return Applet](/en/applets/purchase-workflow/internal-purchase-return-applet/)** - Return workflow when received goods are rejected or sent back.
- **[Purchase GIN (Internal) Applet](/en/applets/purchase-workflow/internal-purchase-gin-applet/)** - Purchase-side goods issue companion flow.

---

## System Configuration & Personalization

Administrators configure the applet under **Settings** in the left-hand menu. End users can adjust personal defaults under **Personalization**.

### Settings (Administrators)

| Setting | What it changes | Who should manage it |
|---------|-----------------|----------------------|
| **Application / Field Settings** | Tab visibility (KO For, Delivery Details, Attachments, etc.), field show/hide/require, vertical UI layout, and action buttons (FINAL, VOID, SAVE) | Administrator / applet owner |
| **Default Selection** | Company-wide defaults pre-filled on new GRNs (company, branch, location) | Administrator or power user |
| **Printable Format Settings** | GRN print layout and PDF/report format | Administrator / reporting owner |
| **Branch Settings** | Branch-specific receiving behavior and defaults | Administrator / operations lead |
| **Custom Status** | Extra workflow statuses for receiving stages (header and line level) | Administrator / process owner |

**Common field settings for this applet:**

| Toggle | What it does |
|--------|----------------|
| **Hide KO For Tab** (`HIDE_KO_FOR_TAB`) | Hides the entire **KO For** tab — use when all receipts are manual entry |
| **Enable Multiple KO** (`ENABLE_MULTIPLE_KO`) | Allows selecting multiple PO/DO lines in one knock-off action |
| **Hide Delivery Branch / Delivery Location** | Simplifies the screen when delivery site always matches branch |
| **Vertical UI** (`VERTICAL_ORIENTATION`) | Switches from horizontal tabs to a scrolling vertical layout |

To customize the screen:

1. Go to **Settings > Application Settings** (Field Settings).
2. Use **Feature Visibility** toggles to hide unused tabs or fields.
3. Save so your team sees a cleaner receiving workflow.

### Personalization

Under **Personalization > Default Selection**, individual users can set their own default **branch** and **location** so new GRNs open with the correct receiving site pre-filled. This speeds up repeated dock work without changing company-wide defaults.
