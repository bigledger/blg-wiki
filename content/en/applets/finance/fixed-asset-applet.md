---
title: "Fixed Asset"
description: "Reference for the Fixed Asset applet — the asset register, asset categories, per-asset depreciation configuration and schedule, the monthly depreciation run, the file import and the asset report."
applet_code: "FixedAssetRegisterApplet"
page_type: applet
applet_repo: "blg-applet-wavelet-asset-register-applet"
modules: [financial-accounting]
related_applets:
  - chart-of-account-applet
  - ledger-and-journal-applet
  - internal-purchase-invoice-applet
  - organisation-applet
  - employee-applet
  - inv-item-maintenance-applet
  - financial-report-applet
guides: []
sources:
  screens:
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/app.routing.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/services/asset-register-pages.service.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/services/depreciation-run-pages.service.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/edit-asset/edit-asset-register.component.html
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/listing-asset/asset-listing.component.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/reports/reports-listing/reports-listing.component.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-import-container/asset-register-import-listing/asset-register-import-listing.component.ts
  configuration:
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/app.module.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-shared-utilities/modules/settings/settings.component.html
    - blg-shared-utilities/modules/settings/feature-visibility/feature-visibility.component.html
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/FixedAssetPermissions.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/fixedAsset/FixedAssetRegisterController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/fixedAsset/FixedAssetDepreciationRunLineController.java
  fields:
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/create-asset/item-details/item-details.component.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/create-asset/item-details/item-details.component.html
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/create-asset/create-asset.component.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/edit-asset/edit-details/edit-details.component.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/edit-asset/edit-details/edit-details.component.html
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/edit-asset/edit-depreciation/configuration/configuration.component.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/edit-asset/edit-depreciation/configuration/configuration.component.html
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/edit-asset/edit-transactions/add-transaction/add-transaction.component.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/category-container/asset-category-create/item-cat-create.component.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/sdk/ERP/asset-register/asset-register-constants.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/models/dbschema/bl_fi_fixed_asset_register_import_file_helper.model.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/fixedAsset/FixedAssetDepreciationProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/FixedAssetDepreciationRunLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/FixedAssetRegisterService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/FixedAssetUows/FixedAssetRegisterUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/criteria/BaseQueryCriteria.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FixedAssetDataConsistencyObjects/FixedAssetRegisterHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/JournalDataConsistencyObjects/JournalDataConsistencyObject.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/erp/FixedAssetRegisterItemTypeJobProcessor.java
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/utils/jrnl-line-utils.ts
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/components/asset-register-container/edit-asset/edit-other-journal/add-other-journal/add-other-journal.component.ts
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/finance/fixedAssetFileImport/FixedAssetFileImportServiceHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/FixedAssetErrorCodesConstants.java
    - blg-applet-wavelet-asset-register-applet/micro-fe/projects/wavelet-erp/applets/asset-register-applet/src/app/services/api-service.ts
tags:
- asset-management
- fixed-assets
- depreciation-run
- asset-lifecycle
- financial-reporting
weight: 160
---

## Overview

The Fixed Asset applet keeps the register of a tenant's capitalised assets — what was bought, which
company, branch and location holds it, which employee is responsible for it, what it cost, how it
depreciates and which GL codes its depreciation posts to. It is opened by the finance team that
owns the fixed-asset ledger, usually after a purchase invoice has been finalised.

It is **not** a generic document applet. It has no document type, no `FINAL` status, no numbering
series and no `*DataConsistencyObject` quantity or amount signums. It owns its own tables
(`bl_fi_fixed_asset_register_hdr`, `bl_fi_fixed_asset_register_depreciation_config`,
`bl_fi_fixed_asset_depreciation_schedule`, `bl_fi_fixed_asset_register_depreciation_run_hdr` and
`_line`, `bl_fi_fixed_asset_category`, plus attachment and import tables) and writes journals
directly through the journal endpoint.

Assets reach the register three ways: created by hand on the Asset Register screen, uploaded through
the **Import Fixed Asset** CSV screen, or converted automatically from a finalised Purchase Invoice
(Internal) line whose item is flagged as a fixed-asset item.

## Where it fits

| Direction | What | Why |
|---|---|---|
| Upstream | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | A line whose item transaction type is `FIXED_ASSET_REGISTER` can be converted into a DRAFT asset record |
| Upstream | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | The item's `property_json` carries the `type` and `category_guid` copied onto the converted asset |
| Upstream | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Supplies the asset GL code, the depreciation-expense GL code and the accumulated-depreciation GL code |
| Upstream | [Organization](/applets/master-data/organisation-applet/) | Company, branch and location; the company's `FIXED_ASSET_REGISTER` default GL link used by the purchase conversion |
| Upstream | [Employee](/applets/master-data/employee-applet/) | The person-in-charge drop-down reads entity headers |
| Downstream | [Ledger and Journal](/applets/finance/ledger-and-journal-applet/) | Every acquisition, adjustment, disposal, other journal and depreciation line lands here as a journal |
| Downstream | [Financial Report](/applets/finance/financial-report-applet/) | Depreciation expense and accumulated depreciation reach the P&L and balance sheet through the ledger |

## Screens and menus

The applet mounts at `applet/tnt/wavelet/erp/asset-register-applet` and its sidebar has five entries.

| Menu | Route | What it shows |
|---|---|---|
| Asset Register | `asset-register` | The asset listing, plus create and edit |
| Asset Category | `asset-category` | The category master |
| Depreciation Run | `depreciation-run` | Monthly run headers and their result lines |
| Reports | `reports` | The fixed-asset report with PDF and XLS export |
| Import Fixed Asset | `file-import` | CSV upload and the per-row staging grid |

### Asset Register

The listing columns are Asset Code, Asset Name, Category, Company, Location, Purchase Date,
Purchase Price, Depreciation Method and Asset Status. It is an ag-Grid server-side grid with an
advanced-search panel over company, branch, location, purchase-date range and asset-code range.

{{< figure src="/images/fixed-asset-applet/asset_register_create.png" title="Create New Asset" alt="The New Asset form beside the asset register listing, showing Asset Status fixed to DRAFT and the required Asset Name, Type, Category, Company, Branch, Location and Currency controls" >}}

The create screen has a single **Details** tab. Two further tabs — Depreciation (Configuration and
Schedule) and Transactions — exist in the template but are commented out, so depreciation cannot be
configured until after the asset has been created.

{{< figure src="/images/fixed-asset-applet/asset_register_edit.png" title="Edit Asset Register" alt="The Edit Asset Register form showing Asset Status, Asset Code, Asset Name, Type, Category, Company, Branch, Location, Purchase Date and Purchase Price" >}}

The edit screen has six tabs, whose order is controlled by the Default Selection setting
(see [Configuration](#configuration)):

| Tab | What it does |
|---|---|
| Details | The asset master fields |
| Transactions | Acquisition, Adjustment, Asset Held for Sale and Disposal — each writes a journal |
| Depreciation → Configuration | Method, averaging method, rate, useful life, residual value and the two depreciation GL codes |
| Depreciation → Schedule | One row per month that this asset is eligible for depreciation |
| Attachment | Files uploaded against the asset |
| Related Doc | Links to existing generic documents |
| Other Journal | A free-form journal against the asset |

There is no delete button on the edit screen — the markup is commented out.

{{< figure src="/images/fixed-asset-applet/transactions-tab.png" title="Transactions tab — Add Transaction" alt="The Add Transaction panel with Transactions Type set to Acquisition and Purchase Date, Purchase Price, GL Code and Description fields" >}}

{{< figure src="/images/fixed-asset-applet/depreciation-tab-schedule.png" title="Depreciation tab — Schedule" alt="The Depreciation Schedule grid beside the Add Depreciation panel with From and To month pickers" >}}

The Add Depreciation panel adds **one month at a time**: it takes a single month/year and writes one
`bl_fi_fixed_asset_depreciation_schedule` row with that month's first and last day. There is no
"generate the whole schedule" action.

{{< figure src="/images/fixed-asset-applet/attachment-tab.png" title="Attachment tab" alt="The Attachment grid beside the Add Attachment panel with an Attachment Name field, a Details field and a drag-and-drop upload area" >}}

{{< figure src="/images/fixed-asset-applet/other-journal-tab.png" title="Other Journal tab" alt="The Other Journal grid beside the Add Other Journal panel with Date, Description, Amount Paid, GL Code and a Payment Breakdown section" >}}

### Asset Category

{{< figure src="/images/fixed-asset-applet/asset_category_listing.png" title="Asset Category listing" alt="Asset Register Category Listing with Category Code, Category Name, Creation Date, Modified Date and Status columns" >}}

Categories carry a code, a name, a description and a status of `ACTIVE` or `INACTIVE`. Code, name
and status are required.

### Depreciation Run

{{< figure src="/images/fixed-asset-applet/depreciation_run_listing.png" title="Depreciation Run listing" alt="Depreciation Run Listing with Company, Branch, Month and Year columns" >}}

A run header holds only Company (required), Branch (optional) and a month/year picker. Opening a run
shows a read-only Main tab and a **Lines** tab; the `+` button on the Lines tab opens the
**Registered Assets** listing, and the `RUN` button lives there — not on the run header. That is the
only place the run is triggered from.

### Import Fixed Asset

{{< figure src="/images/fixed-asset-applet/file_import_screen.png" title="Fixed Asset Register file import listing" alt="Fixed Asset Register File Import Listing with File Name, File Size, Format, Status and Process Status columns" >}}

Columns are File Name, File Size, Format, Status, Process Status, User Error Message, Created Date
and Updated Date. A blank template is downloadable from
`fa/import-file-hdr/backoffice-ep/download-master-data-template`.

### Reports

{{< figure src="/images/fixed-asset-applet/reports_screen.png" title="Reports" alt="The fixed-asset report grid grouped by Company and Category Code, with Export PDF and Export XLS buttons" >}}

The report is a grouped ag-Grid (Company → Category Code) over Asset Code, Asset Name, Asset Status,
Depreciation Method, Averaging Method, Purchase Date, Disposal Date, Useful Life, Purchase Price,
Residual Value, Depreciation Month, Depreciation Year and Depreciation Amount, with PDF and XLS
export.

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters here |
|---|---|---|
| A chart of accounts with an asset GL code, a depreciation-expense GL code and an accumulated-depreciation GL code | [Chart of Account](/applets/master-data/chart-of-account-applet/) | All three drop-downs are filtered by the company's chart of accounts; the GL code is required on the edit screen and both depreciation GL codes are required on the Configuration sub-tab |
| Company, branch and location | [Organization](/applets/master-data/organisation-applet/) | Company, Branch and Location are required on the asset form |
| A company `FIXED_ASSET_REGISTER` default GL link | [Organization](/applets/master-data/organisation-applet/) → Company | Only used by the purchase-invoice conversion. If the link is missing the backend creates a GL code named "Fixed Asset Register" and the company link for it rather than failing |
| A primary ledger for the company (`obj_type = 'PRM'`) | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Every journal this applet writes is stamped with it; the depreciation processor and the journal endpoint both look it up by company |
| At least one asset category | This applet → Asset Category | Category is required on the asset form |
| Employee entities | [Employee](/applets/master-data/employee-applet/) | Only needed if you want a person-in-charge on the asset |

### Applet settings

Settings are **applet-local**. `app.routing.ts` imports the applet's own
`FieldConfigurationComponent` and `DefaultSettingsComponent` from `components/settings-container/`,
not the shared `FieldConfigurationComponent` from `blg-shared-utilities`, and `AppletSettingsModule`
is imported by `AppModule`, so the screens do render. Only a tenant user who can reach
*Settings* can change them; they are tenant-wide, not per user.

**Field Settings is a non-functional stub.** Its component class has an empty constructor, no form,
no store and no save handler; its template renders eight `mat-slide-toggle` controls (Unit Discount,
SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) with no
`formControlName` and no `[(ngModel)]`, and a SAVE button with no `(click)` binding. Nothing on that
screen is read, written or persisted. This is the same unbound eight-toggle stub found in several
other master-data applets. The eight labels do not correspond to anything in the fixed-asset form.

Default Selection is real. It writes to `APPLET_SETTINGS` through `saveMasterSettingsInit`:

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `ASSET_REGISTER_DETAILS_TAB_ORDER` | The order of the six tabs on the Edit Asset screen | The declared order: Details, Transactions, Depreciation, Attachment, Related Doc, Other Journal | The edit screen reads the saved list, drops entries whose `content` no longer exists and appends any newly added tab at the end |
| `DEFAULT_BRANCH` | Nothing in this applet | Empty | Declared, rendered as a branch drop-down and saved, but no component or service in the applet reads it back. Creating an asset still starts with an empty Branch |
| `DEFAULT_LOCATION` | Nothing in this applet | Empty, then patched from the selected branch's `MAIN_LOCATION` extension when you pick a branch | Declared, rendered and saved; never read back |

`DEFAULT_COMPANY` is patched into the settings form when a branch is chosen and is therefore saved
too, but it has no control on the screen and no reader anywhere in the applet.

Keys read at runtime without a control: none. Every remaining key in
`models/applet-settings.model.ts` — the `INCLUDE_*`, `ENABLE_*`, `PRINTABLE`, and the fifty custom
status keys (`ENABLE_CUSTOM_STATUS_*`, `NAME_CUSTOM_STATUS_*`, `LIST_CUSTOM_STATUS_*`) — is
**model-only**: it appears in the TypeScript interface and nowhere else in the applet. It is not
rendered, not saved and not read.

### Personalization

The Personalization menu lists **Field Settings** and **Default Selection**. Two problems, both in
the applet's own code:

- `personalizationItems` points its first entry at `field-settings`, but the personalization route
  has no such child (its children are `personal-default-selection` and `sidebar`), so the link falls
  through to the applet's `404` page.
- The Personal Default Selection screen never assigns `appletContainer` — the subscription that
  would populate it is commented out — so its branch and location value-change handlers dereference
  `undefined` the moment you touch either drop-down, and its SAVE emits `undefined`. No personal
  default is ever stored.

The `sidebar` route is wired but is not listed in the Personalization menu.

### The settings menu is partly unroutable

The settings shell (`app-settings` in `blg-shared-utilities`) renders the applet's own groups plus
its own fixed groups. At the shared-utilities commit this applet pins (`04bb553`, 2026-07-20) the
menu is:

| Group | Item | Route exists in this applet? |
|---|---|---|
| System Configuration | Field Settings | yes (the stub above) |
| System Configuration | Default Selection | yes |
| Server Side Permissions | Permission Wizard | **no** — falls through to the applet's 404 |
| Server Side Permissions | Permission Set | yes |
| Server Side Permissions | User Permission | yes |
| Server Side Permissions | Role Permission | yes |
| Developer Tools | Release Notes | **no** — falls through to the applet's 404 |
| Developer Tools | Applet Log | **no** — falls through to the applet's 404 |

Conversely, three routes exist with no menu link: `feature-visibility`, `webhook` and
`team-permission-listing`. `feature-visibility` is the default redirect for `settings`, so opening
Settings lands on the Feature Visibility screen ("Teams — Manage Team Access") even though nothing in
the menu points there; that screen's SAVE button also has no `(click)` handler.

At shared-utilities HEAD the Applet Log entry is removed. Earlier builds also rendered Client Side
Permissions (Applet Access, Role Pricing Scheme Linking, Teams, Roles), an Integration → Triggers
entry and Reset Applet State; all of those are commented out in the shared component and no longer
render.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Company default GL link `FIXED_ASSET_REGISTER` | Organization → Company | The asset GL code used by the purchase-invoice conversion. Created automatically if absent |
| Item `property_json.type` and `property_json.category_guid` | Inventory Item Maintenance | Copied onto assets created by the purchase-invoice conversion. The category is only applied if the GUID resolves to an existing, readable category |
| Applet trigger configuration for the `FIXED_ASSET_REGISTER_ITEM_TYPE` subscriber | Applet Trigger configuration (tenant) | Whether finalising a Purchase Invoice (Internal) automatically creates asset records. Without an enabled subscriber link the conversion never runs |

### Feature visibility and permissions

No client-side permission definitions are seeded for this applet, and the applet contains no
`SHOW_*`/`HIDE_*` permission constants. All access control is server-side, through the permission
families below. Each endpoint accepts the `OWNER` and `ADMIN` variants in addition to the one named.

| Family | Gates |
|---|---|
| `API_TNT_DM_FA_HEADER_*` | The asset register header endpoints (`fa/fixed-asset-registers/headers/backoffice-ep`) |
| `API_TNT_DM_FA_REGISTER_*` | The asset container endpoints, the by-depreciation-schedule query and the report |
| `API_TNT_DM_FA_CATEGORY_*` | Asset categories |
| `API_TNT_DM_FA_CONFIG_*` | Per-asset depreciation configuration |
| `API_TNT_DM_FA_SCHEDULE_*` | Depreciation schedule rows |
| `API_TNT_DM_FA_ATTACHMENT_*` | Asset attachments |
| `API_TNT_DM_FA_DEPRECIATION_RUN_HDR_*` | Depreciation run headers |
| `API_TNT_DM_FA_DEPRECIATION_RUN_LINE_*` | Depreciation run lines. The **RUN** button needs the `CREATE` variant, not `UPDATE` |
| `API_TNT_DM_FA_CATEGORY_DEPRECIATION_CONFIG_*` | Category-level depreciation configuration (no screen in this applet) |
| `API_TNT_DM_ERP_FIXED_ASSET_IMPORT_FILE_HDR_READ` | The file-import listing |

{{< callout type="warning" >}}
`GET fa/fixed-asset-registers/purchase/{genericDocGuid}` — the endpoint that converts a purchase
invoice into asset records — is declared as an `AnonymousTenantEndpoint`. It performs no permission
check and returns `OK` whether or not the document exists or the conversion succeeded.
{{< /callout >}}

## Fields

### Details tab (create)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Asset Status | Lifecycle status | — | Fixed to `DRAFT` and disabled on create |
| Asset Code | The asset's identifier | No | If left blank the applet generates a random base-36 string (`Math.random().toString(36)`, upper-cased) — not a document-numbering series. Uniqueness is checked in the browser against the currently loaded listing only, so the "Asset Code already exists!" toast can miss a duplicate |
| Asset Name | Free text | Yes | Max 255 |
| Type | `PROPERTY_PLANT_EQUIPMENT`, `LONG_TERM_INVESTMENT` or `INTANGIBLE_ASSET` | Yes | |
| Category | Asset category | Yes | From this applet's Asset Category screen |
| Company | Owning company | Yes | |
| Branch | Owning branch | Yes | |
| Location | Stock location | Yes | Filtered by the selected branch |
| Employee | Person in charge | No | Selecting one also fetches and stores the entity's name as `pic_name` |
| Currency | Document currency | Yes | |
| GL Code | The asset's balance-sheet GL code | No on create, **yes on edit** | The drop-down is labelled `GL Code*` on create but the control carries no `Validators.required`, so an asset can be created without one |
| Segment, Dimension, Project, Profit Center | Analysis dimensions | No | Loaded for the company's chart of accounts |
| Serial Number | Free text | No | A barcode scanner (Quagga) can fill it |
| Warranty Expiry | Date | No | |
| Description | — | No | **Has no input control.** The template renders an empty `<div formControlName="descr">` on both the create and the edit screen, so a description can never be typed in. The value is still copied into the request, always empty |

Purchase Date and Purchase Price are not on the create form. The applet sends `purchase_date = today`
and `purchase_price = 0` — together with `depr_method = "DRAFT"`, `depr_ave_method = "DRAFT"`,
`depr_rate = 0` and `useful_life = 0` — because the backend rejects nulls for all six
(`FIXED_ASSET_HDR_PURCHASE_DATE_IS_NULL_OR_EMPTY`,
`FIXED_ASSET_HDR_DEPRECIATION_METHOD_IS_NULL_OR_EMPTY`, and so on). `"DRAFT"` is not a valid
depreciation method; it is a placeholder that keeps the create call from failing.

### Details tab (edit)

Same fields, with four differences: Asset Status becomes a drop-down offering **Draft** and
**Registered**; GL Code becomes required; and Purchase Date and Purchase Price appear but are
`readonly` — both are set by an Acquisition transaction, by the CSV import, or by the
purchase-invoice conversion.

### Depreciation → Configuration

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Depreciation start date | First date the asset may depreciate | Yes | |
| Depreciation Method | `NO_DEPRECIATION`, `STRAIGHT_LINE`, `DECLINING_BALANCE`, `DOUBLE_DECLINING_BALANCE` | Yes | See [Lifecycle and effects](#lifecycle-and-effects) for which of these the processor actually implements |
| Residual Value | Salvage value | No | Used both as the depreciable-base deduction and as the run's stop condition |
| Averaging method | `ACTUAL_DAY` or `FULL_MONTH` | Yes | Radio buttons |
| Depreciation Rate (%) | Periodic rate | No | Used only by the two declining-balance methods, and used as a **plain multiplier against book value each month** — it is not divided by 12 or by 100 |
| Useful Life (Years) | Life in years | No | Used only by straight line; the processor divides by `useful_life × 12` |
| GL Code for Depreciation Expense | Debit side of the depreciation journal | Yes | |
| GL Code for Accumulation Depreciation | Credit side | Yes | |

Saving the edit screen writes these values to **both** the asset header and the
`bl_fi_fixed_asset_register_depreciation_config` row, as two independent, unsequenced HTTP calls
with no error handling — if the configuration call fails the header change is still saved.

### Transactions tab

| Field | Applies to | Notes |
|---|---|---|
| Transactions Type | all | `ACQUISITION`, `ADJUSTMENT`, `ASSET_HELD_FOR_SALE`, `DISPOSAL`. Required |
| Date | all | Label changes to Purchase / Start / Adjustment / Disposal Date. Required |
| Purchase Price | Acquisition | Also written back onto the asset header |
| Recoverable Amount, Adjusted Amount | Adjustment | Adjusted Amount is read-only and computed |
| Asset Value | Asset Held for Sale | Triggers the gain/loss calculation |
| Disposal Price | Disposal | Triggers the gain/loss calculation |
| Gain/Loss | Disposal, Asset Held for Sale | Read-only |
| GL Code | all | The contra GL code for the journal |
| Description | all | |

### Import Fixed Asset (CSV columns)

`code`, `name`, `type`, `category_code`, `company_code`, `branch_code`, `location_code`, `currency`,
`gl_code`, `purchase_date`, `purchase_price`, `serial_number`, `warranty_expiry`, `employee_name`,
`description`.

Only `code` and `name` are checked for emptiness up front. Every code column is resolved by lookup
and throws a specific message on failure — `<INVALID CATEGORY CODE>`, `<INVALID COMPANY CODE>`,
`<INVALID HDR BRANCH CODE>`, `<INVALID LOCATION CODE>`, `<INVALID GL CODE>`, `<INVALID EMPLOYEE
NAME>`, `<INVALID LEDGER CODE>`. The employee is matched on **name**, not code. The GL code is
matched on `gl_code_1`. If no subledger exists for the resolved GL code and company, the import
creates one.

There are no depreciation columns in the import. Imported assets have no depreciation configuration
and no schedule, so they will not be picked up by a depreciation run or appear in the report until
both are added by hand.

## Lifecycle and effects

### Asset statuses

`DRAFT` → `REGISTERED` → (`DEPRECIATED`, set by the depreciation processor). `bl_fi_fixed_asset_register_hdr.fixed_asset_status`
also accepts `ACTIVE` and `INACTIVE` in the shared constants, but the UI drop-down offers only Draft
and Registered.

The Save button on the edit screen is enabled when:

- status is `DRAFT` and the Details form is valid; or
- status is `REGISTERED` and the Details form is valid **and** the Depreciation Configuration form is
  valid **and** at least one row exists on the Transactions tab.

So an asset cannot be promoted to REGISTERED until it has a complete depreciation configuration and
at least one transaction.

### What creates a journal

There is no posting handler, no `JournalPostingTypeHandler` entry and no company `posting_final_json`
involvement. Every journal is assembled and sent by the applet or by the depreciation processor.

**Transactions tab** — the browser builds the journal lines, sums them, refuses to send if debits do
not equal credits (a client-side toast, *"Journal Transaction is not balanced"*), and then `POST`s to
`core2/tnt/dm/erp/fi/journals`:

| Type | Debit | Credit | Amount |
|---|---|---|---|
| Acquisition | asset GL code | the GL code you pick | Purchase Price. Also writes Purchase Date and Purchase Price onto the asset header |
| Adjustment (amount ≥ 0) | the GL code you pick | asset GL code | Adjusted Amount |
| Adjustment (amount < 0) | asset GL code | *(undefined)* | Absolute Adjusted Amount. The credit GL code is read from a local variable that is declared and never assigned, so the line goes out with no GL code and the backend rejects the journal |
| Disposal | asset GL code, at the acquisition amount | the GL code you pick, at the Disposal Price | plus a gain/loss line on the GL code you pick for it |
| Asset Held for Sale | asset GL code, at the acquisition amount | the GL code you pick, at the Asset Value | plus a gain/loss line |

Disposal does **not** reverse accumulated depreciation; the entry is written against the acquisition
amount, not the net book value.

**Other Journal tab** — a free-form journal with `txn_type = 'TXN'`: one "main" line plus any number
of Payment Breakdown rows, each line debited if its amount is positive and credited if negative, with
the same client-side balance check.

All of these lines are sent with a null `sub_ledger_guid`. That is fine: `JournalService.createJournal`
resolves the subledger from the line's GL code and company, and creates one if none exists.

**Depreciation run** — see below.

### The depreciation run, step by step

1. You create a run header: company (required), branch (optional), month and year.
2. You open the run, go to the Lines tab, press `+`, and press **RUN** on the Registered Assets
   screen. That calls `GET core2/tnt/dm/fi/fa/depreciation-runs/lines/run/{runHdrGuid}`, gated by
   `API_TNT_DM_FA_DEPRECIATION_RUN_LINE_CREATE`.
3. The backend deletes every existing line on that run **and permanently deletes the journals those
   lines produced**, then rebuilds.
4. It selects the assets to process with a three-way inner join: asset header × depreciation config ×
   a depreciation-schedule row for that month and year. An asset with no configuration, or no
   schedule row for the month, is silently skipped.
5. One run line is created per selected asset, copying the method, averaging method, rate, useful
   life, residual value, purchase price, purchase date and disposal date onto the line, and each line
   is queued to the `FIXED_ASSET_DEPRECIATION_PROCESSOR` job with `RUN_NOW`.

{{< callout type="warning" >}}
**The selection ignores the run's company and branch, and is capped at 100 assets.**
`createDepreciationLine` sets only the month and year on the query criteria, leaving company, branch
and location null, and never overrides the default page size of 100 inherited from
`BaseQueryCriteria`. A run therefore processes at most 100 assets — from *every* company in the
tenant, ordered by asset GUID — while stamping the run header's company and branch onto every journal
it writes.
{{< /callout >}}

### What the depreciation processor computes

| Averaging method | Straight Line | Declining Balance | Double Declining Balance |
|---|---|---|---|
| `FULL_MONTH` | `(purchase price − residual value) ÷ (useful life × 12)` | `(purchase price − accumulated depreciation) × rate` | `(purchase price − accumulated depreciation) × rate × 2` |
| `ACTUAL_DAY` | `(purchase price − residual value) ÷ days in month × days` | **returns zero** | **returns zero** |

`calculateMonthlyDepreciationAveragingActualDays` only has a branch for `STRAIGHT_LINE`; for any other
method it returns `BigDecimal.ZERO`. `NO_DEPRECIATION` returns zero under both averaging methods, as
intended.

The rate is applied as written: `bookValue.multiply(depr_rate)` once per month, with no division by
12 and no division by 100. A rate captured as an annual percentage will depreciate far too fast.

### The stop condition, and the status flip

After computing the month's amount the processor sums all *earlier* run lines for the asset, adds the
new amount, and then branches on

```
newAccumulatedDepreciation ≤ residual_value
```

- **True** — it saves the amount, the new accumulated depreciation and the net book value
  (`purchase price − accumulated depreciation`) on the run line, writes the accumulated depreciation
  back onto the asset header, sets the asset's status to `DEPRECIATED`, and creates the journal.
- **False** — it sets the asset's status to `DEPRECIATED` and then **permanently deletes** every run
  line for that asset dated on or after this month, together with their journals. No journal is
  created for this month.

With the usual residual value of zero, any positive depreciation amount makes the comparison false on
the very first run. The asset is marked `DEPRECIATED` and no depreciation journal is written.

### The depreciation journal

| Property | Value |
|---|---|
| Header `txn_type` | `DEPRECIATION` |
| Header `auto_flag` | `AUTO` |
| Header `posting_status` | `POSTED` |
| Header `descr`, line `descr` | `AUTO CREATED FROM FIXED ASSET DEPRECIATION PROCESSOR` |
| Header dates | `date_txn` and `date_txn_doc` = the run line's depreciation start date; `date_posting` = now |
| Header company, branch | From the **run header**, not the asset |
| Ledger | The company's `PRM` ledger |
| Debit line | GL code `fi_depr_glcode_guid` on the **asset header**, subledger `fi_depr_subledger_guid` |
| Credit line | GL code `fi_acc_depr_glcode_guid` on the asset header, subledger `fi_acc_depr_subledger_guid` |
| Analysis dimensions | Segment, dimension, project and profit centre from the asset header |
| Back-references | `bl_fi_jrnl_hdr.far_hdr_guid`, `bl_fi_jrnl_hdr.far_depr_run_line_guid`, `bl_fi_jrnl_line.far_hdr_guid` |

{{< callout type="warning" >}}
**Each depreciation line is added to the journal only if its subledger GUID is non-null**
(`Optional.ofNullable(line.getSub_ledger_guid()).ifPresent(...)` in `createJournal`), and nothing in
the applet or in the backend ever writes `fi_depr_subledger_guid` or `fi_acc_depr_subledger_guid` on
`bl_fi_fixed_asset_register_hdr` — the applet's Configuration tab writes only the two GL codes. A
grep of the whole Java tree finds those two columns read, filtered and foreign-key checked, never
set. Unless a tenant populates them through the API directly, both lines are dropped and the run
creates a journal header with no lines and zero debits and credits. The journal validator does not
reject an empty or unbalanced journal, so nothing surfaces an error.

The two lines are also merged when they share a subledger: `createJournal` groups lines by
`sub_ledger_guid` and sums debits and credits into the first line it saw, keeping that line's GL code.
{{< /callout >}}

### Asset creation from a purchase invoice

`FixedAssetRegisterService.createAssetRegisterFromDocLine` runs over a generic document and picks the
lines where `item_txn_type = FIXED_ASSET_REGISTER` **and** `server_doc_type = INTERNAL_PURCHASE_INVOICE`.
For each such line it creates **one** asset (not one per unit) with:

- `code` and `name` from the item; `qty` = the line's base quantity
- `purchase_price` = line amount ÷ base quantity — the **unit** price
- company, branch, location, segment, dimension, project, profit centre and transaction date from the
  document header
- serial numbers from the line, joined into one comma-separated string
- `fixed_asset_type` and `category_guid` from the item's `property_json`
- `glcode_guid` from the company's `FIXED_ASSET_REGISTER` GL link, creating a GL code named
  "Fixed Asset Register" and the company link if the link is missing
- `sub_ledger_guid` resolved (or created) for that GL code and company
- status `DRAFT`, and the same `"DRAFT"` / zero placeholders for the depreciation fields

On success it stamps `posting_fixed_asset = POSTED` on the generic document, which is also the guard
that stops the conversion running twice (`POSTED` or `VOID` are both skipped).

Two entry points reach this code: the anonymous `GET fa/fixed-asset-registers/purchase/{guid}`
endpoint, and the `FIXED_ASSET_REGISTER_ITEM_TYPE` job processor. The job processor is a *subscriber*
— it only runs where an applet-trigger template link makes it a subscriber of the generic-document
processor **and** the tenant has an enabled trigger configuration for that template. Without that,
finalising a purchase invoice creates no assets.

## Related applets

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the document
  whose fixed-asset lines can become asset records.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) — where an item is
  marked as a fixed-asset item and given its default asset type and category.
- [Chart of Account](/applets/master-data/chart-of-account-applet/) — supplies all three GL codes and
  the primary ledger the journals are stamped with.
- [Ledger and Journal](/applets/finance/ledger-and-journal-applet/) — where every journal this applet
  writes can be found; filter on transaction type `DEPRECIATION` or `TXN`, or on the acquisition,
  adjustment and disposal types.
- [Organization](/applets/master-data/organisation-applet/) — company, branch, location and the
  company default GL link used by the purchase conversion.
- [Employee](/applets/master-data/employee-applet/) — the person-in-charge drop-down.
- [Financial Report](/applets/finance/financial-report-applet/) — where depreciation reaches the
  statements.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The depreciation run reports success but no journal lines appear | The depreciation processor only adds a journal line when the asset header's depreciation subledger GUID is non-null, and no screen or backend path sets it | This needs a product fix. Until then, treat the depreciation journal as not produced and post depreciation from [Ledger and Journal](/applets/finance/ledger-and-journal-applet/) |
| An asset is marked `DEPRECIATED` after one run and never depreciates again | The stop condition compares accumulated depreciation against the residual value; with a residual value of zero it is false on the first run | Understand the flag as "the run has touched this asset", not "fully depreciated". Re-running the month deletes and recreates the lines |
| A run picks up assets from another company | `createDepreciationLine` filters only on month and year; company, branch and location are left null | Check the run's lines before relying on them, and reconcile the journals by the run header's company |
| A run only ever produces about 100 lines | The asset query keeps the default page size of 100 from `BaseQueryCriteria` | Split the month across several runs is not possible — the selection is identical each time. Escalate; this needs a product fix |
| An asset never appears on a run | The selection inner-joins the depreciation configuration and a schedule row for that exact month and year | Open the asset → Depreciation → Configuration and complete it, then Depreciation → Schedule → `+` and add the month |
| An asset never appears on the report | The report inner-joins the same two tables | Same fix as above |
| A negative Adjustment transaction is rejected | The credit GL code for a negative adjustment is read from an unassigned local variable, so the line has no GL code and the journal validator rejects it (`..._JOURNAL_LINE_OBJECT_GLCODE_GUID_IS_NULL`) | Record the reversal as a positive adjustment in the opposite direction, or use the Other Journal tab |
| *"Journal Transaction is not balanced"* on the Transactions or Other Journal tab | A client-side check in the browser, before anything is sent | Correct the amounts. This is not a backend rejection |
| *"Asset GL Code does not exist"* when adding a transaction | The asset header has no `glcode_guid`. Possible because GL Code is not required on the create form | Open the asset's Details tab and set the GL Code, then save |
| Saving the edit screen updates the asset but not its depreciation configuration | Save fires two independent requests with no sequencing and no error handling | Reopen the asset and check the Configuration tab; re-save if the values did not stick |
| The Description field cannot be filled in | Both forms render an empty `<div formControlName="descr">` with no input | Use the Attachment tab's Details field, or set the description through the API |
| Permission Wizard, Release Notes or Applet Log opens a 404 | The shared settings menu renders those links but this applet declares no route for them | Use another applet for those screens |
| Personalization → Field Settings opens a 404, and Personal Default Selection saves nothing | The personalization menu points at a route that does not exist, and the personal settings component never populates its container | Use Settings → Default Selection instead |
| An imported row fails with `<INVALID EMPLOYEE NAME>` | The import matches employees by entity **name**, exactly | Correct the name in the CSV, or clear the column |
| An imported row fails with `<INVALID LEDGER CODE>` | The import looks the ledger up by `code = 'PRIMARY'`, not by object type | The company needs a ledger whose code is literally `PRIMARY` |
| Auto-generated asset codes collide | The code is a random base-36 string and is only checked against the assets loaded in the browser | Enter the asset code yourself |

## Related documentation

- [Financial Accounting module](/modules/financial-accounting/)
- [Ledger and Journal](/applets/finance/ledger-and-journal-applet/)
- [Chart of Account](/applets/master-data/chart-of-account-applet/)
- [Financial Report](/applets/finance/financial-report-applet/)
