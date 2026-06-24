---
title: "Internal Consignor Purchase Billing Applet"
description: "User guide for consignor purchase billing: why it exists in consignment, how billable quantity is calculated, create and edit with lines and payments, and settings."
tags:
  - purchase-workflow
  - consignment
  - purchase-billing
  - consignor
  - accounts-payable
weight: 62
draft: false
lastmod: 2026-06-24
---

## Purpose and overview

### What this applet is for

**Internal Consignor Purchase Billing** records the **financial billing** between your organisation and a **consignor** (supplier) after consignment activity has occurred. Each document has a header (company, branch, location, billing period, purchaser, status, references), the **consignor account**, **line items** with billable quantities and amounts, and optional **payment** lines for settlement.

The window title is **Consignor Purchase Billing Applet**; the sidebar entry is **Internal Consignor Purchase Billing**.

In a **consignment** model, ownership of stock usually stays with the consignor until agreed events occur (for example sales, consumption, transfer, or a settlement trigger agreed with the consignor). This applet is where you **record what to bill the consignor** for a period—not where you receive goods or place a standard purchase order.

### How this document type compares to others

| Document | What it is for | When you use it |
|----------|----------------|-----------------|
| [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | Creates a **commitment to buy** from a supplier | Before goods or services are confirmed |
| [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | Records a **supplier invoice** in the standard purchase flow | When you receive and post a supplier invoice |
| **Consignor Purchase Billing (this applet)** | Records **billing and settlement** for consigned stock with the consignor | After consignment activity in the billing period |
| [Consignment Billing (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/) | Bills your **customer** for consigned stock used | Sales-side billing to the consignee |

{{< callout type="info" >}}
**Not the same as sales-side billing:** [Consignment Billing (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/) bills your customer. This applet handles **consignor-side purchase billing** with the supplier who owns the consigned stock.
{{< /callout >}}

### Problems this applet helps solve

- **One official billing record** for each consignor billing cycle instead of spreadsheets or email.
- **Clear billable quantities** on each line, with **Total** and **Tax** summarised on the **Line Item** tab.
- **Settlement lines** on the same document when finance records how payment was made.

### Where to work in the menu

- **Internal Consignor Purchase Billing** — listing, create, edit (**CREATE** / **SAVE**), lines, and payments.
- **Settings** and **Personalization** — defaults, fields, print formats, permissions, and sidebar layout (when your administrator enables them).

### Where this applet fits (consignment context)

| Stage | Purpose | Where to read more |
|--------|---------|-------------------|
| Consignment GRN | Receive consigned goods into stock | [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/) |
| Consignment usage / movement | Track sold, consumed, or moved quantity | [Customer Consignment](/applets/sales-workflow/customer-consignment-applet/) |
| **Consignor purchase billing (this applet)** | Calculate and record **billable quantity** and amounts for the consignor | **This guide** |
| Bill the consignee | Invoice the customer for consignment usage | [Consignment Billing (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/) |
| Standard purchase order | Commit to buy outside consignment billing | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) |

**What triggers billing?** Your finance and operations team define this—for example a **monthly billing cycle** (**Start Date** / **End Date** on the document), quantity sold or consumed in that period, or quantities approved for billing. Use the table above and your internal policy together.

---

## Before you begin

- You need permission to use **Internal Consignor Purchase Billing** (create/open/edit as defined for your role).
- **Company**, **branch**, and **location (store)** must be valid in master data. **Branch** and **location** are **required** on the document before you can save a new record.
- You must complete **Account** (consignor / supplier entity) so the account form is valid—**CREATE** and **SAVE** stay disabled until this is true.
- You must add **at least one line item** before **CREATE** or **SAVE**—the applet enforces a non-empty **Line Item** grid.
- **Items** you add on lines must be consignment items available in **Search Item**, and your pricing rules must allow the line to be completed.
- **Payment lines** are normally added **after** the billing document exists (open from the listing, then **SAVE**). Finance should agree when settlement is recorded.

{{< callout type="info" >}}
Field labels, mandatory markers, and hidden tabs follow **Field Settings** and **Feature Visibility** set by your administrator. If a field this guide lists is missing, ask an administrator rather than assuming you are on the wrong screen.
{{< /callout >}}

---

## Who uses this applet

| Role | Main responsibility |
|------|---------------------|
| Finance / Accounts Payable / Consignment operations | Create billing records, verify amounts and tax, add **Payment** lines, coordinate settlement |
| Inventory / operations | Supply correct stock figures and item context for lines; may own **Reference** / **Remarks** |
| Procurement / buying | Support purchaser and consignor selection when your process assigns that to buying |
| Administrator | **Settings** / **Personalization**: defaults, printable formats, field visibility, permissions |

---

## Key features

{{< cards >}}
{{< card title="Listing" subtitle="Search, open a row, start Create" link="#consignor-purchase-billing-listing" >}}
{{< card title="Create a new billing" subtitle="Header, consignor, lines, then CREATE" link="#quick-start-billing-operations" >}}
{{< card title="Main Details" subtitle="Dates, org, purchaser, status, references" link="#main-details-what-each-field-is-for" >}}
{{< card title="Account and consignor" subtitle="Select the consignor (supplier) entity" link="#account-select-the-consignor" >}}
{{< card title="Line items" subtitle="Search item, pricing, and tax" link="#line-items-search-item-and-add-item" >}}
{{< card title="Billable quantity" subtitle="Calculations and Quantity To Bill" link="#calculations-and-quantity-to-bill" >}}
{{< card title="Payment lines" subtitle="Settlement method and amount" link="#payment-tab-settlement-and-fields" >}}
{{< card title="Edit, totals, Export" subtitle="SAVE, line totals, export when enabled" link="#edit-consignor-purchase-billing" >}}
{{< card title="Status and posting" subtitle="ACTIVE/INACTIVE and no FINAL button here" link="#posting-and-final-in-this-applet" >}}
{{< card title="When something breaks" subtitle="CREATE/SAVE disabled, missing data" link="#if-something-is-wrong" >}}
{{< card title="Settings (admin)" subtitle="Defaults, formats, permissions" link="#configuration-and-settings" >}}
{{< /cards >}}

{{< figure src="/images/internal-consignor-purchase-billling-applet/internal-consignor-purchase-billing-applet-overview-infographic.png" alt="Overview infographic for Internal Consignor Purchase Billing: listing, document tabs, lines, payments, and related consignment context" caption="High-level view of consignor purchase billing in BigLedger: where this applet sits and how listing, create/edit, lines, and payments fit together." >}}

---

## Quick start: billing operations {#quick-start-billing-operations}

**Goal:** Create a **consignor purchase billing** the system accepts when you click **CREATE**.

1. Open **Internal Consignor Purchase Billing** (title **Consignor Purchase Billing Applet**).
2. On **Consignor Purchase Billing Listing**, click **Create** (`+`).
3. **Main Details** — Set **Start Date** and **End Date** to the **billing period** you are recording (for example the month you are settling with the consignor). Choose **Company**, **Branch**, and **Location**; set **Status** to **ACTIVE** for normal work. Add **Reference** / **Remarks** if your team uses them. Click **Purchaser Agent** to open **Main Select Purchaser Listing** and pick the internal person responsible for this billing case.
4. **Account** — Select the **consignor (supplier)** for this billing using **Select Consignor Listing**.
5. **Line Item** — Click **Create** (`+`) on the line grid. In **Select Line Item**, use **Search Item**, pick the product, then on **Add Item** complete **Calculations** (opening stock, net purchase, closing stock—see [Calculations and Quantity To Bill](#calculations-and-quantity-to-bill)) and **Item Details** (pricing and tax). Click **ADD** to attach each line. Check **Total** and **Tax** above the grid.
6. Click **CREATE** when it is enabled.

**What happens next**

- A success message appears and you return to the **listing**.
- Open the new row to add or change lines, record **Payment** lines (finance), or **Export** a PDF when needed.

{{< callout type="tip" >}}
**Payment comes after CREATE:** **CREATE** saves the header and line items only. Finance normally adds **Payment** lines after opening the saved billing from the listing—see [Quick start: finance / AP](#quick-start-finance--ap).
{{< /callout >}}

---

## Quick start: finance / AP {#quick-start-finance--ap}

**Goal:** Review amounts on an existing billing and record **payment** / settlement.

1. Open a row from **Consignor Purchase Billing Listing** (**Edit Consignor Purchase Billing**).
2. On **Line Item**, check **Quantity To Bill**, **Txn Amount**, and tax columns against your consignment records. Confirm **Total** and **Tax** above the grid.
3. Open **Payment**. Click **Add** (`+`), choose **settlement method** (**CASH**, **BANK_TRANSFER**, **CHEQUE**, **CREDIT_CARD**, **VOUCHER**, **CASH_BACK**, **MEMBERSHIP_POINT_CURRENCY**, or others your organisation lists). Complete **Date**, **Amount**, and any method-specific fields (**Transaction No**, **Cheque No**, card details, and so on). Click **ADD** on the payment form.
4. Click **SAVE** when enabled.
5. Optional: open **Export**, choose a **Printable Format**, and use **EXPORT AS PDF** for a copy for the consignor or your files.

---

## Consignor Purchase Billing Listing {#consignor-purchase-billing-listing}

**Who:** Anyone working documents day to day.

Use **Consignor Purchase Billing Listing** to:

- Start **Create** (`+`).
- Use **advanced search** to narrow rows.
- Click a row to open **Edit Consignor Purchase Billing**.
- Work with the grid (pagination, columns, filters): columns include **Company Name**, **Branch**, **Consignor**, **Consignor Name**, **Start Date**, **End Date**, **Status**.

{{< figure src="/images/internal-consignor-purchase-billling-applet/main-listing.png" alt="Consignor Purchase Billing Listing with grid columns, search, and Create button" caption="Consignor Purchase Billing Listing: search, columns, and **Create** (`+`) to start a new billing." >}}

---

## Create Consignor Purchase Billing {#create-consignor-purchase-billing}

Screen title: **Create Consignor Purchase Billing**.

**Buttons**

- **CREATE** — Saves a new billing. Enabled when **Main Details** is complete, a consignor is selected on **Account**, and there is **at least one line** on **Line Item**.

**Tabs:** **Main Details**, **Account**, **Line Item**, **Payment**.

{{< figure src="/images/internal-consignor-purchase-billling-applet/create-main-details.png" alt="Create Consignor Purchase Billing screen showing Main Details tab, other tabs, and CREATE button" caption="Create Consignor Purchase Billing: **Main Details** tab, **Account**, **Line Item**, **Payment**, and **CREATE** (enabled only when Main Details, Account, and at least one line are valid)." >}}

---

## Main Details — what each field is for {#main-details-what-each-field-is-for}

| Field | Purpose (why it matters) | How to fill |
|--------|---------------------------|-------------|
| **Start Date** / **End Date** | Define the **billing cycle and reporting period** for this record. | Pick dates that match the cycle your finance team uses with the consignor. |
| **Company** | Which legal entity owns this billing. | Select from the company list. |
| **Branch** | Which branch owns or processes this billing. **Required.** | Select branch after company as needed. |
| **Location** | Store or location context for the billing. **Required.** | Select location for the chosen branch. |
| **Purchaser Agent*** | Internal person **responsible for this billing case** (tracking and coordination). | **Create:** click the field to open **Main Select Purchaser Listing**. **Edit:** the field shows the saved name; if you must change it after save, follow your administrator’s correction process. |
| **Status** | **ACTIVE** or **INACTIVE** for whether this billing header is treated as live or inactive in your workflow. **Required.** | Choose **ACTIVE** for normal work. |
| **Reference** | Your **external or internal reference** (supplier memo, case ID, cycle id)—whatever your team agreed for tracing this billing. | Free text. |
| **Remarks** | Longer narrative (negotiations, exclusions, footnotes for auditors). | Optional; character count shown in the UI. |

---

## Account — select the consignor {#account-select-the-consignor}

**Purpose:** Attach the **consignor (supplier) entity** that this billing is for. Without a valid account selection, **CREATE** / **SAVE** stay disabled.

Open **Account**. Use **select entity / consignor** actions to open **Select Consignor Listing**, choose or create the supplier, and complete entity maintenance (**Supplier Create**, **Supplier Edit**, addresses, tax, contacts, branches, categories, item pricing, companies, and related screens) **when your role allows**.

---

## Line items — Search Item and Add Item {#line-items-search-item-and-add-item}

**Purpose:** Line items determine **billing values, taxes, and totals** for the document.

{{< figure src="/images/internal-consignor-purchase-billling-applet/add-line-items.png" alt="Line Item tab showing Add Item flow, item details, totals and tax summary above the line grid" caption="**Line Item** tab: add items, then review **Total** and **Tax** above the grid." >}}

### Path from the document

1. On **Create** or **Edit**, open the **Line Item** tab.
2. Click **Create** (`+`) on the line toolbar — opens **Select Line Item**.
3. Use **Search Item** to find a consignment item.
4. Open **Add Item** with tabs **Calculations** and **Item Details**.
5. On **Calculations**, enter **Opening Stock**, **Net Purchase**, and **Closing Stock**; the screen calculates **Quantity To Bill** (see below).
6. On **Item Details**, enter pricing, quantity, discounts, and tax until **Txn Amount** is correct.
7. Click **ADD** to attach the line.

### What you see on the Line Item tab

The grid shows each line with **Item Code**, **Opening Stock**, **Net Purchase**, **Closing Stock**, **Quantity To Bill**, **SST/VAT/GST**, and **Txn Amount**. **Total** and **Tax** above the grid summarise all lines.

**Opening Stock**, **Net Purchase**, and **Closing Stock** are **inventory reference figures** that support the billing calculation—they are not the payment amount by themselves. The amount you bill is reflected in **Quantity To Bill** and **Txn Amount** on each line.

---

## Calculations and Quantity To Bill {#calculations-and-quantity-to-bill}

When you add or edit a line, open **Add Item** → **Calculations**.

| Field | What it means |
|-------|----------------|
| **Opening Stock** | Stock on hand at the **start** of the billing period (for this item). |
| **Net Purchase** | Net consignment movement **into** stock during the period (purchases or receipts your process counts). |
| **Closing Stock** | Stock on hand at the **end** of the period. |
| **Quantity To Bill** | Billable quantity for this line—calculated as **Opening Stock + Net Purchase − Closing Stock**. |

**Quantity To Bill** is the quantity of consigned inventory that has become **billable** for this billing cycle. It is **not** the same as:

- Quantity on a [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/)
- Quantity received on a consignment GRN alone
- Total warehouse on-hand stock unrelated to the billing period

Your organisation defines how you obtain opening, net purchase, and closing figures (for example from consignment reports or operations). Enter the values agreed with finance, then complete **Item Details** so **Txn Amount** reflects price and tax for that billable quantity.

{{< callout type="tip" >}}
**Example:** Opening 100, Net Purchase 50, Closing 40 → **Quantity To Bill** = 110 (100 + 50 − 40). Apply your unit price and tax on **Item Details** to get **Txn Amount**.
{{< /callout >}}

---

## Payment tab — settlement and fields {#payment-tab-settlement-and-fields}

**Purpose:** Record **how** settlement was made—method, amount, date, and reference numbers—on the saved billing document.

**When to use it:** After the billing exists in the listing. Open **Edit Consignor Purchase Billing**, go to **Payment**, then add lines and click **SAVE** on the document.

1. On **Payment**, click **Add** (`+`) to open **Add Payment**.
2. Choose a **settlement method**. Fields shown depend on the method:
   - **CASH** — **Date**, **Amount**, **Remarks**.
   - **CASH_BACK** — **Date**, **Cash Back**, **Amount**, **Cash Back for Settlement** (read-only), **Remarks**.
   - **CREDIT_CARD** — **Date**, **Amount**, **Remarks**, **Card No**, **Name on Card**, **Card Issuer**, **Type**, **Card Expiry**, **CVV**.
   - **VOUCHER** — **Voucher #**, **Amount**, **Remarks**.
   - **BANK_TRANSFER** — **Date**, **Amount**, **Transaction No**, **Remarks**.
   - **MEMBERSHIP_POINT_CURRENCY** — **Date**, **Point CCY**, **Amount**, **Point Currency for Settlement**, **Remarks**.
   - **CHEQUE** — **Date**, **Amount**, **Cheque No**, **Remarks**.
3. Click **ADD** when the form is complete.

**CREATE does not require payment lines**—only a valid header, consignor on **Account**, and at least one line item. The **Payment** tab is visible on create, but finance should normally add payments **after** **CREATE**, on the edit screen.

The **Payment** tab also shows **Total** (payments recorded) and **Outstanding** (line total minus payments) when amounts are entered.

---

## Edit Consignor Purchase Billing {#edit-consignor-purchase-billing}

Screen title: **Edit Consignor Purchase Billing**.

- **SAVE** — Same rule as **CREATE**: complete **Main Details**, consignor on **Account**, at least one line.
- **RESET** — Discards unsaved changes on the current edit session and reloads the last saved state.
- **Tabs:** **Main Details**, **Account**, **Line Item**, **Payment**, **Export**.

### Export (edit only)

Open **Export**, choose a **Printable Format** configured under **Settings → Printable Format Settings**, then click **EXPORT AS PDF** for a printable copy. Formats are set up by your administrator.

---

## Posting and FINAL in this applet {#posting-and-final-in-this-applet}

Unlike [Consignment GRN (Internal)](/applets/inventory-workflow/internal-consignment-grn-applet/) or [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), this applet uses **operational status** on the header (**ACTIVE** / **INACTIVE**) rather than posting buttons such as **FINAL** or **VOID** on the create and edit screens.

Day-to-day actions here are **CREATE** (first save), **SAVE** (updates), and **RESET** (on edit). Do not assume the same **DRAFT / FINAL / VOID** lifecycle as other purchase documents unless your administrator describes extra steps outside this applet.

---

## Status reference {#status-reference}

### Header status (Main Details)

| Value | Meaning | Typical use |
|--------|---------|-------------|
| **ACTIVE** | Billing header is live for processing. | Normal documents. |
| **INACTIVE** | Billing header marked inactive. | Retired or superseded cycles—confirm meaning with finance. |

### Listing **Status** column

The listing shows status from the billing header (same **ACTIVE** / **INACTIVE** family as above). Sort and filter using the grid as needed.

---

## Worked example (illustrative) {#worked-example}

Your codes will differ; this shows **order of operations** only.

1. **Create** — Company **HQ**, Branch **KL**, Location **Main DC**. Period **2026-04-01** to **2026-04-30**. **Reference** `CSG-PB-2026-04`. **Purchaser Agent** = **Jane**. **Status** **ACTIVE**.
2. **Account** — Consignor **SUP-001 / Vendor Alpha**.
3. **Line Item** — **Search Item** → **Calculations**: Opening **100**, Net Purchase **50**, Closing **40** → **Quantity To Bill** **110**. **Item Details**: price and tax until **Txn Amount** shows **MYR 1,200.00**. **ADD**.
4. **CREATE** — New row appears with **Consignor** **SUP-001**, April dates, **Status** **ACTIVE**.
5. **Edit** (finance) — Add **Payment** (for example **BANK_TRANSFER**) for **MYR 1,200.00**, **SAVE**.

---

## If something is wrong {#if-something-is-wrong}

| Symptom | Likely cause | What to do |
|---------|----------------|------------|
| **CREATE** stays disabled | Missing **branch** or **location**, consignor not selected on **Account**, or no lines on **Line Item**. | Complete required **Main Details**, select consignor on **Account**, add at least one line. |
| **SAVE** stays disabled on edit | Same as **CREATE**. | Keep required fields complete and at least one line on the document. |
| Success message mentions "purchase order" | Message text may not match this document type. | If the new row appears in the listing, the billing was saved—use the listing as confirmation. |
| Cannot find item in **Search Item** | Item not set up for consignment or not visible to your role. | Ask your administrator to check the item master. |
| Payment **ADD** disabled | Settlement method not chosen or required fields missing. | Select a method first; enter **Amount** and other required fields for that method. |
| **Purchaser Agent** cannot be changed on edit | Purchaser is chosen on create; edit screen may not offer the picker again. | Follow your administrator’s process to correct purchaser after save. |
| **Quantity To Bill** looks wrong | Opening, Net Purchase, or Closing entered incorrectly. | Recheck figures on **Calculations**; formula is Opening + Net Purchase − Closing. |

---

## Configuration and settings {#configuration-and-settings}

Administrators configure the applet under **Settings** and **Personalization** in the sidebar.

### Settings

| Area | What it controls |
|------|------------------|
| **Feature Visibility** | Which menus and features users see |
| **Default Selection** | Default branch and location on new billings |
| **Printable Format Settings** | PDF layouts for **Export** |
| **Field Settings** | Which fields appear and which are mandatory |
| **Webhook** | Notifications to external systems when documents change |
| **Permission Set / User / Team / Role** | Who can create, edit, or view billing and pricing |

### Personalization

| Area | What it controls |
|------|------------------|
| **Personal Default Selection** | Your own default branch and location (overrides organisation defaults) |
| **Sidebar** | Layout of your sidebar menu |

---

## Permissions

- If **Create** is missing or **CREATE** / **SAVE** never enables, your role may lack permission or **Feature Visibility** may hide functions.
- Administrators adjust permission listings and **Field Settings** for your organisation.

---

## Related documentation

- [Internal Consignment GRN](/applets/inventory-workflow/internal-consignment-grn-applet/)
- [Customer Consignment](/applets/sales-workflow/customer-consignment-applet/)
- [Consignment Billing (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/)
- [Consignment Return (Internal)](/applets/purchase-workflow/internal-consignment-return-applet/)
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/)
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/)

---

## Frequently asked questions {#frequently-asked-questions}

### What is the minimum I must complete before CREATE?

Valid **Main Details** (including **branch**, **location**, and **status**), a consignor selected on **Account**, and **at least one line item**. Payment lines are **not** required for **CREATE**.

### What happens after I click CREATE?

The billing is saved, a success message appears, and you return to the **listing**. Open the row again to add **Payment** lines, change lines, or **Export** a PDF.

### How is billable quantity determined?

On **Add Item** → **Calculations**, enter **Opening Stock**, **Net Purchase**, and **Closing Stock**. The screen calculates **Quantity To Bill** as **Opening + Net Purchase − Closing**. What those three numbers represent depends on your organisation’s consignment policy (for example sold quantity, consumed quantity, or figures from operations reports). See [Calculations and Quantity To Bill](#calculations-and-quantity-to-bill).

### How is this different from Consignment Billing (Internal)?

[Consignment Billing (Internal)](/applets/sales-workflow/internal-consignment-billing-applet/) bills your **customer** for consignment usage. This applet records **consignor purchase billing**—amounts owed to or settled with the **consignor (supplier)**.

### How is this different from a Purchase Order or Purchase Invoice?

A [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) is a **commitment to buy**. A [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) records a **standard supplier invoice**. **Consignor Purchase Billing** records **billing for consigned stock** with the consignor after activity in the billing period—it does not replace either of those documents.

### Is this a purchase order?

No. This is **Consignor Purchase Billing**, not a purchase order. See the comparison table in [Purpose and overview](#purpose-and-overview).

### Where is FINAL?

There is **no FINAL** button on create or edit screens. Use **CREATE** and **SAVE**, and header **Status** **ACTIVE** / **INACTIVE**. See [Posting and FINAL in this applet](#posting-and-final-in-this-applet).

### Do I need a payment line before CREATE?

**No.** Add **Payment** lines **after** the billing is created—open it from the listing, add payments on **Payment**, then **SAVE**.

### How do lines get money and tax?

Complete **Calculations** for **Quantity To Bill**, then on **Item Details** enter pricing and tax. The line **Txn Amount** and tax columns update; **Total** and **Tax** on the **Line Item** tab summarise all lines.

### Why can’t I change Purchaser Agent on edit?

Purchaser is normally selected when you **create** the billing. If you must change it after save, use the correction process your administrator provides.

---

## Glossary {#glossary}

- **Consignor purchase billing** — Billing document for amounts due to or settled with a consignor for a period.
- **Consignor** — Supplier who owns consigned stock; selected on **Account**.
- **Quantity To Bill** — Billable quantity on a line (Opening Stock + Net Purchase − Closing Stock on **Calculations**).
- **Purchaser Agent** — Internal person responsible for the billing case on the header.
- **Txn Amount** — Transaction amount on a line or payment.
- **Search Item** — Screen to pick a consignment item before **Add Item**.
