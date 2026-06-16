---
title: "Supplier Delivery Order Applet"
description: "Record supplier shipments and delivery details between purchase ordering and goods receipt in BigLedger."
tags:
  - purchase-workflow
  - supplier-delivery-order
  - procurement
  - logistics
  - delivery-management
weight: 265
date: 2026-04-06
lastmod: 2026-06-16
draft: false
---

## Purpose and Overview {#purpose-and-overview}

The **Supplier Delivery Order Applet** is where your organisation records a **supplier delivery order (SDO)** — what a supplier is shipping, to whom, and in what quantity — before or while goods are in transit. It gives procurement and logistics a structured hand-off to warehouse receiving.

{{< callout type="info" >}}
**Core concept:** A supplier delivery order sits **between ordering and receiving**. You use the **Purchase Order** to commit to a buy, this applet to capture **shipment / delivery details**, and the **GRN (Goods Received Note)** to confirm what physically arrived and post stock.
{{< /callout >}}

### Where this fits in procurement

| Document | What it represents | Typical timing |
|----------|-------------------|----------------|
| **Purchase Order (PO)** | What you ordered (items, qty, price, terms) | Before goods arrive |
| **Supplier Delivery Order (SDO)** | What the supplier is delivering / shipping | When goods are shipped or about to arrive |
| **GRN (Goods Received Note)** | What you physically received into stock | After delivery at the warehouse |
| **Purchase Invoice** | What you pay the supplier | After receipt (matched to PO and GRN) |

**Internal Delivery Order** is a **different document type** used for internal outbound delivery flows. It is not the same as a **supplier delivery order**, even though some shared screens in BigLedger reuse similar layouts.

### Procurement flow

```
Purchase Order (FINAL)
        ↓
Supplier Delivery Order   ← this applet
        ↓
GRN / Stock In            ← warehouse confirms receipt
        ↓
Purchase Invoice          ← finance three-way match
```

| Step | Who typically acts | Applet |
|------|---------------------|--------|
| Place the order | Buyer / procurement | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) |
| Record shipment details | Buyer / logistics | **Supplier Delivery Order** |
| Receive goods | Warehouse | [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) |
| Match and pay | Finance | Purchase Invoice (your tenant’s purchase invoice applet) |

### Who uses this applet?

**Procurement and buyers** — Create SDOs and link the correct supplier and header details.

**Warehouse and logistics** — Review expected delivery lines before or during receipt.

**Administrators** — Configure **Application Settings**, defaults, printable formats, feature visibility, and permissions.

**Driver coordinators** — Manage **Driver Listing** (supplier-linked driver login accounts) when that menu is enabled.

---

## Before you start {#before-you-start}

- Confirm the **supplier** exists in master data ([Supplier Applet](/applets/master-data/supplier-applet-1/)).
- Know your **Company**, **Branch**, and **Location** for the delivery context.
- If your process ties SDOs to a PO, confirm the PO is **FINAL** and open quantities still apply (follow your tenant’s knock-off rules).
- Prepare shipment evidence: supplier reference, expected delivery date, and line quantities.
- Confirm you have create, update, and (if required) delete permission on this applet.

---

## Glossary {#glossary}

| Term | Meaning in this guide |
|------|------------------------|
| **SDO** | Supplier Delivery Order — shipment / delivery record for incoming supplier goods. |
| **PO** | Purchase Order — your commitment to buy from a supplier. |
| **GRN** | Goods Received Note — warehouse receipt and stock-in document. |
| **Entity Id** | Supplier account on the **Account** tab (opens **Select Supplier**). |
| **DRAFT** | Editable document state before posting is complete. |
| **FINAL** | Posted state; structural changes are restricted. |
| **VOID** | Cancelled posted document (when your process allows void). |
| **DISCARDED** | Abandoned draft that was not posted. |

---

## Document statuses {#document-statuses}

| Status | Meaning | Can you edit? | Typical next step |
|--------|---------|---------------|-------------------|
| **DRAFT** | Document is being prepared | Yes — header, supplier, and lines (on edit) | Add lines, then **SAVE** |
| **FINAL** | Document is posted / confirmed | No — add line, change supplier, and **DELETE** are blocked | Warehouse receives against it; create **GRN** per your process |
| **VOID** | Posted document was cancelled | No | Create a replacement SDO if needed; check downstream knock-offs |
| **DISCARDED** | Draft was abandoned | No | Start a new SDO from **+** Create |

**Actions on the edit screen**

- **SAVE** — Saves changes while the document is still editable. Hidden if your administrator enabled **Hide generic save button** in Application Settings.
- **DELETE** — Removes a draft document (double-click to confirm). Hidden when posting status is **FINAL**.
- **FINAL**, **VOID**, and **DISCARD** may exist in your tenant’s workflow but are not shown on the standard edit header in the current applet build. If your process requires posting or void from the listing, ask your administrator which controls are enabled for your role.

**Who can perform actions?** Create, save, delete, and posting actions depend on **permission sets** and **feature visibility**. Your administrator assigns these.

---

## Key Features Overview {#key-features-overview}

{{< cards >}}
{{< card title="Quick Start" subtitle="Create, add lines, save" link="#quick-start-guide" >}}
{{< card title="Procurement flow" subtitle="PO → SDO → GRN" link="#where-this-fits-in-procurement" >}}
{{< card title="User interface" subtitle="Listing, create, edit" link="#user-interface" >}}
{{< card title="Configuration & Settings" subtitle="Defaults, formats, access" link="#configuration--settings" >}}
{{< card title="Integration" subtitle="Related purchase documents" link="#integration" >}}
{{< card title="FAQ" subtitle="Common questions" link="#faq" >}}
{{< card title="Troubleshooting" subtitle="Quick fixes" link="#troubleshooting" >}}
{{< /cards >}}

{{< figure src="/images/supplier-delivery-order-applet/supplier-delivery-order-applet-overview-infographic.png" alt="Supplier Delivery Order Applet overview: from fragmented delivery communication to structured supplier delivery orders in BigLedger" caption="Supplier Delivery Order Applet: structured delivery orders between purchase ordering and warehouse receipt." >}}

---

## Quick Start Guide {#quick-start-guide}

### For procurement: create a supplier delivery order

**Goal:** Start a new SDO from the listing.

1. Click **Supplier Delivery Order** in the sidebar (opens **Supplier Delivery Order Listing**).
2. Click **+** (tooltip **Create**).
3. On **Main Details**, complete **Company**, **Branch**, and **Location** (all required).
4. Open **Account** → **Entity Details** and select the supplier (**Entity Id** opens **Select Supplier**).
5. Click **CREATE**. A success message confirms the delivery order was created.
6. Open the new row from the listing as **Edit Supplier Delivery Order**, go to **Lines**, add items, then click **SAVE**.

{{< callout type="tip" >}}
**Lines are added on edit, not on create.** The create screen only shows **Main Details** and **Account**. After **CREATE**, always reopen the document to add line items.
{{< /callout >}}

---

### For logistics: edit lines and delivery context

**Goal:** Update an existing supplier delivery order.

1. On **Supplier Delivery Order Listing**, click the row to open **Edit Supplier Delivery Order**.
2. Review **Main Details** and **Account** (supplier, **Bill To**, **Ship To** as your process requires).
3. Open **Lines** → **Add Line Item** (opens **Select Item**). Add or edit lines as allowed by posting status.
4. Click **SAVE**. At least one line is required before save is enabled.
5. Use **DELETE** at the bottom only on drafts when policy allows (double-click to confirm).

---

### For driver coordinators: Driver Listing

**Goal:** Manage supplier-linked driver login accounts (not delivery order documents).

1. Click **Driver Listing** in the sidebar.
2. Use **+** (tooltip **Create**) to open **Driver Login Create**.
3. Select **Supplier**, enter the driver’s **email or phone**, and complete verification steps your administrator configured.

---

### For administrators: first-time orientation

1. Open **Settings** from the sidebar.
2. Walk through **Application Settings**, **Default Selection**, **Printable Format Settings**, **Custom Status**, and **Email Template** as needed.
3. Configure **Feature visibility** and permissions. See [Configuration & Settings](#configuration--settings).

---

## User interface {#user-interface}

### Sidebar (typical)

- **Supplier Delivery Order** — listing and documents.
- **Driver Listing** — driver login accounts linked to suppliers.
- **Settings** — company configuration (when permitted).
- **Personalization** — personal defaults (when enabled).

### Supplier Delivery Order Listing

{{< figure src="/images/supplier-delivery-order-applet/main-listing-page.png" alt="Supplier Delivery Order Listing grid with Create control, search, and column tools" caption="Supplier Delivery Order Listing: use Create (+), search, and the grid to open or start supplier delivery orders." >}}

- Screen title: **Supplier Delivery Order Listing**.
- Toolbar: **+** (tooltip **Create**), advanced search, column tools.
- Click a row to open **Edit Supplier Delivery Order**.

### Create (new document)

- Tabs: **Main Details**, **Account** only.
- **Account** sub-tabs: **Entity Details**, **Bill To**, **Ship To**.
- Actions: **RESET**, **CREATE**.

**Required fields to enable CREATE**

| Tab | Required fields |
|-----|-----------------|
| Main Details | Company, Branch, Location |
| Account → Entity Details | Entity Id (supplier via **Select Supplier**) |

### Edit Supplier Delivery Order (existing document)

- Tabs: **Main Details**, **Account**, **Lines**.
- Actions: **SAVE**; **DELETE** on drafts when permitted.
- Invalid tabs show in **red** until validation passes.

**Required fields to enable SAVE**

| Requirement | Details |
|-------------|---------|
| Main Details | Company, Branch, Location |
| Account | Supplier (**Entity Id**) selected |
| Lines | At least **one line item** |

After **FINAL**, you cannot add lines, change the supplier, or delete the document. Line edit and delete controls are also restricted.

---

## Configuration & Settings {#configuration--settings}

Most permission work belongs with **IT or tenant administrators**.

### Under Settings

| Menu label | Purpose |
|------------|---------|
| **Application Settings** | Required, hidden, and visible fields; flags such as hide save button or disable add line when knocked off. |
| **Default Selection** | Company-wide defaults (branch, location, layout). |
| **Printable Format Settings** | Print and PDF templates. |
| **Custom Status** | Custom status values for the document lifecycle. |
| **Email Template** | Outbound email layouts. |

Also available: **Webhook**, **Feature visibility**, and standard BigLedger permission screens.

### Under Personalization

| Menu label | Purpose |
|------------|---------|
| **Default Selection** | Personal branch/location defaults. |
| **Sidebar** | Reorder menu entries when enabled. |

---

## Integration {#integration}

**Supplier master data** — SDOs resolve to supplier entities from the [Supplier Applet](/applets/master-data/supplier-applet-1/).

**Branches and locations** — Captured on **Main Details** for organisational and delivery context.

**Line knock-off (when enabled)** — Depending on company document flow settings, line items may support knock-off from other document types (for example internal sales orders or invoices). Purchase Order and GRN knock-off tabs are not exposed on the standard line-add screen in this applet. Follow your administrator’s configured flow.

**What happens after you save an SDO?**

1. Warehouse or receiving uses the SDO as expected delivery reference.
2. Goods are received in [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) per your process.
3. Finance matches PO, GRN, and purchase invoice for payment.

**Related guides**

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/)
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/)
- [Internal Purchase Order Supplier Access](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/)
- [Supplier Applet](/applets/master-data/supplier-applet-1/)

---

## FAQ {#faq}

### Where are Lines when I create a document?

**Lines** appears only on **Edit Supplier Delivery Order**, not on the create screen. After **CREATE**, reopen the document from the listing, add lines, then **SAVE**.

### CREATE is disabled — what should I check?

Complete **Company**, **Branch**, **Location**, and **Entity Id** (supplier). Red tabs indicate missing required fields.

### SAVE is disabled on edit — what should I check?

Confirm header and supplier fields are valid and you have **at least one line item**. If currencies differ, ensure the forex rate is valid.

### Can I create duplicate supplier delivery orders?

The applet has no built-in **duplicate document** action. Your team may create multiple SDOs for separate shipments; follow internal policy so references stay traceable.

### Can I edit a finalized (FINAL) document?

No for practical purposes. **FINAL** locks supplier selection, blocks adding or deleting lines, and hides **DELETE**. To correct a posted SDO, follow your void-and-recreate policy or ask your administrator.

### What happens after VOID?

The document posting status becomes **VOID**. If the SDO was knocked off to another document, void may be blocked until knock-off links are resolved. Create a new SDO if the shipment still applies.

### Are lines editable after FINAL?

Adding, deleting, and most line changes are blocked when posting status is **FINAL**, **VOID**, or **DISCARDED**.

### I cannot see Driver Listing

**Driver Listing** is controlled by **feature visibility** and your role. Ask your administrator to enable the menu entry.

### The + (Create) control is disabled

You need create permission. Ask your administrator to check permission sets and **feature visibility** for **Supplier Delivery Order**.

### I expected FINAL or VOID on the edit screen but only see SAVE

In the current applet build, posting buttons on the edit header are not shown by default. Use **SAVE** for day-to-day edits. Ask your administrator if listing-level or workflow posting actions are enabled for your tenant.

### Who configures webhooks, email templates, and permissions?

Use **Settings**, or delegate to **IT / tenant administrators**.

---

## Troubleshooting {#troubleshooting}

| Symptom | What to try |
|---------|-------------|
| Listing is empty | Widen search filters; confirm read access and supplier scope. |
| Cannot create | Confirm **+** is enabled; check create permission and required header/supplier fields. |
| Cannot save on edit | Fix red tabs; add at least one line; check forex rate if applicable. |
| Cannot add lines | Confirm posting status is not **FINAL** / **VOID** / **DISCARDED**; check knock-off settings. |
| Driver Listing missing | Ask admin to enable sidebar entry and role access. |
| Wrong branch or location on new documents | Adjust **Default Selection** (company or personal). |

Still stuck? Capture the **document reference**, **screen name**, and **time**, then contact your **BigLedger administrator**.

---

## Related Documentation Links

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/)
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/)
- [Internal Purchase Order Supplier Access](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/)
- [Supplier Applet](/applets/master-data/supplier-applet-1/)
