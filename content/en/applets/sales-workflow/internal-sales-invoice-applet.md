---
title: "Sales Invoice (Internal)"
description: "Reference card for sales administrators and accounts staff who operate the Sales Invoice (Internal) applet: screens, every exposed setting, form fields, what FINAL and VOID post, and the real failure modes."
applet_code: "salesInvoiceApplet"
applet_repo: "blg-applet-wavelet-internal-sales-invoice-applet"
modules: [financial-accounting, inventory, e-invoice, crm-digital]
related_applets: [internal-sales-order-applet, internal-sales-quotation-applet, internal-jobsheet-applet, internal-delivery-order-applet, internal-sales-return-applet, internal-sales-credit-note-applet, internal-sales-debit-note-applet, internal-sales-invoice-no-stock-out-applet, internal-receipt-voucher-applet, internal-purchase-invoice-applet, pos-general-applet, recurring-sales-invoice-applet, sales-contract-applet, sales-commission-applet, my-e-invoice-portal-applet, my-e-invoice-admin-applet, customer-applet, organisation-applet, tax-configuration-applet, chart-of-account-applet, cashbook-applet, pricebook-applet, inv-item-maintenance-applet, stock-balance-applet, stock-transfer-applet, membership-admin-applet, workflow-design-applet]
guides: [/guides/sales-guides/standard-sales-workflow/, /guides/sales-guides/credit-sales-workflow/, /guides/sales-guides/partial-delivery-workflow/, /guides/sales-guides/returns-exchanges-workflow/]
sources:
  screens:
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/search-documents/search-documents.component.html
  configuration:
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/item-txn-client-side-permissions.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/app.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/custom-field-screens.config.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/settings-container/workflow-settings-container/company-workflow-create/company-workflow-create.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/services/stock-validation.service.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/state-controllers/sales-invoice-controller/store/effects/sales-invoice.effects.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-listing/sales-invoice-listing.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-edit/sales-invoice-edit.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/line-item/line-item-create/search-item/line-search-item-listing.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/settings/feature-visibility/feature-visibility.component.html
    - blg-shared-utilities/modules/gen-doc-simplified-ui/gen-doc-simplified-ui.component.html
  fields:
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/batch-number/batch-number.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/line-approval/line-approval.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/payment/add-payment/add-payment.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/constants/settlement-type.constants.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/models/constants/einvoice.constants.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesInvoiceDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/resources/liquibase/changelogs/liquibase-changelog.sql
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/entity/EntityCreditAvailabilityService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/errorCodesConstants/TntErpErrorCodesConstantsV2.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/VoidGenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/JobProcessorClassName.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/VoidInventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/journalPosting/JournalPostingJobProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/journalPosting/VoidJournalPostingProcessor.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/resources/liquibase/changelogs/liquibase-changelog.sql
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/services/stock-validation.service.ts
    - gh:bigledger/blg-applet-wavelet-internal-sales-invoice-applet#12
    - gh:bigledger/blg-applet-wavelet-internal-sales-invoice-applet#15
    - gh:bigledger/blg-wiki#104
    - gh:bigledger/blg-wiki#333
  reviewed_at_commit:
    - blg-applet-wavelet-internal-sales-invoice-applet@efcad942
    - blg-shared-utilities (checked 2026-09-05)
    - blg-akaun-platform-java@871dbf5c
tags:
- sales-management
- invoice-processing
- financial-posting
- stock-control
- intercompany-transactions
weight: 30
date: 2026-02-06
draft: false
aliases:
- /applets/internal-sales-invoice-applet/
---

## Overview

The **Sales Invoice (Internal)** applet creates the document that bills a customer and, on finalisation, deducts stock, posts the sale to the General Ledger and opens a receivable against the customer. It is opened by sales administrators and accounts staff. Upstream it is usually created by knocking off a Sales Order, Delivery Order, Jobsheet or Sales Quotation; downstream it feeds the Pick & Pack queue, receipts and contra settlement, sales returns and credit notes, e-Invoice submission, sales commission and membership points.

{{< callout type="info" >}}
Server document type `INTERNAL_SALES_INVOICE`. Amount signum **+1**, quantity signum **−1** (every line takes stock *out*). If you bill without moving stock, use [Sales Invoice (No Stock Out)](/applets/sales-workflow/internal-sales-invoice-no-stock-out-applet/) instead.
{{< /callout >}}

## Where it fits

| Direction | Document / applet | How it connects |
|---|---|---|
| Upstream | [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/), [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/), [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/), [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) | Knocked off in the **KO For** tab; lines and customer are copied in |
| Upstream | [Customer](/applets/master-data/customer-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Organisation](/applets/master-data/organisation-applet/) | Master data the invoice reads |
| Downstream | [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) | Reverse or adjust a FINAL invoice |
| Downstream | [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/), Contra tab | Settle the receivable |
| Downstream | [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | LHDN e-Invoice submission of FINAL invoices |
| Downstream | [Sales Commission](/applets/sales-workflow/sales-commission-applet/), [Sales Contract](/applets/sales-workflow/sales-contract-applet/), [Membership Admin](/applets/membership/membership-admin-applet/) | Commission, contract and reward-point processors run off FINAL invoices |
| Sibling | [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | The mirror document created in the receiving company for intercompany sales |
| Sibling | [POS General](/applets/sales-workflow/pos-general-applet/) | Cash bills (`INTERNAL_SALES_CASHBILL`) share the same posting engine and return path |

## Screens and menus

Route root: `applet/tnt/wavelet/erp/internal-sales-invoice-applet/`.

| Menu item | Route | What it shows |
|---|---|---|
| **Sales Invoice** | `sales-invoice` | Listing with advanced search, create and edit |
| **Line Items** | `line-items` | One row per invoice line, for line-level reporting |
| **Pick Pack Queue** | `pick-pack-queue` | Warehouse view of FINAL invoices awaiting picking, packing and delivery jobs |
| **Sales Invoice Template** | `sales-invoice-template` | Reusable invoice skeletons (`TMPL_INTERNAL_SALES_INVOICE`) |
| **Approval** | `approval-permission` | Sell-below-price approval requests raised from line items |
| **File Import** | `file-import` | Bulk create invoices from CSV |
| **Intercompany** | `intercompany` | Manual intercompany queue (invoice → purchase invoice in another company) |
| **File Export** | `file-export` | Map source fields to target headers and export |
| **Swap Serial Number** | `swap-serial` | Replace the serial number on a FINAL invoice without voiding |
| **Settings** | `settings/…` | Administrator configuration (see below) |
| **Personalization** | `personalization/…` | Per-user Default Selection and sidebar |

{{< figure src="/images/internal-sales-invoice-applet/main-listing-page.png" alt="Sales Invoice (Internal) Main Listing" caption="The listing is the entry point to create, edit, print and void." >}}

{{< figure src="/images/internal-sales-invoice-applet/search-filter.png" alt="Advanced Search Drawer" caption="Advanced search: filter by document number ranges, dates, customer, branch and status." >}}

### The create / edit form

The form is a set of tabs whose order is configurable (Settings → Default Selection → *Details Tab Ordering*). The full set is: **Search Document**, **Main Details**, **E-Invoice**, **Account**, **Lines**, **Delivery Details**, **KO For**, **ARAP**, **Delivery Trips**, **Settlement**, **Settlement Adjustment**, **Department Hdr**, **Posting**, **TraceDocument**, **Contra**, **Doc Link**, **Export**, **Attachments**, **Gross Profit**, **Service Notes**. Most tabs can be hidden with the `HIDE_*_TAB` settings listed under Configuration.

{{< figure src="/images/internal-sales-invoice-applet/create-form.png" alt="Invoice Creation Form — Main Details" caption="Main Details: company, branch, location, delivery branch/location, sales agent, transaction date, currency." >}}

{{< figure src="/images/internal-sales-invoice-applet/ko-search-document.png" alt="KO For — Search Sales Order" caption="KO For: knock off a Sales Order, Delivery Order, Jobsheet, Sales Quotation, Stock Transfer, GRN or another Sales Invoice." >}}

{{< figure src="/images/internal-sales-invoice-applet/entity-selection.png" alt="Entity Selection — Account Tab" caption="Account: pick the customer entity; credit terms, currency and billing address are copied in." >}}

{{< figure src="/images/internal-sales-invoice-applet/item-selection.png" alt="Select Item Dialog" caption="Lines: item search with the stock balance column visible when SHOW_ITEM_STOCK_BALANCE is on." >}}

{{< figure src="/images/internal-sales-invoice-applet/e-invoice-submission.png" alt="E-Invoice Submission details tab" caption="E-Invoice: buyer identification, submission type and billing period for LHDN." >}}

{{< figure src="/images/internal-sales-invoice-applet/arap-settlement.png" alt="ARAP Settlement tab showing Doc Open Amount and Contra values" caption="ARAP: open amount, settlements and contra against this invoice." >}}

{{< figure src="/images/internal-sales-invoice-applet/pick-pack-queue.png" alt="Pick Pack Queue Listing with Delivery Job drawer" caption="Pick Pack Queue: create delivery jobs from FINAL invoices." >}}

{{< figure src="/images/internal-sales-invoice-applet/delivery-details.png" alt="Delivery Details tab for assigning logistics" caption="Delivery Details: delivery entity and address for the shipment." >}}

### Settings menu

| Settings entry | Route | Purpose |
|---|---|---|
| Application Settings | `settings/field-settings` | Every hide/show, mandatory and behaviour toggle (shared *Field Configuration* screen) |
| Default Selection | `settings/default-selection` | Default branch, location, pricing scheme, pricebook, decimal precision, transaction-date logic, tab order |
| Printable Format Settings | `settings/printable-format-settings` | Register printable formats for `INTERNAL_SALES_INVOICE` |
| Branch Settings | `settings/branch-settings` | Per-branch header/footer, images and PIN |
| Workflow Settings | `settings/workflow-settings` | Link a company to a workflow process for this document type |
| Email Template | `settings/email-template` | Choose the template code used when emailing an invoice |
| Custom Resource Bundle Configuration | `settings/translation-settings` | Relabel any field or menu |
| Custom Field Placement | `settings/custom-field-placement` | Place tenant custom fields on the Main, Account, E-Invoice and Line Item tabs |
| Webhook | `settings/webhook` | Subscribe external endpoints to document events |
| Feature Visibility | `settings/feature-visibility` | Team-level feature access |
| Permission Set / User / Team / Role / Client-Side Permission / Permission Wizard / Role Pricing Scheme Link | `settings/*-listing` | Access control (shared permission module) |
| Release Notes, Applet Log | `settings/release-notes`, `settings/applet-log` | Version history and audit of settings changes |

{{< figure src="/images/internal-sales-invoice-applet/settings-page.png" alt="Applet Settings" caption="Settings landing page." >}}

## Configuration

### Before you can use it

| Prerequisite | Where | Why the invoice needs it |
|---|---|---|
| Company, branch and location | [Organisation](/applets/master-data/organisation-applet/) | Main Details requires all three; picking a branch pre-fills its `MAIN_LOCATION` |
| Company default GL codes for `DEBTOR` (and `DEBTOR_NON_TRADE` if any customer has AR type `AR_OTHER`), `SALES`, `SALES_DISCOUNT`, `OUTPUT_TAX`, `COGS`, `FOREX_GAIN`, `FOREX_LOSS` | [Chart of Account](/applets/master-data/chart-of-account-applet/) | The journal processor throws `MISSING_DEFAULT_GL_CODE: DEBTOR` (or `DEBTOR_NON_TRADE`) when the receivable account is unmapped (`JournalPostingService.java` L335–L341). Unmapped `SALES` / `OUTPUT_TAX` / `COGS` produce no such message: the service leaves the journal line's GL code empty (L186–L190, L253, L1237–L1238) and the insert then fails on the database constraint `glcode_guid_not_null_check` on `bl_fi_jrnl_line` (platform changeset `202104141527`), so the posting job errors without naming the missing code. Map all of them before the first FINAL |
| Tax codes and, for withholding, WHT codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Each line carries a tax code; the tax amount posts to `OUTPUT_TAX` |
| Customer entities with an AR type (`AR_TRADE` or `AR_OTHER`), credit terms and, optionally, a credit limit | [Customer](/applets/master-data/customer-applet/) | The AR type decides whether the receivable posts to `DEBTOR` or `DEBTOR_NON_TRADE` (`JournalPostingService.java` L1576–L1577). A customer whose `credit_limit_status` or `credit_term_status` is `BLACKLISTED` cannot be finalised (`ENTITY_BLACKLISTED`, `GenericDocumentService.java` L3837–L3878) |
| Inventory items with stock at the invoicing location | [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | Quantity signum is −1; the backend rejects FINAL when a basic item has no stock at the location (see *Lifecycle and effects*); serial, batch and bin items must have matching allocations |
| Pricing scheme and pricebook | [Pricebook](/applets/master-data/pricebook-applet/) | Default Selection points the applet at a retail pricing scheme and a pricebook |
| Settlement methods with a cashbook and GL code | [Cashbook](/applets/master-data/cashbook-applet/) | Payment-tab lines fail posting with `MISSING_CASHBOOK: STL_MTHD [code]` / `MISSING_GL_CODE: STL_MTHD [code]` otherwise (`JournalPostingService.java` L191–L211) |
| Document numbering | Tenant running-number setup | Tenant, company and branch running numbers are generated when the document goes FINAL (`GenericDocumentService.java` L634–L640) |
| API permissions `TNT_API_DOC_INTERNAL_SALES_INVOICE_{CREATE,READ,UPDATE,DELETE}_TGT_GUID` | Settings → Permission Set / User / Team / Role | Without READ on a branch target the user sees no invoices; branch targets also filter the Default Selection branch list unless the user is `TNT_TENANT_ADMIN` or `TNT_TENANT_OWNER` |
| Workflow process (optional) | [Workflow Design](/applets/master-data/workflow-design-applet/) then Settings → Workflow Settings | Enables the Workflow Status / Resolution fields |
| E-Invoice profile (optional) | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | `INTERNAL_SALES_INVOICE` is one of the e-Invoice document types; `skip_einvoice` is copied from the customer entity at FINAL |

### Applet settings

**Where the settings live.** `app.routing.ts` mounts three settings surfaces for this applet: the applet's own **Default Selection** component (`settings/default-selection`, and a personal copy under `personalization/personal-default-selection`), the **shared** `FieldConfigurationComponent` from blg-shared-utilities as **Application Settings** (`settings/field-settings`, gated by `sessionStorage.appletCode = salesInvoiceApplet`), and the shared **Branch Settings** screen (`settings/branch-settings`). Every key below is *declared* in `models/applet-settings.model.ts`, *rendered* by a control in one of those screens, *persisted* by `SessionActions.saveMasterSettingsInit` (Default Selection saves its own form; the shared screen saves its whole form in `onSave()`, `field-configuration.component.ts` L2686–L2690) and *consumed* by a component, effect or service in this applet. Keys that fail any of those four proofs are listed separately at the end of this section, not in the tables.

Who can change them: any user who can open Settings (the `settings/*` routes are guarded by the applet's permission resolver; there is no finer per-setting authority). Personalization → Default Selection lets an individual user override branch and location for themselves only.

#### Default Selection (applet-local)

| Setting | Key | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| Default Branch | `DEFAULT_BRANCH` (+ `DEFAULT_COMPANY`) | Pre-fills company and branch on a new invoice; picking a branch also copies its `MAIN_LOCATION` into Default Location | none (`default-settings.component.ts` L147–L149) | New invoices open on the new branch; existing invoices unchanged |
| Default Location | `DEFAULT_LOCATION` | Pre-fills the stock location | none | New invoices take stock from the new location |
| Default Pricing Scheme | `PRICING_RETAIL_GUID` | Pricing scheme used when items are added | none | Unit prices on new lines follow the new scheme |
| Default Pricebook | `DEFAULT_PRICEBOOK` | Pricebook loaded at start-up (`app.component.ts` L96–L98) | none | Pricebook prices on new lines |
| Unit Price Decimal Precision | `DEFAULT_DECIMAL_PRECISION` / `DEFAULT_DECIMAL_STEP` | Decimal places on unit prices, validated 2–4 | 2 (`DEFAULTS.DECIMAL_PRECISION`, L79 and L91) | Rounding of unit prices entered after the change |
| Transaction Date Logic | `DATE_TXN_LOGIC` | Which date the backend writes into `date_txn` at FINAL: Finalized Date (`USE_FINAL`), Created Date (`USE_CREATED`), Updated Date (`USE_UPDATED`) or the date typed on the form (`USE_DATE_TXN`) | `USE_DATE_TXN` (L81, L93; the effect also falls back to it, `sales-invoice.effects.ts` L3232) | Applied by `GenericDocumentService.java` L371–L385 to every invoice finalised after the change |
| Details Tab Ordering | `SALES_INVOICE_DETAILS_TAB_ORDER` | Drag-and-drop order of the form tabs; tabs added by an upgrade are appended | the order listed under *Screens and menus* (L96–L110) | Tab order for all users |

#### Application Settings (shared Field Configuration screen)

Every control on this screen is a `new FormControl()` patched from the stored value, so a toggle that has never been saved is **off**, with two exceptions cited in the tables: the pricing-column and department `HIDE_*` keys, which the screen initialises to **hidden** for this applet code (`shouldHideSetting` / `hideDepartmentSetting`, `field-configuration.component.ts` L2333–L2374), and the two dropdowns with a null fallback. Note the mechanics: the applet itself treats an unsaved (null) key as *shown*; the columns become hidden the first time an administrator saves this screen without switching those toggles off.

*Behaviour toggles* — these change what the applet does, not only what it shows. "Consumed in" names the file that reads the key.

| Section | Setting | What it controls | Default | Effect when changed | Consumed in |
|---|---|---|---|---|---|
| Gen Doc Listing | `DISABLE_GEN_DOC_LISTING` | Listing does not load rows until a search is run | off | Faster first paint on large tenants | `sales-invoice-listing.component.ts` |
| Gen Doc Listing | `ENABLE_CREDIT_LIMIT_FILTER` | Calls the credit-availability service (credit limit − AR balance − open amounts) and shows the result for the selected customer | off | Display only; no FINAL block (`sales-invoice-edit.component.ts` L613–L620, `EntityCreditAvailabilityService.java`) | `sales-invoice-edit.component.ts`, listing |
| Gen Doc Listing | `DEFAULT_TRANSACTION_DATE` | Listing and Line Items open pre-filtered to a date range | none | Applied at next open | listing, `line-items-listing.component.ts` |
| Gen Doc Listing | `DEFAULT_POSTING_STATUS` | Listing opens pre-filtered to DRAFT or FINAL | none (all) | Applied at next open | listing |
| Gen Doc Listing | `SORT_ORDER` | Listing sort direction | none (server order) | Applied at next open | listing |
| Gen Doc Listing | `DISABLE_BACK_BUTTON_POP_UP` | Suppresses the "discard changes?" prompt on Back | off | Unsaved edits are dropped silently | `sales-invoice-edit.component.ts` |
| Create & Print | `ENABLE_AUTO_POPUP` | Opens the printable as soon as the document is saved | off | Print dialog after every save | listing, `sales-invoice.effects.ts` |
| Doc Settings | `ENABLE_DUPLICATE_REFERENCE_CHECK` | Client-side lookup that stops a second invoice with the same Reference before save | off | Duplicate reference blocked in the form (not by the backend) | `main-details.component.ts` |
| Doc Settings | `ENABLE_SALES_AGENT_AUTOFILL` | Sales agent pre-filled from the logged-in employee when a customer is selected | off | New invoices carry the login's agent | `select-customer-listing.component.ts` |
| Doc Settings | `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Resolves the employee record behind the login on a new (TEMP) document | off | Employee fields populated | `main-details.component.ts` L624 |
| Doc Settings | `ALLOW_EDIT_SALES_AGENT_FINAL` | Sales agent stays editable after FINAL | off | Agent change allowed on FINAL documents | `main-details.component.ts` |
| Doc Settings | `DISABLE_LINES_FOLLOWING_HDR_SALES_AGENT` / `DISABLE_LINES_FOLLOWING_HDR_BUDGET` | Line sales agent / budget no longer copied from the header | off | Lines keep their own values | line `main-details.component.ts` |
| Doc Settings | `CANNOT_EDIT_CURRENCY_RATE` | Exchange-rate field read-only | off | Rate always from the currency master | `main-details.component.ts` |
| Doc Settings | `SHOW_FOREX_DATA_SOURCE` | Shows where the exchange rate came from | off | Extra label next to the rate | `main-details.component.html` |
| Doc Settings | `SIMPLIFIED_UI` | Hides group discount, trade-in and other advanced line features (shared simplified-UI component) | off | Fewer controls on Lines | `add-line-item.component.ts`, `gen-doc-simplified-ui.component.html` |
| Doc Settings | `SHOW_CUSTOM_DOC_NO` | Exposes the Custom Document Number field | off | Field visible on Main Details | `main-details.component.html` |
| Workflow Selection | `ENABLE_IMPORT_EXPORT` | Enables Import and Export controls on the form | off | Import/Export tabs usable | line `main-details.component.html`, `account-shipping-address.component.html` |
| Workflow Selection | `HIDE_SELECT_FROM_ANOTHER_CUSTOMER_BUTTON` | Hides the "select from another customer" button on the e-Invoice submission tab | off | Button removed | `submission.component.html` |
| Entity Details | `ENABLE_BRANCH_FILTER` | KO For searches limited to the invoice's branch | off | Fewer source documents offered | `knock-off-*.component.ts` |
| Entity Details | `ENABLE_VEHICLE_TAB` | Vehicle number on the Account tab (workshop use) | off | Vehicle sub-tab shown | `account-entity-details.component.ts` |
| Shipping | `SELECT_SHIPPING_ENTITY` | Ship-to can be a different entity from the bill-to | off | Shipping entity picker shown | `account-shipping-address.component.html` |
| Lines | `SHOW_ITEM_STOCK_BALANCE` (label: *Disallow negative stock for basic item (validate stock balance)*) | Two effects: shows the stock-balance column in item search, **and** is sent to the backend as `validate_stock_balance` at FINAL (`sales-invoice.effects.ts` L3235–L3242) | off in the UI, but the backend validates when the key has never been saved (`GenericDocumentService.java` L390–L392 defaults to `true`) | Saving it **off** disables the backend stock check for this applet; saving it on (or never saving) keeps it | `line-search-item-listing.component.ts` L224, effects |
| Lines | `VALIDATE_STOCK_ON_FINALIZE` | **Client-side** pre-check before FINAL: compares basic-item PNS lines with stock at the header location and opens a warning dialog the user can confirm past (`stock-validation.service.ts` L47–L75) | off | Warning dialog appears; it never replaces the backend check above | `stock-validation.service.ts`, `sales-invoice-edit.component.ts` L546, listing L733 (bulk FINAL) |
| Lines | `ALLOW_NEGATIVE_AMOUNT_TXN_IN_LINES` | Negative line amounts accepted | off | Credits can be keyed as negative lines | `line-item-listing.component.html`, edit |
| Lines | `ENABLE_EDITING_UNIT_PRICE_STD` | Standard unit price editable in the line | off | Std price field unlocked | line `main-details.component.ts` |
| Lines | `DISABLE_LINE_ITEM_NAME_EDIT` | Item name locked to master data | off | Name read-only | line `main-details.component.html` |
| Lines | `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT` | Maximum item-name length | off / none | Validator added to the name field | line `main-details.component.ts` |
| Lines | `HIGHLIGHT_STOCK_COST_ROWS` | Highlights lines priced at or below cost in the Lines grid | off | Row colouring | `line-item-listing.component.ts` |
| Lines | `SHOW_PACKING_DIMENSIONS`, `SHOW_BUDGET` | Extra line sections | off | Sections visible | line `main-details.component.html`, `item-details.component.html` |
| Line Permission | `DISALLOW_SELL_BELOW_MIN_PRICE` | Line form is marked invalid when the net price is below the item's minimum price, unless the user holds `ALLOW_SELL_BELOW_MIN_PRICE` or the line was approved (`approvalStatus === 'APPROVED'`) — `main-details.component.ts` L2167–L2172 | off | Client-side block; the backend does not re-check | line `main-details.component.ts`, `item-details.component.ts` |
| Line Permission | `DISALLOW_SELL_BELOW_REPLACEMENT_PRICE` / `DISALLOW_SELL_BELOW_MA_COST` | Same client-side block against replacement price / moving-average cost, bypassed only by the matching `ALLOW_SELL_BELOW_*` permission (no approval path) — L2175–L2188 | off | Client-side block; the backend `checkSalesBelowCost` runs only when a caller sends `disallow_sell_below_cost`, which this applet never does | as above |
| Line Permission | `DISALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX` | Blocks prices above the standard price unless `ALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX` | off | Client-side block | line `main-details.component.ts` L2160–L2163 |
| Line Permission | `HIDE_PRICE_SELL_BELOW_MIN_PRICE` / `…_REPLACEMENT_PRICE` / `…_MA_COST` | Hides the reference price in the warning | off | Price hidden | line `main-details.component.html` |
| Line Permission | `WARN_ZERO_UNIT_PRICE_BEFORE_ADD` | Confirmation prompt when adding a zero-price line | off | Prompt shown | `add-line-item.component.ts`, edit |
| Line Permission | `DISABLE_EDITING_AMOUNT_TXN` | Transaction amount locked (price × quantity only) | off | Amount field read-only | line `main-details.component.ts` |
| Line Permission | `RESTRICT_ITEM_PRICE_EDIT_BY_TYPE` | Price editable only with the per-item-type `ALLOW_<TYPE>_ITEM_PRICE_EDIT` permission | off | Price locked for users without the permission | line `main-details.component.ts` |
| KO For | `ENABLE_MULTIPLE_KO` | Knock off several source documents into one invoice | off | Multi-select in KO tabs | `knock-off-*.component.ts` |
| KO For | `FILTER_ITEMS_BY_REQUIRED_DELIVERY` | KO listing shows only lines still to be delivered | off | Delivered lines hidden | `knock-off-jobsheet`, `knock-off-delivery-order` |
| KO For | `ENABLE_EDIT_PAYMENT_DATE` | Settlement line date editable in Settlement Adjustment | off | Date editable | `settlement-adjustment-listing.component.ts` |
| KO For | `ENABLE_EDIT_SETTLEMENT_FINAL` | Settlement lines editable on FINAL documents (total must not change — backend rule, see *Lifecycle*) | off | Settlement tab unlocked after FINAL | `sales-invoice-edit.component.ts` |
| Email Settings | `ENABLE_EDIT_SETTLEMENT_DATE` | Payment line date editable | off | Date editable on the Payment tab | `add-payment.component.ts`, `payment-listing.component.ts` |
| Credit Card | `MANDATORY_CARD_NO`, `MANDATORY_NAME`, `MANDATORY_CARD_ISSUER`, `MANDATORY_CARD_EXPIRY`, `MANDATORY_APPROVAL_CODE`, `MANDATORY_BATCH`, `MANDATORY_CARD_TYPE`, `MANDATORY_CVV` | Card fields required on a card settlement line | off | Validators added | `add-payment.component.ts`, `add-settlement-adjustment.component.ts` |
| Server Doc Type | `DISABLE_EXPORT_PRINT_ON_DRAFT` | Print and export only on FINAL | off | Buttons disabled on drafts | listing, edit |
| Email Settings | `EDIT_CONTRA_TXN_DATE` | Contra date editable (otherwise the latest date among the knocked-off documents) | off | Date field unlocked | `add-contra.component.ts`, `edit-contra.component.ts` |
| Email Settings | `HIDE_DELETE_CONTRA` | Hides delete on contra lines unless the user holds `SHOW_DELETE_CONTRA` | off | Button removed | `edit-contra.component.html` |
| Applet-specific (top of screen) | `POS_FOC_ITEM` | Allow marking a line free-of-charge | off | FOC checkbox shown | line `main-details.component.html` |
| Applet-specific | `HIDE_LINE_ITEMS_MENU`, `HIDE_PICK_PACK_QUEUE_MENU`, `HIDE_SALES_INVOICE_TEMPLATE_MENU`, `HIDE_FILE_IMPORT_MENU`, `HIDE_INTERCOMPANY_MENU`, `HIDE_FILE_EXPORT_MENU`, `HIDE_APPROVAL_MENU`, `HIDE_SWAP_SERIAL_NUMBER_MENU` | Removes the sidebar item for everyone except users holding the matching `SHOW_*` client-side permission (`updateMenuItem(state, !SHOW && HIDE)`, `app.component.ts` L143–L151); `HIDE_LINE_ITEMS_MENU` has no permission override | off | Menu item removed at next load | `app.component.ts` |
| Hide/Show Fields | `SHOW_EMP_REF_NO` | Employee reference number on the e-Invoice submission tab and listing | off | Field shown | `submission.component.html`, listing |
| Vertical UI | `VERTICAL_ORIENTATION` | Renders tabs as a vertical stack; the `EXPAND_*` keys below open a section by default | off | Layout change on all screens | 24 components |

*Hide / show and expand toggles* — cosmetic. Exact keys per screen section; every key is off (shown) by default unless the row says otherwise.

| Section | Keys | Default |
|---|---|---|
| Gen Doc Listing | `HIDE_SERIAL_NUMBER`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_CLONE_BUTTON`, `HIDE_SEND_EMAIL_BUTTON` | off; the button keys are overridden per user by `SHOW_GENDOC_*_BUTTON` permissions |
| Gen Doc Fields | `HIDE_SERVER_DOC_1`, `HIDE_SERVER_DOC_2`, `HIDE_SERVER_DOC_3` (tenant / company / branch numbers), `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1`, `HIDE_CLIENT_DOC_2`, `HIDE_CLIENT_DOC_3`, `HIDE_CLIENT_DOC_4`, `HIDE_CLIENT_DOC_5`, `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | off; each has a `SHOW_*` permission counterpart |
| Vertical UI | `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_KO_FOR`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_MAIN_ARAP`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT`, `EXPAND_MAIN_CONTRA`, `EXPAND_SETTLEMENT`, `EXPAND_POSTING`, `EXPAND_DELIVERY_TRIPS` | off (collapsed) |
| Doc Settings (Main Details) | `HIDE_PREFIX`, `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_CREATED_BY_DETAILS`, `HIDE_SOURCE_DOC_NO`, `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION`, `HIDE_MAIN_DETAILS_SALES_AGENT`, `HIDE_CRM_CONTACT`, `HIDE_BASE_CURRENCY`, `HIDE_CURRENCY`, `HIDE_CREDIT_TERMS`, `HIDE_CREDIT_LIMIT`, `HIDE_DUE_DATE`, `HIDE_REMARKS`, `HIDE_EXTERNAL_REMARKS`, `HIDE_REFERENCE`, `HIDE_MEMBER_CARD`, `HIDE_SALES_LEAD`, `HIDE_WORKFLOW_STATUS`, `HIDE_WORKFLOW_RESOLUTION` | off |
| E-Invoice sub-tabs and fields | `HIDE_SUBMISSION_TAB`, `HIDE_NOTIFICATION_TAB`, `HIDE_E_INVOICE_SUBMISSION_TYPE`, `HIDE_E_INVOICE_SUBMISSION_TYPE_2`, `HIDE_E_INVOICE_NUMBER`, `HIDE_E_INVOICE_UUID`, `HIDE_E_INVOICE_DOCUMENT_NO`, `HIDE_E_INVOICE_DOCUMENT_TYPE`, `HIDE_E_INVOICE_DOCUMENT_DATE`, `HIDE_E_INVOICE_BILLING_FREQUENCY`, `HIDE_E_INVOICE_BILLING_PERIOD_START_DATE`, `HIDE_E_INVOICE_BILLING_PERIOD_END_DATE`, `HIDE_E_INVOICE_TAX_EXEMPTION_DETAILS`, `HIDE_E_INVOICE_TAX_EXEMPTION_AMOUNT`, `HIDE_E_INVOICE_BUYER_NAME`, `HIDE_E_INVOICE_BUYERS_ID_TYPE`, `HIDE_E_INVOICE_BUYERS_ID_NO`, `HIDE_E_INVOICE_BUYERS_TAX_ID`, `HIDE_E_INVOICE_BUYERS_SALES_SERVICE_TAX_ID`, `HIDE_E_INVOICE_BUYER_EMAIL`, `HIDE_E_INVOICE_BUYER_CONTACT_NO`, `HIDE_E_INVOICE_BUYERS_ADDRESS_NAME`, `HIDE_E_INVOICE_ADDRESS_LINE_1` … `HIDE_E_INVOICE_ADDRESS_LINE_5`, `HIDE_E_INVOICE_COUNTRY`, `HIDE_E_INVOICE_STATE`, `HIDE_E_INVOICE_CITY`, `HIDE_E_INVOICE_POSTCODE` | off |
| Account sub-tabs | `HIDE_MEMBER_TAB`, `HIDE_SHIP_FROM_TAB`, `HIDE_INTERCOMPANY_TAB`, `HIDE_BILL_TO_TAB`, `HIDE_SHIP_TO_TAB`, `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT` | off |
| Lines — columns and fields | `HIDE_SALES_AGENT`, `HIDE_LINE_ITEM_CLIENT_DOC_1`, `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_QTY_BASE`, `HIDE_UNIT_PRICE_TXN`, `HIDE_AMOUNT_TXN`, `HIDE_GROUP_DISCOUNT_PERCENTAGE`, `HIDE_LINE_ITEMS_BRANCH`, `HIDE_LINE_LISTING_TOTAL_AMOUNT`, `HIDE_LINE_LISTING_TOTAL_QTY`, `HIDE_LINE_LISTING_TAX_AMOUNT`, `HIDE_REBATE_FROM`, `HIDE_REBATE_TO`, `HIDE_LINE_ITEM_DETAILS_REMARKS`, `HIDE_LINE_ITEM_TAX_EXEMPTION`, `HIDE_LINE_ITEM_EINVOICE_DETAILS` | off |
| Lines — detailed pricing columns | `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_TOTAL_DISCOUNT_AMOUNT`, `HIDE_LINE_ITEMS_GL_CODE` | **hidden** for this applet once the screen is saved (`shouldHideSetting`, L1538–L1554, L1725, L1941); each has a `SHOW_*` permission counterpart |
| Department | `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT` | **hidden** for this applet once the screen is saved (`hideDepartmentSetting`, L1922–L1925) |
| Line item main tabs | `HIDE_BIN_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BATCH_ISSUE_DATE`, `HIDE_BATCH_EXPIRY_DATE`, `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_ISSUE_LINK`, `HIDE_SALES_HISTORY`, `HIDE_SWAP_SERIAL_NUMBER` | off |
| Line item sub-tabs | `HIDE_MULTI_DISCOUNT`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DEPARTMENT`, `HIDE_DOC_LINK`, `HIDE_RELATED_DOCUMENTS`, `HIDE_DELIVERY_DETAILS`, `HIDE_DELIVERY_TRIPS`, `HIDE_ATTACHMENT_TAB` | off |
| Credit Card fields | `HIDE_CARD_NO`, `HIDE_NAME`, `HIDE_CARD_ISSUER`, `HIDE_CARD_EXPIRY`, `HIDE_APPROVAL_CODE`, `HIDE_BATCH`, `HIDE_CARD_TYPE`, `HIDE_CVV` | off |
| Header tabs | `HIDE_SERVER_DOC_TYPE`, `HIDE_DOC_SHORT_CODE_PREFIX`, `HIDE_SEARCH_BY_DOCUMENT_BUTTON`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_DOC_LINK_FROM`, `HIDE_DOC_LINK_TO`, `HIDE_EXPORT_TAB`, `HIDE_SETTLEMENT_TAB`, `HIDE_POSTING_TAB`, `HIDE_DELIVERY_TRIPS_TAB`, `HIDE_GROSS_PROFIT_TAB` | off |

{{< callout type="warning" >}}
Because the shared screen initialises the detailed pricing columns and the department fields to hidden for `salesInvoiceApplet`, the first save of Application Settings hides them for everyone. If a column disappeared from the Lines grid after an administrator visited Settings, look here first.
{{< /callout >}}

{{< figure src="/images/internal-sales-invoice-applet/settings-gen-doc.png" alt="Applet Settings - Gen Doc Listing toggles" caption="Application Settings → Gen Doc Listing." >}}

{{< figure src="/images/internal-sales-invoice-applet/settings-main-details.png" alt="Applet Settings - Main Details toggles" caption="Application Settings → Doc Settings (Main Details)." >}}

#### Rendered on the screen but not read by this applet

These controls appear on Application Settings for `salesInvoiceApplet` and are saved, but no component, effect or service in the applet reads them (checked at commit `efcad942`): `FINAL_STATUS_GUID` (*Final Button Status*), `ENABLE_AUTO_FINAL`, `SHOW_API_UPLOAD`, `HIDE_MARKETPLACE_ORDER_NO`, `HIDE_GENERATE_BUTTON`, `HIDE_FOREX_HISTORY`, `HIDE_DESCRIPTION` (read only by a shared document-view dialog), `HIDE_LINE_ITEM_TRADE_IN` (read only inside the shared simplified-UI component, so it works when `SIMPLIFIED_UI` is on), and the six sub-tab keys `HIDE_SEARCH_TAB`, `HIDE_COLLECTION_TAB`, `HIDE_STATUS_TAB`, `HIDE_EXPENSES_TAB`, `HIDE_SALES_COMMISSION_TAB`, `HIDE_CONVERT_TAB`. Switching them has no effect here.

#### Read at runtime without a control in this applet

`WORKFLOW_PROCESS_GUID` is declared in the model and read by Main Details on a new document (`main-details.component.ts` L620, L1249–L1255: it pre-selects the workflow process and its default status) but no settings screen in this applet writes it. The Workflow Settings screen instead saves a **company → process** link (`company-workflow-create.component.ts` L74–L75, both required), which is what the form uses in practice.

Fifty-three further keys in `applet-settings.model.ts` have no control anywhere (custom statuses `ENABLE_CUSTOM_STATUS_*`, department `ENABLE_*`/`INCLUDE_*`/`MANDATORY_*`, `ENABLE_SST`, `ENABLE_WHT`, `HIDE_TAX_AMOUNT`, `HIDE_SELL_BELOW_*`, `ALLOW_NEGATIVE_STOCK_WITH_CONFIRMATION`, `DEFAULT_DELIVERY_BRANCH`, `DEFAULT_DELIVERY_LOCATION`, `DEFAULT_ORIENTATION`, `DEFAULT_TOGGLE_COLUMN`, `ENABLE_FILTER_BY_TODAYS_TXN`, `MANDATORY_MAIN_DETAILS_SALES_AGENT`, `PRINTABLE`, `SALES_LEAD_OPTIONS`). They are not documented as settings.

### Document behaviour settings

| Area | How it is configured |
|---|---|
| Status flow | Fixed: DRAFT → FINAL → VOID (plus DISCARDED for drafts). No custom statuses are exposed in this applet's settings screens. |
| Posting at FINAL | Decided by the company's `posting_final_json` (`includeJobProcessorCode` / `excludeJobProcessorCode`) read by the Generic Document Primary Processor (`GenericDocumentPrimaryProcessor.java` L103–L115) — not by an applet setting. |
| Backend FINAL validations the applet can switch | Only one: `SHOW_ITEM_STOCK_BALANCE` → `validate_stock_balance` (see table above). The applet always sends `validate_points_redeemed: true` for bulk FINAL from the listing (`sales-invoice-listing.component.ts` L864–L868) and never sends `disallow_sell_below_cost` or `validate_serial_signum_zero`, so those backend checks stay at their defaults (off) for this applet. |
| Workflow status | Settings → Workflow Settings links a **company** to a **workflow process** for `INTERNAL_SALES_INVOICE` (fields: Company, Process — both required). The status is a label; it gates nothing. Sales invoices have no document approval engine — the only approval here is the line-level sell-below-price grant, which needs no workflow and is given in the Approval menu by a user holding `ALLOW_APPROVE_SELL_BELOW_PRICE`. |
| Printables | Settings → Printable Format Settings registers formats under `INTERNAL_SALES_INVOICE_APPLET_EXT_CODE_PRINTABLE_FORMAT_GUID_INTERNAL_SALES_INVOICE`; the listing resolves the format per company/branch at print time. |
| Email | Settings → Email Template selects the template code; sending is queued through the message-template processor at FINAL and from the Send Email button. |
| e-Invoice | No applet switch. `skip_einvoice` is copied from the customer entity when the invoice goes FINAL (`GenericDocumentService.java` L631–L632); submission and cancellation are handled by the My E-Invoice Portal queues. Editing submission fields needs the `ENABLE_EDIT_EINVOICE_SUBMISSION_FIELDS` or `ENABLE_EDIT_ALL_EINVOICE_FIELDS` client-side permission. |
| Webhooks | Settings → Webhook. At FINAL the backend emits `INTERNAL_SALES_INVOICE_CREATED` to subscribed endpoints (`GenericDocumentService.java` L644–L650). |
| Intercompany | Intercompany menu queues the invoice; the processor creates the mirror `INTERNAL_PURCHASE_INVOICE` (or `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`) in the target company and links the two (`IntercompanyProcessingService.java`). Failures land in an error queue visible in the same menu. |

### Feature visibility / permissions

API permissions (server-side, target = branch / company / customer): `TNT_API_DOC_INTERNAL_SALES_INVOICE_CREATE_TGT_GUID`, `…_READ_TGT_GUID`, `…_UPDATE_TGT_GUID`, `…_DELETE_TGT_GUID`; templates use the `TNT_API_DOC_TMPL_INTERNAL_SALES_INVOICE_*` set.

Client-side permissions are assigned per user, team or role under Settings → Client-Side Permission Listing. The applet reads the codes below (`app.component.ts`, `item-txn-client-side-permissions.ts`, the line `main-details.component.ts` and the edit component); the registry (`bl_applet_client_side_perm_dfn`) seeds 76 ACTIVE definitions for `salesInvoiceApplet`, and the last row lists the codes the code reads that are **not** seeded.

| Group | Permission codes | Gate |
|---|---|---|
| Re-enable a hidden menu for some users | `SHOW_SWAP_SERIAL_NUMBER` (seeded); `SHOW_PICK_PACK_QUEUE_MENU`, `SHOW_SALES_INVOICE_TEMPLATE_MENU`, `SHOW_FILE_IMPORT_MENU`, `SHOW_INTERCOMPANY_MENU`, `SHOW_FILE_EXPORT_MENU`, `SHOW_APPROVAL_MENU` (read by `app.component.ts` L99–L118, not seeded) | Overrides the tenant-wide `HIDE_*_MENU` setting |
| Buttons | `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_SAVE_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_CLONE_BUTTON`, `SHOW_DELETE_CONTRA` | Who may finalise, void, discard, clone, delete contra when the matching `HIDE_*` setting is on |
| Pricing and cost columns | `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_COSTING_DETAILS`, `SHOW_GROSS_PROFIT`, `SHOW_LAST_PURCHASE_PRICE`, `HIDE_PRICE`, `INTERNAL_SALES_INVOICE_DISPLAY_PRICING` | Reveal or hide cost and margin data per role, overriding the `HIDE_*` column settings |
| Document numbers and dates | `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1` … `SHOW_CLIENT_DOC_5`, `SHOW_TRANSACTION_DATE` | Column visibility |
| Selling below cost or above list | `ALLOW_SELL_BELOW_MIN_PRICE`, `ALLOW_SELL_BELOW_REPLACEMENT_PRICE`, `ALLOW_SELL_BELOW_MA_COST`, `ALLOW_SELL_BELOW_MA_COST_WHOLE_DOCUMENT`, `ALLOW_APPROVE_SELL_BELOW_PRICE`, `SHOW_PRICE_SELL_BELOW_MIN_PRICE` / `…_REPLACEMENT_PRICE` / `…_MA_COST` (not seeded), `ALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX` (not seeded) | Bypass the `DISALLOW_SELL_*` settings, or approve someone else's line (the approver enters email/mobile and password in the line dialog) |
| Price editing by item type | `ALLOW_ALL_ITEM_PRICE_EDIT` or one of `ALLOW_BASIC_ITEM_PRICE_EDIT`, `ALLOW_GROUPED_ITEM_PRICE_EDIT`, `ALLOW_BUNDLE_ITEM_PRICE_EDIT`, `ALLOW_COUPON_ITEM_PRICE_EDIT`, `ALLOW_SERVICE_ITEM_PRICE_EDIT`, `ALLOW_WARRANTY_ITEM_PRICE_EDIT`, `ALLOW_GL_CODE_ITEM_PRICE_EDIT`, `ALLOW_DOC_HEADER_ADJUSTMENT_ITEM_PRICE_EDIT`, `ALLOW_MEMBERSHIP_ITEM_PRICE_EDIT`, `ALLOW_MADE_TO_ORDER_ITEM_PRICE_EDIT`, `ALLOW_DIGITAL_GOODS_ITEM_PRICE_EDIT`, `ALLOW_FIXED_ASSET_REGISTER_ITEM_PRICE_EDIT`, `ALLOW_SALES_CONTRACT_ITEM_PRICE_EDIT`, `ALLOW_DELIVERY_CHARGE_ITEM_PRICE_EDIT`, `ALLOW_NSTI_ITEM_PRICE_EDIT`, `ALLOW_GROUP_DISCOUNT_ITEM_PRICE_EDIT`, `ALLOW_CURRENCY_ITEM_PRICE_EDIT` | Used only when `RESTRICT_ITEM_PRICE_EDIT_BY_TYPE` is on |
| Other | `ALLOW_VIEW_ALL_SALESMAN_TRANSACTION`, `ENABLE_SALES_AGENT_LOGIN_FILTER`, `ALLOW_CREDIT_LIMIT_FILTERING` (same effect as `ENABLE_CREDIT_LIMIT_FILTER`, per user), `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH`, `DELETE_ROUNDING_ITEM`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING`, `ENABLE_EDIT_EINVOICE_SUBMISSION_FIELDS`, `ENABLE_EDIT_ALL_EINVOICE_FIELDS` | Listing scope by sales agent, credit filter, item search, rounding line, e-Invoice edits |
| Read by the code, not seeded in the registry | the six `SHOW_*_MENU` codes above, `SHOW_PRICE_SELL_BELOW_*`, `ALLOW_SELL_ABOVE_UNIT_PRICE_STD_INCL_TAX`, `SHOW_SALES_AGENT`, `SHOW_MA_COST`, `SHOW_DEALER_COST`, `SHOW_ARAP_PNS`, `SHOW_ARAP_SETTLEMENT`, `SHOW_ARAP_DOC_OPEN`, `SHOW_ARAP_CONTRA`, `SHOW_ARAP_BAL` | Checked in code; grant them only if your tenant has them seeded (see Troubleshooting) |

Settings → Feature Visibility currently exposes a single **Teams** panel (team access) and nothing else (`feature-visibility.component.html`).

## Fields

**Main Details** (`bl_fi_generic_doc_hdr`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Company, Branch, Location | Selling company, branch and stock location | Yes | Location list follows the branch; a hidden Location still needs a value |
| Delivery Branch / Location | Where goods ship from if different | No | Hide with `HIDE_DELIVERY_BRANCH` / `HIDE_DELIVERY_LOCATION` |
| Transaction Date | Accounting date | Yes (backend) | Must not fall in a locked fiscal period (`FISCAL_PERIOD_LOCKED`); overwritten at FINAL when `DATE_TXN_LOGIC` is not `USE_DATE_TXN` |
| Currency, Currency Rate, Base Currency | Document currency and rate to base | Currency yes | Backend rejects FINAL with `FOREX_DOC_REQUIRES_NON_ZERO_XRATE` when currencies differ and the rate is empty or zero (`GenericDocumentService.java` L1702–L1720); lock with `CANNOT_EDIT_CURRENCY_RATE` |
| Sales Agent | Employee credited with the sale | No | Autofill from login with `ENABLE_SALES_AGENT_AUTOFILL` |
| Credit Terms, Credit Limit, Due Date | Copied from the customer | No | Due date derived from terms |
| Reference, Remarks, External Remarks | Free text | No | Reference can be checked for duplicates client-side |
| Doc Short Code, Tenant / Company / Branch Doc No, Custom Document Number | Numbering | Generated at FINAL | Custom number needs `SHOW_CUSTOM_DOC_NO` |
| Client Document Type, Client Doc 1–5 No | Customer-side references (PO number etc.) | No | |
| Workflow Status / Resolution | From the linked workflow process | No | Only meaningful with Workflow Settings |
| Permit No, CRM Contact, MemberCard, Sales Lead, Prefix, Tracking ID, Budget fields, Source Doc | Optional header attributes | No | |

**Account**

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Entity ID | The customer | Yes (`Validators.required` on `entityId`) | Copies name, currency, credit terms, billing and shipping addresses; the form shows a warning badge for a blacklisted entity and the backend rejects FINAL (`ENTITY_BLACKLISTED`) |
| Billing / Shipping address and contacts | Addresses printed and used for delivery | No | Ship-to may be another entity with `SELECT_SHIPPING_ENTITY` |
| Member, Intercompany, Vehicle sub-tabs | Membership card, target company, vehicle number | No | Each can be hidden |

**Lines** (`bl_fi_generic_doc_line`, `txn_type = PNS`)

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Item Code / Name | Inventory or service item | Yes | Name editable unless `DISABLE_LINE_ITEM_NAME_EDIT` |
| Branch | Branch the line belongs to | Yes | Defaults from header |
| Quantity, Quantity by UOM, UOM, UOM to Base Ratio | Quantity sold | Yes (`qty`, `txnAmt`, `netAmt`, `netAmtWithTax` are `Validators.required`) | Quantity signum −1 is filled by the backend DCO |
| Unit Price STD (incl/excl tax), Unit Discount, Unit Price Net, Unit Price Transaction, STD / Discount / Net / Txn amounts | Pricing chain | Derived | Below-cost checks compare Unit Price Net against min price, replacement price and MA cost |
| Tax Code, SST/GST/VAT, Tax Amount, WHT Code, WHT Amount, Tariff Code | Tax | Tax code from item or scheme | Tax posts to `OUTPUT_TAX` |
| GL Code | Overrides the company `SALES` account for this line | No | Hidden by default; first in GL precedence at posting |
| Serial Number, Batch Number (with Issue / Expiry Date), Bin Number tabs | Allocations for tracked items | Quantities must equal the line quantity at FINAL | Batch `batch_no` and `qty` required; issue and expiry dates optional since the fix for a customer issue; bin lines need `bin_code`, `container_measure`, `container_qty`, `qty` |
| FOC, Trade-in Serial Number, Rebate Date From/To, Remarks, E-Invoice UOM, Tax Exemption Details / Amount, Product Tariff Code, Country of Origin | Optional attributes | No | |
| Segment, G/L Dimension, Profit Center, Project | Department analysis | No | Hidden by default for this applet; line value falls back to the header value at posting (`JournalPostingService.java` L136–L138) |

**E-Invoice**: Submission Type (and Type 2), E-invoice Number, UUID, Document No / Type / Date, EMP Ref Number, Skip E-Invoice, Billing Frequency and Period, Tax Exemption, Buyer Name / ID Type / ID No / TIN / SST ID / Email / Contact, buyer address lines, Country, State, City, Postcode, Validation URL. All optional at save; LHDN validation happens in the e-Invoice queue.

**Settlement (Payment tab)** — one line per payment (`txn_type = STL_MTHD`). Types: Bank Transfer, Cash, Cheque, Post Dated Cheque, Credit Card, Debit Card, e-Wallet, FPX e-Mandate, Membership Point Currency, Open Credit, Others, PGW Merchant, PGW Provider Seamless, Voucher, TT Payment.

| Field | Required |
|---|---|
| Date, Amount (≥ 0.01) | Always |
| Cheque No (cheque), Cheque Date (post-dated), Transaction No (bank transfer / e-wallet), Voucher No (voucher), Reference (others), Points and Point Currency (membership points), Cash Back (cash) | Per type |
| Card No, Name on Card, Issuer, Expiry, Approval Code, Batch, Card Type, CVV | Per `MANDATORY_*` setting |

**Delivery Details**: delivery entity (required when a delivery record is added), address, instructions; feeds the Pick Pack Queue and Delivery Trips.

## Lifecycle and effects

| Status | Meaning | Allowed next |
|---|---|---|
| **DRAFT** | Editable; no stock, GL or AR effect; no running number | FINAL, DISCARDED, or delete |
| **FINAL** | Numbered and posted. Header and line amounts locked; settlement lines may still be edited if the total is unchanged; sales agent editable only with `ALLOW_EDIT_SALES_AGENT_FINAL` | VOID |
| **VOID** | Reversed, with a void reason | none |

**Backend checks at FINAL** — `validateGenericDocumentOnFinal` (`GenericDocumentService.java` L1623–L1699) runs these in sequence and returns every failure together; any failure rejects the FINAL:

| Check | Error code | Runs when |
|---|---|---|
| Exchange rate present and non-zero when document and base currency differ | `FOREX_DOC_REQUIRES_NON_ZERO_XRATE` | always (L1636) |
| Customer not blacklisted (`credit_limit_status` / `credit_term_status` = `BLACKLISTED`) | `ENTITY_BLACKLISTED` | sales cash bill, sales invoice, sales order, outbound DO (L1646–L1656) |
| Serial-number quantity equals line quantity; no duplicate serials | `GENERIC_DOC_LINE_QTY_BASE_AND_SERIAL_NUMBER_QTY_DOES_NOT_MATCH`, `GENERIC_DOC_LINE_SERIAL_NUMBER_ID_IS_DUPLICATED` | always (L1657) |
| Bin quantities valid | `BIN_QTY_INVALID`, `BIN_CONTAINER_QTY_INVALID`, `BIN_CONTAINER_MEASURE_INVALID`, `BIN_CONTAINER_UOM_INVALID` | always (L1659) |
| Batch quantity equals line quantity | batch error codes (L1661) | always |
| Stock exists at the location for every basic-item PNS line (quantity signum < 0) | `STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION` — "Not Enough Stock for item …" | `validate_stock_balance` is true, i.e. unless the tenant saved `SHOW_ITEM_STOCK_BALANCE = false` (L390–L392, L1666–L1668, L2062–L2160) |
| Sales below cost | (backend check exists, L1670–L1672) | only when `disallow_sell_below_cost` is sent — this applet never sends it |
| Redeemed membership points within balance | points errors (L1674–L1676) | bulk FINAL from the listing sends `validate_points_redeemed: true`; single FINAL does not |
| Transaction date not in a fiscal period locked with `LOCK_ALL` / `LOCK_TXN` | `FISCAL_PERIOD_LOCKED` — "The selected date falls within a locked fiscal period." | always when date and company are present (L1681–L1696) |

The client-side pre-checks (`VALIDATE_STOCK_ON_FINALIZE` stock dialog, zero-price confirmation, `DISALLOW_SELL_*` line validators) run before the request is sent and can be confirmed past or bypassed by permission; they are not part of this list.

**What FINAL does** once validation passes (`GenericDocumentService.java` L628–L660): copies `skip_einvoice` from the customer entity; applies `DATE_TXN_LOGIC`; generates tenant, company and branch running numbers; queues the Generic Document Primary Processor, which fans out to the sub-processors the company enables in `posting_final_json`; emits the `INTERNAL_SALES_INVOICE_CREATED` webhook; queues the sales-contract processor, the message-template (email) processor, the membership reward-point processor (L400) and the e-commerce stock-availability sync.

**Posting proof block**

| Item | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_SALES_INVOICE` | `InternalSalesInvoiceDataConsistencyObject.java` L15 |
| Amount signum | **+1** (checked on create and update) | same, L16, L21–L34 |
| Quantity signum | **−1** (filled on every line) | same, L17, L37–L44 |
| Dr/Cr equation | Line: `amount_signum × amount_txn > 0` → **credit** (`JournalPostingService.java` L123–L131), so each PNS line credits `SALES`; tax lines credit `OUTPUT_TAX` when `amount_signum > 0` (L257–L263); the balancing entity line debits `DEBTOR` (or `DEBTOR_NON_TRADE` for `AR_OTHER` customers) with the total (L322–L353). Net: **Dr Debtor / Cr Sales, Cr Output Tax**; `SALES_DISCOUNT` lines debit; `FOREX_GAIN` / `FOREX_LOSS` absorb rounding on multi-currency documents | `JournalPostingTypeHandler.java` L42–L51 (`SALES` handler) |
| GL precedence for a PNS line | line GL code (L139–L149) → header GL code → item-company GL link with txn code `SALES` (`NSTI` for trade-in lines, `ROUNDING` for header-adjustment items) → company default `SALES` (L151–L190) | `JournalPostingService.java` |
| Hard stops in posting | `MISSING_DEFAULT_GL_CODE: DEBTOR` / `DEBTOR_NON_TRADE` when the receivable account is unmapped (L335–L341); `MISSING_CASHBOOK: STL_MTHD [code]` / `MISSING_GL_CODE: STL_MTHD [code]` for a settlement line whose method has no cashbook or GL (L191–L211) | `JournalPostingService.java` |
| Settlement lines | Each Payment-tab line posts Dr the settlement method's cashbook GL / Cr Debtor, and writes a cashbook transaction line (`CASHBOOK_TXN_LINE_POSTING_JOB_PROCESSOR`) | `JournalPostingService.java` L191–L230, `JobProcessorClassName.java` L377 |
| Cost of goods sold | A separate journal built from the moving-average cost record: **Dr `COGS` / Cr stock account** (line GL → item-company link → company default; L1195–L1240). An unmapped `COGS` raises no `MISSING_DEFAULT_GL_CODE`; the line is built with an empty GL code (L1237–L1238) and the insert fails on `glcode_guid_not_null_check` | `JournalPostingService.java` L1218–L1240; `liquibase-changelog.sql` changeset `202104141527` |
| Stock processor | `INVENTORY_TRANSACTION_LINE_PROCESSOR` writes one inventory transaction per PNS line at the line branch/location with the signed quantity; `INVENTORY_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR` updates the current balance; serial, batch and bin allocations are locked to the document | `JobProcessorClassName.java` L216, L238; `InventoryTransactionLineProcessor.java` |
| What VOID reverses | `updatePostingStatusToNonFinal` (L662–L710) sets `VOID` and the void reason, voids the forex shadow document if one exists, queues `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`, removes the document from the e-Invoice submission queue and from historical aging. The void primary processor triggers the subscribed void processors: `VOID_JOURNAL_POSTING_PROCESSOR`, `VOID_INVENTORY_TRANSACTION_LINE_PROCESSOR`, `VOID_CASHBOOK_TXN_LINE_PROCESSOR`, `VOID_ARAP_CONTRA_PROCESSOR`, `VOID_KNOCK_OFF_PROCESSOR`, `VOID_MEMBERSHIP_POINTS_PROCESSOR`, `VOID_TAX_PROCESSOR` | `GenericDocumentService.java`, `VoidGenericDocumentPrimaryProcessor.java` L70–L90, `JobProcessorClassName.java` L334–L387 |
| Back to DRAFT | Not offered by this applet's UI; the backend path (`BLG_ERP_UNDO_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`, L702–L704) exists for other callers | `GenericDocumentService.java` |

A FINAL invoice that has already been settled or knocked off is normally reversed with a Sales Return or Credit Note rather than voided, so that the settlement and knock-off history stay intact.

**Editing settlement on a FINAL invoice** (`GenericDocumentService.java` L1985–L2010): the backend returns *"The document's settlement cannot be changed because its posting status is not final!"* if the document is not FINAL, *"The total settlement amount must be the same as the previous amount."* if the new `STL_MTHD` total differs, and *"No changes have been made to the settlement."* if nothing changed. Accepted changes reverse and re-create the journal and cashbook lines.

## Related applets

- [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — the usual source document; KO For copies its lines and the order is marked delivered.
- [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/) and [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) — other KO sources.
- [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/) — invoice after delivery, or deliver from the Pick Pack Queue after invoicing.
- [Stock Transfer](/applets/inventory-workflow/stock-transfer-applet/) — a KO source when goods were moved to the customer's location first.
- [Sales Invoice (No Stock Out)](/applets/sales-workflow/internal-sales-invoice-no-stock-out-applet/) — same posting without the inventory movement.
- [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/), [Sales Debit Note (Internal)](/applets/sales-workflow/internal-sales-debit-note-applet/) — reversals and adjustments against a FINAL invoice.
- [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — settles the receivable; Contra settles it against other documents at the latest of the documents' dates.
- [Recurring Sales Invoice](/applets/sales-workflow/recurring-sales-invoice-applet/) — generates invoices of this type on a schedule.
- [Sales Contract](/applets/sales-workflow/sales-contract-applet/), [Sales Commission](/applets/sales-workflow/sales-commission-applet/) — processors triggered at FINAL.
- [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/), [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — submission, validation and cancellation of the e-Invoice; tenant e-Invoice profile.
- [POS General](/applets/sales-workflow/pos-general-applet/) — cash bills use the same engine; both feed Sales Return.
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — created automatically in the buying company for intercompany sales.
- [Membership Admin](/applets/membership/membership-admin-applet/) — reward points are queued at FINAL for member invoices.
- [Customer](/applets/master-data/customer-applet/), [Organisation](/applets/master-data/organisation-applet/), [Pricebook](/applets/master-data/pricebook-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Cashbook](/applets/master-data/cashbook-applet/), [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Workflow Design](/applets/master-data/workflow-design-applet/) — master data read at entry and posting time.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A dialog listing items with "ordered / available / shortfall" appears before FINAL | `VALIDATE_STOCK_ON_FINALIZE` is on and stock at the header location is below the line quantity; this is the applet's confirmation dialog | Correct the quantity or location, or confirm to continue — the backend check below still applies |
| FINAL rejected with `STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION` — "Not Enough Stock for item …" | The backend stock check (on unless `SHOW_ITEM_STOCK_BALANCE` was saved off) found no stock for a basic item at the line's location | Receive or transfer stock to that location, or change the location on the line; do not switch the check off to get past a real shortage |
| FINAL rejected with `ENTITY_BLACKLISTED` — "Customer is blacklisted due to credit limit / overdue credit term" | The customer's `credit_limit_status` or `credit_term_status` is `BLACKLISTED` | Review the customer's credit status in [Customer](/applets/master-data/customer-applet/) and clear it after settlement |
| Final fails with `MISSING_DEFAULT_GL_CODE: DEBTOR` (or `DEBTOR_NON_TRADE`) | Company default receivable GL not mapped | Map it in [Chart of Account](/applets/master-data/chart-of-account-applet/) for the selling company |
| Invoice is FINAL but no journal appears, and the posting job shows a database error mentioning `glcode_guid_not_null_check` rather than `MISSING_DEFAULT_GL_CODE` | `SALES`, `OUTPUT_TAX` or `COGS` default GL not mapped — the posting service leaves the GL code empty and the `bl_fi_jrnl_line` constraint rejects the insert | Map them in [Chart of Account](/applets/master-data/chart-of-account-applet/), then re-run the posting job through support; map all sales defaults before the first FINAL |
| Posting fails with `MISSING_GL_CODE: STL_MTHD [code]` or `MISSING_CASHBOOK: STL_MTHD [code]` | A settlement method used on the Payment tab has no GL code or cashbook | Complete the settlement method in [Cashbook](/applets/master-data/cashbook-applet/) |
| `FOREX_DOC_REQUIRES_NON_ZERO_XRATE` | Document currency differs from the company currency and the rate is empty or 0 | Enter the rate on Main Details (unlock it if `CANNOT_EDIT_CURRENCY_RATE` is on) |
| "The selected date falls within a locked fiscal period." | Transaction date inside a period locked with `LOCK_ALL` or `LOCK_TXN` | Change the date or reopen the period in [Chart of Account](/applets/master-data/chart-of-account-applet/) |
| `GENERIC_DOC_LINE_QTY_BASE_AND_SERIAL_NUMBER_QTY_DOES_NOT_MATCH` | Serial numbers selected on a line do not add up to the line quantity | Open the line's Serial Number tab and match the count |
| Line cannot be saved: price below minimum / replacement price / MA cost | `DISALLOW_SELL_BELOW_*` on and the user lacks the matching `ALLOW_SELL_BELOW_*` permission | Grant the permission, or (minimum price only) have a user with `ALLOW_APPROVE_SELL_BELOW_PRICE` approve the line in the Approval menu |
| Cannot add a batch line — ADD stays disabled | Older builds required batch Issue and Expiry dates | Fixed: both dates are optional; upgrade the applet |
| Zero-price line saved silently | `WARN_ZERO_UNIT_PRICE_BEFORE_ADD` off | Turn it on in Application Settings → Line Permission |
| Pricing columns or Segment/Project fields vanished from the Lines grid after Settings were saved | The shared screen initialises them to hidden for this applet | Application Settings → Lines / Department, switch the `HIDE_*` toggle off and save |
| A sidebar item (Pick Pack Queue, Intercompany, Swap Serial…) missing for one user | `HIDE_*_MENU` on tenant-wide | Grant the matching `SHOW_*` client-side permission — only `SHOW_SWAP_SERIAL_NUMBER` is seeded by default; the other `SHOW_*_MENU` codes must exist in the tenant's permission definitions first |
| Print / Export greyed out on a draft | `DISABLE_EXPORT_PRINT_ON_DRAFT` | Finalise first, or turn the setting off |
| Wrong printable format opens from the listing | Format resolved per company/branch | Register the format for that company in Printable Format Settings |
| Second invoice with the same Reference rejected in the form | `ENABLE_DUPLICATE_REFERENCE_CHECK` | Use a unique reference or turn the check off (the backend does not enforce uniqueness) |
| Contra posted on an unexpected date | Contra date is the latest date among the documents knocked off | Expected; `EDIT_CONTRA_TXN_DATE` allows an override |
| Settlement edit on a FINAL invoice rejected: "The total settlement amount must be the same as the previous amount." | The Settlement Adjustment changed the total | Keep the total; use a Receipt Voucher or Credit Note for a different amount |
| Serial number corrected with Swap Serial but grids still show the old one | Older builds did not resync after the swap was processed | Fixed; reopen the document or upgrade |
| Editing a FINAL invoice's quantity shows 1 for basic-quantity items | Older edit-mode bug | Fixed; upgrade the applet |
| E-Invoice warning badge "entity differs" | Account entity and E-Invoice submission entity are different | Align the buyer on the E-Invoice tab with the Account entity |
| Intercompany mirror document not created | Processing queue error (missing target company mapping or GL) | Open the Intercompany menu, read the error queue entry, fix the target company setup and re-queue |

## Related documentation

- [Standard Sales Workflow](/guides/sales-guides/standard-sales-workflow/), [Credit Sales Workflow](/guides/sales-guides/credit-sales-workflow/), [Partial Delivery Workflow](/guides/sales-guides/partial-delivery-workflow/), [Returns and Exchanges Workflow](/guides/sales-guides/returns-exchanges-workflow/)
- [Financial Accounting module](/modules/financial-accounting/), [Inventory module](/modules/inventory/), [E-Invoice module](/modules/e-invoice/)
- [Sales Workflow applets](/applets/sales-workflow/)
