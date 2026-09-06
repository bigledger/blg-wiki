---
aliases:
- /modules/inventory/category-groups/
title: "Doc Item Maintenance"
description: "Reference for the Doc Item Maintenance applet — the item master (products, services, vouchers, account-code items) that every sales, purchase, POS and e-commerce document in BigLedger draws from."
applet_code: "DocItemApplet"
applet_repo: "blg-applet-wavelet-doc-item-maintenance-applet"
modules: [core, inventory, ecommerce, pos, e-invoice]
related_applets: [inv-item-maintenance-applet, tax-configuration-applet, chart-of-account-applet, organisation-applet, stock-availability-applet, stock-balance-applet, pricebook-applet, t2t-admin-applet, pos-general-applet, cp-commerce-admin-applet, voucher-management-applet, my-e-invoice-portal-applet]
guides: []
sources:
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/models/applet-settings.model.ts
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/settings-container/application-settings/application-settings.component.ts
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/settings-container/application-settings/application-settings.component.html
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/models/menu-items.ts
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/shared/options.ts
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/models/running-number-generation-methods.constants.ts
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/models/item-code-format.constants.ts
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/basic-item-container/basic-item-create/default/item-create-default.component.ts
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/item-edit.component.ts
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/basic-item-tax/item-tax.component.ts
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/e-invoice-details/e-invoice-details.component.html
  - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/basic-item-container/basic-item-listing/basic-item-listing.component.ts
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialItemDataConsistencyObjects/FinancialItemDataConsistencyObject.java
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/FiItemService.java
  - akaun_master.bl_applet_client_side_perm_dfn (applet DocItemApplet)
tags:
- core-module
- item-management
- inventory
- master-data
- product-catalog
weight: 50
---

## Overview

The Doc Item Maintenance applet is BigLedger's **item master**. Every line on a sales invoice, purchase order, POS receipt, delivery order or marketplace listing points at a record created here. It holds the *commercial* definition of an item — code, name, type, unit of measure, tax codes, pricing, categories, images, branch and company visibility, e-Invoice classification — and links to the *physical* stock record kept by the [Inventory Item Maintenance applet](/applets/master-data/inv-item-maintenance-applet/).

It is opened by whoever owns the product catalogue: a merchandising or purchasing clerk in a retailer, the accounts team for account-code and service items, and the e-commerce team for marketplace-linked items. It sits at the very start of every process: no item, no document line.

A short introduction to the applet:

{{< youtube omcu01BQTFs >}}

{{< callout type="tip" >}}
**Analogy**: think of the applet as a **supermarket manager's office**.
- The **Items** menu is the product database where you fill out the details for every apple, cereal box and detergent.
- **Pricing Schemes** are the price lists you define (for example "Retail", "Member Price", "Wholesale").
- **Category Groups** are how you arrange the aisles (Food > Produce > Fruit).
- **Import / Export** is the loading dock where you bring in pallets of data at once instead of carrying items in one by one.
{{< /callout >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream (must exist first) | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Input / output / withholding tax codes selected on the item's Tax tab |
| Upstream | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | GL code on the Main tab; required for *Account Code* items |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies and branches used by Branch Linking and Company Linking |
| Upstream | [T2T Admin](/applets/integrations/t2t-admin-applet/) | Tenant-to-tenant permissions before T2T Item Mapping can be used |
| Sibling | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | The stock-keeping record (`bl_inv_mst_item_hdr`) that a stock-tracked doc item is linked to |
| Downstream | [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | Read-only tabs on the item show what those applets hold |
| Downstream | [Pricebook](/applets/master-data/pricebook-applet/) | Consumes items and pricing schemes |
| Downstream | [POS General](/applets/sales-workflow/pos-general-applet/), Sales / Purchase / Delivery documents, [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/), Ecomsync | Every document line is a doc item |
| Downstream | [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | Item classification, taxable type and UOM captured on the E-Invoice tab are sent on every e-Invoice line |
| Downstream | [Voucher Management](/applets/membership/voucher-management-applet/) | *Voucher* items record voucher stock in / out |

Modules: Core, Inventory, E-Commerce, POS, E-Invoice.

## Screens and menus

The left menu of the applet has these entries (Application Settings can hide any of them):

| Menu | What it is for |
|---|---|
| **Items** | The item listing, create and edit screens — the bulk of this page |
| **Category Groups** | Named groups of categories (the "aisles") |
| **Categories** | Individual categories, optionally nested, linked to a category group |
| **Classifications** | The LHDN e-Invoice item classification list (synchronised, normally read-only) |
| **Pricing Schemes** | Price-list templates; prices themselves are entered per item |
| **Import Item** | CSV import of items, links, pricing, categories |
| **Export Item** | CSV export of pricing, GL-code, company / branch / label links |
| **Entity Pricing Import** | CSV import of customer / supplier-specific prices |
| **Item Image File Import** | Bulk image upload |
| **Scheduler** | Cron-style jobs, mainly marketplace (Lazada / Shopee) synchronisation |
| **Search Filter** | Storefront filter definitions used by CP Commerce categories |
| **Frames** | Image frames / overlays for product media |
| **Item Price Change** | Bulk price change across items |
| **Item Templates** | Templates that pre-fill new items |

The gear (Settings) menu holds **Application Settings**, **Default Selection**, **Custom Resource Bundle Configuration** (translations), **Custom Field Placement**, **Spreadsheet View configuration**, **Ecomsync Management**, **CpCommerce Brand**, **Attribute** / **Attribute Set** and **Rating Configuration**.

### Items

#### Item listing

{{< figure src="/images/doc_item_maintenance/item_listing.png" caption="Fig 1: Item listing" >}}

Click a row to open the item for editing. The default status filter, the visible columns and the sort order (created date or alphabetical) are all controlled in Application Settings.

#### Create item

{{< figure src="/images/doc_item_maintenance/create_item.gif" caption="Fig 2: Create item — Default tab" >}}

The create screen deliberately asks for the minimum: item code, item name, item type, sub item type, base UOM, currency, and optionally a description, remarks, product manager, GL code and EAN code. Everything else is added on the edit screen after the first save, so that a long form is never lost to a missed Save.

{{< callout type="warning" >}}
**Item Code and Item Type cannot be changed after the item is saved** (unless an administrator turns on the `EDIT_ITEM_CODE` setting — see Configuration). Item Name can be changed at any time.
{{< /callout >}}

The create screen has three modes, each of which can be hidden in settings: **Default** (free-typed item code), **By Category** (the code is generated from a configured *item code format* such as `<category00>-<category01>-####`, where `####` is a running number) and **Group Item** (creates a grouped parent and its child variants in one go, driven by attribute groups).

{{< figure src="/images/doc_item_maintenance/create_item_workflow.gif" caption="Fig 2a: Create item workflow" >}}

- **Consignment Item** — tick for stock you hold but do not own (supplier consignment).
- **Required Production** — tick for items that must go through a production process before they can be sold.
- **Alternate Item Code** — a second code used by another system.

{{< callout type="info" >}}
Items can be created manually, imported from CSV, or synchronised from Wavelet EMP if that integration is in use.
{{< /callout >}}

#### Item types

{{< figure src="/images/doc_item_maintenance/item_types.gif" caption="Fig 2b: Item types" >}}

The item type decides which edit tabs appear and how transactional applets treat the line. The full list offered by the UI (an administrator can restrict it with `AVAILABLE_ITEM_TYPES`):

| Item type (UI label) | Stored value | Use |
|---|---|---|
| **Basic Item** | `BASIC_ITEM` | The default for physical goods; the only type with a Stock Card tab |
| **Grouped Item** | `GROUPED_ITEM` | A parent that groups variants (child items) sharing attributes such as colour or size |
| **Bundle** | `BUNDLE` | Several stand-alone items sold for one price; stock is deducted from the child items, not the parent |
| **Voucher** | `COUPON` | Records stock in / out of vouchers; reflected in the Voucher Management applet |
| **Service** | `SERVICE` | A line with no inventory tracking |
| **Warranty** | `WARRANTY` | Extended warranty sold against eligible categories, items or pricing bands |
| **Account Code** | `GL_CODE` | An item that is really a GL account, used to post non-stock charges from documents |
| **Doc Header Adjustment** | `DOC_HEADER_ADJUSTMENT` | Header-level discount / adjustment lines in POS |
| **Membership** | `MEMBERSHIP` | Membership plans: attributes, dues schedule, expiry |
| **Made to Order (MTO)** | `MADE_TO_ORDER` | Assembled to customer specification; enables the MTO Config and Add On tabs |
| **Digital Goods** | `DIGITAL_GOODS` | Non-physical products delivered electronically |
| **Fixed Asset Register** | `FIXED_ASSET_REGISTER` | Company assets tracked with a category and type |
| **Sales Contract** | `SALES_CONTRACT` | Contract-based sales linked to a sales contract template |
| **Delivery Charge** | `DELIVERY_CHARGE` | Shipping / delivery cost lines; enables the Delivery Charge Config tab |
| **NSTI** | `NSTI` | Non-stock trade-in items |
| **Group Discount**, **Currency**, **Alias**, **Member Point Discount**, **External** | as named | Special-purpose types used by POS promotions, multi-currency, item aliases, membership points and external catalogues |

#### Sub item types

Sub item types apply to Basic Items (and Alias items) and decide how quantity is tracked:

| Sub item type | Stored value | Behaviour |
|---|---|---|
| **Basic Quantity** | `BASIC_QUANTITY` | Plain quantity |
| **Batch Number** | `BATCH_NUMBER` | Container measure fixed at 1; container quantity editable |
| **Serial Number** | `SERIAL_NUMBER` | Container measure and quantity both fixed at 1 — one serial per unit |
| **Bin Number** | `BIN_NUMBER` | Container measure and quantity both editable |
| **Unity** | `UNITY` | Single-unit items |

The sub item type is shown in the POS applet. Changing it after creation is only possible with the `ENABLE_EDIT_SUB_ITEM_TYPE` permission (see Configuration).

#### Edit item

{{< figure src="/images/doc_item_maintenance/item_edit.gif" caption="Fig 3: Edit item" >}}

The edit screen is a set of tabs. Which tabs are shown depends on the item type and on the `HIDE_*` settings in Application Settings; the order can also be changed per tenant (`DETAILS_TAB_ORDER`). The full tab set, in default order:

Item Template Selection · Main · E-Invoice · Label · Item Category · MTO Config (MTO only) · Delivery Charge Config (Delivery Charge only) · Eligible Categories / Eligible Items / Eligible Pricing Bands (Warranty only) · Add On · Add On Of · Tax · Sales Contract Template Details · Depreciation · Voucher Details · Membership · Dimension Details · Bundle Config (Bundle only) · Child Item (Grouped only) · Multi UOM · Branch Linking · Company Linking · Costings · PNS Settlement Method · Pricing Scheme · Manage Media · Entity Pricing (not for MTO) · T2T Item Mapping · Marketplace · Stock Availability · Stock Card (Basic Item only) · Attribute · Pages · Reviews.

{{< callout type="warning" >}}
**Add On / Add On Of** are for **Made to Order** workflows: they define the optional extras that can be added to a base MTO item. If you do not build to order, hide them.
{{< /callout >}}

##### Main tab

{{< figure src="/images/doc_item_maintenance/edit_item_main.png" caption="Fig 3a: Edit item — Main tab" >}}

General information: name (editable), code and type (locked), sub item type, GL code, abbreviation / prefix (used by the voucher applet to group items), EAN code, currency, status, supplier, sales and purchase prompts, remarks, and the consignment / production / delivery checkboxes.

##### E-Invoice tab

{{< figure src="/images/doc_item_maintenance/e-invoice_tab.png" caption="Fig 3b: Edit item — E-Invoice tab" >}}

The LHDN **item classification**, **taxable type code** and **e-Invoice UOM** that go on every e-Invoice line for this item. Tenant-wide defaults for all three can be set in Application Settings so new items are pre-filled. Classifications themselves are maintained under the **Classifications** menu.

##### Item Category tab

{{< figure src="/images/doc_item_maintenance/edit_item_category.png" caption="Fig 3c: Edit item — Item Category tab" >}}

Up to 21 category slots (Category 0 – 20). Each slot is bound to one category group in Application Settings, and each can be made mandatory. Categories are created under the **Categories** menu.

##### Tax tab

{{< figure src="/images/doc_item_maintenance/edit_item_tax.png" caption="Fig 3d: Edit item — Tax tab" >}}

Tick *tax applicable*, then choose the country and the input, output, output-withholding and input-withholding tax code, type and rate. The codes come from the [Tax Configuration applet](/applets/master-data/tax-configuration-applet/).

##### Multi UOM tab

{{< figure src="/images/doc_item_maintenance/edit_item_uom.png" caption="Fig 3e: Edit item — Multi UOM tab" >}}

Alternative units and their ratio to the base UOM, so transactional applets can convert automatically and reports can show multiple units:

- 1 Box = 12 Packs
- 1 Pack = 10 Strips
- 1 Strip = 10 Tablets

Per line: **UOM**, **Ratio** (how many base units), **Status**, **Base UOM** (read-only; change it on the Main tab), **Sort Code** (`001` for the smallest unit upwards), **EAN Code** (a barcode per UOM) and **E-Invoice UOM** (the LHDN UOM code for this unit).

##### Branch Linking and Company Linking tabs

{{< figure src="/images/doc_item_maintenance/item_edit_branch_linking.png" caption="Fig 3f: Edit item — Branch Linking tab" >}}
{{< figure src="/images/doc_item_maintenance/edit_item_company.png" caption="Fig 3g: Edit item — Company Linking tab" >}}

Restrict where the item can be transacted. Link branches and only those branches see the item in POS and other transactional applets; link a company and every branch under that company sees it. Companies and branches come from the [Organisation applet](/applets/master-data/organisation-applet/).

{{< callout type="warning" >}}
Company Linking wins. If company A (five branches) is linked and only two of its branches are ticked under Branch Linking, the item is still visible to **all five**. To restrict to specific branches, use Branch Linking **only** and leave Company Linking empty.
{{< /callout >}}

##### Costings tab

Cost figures per company: moving average (MA), weighted average (WA), FIFO, LIFO, manual and replacement cost, plus landed-cost equivalents and the last purchase company. Hidden by default (`HIDE_COSTINGS_TAB`); a user with the `SHOW_COSTINGS_TAB` permission sees it regardless, and each figure has its own `SHOW_COST_*` permission.

##### PNS Settlement Method tab

{{< callout type="info" >}}
Hidden by default. Show it with **Settings > Application Settings > Item Edit Tab Hidden > `HIDE_PNS_SETTLEMENT_METHOD`** off. It links a product-and-service item to a settlement method for payment-provider and membership-point workflows.
{{< /callout >}}

{{< figure src="/images/doc_item_maintenance/pns_settlement_method.png" caption="Fig 3h: Edit item — PNS Settlement Method tab" >}}

Settlement type is **Payment Provider** or **Membership Point Currency**.

##### Pricing Scheme tab

{{< figure src="/images/doc_item_maintenance/edit_item_pricing.png" caption="Fig 3i: Edit item — Pricing Scheme tab" >}}

Enter the unit price (and minimum, maximum, promotion, before / after tax) for each pricing scheme template defined under the **Pricing Schemes** menu. Transactional applets pick a scheme and read the price from here.

##### Manage Media tab

{{< figure src="/images/doc_item_maintenance/edit_item_manage_image.png" caption="Fig 3j: Edit item — Manage Media tab" >}}

Product images used by Ecomsync, CP Commerce, POS and GRN. Image type is for organisation only — **Main Image** (the marketplace listing image), **Promotional Image** (replaces the main image during a promotion) and **Additional images** (angles, box contents). The date range on an image is a reference note and does not switch images automatically.

##### Entity Pricing tab

{{< figure src="/images/doc_item_maintenance/entity_pricing.gif" caption="Fig 3k: Edit item — Entity Pricing tab" >}}

A price per **customer, supplier or employee** for this item: sales and purchase unit / min / max price, quantity bands (sales, purchase, consignment), currency, tax codes, lead time and the counterparty's own item code and name. Use it when the same product is bought from several suppliers at different prices, or sold to a B2B customer at a contracted price. Every field on the add and edit forms can be hidden individually in Application Settings.

##### T2T Item Mapping tab

**Tenant-to-Tenant (T2T)** lets two BigLedger tenants that trade with each other link their item codes, so that a purchase order or invoice sent from the other tenant is recognised as your item.

| Sub-tab | Purpose |
|---|---|
| **Host Tenant** | Map your item to an item in a host tenant (the tenant you connect *to*) |
| **Guest Tenant Item Mapping** | Read-only view of guest tenants' items mapped to your item |
| **Guest Tenant Permission Listing** | Which guest tenants may map their items to yours |

{{< figure src="/images/doc_item_maintenance/t2t_item_mapping_host_tenant.png" caption="Fig 3l: T2T Item Mapping — Host Tenant" >}}
{{< figure src="/images/doc_item_maintenance/t2t_item_mapping_guesttenant.png" caption="Fig 3m: T2T Item Mapping — Guest Tenant" >}}

{{< callout type="info" >}}
Tenants only appear in these lists after the T2T permission has been granted in the [T2T Admin applet](/applets/integrations/t2t-admin-applet/).
{{< /callout >}}

##### Marketplace tab

{{< figure src="/images/doc_item_maintenance/marketplace.gif" caption="Fig 3n: Edit item — Marketplace tab" >}}

Links the item to store listings on Lazada, Shopee, Shopify, CP Commerce or Anchanto OMS. **Main** selects the stores; **Other Resellers** records reseller marketplace URLs; **Checking** shows the Ecomsync synchronisation report.

##### Other tabs

- **Label** — assign labels (a lighter alternative to categories).
- **Dimension Details** — height, length, width, weight.
- **Stock Availability** — read-only view of marketplace / branch stock availability.
- **Stock Card** — stock balance movements; **Basic Item only**.
- **Bundle Config** — the child items and quantities of a Bundle.
- **Child Item** — the variants of a Grouped Item, with ratio, display option and status.
- **Voucher Details**, **Membership**, **Depreciation**, **Sales Contract Template Details** — type-specific detail.
- **Attribute**, **Pages**, **Reviews** — e-commerce catalogue data (attribute sets, CMS posts, ratings).

### Category Groups

{{< figure src="/images/doc_item_maintenance/category_group_listing.png" caption="Fig 4: Category Group listing" >}}

A category group is a named container of categories. Application Settings decides which item category slot (0 – 20) uses which group, so that when a user picks Category 3 on an item they only see that group's categories.

{{< callout type="info" >}}
Category groups and categories can be maintained from both this applet and the Inventory Item Maintenance applet; they share the same records.
{{< /callout >}}

{{< figure src="/images/doc_item_maintenance/category_group_create.png" caption="Fig 4a: Create Category Group" >}}

Fields: **Category Group Code**, **Category Group Name**, **Type** (`DOC_ITEM`, `CP_COM`, `EMP_CATEGORIES`, `LAZADA`, `SHOPEE` — which types are offered is a setting), **Param Code**, **Param Name**, **Status**. All are mandatory.

{{< figure src="/images/doc_item_maintenance/category_group_edit.png" caption="Fig 4b: Edit Category Group" >}}

Editing shows a **Main** tab and a **Categories** tab listing the linked categories in a nested grid, where categories can be added, edited or removed.

{{< figure src="/images/doc_item_maintenance/item_category_edit.png" caption="Fig 4c: Category Group — Categories tab" >}}

### Categories

{{< figure src="/images/doc_item_maintenance/category_listing.png" caption="Fig 5: Category listing" >}}

{{< figure src="/images/doc_item_maintenance/category_create.png" caption="Fig 5a: Create Category" >}}

Fields: **Category Group** (required), **Category Code** (required), **Category Name** (required), **Description**, **Search Filter** (for CP Commerce storefront filtering) and **Parent Category** for nesting (Smartphones > Flagship smartphones).

{{< figure src="/images/doc_item_maintenance/category_edit.png" caption="Fig 5b: Edit Category — Main tab" >}}

Edit tabs: **Main**, **Manage Image** (category images shown on the CP Commerce storefront), **Manage Item** (the items under this category) and **Login**.

{{< figure src="/images/doc_item_maintenance/category_manage_image.png" caption="Fig 5c: Category — Manage Image tab" >}}

### Classifications

{{< figure src="/images/doc_item_maintenance/classification_listing.png" caption="Fig 6: Classification listing" >}}

The LHDN (Inland Revenue Board of Malaysia) e-Invoice item classification codes. The list is synchronised from LHDN and normally needs no manual change; it is what the item's E-Invoice tab selects from.

### Pricing Schemes

{{< figure src="/images/doc_item_maintenance/pricing_scheme_listing.png" caption="Fig 7: Pricing Scheme listing" >}}

A pricing scheme is a **template** ("Retail", "Member Price", "Wholesale"). Create the scheme here; enter the actual prices on each item's Pricing Scheme tab (or import them). POS settings choose which scheme supplies the retail, minimum and maximum price.

{{< figure src="/images/doc_item_maintenance/pricing_scheme_create.png" caption="Fig 7a: Create Pricing Scheme" >}}

Fields: **Pricing Scheme Code** (generated), **Pricing Scheme Name** (required), **Description**.

{{< figure src="/images/doc_item_maintenance/pricing_scheme_edit.png" caption="Fig 7b: Edit Pricing Scheme" >}}

Edit tabs: **Main** (edit / delete; code is locked) and **Copy** (duplicate all item prices from another scheme, optionally with an amendment).

### Import Item

{{< figure src="/images/doc_item_maintenance/import_item.png" caption="Fig 8: Import Item" >}}

| Template | Use |
|---|---|
| **Doc Item** | Create / update items (column set is configurable) |
| **Doc Item Category Link** | Link items to categories |
| **Doc Item Relationship** | Grouped / bundle parent–child links |
| **Doc Item Pricing** | Prices per pricing scheme |
| **Doc Item With GL Code** | Account Code items with their GL code |
| **Doc Item Label Link** | Item ↔ label |
| **Doc Item Company Link** / **Doc Item Branch Link** | Company / branch visibility |
| **Doc Item Category** | Categories themselves |
| **Doc Item with Ecomsync Item Link** | Item ↔ marketplace listing |

{{< figure src="/images/doc_item_maintenance/master_data_import.png" caption="Fig 8a: Import templates" >}}

For the **Doc Item** template a dialog lets you pick only the columns you need before downloading the CSV; the other templates have fixed columns.

{{< figure src="/images/doc_item_maintenance/import_item.gif" caption="Fig 8b: Import item" >}}

Process: choose the template → (Doc Item only) pick columns → download the CSV → fill it in → save as `.csv` → upload or drag-and-drop. Uploaded files are listed below and can be reviewed or deleted from the File Import Edit page.

### Export Item

{{< figure src="/images/doc_item_maintenance/export_item.png" caption="Fig 9: Export Item" >}}

Templates: **Doc Item Pricing**, **Doc Item With GL Code**, **Doc Item Company Link**, **Doc Item Branch Link**, **Doc Item Label Link**. You can filter *which items* are exported (pricing scheme, status, categories) but not *which columns* — each template has a fixed column set.

### Scheduler

{{< figure src="/images/doc_item_maintenance/scheduler_create.png" caption="Fig 10: Scheduler create" >}}

Fields: Scheduler Code (one of the marketplace jobs, e.g. Lazada products / orders / QC status / fulfilment / inventory sync, Shopee products / orders / brands / fulfilment / inventory sync), Scheduler Name, Time Interval, Interval, Branch List, and a **Cron Expression** tab.

### Search Filter

Search filters define the facets shown on a CP Commerce storefront category page. Within this applet they are only referenced from the Category create / edit screens.

{{< figure src="/images/doc_item_maintenance/search_filter_listing.png" caption="Fig 11: Search Filter listing" >}}
{{< figure src="/images/doc_item_maintenance/search_filter_create.png" caption="Fig 11a: Create Search Filter" >}}
{{< figure src="/images/doc_item_maintenance/search_filter_edit.png" caption="Fig 11b: Edit Search Filter" >}}
{{< figure src="/images/doc_item_maintenance/search_filter_sections.png" caption="Fig 11c: Search Filter — Sections tab" >}}

Section types: `ATTRIBUTE` (brand, colour, size…), `PRICE`, `RATING`, `POINT_CURRENCY`, `STOCK_AVAILABILITY`, `POINT_REDEEM`.

## Configuration

### Before you can use it

| Prerequisite | Where | Why |
|---|---|---|
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | The Tax tab and Entity Pricing select existing input / output / WHT codes; without them tax cannot be set per item |
| GL codes | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | The Main tab GL code; mandatory in practice for *Account Code* items, which post straight to that account |
| Companies and branches | [Organisation](/applets/master-data/organisation-applet/) | Branch / Company Linking; an item linked to nothing is visible everywhere |
| Inventory item record | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | A stock-tracked item must reference an existing, non-deleted inventory item (`inv_item_hdr_guid`); the backend rejects a link to a missing one |
| Category groups | this applet | Category slots 0–20 only work once a group is bound to each slot in Application Settings |
| Pricing schemes | this applet | Prices cannot be entered until at least one scheme exists |
| E-Invoice classifications | this applet (Classifications) and [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | Needed on every item that will appear on an e-Invoice |
| T2T permissions | [T2T Admin](/applets/integrations/t2t-admin-applet/) | Before any tenant appears in T2T Item Mapping |
| Permissions | Applet permission assignment | See *Feature visibility / permissions* |

### Applet settings

**Settings > Application Settings** is a long form saved as one tenant-wide settings JSON (`saveMasterSettingsInit`); changes apply to every user of the applet on their next load. The form is grouped into expansion panels. Only settings with a business effect are listed individually; the column-visibility and expand-by-default switches are summarised.

**Sidebar Settings**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_<MENU>_MENU` (one per menu: `HIDE_ITEM_LISTING_MENU`, `HIDE_CATEGORY_GROUPS_MENU`, `HIDE_CATEGORIES_MENU`, `HIDE_CLASSIFICATIONS_MENU`, `HIDE_PRICING_SCHEMES_MENU`, `HIDE_IMPORT_ITEM_MENU`, `HIDE_EXPORT_ITEM_MENU`, `HIDE_ENTITY_PRICING_IMPORT_MENU`, `HIDE_ITEM_IMAGE_FILE_IMPORT_MENU`, `HIDE_SCHEDULER_MENU`, `HIDE_SEARCH_FILTER_MENU`, `HIDE_FRAMES_MENU`, …) | Whether the menu entry is shown in the left sidebar | off (shown) | Hides the entry for all users; the data is untouched |

**Items Settings — defaults and behaviour**

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_ITEMS_LISTING_STATUS` | Status filter the listing opens with (`ALL`, `ACTIVE`, `INACTIVE`, `OBSOLETE`) | — | Listing pre-filters on this status |
| `DEFAULT_TEMP_SAVE_STATUS` | Status given to an item saved with the *Temp* (quick-save) feature: `ACTIVE` or `INACTIVE` | — | Items created via temp save get this status |
| `ENABLE_TEMP_FEATURE` | Shows the temp-save path on create | off | Lets users park a partially filled item |
| `SORT_BY_CREATED_DATE` / `SORT_BY_ALPHABETICAL_ORDER` | Listing sort order | — | Mutually exclusive |
| `ENABLE_SAME_PAGE_WHEN_BACK_TO_LISTING` | Return to the same listing page after editing | off | Prevents the listing jumping back to page 1 after an edit |
| `DEFAULT_UOM` | Base UOM pre-filled on create | `PCS` (form default) | New items start with this unit |
| `DEFAULT_CURRENCY` | Currency pre-filled on create | `MYR` (form default) | — |
| `EDIT_ITEM_CODE` | Allows the item code to be edited after save | off | Code becomes editable; the backend still enforces uniqueness |
| `AUTO_CAPITALIZE_ITEM_CODE` | Upper-cases the code as typed | off | Avoids `abc-01` and `ABC-01` coexisting |
| `ENABLE_ITEM_CODE_MAX_LIMIT` + `ITEM_CODE_MAX_LIMIT` | Maximum length validator on item code | off | Save is blocked past the limit |
| `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT` | Maximum length validator on item name | off | Same |
| `MANDATORY_EAN_CODE` / `HIDE_EAN_CODE` | EAN required, or hidden entirely | off / off | — |
| `ENABLE_EAN_CODE_7_DIGITS` | Accept 7-digit EAN | off | — |
| `CUSTOM_EAN_CODE` + `EAN_CODE_AFTER_LETTER` | Derive the EAN from the part of the code after a given letter | off | — |
| `AVAILABLE_ITEM_TYPES` | Which item types the create dropdown offers | all | Restricts users to the listed types |
| `HIDE_SUB_ITEM_TYPE`, `HIDE_MAIN_DEFAULT_SUB_ITEM_TYPE`, `HIDE_MAIN_DEFAULT_UOM` | Hide sub item type / UOM on create and pre-fill from the default | off | Users cannot pick these; the default is used |
| `HIDE_OPTIONAL_SERIAL_NUMBER_CHECKBOX` | Hide the *optional serial number* checkbox | off | — |
| `HIDE_CREATE_ITEM_BY_CATEGORY`, `HIDE_CREATE_GROUP_ITEM`, `HIDE_CREATE_ITEM_BY_CATEGORY_PRICING_SCHEME` | Hide the alternative create modes | off | — |
| `ITEM_CODE_FORMAT` | Pattern for *Create by Category*: placeholders `<category00>` … `<category20>` and `####` for the running number | empty | Codes are generated from category codes plus a running number |
| `RUNNING_NUMBER_GENERATION_METHOD` | `RANDOM_NUMBER_GENERATOR` or `RUNNING_NUMBER_BY_ITEM` | — | How `####` is filled |
| `CREATE_ITEM_BY_CATEGORY_CATEGORY_GROUP_SETTINGS_LIST` / `..._PRICING_SCHEME_SETTINGS_LIST` | Which category groups and pricing schemes the *By Category* create screen asks for | empty | — |
| `ITEM_CATEGORY_CATEGORY_GROUP_SETTINGS_LIST` | Binds each Category slot 0–20 to a category group and marks it mandatory or not; stored in `bl_inv_mst_category_level_setting_hdr` | empty | Changing a slot's group resets that category on every item that used the old group (the UI warns before saving) |
| `GROUP_ITEM_ATTRIBUTE_LIST` | Attribute groups used to generate child variants of a Grouped Item | empty | — |
| `LABEL_TYPE_*` (`CP_COM`, `EMP_CATEGORIES`, `DOC_ITEM`, `LAZADA`, `SHOPEE`) | Which label types the Label tab offers | — | — |
| `ENABLE_EINVOICE_TAB`, `HIDE_EINVOICE_CLASSIFICATION`, `HIDE_EINVOICE_TAX_TYPE_CODE`, `HIDE_EINVOICE_UOM` | E-Invoice tab and its three fields | — | — |
| `DEFAULT_EINVOICE_ITEM_CLASSIFICATION_*`, `DEFAULT_EINVOICE_TAXABLE_TYPE_*`, `DEFAULT_EINVOICE_UOM*` | Tenant defaults pre-filled on the E-Invoice tab of new items | empty | New items are e-Invoice-ready without manual entry |
| `HIDE_TAX_COUNTRY`, `HIDE_INPUT_TAX_*`, `HIDE_OUTPUT_TAX_*`, `HIDE_INPUT_WHT_TAX_*`, `HIDE_OUTPUT_WHT_TAX_*`, `ENABLE_TAX_TWO_PER_ROW` | Fields on the Tax tab | off | — |
| `SHOW_SUPPLIER`, `SHOW_ADDITIONAL_REMARKS_1..4`, `SHOW_MIN_MRP_STOCK_QTY_FORM_FIELD` | Extra fields on create | off | Adds supplier, remarks and minimum stock quantity to the create form |
| `HIDE_PRODUCT_MANAGER`, `HIDE_ABBREVIATION`, `HIDE_CURRENCY`, `HIDE_ITEM_STATUS`, `HIDE_SALES_PROMPT`, `HIDE_PURCHASE_PROMPT`, `HIDE_ALTERNATE_ITEM_CODE_1/2`, `HIDE_PRODUCT_AGING_CYCLE`, `HIDE_CHECK_BOXES`, `HIDE_DESCRIPTION`, `HIDE_REMARKS`, `HIDE_INV_ITEM_CODE`, `HIDE_CREATED_BY`, `HIDE_DISPLAY_OPTION`, `HIDE_CONVERT_BASIC_TO_BUNDLE_BUTTON` | Individual Main-tab fields and the *Convert Basic to Bundle* button | off | — |
| `HIDE_CHILD_ITEM_RATIO`, `HIDE_CHILD_ITEM_DISPLAY_OPTION`, `HIDE_CHILD_ITEM_STATUS`, `HIDE_CHILD_ITEM_*`, `HIDE_BUNDLE_CHILD_ITEM_ADD_*` | Columns and fields on the Child Item and Bundle Config tabs | off | — |
| `HIDE_ENTITY_PRICING_ADD_*`, `HIDE_ENTITY_PRICING_EDIT_*`, `HIDE_ENTITY_PRICING_LIST_*`, `SHOW_ENTITY_PRICING_EDIT_LEAD_TIME`, `ENTITY_PRICING_DEFAULT_ENTITY_TYPE` | Every field of the Entity Pricing add / edit / list screens, and the default entity type | off | Lets a tenant reduce entity pricing to, say, purchase price only |
| `ENABLE_SIMPLIFIED_UI`, `ENABLE_VERTICAL_UI`, `EXPAND_*` (one per tab), `DETAILS_TAB_ORDER` | Layout of the edit screen: simplified / vertical tab layout, which tabs open expanded, and tab order | — | Presentation only |
| `HIDE_ITEM_LISTING_*` (code, name, EAN, type, UOM, status, updated date / by, classification code, Category 0–20, master-detail) | Listing columns | off | Presentation only |

**Costings Tab Settings** — `HIDE_COSTINGS_TAB`, `HIDE_COMPANY_CODE` and one `HIDE_COST_*` / `HIDE_LANDED_*` switch per cost figure (MA, WA, FIFO, LIFO, manual, replacement, last purchase company, landed transaction / MA / WA / FIFO / LIFO price and amount). Each hidden figure can be re-shown to specific users through the matching `SHOW_COST_*` permission.

**Department Settings** — four toggles (Segment, GL Dimension, Profit Center, Project) are present on the screen but are not bound to any stored setting in the current build; they have no effect.

**Item Edit Tab Hidden** — one `HIDE_*` switch per edit tab: `HIDE_LABEL`, `HIDE_TEMPLATE`, `HIDE_ITEM_CATEGORY`, `HIDE_ITEM_CATEGORY_NEW`, `HIDE_MTO_CONFIG`, `HIDE_DELIVERY_CHARGE_CONFIG`, `HIDE_ELIGIBLE_CATEGORIES`, `HIDE_ELIGIBLE_ITEMS`, `HIDE_ELIGIBLE_PRICING_BANDS`, `HIDE_ADD_ON`, `HIDE_ADD_ON_OF`, `HIDE_TAX`, `HIDE_SALES_CONTRACT_TEMPLATE_DETAILS`, `HIDE_DEPRECIATION`, `HIDE_COUPON_DETAILS`, `HIDE_MEMBERSHIP`, `HIDE_DIMENSION_DETAILS`, `HIDE_BUNDLE_CONFIG`, `HIDE_CHILD_ITEM`, `HIDE_MULTI_UOM`, `HIDE_BRANCH_LINKING`, `HIDE_COMPANY_LINKING`, `HIDE_COSTINGS_TAB`, `HIDE_PNS_SETTLEMENT_METHOD`, `HIDE_PRICING_SCHEME`, `HIDE_MANAGE_IMAGE`, `HIDE_ENTITY_PRICING`, `HIDE_T2T_ITEM_MAPPING`, `HIDE_MARKETPLACE`, `HIDE_STOCK_AVAILABILITY`, `HIDE_STOCK_CARD`, `HIDE_ATTRIBUTE`, `HIDE_PAGE`, `HIDE_REVIEWS`. Type-specific tabs (MTO Config, Bundle Config, Child Item, Stock Card, Eligible …) are additionally shown only for their item type.

**Category Group Settings** — `CATEGORY_GROUP_SETTINGS_TYPE_CP_COM`, `_DOC_ITEM`, `_EMP_CATEGORIES`, `_LAZADA`, `_SHOPEE`: which *Type* values the Category Group create form offers.

**Hide Features Based on Permissions** — `HIDE_ADD_NEW_INVENTORY_ITEM`, `DISABLE_EDIT_INVENTORY_ITEM`, `HIDE_CATEGORIES_GRID`, `HIDE_CATEGORY_GROUP_GRID`, `HIDE_PRICING_SCHEME_GRID`, `HIDE_IMPORT_GRID`. When one of these is on, the feature is hidden for everyone **except** users holding the matching `SHOW_*` permission (see below).

**Hide Category Groups** — `HIDE_CAT_0` … `HIDE_CAT_20` hide individual category slots on the item; `HIDE_BROWSE_CATEGORY_LEVEL_ICON`, `ENABLE_CATEGORY_TWO_PER_ROW` are layout.

**Categories Listing Settings** — `CATEGORY_SETTINGS_SHOW_LINK_PRODUCT_ONLY`: the category's Manage Item tab lists only linked products.

**CP Commerce Item Settings** — `SHOW_PRODUCT_WITH_EXTERNAL_URL`, `DEFAULT_CMS_WEBSITE_GUID`, `DEFAULT_CMS_WEBSITE_PRICING_SCHEME_GUID`: the storefront website and pricing scheme used when an item is published to CP Commerce.

Other gear-menu screens: **Default Selection** (per-user or tenant default item type, status and similar for new records), **Custom Resource Bundle Configuration** (override any label in any language), **Custom Field Placement** (where tenant custom fields render), **Spreadsheet View configuration** (the inline spreadsheet editor's columns).

### Document behaviour settings

Not applicable — the applet maintains master records, not posting documents. There are no status-flow, approval, printable or e-Invoice submission switches here; e-Invoice *classification* data is captured on the item and consumed by the document applets.

### Feature visibility / permissions

Client-side permission definitions registered for `DocItemApplet` (assigned per user or role in the permission set). Each `SHOW_*` permission overrides the corresponding `HIDE_*` application setting for the holder:

| Permission | What it unlocks |
|---|---|
| `ENABLE_EDIT_SUB_ITEM_TYPE` | Change an item's sub item type after creation |
| `SHOW_COSTINGS_TAB` | See the Costings tab even when `HIDE_COSTINGS_TAB` is on |
| `SHOW_COMPANY_CODE`, `SHOW_COST_MA_PRICE`, `SHOW_COST_MA_AMOUNT`, `SHOW_COST_WA_PRICE`, `SHOW_COST_WA_AMOUNT`, `SHOW_COST_FIFO_PRICE`, `SHOW_COST_FIFO_AMOUNT`, `SHOW_COST_LIFO_PRICE`, `SHOW_COST_LIFO_AMOUNT`, `SHOW_COST_MANUAL_PRICE`, `SHOW_COST_MANUAL_AMOUNT`, `SHOW_COST_REPLACEMENT_PRICE`, `SHOW_COST_REPLACEMENT_AMOUNT`, `SHOW_COST_LAST_PURCHASE_COMPANY`, `SHOW_LANDED_TXN_PRICE`, `SHOW_LANDED_TXN_AMOUNT`, `SHOW_LANDED_COST_MA_*`, `SHOW_LANDED_COST_WA_*`, `SHOW_LANDED_COST_FIFO_*`, `SHOW_LANDED_COST_LIFO_*` | See the individual cost figure on the Costings tab |
| `SHOW_COMMENTS` | See the Comments column / field when `HIDE_COMMENTS` is on |
| `SHOW_CATEGORIES_GRID`, `SHOW_CATEGORY_GROUP_GRID`, `SHOW_PRICING_SCHEME_GRID` | See the Categories / Category Groups / Pricing Schemes listings when the tenant hides them under *Hide Features Based on Permissions* |

The listing and edit code also consult `SHOW_CAT_0` … `SHOW_CAT_20`, `SHOW_SUB_ITEM_TYPE`, `SHOW_MARKETPLACE`, `SHOW_REMARKS_LISTING`, `SHOW_ADDITIONAL_REMARKS_1..4` and `SHOW_MIN_MRP_STOCK_QTY` as per-column overrides; these are honoured if defined for the tenant but are not part of the standard registered set above.

## Fields

### Create item — Default tab

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item Code | Unique identifier | Yes | Max length only if `ITEM_CODE_MAX_LIMIT` is enabled; backend rejects a blank code (`ITEM_HDR_OBJECT_CODE_IS_NULL_OR_EMPTY`) and a code already used by a non-deleted item (`ITEM_HDR_OBJECT_CODE_ALREADY_EXIST`). Immutable after save unless `EDIT_ITEM_CODE` is on |
| Item Name | Display name | Yes | Max length only if `ITEM_NAME_MAX_LIMIT` is enabled; editable at any time |
| Item Type | See *Item types* | Yes | Immutable after save |
| Sub Item Type | Quantity tracking mode | Yes for Basic Items | Disabled / cleared for types that do not track quantity; editable later only with `ENABLE_EDIT_SUB_ITEM_TYPE` |
| Base UOM | Unit the stock is counted in | Yes | Defaults to `PCS`; alternative units go on the Multi UOM tab |
| Currency | Item currency | Yes | Defaults to `MYR` |
| Description | Long description | No | Max 255 characters |
| Remarks, Additional Remarks 1–4 | Free text | No | Remarks 1–4 appear only when `SHOW_ADDITIONAL_REMARKS_n` is on |
| Product Manager | Person in charge (entity) | No | — |
| GL Code | Default GL account | No (required in practice for Account Code items) | Must be an existing GL code |
| EAN Code | Barcode | No unless `MANDATORY_EAN_CODE` | 7-digit codes accepted only with `ENABLE_EAN_CODE_7_DIGITS` |
| Supplier | Default supplier | No | Shown only when `SHOW_SUPPLIER` is on |
| Min MRP Stock Qty | Minimum stock for replenishment | No | ≥ 0; shown only when `SHOW_MIN_MRP_STOCK_QTY_FORM_FIELD` is on |
| Inventory (checkbox) | Item is stock-tracked | — | Default on; when off, the serialised option is disabled |
| Consignment Item / Required Production / Alternate Item Code | See *Create item* | No | — |
| Voucher (Coupon) link | For Voucher items | — | Picked from the Voucher applet |
| Sales Contract Template | For Sales Contract items | — | — |
| Fixed Asset Category / Type | For Fixed Asset Register items | — | — |
| Formula / sub-formulas | For MTO / computed items | — | Each sub-formula needs a key and a formula |

### Edit item — Main tab

Same fields as create, plus: **Inv Item Code** (the linked inventory item, read-only), **Item Status** (`ACTIVE`, `INACTIVE`, `OBSOLETE`), **Abbreviation** (max 255), **Alias Item**, **Sales Prompt** / **Purchase Prompt** (prompt text stored with the item for sales and purchase screens), **Comments**, **Ecomsync** / **Require Delivery** / **Require Production** checkboxes, **Created By** and **Date Created** (read-only).

### Edit item — Tax tab

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Tax applicable | Enables the tab's fields | — | — |
| Country | Tax jurisdiction | No | — |
| Input tax code / type / rate | Tax on purchases of this item | No | Codes from Tax Configuration; rate is read from the code |
| Output tax code / type / rate | Tax on sales of this item | No | Same |
| Output WHT code / type / rate, Input WHT code / type / rate | Withholding tax | No | Same |

### Edit item — E-Invoice tab

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item Classification | LHDN classification code and description | Needed for e-Invoice submission | From the Classifications list; tenant default `DEFAULT_EINVOICE_ITEM_CLASSIFICATION_*` |
| Taxable Type Code | LHDN tax type | Needed for e-Invoice submission | Tenant default `DEFAULT_EINVOICE_TAXABLE_TYPE_*` |
| E-Invoice UOM | LHDN UOM code | Needed for e-Invoice submission | Tenant default `DEFAULT_EINVOICE_UOM` |

### Edit item — Multi UOM tab

| Field | Meaning | Required | Notes |
|---|---|---|---|
| UOM | Alternative unit | Yes | — |
| Ratio | Number of base units in one of this unit | Yes | — |
| Status | Active / inactive | Yes | — |
| Sort Code | Ordering from smallest unit (`001`) upward | No | — |
| EAN Code | Barcode for this unit | No | — |
| E-Invoice UOM | LHDN UOM code for this unit | No | — |

Fields for the remaining tabs (Category, Label, Dimension, Pricing Scheme, Entity Pricing, Marketplace, T2T, Costings) are described under *Screens and menus*.

## Lifecycle and posting

A doc item is a master record; it never posts to the General Ledger by itself. Its **status** is a plain attribute:

| Status | Meaning |
|---|---|
| `ACTIVE` | Selectable on documents |
| `INACTIVE` | Kept for history; not offered for new documents |
| `OBSOLETE` | Discontinued |
| `TEMP` | Parked by the temp-save feature until completed |
| `DELETED` | Soft-deleted; its code can be reused by a new item |

Item code uniqueness is enforced by the backend among non-deleted items only. When an item is saved, the backend also validates any GL code and inventory-item link it carries and, on update, pushes relevant changes to the linked inventory item asynchronously. GL posting for an *Account Code* item happens on the document that uses it, not here.

## Related applets

- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) — the stock-side twin; a stock-tracked doc item points at one inventory item and category groups are shared.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — supplies every tax code selectable on the Tax and Entity Pricing tabs.
- [Chart of Accounts](/applets/master-data/chart-of-account-applet/) — supplies the GL code on the Main tab and the account behind *Account Code* items.
- [Organisation](/applets/master-data/organisation-applet/) — companies and branches for visibility linking.
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) and [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) — what the read-only Stock Availability and Stock Card tabs display.
- [Pricebook](/applets/master-data/pricebook-applet/) — builds price lists from items and pricing schemes.
- [POS General](/applets/sales-workflow/pos-general-applet/) — sells the items; its settings choose which pricing scheme supplies retail / min / max price.
- [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — the storefront that consumes categories, images, attributes, search filters and reviews.
- [T2T Admin](/applets/integrations/t2t-admin-applet/) — grants the tenant links that T2T Item Mapping relies on.
- [Voucher Management](/applets/membership/voucher-management-applet/) — stock in / out of Voucher-type items.
- [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) — submits documents whose lines carry the item's classification, taxable type and UOM.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Save fails with an "item code already exists" error although the code is not in the listing | The listing is filtered (for example to `ACTIVE`) and the code belongs to an `INACTIVE`, `OBSOLETE` or `TEMP` item; only `DELETED` items free their code | Switch the listing status filter to *All*, find the item, and reuse or rename it |
| Item is missing from POS or a sales document at one branch | The item is company-linked or branch-linked and the branch is not covered | Check Branch Linking and Company Linking; remember company linking exposes the item to *all* branches of that company |
| Item is visible at branches it should not be | Company Linking is set together with Branch Linking | Clear Company Linking and keep only the intended branches under Branch Linking |
| Category dropdown on the item is empty | The category slot (Category *n*) is not bound to a category group in Application Settings, or the group has no categories | Bind the slot under *Items Settings* → Category Group settings, then create categories in that group |
| Items lost their category after a settings change | The category group bound to a slot was changed; the applet resets that slot on every item that used the old group (it warns before saving) | Re-import the links with the *Doc Item Category Link* template |
| e-Invoice submission rejects the line for a missing classification / UOM | The item's E-Invoice tab is empty and no tenant defaults are set | Fill the E-Invoice tab, or set `DEFAULT_EINVOICE_*` in Application Settings so new items are pre-filled; bulk-fix existing items by import |
| A tab described on this page is not visible | It is hidden by a `HIDE_*` setting, or it is type-specific (Stock Card is Basic Item only; MTO Config, Bundle Config, Child Item and Eligible… tabs follow their item type) | Check *Item Edit Tab Hidden* in Application Settings and the item type |
| Costings tab or a cost column is not visible to a user | `HIDE_COSTINGS_TAB` / `HIDE_COST_*` is on and the user lacks the matching `SHOW_*` permission | Grant `SHOW_COSTINGS_TAB` and the needed `SHOW_COST_*` permissions to that user |
| Sub item type cannot be changed on an existing item | Changing it is gated by the `ENABLE_EDIT_SUB_ITEM_TYPE` permission | Grant the permission or leave the item as created |
| Optional serial number checkbox is confusing | Enabling it means a serial number is **not** required on transactions for this item | Leave it off for items that must be serial-tracked |
| Listing pagination is slow (several seconds per page) on a large catalogue | The listing eagerly aggregates pricing, remarks and marketplace data per row; with many pricing-scheme links per item this dominates | Reduce visible columns (`HIDE_ITEM_LISTING_*`), filter by status, and report the tenant to support — the backend query has been the subject of a performance fix |
| Import with labels or MTO category listing fails | Known defect in older builds, fixed in the applet repository in 2026 | Update to the current applet build |

## Related documentation

- [Core module](/modules/core/) — where the item master sits among the other master-data applets.
- [Inventory module configuration](/modules/inventory/configuration/) and [E-Commerce module configuration](/modules/ecommerce/configuration/) — module-level setup that starts with items.
- [E-Invoice module configuration](/modules/e-invoice/configuration/) — item classification requirements.
- [POS module configuration](/modules/pos/configuration/) — which pricing schemes POS reads.
