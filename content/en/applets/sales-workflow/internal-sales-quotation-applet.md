---
title: "Sales Quotation (Internal)"
description: "Reference card for sales staff and administrators who operate the Sales Quotation (Internal) applet: screens, every exposed setting, form fields, what FINAL does (nothing posts), the convert-to-receipt-voucher action, and the real failure modes."
applet_code: "InternalSalesQuotationApplet"
applet_repo: "blg-applet-wavelet-internal-sales-quotation-applet"
modules: [crm-digital, pos, financial-accounting]
related_applets: [internal-sales-inquiry-applet, internal-sales-order-applet, internal-sales-invoice-applet, internal-jobsheet-applet, car-workshop-applet, internal-receipt-voucher-applet, internal-purchase-quotation-applet, customer-applet, organisation-applet, pricebook-applet, tax-configuration-applet, inv-item-maintenance-applet, stock-balance-applet, cashbook-applet, workflow-design-applet]
guides: [/guides/sales-guides/installation-scheduling-workflow/]
sources:
  screens:
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-create/internal-sales-quotation-create.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-view/internal-sales-quotation-view.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-create/import-knock-off/import-knock-off.component.html
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-view/internal-sales-quotation-view-convert/internal-sales-quotation-view-convert.component.html
  configuration:
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/settings-container/branch-settings/branch/branch.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/settings-container/workflow-settings-container/company-workflow-edit/company-workflow-edit.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-listing/internal-sales-quotation-listing.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-listing/internal-sales-quotation-listing.component.html
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-view/internal-sales-quotation-view.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-create/internal-sales-quotation-create-main/internal-sales-quotation-create-main.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-create-line-item/line-search-item/line-search-item.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-add-line-item/add-line-item-item-details/internal-sales-quotation-add-line-item-main/internal-sales-quotation-add-line-item-main.component.html
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/state-controllers/draft-controller/store/effects/pns-edit.effects.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/settings/feature-visibility/feature-visibility.component.html
  fields:
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-create/internal-sales-quotation-create-main/internal-sales-quotation-create-main.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-create/internal-sales-quotation-create-account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-add-line-item/add-line-item-item-details/internal-sales-quotation-add-line-item-main/internal-sales-quotation-add-line-item-main.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-add-line-item/batch-number/batch-number.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-add-line-item/bin-number/bin-number.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-add-collection/internal-sales-quotation-add-collection.component.ts
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-edit-line-item/internal-sales-quotation-edit-line-item.component.html
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesQuotationDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/SerialNumberService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ServerDocShortCodes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockAvailabilityService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/JobProcessorClassName.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/state-controllers/internal-sales-quotation-controller/store/effects/internal-sales-quotation.effects.ts
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/SerialNumberService.java
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/internal-sales-quotation-container/internal-sales-quotation-view/internal-sales-quotation-view.component.ts
    - gh:bigledger/blg-applet-wavelet-internal-sales-quotation-applet#16
    - gh:bigledger/blg-wiki#107
  reviewed_at_commit:
    - blg-applet-wavelet-internal-sales-quotation-applet@e6a99a4
    - blg-shared-utilities (checked 2026-09-05)
    - blg-akaun-platform-java@871dbf5c
tags:
- sales-management
- quotation-processing
- pricing-proposals
- sales-workflow
- customer-management
weight: 70
---

## Overview

The **Sales Quotation (Internal)** applet records a priced offer to a customer before any commitment exists. It is opened by sales staff who prepare quotes and by administrators who configure the quote screens. A quotation is a **zero-signum** document: finalising it assigns document numbers and locks the header, but it moves no stock and posts no journal. Upstream it can be built by knocking off a Jobsheet or an earlier quotation; downstream it is the source that a Sales Order, Invoice or Jobsheet knocks off, and its Collection (deposit) lines can be converted into a Receipt Voucher from inside the applet.

{{< callout type="info" >}}
Server document type `INTERNAL_SALES_QUOTATION`, short code `SLSQUO`. Amount signum **0**, quantity signum **0**: FINAL has no stock, GL, receivable or e-Invoice effect. The document numbers you see on the listing are only assigned at FINAL.
{{< /callout >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Sales Inquiry (Internal)](/applets/sales-workflow/internal-sales-inquiry-applet/) | The informal enquiry that precedes a priced quote |
| Upstream (KO For) | [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/), another Sales Quotation | The **KO For** tab offers *Sales Quotation* and *Job Sheet* as sources; the Sales Order source tab is present in the code but commented out |
| Upstream (master data) | [Customer](/applets/master-data/customer-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Organisation](/applets/master-data/organisation-applet/), [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/) | Entities, prices, tax codes, branches/locations and items the quote reads |
| Downstream | [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/), [Car Workshop](/applets/sales-workflow/car-workshop-applet/) | Those applets knock off a FINAL quotation in their own **KO For** tab; the quotation's `xtn_doc_ref` columns (Quotation / Order / Delivery Order / Invoice / Others) show the chain |
| Downstream | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | The **Convert** tab creates a receipt voucher from the quotation's Collection lines and deletes the quotation |
| Sibling | [Purchase Quotation (Internal)](/applets/purchase-workflow/internal-purchase-quotation-applet/) | The buying-side equivalent (`INTERNAL_PURCHASE_QUOTATION`), same zero-signum behaviour |

## Screens and menus

Route root: `applet/tnt/wavelet/erp/internal-sales-quotation-applet/`.

| Menu item | Route | What it shows |
|---|---|---|
| **Sales Quotations** | `internal-sales-quotation` | Listing with advanced search, FINAL / VOID / DISCARD bulk buttons, create and edit |
| **Line Items** | `line-items` | One row per quotation line, for line-level search and export |
| **File Import** | `file-import` | Bulk-create quotations from a delimited file (processed by `INTERNAL_SALES_QUOTATION_FILE_IMPORT_HDR_PROCESSOR` / `…_HELPER_PROCESSOR`); imported rows are created ACTIVE |
| **File Export** | `file-export` | Generate a CSV of quotations for a transaction-date range; the job history shows status and errors |
| **Settings** | `settings/…` | Administrator configuration (see below) |
| **Personalization** | `personalization/…` | Per-user Default Selection and sidebar |

{{< figure src="/images/internal-sales-quotation-applet/main-listing.png" alt="Sales Quotation Listing" caption="Sales Quotations listing: FINAL, VOID and DISCARD act on the selected rows; the column set follows the HIDE_* settings and SHOW_* permissions." >}}

{{< figure src="/images/internal-sales-quotation-applet/reports.png" alt="Sales Quotation File Export Listing" caption="File Export: choose a transaction-date range and generate a CSV; each run is listed with its status." >}}

### The create / edit form

Pressing **+** creates a working document with status `TEMP` (the panel title reads *Create*); the first successful Save turns it `ACTIVE` (*Edit*). The create form has the tabs **Main Details**, **Account**, **Line Items**, **Delivery Details**, **Collection**, **Department Hdr** and **KO For**. The edit form (opened from the listing) shows **Main**, **Account**, **Line Items**, **Delivery Details**, **Settlement**, **Department Hdr**, **Contra**, **Doc Link**, **Attachments**, **Export** and **Convert**. Tab order is configurable (Settings → Default Selection → *Details Tab Ordering*); most tabs can be hidden with the `HIDE_*_TAB` settings under Configuration.

{{< figure src="/images/internal-sales-quotation-applet/create-form.png" alt="Create Internal Sales Quotation - Main tab" caption="Main Details: branch and location are required (the red prompts), then delivery branch/location, transaction date, credit limit and terms, currency and rate, member card." >}}

Line-item dialog tabs: **Main Details**, **Grouped Item**, **Child Items**, **Multi Discount**, **Serial Number**, **Batch Number**, **Bin Number**, **Delivery Instructions**, **Department**, **Doc Link**, **Delivery Details**, **Sales History** (the sales-history grid includes a company-name column). The header sales agent can be pushed to every line with the *Apply to Lines* button on Main Details.

### Settings menu

| Settings entry | Route | Purpose |
|---|---|---|
| Application Settings | `settings/field-settings` | Hide/show, listing-default and behaviour toggles (shared *Field Configuration* screen) |
| Default Selection | `settings/default-selection` | Default branch, location, company, pricebook, currency, pricing scheme, unit-price decimal precision, tab order |
| Printable Format Settings | `settings/printable-format-settings` | Register printable formats under `INTERNAL_SALES_QUOTATION_APPLET_EXT_CODE_PRINTABLE_FORMAT_GUID_INTERNAL_SALES_QUOTATION` and pick the default |
| Branch Settings | `settings/branch-settings` | Per-branch header/footer text, default printable format, default settlement method per payment type, pricing scheme, sales agent, rounding and group-discount items, item-category filter, menu list |
| Workflow Settings | `settings/workflow-settings` | Link a company to a workflow process for this document type |
| Webhook | `settings/webhook` | Subscribe endpoints to `INTERNAL_SALES_QUOTATION_CREATED` / `…_DELETED` events |
| Feature Visibility | `settings/feature-visibility` | Team-level access (a single *Teams* panel) |
| Permission Set / User / Team / Role / Client-Side Permission / Permission Wizard / Role Pricing Scheme Link | `settings/*-listing` | Access control (shared permission module) |
| Release Notes, Applet Log | `settings/release-notes`, `settings/applet-log` | Version history and audit trail |

{{< figure src="/images/internal-sales-quotation-applet/quotation-settings.png" alt="Applet Settings - Application Settings" caption="Application Settings is the shared Field Configuration screen; its tabs (Sidebar Menu, Advanced Search Filter, Gen Doc Listing, Main Details …) hold the toggles listed under Configuration." >}}

{{< figure src="/images/internal-sales-quotation-applet/settings.png" alt="Feature Visibility - Teams" caption="Feature Visibility exposes only team access." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why the quotation needs it |
|---|---|---|
| Company, branch and location | [Organisation](/applets/master-data/organisation-applet/) | Main Details requires all three (`Validators.required` on `company`, `branch`, `location`); picking a branch pre-fills its `MAIN_LOCATION` |
| Customer entities | [Customer](/applets/master-data/customer-applet/) | The Account tab requires an entity (`entityId` is `Validators.required`); credit terms, credit limit, currency and addresses are copied in. Blacklist status is **not** checked for quotations (`GenericDocumentService.java` L1646–L1650 lists only cash bill, invoice, order and outbound DO) |
| Sales agent (employee) | [Organisation](/applets/master-data/organisation-applet/) | `salesAgent` is `Validators.required` on Main Details |
| Items and, optionally, a pricing scheme / pricebook | [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/), [Pricebook](/applets/master-data/pricebook-applet/) | Lines take standard prices from the pricing scheme and pricebook chosen in Default Selection; stock is *displayed* (`SHOW_ITEM_STOCK_BALANCE`) but never deducted |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Each line carries a tax code; SST is populated from it |
| Settlement methods (only if you take deposits on the Collection tab) | [Cashbook](/applets/master-data/cashbook-applet/) | Collection lines are settlement-method lines (`txn_type = STL_MTHD`); Branch Settings can pre-select a default method per payment type |
| Document numbering | Tenant running-number setup | Tenant / company / branch numbers are generated at FINAL (`GenericDocumentService.java` L634–L640); a tenant number is also assigned on creation through the API (L187) |
| API permissions `TNT_API_DOC_INTERNAL_SALES_QUOTATION_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` | Settings → Permission Set / User / Team / Role | Registered for the document type in `GenericDocumentTypeHandler.java` L583–L590; DELETE is needed for the Convert action (it deletes the quotation) |
| Workflow process (optional) | [Workflow Design](/applets/master-data/workflow-design-applet/) then Settings → Workflow Settings | Enables the Workflow Status / Resolution fields on Main Details |

### Applet settings

**Where the settings live.** `app.routing.ts` mounts four settings surfaces: the applet's own **Default Selection** component (`settings/default-selection`, with a personal copy at `personalization/personal-default-selection`), the **shared** `FieldConfigurationComponent` from blg-shared-utilities as **Application Settings** (`settings/field-settings`, gated by `sessionStorage.appletCode = InternalSalesQuotationApplet`), the applet's own **Branch Settings** form (`settings/branch-settings`) and **Workflow Settings**. Every key in the tables below is *declared* in `models/applet-settings.model.ts` (or read by name from the listing column map), *rendered* by a control that is visible for this applet code (each `*ngIf="appletCode…"` ancestor checked), *persisted* by the screen's Save, and *consumed* by a component, effect or service in this applet. Keys that fail any proof are listed separately at the end of this section.

Who can change them: any user who can open Settings (the `settings/*` routes are guarded by the applet's permission resolver; there is no finer per-setting authority). Personalization → Default Selection lets an individual override branch, location and company for themselves only (`DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY`, `DEFAULT_TOGGLE_COLUMN`).

#### Default Selection (applet-local)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| Default Branch | `DEFAULT_BRANCH` (+ `DEFAULT_COMPANY`) | Pre-fills company and branch on a new quotation; picking a branch copies its `MAIN_LOCATION` into Default Location | none (`new UntypedFormControl()`, `default-settings.component.ts` L48–L50; reset to `null` on clear, L118–L120) | New quotations open on the new branch |
| Default Location | `DEFAULT_LOCATION` | Pre-fills the location | none | New quotations only |
| Default Pricebook | `DEFAULT_PRICEBOOK` | Pricebook consulted when items are added | none (L51) | Pricebook prices on new lines |
| Default Currency | `DEFAULT_CURRENCY` | Document currency pre-selected on a new quotation | none (L52) | New quotations only |
| Default Pricing Scheme | `DEFAULT_PRICING_SCHEME` | Pricing scheme used for standard prices | none (L53) | Standard prices on new lines |
| Unit Price Decimal Precision | `DEFAULT_DECIMAL_PRECISION` / `DEFAULT_DECIMAL_STEP` | Decimal places on unit prices, validated 2–4 | 2 (`DEFAULTS.DECIMAL_PRECISION`, L56–L57, L68–L69) | Rounding of prices entered afterwards |
| Details Tab Ordering | `SALES_QUOTATION_DETAILS_TAB_ORDER` | Drag-and-drop order of the form tabs (Main, Account, Line Items, Delivery Details, Settlement, Department Hdr, Contra, Doc Link, Attachments, Export, Convert); tabs added by an upgrade are appended | the order listed (L29–L39) | Tab order for all users |

There is **no Transaction Date Logic control** in this applet's Default Selection (unlike the invoice); the header is saved with `date_txn_logic: null`, so the backend keeps the date typed on the form (`GenericDocumentService.java` L371–L385 only rewrites `date_txn` when a logic value is sent).

#### Application Settings (shared Field Configuration screen)

Every control on this screen is a `new FormControl()` patched from the stored value, so a toggle that has never been saved is **off**, with one exception cited below: the detailed pricing columns and the department fields, which the screen initialises to **hidden** for this applet code (`shouldHideSetting` / `hideDepartmentSetting` / `hideDepartmentHDRTab`, `field-configuration.component.ts` L2333–L2384 — `InternalSalesQuotationApplet` is in all three lists). The applet itself treats an unsaved (null) key as *shown*; those columns become hidden the first time an administrator saves this screen without switching the toggles off.

*Behaviour and listing-default toggles* — "Consumed in" names the file that reads the key.

| Section | Setting | What it controls | Default | Effect when changed | Consumed in |
|---|---|---|---|---|---|
| Gen Doc Listing | `DISABLE_GEN_DOC_LISTING` | Listing does not load rows until a search is run | off | Faster first paint on large tenants | `internal-sales-quotation-listing.component.ts` |
| Gen Doc Listing | `DEFAULT_TRANSACTION_DATE` | Listing and Line Items open pre-filtered to a date range | none | Applied at next open | listing, `line-items-listing.component.ts` |
| Gen Doc Listing | `DEFAULT_POSTING_STATUS` | Listing opens filtered to one posting status; `ALL` or empty means no filter | none → no filter (`getPostingStatus()`, listing L1145–L1150) | Applied at next open | listing, line items |
| Gen Doc Listing | `DEFAULT_STATUS` | Listing opens filtered to a record status; `ALL` or `true` means no filter | `ACTIVE` when unset (`getStatus()`, L1152–L1157) | Applied at next open | listing |
| Gen Doc Listing | `SORT_ORDER` | Listing sort column | `updated_date` desc when unset (L817) | Applied at next open | listing |
| Gen Doc Listing | `FUZZY_SEARCH_COLUMNS` | Comma-separated columns the search box matches | `server_doc_1,client_doc_1…client_doc_5,doc_reference` when unset (`getFuzzySearch()`, L1159–L1164) | Search scope | listing |
| Gen Doc Listing | `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` (label *ENABLE_SERIAL_BATCH_NUMBER_VALIDATION_FINAL*) | Sends `validate_serial_signum_zero: true` with FINAL (single: `internal-sales-quotation-view.component.ts` L655–L663; bulk: listing L638–L641) so the backend checks serial numbers exist at the location even though the quotation moves no stock | off (backend default `false`, `GenericDocumentService.java` L387–L389) | FINAL rejected with `BL_INV_SERIAL_NUMBER_HDR_OBJECT_SERIAL_NUMBER_DOES_NOT_EXIST_AT_LOCATION` when a quoted serial is not in stock (L1858–L1882) | view, listing |
| Gen Doc Listing | `SHOW_DRAFT_BUTTON` | Shows a DRAFT button on the listing and in the edit panel (bulk set back to DRAFT) | off; overridden per user by the `SHOW_DRAFT_BUTTON` client-side permission | Button visible | listing `.html` L35, view |
| Gen Doc Listing | `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON` | Hide FINAL / VOID / DISCARD / SAVE for everyone except users holding the matching `SHOW_GENDOC_*_BUTTON` permission (`isShowColumn(setting, permission)`) | off | Button removed | listing `.html` L24–L36, view `showFinal()` L352–L358, `showDiscard()` L361 |
| Doc Settings | `CANNOT_EDIT_CURRENCY_RATE` | Exchange-rate field read-only | off | Rate always from the currency master | `internal-sales-quotation-create-main.component.ts` |
| Doc Settings | `SHOW_FOREX_DATA_SOURCE` | Shows where the exchange rate came from | off | Extra label next to the rate | `internal-sales-quotation-create-main.component.html` |
| Doc Settings | `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Resolves the employee record behind the login on a new document | off | Sales agent pre-filled from the login | `internal-sales-quotation-create-main.component.ts` |
| Entity Details | `ENABLE_BRANCH_FILTER` | Customer search and Jobsheet KO limited to the quotation's branch | off | Fewer entities / source documents offered | `internal-sales-quotation-select-customer.component.ts`, `knock-off-jobsheet.component.ts` |
| Entity Details | `ENABLE_CUSTOMER_FILTER_FROM_ACCOUNT_TAB` | Customer picker honours the filters set on the Account tab | off | Narrower customer search | `internal-sales-quotation-select-customer.component.ts` |
| Lines | `SHOW_ITEM_STOCK_BALANCE` (label *Disallow negative stock for basic item (validate stock balance)*) | Shows the stock-balance column in item search (`line-search-item.component.ts` L208). **Display only here**: this applet never sends `validate_stock_balance`, and the backend stock check skips zero-signum lines anyway (`GenericDocumentService.java` L2083–L2091) | off | Column shown | `line-search-item.component.ts`, `child-item-search.component.ts` |
| Lines | `DISABLE_ITEM_LISTING` | Item search shows no rows until a keyword is typed | off | Faster item dialog on large catalogues | `line-search-item.component.ts` L236, `child-item-search.component.ts` L177 |
| Lines | `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` | Serial-number validation on Save sends `checkDraftLock: true`, so a serial already held by another draft document is returned as invalid with the remark *"Serial Number is already locked by …"* (`SerialNumberService.java` L283–L320) | off | Serial conflicts caught at save time | `pns-edit.effects.ts` L75, `column_4_view_model.effects.ts` L55 |
| Lines | `DISABLE_LINE_ITEM_NAME_EDIT` | Item name locked to master data | off | Name read-only | line `…-add-line-item-main.component.html`, edit-line-item main |
| Lines | `ENABLE_EDITING_UNIT_PRICE_STD` | Standard unit price editable in the line (the control's template guard reads `appletCode==='posGeneral' \|\| 'salesInvoiceApplet'`, which is always true, so it renders for every applet) | off | Std price field unlocked | line `…-add-line-item-main.component.ts` |
| Lines | `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT` | Maximum item-name length | off / none | Validator on the name field | line `…-add-line-item-main.component.html` |
| Vertical UI | `VERTICAL_ORIENTATION` | Renders tabs as a vertical stack; `EXPAND_*` keys open a section by default | off | Layout change | file-import components, create, view |

*Hide / show and expand toggles* — cosmetic. Every key is off (shown / collapsed) by default unless the row says otherwise.

| Section | Keys | Default |
|---|---|---|
| Gen Doc Listing columns | `HIDE_SERIAL_NUMBER`, `HIDE_SERVER_DOC_1`, `HIDE_SERVER_DOC_2`, `HIDE_SERVER_DOC_3` (tenant / company / branch numbers), `HIDE_TRANSACTION_DATE`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1` … `HIDE_CLIENT_DOC_5`, `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL`, `HIDE_AMOUNT_TXN_MAIN_LISTING` | off; each is paired with a `SHOW_*` permission in the listing column map (`internal-sales-quotation-listing.component.ts` L80–L126) |
| Vertical UI | `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_KO_FOR`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT`, `EXPAND_MAIN_CONTRA`, `EXPAND_SETTLEMENT` | off (collapsed) |
| Doc Settings (Main Details) | `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_CREATED_BY_DETAILS`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION`, `HIDE_CRM_CONTACT`, `HIDE_REMARKS`, `HIDE_EXTERNAL_REMARKS`, `HIDE_MEMBER_CARD`, `HIDE_WORKFLOW_STATUS`, `HIDE_WORKFLOW_RESOLUTION` | off |
| Header tabs | `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_COLLECTION_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_KO_FOR_TAB`, `HIDE_SETTLEMENT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_CONVERT_TAB` | off, except `HIDE_DEPARTMENT_HDR_TAB`, which the screen initialises to hidden for this applet (`hideDepartmentHDRTab`) |
| Lines — columns and fields | `HIDE_SALES_AGENT`, `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_QTY_BASE`, `HIDE_UNIT_PRICE_TXN`, `HIDE_AMOUNT_TXN`, `HIDE_UNIT_DISCOUNT`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | off |
| Lines — detailed pricing columns | `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | **hidden** for this applet once the screen is saved (`shouldHideSetting`); each has a `SHOW_*` permission counterpart read by the line grid |
| Department | `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT` | **hidden** for this applet once the screen is saved (`hideDepartmentSetting`); the listing shows the department columns only when the paired `SHOW_GL_DIMENSION` / `SHOW_SEGMENT` / `SHOW_PROFIT_CENTER` / `SHOW_PROJECT` key is set |
| Line item main tabs | `HIDE_BIN_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_ISSUE_LINK` | off |
| Line item sub-tabs | `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DOC_LINK`, `HIDE_RELATED_DOCUMENTS`, `HIDE_DELIVERY_DETAILS` | off |

{{< callout type="warning" >}}
Because the shared screen initialises the detailed pricing columns, the department fields and the Department Hdr tab to hidden for `InternalSalesQuotationApplet`, the first save of Application Settings hides them for everyone. If a column or tab disappeared after an administrator visited Settings, look here first.
{{< /callout >}}

#### Branch Settings (applet-local)

One record per branch (`branch.component.ts`): branch code, name and company; **Header** and **Footer** text for printouts; a default printable format; a default settlement method for each payment type (`default_settlement_cash`, `…_cheque`, `…_credit_card`, `…_debit_card`, `…_bank_transfer`, `…_ewallet`, `…_voucher`, `…_membership_point_currency`, `…_others`); a branch pricing scheme and sales agent; `rounding_five_cent` with a rounding item and a group-discount item; an item-category filter for the item search; and the sidebar menu list for that branch. All controls start empty (`new UntypedFormControl()`).

#### Rendered on the screen but not read by this applet

These controls appear on Application Settings for `InternalSalesQuotationApplet` and are saved, but no component, effect or service in the applet reads them (checked at commit `e6a99a4`): `HIDE_LOCATION`, `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_TOTAL_DISCOUNT_AMOUNT`, `HIDE_LINE_ITEMS_GL_CODE`, `HIDE_DEPARTMENT` (line sub-tab), `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_MAIN_ARAP_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `DISABLE_LINE_ITEM_QUEUE_LISTING`, and the vertical-UI keys `EXPAND_MAIN_ARAP`, `EXPAND_POSTING`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_DELIVERY_TRIPS` (the quotation has no ARAP, Posting, Trace Document or Delivery Trips tab). Switching them has no effect here.

#### Read at runtime without a control in this applet

The listing column map reads `HIDE_QUOTATION`, `HIDE_ORDER`, `HIDE_DELIVERY_ORDER`, `HIDE_INVOICE`, `HIDE_OTHERS` (the `xtn_doc_ref_1…5` reference columns), `HIDE_LISTING_BRANCH`, `SHOW_DESCRIPTION`, `SHOW_REMARKS_MAIN_LISTING`, `SHOW_REFERENCE_MAIN_LISTING` and `SHOW_SALES_AGENT` as settings, and Main Details reads `HIDE_CREDIT_TERMS` / `HIDE_CREDIT_LIMIT`; the shared screen renders those controls only for other applet codes (the credit-terms toggles are gated to jobsheet / return / purchase applets and the sales order; the reference-column toggles to purchase applets). They can only be set through the paired client-side permission of the same name, or by an API write to the applet settings.

Fifty-one further keys in `applet-settings.model.ts` have no control anywhere (`ENABLE_CUSTOM_STATUS_*`, `LIST_/NAME_CUSTOM_STATUS_HDR_*`, department `ENABLE_*` / `INCLUDE_*` / `MANDATORY_*`, `ENABLE_SST`, `ENABLE_WHT`, `ENABLE_LAST_PURCHASE_PRICE`, `ENABLE_FILTER_BY_TODAYS_TXN`, `DEFAULT_ORIENTATION`, `PRINTABLE`). They are not documented as settings.

### Document behaviour settings

| Area | How it is configured |
|---|---|
| Status flow | Fixed: `TEMP` (unsaved working row) → `ACTIVE`; posting status DRAFT → FINAL → VOID, plus DISCARDED for drafts and DRAFT-again through the `SHOW_DRAFT_BUTTON` action. No custom statuses are exposed in this applet's settings screens. |
| Posting at FINAL | Nothing to configure: both signums are 0, so the journal service skips every line (`JournalPostingService.java` L96 — `amount_signum.signum() != 0`) and no inventory transaction is written. Which sub-processors the Generic Document Primary Processor still queues is decided by the company's `posting_final_json` (`GenericDocumentPrimaryProcessor.java` L103–L115), not by an applet setting. |
| Backend FINAL validations the applet can switch | Only one: `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` → `validate_serial_signum_zero`. The applet never sends `validate_stock_balance`, `disallow_sell_below_cost` or `validate_points_redeemed`. |
| Workflow | Settings → Workflow Settings links a **company** to a **workflow process** (`company-workflow-edit.component.ts` L75, `processGuid`). No approval queue exists in this applet; the *Pending Approvals* and *Team Reports* screens described in older versions of this page do not exist in the code. |
| Printables | Settings → Printable Format Settings registers formats under `INTERNAL_SALES_QUOTATION_APPLET_EXT_CODE_PRINTABLE_FORMAT_GUID_INTERNAL_SALES_QUOTATION`; Branch Settings can pin a default format per branch. |
| Convert | The **Convert** tab has one action, *Convert to Internal Receipt Voucher* (`internal-sales-quotation-view-convert.component.html` L4). It posts a new `INTERNAL_RECEIPT_VOUCHER` (amount signum −1) whose header is copied from the quotation — customer, branch, currency and the current posting status included — with the quotation's Collection (`STL_MTHD`) lines, then **deletes the quotation** (`internal-sales-quotation.effects.ts` L993–L1050: `rcptService.post` followed by `sqService.delete`). Hide the tab with `HIDE_CONVERT_TAB` if deposits are not collected on quotations. |
| Webhooks | Settings → Webhook. Creating a quotation through the API emits `INTERNAL_SALES_QUOTATION_CREATED` (`GenericDocumentService.java` L189–L192); deleting one emits `INTERNAL_SALES_QUOTATION_DELETED` (`GenericDocumentController.java` L587). FINAL itself emits no document-type webhook for this type (L645–L650 is invoice-only). |
| e-Invoice, intercompany, email | No controls in this applet; `INTERNAL_SALES_QUOTATION` is not an e-Invoice document type and has no intercompany mirror. |

### Feature visibility / permissions

API permissions (server-side, target = branch / company / customer): `TNT_API_DOC_INTERNAL_SALES_QUOTATION_CREATE_TGT_GUID`, `…_READ_TGT_GUID`, `…_UPDATE_TGT_GUID`, `…_DELETE_TGT_GUID`.

Client-side permissions are assigned per user, team or role under Settings → Client-Side Permission Listing. The registry (`bl_applet_client_side_perm_dfn`) seeds only **two** ACTIVE definitions for `InternalSalesQuotationApplet`: `HIDE_PRICE` and `SHOW_TRANSACTION_DATE`. The applet's code checks many more; those must exist in the tenant's permission definitions before they can be granted.

| Group | Permission codes | Gate |
|---|---|---|
| Buttons | `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_DRAFT_BUTTON` | Re-enable a button hidden by the matching `HIDE_GENDOC_*` setting, or show DRAFT |
| Listing columns | `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_LISTING_BRANCH`, `SHOW_TRANSACTION_DATE` (seeded), `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1` … `SHOW_CLIENT_DOC_5`, `SHOW_ARAP_PNS`, `SHOW_ARAP_SETTLEMENT`, `SHOW_ARAP_DOC_OPEN`, `SHOW_ARAP_CONTRA`, `SHOW_ARAP_BAL`, `SHOW_AMOUNT_TXN_MAIN_LISTING`, `SHOW_GL_DIMENSION`, `SHOW_SEGMENT`, `SHOW_PROFIT_CENTER`, `SHOW_PROJECT`, `SHOW_DESCRIPTION`, `SHOW_QUOTATION`, `SHOW_ORDER`, `SHOW_DELIVERY_ORDER`, `SHOW_INVOICE`, `SHOW_OTHERS`, `SHOW_REMARKS_MAIN_LISTING`, `SHOW_REFERENCE_MAIN_LISTING` | Column visibility per user (`isShowColumn(setting, permission)`) |
| Pricing and cost columns on lines | `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_COSTING_DETAILS`, `HIDE_PRICE` (seeded) | Reveal or hide price and cost data per role, overriding the `HIDE_*` column settings |
| Item search | `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH` | Hides account-code items from the line item search (`line-search-item.component.ts` L216) |

Settings → Feature Visibility exposes a single **Teams** panel and nothing else (`feature-visibility.component.html`).

## Fields

**Main Details** (`bl_fi_generic_doc_hdr`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company, Branch, Location | Quoting company, branch and location | Yes (`Validators.required`, `internal-sales-quotation-create-main.component.ts` L183–L185) | Location follows the branch; it is recorded but no stock moves |
| Delivery Branch / Location | Where goods would ship from | No | Hide with `HIDE_DELIVERY_BRANCH` / `HIDE_DELIVERY_LOCATION` |
| Transaction Date | Document date | No in the form; backend checks it | Must not fall in a locked fiscal period (`FISCAL_PERIOD_LOCKED`, `GenericDocumentService.java` L1681–L1696); kept as typed at FINAL |
| Sales Agent | Employee credited with the quote | Yes (L192) | *Apply to Lines* copies it to every line; auto-filled from the login with `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` |
| Currency, Currency Rate, Base Currency | Document currency and rate to base | Currency yes (L193) | Save is blocked in the form when the currencies differ and the rate is 0 or negative (*"The currency rate cannot be ZERO or negative."*, `internal-sales-quotation-view.component.ts` L336–L340); the backend repeats the check at FINAL (`FOREX_DOC_REQUIRES_NON_ZERO_XRATE`, L1636) |
| Credit Terms, Credit Limit | Copied from the customer | No | Informational on a quotation |
| Reference, Remarks, External Remarks, Permit No, Tracking ID, CRM Contact, Sales Lead, MemberCard | Free text and optional links | No | |
| Doc Short Code (`SLSQUO`), Tenant / Company / Branch Doc No | Numbering | Generated at FINAL | Shown read-only |
| Workflow Status / Resolution | From the linked workflow process | No | Only meaningful with Workflow Settings |
| Created / Modified by and dates | Audit | Read-only | Hide with `HIDE_CREATED_BY_DETAILS` |

**Account**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Entity ID | The customer | Yes (`Validators.required` on `entityId`, `account-entity-details.component.ts` L49) | Copies entity name, type, credit terms and limit, currency, billing and shipping addresses; a new customer can be created from the picker |
| Bill To / Ship To addresses and contacts | Addresses printed on the quote | No | Sub-tabs; member selection available |

**Lines** (`bl_fi_generic_doc_line`, `txn_type = PNS`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item Code / Name | Inventory or service item | Yes | Name editable unless `DISABLE_LINE_ITEM_NAME_EDIT`; grouped items expand into child lines |
| Quantity, UOM, UOM ratio | Quantity quoted | `qty`, `txnAmt`, `netAmt`, `netAmtWithTax` are `Validators.required` (`…-add-line-item-main.component.ts`) | Both signums are filled as 0 by the backend DCO |
| Unit Price STD / Discount / Net / Transaction, amounts | Pricing chain | Derived | Multi-level discounts on the *Multi Discount* tab; Pricing Details tab (sales / purchase min-max prices) has its own required validators |
| Tax Code, Tax Amount, WHT | Tax | From item or scheme | Populated for display and printing only |
| Serial Number, Batch Number, Bin Number tabs | Allocations for tracked items | Batch: `batch_no`, `qty`, `issue_date`, `expiry_date` required; Bin: `bin_code`, `container_measure`, `container_qty`, `qty` | Checked at FINAL only when `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` is on |
| Sales Agent, Department (Segment, Dimension, Profit Center, Project), Delivery Instructions, Delivery Details, Doc Link | Optional attributes | No | Department fields hidden by default for this applet |

**Collection** (create) / **Settlement** (edit) — one line per deposit (`txn_type = STL_MTHD`): settlement method, date, amount and, per method type, cheque number, transaction number, voucher number, card details (card no, name, issuer, expiry month/year, CVV, cash-back), points and point currency (`internal-sales-quotation-add-collection.component.ts`). These lines are what the Convert action turns into a receipt voucher; on the quotation itself they post nothing.

**Delivery Details**, **Department Hdr**, **Contra**, **Doc Link**, **Attachments**, **Export**: optional header-level tabs; Export builds the line rows for the File Export CSV.

## Lifecycle and effects

| Status | Meaning | Allowed next |
|---|---|---|
| **TEMP** (record status) | Working row created by **+**, not yet saved | ACTIVE on first Save |
| **DRAFT** | Editable; no numbers assigned | FINAL, DISCARDED, delete |
| **FINAL** | Numbered; header locked; available as a KO source to orders, invoices and jobsheets | VOID; DRAFT (only through the `SHOW_DRAFT_BUTTON` action) |
| **VOID** | Cancelled with a reason | none |

**Backend checks at FINAL** — `validateGenericDocumentOnFinal` (`GenericDocumentService.java` L1623–L1699) runs for every document type; for a quotation the effective checks are:

| Check | Error code | Runs when |
|---|---|---|
| Exchange rate present and non-zero when currencies differ | `FOREX_DOC_REQUIRES_NON_ZERO_XRATE` | always (L1636) |
| Serial-number count equals line quantity; no duplicates | `GENERIC_DOC_LINE_QTY_BASE_AND_SERIAL_NUMBER_QTY_DOES_NOT_MATCH`, `GENERIC_DOC_LINE_SERIAL_NUMBER_ID_IS_DUPLICATED` | always when a serial item has serials (L1855–L1857) |
| Quoted serial numbers exist at the location | `BL_INV_SERIAL_NUMBER_HDR_OBJECT_SERIAL_NUMBER_DOES_NOT_EXIST_AT_LOCATION` | only when `validate_serial_signum_zero` is sent — `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` on (L1858–L1882) |
| Bin and batch quantities valid | bin / batch error codes | always (L1659–L1661) |
| Transaction date not in a locked fiscal period | `FISCAL_PERIOD_LOCKED` | always when date and company are present (L1681–L1696) |

Not applied to quotations: the customer blacklist check (L1646–L1650 names cash bill, invoice, order, outbound DO only) and the stock-balance check (lines with quantity signum 0 are filtered out unless the caller passes `validateStockBalanceForSignumZero`, which only the back-office convert endpoint does — L1628, L2083–L2091).

**What FINAL does** once validation passes (`GenericDocumentService.java` L628–L660): generates tenant, company and branch running numbers; queues the Generic Document Primary Processor (which fans out to whatever the company's `posting_final_json` enables); queues the message-template (email) processor. No document-type webhook fires at FINAL for this type.

**Posting proof block**

| Item | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_SALES_QUOTATION` (short code `SLSQUO`) | `InternalSalesQuotationDataConsistencyObject.java` L15; `ServerDocShortCodes.java` L34 |
| Amount signum | **0** (checked on create and update) | same DCO, L16, L21–L34 |
| Quantity signum | **0** (filled on every line) | same DCO, L17, L37–L44 |
| Dr/Cr equation | None. `JournalPostingTypeHandler.handlers` has no `INTERNAL_SALES_QUOTATION` entry, so the service falls back to the `SALES` handler (`JournalPostingService.java` L68–L82), but every line is skipped by `amount_signum.signum() != 0` (L96) and the entity line is skipped because the total is 0 (L326) — an empty journal, i.e. nothing posts | `JournalPostingService.java` |
| GL precedence | Not applicable — no journal lines are built | — |
| Stock processor | No inventory transaction: quantity signum 0 gives a zero movement; the quotation is also **not** in `StockAvailabilityService`'s list of documents that reduce availability (only sales orders and invoices are) | `InternalSalesQuotationDataConsistencyObject.java`; `StockAvailabilityService.java` |
| What VOID reverses | `updatePostingStatusToNonFinal` (L662–L710) sets `VOID` and the void reason and queues `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`; with nothing posted, the void processors find nothing to reverse. A voided quotation can no longer be knocked off | `GenericDocumentService.java` |
| Back to DRAFT | Offered by the DRAFT button (`SHOW_DRAFT_BUTTON`), which uses the backend's undo path (`BLG_ERP_UNDO_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`, L702–L704) | `GenericDocumentService.java`, listing `.html` L35 |
| Convert | Creates an `INTERNAL_RECEIPT_VOUCHER` (amount signum −1) from the header and Collection lines, then deletes the quotation through `DELETE /{docType}/{guid}` (`GenericDocumentController.java` L456–L475 → `executeDocumentDeletionTransaction`, which removes the document and emits `INTERNAL_SALES_QUOTATION_DELETED`) | `internal-sales-quotation.effects.ts` L993–L1050 |

## Related applets

- [Sales Inquiry (Internal)](/applets/sales-workflow/internal-sales-inquiry-applet/) — the enquiry stage before a priced quotation.
- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — knocks off a FINAL quotation to create the commitment; the order's KO For tab lists Sales Quotation.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — can knock off the quotation directly when no order is needed.
- [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) and [Car Workshop](/applets/sales-workflow/car-workshop-applet/) — a jobsheet can be the source of a quotation (KO For → Job Sheet) and a quotation can be the source of a jobsheet.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — the Convert tab turns the quotation's deposit lines into a receipt voucher.
- [Purchase Quotation (Internal)](/applets/purchase-workflow/internal-purchase-quotation-applet/) — the buying-side equivalent.
- [Customer](/applets/master-data/customer-applet/), [Organisation](/applets/master-data/organisation-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Workflow Design](/applets/master-data/workflow-design-applet/) — master data read at entry time.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Save or FINAL blocked after a group discount was applied to the lines | Bug in the customer-selection flow fixed on 2026-08-31 (applet issue #16) | Upgrade the applet; re-select the customer on older builds |
| SAVE stays disabled on a new quotation | Branch, Location, Sales Agent or Currency is empty on Main Details, or no entity on Account — all are required | Fill the red-prompted fields; check `HIDE_*` settings have not hidden a required field |
| "The currency rate cannot be ZERO or negative." | Document currency differs from the company currency and the rate is empty or 0 | Enter the rate (unlock it if `CANNOT_EDIT_CURRENCY_RATE` is on) |
| FINAL rejected with `FOREX_DOC_REQUIRES_NON_ZERO_XRATE` | Same condition caught by the backend | As above |
| "The selected date falls within a locked fiscal period." | Transaction date inside a period locked with `LOCK_ALL` or `LOCK_TXN` | Change the date or reopen the period in [Chart of Account](/applets/master-data/chart-of-account-applet/) |
| FINAL rejected with `BL_INV_SERIAL_NUMBER_HDR_OBJECT_SERIAL_NUMBER_DOES_NOT_EXIST_AT_LOCATION` | `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` is on and a quoted serial is not in stock at the header location | Pick a serial that is in stock, or turn the setting off if quotes may name serials not yet received |
| Serial number flagged *"already locked by …"* on Save | `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` is on and another draft document holds the same serial | Use another serial or release it from the other draft |
| Item search shows stock balance 0 for items that are in stock | Older builds queried the wrong location (fixed 2026-01-20) | Upgrade the applet |
| Grid does not refresh after Save or FINAL | Older builds (fixed 2026-05-26) | Upgrade the applet |
| Deleting one line removed all lines | Older builds (fixed 2026-02-24) | Upgrade the applet |
| Grouped item added several lines with wrong prices | Older builds (fixed 2025-11-10) | Upgrade the applet |
| SST amount not populated on lines | Older builds (fixed 2026-05-19) | Upgrade the applet |
| Transaction date not saved as typed | Older builds (fixed 2025-12-30) | Upgrade the applet |
| Pricing columns, Segment/Project fields or the Department Hdr tab vanished after Settings were saved | The shared screen initialises them to hidden for this applet | Application Settings → Lines / Department, switch the `HIDE_*` toggle off and save |
| A user cannot see FINAL / VOID / DISCARD | `HIDE_GENDOC_*_BUTTON` on tenant-wide | Grant the matching `SHOW_GENDOC_*_BUTTON` client-side permission — it must first exist in the tenant's permission definitions (only `HIDE_PRICE` and `SHOW_TRANSACTION_DATE` are seeded) |
| Quotation disappeared after *Convert to Internal Receipt Voucher* | Expected: the action creates the receipt voucher and deletes the quotation | Find the receipt voucher in [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/); hide the tab with `HIDE_CONVERT_TAB` if this is unwanted |
| Nothing appears in the ledger or stock after FINAL | Expected: both signums are 0 | Knock the quotation off into a Sales Order or Invoice |
| Available stock did not drop after FINAL | Expected: quotations are not in the stock-availability calculation | Use a Sales Order to reserve stock |

## Related documentation

- [Installation Scheduling Workflow](/guides/sales-guides/installation-scheduling-workflow/)
- [CRM & Digital module](/modules-v2/crm-digital/), [POS module](/modules-v2/pos/), [Financial Accounting module](/modules-v2/financial-accounting/)
- [Sales Workflow applets](/applets/sales-workflow/)
