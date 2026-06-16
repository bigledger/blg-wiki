---
title: "Purchase Order (Internal) Applet"
description: "Purchase Order (Internal) management for creating POs, approval workflows, supplier management, stock replenishment, and reporting"
tags:
- purchase-order
- procurement
- approval-workflow
- supplier-management
- stock-replenishment
weight: 170
date: 2026-04-06
lastmod: 2026-06-16
draft: false
---

## Purpose and Overview

The **Purchase Order (Internal) Applet** is where your organisation **commits to buy** from a supplier — items, quantities, prices, and terms — before goods are received or invoiced. Procurement creates and maintains POs; approvers sign off; warehouse and finance use approved POs for receipt and payment control.

{{< callout type="info" >}}
**Core concept:** A purchase order links **who** orders (purchaser / branch), **from whom** (supplier), **what** is ordered (line items), and **how** it is approved (workflow) so procurement and finance stay aligned.
{{< /callout >}}

### Where PO fits in procurement {#where-po-fits-in-procurement}

| Document | What it represents | Typical timing |
|----------|-------------------|----------------|
| **Purchase Requisition (PR)** | Internal request to buy (optional in some tenants) | Before PO |
| **Purchase Order (PO)** | Formal commitment to the supplier | Before goods arrive |
| **Supplier Delivery Order (SDO)** | Supplier shipment details (if your process uses it) | When goods ship |
| **GRN (Goods Received Note)** | Physical receipt and stock-in | After delivery |
| **Purchase Invoice** | Supplier bill for payment | After receipt (matched to PO and GRN) |

**Procurement flow**

```
Purchase Requisition (optional)
        ↓
Purchase Order (approved)     ← this applet
        ↓
Supplier Delivery Order       ← optional, if used
        ↓
GRN / Stock In                ← warehouse confirms receipt
        ↓
Purchase Invoice              ← finance three-way match
```

| Step | Who typically acts | Applet |
|------|---------------------|--------|
| Request to buy | Department / requester | Purchase Requisition (if required) |
| Place the order | Buyer / procurement | **Purchase Order (Internal)** |
| Record shipment | Logistics | [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) |
| Receive goods | Warehouse | [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) |
| Match and pay | Finance | Purchase Invoice (your tenant’s purchase invoice applet) |

{{< figure src="/images/internal-purchase-order-applet/internal-purchase-order-overview-infographic.png" alt="Purchase Order (Internal) Applet overview — procurement flow from request through approval" caption="Overview of how purchase orders, suppliers, line items, and approvals fit together in one applet." >}}

---

## Before you start {#before-you-start}

- Confirm the **supplier** exists in master data.
- Know your **branch**, **billing address**, and **shipping address** (or shipping entity).
- If your policy requires it, create a **Purchase Requisition** first and knock off lines into the PO.
- For foreign-currency purchases, confirm **document currency** and exchange-rate rules with finance.
- Verify create, edit, submit-for-approval, and approve permissions for your role.

---

## Glossary {#glossary}

| Term | Meaning in this guide |
|------|------------------------|
| **PO** | Purchase Order — commitment to buy from a supplier. |
| **PR** | Purchase Requisition — internal request that may convert to a PO. |
| **BPO / PQ** | Blanket Purchase Order / Purchase Quotation — sources for knock-off lines. |
| **Knock-off (KO)** | Pull open quantity or lines from another document into the PO or downstream GRN. |
| **Purchase Order Queue** | Open-queue view linking PO lines to downstream GRN/KO — not the approval workspace. |
| **Draft / Submitted / Approved** | PO lifecycle before and after approval workflow. |
| **Three-way matching** | Matching PO, GRN, and invoice before payment. |

---

## Key Features Overview

{{< cards >}}
  {{< card title="Procurement flow" subtitle="Where PO fits from PR to invoice" link="#where-po-fits-in-procurement" >}}
  {{< card title="Create a PO" subtitle="Supplier, lines, and approval" link="#for-procurement-create-your-first-purchase-order" >}}
  {{< card title="File Import" subtitle="Template, mandatory columns, sample" link="#file-import-and-export" >}}
  {{< card title="Foreign currency PO" subtitle="Document currency and rates" link="#foreign-currency-purchase-orders" >}}
  {{< card title="PO Replenishment" subtitle="Template, events, and runs" link="#po-replenishment" >}}
  {{< card title="Intercompany" subtitle="Cross-branch PO processing" link="#intercompany" >}}
  {{< card title="Approval Workflow" subtitle="Submit, approve, reject" link="#for-approvers-process-approval-requests" >}}
  {{< card title="Settings & Configuration" subtitle="Workflow, branches, permissions" link="#configuration--settings" >}}
{{< /cards >}}

### Who Benefits from This Applet?

**Procurement & Purchasing:**
- Create and edit purchase orders with supplier, billing/shipping address, and line items
- Add line items from BPO, PQ, PR, or existing PO where applicable
- Track POs through draft, submitted, and approved states
- Use **File Import** for bulk creation

**Approvers & Managers:**
- Process approval requests in **Approval Request**
- View approval history and monitor pending items
- Configure approval settings and conversion rules

**Finance & Operations:**
- Link POs to payments and contra documents
- Run **PO Line with GRN KO** and **Closed Queue KO** reports
- Process **Intercompany** queue items for cross-branch PO flows
- Export data for reconciliation

**Administrators:**
- Configure workflow, default selections, replenishment access, intercompany menus, and currency visibility
- Manage branch settings, email templates, and printable formats
- Set up permissions (permission wizard, permission set, user permission, role permission)

### What Problems Does This Solve?

Managing POs with spreadsheets and email leads to inconsistent formats, delayed approvals, and weak audit trails. This applet provides structured PO creation, approval workflow, supplier and line-item management, bulk import/export, stock replenishment support, and configurable field and menu visibility.

---

## Key Concepts

### Purchase Order Flow

| Aspect | Component | Practical Example |
|--------|-----------|-------------------|
| **Who** orders? | Purchaser / Requester | Procurement officer, Department manager |
| **From whom?** | Supplier & branch | Vendor, billing/shipping address |
| **What** is ordered? | Line items | Items from catalog, BPO/PQ/PR lines |
| **How** is it approved? | Approval workflow & queue | Manager → Finance → Approved |

{{< callout type="tip" >}}
**Example:** A procurement officer creates a PO for office supplies from Vendor ABC, adds five line items, and submits for approval. After approval, warehouse receives against the PO via GRN; finance matches PO, GRN, and invoice before payment.
{{< /callout >}}

### PO Statuses Explained

| Status | What It Means | What You Should Do |
|--------|---------------|---------------------|
| **Draft** | PO not yet submitted | Complete details; use **SAVE** to keep progress |
| **Submitted** | Waiting for approver | Wait for approval or rejection |
| **Approved** | Approver confirmed | Proceed to GRN or invoice per your process |
| **Rejected** | Approver declined | Read the reason, correct, and resubmit |
| **Closed** | PO fully processed | Reference or reporting only |

### Main sidebar views

- **Purchase Order** — Listing, create, and edit
- **Line Items** — Line-items workspace across POs
- **PO Line with GRN KO** — Report linking PO lines to GRN/KO
- **Closed Queue KO** — Closed queue reporting
- **PO Replenishment** — **Replenishment Runs**, **Replenishment Events**, **Replenishment Template**
- **File Import** / **File Export** — Bulk import and export
- **Intercompany** — Manual intercompany transaction queue (see [Intercompany](#intercompany))
- **Purchase Order Queue** — PO open-queue tracking for downstream GRN/KO
- **Multi-PO** — Work with multiple POs
- **Approval Request** / **Approval History** — Approve, reject, and audit decisions
- **Settings** — Configuration (see [Configuration & Settings](#configuration--settings))

### Video overview (optional deep dive)

Extended walkthrough: creating and editing POs, knock-off, GRN linkage, file import/export, intercompany, replenishment, reports, and personalization.

{{< youtube MpzkihO4NYQ >}}

---

## Quick Start Guide

### For Procurement: Create Your First Purchase Order {#for-procurement-create-your-first-purchase-order}

**Goal:** Create a purchase order with supplier, addresses, and line items.

{{< youtube n36EtVIclmE >}}

1. **Navigate**: Go to **Purchase Order** from the sidebar.
2. **Create header**: Click **+** (Create) → **Create Purchase Order**.
3. **Enter main details**:
   - Select **Purchaser** (if required).
   - Select **Supplier**.
   - Set **Billing Address** and **Shipping Address** (or shipping entity).
   - Set **Document currency** if your tenant uses foreign-currency POs.
4. **Add line items**:
   - Open the **Lines** tab → **+** (Create) → **Add Item**.
   - Enter **Item**, **Quantity**, **Price**, and other required fields → **ADD**.
   - Or use **Search Document**: **Blanket Purchase Order**, **Purchase Quotation**, **Purchase Requisition**, or **Purchase Order**.
5. **Optional**: **Payment**, **Contra**, **Attachments**.
6. **Review** header, supplier, lines, and currency.
7. **Submit**: **Submit Approval** → **Submit For Approval**.
8. **Save if not ready**: Use **SAVE** in edit mode to keep a draft.

**What happens next?** Approvers use **Approval Request**. After approval, warehouse receives via GRN; finance matches documents for payment.

---

### For Approvers: Process Approval Requests {#for-approvers-process-approval-requests}

**Goal:** Review and approve or reject purchase orders.

1. Go to **Approval Request** and open a pending request.
2. Review header, supplier, line items, amounts, currency, and attachments.
3. Click **Approve** or **Reject** (enter remarks if rejecting).
4. Use **Approval History** for past decisions.

---

### For Admins: Initial System Setup

**Goal:** Prepare the applet for your users.

1. **Branch setup** — `Settings > Branch Settings`, `Settings > Branch Designation`
2. **Workflow** — `Settings > Workflow Settings` (approval order and conditions)
3. **Default selection** — `Settings > Default Selection` (default branch, supplier, **default currency**)
4. **Application settings** — Required/visible fields; hide/show **File Import**, **Replenishment**, **Intercompany** menus; currency and forex options
5. **Printable format** — `Settings > Printable Format Settings`
6. **Email templates** — `Settings > Email Template`
7. **Approval controls** — `Settings > Approval Settings`, `Settings > Approval Monitor` (including PR→PO conversion)
8. **Permissions** — Permission wizard, permission set, user/role permission
9. **Test** — Create a PO, approve it, confirm GRN knock-off if applicable

---

## File Import and Export {#file-import-and-export}

Use **File Import** to create or update many POs from a CSV file. Use **File Export** for reporting and reconciliation.

### Download the import template

1. Open **File Import** from the sidebar.
2. Click **+** (Create) to open **Upload Master Data**.
3. Click **\*Sample Format for Purchase Order\*** — a column-picker dialog opens.
4. Select optional columns you need; **mandatory columns are fixed** and cannot be removed.
5. Download the header-only CSV: **`MasterData_Upload_InternalPurchaseOrderData.csv`**.

### Upload requirements

| Field | Requirement |
|-------|-------------|
| **File type** | **CSV** (`.csv`) only |
| **Delimiter** | Required — choose **PIPE**, **COMMA**, **SEMICOLON**, or **TAB** to match your file |
| **ADD** | Enabled only after a file is attached |

After upload, check **File Import** listing columns **Status**, **Process Status**, and **User Error Message** if rows fail.

### Mandatory columns (always required)

| Column | Meaning |
|--------|---------|
| `BRANCH_CODE` | Branch code for the PO |
| `TXN_DATE` | Transaction date |
| `HDR_REF_NO` | Header reference number |
| `DOC_CURRENCY` | Document currency code (e.g. `MYR`, `USD`) |
| `SETTLEMENT_OR_ITEM_CODE` | Item or settlement code |
| `QTY` | Line quantity |
| `ENTITY_CODE` | Supplier / entity code |

### Common optional columns

| Column | Meaning |
|--------|---------|
| `UOM` | Unit of measure |
| `UNIT_PRICE_INCL_TAX` / `AMOUNT_INCL_TAX` | Pricing |
| `TAX_GST_CODE` | Tax code |
| `BASE_DOC_X_RATE` | Exchange rate (foreign currency) |
| Billing/shipping address columns | As configured in your template export |
| `SEGMENT_CODE`, `GL_DIMENSION_CODE`, `PROFIT_CENTRE_CODE`, `PROJECT_CODE` | GL segments |
| Line remarks | Per-line notes |

### Example import rows

**Single-line PO (MYR):**

| BRANCH_CODE | TXN_DATE | HDR_REF_NO | DOC_CURRENCY | ENTITY_CODE | SETTLEMENT_OR_ITEM_CODE | QTY | UNIT_PRICE_INCL_TAX |
|-------------|----------|------------|--------------|-------------|-------------------------|-----|---------------------|
| HQ | 2026-06-01 | PO-IMP-001 | MYR | SUPP001 | ITEM-A4-PAPER | 100 | 25.00 |

**Foreign currency with exchange rate:**

| BRANCH_CODE | TXN_DATE | HDR_REF_NO | DOC_CURRENCY | ENTITY_CODE | SETTLEMENT_OR_ITEM_CODE | QTY | BASE_DOC_X_RATE |
|-------------|----------|------------|--------------|-------------|-------------------------|-----|-----------------|
| HQ | 2026-06-01 | PO-IMP-002 | USD | SUPP-US-01 | WIDGET-100 | 50 | 4.45 |

{{< callout type="warning" >}}
Use the same **delimiter** in the file as you select on the upload screen. Missing mandatory columns or invalid supplier/item codes usually appear in **User Error Message** on the import listing.
{{< /callout >}}

### File Export

Open **File Export**, apply filters (date range, supplier, branch), and download in the format your administrator configured.

---

## Foreign currency purchase orders {#foreign-currency-purchase-orders}

Many tenants create POs in a **document currency** different from the organisation **base currency** (for example USD PO with MYR base books).

### On the PO screen

- **Document currency** — Currency of the supplier quote or contract.
- **Base currency / exchange rate** — How the PO converts for reporting and finance (visibility depends on settings).
- Admins may lock rate editing or show a **forex data source** for the rate.

### Administrator settings (Application Settings / Default Selection)

| Setting | Effect |
|---------|--------|
| **Default Currency** | Default document currency for new POs |
| Hide currency / hide base currency | Hides currency fields on the PO form |
| Show forex data source | Shows where the exchange rate comes from |
| Cannot edit currency rate | Users cannot change the rate manually |

### File import

- `DOC_CURRENCY` is **mandatory** on every import row.
- `BASE_DOC_X_RATE` is **optional** — use when you need to set the document exchange rate on import.

Coordinate with finance on which currency and rate apply before you submit POs for approval.

---

## PO Replenishment {#po-replenishment}

**PO Replenishment** supports **stock-driven procurement** — suggesting or generating purchase activity when inventory falls below rules you define. It is separate from manually creating a single PO.

### How the pieces fit together

```
Replenishment Template  →  rules (items, suppliers, locations, categories)
        ↓
Replenishment Event     →  optional schedule (recurring cycle linked to a template)
        ↓
Replenishment Run       →  execution instance → review fulfillments / generated POs
```

| Menu | Purpose |
|------|---------|
| **Replenishment Template** | Reusable rules: template name, item/supplier/location/category filters, item list |
| **Replenishment Events** | Named schedules (event code, dates, recurring rule) linked to a template |
| **Replenishment Runs** | Run a replenishment calculation; review **Order Fulfillments** and **Purchase Orders** tabs on the run |

**Typical workflow:** Admin or inventory team maintains **Templates** → optional **Events** for schedules → user creates a **Run** → reviews output and linked POs.

### Configuration and access

| Control | Effect |
|---------|--------|
| Hide PO Replenishment menu (Application Settings) | Hides the whole **PO Replenishment** sidebar group |
| `SHOW_PURCHASE_ORDER_REPLENISHMENT_MENU` permission | Can show the menu when not hidden |

Ask your administrator to enable the menu and assign permissions before users run replenishment.

---

## Intercompany {#intercompany}

**Intercompany** handles **cross-branch purchase order flows** when branch intercompany rules create linked documents that need **manual confirmation**.

This is **not** the same as the **Intercompany sub-tab** on a PO’s **Account** tab (that tab can be hidden separately with **Hide Intercompany tab** in Application Settings).

### When to use it

Use the **Intercompany** sidebar menu when finance or operations must **confirm pending intercompany transactions** queued from approved POs — for example POs that trigger a target document in another branch per intercompany configuration.

### Screen workflow

**Intercompany Transaction Listing** has two tabs:

| Tab | Purpose |
|-----|---------|
| **UNPROCESSED** | Queue rows waiting for action — source PO, target doc type, config used, status |
| **PROCESSED** | Completed intercompany links for audit |

On **UNPROCESSED**, select a row and click **CONFIRM INTERCOMPANY TRANSACTION** to process the link. Review **PROCESSED** for source PO → target document history.

### Configuration and access

| Control | Effect |
|---------|--------|
| Hide Intercompany menu (Application Settings) | Hides sidebar **Intercompany** |
| `SHOW_INTERCOMPANY_MENU` permission | Can show the menu when not hidden |
| Hide Intercompany tab (Account sub-tabs) | Hides **Intercompany** on the PO **Account** tab only |

Branch intercompany rules themselves are configured outside this applet (branch intercompany settings in your platform). This applet is the **processing queue** for PO-related intercompany items.

---

## Reporting

- **PO Line with GRN KO** — PO lines linked to GRN and knock-off documents; compare ordered vs received.
- **Closed Queue KO** — Closed queue records for operational follow-up.

Filter by date, supplier, branch, or status as needed.

---

## Configuration & Settings {#configuration--settings}

Access **Settings** from the sidebar. Configure to match procurement, approval, and multi-branch policies.

{{< youtube 5ri6Qjio32Q >}}

| Setting | Purpose |
|--------|---------|
| **Default Selection** | Default branch, supplier, currency, and other values for new POs |
| **Application Settings** | Required/visible PO and line fields; hide/show sidebar menus (File Import, Replenishment, Intercompany); currency and forex visibility |
| **Printable Format Settings** | Printed/PDF PO layout |
| **Workflow Settings** | Approval steps and conditions |
| **Email Template** | Approval, rejection, and other notifications |
| **Branch Settings** / **Branch Designation** | Branches and designation mappings |
| **Approval Settings** / **Approval Monitor** | Approval rules and PR→PO conversion requirements |
| **Permission Wizard**, **Permission Set**, **User Permission**, **Role Permission** | Access control |
| **Release Notes** / **Audit Trail** | Updates and audit log |

---

## Permissions

Server-side targets control read/create/update on PO documents. Client-side permissions (with Application Settings hide flags) control menu visibility — for example **File Import**, **Replenishment**, **Intercompany**, **Approval Request**.

If a user cannot see a menu, review **both** role permissions and Application Settings hide/show toggles.

Common server-side keys: read, create, and update targets for internal purchase order; tenant admin/owner overrides apply.

---

## FAQ

**Q: When do I use a PO vs a GRN?**  
A: **PO** = you are **ordering** from a supplier (commitment to buy). **GRN** = goods **arrived** and you are **receiving into stock**. Create and approve the PO first; warehouse creates GRN when goods arrive. See [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/).

**Q: Where do I download the file import template?**  
A: **File Import** → **+** Create → **Upload Master Data** → **\*Sample Format for Purchase Order\***. Mandatory columns are fixed in the export dialog.

**Q: Which import columns are mandatory?**  
A: `BRANCH_CODE`, `TXN_DATE`, `HDR_REF_NO`, `DOC_CURRENCY`, `SETTLEMENT_OR_ITEM_CODE`, `QTY`, `ENTITY_CODE`.

**Q: Can I create a PO in USD (or other foreign currency)?**  
A: Yes, if your tenant enables currency fields. Set **document currency** on the PO (or `DOC_CURRENCY` on import). Admins control defaults, visibility, and whether users can edit exchange rates.

**Q: What is Intercompany used for?**  
A: Processing **cross-branch PO intercompany queue** items — confirm transactions on the **UNPROCESSED** tab. It is not a substitute for normal PO creation.

**Q: How does PO Replenishment relate to creating a PO manually?**  
A: Replenishment uses **templates and runs** to suggest or generate POs from stock rules. Manual PO creation in **Purchase Order** is for ad-hoc or non-replenishment orders.

**Q: Why can’t I see File Import, Replenishment, or Intercompany?**  
A: Menus may be hidden in Application Settings or missing from your role permissions. Ask your administrator.

**Q: I see "Purchase Order needs to be converted from Purchase Requisition" — what do I do?**  
A: Your tenant requires PR→PO conversion. Add lines via **Search Purchase Requisition**, or ask an admin to adjust **Approval Monitor** (uncheck **Is Document Conversion Required** on the PR→PO rule) if policy allows direct POs.

**Q: Where do I approve POs?**  
A: **Approval Request** — not **Purchase Order Queue** (queue is for GRN/KO linkage tracking).

**Q: Can I export POs for the whole year?**  
A: Yes — **File Export** with a full-year date range and your usual filters.

**Q: How do I disable "document conversion required" for PR→PO?**  
A: **Settings** → **Approval Monitor** → edit rule **From** `INTERNAL_PURCHASE_REQUISITION` **To** `INTERNAL_PURCHASE_ORDER` → uncheck **Is Document Conversion Required** → save. See detailed steps in your tenant’s admin runbook if the edit screen differs.

---
