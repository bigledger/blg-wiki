---
title: "Chart of Account"
description: "Reference for the Chart of Account applet — GL sections, categories and codes, companies and their default GL mappings, ledgers, sets of books, fiscal years and period locks."
applet_code: "chartOfAccountApplet"
applet_repo: "blg-applet-wavelet-chart-of-account-applet"
modules: [core, financial-accounting]
related_applets: [organisation-applet, general-ledger-applet, ledger-and-journal-applet, financial-report-applet, cashbook-applet, doc-item-maintenance-applet, customer-maintenance-applet, supplier-applet-1, tax-configuration-applet]
guides: [/guides/accounting-guides/chart-of-accounts-setup/]
sources:
  - blg-applet-wavelet-chart-of-account-applet/micro-fe/projects/wavelet-erp/applets/chart-of-account-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-chart-of-account-applet/micro-fe/projects/wavelet-erp/applets/chart-of-account-applet/src/app/components/settings-container/general-settings/general-settings.component.ts
  - blg-applet-wavelet-chart-of-account-applet/micro-fe/projects/wavelet-erp/applets/chart-of-account-applet/src/app/components/settings-container/general-settings/general-settings.component.html
  - blg-applet-wavelet-chart-of-account-applet/micro-fe/projects/wavelet-erp/applets/chart-of-account-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
  - blg-applet-wavelet-chart-of-account-applet/micro-fe/projects/wavelet-erp/applets/chart-of-account-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
  - blg-applet-wavelet-chart-of-account-applet/micro-fe/projects/wavelet-erp/applets/chart-of-account-applet/src/app/components/company-container/default-glcode/default-glcode.component.html
  - blg-applet-wavelet-chart-of-account-applet/micro-fe/projects/wavelet-erp/applets/chart-of-account-applet/src/app/components/gl-code-container/gl-code-create/gl-code-create.component.ts
  - blg-applet-wavelet-chart-of-account-applet/micro-fe/projects/wavelet-erp/applets/chart-of-account-applet/src/app/components/fiscal-year-container/fiscal-year-edit/fiscal-year-edit.component.ts
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
  - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/journal/JournalController.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/paymentConfigurationDataConsistencyObjects/GlcodeDataConsistencyObject.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet chartOfAccountApplet — no rows)
tags:
- financial-management
- general-ledger
- chart-of-accounts
- fiscal-year
- accounting-setup
weight: 20
aliases:
- /applets/chart-of-account-applet/
---

## Overview

The Chart of Account applet defines the structure every journal in BigLedger posts into: **GL Sections** (Assets, Liabilities, Equity, Revenue, Expenses), **GL Categories** within them, and the **GL Codes** that transactions actually hit. It also holds, per **Company**, the ledgers, the **Default GL Codes** that tell sales, purchase, stock, forex and consignment documents which accounts to post to automatically, the **Sets of Books**, and the **Fiscal Years** whose periods can be locked.

It is opened by the finance administrator during implementation and by the accountant at month-end. It sits before every posting document: an invoice cannot post to the General Ledger until the company's default GL codes are mapped, and it cannot be dated into a locked fiscal period.

{{< callout type="info" >}}
**Core concept.** Every transaction ends in a GL Code; every GL Code belongs to a GL Category; every GL Category belongs to a GL Section. Companies, ledgers and fiscal years decide *where* and *when* that posting is allowed.
{{< /callout >}}

{{< figure src="/images/chart-of-account-applet/chart-of-account-applet-overview-infographic.png" alt="Chart of Account Applet Overview Infographic" caption="How the applet turns account lists into a structured, lockable hierarchy." >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies are created there and assigned a chart of accounts; they then appear under **Companies** here |
| Downstream | [General Ledger](/applets/finance/general-ledger-applet/), [Ledger and Journal](/applets/finance/ledger-and-journal-applet/) | Manual journals post to GL codes and are blocked by `LOCK_GL` / `LOCK_ALL` periods |
| Downstream | [Financial Report](/applets/finance/financial-report-applet/) | Trial balance, P&L and balance sheet roll GL codes up through categories and sections; the closing-stock toggles here decide which stock values appear |
| Downstream | [Cashbook](/applets/master-data/cashbook-applet/) | Each cashbook is tied to a bank / cash GL code |
| Downstream | Sales, purchase, stock, consignment and forex documents | Post through the company's **Default GL Codes**; blocked by `LOCK_TXN` / `LOCK_ALL` periods |
| Downstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | *Account Code* items and the **GL Code Create Item** tool link items to GL codes |
| Downstream | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Supplier](/applets/master-data/supplier-applet-1/) | Entity-level receivable / payable GL codes |
| Downstream | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Input / output tax accounts are mapped here under Default GL Codes |

Modules: Core, Financial Accounting.

## Screens and menus

| Menu item | Description |
| :--- | :--- |
| **Chart of Account** | The hierarchical tree. Tabs: **Details**, **GL Code Link**, **GL Code**, **Segment Tree**, **Dimension Tree**, **Profit Center Tree**, **Project Tree** |
| **GL Section** | Top-level reporting sections (Assets, Liabilities, …) |
| **GL Category** | Groups of accounts within a section. Tabs: **Details**, **GL Code**, **GL Section** |
| **Import GL Category** | CSV upload of categories |
| **GL Code** | All GL codes with search, create and edit |
| **Import GL Code** | CSV upload of GL codes |
| **Companies** | Legal entities. Tabs: **Main**, **Ledgers**, **Fiscal Year**, **Default GL Codes** |
| **Set Of Books** | Books that group ledgers. Tabs: **Details**, **Ledgers** |
| **Fiscal Year** | Financial years and their periods. Tabs: **Main**, **Fiscal Period** |
| **GL Code Merge** | Move one GL code's history into another |
| **GL Code Create Item** | Generate saleable items from GL codes |
| **Audit Trail** | Change history |

Gear (Settings) menu: **General Settings**, **Field Settings**, **Default Selection**. Personalisation: **Default Selection** (per user).

### Chart of Account (tree view)

{{< figure src="/images/chart-of-account-applet/screenshots/coa-listing.png" alt="Chart of Account Listing" caption="Chart of Account listing showing the hierarchical tree view of all accounts." >}}

Drill from Section to Category to Code, search, create a new chart, or delete one (with confirmation). A tenant normally has one chart; several are possible when companies keep different structures.

| Tab | Purpose |
| :--- | :--- |
| **Details** | COA Code (read-only after creation), COA Name, Description, audit trail |
| **GL Code Link** | Add or remove a GL code's membership of this chart |
| **GL Code** | All GL codes within this chart |
| **Segment Tree** | Reporting segments — tag transactions by business unit (Retail, Wholesale, Online) |
| **Dimension Tree** | Analysis dimensions — free tags such as Department, Region, Campaign |
| **Profit Center Tree** | Profit centres — P&L per branch or business line |
| **Project Tree** | Projects — revenue and cost per initiative |

Tab order is configurable (`CHART_OF_ACCOUNT_DETAILS_TAB_ORDER`, see Configuration).

{{< figure src="/images/chart-of-account-applet/screenshots/coa-edit-tabs.png" alt="Chart of Account Edit" caption="Editing Chart of Account details and viewing available tabs." >}}

Segments, dimensions, profit centres and projects share one shape: a **Code** (immutable), a **Name**, an optional **Description**, an optional **Parent** (select *No Parent* for the top level), a **Status**, and **Ref 1 – Ref 5** (code, name, description) for extra tagging. Use them instead of duplicating GL codes per branch: keep one `6000 Rent` and tag the profit centre.

{{< figure src="/images/chart-of-account-applet/screenshots/coa-segments.png" alt="Segments Tab" caption="Adding and managing segments for multi-dimensional reporting." >}}
{{< figure src="/images/chart-of-account-applet/screenshots/coa-project.png" alt="Project Tab" caption="Managing projects linked to the Chart of Accounts." >}}

### GL Section, GL Category, GL Code

| Level | Component | Purpose | Example |
| :--- | :--- | :--- | :--- |
| 1 | **GL Section** | Financial-statement heading | Assets, Liabilities, Equity, Revenue, Expenses |
| 2 | **GL Category** | Sub-total grouping within a section | Current Assets, Fixed Assets, Trade Debtors |
| 3 | **GL Code** | The account a transaction posts to | `CASH-PRI-KV01`, `DEBTOR-TRADE-RETAIL`, `SALES-SMARTPHONE-KV01` |

GL Sections usually come pre-populated; you can add or rename them (**Name**, **Account No.**).

{{< figure src="/images/chart-of-account-applet/screenshots/gl-category-listing.png" alt="GL Category Listing" caption="GL Category listing and creation interface." >}}

A GL Category has a **Details** tab (code — read-only after creation — name, chart of account, parent category, description, account no.), a **GL Code** tab where codes can be created with the category pre-selected, and a **GL Section** tab that links the category to its section. Categories are created independently; the link to a section is made on the GL Section tab.

{{< figure src="/images/chart-of-account-applet/screenshots/gl-code-listing.png" alt="GL Code Listing" caption="GL Code listing showing all accounts with search and filter options." >}}
{{< figure src="/images/chart-of-account-applet/screenshots/gl-code-create.png" alt="GL Code Creation Screen" caption="Creating a new GL Code with required fields." >}}

A GL Code has a **Details** tab and a **Chart of Account Link** tab (one code can belong to more than one chart).

### Companies

Companies appear here once a chart of accounts has been assigned to them in the Organisation applet.

{{< figure src="/images/chart-of-account-applet/screenshots/company-main-tab.png" alt="Company Main Tab" caption="Company Main tab showing read-only company information." >}}

- **Main** — Company Code (read-only), Company Name, Registration No., Currency, Tax ID, SST ID, Chart of Account, Inventory Cost Base On.
- **Ledgers** — create ledgers (Code, Name, Type `PRIMARY` / `SECONDARY` / `CONSOLIDATED`, Currency). A ledger opens to an **Opening Balance** tab (primary ledgers only) and a **Remove Journal** tab.
- **Fiscal Year** — the fiscal years of this company.
- **Default GL Codes** — the mapping table that lets documents post automatically (see Configuration).

{{< figure src="/images/chart-of-account-applet/screenshots/company-ledgers.png" alt="Company Ledgers Tab" caption="Creating and managing Ledgers and Sub-Ledgers." >}}

### Set of Books

A set of books groups one or more ledgers for a reporting purpose (statutory, management, consolidation). **Details** holds the name; **Ledgers** links existing company ledgers.

{{< figure src="/images/chart-of-account-applet/screenshots/set-of-books-ledgers.png" alt="Set of Books Ledgers" caption="Linking Ledgers to Set of Books." >}}

### Fiscal Year and Fiscal Periods

{{< figure src="/images/chart-of-account-applet/screenshots/fiscal-year-listing.png" alt="Fiscal Year Listing" caption="Fiscal Year listing with create option." >}}

Create a fiscal year with **Company**, **Name**, **Start Date** and **End Date**; the periods are generated from the date range. The year itself has a status of `ACTIVE` or `CLOSED`; each period has a **Closing Status** of `OPEN`, `LOCK_GL`, `LOCK_TXN` or `LOCK_ALL` (see *Lifecycle*). Click a period row to open **Fiscal Period Details**, change the status and **Save**.

{{< figure src="/images/chart-of-account-applet/screenshots/fiscal-period.png" alt="Fiscal Period Management" caption="Managing fiscal periods and closing statuses." >}}

### Import GL Category / Import GL Code

Download the **\*Sample Format** CSV from the import screen, fill it, drag-and-drop or upload, review the row flags (green = ready, red = error, hover for the reason) and click **ADD**.

GL Code template columns: `CHART_OF_ACC | GL_CATEGORY | GL_CODE | GL_NAME | DESC` — `CHART_OF_ACC` is the chart's code, `GL_CATEGORY` must match an existing category name exactly.

### GL Code Merge

Choose the chart, the category, the **Source** (duplicate) code and the **Target** (surviving) code, click **MERGE** and confirm. All history moves to the target and the source is deactivated. Both codes must be in the same GL Category.

### GL Code Create Item

{{< figure src="/images/chart-of-account-applet/screenshots/gl-code-create-item.png" alt="GL Code Create Item screen - select a GL Category, search GL Codes, and generate saleable Items linked to each code" caption="GL Code Create Item: generate saleable Items from GL Codes in a selected category so revenue routes to the correct account." >}}

Select a GL Category, **SEARCH** to list its GL codes, **CREATE** to generate one *Account Code* item per GL code in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/). Sales staff can then invoice "Consulting income" as a line and the revenue lands on the right account.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Company created and assigned a chart of accounts | [Organisation](/applets/master-data/organisation-applet/) | Only then does the company appear under **Companies** here |
| GL sections, categories and codes | this applet (or CSV import) | Default GL Codes can only be mapped to codes that exist |
| At least one `PRIMARY` ledger per company | **Companies > Ledgers** | Journals post into the primary ledger; opening balances are entered on it |
| Default GL Codes mapped | **Companies > Default GL Codes** | FINAL on a document whose mapping is missing is **rejected by the backend** with `MISSING_DEFAULT_GL_CODE: <code>`; the document stays unposted until the mapping exists |
| A fiscal year covering today | **Fiscal Year** | Documents and journals are validated against the period of their transaction date |
| A set of books | **Set Of Books** | Financial reports run against a set of books |

**Recommended setup order:** verify the company → create ledgers → build (or import) sections, categories, codes → map Default GL Codes → create a set of books and link the ledgers → create the fiscal year.

### Applet settings

**Settings > General Settings**

| Setting | What it controls | Default | Effect when changed | Who can change it |
|---|---|---|---|---|
| `COA_DEFAULT_GL_CODE` | A JSON text area holding fallback GL-code mappings read when a transaction has no explicit mapping elsewhere | empty | Transactions without a company-level default use these codes | Applet administrator |
| `SHOW_INVENTORY_STOCK_VALUE` | Show general inventory (trading stock) closing value in financial reports | off | Balance sheet / P&L include the stock line | Applet administrator |
| `SHOW_RAW_MATERIAL_STOCK_VALUE` | Show raw-material stock value | off | Same, for `STOCK_BALANCE_RAW` | Applet administrator |
| `SHOW_WIP_STOCK_VALUE` | Show work-in-progress stock value | off | Same, for `STOCK_BALANCE_WIP` | Applet administrator |
| `SHOW_FINISHED_GOODS_STOCK_VALUE` | Show finished-goods stock value | off | Same, for `STOCK_BALANCE_FG` | Applet administrator |
| `SHOW_NSTI_STOCK_VALUE` | Show non-stock / trade-in stock value | off | Same, for `STOCK_BALANCE_NSTI` | Applet administrator |

**Settings > Default Selection**

| Setting | What it controls | Default |
|---|---|---|
| `CHART_OF_ACCOUNT_DETAILS_TAB_ORDER` | Order of the tabs on the Chart of Account edit screen (Details, GL Code Link, GL Code, Segment Tree, Dimension Tree, Profit Center Tree, Project Tree) | code order above |
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION` | Tenant-wide default branch and location pre-selected in the applet | empty |

**Settings > Field Settings** shows eight toggles (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project). In the current build they are not bound to any stored setting and have no effect.

**Personalisation > Default Selection** — the same `DEFAULT_BRANCH` / `DEFAULT_LOCATION` per user.

**Companies > Default GL Codes** — the mapping that matters most. Each key takes exactly one GL code:

| Tab | Keys |
| :--- | :--- |
| **General** | `RETAINED_EARNING`, `PROFIT_LOSS`, `NSTI`, `FIXED_ASSET_REGISTER`, `ROUNDING`, `SETTLEMENT_CHARGES` |
| **Entity** | `DEBTOR`, `DEBTOR_NON_TRADE`, `DEBTOR_NOT_INVOICED`, `DEBTOR_NON_TRADE_NOT_INVOICED`, `CREDITOR`, `CREDITOR_NON_TRADE`, `CREDITOR_NOT_INVOICED`, `CREDITOR_NON_TRADE_NOT_INVOICED`, `MERCHANT_RECEIVABLE`, `MERCHANT_PAYABLE`, `EMPLOYEE_OTHER_PAYABLE` |
| **Sales** | `SALES`, `SALES_RETURN`, `SALES_DISCOUNT`, `OUTPUT_TAX` |
| **Purchase** | `PURCHASE`, `PURCHASE_RETURN`, `PURCHASE_DISCOUNT`, `INPUT_TAX` |
| **Stock** | `STOCK_ADJUSTMENT`, `RESET_MA`, `STOCK_BALANCE`, `COGS`, `INVENTORY_NOT_INVOICED`, `STOCK_BALANCE_RAW`, `COGS_RAW`, `STOCK_BALANCE_WIP`, `COGS_WIP`, `STOCK_BALANCE_FG`, `COGS_FG`, `STOCK_BALANCE_NSTI`, `COGS_NSTI` |
| **Forex** | `FOREX_GAIN`, `FOREX_LOSS` |
| **Consignment** | `CONSIGNMENT_STOCK`, `CONSIGNMENT_LIABILITY` |

Screenshots: [General](/images/chart-of-account-applet/screenshots/default-gl-codes-general.png) · [Entity](/images/chart-of-account-applet/screenshots/default-gl-codes-entity.png) · [Sales](/images/chart-of-account-applet/screenshots/default-gl-codes-sales.png) · [Purchase](/images/chart-of-account-applet/screenshots/default-gl-codes-purchase.png) · [Stock](/images/chart-of-account-applet/screenshots/default-gl-codes-stock.png) · [Forex](/images/chart-of-account-applet/screenshots/default-gl-codes-forex.png) · [Consignment](/images/chart-of-account-applet/screenshots/default-gl-codes-consignment.png)

{{< callout type="warning" >}}
**If the relevant default GL code is not set, FINAL fails.** The posting service looks up the company's default GL code for the transaction code it needs (for example `DEBTOR`, `SALES`, `OUTPUT_TAX`) and, if the mapping is absent, rejects the document with `MISSING_DEFAULT_GL_CODE: <transaction code>`. Nothing is saved as FINAL and no journal is created until you add the mapping under **Companies > Default GL Codes** and finalise again. Map the codes for every document type your branches use before go-live.
{{< /callout >}}

### Document behaviour settings

Not applicable — the applet maintains master data. Posting behaviour is governed by the Default GL Codes and fiscal period locks described above, not by document switches.

### Feature visibility / permissions

No client-side permission definitions are registered for `chartOfAccountApplet`. Access is controlled by installing the applet for a user; there is no per-tab or per-menu permission inside it.

## Fields

### GL Code — Details

| Field | Meaning | Required | Notes / validation |
| :--- | :--- | :--- | :--- |
| GL Code | Account code | Yes | Max 255; immutable after creation; the backend rejects a duplicate (`GLCODE_OBJECT_VIOLATE_UNIQUE_CONSTRAINTS`) |
| GL Name | Account name | Yes | Max 255 |
| Chart of Account | Chart the code belongs to | Yes in practice | Must exist (`GLCODE_OBJECT_CHART_OF_ACC_GUID_DOES_NOT_EXIST`) |
| GL Category | Category the code belongs to | Yes in practice | Must exist (`GLCODE_OBJECT_GL_CATEGORY_GUID_DOES_NOT_EXIST`) |
| Description | Free text | No | Max 255 |
| Account No. | Alternative numbering | No | — |
| Status | `ACTIVE` / `INACTIVE` | — | Inactive codes disappear from document dropdowns |

### GL Category — Details

| Field | Required | Notes |
| :--- | :--- | :--- |
| GL Category Code | Yes | Immutable after creation |
| GL Category Name | Yes | — |
| Chart of Account | — | Editable (moves the category) |
| GL Category (parent) | No | For sub-categories |
| Description, Account No. | No | — |

### Chart of Account, Segment, Dimension, Profit Center, Project

| Field | Required | Notes |
| :--- | :--- | :--- |
| Code | Yes | Immutable after creation |
| Name | Yes | — |
| Description | No | — |
| Parent | No | Segments, dimensions, profit centres and projects only; *No Parent* = top level |
| Status | — | Editable after creation |
| Ref 1 – Ref 5 (code, name, description) | No | Segments, dimensions, profit centres and projects only |

### Company — Ledger

| Field | Required | Notes |
| :--- | :--- | :--- |
| Ledger Code, Ledger Name | Yes | — |
| Ledger Type | Yes | `PRIMARY`, `SECONDARY`, `CONSOLIDATED`; opening balances only on primary |
| Currency | Yes | — |

### Fiscal Year / Fiscal Period

| Field | Required | Notes |
| :--- | :--- | :--- |
| Company, Name, Start Date, End Date | Yes | Periods are generated from the range |
| Year Status | — | `ACTIVE` / `CLOSED` |
| Period Name, Start Date, End Date | — | Editable |
| Period Closing Status | — | `OPEN`, `LOCK_GL`, `LOCK_TXN`, `LOCK_ALL` |

## Lifecycle and posting

Chart of account records do not post; they are the targets of posting. What the applet *controls* is when posting is allowed, through fiscal period closing status. The backend checks the period of the document's or journal's transaction date for its company:

| Closing status | Manual journals (General Ledger / Ledger and Journal) | Operational documents (invoices, bills, stock, payments) | Typical use |
| :--- | :--- | :--- | :--- |
| `OPEN` | Allowed | Allowed | Current period |
| `LOCK_GL` | **Blocked** (`FISCAL_PERIOD_LOCKED`) — journals flagged as system-generated (`auto_flag = AUTO`) still post | Allowed | Month-end soft close: stop adjustments, let invoicing finish |
| `LOCK_TXN` | Allowed | **Blocked** | Cut-off: no more documents dated in the period |
| `LOCK_ALL` | **Blocked** (system journals excepted) | **Blocked** | Hard close |

Reopening is done by setting the period back to `OPEN`; there is no separate approval step in the applet, so restrict who can install it.

## Related applets

- [Organisation](/applets/master-data/organisation-applet/) — creates companies and branches and assigns each company its chart of accounts.
- [General Ledger](/applets/finance/general-ledger-applet/) and [Ledger and Journal](/applets/finance/ledger-and-journal-applet/) — manual journals against these GL codes; subject to `LOCK_GL`.
- [Financial Report](/applets/finance/financial-report-applet/) — trial balance, P&L and balance sheet by set of books; honours the closing-stock toggles.
- [Cashbook](/applets/master-data/cashbook-applet/) — every cashbook maps to a bank or cash GL code.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — tax codes whose postings land on the `INPUT_TAX` / `OUTPUT_TAX` defaults.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — *Account Code* items generated by GL Code Create Item.
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) and [Supplier](/applets/master-data/supplier-applet-1/) — entity GL codes override the `DEBTOR` / `CREDITOR` defaults per entity.

## Troubleshooting

| Symptom | Cause | Fix |
| :--- | :--- | :--- |
| Document saved but nothing in the General Ledger | The default GL code the document needs (e.g. `SALES`, `OUTPUT_TAX`, `STOCK_BALANCE`) is not mapped for that company | Map it under **Companies > Default GL Codes**; re-post or re-save the affected documents |
| "The selected date falls within a locked fiscal period" (`FISCAL_PERIOD_LOCKED`) on a journal | Period is `LOCK_GL` or `LOCK_ALL` | Date the journal in an open period, or reopen the period |
| Documents cannot be finalised for a date | Period is `LOCK_TXN` or `LOCK_ALL` | Same; note that `LOCK_GL` alone does not stop documents |
| Cannot delete a GL code | It has been used in a transaction (even a voided one) | Set it `INACTIVE`, or move its history with **GL Code Merge** |
| GL Code Merge refuses the pair | Source and target are in different GL Categories | Move one code to the other's category first |
| Balance sheet does not balance / retained earnings missing | `RETAINED_EARNING` or `PROFIT_LOSS` default not mapped, or opening balances entered on a non-primary ledger | Map the General tab defaults; enter opening balances on the `PRIMARY` ledger |
| Stock value missing from P&L or balance sheet | The matching `SHOW_*_STOCK_VALUE` toggle is off | Turn it on under **Settings > General Settings** |
| GL code missing from a document dropdown | Code is `INACTIVE`, or not linked to the chart the company uses | Check status and the **Chart of Account Link** tab |
| Company not listed under Companies | No chart of accounts assigned to it in Organisation | Assign one in the Organisation applet |
| Import GL Code rows flagged red | `GL_CATEGORY` does not exactly match an existing category name, or the code already exists | Fix the CSV and re-upload |

## Related documentation

- [Chart of accounts setup guide](/guides/accounting-guides/chart-of-accounts-setup/) — the walkthrough for a new tenant.
- [Financial Accounting module](/modules-v2/financial-accounting/) and [Opening balances](/modules-v2/financial-accounting/opening-balance/).
- [Core module](/modules-v2/core/).
