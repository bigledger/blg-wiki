---
title: "Supplier Delivery Order Applet"
description: "Create and manage supplier delivery orders in BigLedger: listing, document workspace, driver listing, and standard settings."
tags:
  - purchase-workflow
  - supplier-delivery-order
  - procurement
  - logistics
  - delivery-management
weight: 265
date: 2026-04-06
lastmod: 2026-04-25
draft: false
---

## Purpose and Overview {#purpose-and-overview}

The **Supplier Delivery Order Applet** is where your organisation records **supplier delivery orders** in one place: search and open documents from a central listing, capture **main** and **account** (supplier) details, maintain **lines** after the document exists, and—when your project enables it—use **Driver Listing** for driver-related access. Behaviour follows the same configurable document pattern as other BigLedger procurement applets (field settings, printable formats, feature visibility, permissions, webhooks).

{{< callout type="info" >}}
**In plain English:** A supplier delivery order is a structured record of what is being delivered and **who** it is for (supplier and delivery context). Your tenant controls which tabs, fields, and actions appear through **Settings** and permissions.
{{< /callout >}}

### Who uses this applet?

**Procurement and buyers**

- Create delivery orders and keep supplier and header information accurate.

**Warehouse and logistics**

- Confirm delivery-related data and line detail on existing documents.

**Drivers or logistics coordinators**

- Use **Driver Listing** when that menu is enabled for your role.

**Administrators**

- Tune **Application Settings** (field configuration), defaults, printable formats, custom status, email templates, webhooks, feature visibility, and access through the standard **Settings** tools.

---

### What problems does this solve? {#what-problems-does-this-solve}

**Without a dedicated applet**, delivery instructions and supplier delivery context are often scattered across email and spreadsheets, which weakens traceability and makes hand-offs to receiving harder.

**With this applet**, you get:

- A single **Supplier Delivery Order Listing** with search and grid tools.
- A consistent document workspace for **main details**, **account**, and **lines** (lines are maintained on the edit screen in the current build).
- Optional **Driver Listing** for workflows your organisation turns on.
- **Settings** and **Personalization** aligned with other BigLedger applets.

{{< callout type="info" >}}
**Missing a menu, tab, or button?** Your administrator controls **feature visibility**, **field settings**, and **permissions**. Ask your admin if something you expect is hidden by design.
{{< /callout >}}

---

## Key Features Overview {#key-features-overview}

{{< cards >}}
{{< card title="Quick Start" subtitle="Create, edit, driver listing" link="#quick-start-guide" >}}
{{< card title="User interface" subtitle="Listing, create, edit, drivers" link="#user-interface" >}}
{{< card title="Configuration & Settings" subtitle="Defaults, formats, access" link="#configuration--settings" >}}
{{< card title="Integration" subtitle="Related purchase flow" link="#integration" >}}
{{< card title="FAQ" subtitle="Common questions" link="#faq" >}}
{{< card title="Troubleshooting" subtitle="Quick fixes" link="#troubleshooting" >}}
{{< /cards >}}

{{< figure src="/images/supplier-delivery-order-applet/supplier-delivery-order-applet-overview-infographic.png" alt="Supplier Delivery Order Applet overview: from fragmented delivery communication to structured supplier delivery orders in BigLedger" caption="Supplier Delivery Order Applet: structured delivery orders, delivery context, and driver listing alongside standard BigLedger settings." >}}

---

## Quick Start Guide {#quick-start-guide}

### For procurement: create a supplier delivery order

**Goal:** Start a new document from the listing.

1. Click **Supplier Delivery Order** in the sidebar (opens **Supplier Delivery Order Listing**).
2. Click **+** (tooltip **Create**) when it is enabled for your role.
3. The header shows **Create Internal Delivery Order** (shared create component—the document type is still a supplier delivery order for this applet). Complete **Main Details** and **Account** on the tabs shown.
4. Click **CREATE** to save (use **RESET** only if you intend to clear the draft). Follow your process for any further steps (for example opening the document again in **Edit Supplier Delivery Order** to add **Lines**).

---

### For logistics: edit lines and delivery context

**Goal:** Update an existing supplier delivery order.

1. On **Supplier Delivery Order Listing**, click the row to open **Edit Supplier Delivery Order**.
2. Review **Main Details** and **Account** (supplier, billing or shipping pickers, and related sub-screens your training covers).
3. Open the **Lines** tab to add or change line items (**Add Line Item** / **Edit Line Item** flows open auxiliary screens such as **Select Customer** listings—labels follow shared components).
4. Click **SAVE** when the header allows it. A **DELETE** control may appear at the bottom; use it only when policy and document state allow (confirm when the button asks to click again).

---

### For drivers or coordinators: use Driver Listing

**Goal:** Work in the driver workspace when it is visible.

1. Click **Driver Listing** in the sidebar.
2. The screen title is **Driver Listing**. Use **+** (tooltip **Create**) or **Search** as your administrator trained you.
3. Use the grid and row actions your build provides.

---

### For administrators: first-time orientation

**Goal:** Point the applet at your organisation’s defaults and access rules.

1. Open **Settings** from the sidebar (owner or admin roles often see this entry; exact layout depends on your shell).
2. Walk through **Application Settings**, **Default Selection**, **Printable Format Settings**, **Custom Status**, and **Email Template** as needed, then **Feature visibility** and permission tools your governance requires.
3. See [Configuration & Settings](#configuration--settings) for a compact menu summary. Delegate detailed permission matrix work to **IT or tenant administrators**.

---

## User interface {#user-interface}

### Sidebar (typical)

- **Supplier Delivery Order** — main listing and document entry.
- **Driver Listing** — driver workspace when enabled.
- **Settings** — company configuration (when your role may access it).
- **Personalization** — personal defaults and sidebar order (when enabled).

### Supplier Delivery Order Listing

{{< figure src="/images/supplier-delivery-order-applet/main-listing-page.png" alt="Supplier Delivery Order Listing grid with Create control, search, and column tools" caption="Supplier Delivery Order Listing: use the Create (+) control, search, and the grid to open or start supplier delivery orders." >}}

- Screen title: **Supplier Delivery Order Listing**.
- Toolbar: **+** with tooltip **Create**, advanced search, and column toggle (exact controls match your theme).
- Click a row to open **Edit Supplier Delivery Order** for an existing document.

### Create Internal Delivery Order (new document)

{{< callout type="info" >}}
The create header reads **Create Internal Delivery Order** while the applet and listing are named for **supplier delivery orders**. Treat this as the same create flow for this applet; if your training materials use different wording, follow your tenant’s standard.
{{< /callout >}}

- **Back** (arrow, tooltip **Back**) returns toward the listing when enabled.
- Tabs on create: **Main Details**, **Account** (other tabs such as **Lines** may appear only after save or only on edit, depending on build and **Application Settings**).
- Actions: **RESET**, **CREATE**.

### Edit Supplier Delivery Order (existing document)

- Header title: **Edit Supplier Delivery Order**.
- Tabs: **Main Details**, **Account**, **Lines**.
- Actions: **SAVE** (hidden when **Application Settings** hide the generic save control). **FINAL**, **VOID**, **DISCARD**, and similar actions may be available in your build; in the stock template some of those buttons are commented out—rely on what your screen shows.
- **DELETE** at the bottom may require a second click to confirm.

### Driver Listing

- Screen title: **Driver Listing**.
- Toolbar includes **+** (tooltip **Create**) and a **Search** field.
- Grid uses server-side paging; columns follow your configuration.

---

## Configuration & Settings {#configuration--settings}

Most detailed **permission and role** work belongs with your **IT or tenant administrators**. Below is the menu layout used by this applet so you know where to look.

### Under Settings

| Menu label (as in applet) | Purpose (plain language) |
|---------------------------|---------------------------|
| **Application Settings** | Field configuration: required, hidden, and visible fields and related behaviour flags. |
| **Default Selection** | Company-wide defaults such as branch, location, and layout options your form exposes. |
| **Printable Format Settings** | Print and PDF templates for documents. |
| **Custom Status** | Status values used in the document lifecycle. |
| **Email Template** | Outbound email layouts where used. |

Your routing also includes **Webhook** and **Feature visibility**, plus the usual BigLedger permission screens (permission wizard, permission sets, user, team, role, and client-side permission listings). Exact labels in the sidebar can match your shell theme.

### Under Personalization

| Menu label | Purpose |
|------------|---------|
| **Default Selection** | Personal defaults (for example branch or location) where enabled. |
| **Sidebar** | Reorder frequent entries when your shell exposes it. |

---

## Integration {#integration}

Supplier delivery orders sit in the purchase and logistics footprint:

- **Supplier master data** — documents resolve to supplier entities; listing and search depend on maintained suppliers.
- **Branches and locations** — used when your **Main Details** or **Account** flows capture them.

**Related guides**

- [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Internal Purchase GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/)
- [Internal Purchase Order Supplier Access Applet](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/)
- [Supplier Applet (master data)](/applets/master-data/supplier-applet-1/)

---

## FAQ {#faq}

### 1. Why does the create screen say “Create Internal Delivery Order”?

That header comes from a shared create layout. In this applet you are still creating a **supplier delivery order**; use **Supplier Delivery Order Listing** and your trained save path to confirm the record type your tenant stores.

---

### 2. I only see Main Details and Account when creating—where are Lines?

In the current create template, **Lines** is not a tab on the create screen; after **CREATE**, open the document from the listing as **Edit Supplier Delivery Order** and use the **Lines** tab. Your administrator may change tab visibility through **Application Settings** or tab ordering.

---

### 3. CREATE is disabled on the create screen—what should I check?

Complete required fields on **Main Details** and **Account** until validation passes (invalid tabs may show in red). If **CREATE** stays disabled, ask your admin whether additional mandatory fields or permissions block submission.

---

### 4. I cannot see Driver Listing in the sidebar

**Driver Listing** is controlled by **feature visibility** and your role. Ask your administrator to enable the menu entry and confirm your user is allowed to open that route.

---

### 5. The + (Create) control on the listing is disabled

You need create permission on this applet. Your administrator should check permission sets or user permissions and **feature visibility** for **Supplier Delivery Order**.

---

### 6. Why do pickers say “Customer” when this is a supplier delivery order?

Some shared account components reuse **customer** wording in titles (for example **Select Customer Listing**). In context, pick the entity your implementation uses for the supplier or account link—follow internal training or ask your admin.

---

### 7. I expected a VOID or FINAL button on edit but only see SAVE

Those actions can be hidden or disabled by **posting status**, **Application Settings**, or commented-out UI in a given build. Use **SAVE** as shown; if your business process requires void or final, ask your administrator whether another screen or workflow step applies.

---

### 8. Who configures webhooks, email templates, and permissions?

Use **Settings** for **Webhook**, **Email Template**, and the permission and **Feature visibility** screens, or hand off to **IT / tenant administrators** so day-to-day users do not change access by mistake.

---

## Troubleshooting {#troubleshooting}

| Symptom | What to try |
|---------|-------------|
| Listing is empty | Widen search filters; confirm you have read access and that suppliers exist for your branch or company scope. |
| Cannot create | Confirm **+** is not disabled; check create permission and **feature visibility**. |
| Cannot save on edit | Resolve red tab validation; confirm **SAVE** is not hidden by settings and you have update permission. |
| Driver Listing missing | Ask admin to enable the sidebar entry and your role. |
| Wrong branch or location on new documents | Ask admin to adjust **Default Selection** (company) or your **Personalization → Default Selection** (personal). |

Still stuck? Capture the **document reference** (if any), **screen name**, and **time**, then contact your **BigLedger administrator** or internal help desk.

---

## Related Documentation Links

- [Internal Purchase Order Applet](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Internal Purchase GRN Applet](/applets/purchase-workflow/internal-purchase-grn-applet/)
- [Internal Purchase Order Supplier Access Applet](/applets/purchase-workflow/internal-purchase-order-supplier-access-applet/)
- [Supplier Applet (master data)](/applets/master-data/supplier-applet-1/)
