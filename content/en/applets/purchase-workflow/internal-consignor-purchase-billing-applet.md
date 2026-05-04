---
title: "Internal Consignor Purchase Billing Applet"
description: "User guide for consignor-side purchase billing: listing, create and edit with Main Details, Account, line items, payments, export, settings, and related consignment applets."
tags:
  - purchase-workflow
  - consignment
  - purchase-billing
  - consignor
  - accounts-payable
weight: 62
draft: false
---

{{< callout type="info" >}}
Visual step-by-step screenshots are not included in this first version; they may be added later. All labels and screen names below match the applet **Consignor Purchase Billing Applet** (menu: **Internal Consignor Purchase Billing**).
{{< /callout >}}

## Purpose and overview {#purpose-and-overview}

In consignment operations, different documents cover **goods movement**, **stock at the consignee**, and **billing**. This applet is for **purchase billing on the consignor side**—creating and maintaining billing headers that tie **company, branch, location, consignor (supplier) context**, **dates**, **status**, **line items**, and **payments** in one place. It is **not** the same as [Consignment Billing (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/), which bills the **customer** for consignment consumption (sales-side revenue). It is also **not** a [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) document; purchase orders are a separate procurement cycle.

{{< callout type="info" >}}
**Naming**: In everyday language, “PO” means **purchase order**. This applet is **purchase billing** for the consignor. The **Account** tab uses a shared component also used in purchase-order flows; in this applet you still work in the context of **consignor purchase billing**, not a PO document type.
{{< /callout >}}

### Where this applet fits (high level)

| Area | Typical role | Related guides |
|------|----------------|----------------|
| Goods in / consignment receipts | Inventory and receiving | [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/) |
| Stock at consignee | Tracking and returns | [Customer Consignment](/applets/sales-workflow/customer-consignment-applet/) |
| **Billing you owe / record for consignor purchase** | Procurement and AP-style control | **This applet** |
| Invoicing the consignee for stock used | Sales billing | [Consignment Billing (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/) |
| Standard purchase orders | Procurement | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) |

Exact business rules (posting, integration with GRN or invoices) depend on your tenant configuration and training from your administrator.

---

## Key features overview {#key-features-overview}

### Who benefits

| Role | Typical use |
|------|-------------|
| Procurement / buying | Create and edit consignor purchase billing records, choose purchaser agent, consignor (supplier) account, and lines |
| Finance / AP | Review dates, status, references, and payment lines where your process uses them |
| Administrators | Configure field settings, defaults, printable formats, webhooks, feature visibility, and permissions |

### Problems this addresses

- **Scattered consignor billing data** — One listing and document workflow instead of ad hoc spreadsheets
- **Master data at point of use** — From **Account**, users can open consignor/supplier maintenance flows (addresses, tax, contacts, branches, categories, item pricing, companies, and related screens) when your permissions allow
- **Structured lines and payments** — **Line Item** and **Payment** tabs separate operational detail from the header

---

## Feature navigation {#feature-navigation}

{{< cards >}}
{{< card title="Listing and search" subtitle="Grid, advanced search, create" link="#listing-and-search" >}}
{{< card title="Create document" subtitle="Main Details, Account, Line Item, Payment, CREATE" link="#create-consignor-purchase-billing" >}}
{{< card title="Edit document" subtitle="Tabs, SAVE, RESET, Export" link="#edit-consignor-purchase-billing" >}}
{{< card title="Account and consignor" subtitle="Select consignor and supplier-related maintenance" link="#account-tab-and-consignor-selection" >}}
{{< card title="Configuration" subtitle="Settings and personalization" link="#configuration-and-settings" >}}
{{< card title="Permissions" subtitle="Who can change what" link="#permissions" >}}
{{< card title="FAQ" subtitle="Compare with sales consignment billing" link="#frequently-asked-questions" >}}
{{< /cards >}}

---

## Key concepts {#key-concepts}

| Term | Meaning in this applet |
|------|------------------------|
| **Consignor** | The party on the consignor side of the arrangement; on **Account** you select the consignor (supplier entity) for this billing record |
| **Consignee** | Often the location or customer holding stock; master flows may reference consignee context depending on your setup |
| **Purchase billing (here)** | The document type managed in this applet (`Consignor Purchase Billing` screens), not a purchase order |
| **Listing columns** | **Company Name**, **Branch**, **Consignor**, **Consignor Name**, **Start Date**, **End Date**, **Status** |

---

## Quick start {#quick-start}

1. Open **Internal Consignor Purchase Billing** from the applet menu (window title **Consignor Purchase Billing Applet**).
2. On **Consignor Purchase Billing Listing**, use **Create** (**+**) to start a new document, or open an existing row to edit.
3. On **Create Consignor Purchase Billing**, complete **Main Details**, then **Account** (select consignor / supplier context), then **Line Item** and **Payment** as required by your process.
4. Choose **CREATE** to commit the new document when enabled.
5. On **Edit Consignor Purchase Billing**, use **SAVE** to persist changes and **RESET** when shown; use the **Export** tab when you need export actions on an existing record.

Open **Settings** or **Personalization** from the shell when your deployment exposes them for this applet.

---

## Listing and search {#listing-and-search}

The default view title is **Consignor Purchase Billing Listing**.

- **Create** — Toolbar **Create** (**+**) starts a new document when not disabled by rules or permissions.
- **Advanced search** — The listing uses the shared advanced purchase search control (same family as internal purchase search models in code); use it to narrow rows before working a record.
- **Grid** — Server-side grid with pagination, column sidebar, column visibility toggle, and row selection; clicking a row opens the edit path for that billing record.
- **Columns shown in the grid** — **Company Name**, **Branch**, **Consignor**, **Consignor Name**, **Start Date**, **End Date**, **Status** (dates formatted as `YYYY-MM-DD` in the grid).

---

## Create Consignor Purchase Billing {#create-consignor-purchase-billing}

Screen title: **Create Consignor Purchase Billing**. Primary action: **CREATE**. Tabs:

### Main Details {#main-details-tab}

| UI label | Notes |
|----------|--------|
| **Start Date** | Date picker |
| **End Date** | Date picker |
| **Company** | Company selector (`blg-select-company-drop-down`) |
| **Branch** | Branch selector — required |
| **Location** | Location/store selector — required |
| **Purchaser Agent*** | Read-only field; click opens **Main Select Purchaser Listing** to choose the purchaser |
| **Status** | Required dropdown: **ACTIVE** or **INACTIVE** |
| **Reference** | Free text |
| **Remarks** | Text area with character count hint |

### Account tab {#account-tab-and-consignor-selection}

Tab label: **Account**. The body uses the shared **purchase order account** component to pick the entity; use **select consignor / supplier** actions to open **Select Consignor Listing** and related **Supplier Create**, **Supplier Edit**, and nested maintenance screens (payment configuration, tax, address, contact, login, branch, category, item pricing, supplier company listing, and similar), depending on what your role and tenant allow.

### Line Item tab {#line-item-tab}

Tab label: **Line Item**. Opens line-item listing for the draft; actions include **Line Item Create**, **Add Line Item**, and **Edit Line Item** flows from the two-column navigation stack.

### Payment tab {#payment-tab}

Tab label: **Payment**. Opens payment listing for the draft; actions include **Add Payment** and **Edit Payment**.

---

## Edit Consignor Purchase Billing {#edit-consignor-purchase-billing}

Screen title: **Edit Consignor Purchase Billing**.

- **SAVE** — Persists changes (disabled when the edit rules say nothing can be saved).
- **RESET** — Resets per component behavior.
- Tabs: **Main Details**, **Account**, **Line Item**, **Payment**, and **Export** (export tab exists on edit, not on create).

Main Details on edit does not wire **select purchaser** from the template in the same way as create; adjust purchaser according to your trained process if that field is managed elsewhere in your tenant.

---

## Configuration and settings {#configuration-and-settings}

Routes are under the applet base path `applet/tnt/wavelet/erp/internal-consignor-purchase-billing-applet` (hash routing). Use the shell sidebar to reach **Settings** and **Personalization** when available.

### Settings (administrators)

| Area | Route segment (under `.../settings/`) | Purpose |
|------|----------------------------------------|---------|
| Default Selection | `default-selection` | Defaults for new documents |
| Printable Format Settings | `printable-format-settings` | Printable layout configuration |
| Field Settings | `field-settings` | Which fields show and behave how |
| Webhook | `webhook` | Webhook integration |
| Feature Visibility | `feature-visibility` | Default landing when opening **Settings** with no child path |
| Permission Set listing | `permission-set-listing` | Permission sets |
| User permission listing | `user-permission-listing` | User-level permissions |
| Team permission listing | `team-permission-listing` | Team permissions |
| Role permission listing | `role-permission-listing` | Role permissions |

### Personalization

The personalization menu includes **Field Settings** and **Default Selection** (under **System Configuration**). The router also defines **Sidebar** under `.../personalization/sidebar` for sidebar personalization when your shell exposes that entry.

---

## Permissions {#permissions}

Permission maintenance uses the shared **Permission** module:

- **Permission Set**, **User**, **Team**, and **Role** listings under **Settings** configure who may access applet functions.
- If you **cannot create**, **cannot open** a row, or **see disabled** Create/Save, your administrator should check **Feature Visibility**, **Field Settings**, and these permission listings.

Specific permission keys are assigned in your environment; this guide focuses on **what you experience in the UI**. For technical keys, administrators use the same permission tools as other internal Wavelet ERP applets.

---

## Frequently asked questions {#frequently-asked-questions}

**How is this different from Consignment Billing (Internal)?**  
[Consignment Billing (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/) is the **sales-side** billing of consignment consumption to your customer. **Internal Consignor Purchase Billing** is **purchase billing** in the consignor procurement context—different document and menu.

**Is this applet a purchase order?**  
No. Purchase orders are handled in [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/). This applet’s data is consignor purchase **billing** (`Consignor Purchase Billing` screens).

**Why does “purchase order” appear in technical paths?**  
Some shared components and search helpers reuse purchase-order infrastructure. Follow the **menu** and on-screen titles (**Consignor Purchase Billing**), not internal route names.

**Where do GRNs fit?**  
Receiving consignment goods is covered in [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/). Use your organisation’s process to connect physical receipts to billing.

---

## Related applets {#related-applets}

- [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/)
- [Customer Consignment](/applets/sales-workflow/customer-consignment-applet/)
- [Consignment Billing (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/)
- [Consignment Return (Internal)](/applets/purchase-workflow/internal-consignment-return-applet/)
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/)
