---
title: "Purchase Invoice (Internal)"
description: "Accounts-payable reference for recording supplier bills: knock off Purchase Orders and GRNs, post the creditor, purchase and input-tax journal and the stock-in, settle by payment or contra, and flag self-billed e-Invoices."
applet_code: "internal_purchase_invoice_applet"
applet_repo: "blg-applet-wavelet-internal-purchase-invoice-applet"
modules: [financial-accounting, purchasing]
related_applets:
  - internal-purchase-order-applet
  - internal-purchase-grn-applet
  - internal-purchase-requisition-applet
  - supplier-delivery-order-applet
  - internal-purchase-return-applet
  - internal-purchase-credit-note-applet
  - internal-purchase-debit-note-applet
  - internal-payment-voucher-applet
  - internal-purchase-invoice-no-stock-in-applet
  - internal-purchase-invoice-supplier-access-applet
  - my-e-invoice-portal-applet
  - supplier-applet-1
  - chart-of-account-applet
  - tax-configuration-applet
  - cashbook-applet
  - organisation-applet
  - ledger-and-journal-applet
guides:
  - /guides/purchasing-guides/standard-procurement-workflow/
  - /guides/purchasing-guides/direct-invoice-workflow/
  - /guides/purchasing-guides/invoice-first-workflow/
  - /guides/einvoice-guides/malaysia-e-invoice-guide/
sources:
  # read at refs commits: applet 078e8de (2026-09-03), blg-shared-utilities af523eb (2026-09-03), blg-akaun-platform-java 871dbf5 (2026-09-04)
  configuration:
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/app.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/models/personal-settings.model.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/knock-off-settings/knock-off-settings.component.html
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-listing/purchase-invoice-listing.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/purchase-invoice-edit.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/purchase-invoice-create.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/import-knock-off/knock-off-grn/knock-off-grn.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/account/account-entity-details/select-supplier/select-supplier-listing.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/line-item-add/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/line-item-edit/line-item-edit.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/export/export.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/payment-edit/payment-edit.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/contra-edit/contra-edit.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/state-controllers/purchase-invoice-controller/store/effects/purchase-invoice.effects.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
  fields:
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/line-item-add/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/purchase-invoice-edit.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/payment-edit/payment-edit.component.ts
  lifecycle:
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/purchase-invoice-edit.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/state-controllers/purchase-invoice-controller/store/effects/purchase-invoice.effects.ts
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/state-controllers/purchase-invoice-controller/store/reducers/purchase-invoice.reducers.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseInvoiceDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseGoodReceivedNoteDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/InventoryTransactionLineFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/GenericDocumentConverterFactory.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/VoidGenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/journalPosting/VoidJournalPostingProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/VoidInventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/JobProcessorClassName.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-applet-wavelet-internal-purchase-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/purchase-invoice-edit.component.ts
    - gh:bigledger/blg-applet-wavelet-internal-purchase-invoice-applet#13
    - gh:bigledger/blg-akaun-platform-java#1950
    - gh:bigledger/blg-intranet#4017
    - gh:bigledger/blg-intranet#3316
    - gh:bigledger/blg-intranet#3262
    - gh:bigledger/blg-wiki#82
tags:
- finance
- purchase-invoice
- intercompany
- settlement
- accounts-payable
- e-invoice
- knock-off
- line-items
weight: 120
aliases: []
date: 2026-04-11
lastmod: 2026-09-05
draft: false
---

## Overview

The **Purchase Invoice (Internal)** applet records the bills your suppliers send you. An accounts-payable clerk opens it to key in a supplier invoice — from scratch or by knocking off (pulling in) a finalised Purchase Order or Purchase GRN — and finalises it. FINAL posts the supplier liability, the purchase and the input tax to the General Ledger and books the invoiced quantities **into stock**. The invoice is then settled from its own Payment tab, by contra against a supplier deposit or credit document, or later through a Payment Voucher.

In the standard BigLedger purchase flow the **invoice is the document that moves stock**. The Purchase GRN (Internal) records receipt without a stock movement (its quantity signum is 0); the Purchase Invoice books the quantities in (quantity signum +1) and updates the item's last purchase cost. If your business needs stock booked at receipt and invoiced later, use the alternative pair [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) and [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) instead.

## Where it fits

| Direction | Document / applet | Relationship |
|---|---|---|
| Upstream | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | Knock-off source on the *KO For* tab: copies supplier, lines and prices into the invoice |
| Upstream | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | Knock-off source on the *KO For* tab; the backend has a dedicated GRN-to-invoice converter |
| Upstream (indirect) | [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) | Precede the PO / GRN. The invoice has no knock-off tab for them in the current build (the switches on the unlinked Knock Off Settings screen are read by nothing) |
| Master data | [Supplier Applet](/applets/master-data/supplier-applet-1/) | Supplier entity, AR/AP type (decides the creditor account), self-billed e-Invoice flag |
| Downstream | [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) | Settles outstanding invoices in bulk |
| Downstream | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | Returns goods against the invoice; the applet refuses VOID while an active return link exists |
| Downstream | [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) / [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) | Adjust a finalised invoice without voiding it |
| Downstream | [My E-invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) | Receives self-billed invoices for MyInvois submission |
| Downstream | [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) | Shows the journal FINAL creates |
| Sibling | [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) | The supplier-facing view of the same documents |

Modules: [Financial Accounting](/modules-v2/financial-accounting/) and [Purchasing](/modules-v2/purchasing/).

## Screens and menus

The applet's left-hand menu has six workspaces:

| Menu item | Route | What it is |
|---|---|---|
| **Internal Purchase Invoice** | `internal-purchase-invoice` | Listing plus the create/edit form |
| **Line Items** | `line-items` | One grid of every invoice line across all invoices, for bulk price/qty/tax review |
| **File Import** | `file-import` | Upload CSV/Excel of invoices, run helper checking, fix failed rows in the browser |
| **File Export** | `file-export` | Export invoice listings and bulk-print |
| **Intercompany** | `intercompany` | Inbound / Outbound queues, each split into Unprocessed and Processed |
| **Audit Trail** | `audit-trail` | Change history of documents |

File Import and File Export are removed from the menu when `HIDE_FILE_IMPORT_MENU` / `HIDE_FILE_EXPORT_MENU` are on, unless the user holds the `SHOW_FILE_IMPORT_MENU` / `SHOW_FILE_EXPORT_MENU` client-side permission (`updateMenuItem(state, !SHOW && HIDE)` in `app.component.ts`).

{{< figure src="/images/internal-purchase-invoice-applet/main-listing.png" alt="Purchase invoice listing" caption="Listing: the default date range, sort order and status filters come from Application Settings." >}}

### The edit form tabs

The tabs appear in this default order; the order is changed under *Settings > Default Selection > Details Tab Ordering*, and each tab has a `HIDE_..._TAB` switch (see Configuration).

| Tab | Shown when | Purpose |
|---|---|---|
| Search Document | Draft only | Sub-tabs *Search Purchase Order*, *Search Purchase GRN*, *Search Purchase Invoice* to look up source documents |
| Main Details | Always | Header: branch, location, dates, currency, references, credit terms |
| E-Invoice | Always | MyInvois processing status, failures, self-billed flag; an *Import/Export* sub-tab with `ENABLE_IMPORT_EXPORT` |
| Account | Always | Sub-tabs *Entity Details*, *Bill To*, *Ship To*, *Intercompany*; toggle to create a supplier inline |
| Line Items | Always | Grid of items; each line opens sub-tabs *Item Details*, *Pricing Details*, *Costing Details*, *Issue Link* (and *Budget Sub Line* with `SHOW_BUDGET`) |
| KO For | Draft only | Sub-tabs *Purchase GRN* and *Purchase Order*: pick a finalised source document and click **Knock-off** |
| Delivery Details | Hideable | Delivery branch/location and consignment parameters |
| ARAP | Hideable | Read-only: Product & Services, Settlement, Contra, Outstanding |
| Payment | Hideable | Record settlements against this invoice |
| Department Hdr | Hideable | Dimension, Profit Centre, Project, Segment |
| Posting | Hideable | Journal, Inventory, Membership Points, Cashbook and Tax posting status after FINAL |
| TraceDocument | Hideable | Journal Txn / Inv Txn rows created by FINAL |
| Contra | Hideable | Offset against supplier deposits or credit documents |
| Doc Link | Hideable | Link any other document |
| Attachment | Hideable | Upload supplier PDFs |
| Export | Hideable | Print with a printable format; *Export as PDF* button hideable |

{{< figure src="/images/internal-purchase-invoice-applet/create-purchase-invoice.png" alt="Create Purchase Invoice screen showing the initial data entry form" caption="Create: header details before the supplier and lines are added. Branch and Location are the only unconditionally required fields." >}}
{{< figure src="/images/internal-purchase-invoice-applet/account-tab-select-supplier.png" alt="Account tab with supplier selection in purchase invoice" caption="Account tab: the supplier's AR/AP type decides which creditor account FINAL posts to." >}}
{{< figure src="/images/internal-purchase-invoice-applet/ko-for-purhcase-order.png" alt="KO For tab showing source document selection using Purchase Order" caption="KO For tab: only finalised, not fully knocked-off Purchase Orders and GRNs are listed." >}}
{{< figure src="/images/internal-purchase-invoice-applet/edit-line-items-tab.png" alt="Line Items tab of a purchase invoice" caption="Line Items: which price, discount and amount columns appear is decided by the HIDE_* switches in Application Settings." >}}
{{< figure src="/images/internal-purchase-invoice-applet/recording-a-payment.png" alt="Payment tab showing payment entry for purchase invoice" caption="Payment tab: settlement methods offered here are the ones assigned to the branch in Branch Settings." >}}
{{< figure src="/images/internal-purchase-invoice-applet/contra-workflow.png" alt="Contra tab workflow for offsetting purchase invoice with existing credit" caption="Contra tab: offsets the invoice against supplier deposits or credit documents." >}}
{{< figure src="/images/internal-purchase-invoice-applet/self-billed-e-invoice.png" alt="Self-Billed E-Invoice workflow in purchase invoice" caption="E-Invoice tab: a self-billed invoice is picked up by the My E-invoice Portal after FINAL when the company's e-Invoice status is ENABLED." >}}
{{< figure src="/images/internal-purchase-invoice-applet/file-import-tab.png" alt="File Import workspace for template download and bulk upload" caption="File Import: template download, upload and Helper Checking of failed rows." >}}
{{< figure src="/images/internal-purchase-invoice-applet/intercomapny-transactions.png" alt="Intercompany transactions screen in purchase invoice applet" caption="Intercompany: inbound and outbound queues between companies in one tenant (menu shown only with the SHOW_INTERCOMPANY_PI_SCREEN permission)." >}}

### Top action buttons

| Button | Shown / enabled when (client-side) | What it does |
|---|---|---|
| **Create** | New document | Saves the draft (document status `ACTIVE`, posting status `DRAFT`) and assigns the tenant running number. Nothing is posted. |
| **SAVE** | Draft | Saves edits. Nothing is posted. |
| **FINAL** | Draft with a valid header, a supplier, at least one line, no duplicate serial numbers, document not locked; `HIDE_GENDOC_FINAL_BUTTON` off or the user holds `SHOW_GENDOC_FINAL_BUTTON` / `SHOW_FINAL_BUTTON` | Sends `posting_status: FINAL` with the Default Selection date logic; the backend validates and queues journal, inventory, tax and e-Invoice processing; locks the document. |
| **DISCARD** | Draft (`ACTIVE` + `DRAFT`); `HIDE_GENDOC_DISCARD_BUTTON` off or `SHOW_GENDOC_DISCARD_BUTTON` | Marks the draft `DISCARDED`. |
| **VOID** | `FINAL`, company e-Invoice status not `ENABLED`, document not locked; `HIDE_GENDOC_VOID_BUTTON` off or `SHOW_GENDOC_VOID_BUTTON` | Sends `posting_status: VOID`; the backend queues the reversal (see Lifecycle). The applet first refuses with *The invoice has already been linked with a purchase return* if an active `RETURN` link exists — that check is in the applet, not the backend. |
| **SELF-BILLED** | Draft | Sets `einvoice_self_billed` on the header. Suppliers with *E-Invoice Self-Bill* in their profile get it automatically. |
| **BASE** | Any | Toggles display between transaction currency and base currency. |
| **SINGLE / MULTI PRINT** | Any; needs a printable format | Prints one document, or several in one job, with the default printable (`PRINTABLE`). |
| **CLONE** | `HIDE_CLONE_BUTTON` off | Copies the document into a new draft. |

## Configuration

### Before you can use it

| Prerequisite | Where | Why the invoice needs it |
|---|---|---|
| Company, branch, location | [Organisation Applet](/applets/master-data/organisation-applet/) | Branch and Location are the only two unconditionally required header fields. Give the branch a `MAIN_LOCATION` extension so *Default Selection* can auto-fill the location. |
| Supplier entity with an AR/AP type | [Supplier Applet](/applets/master-data/supplier-applet-1/) | The entity's type decides the payable account: `AP_TRADE` posts to the company default `CREDITOR`, `AP_OTHER` to `CREDITOR_NON_TRADE`, `AP_EMPLOYEE` to `EMPLOYEE_OTHER_PAYABLE`. Set *E-Invoice Self-Bill* on the supplier if every invoice should be self-billed. |
| Company default GL codes | [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) (company GL-code links) | FINAL needs the creditor code for the supplier's type plus `PURCHASE`, `INPUT_TAX` and, when used, `PURCHASE_DISCOUNT`, `PURCHASE_RETURN`, `FOREX_GAIN`, `FOREX_LOSS`. A missing creditor mapping makes FINAL fail with `MISSING_DEFAULT_GL_CODE: CREDITOR` (`JournalPostingService`, the debtor/creditor line block). |
| Item GL overrides (optional) | Item maintenance — item-company GL-code link with transaction code `PURCHASE` | A line's purchase account is resolved in this order: GL code on the line → GL code on the document header → the item's company link for `PURCHASE` → company default `PURCHASE`. |
| Tax codes | [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/) | Line tax posts to the company default `INPUT_TAX`. The WHT code picker on a line is hidden by default (`HIDE_WHT_CONFIG_SELECTION`). |
| Cashbook and settlement methods | [Cashbook Applet](/applets/master-data/cashbook-applet/), then *Settings > Branch Settings > Default Settlement Method* | The Payment tab only offers settlement methods assigned to the branch; a settlement item with no cashbook fails posting with `MISSING_CASHBOOK: STL_MTHD [code]`. |
| Document numbering | [Organisation Applet](/applets/master-data/organisation-applet/) (running numbers) | Doc No (Tenant) is assigned when **Create** turns the `TEMP` draft into `ACTIVE`; Doc No (Company / Branch) are assigned during FINAL (`GenericDocRunningNumberService.processOtherRunningNumbers`). |
| Printable format | *Settings > Printable Format Settings* | Print, bulk print and auto-preview need at least one format marked as default; the Export tab reports *No Default Printable Selected* otherwise. |
| Permissions | *Settings > Permission Set / User Permission / Team Permission / Role Permission* | Server-side: `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_READ_TGT_GUID`, `..._CREATE_TGT_GUID`, `..._UPDATE_TGT_GUID`, `..._DELETE_TGT_GUID` (targeted by branch), `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_DELIVERY_BRANCH_READ`, or `TNT_TENANT_ADMIN` / `TNT_TENANT_OWNER`. |
| e-Invoice (Malaysia) | [My E-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | The company's `einvoice_status` must be `ENABLED` for submission; once enabled the applet hides **VOID** on finalised invoices (reducer flag `eInvoiceEnabled`). |
| Fiscal periods | [Financial Report](/applets/finance/financial-report-applet/) (fiscal year / period locks) | FINAL is rejected with `FISCAL_PERIOD_LOCKED` when the transaction date falls in a locked period (`GenericDocumentService.validateGenericDocumentOnFinal`). |

### Applet settings

**Where the settings live.** `app.routing.ts` mounts five settings screens under *Settings* (gear icon): **Application Settings** (`field-settings`) is the *shared* `FieldConfigurationComponent` from `blg-shared-utilities`, rendered for `appletCode = internal_purchase_invoice_applet`; **Default Selection** and **Branch Settings** are applet-local screens; **Printable Format Settings** stores the default format as the `PRINTABLE` key; the **Knock Off Settings** route exists but its menu entry is commented out and its switches are read by nothing. *Personalization* (user icon) holds a per-user **Default Selection** and **Sidebar** layout. All settings below are tenant-wide for the applet and can be changed by any user with access to the applet's Settings menu; personal settings apply to that user only and override the tenant value for the same key.

**How "Default" is determined.** For the shared screen the default is the value the Application Settings form shows before the tenant has saved it (the null-patch logic in `field-configuration.component.ts`; for this applet `shouldHideSetting()` pre-selects a set of line-item columns as hidden). The document form reads the stored value directly, so a key that has never been saved behaves as *Off* even where the screen shows *On*; the first **Save** of Application Settings persists every value the screen shows.

Every key listed below is declared in `applet-settings.model.ts`, rendered as a control on the screen named, persisted by that screen's save action and read by the applet (or the shared document components it is built from). Keys that are declared only — for example `ENABLE_SST`, `ENABLE_WHT`, `INCLUDE_*`, `ENABLE_CUSTOM_STATUS_*`, `ENABLE_DIMENSION`, `HIDE_E_INVOICE_TAB`, `HIDE_SUPPLIER_CODE`, `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION`, `MANDATORY_DIMENSION`, `MANDATORY_PROJECT`, `MANDATORY_SEGMENT`, `MANDATORY_PROFIT_CENTER` — have no control on this applet's screens and are not documented.

{{< figure src="/images/internal-purchase-invoice-applet/applet-configuration.png" alt="Application settings screen for purchase invoice applet configuration" caption="Application Settings: the shared field-configuration screen, filtered to this applet's switches." >}}

#### Default Selection (tenant)

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| Default Branch (`DEFAULT_BRANCH`) | Branch pre-selected on new invoices | none | Also stores the branch's company (`DEFAULT_COMPANY`) and pre-fills the location from the branch's `MAIN_LOCATION` extension. |
| Default Location (`DEFAULT_LOCATION`) | Location pre-selected on new invoices | none | Filtered to the chosen branch. |
| Unit Price Decimal Precision (`DEFAULT_DECIMAL_PRECISION`) | Decimal places for unit prices and the step of price inputs | 2 | Accepts 2–4; the input step (`DEFAULT_DECIMAL_STEP`) is derived. Multi-discount lines follow the same precision. |
| Transaction Date Logic (`DATE_TXN_LOGIC`) | Which date the backend stamps as `date_txn` at FINAL | Transaction Date (`USE_DATE_TXN`) | *Finalized Date* (`USE_FINAL`), *Created Date* (`USE_CREATED`) or *Updated Date* (`USE_UPDATED`) overwrite the keyed date when the document is finalised (`GenericDocumentService.updatePostingStatusWithChecks`). The applet sends the value with every FINAL request. |
| Details Tab Ordering (`PURCHASE_INVOICE_DETAILS_TAB_ORDER`) | Order of the edit-form tabs | Search Document, Main Details, E-Invoice, Account, Line Items, KO For, Delivery Details, ARAP, Payment, Department Hdr, Posting, TraceDocument, Contra, Doc Link, Attachment, Export | Drag to reorder; **RESET** restores the default order and clears the other Default Selection values. |

#### Personalization > Default Selection (per user)

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION` | The user's own default branch and location | none | Override the tenant defaults for this user. |
| `DEFAULT_ORIENTATION` | `HORIZONTAL` or `VERTICAL` edit-form layout for this user | none | `VERTICAL` behaves like `VERTICAL_ORIENTATION` below; `HORIZONTAL` keeps tabs. |
| `DEFAULT_TOGGLE_COLUMN` | `SINGLE` or `DOUBLE` column layout of the create/edit panel | none | `DOUBLE` widens the form; the listing also reads it when opening a row. |
| `ENABLE_INLINE_APPLET_CONFIG` | Shows a gear icon on the edit form that opens Application Settings | Off | Same key as the tenant switch; the personal value wins for this user. |
| `DEFAULT_ITEM_SEARCH_ITEM_TYPE` | Item types offered in the line-item search | none | Rendered and saved, but no component in this applet reads it — inert. |

#### Application Settings — listing and buttons

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DISABLE_GEN_DOC_LISTING` | Stops the listing from loading documents until a search is run | Off | Listing opens empty; large tenants use it to avoid the initial query. |
| `DEFAULT_TRANSACTION_DATE` | Date range pre-applied to the listing filter: `1_day`, `1_week`, `1_month` | none (no range) | Older documents need the filter widened. |
| `SORT_ORDER` | Listing sort column: `created_date`, `updated_date`, `date_txn`, `doc_reference_date_txn` | `updated_date` at runtime when unset | Changes the order of rows and of the export. |
| `DEFAULT_POSTING_STATUS` | Listing filter on posting status: `ALL`, `DRAFT`, `FINAL`, `VOID`, `DISCARDED` | none (no filter) | Rows outside the chosen status are hidden until the user changes the filter. |
| `DEFAULT_STATUS` | Listing filter on document status: `ALL` or `ACTIVE` | `ALL` | `ACTIVE` hides deleted/temp rows. |
| `FUZZY_SEARCH_COLUMNS` | Comma-separated columns the quick-search box matches against | none (built-in column set) | Overrides the built-in search columns. |
| `HIDE_CREATED_DATE`, `HIDE_UPDATED_DATE`, `HIDE_CREATED_BY_DETAILS` | Hide the audit columns / fields | Off | Removes the column from the listing and the field from the form. |
| `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_VOID_BUTTON` | Hide the corresponding action button for everyone | Off | A user holding `SHOW_GENDOC_SAVE_BUTTON`, `SHOW_GENDOC_FINAL_BUTTON` (or `SHOW_FINAL_BUTTON`), `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON` still sees it. |
| `HIDE_EXPORT_AS_PDF_BUTTON` | Hides *Export as PDF* on the Export tab | Off | Users print only through the printable formats. |
| `HIDE_CLONE_BUTTON` | Hides **CLONE** | Off | — |
| `HIDE_SEARCH_BY_DOCUMENT_BUTTON` | Hides the *Search Document* tab on drafts | Off | Source documents can still be pulled in from *KO For*. |
| `HIDE_FILE_IMPORT_MENU`, `HIDE_FILE_EXPORT_MENU` | Remove the File Import / File Export menu items | Off | Reopened per user by `SHOW_FILE_IMPORT_MENU` / `SHOW_FILE_EXPORT_MENU`. |
| `ENABLE_IMPORT_EXPORT` | Adds an *Import/Export* sub-tab to the E-Invoice tab | Off | — |
| `ENABLE_INLINE_APPLET_CONFIG` | Shows the inline gear icon that opens settings from the edit form | Off | — |
| `ENABLE_AUTO_POPUP` | Opens the print preview automatically after bulk print | Off | Passed as `preview` to the multi-print action; the single-document auto-print after FINAL is commented out in the current build. |
| `PRINTABLE` (set on *Printable Format Settings* by marking a format as **Default Selection**) | Printable format used by **SINGLE / MULTI PRINT** and the Export tab | none | Without it the print buttons are disabled and the Export tab reports *No Default Printable Selected*. |
| `ENABLE_SELECT_MODE` | Supplier picker opens in select mode with a create/edit toggle | Off | The toggle also needs the `ALLOW_TO_CREATE_EDIT_ACCOUNT` permission. |

#### Application Settings — document header

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_SERVER_DOC_1`, `HIDE_SERVER_DOC_2`, `HIDE_SERVER_DOC_3` | Hide Doc No (Tenant / Company / Branch) | Off | Reopened per user by `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`. |
| `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1`, `HIDE_CLIENT_DOC_2`, `HIDE_CLIENT_DOC_3`, `HIDE_CLIENT_DOC_4`, `HIDE_CLIENT_DOC_5` | Hide Client Doc Short Code and Client Doc 1–5 No | Off | Reopened per user by `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1` … `SHOW_CLIENT_DOC_5`. |
| `HIDE_SOURCE_DOC_NO` | Hides Source Doc No / Source Doc Short Code | Off | — |
| `SHOW_CUSTOM_DOC_NO` | Shows an editable *Custom Document Number* on the header | Off | — |
| `HIDE_REFERENCE` | Hides the Reference field (the supplier's invoice number) | Off | Hiding it also removes the *Mandatory Reference* checkbox from the settings screen. |
| `MANDATORY_REFERENCE` | Makes Reference required before save | Off | Adds a required validator to the header form. |
| `ENABLE_DUPLICATE_REFERENCE_CHECK` | Looks up the Reference (debounced, 500 ms) against existing purchase invoices | Off | Shows *Duplicate Reference PURINV…* under the field. It is a warning only; it does not block Save or FINAL. |
| `HIDE_REMARKS`, `HIDE_EXTERNAL_REMARKS`, `HIDE_DESCRIPTION` | Hide the free-text fields | Off | Remarks become the description of the journal's creditor line, so hiding it leaves that description blank. |
| `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION` | Hide Location and the delivery branch / location | Off | Location is still required; hide it only when Default Selection fills it. |
| `HIDE_CURRENCY`, `HIDE_BASE_CURRENCY` | Hide the currency selectors | Off | — |
| `CANNOT_EDIT_CURRENCY_RATE` | Locks the exchange rate to the fetched value | Off | The rate field is read-only on drafts as well as on FINAL documents. No permission overrides it in the applet code (the seeded `EDIT_CURRENCY_RATE` code is not read). |
| `SHOW_FOREX_DATA_SOURCE` | Shows where the fetched rate came from | Off | — |
| `HIDE_CREDIT_TERMS`, `HIDE_CREDIT_LIMIT` | Hide the supplier's terms and limit | Off | — |
| `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO` | Hide Tracking ID and Permit No | Off | — |
| `ALLOW_EDITING_DOC_REF_DATE` | Makes Doc Reference Date editable | Off | Otherwise the date is display-only. |
| `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Pre-fills Purchaser from the logged-in employee on a new draft | Off | No permission exempts a user from it (the seeded `DISABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` code is not read). |
| `HIDE_EXTERNAL_QUOTATION`, `HIDE_EXTERNAL_ORDER`, `HIDE_EXTERNAL_DELIVERY_ORDER`, `HIDE_EXTERNAL_INVOICE`, `HIDE_EXTERNAL_OTHERS` | Hide each External document reference and its date | **On** (hidden) | Switch off to show the supplier-side reference; the matching *Mandatory* checkboxes appear only while the field is shown. |
| `MANDATORY_QUOTATION`, `MANDATORY_ORDER`, `MANDATORY_DELIVERY_ORDER`, `MANDATORY_INVOICE`, `MANDATORY_OTHERS` | Make the External reference required before save | Off | Required validator on `xtn_doc_ref_1` … `xtn_doc_ref_5`. |
| `MANDATORY_QUOTATION_DATE`, `MANDATORY_ORDER_DATE`, `MANDATORY_DELIVERY_ORDER_DATE`, `MANDATORY_INVOICE_DATE`, `MANDATORY_OTHERS_DATE` | Make the External reference date required before save | Off | Required validator on the matching date field. |
| `HIDE_DOCUMENT_LINKS` | Hides the document-links block on the header | **On** | Switch off to show linked documents on the header. |
| `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | Hide individual ARAP figures | Off | Reopened per user by `SHOW_ARAP_PNS`, `SHOW_ARAP_SETTLEMENT`, `SHOW_ARAP_DOC_OPEN`, `SHOW_ARAP_CONTRA`, `SHOW_ARAP_BAL`. |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT` | Hide each Department header field | Off | Hidden fields are not posted to the journal lines' dimension columns. There is no *Mandatory* control for these fields on this applet's screen. |
| `SHOW_BUDGET` | Shows the *Budget Sub Line* tab and budget picker on lines | Off | Needs vote books from the Budget applets. |
| `DISABLE_LINES_FOLLOWING_HDR_BUDGET` | Stops lines inheriting the header budget | Off | Each line's budget is picked manually. |

#### Application Settings — Account tab

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `ALLOW_DIFFERENT_PAYEE_THAN_SELECTED_ENTITY` | Lets the payee on Bill To differ from the selected supplier | Off | Payee becomes editable. |
| `HIDE_ENTITY_BRANCH` | Hides the supplier branch selector | Off | — |
| `HIDE_ENTITY_DETAILS_CURRENCY`, `HIDE_ENTITY_DETAILS_STATUS`, `HIDE_ENTITY_DETAILS_IDENTITY_TYPE`, `HIDE_ENTITY_DETAILS_DESCRIPTION`, `HIDE_ENTITY_DETAILS_TYPE`, `HIDE_ENTITY_DETAILS_ID_NUMBER`, `HIDE_ENTITY_DETAILS_EMAIL`, `HIDE_ENTITY_DETAILS_PHONE_NUMBER` | Hide fields on *Entity Details* | Off | — |
| `HIDE_SUPPLIER_CATEGORY_TAB`, `HIDE_SUPPLIER_LOGIN_TAB`, `HIDE_SUPPLIER_PAYMENT_CONFIG_TAB` | Hide tabs of the inline supplier form | Off | Applies when a supplier is created from the invoice. |
| `HIDE_BILL_TO_TAB`, `HIDE_INTERCOMPANY_TAB` | Hide the *Bill To* / *Intercompany* sub-tabs | Off | The Intercompany sub-tab additionally needs the `SHOW_INTERCOMPANY_PI_SCREEN` permission. |
| `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT` | Hide the contact blocks on Bill To / Ship To | **On** | Switch off to capture contact person details. |

#### Application Settings — Line Items

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_AMOUNT_TXN`, `HIDE_TOTAL_TXN_AMOUNT`, `HIDE_LAST_PURCHASE_PRICE` | Hide the standard price incl. tax, the pricing scheme, the transaction price / amount / total and the last purchase price | Off | Reopened per user by `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_AMOUNT_TXN`, `SHOW_LAST_PURCHASE_PRICE`. |
| `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX` | Hide the other price columns | **On** | Switch off to show; reopened per user by the matching `SHOW_UNIT_PRICE_…` permission. |
| `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX` | Hide the discount columns | **On** | Reopened per user by `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`. |
| `HIDE_MULTI_DISCOUNT` | Hides the multi-discount sub-tab | Off | — |
| `HIDE_QTY_BASE` | Hides the base quantity | Off | Reopened per user by `SHOW_QTY_BASE`. |
| `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | Hide the UOM quantity and the UOM-to-base ratio | **On** | Reopened per user by `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`. |
| `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_SST_VAT_GST_AMOUNT` | Hide the standard / net amounts and the tax amount column | **On** | Reopened per user by `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`. |
| `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | Hide the tax code / WHT code pickers on a line | **On** | Switch `HIDE_TAX_CONFIG_SELECTION` off to key input tax per line; reopened per user by `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`. |
| `HIDE_LINE_ITEMS_GL_CODE` | Hides the per-line GL code picker | **On** | Switch off to override the purchase account per line (first step of the GL precedence). |
| `HIDE_LINE_ITEMS_BRANCH` | Hides the per-line branch | Off | — |
| `HIDE_COSTING_DETAILS` | Hides the *Costing Details* sub-tab | Off | Reopened per user by `SHOW_COSTING_DETAILS`. |
| `HIDE_LANDED_COST` | Hides the landed-cost field | Off | — |
| `HIDE_SERIAL_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BATCH_ISSUE_DATE`, `HIDE_BATCH_EXPIRY_DATE` | Hide the tracking fields on *Item Details* | Off | Serial numbers are still validated at FINAL for serialised items. |
| `HIDE_ISSUE_LINK`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DEPARTMENT`, `HIDE_DOC_LINK`, `HIDE_DELIVERY_DETAILS`, `HIDE_CHILD_ITEMS_TAB` | Hide line-level sub-tabs and blocks | Off | — |
| `ENABLE_EDITING_UNIT_PRICE_STD` | Lets users overwrite the standard unit price | **On** | Switch off to lock prices to the pricing scheme. |
| `DISABLE_EDITING_AMOUNT_TXN` | Locks the line amount | Off | Amount is derived from quantity × price only. |
| `DISALLOW_LINE_ITEM_EDIT` | Makes existing lines read-only | Off | A user with the `ALLOW_LINE_ITEM_EDIT` permission can still edit. |
| `DISABLE_LINE_ITEM_NAME_EDIT` | Makes the item name read-only | Off | — |
| `ENABLE_ITEM_NAME_MAX_LIMIT`, `ITEM_NAME_MAX_LIMIT` | Cap the item name length | Off / none | The number field appears only while the switch is on. |

#### Application Settings — tabs, payment, contra and layout

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_KO_FOR_TAB`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_ARAP_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_POSTING_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_SETTLEMENT_TAB` | Remove a tab from the edit form | Off | Hiding *Payment* or *Contra* forces settlement through the Payment Voucher. |
| `HIDE_DOC_LINK_FROM`, `HIDE_DOC_LINK_TO` | Hide one direction on the Doc Link tab | Off | — |
| `ENABLE_MULTIPLE_KO` | Allow knocking off more than one source document into one invoice | Off | The *KO For* grid becomes multi-select. |
| `ENABLE_EDIT_PAYMENT_DATE`, `ENABLE_EDIT_SETTLEMENT_DATE` | Allow the payment / settlement date to differ from today | Off | — |
| `EDIT_CONTRA_TXN_DATE` | Allow editing the contra transaction date | Off | — |
| `HIDE_CARD_NO`, `HIDE_NAME`, `HIDE_CARD_ISSUER`, `HIDE_CARD_EXPIRY`, `HIDE_APPROVAL_CODE`, `HIDE_BATCH`, `HIDE_CARD_TYPE`, `HIDE_CVV` | Hide each card field on a card settlement | Off | — |
| `MANDATORY_CARD_NO`, `MANDATORY_NAME`, `MANDATORY_CARD_ISSUER`, `MANDATORY_CARD_EXPIRY`, `MANDATORY_APPROVAL_CODE`, `MANDATORY_BATCH`, `MANDATORY_CARD_TYPE`, `MANDATORY_CVV` | Require each card field on a card settlement | Off | — |
| `HIDE_QUOTATION`, `HIDE_ORDER`, `HIDE_DELIVERY_ORDER`, `HIDE_INVOICE`, `HIDE_INVOICE_DATE`, `HIDE_OTHERS` | Hide the reference fields on a payment line | **On** | Reopened per user by `SHOW_QUOTATION`, `SHOW_ORDER`, `SHOW_DELIVERY_ORDER`, `SHOW_INVOICE`, `SHOW_OTHERS`. |
| `VERTICAL_ORIENTATION` | Replace horizontal tabs with a scrolling vertical panel layout | Off | The `EXPAND_*` keys below apply only in this layout. |
| `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_KO_FOR`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_MAIN_ARAP`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_POSTING`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_MAIN_CONTRA`, `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT`, `EXPAND_SETTLEMENT`, `EXPAND_DELIVERY_TRIPS` | In vertical layout, open that panel by default | Off | The first key that is on wins (`initializeExpandedPanels`). |

**Rendered but read by nothing** (safe to ignore): `HIDE_RELATED_DOCUMENTS` and `HIDE_DELIVERY_TRIPS` appear on the screen and are saved, but no component in this applet reads them.

#### Listing keys read at runtime without a control

The listing's column configuration reads `HIDE_LISTING_BRANCH`, `HIDE_TRANSACTION_DATE`, `HIDE_EINVOICE_NUMBER`, `HIDE_EINVOICE_DATE` and `HIDE_AMOUNT_TXN_MAIN_LISTING` from the stored settings (paired with the `SHOW_LISTING_BRANCH`, `SHOW_TRANSACTION_DATE`, `SHOW_EINVOICE_NUMBER`, `SHOW_EINVOICE_DATE`, `SHOW_AMOUNT_MAIN_LISTING` permissions), but none of them has a control on this applet's Application Settings screen and none is declared in its settings model. They take effect only if the value is written by another route.

#### Knock Off Settings

The route *settings/knock-off-settings* renders `KNOCK_OFF_BY_PURCHASE_GRN`, `KNOCK_OFF_BY_PURCHASE_ORDER`, `KNOCK_OFF_BY_PURCHASE_REQUISITION`, `KNOCK_OFF_BY_SUPPLIER_DELIVERY_ORDER`, the four `KNOCK_OFF_FOR_…` twins, `ENABLE_AUTO_SCAN` and `ENABLE_VALIDATE_SERIAL`. Its menu entry is commented out in `menu-items.ts`, and no component outside the settings screen reads any of these keys. The *KO For* tab offers Purchase GRN and Purchase Order regardless of their values.

#### Branch Settings

Per-branch overrides, one record per branch, with six tabs:

| Tab | What you set |
|---|---|
| Branch Details | Branch code, name, company (read-only) and **Rounding Five Cent** for this branch |
| Item Category Filter | Item categories offered in the line-item search for this branch |
| Menu List | Which applet menu items users of this branch see |
| Pricing Scheme | Pricing schemes with *Level* and *Priority* used to resolve standard prices |
| Printable Format | Default printable with branch-specific Header, Footer and Remarks |
| Default Settlement Method | Settlement methods (each backed by a cashbook) available on the Payment tab, and the default |

#### Printable Format Settings

Create a format with **Format Code** and **Format Name**; the layout is a Jasper template maintained by BigLedger. Marking a format as **Default Selection** on the listing stores its guid in `PRINTABLE`; the branch-level default is chosen in Branch Settings.

### Document behaviour settings

| Behaviour | Controlled by |
|---|---|
| Which date is stamped as the transaction date at FINAL | `DATE_TXN_LOGIC` (Default Selection); the backend honours a header `use_date_txn` flag over it |
| Print preview after bulk print | `ENABLE_AUTO_POPUP` + `PRINTABLE` |
| Duplicate supplier-invoice-number warning | `ENABLE_DUPLICATE_REFERENCE_CHECK` (warning only) |
| Self-billed e-Invoice | Supplier profile *E-Invoice Self-Bill*, or the **SELF-BILLED** button on the draft; stored on the header as `einvoice_self_billed` |
| Ability to VOID | `HIDE_GENDOC_VOID_BUTTON` / `SHOW_GENDOC_VOID_BUTTON`; VOID is always hidden once the company's e-Invoice status is `ENABLED`; the applet refuses VOID while an active purchase-return link exists |
| Exchange-rate locking | `CANNOT_EDIT_CURRENCY_RATE` |
| Stock and serial validation at FINAL | Not an applet setting. The backend runs `validateGenericDocumentOnFinal` with `validate_stock_balance` defaulting to true and `validate_serial_signum_zero` to false; the applet sends neither flag. |
| Which processors run at FINAL | Not an applet setting. The company's `posting_final_json` include/exclude list filters the subscribers of `BLG_ERP_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`. |
| Webhooks on document events | *Settings > Webhook* |
| Approval workflow | No exposed control found (routes, menu and settings components checked at applet commit 078e8de). Use the [Workflow Design Applet](/applets/master-data/workflow-design-applet/) for approval steps before FINAL. |

### Feature visibility / permissions

Client-side permissions are granted per user, team or role under *Settings > Client Side Permission Listing* and let a user see what a `HIDE_…` setting hides tenant-wide (`updateMenuItem(state, !SHOW && HIDE)` pattern). The codes the applet's code actually reads:

| Permission | Effect |
|---|---|
| `SHOW_FILE_IMPORT_MENU`, `SHOW_FILE_EXPORT_MENU` | Restore the File Import / File Export menus for this user |
| `SHOW_INTERCOMPANY_PI_SCREEN` | Shows the Intercompany sub-tab on Account (with `HIDE_INTERCOMPANY_TAB` off) |
| `SHOW_GENDOC_SAVE_BUTTON`, `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_FINAL_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_GENDOC_VOID_BUTTON` | Restore a hidden action button |
| `SHOW_COSTING_DETAILS`, `SHOW_LAST_PURCHASE_PRICE` | Restore the *Costing Details* sub-tab / last purchase price for this user |
| `HIDE_PRICE` | Hides pricing fields on the Line Items workspace for this user |
| `ALLOW_LINE_ITEM_EDIT` | Lets this user edit lines when `DISALLOW_LINE_ITEM_EDIT` is on |
| `ALLOW_TO_CREATE_EDIT_ACCOUNT` | Shows the create/edit supplier toggle in select mode |
| `SHOW_TRANSACTION_DATE` | Enables the Transaction Date field for this user (and the listing column when hidden) |
| `SHOW_AMOUNT_MAIN_LISTING`, `SHOW_LISTING_BRANCH`, `SHOW_EINVOICE_NUMBER`, `SHOW_EINVOICE_DATE` | Restore hidden listing columns |
| `SHOW_DOC_NO_TENANT`, `SHOW_DOC_NO_COMPANY`, `SHOW_DOC_NO_BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1` … `SHOW_CLIENT_DOC_5`, `SHOW_DESCRIPTION`, `SHOW_ARAP_PNS`, `SHOW_ARAP_SETTLEMENT`, `SHOW_ARAP_DOC_OPEN`, `SHOW_ARAP_CONTRA`, `SHOW_ARAP_BAL`, `SHOW_GL_DIMENSION`, `SHOW_PROFIT_CENTER`, `SHOW_PROJECT`, `SHOW_SEGMENT`, `SHOW_QUOTATION`, `SHOW_ORDER`, `SHOW_DELIVERY_ORDER`, `SHOW_INVOICE`, `SHOW_OTHERS` | Restore that header, ARAP, department or payment-reference field for this user |
| `SHOW_UNIT_PRICE_STD_PRICING_SCHEME`, `SHOW_UNIT_PRICE_STD_INCL_TAX`, `SHOW_UNIT_PRICE_STD_EXCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_INCL_TAX`, `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_EXCL_TAX`, `SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX`, `SHOW_UNIT_PRICE_TXN`, `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX`, `SHOW_UNIT_DISCOUNT`, `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_QTY_BASE`, `SHOW_QTY_UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_AMOUNT_STD_EXCL_TAX`, `SHOW_AMOUNT_NET_EXCL_TAX`, `SHOW_AMOUNT_TXN`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION` | Restore that line-item column for this user |

The registry also seeds codes that no code in this applet or its shared components reads — among them `EDIT_CURRENCY_RATE`, `DISABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `IPI_HIDE_TRACKING_ID_AND_PERMIT_NO`, `INTERNAL_PURCHASE_INVOICE_DISPLAY_PRICING` (its only use is commented out), `SHOW_SAVE_BUTTON`, `SHOW_PRINT_BUTTON`, `SHOW_CLOSE_BUTTON`, `SHOW_SEND_EMAIL_BUTTON`, `HIDE_DRAFT_BUTTON`, `HIDE_CUSTOM_DOC_NO`, `HIDE_FOREX_DATA_SOURCE`, `SHOW_VALIDITY_DATE`, `REQUIRE_VALIDITY_DATE`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING`. Granting them has no effect.

Server-side API permissions are listed under *Before you can use it*. Read/Create/Update/Delete are branch-targeted, so a user can be limited to invoices of specific branches.

## Fields

### Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Branch | Buying branch | Yes (`Validators.required`) | Drives numbering, permissions and Branch Settings |
| Location | Stock location that receives the goods | Yes (`Validators.required`) | Defaults from the branch `MAIN_LOCATION` |
| Doc No (Tenant / Company / Branch) | System running numbers | Generated | Tenant number at Create; company and branch numbers at FINAL. Read-only. |
| Custom Document Number | Free-form number | No | Only with `SHOW_CUSTOM_DOC_NO` |
| Doc Short Code, Client Doc Short Code, Client Doc 1–5 No | Client-side references | No | Hideable individually |
| Source Doc No (Tenant), Source Doc Short Code | Populated by knock-off | No | Read-only |
| Transaction Date | Invoice date | Yes (defaults to today) | Editable only with the `SHOW_TRANSACTION_DATE` permission; may be overwritten at FINAL by `DATE_TXN_LOGIC` |
| Due Date | Payment due date | No | Derived from Credit Terms |
| Doc Reference Date | Date on the supplier's document | No | Editable only with `ALLOW_EDITING_DOC_REF_DATE` |
| Reference | Supplier's invoice number | Only with `MANDATORY_REFERENCE` | Duplicate warning with `ENABLE_DUPLICATE_REFERENCE_CHECK`; shown on AP reports |
| Purchaser | Buying employee | Marked with an asterisk; no form validator | Auto-filled with `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` |
| Base Currency / Currency / Rate | Transaction currency and exchange rate | Yes | A foreign currency fetches the latest rate; FINAL is stopped in the applet with *The currency rate cannot be ZERO.* |
| Credit Terms, Credit Limit | Copied from the supplier | No | Read-only |
| External Quotation / Order / Delivery Order / Invoice / Others and their dates | Supplier-side references | Per `MANDATORY_…` | Hidden by default (`HIDE_EXTERNAL_…` on) |
| Tracking ID, Permit No | Logistics references | No | |
| Remarks, External Remarks | Internal and printed notes | No | Remarks become the description of the journal's creditor line |
| Delivery Branch / Location | Where goods are delivered | No | Listing them needs `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_DELIVERY_BRANCH_READ` |

### Account

Entity Details (supplier code, name, type, identity type and number, currency, status, description, email, phone), Bill To and Ship To addresses and contacts, and Intercompany (target company when billing a sister company). In select mode a toggle creates a supplier without leaving the invoice.

### Line Items

| Sub-tab | Fields |
|---|---|
| Item Details | Item code and name, quantity (base and UOM), UOM-to-base ratio, serial numbers, bin, batch number / issue / expiry, item remarks, item reference |
| Pricing Details | Standard unit price (pricing scheme, incl./excl. tax, per UOM), unit discount, net unit price, transaction unit price, tax code, WHT code, amounts (standard, discount, net, tax, transaction), multi-discount |
| Costing Details | Landed cost, last purchase price and cost breakdown |
| Issue Link | Link the line to an issue-tracker ticket |

Each line also carries an optional GL code, branch, department fields and delivery instruction. Header adjustment, group discount and rounding lines are generated by the applet, not keyed.

### Payment

Settlement method (from Branch Settings), amount, payment date (editable only with `ENABLE_EDIT_PAYMENT_DATE` / `ENABLE_EDIT_SETTLEMENT_DATE`), reference fields (quotation, order, delivery order, invoice, invoice date, others — hidden by default) and, for card methods, card number, name, issuer, expiry, approval code, batch, card type, CVV as configured.

## Lifecycle and posting

A purchase invoice has a document status (`TEMP` while the create form is open, then `ACTIVE`) and a posting status:

| Posting status | Meaning | Allowed next step |
|---|---|---|
| `DRAFT` | Saved, editable, nothing posted | FINAL, DISCARD, edit |
| `FINAL` | Posted and locked | VOID (subject to the conditions below), Payment, Contra, Purchase Return, Credit/Debit Note |
| `VOID` | Reversed | none |
| `DISCARDED` | Abandoned draft | none |

**FINAL in the applet** is enabled when the header form is valid, a supplier is selected, there is at least one line, no serial number is duplicated within the document, the document is `ACTIVE` and not locked, and the button is not hidden for this user (`purchase-invoice-edit.component.ts`). These are client-side gates. **FINAL in the backend** (`GenericDocumentService.updatePostingStatusWithChecks` → `validateGenericDocumentOnFinal`) rejects a second FINAL with *Generic Document has already been posted to FINAL* (HTTP 403), a transaction date in a locked period with `FISCAL_PERIOD_LOCKED`, serial numbers that already exist in the company (`BL_INV_SERIAL_NUMBER_HDR_OBJECT_SERIAL_NUMBER_ALREADY_EXISTS_FOR_COMPANY`) or that are duplicated or do not match the line quantity, and — through the journal — a missing default GL code (`MISSING_DEFAULT_GL_CODE: <code>`). A foreign-currency invoice is finalised as a base-currency **shadow** document that carries the posting.

### Posting proof block

| Item | Value (from the backend) |
|---|---|
| Server document type | `INTERNAL_PURCHASE_INVOICE` (`InternalPurchaseInvoiceDataConsistencyObject.correctServerDocType`) |
| Amount signum | **−1** (`correctAmountSignum`; the same class fills it on every line at create and update) |
| Quantity signum | **+1** — stock in (`correctQuantitySignum = BigDecimal.ONE`). The standard Purchase GRN's DCO has amount 0 and quantity 0. |
| Dr / Cr equation | `JournalPostingService.getJournalContainer`: a line is debited when `amount_signum × amount < 0`, so with −1 every item line is **Dr Purchase** (net amount) and each tax line **Dr Input Tax**; the balancing entity line takes the opposite sign, **Cr Creditor** for the invoice total. Discounts post to `PURCHASE_DISCOUNT`, settlement forex differences to `FOREX_GAIN` / `FOREX_LOSS` (handler `PURCHASE` in `JournalPostingTypeHandler`). |
| GL precedence for an item line | GL code on the line → GL code on the document header → item-company GL link with transaction code `PURCHASE` → company default `PURCHASE` (`JournalPostingService.getJournalContainer`, the `PNS` branch). Tax lines use the company default `INPUT_TAX`. The entity line uses the company default for the supplier's AR/AP type (`resolveArap`) and throws `MISSING_DEFAULT_GL_CODE` when it is not linked. |
| Stock processor | `INVENTORY_TRANSACTION_LINE_PROCESSOR`, a subscriber of `BLG_ERP_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`: `InventoryTransactionLineFactory` copies the line's quantity signum (+1) and amount signum (−1) onto a `bl_inv_txn_line`, creates the serial numbers when signum × quantity > 0, and `StockBalanceHelper` sets `cost_last_purchase_company` / `cost_last_purchase_location` to `amount_net / qty_base` for `INTERNAL_PURCHASE_INVOICE` lines. This applies to keyed invoices and to GRN knock-offs alike. |
| What VOID reverses | `updatePostingStatusToNonFinal` queues `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`; the VOID processors registered for it in `JobProcessorClassName` (the tenant's job-template links decide which are subscribed) are `VOID_JOURNAL_POSTING_PROCESSOR` (`createJournalGenDocReversePosting`: a new journal with every line's debit and credit swapped), `VOID_INVENTORY_TRANSACTION_LINE_PROCESSOR` (negated inventory lines with `txn_code = VOID`, inventory posting status set to VOID), `VOID_KNOCK_OFF_PROCESSOR` (knock-off links set to `DELETED`, reopening the source document), `VOID_ARAP_CONTRA_PROCESSOR`, `VOID_TAX_PROCESSOR`, `VOID_CASHBOOK_TXN_LINE_PROCESSOR` and `VOID_MEMBERSHIP_POINTS_PROCESSOR`. The document is also removed from the e-Invoice queue and from historical aging. A shadow (base-currency) document is voided with its original. |

The **Posting** tab shows five statuses (Journal, Inventory, Membership Points, Cashbook, Tax); **TraceDocument** shows the journal and inventory rows.

**VOID** in the applet is offered only on a `FINAL` document that is not locked, when `HIDE_GENDOC_VOID_BUTTON` is off or the user has `SHOW_GENDOC_VOID_BUTTON`, and when the company's e-Invoice status is not `ENABLED`. The applet (not the backend) refuses with *The invoice has already been linked with a purchase return* when an `ACTIVE` `RETURN` link to an `INTERNAL_PURCHASE_RETURN` exists; the backend's `update-posting-status` endpoint performs no downstream-link check of its own (the `checkIsGenDocConvertibletoVoid` guard is used only by the e-Invoice cancellation queue). To correct a finalised invoice under e-Invoice, raise a Purchase Credit Note or cancel through the e-Invoice portal within the LHDN window.

**Knock-off** writes a document link (`txn_type` knock-off) between the source and the invoice; a source that is fully knocked off no longer appears in *KO For*. The GRN-to-invoice path is a backend converter (`PurchaseGRNToPurchaseInvoiceConverter`), not a client-side copy. A Purchase Return raised against the invoice writes a `RETURN` link.

## Related applets

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) and [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the documents this applet knocks off; the standard GRN does not move stock, the invoice does.
- [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/) and [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) — earlier steps of the same chain; not knock-off sources in this applet's current build.
- [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) — the same document with quantity signum 0, for tenants that book stock on GRN Stock In.
- [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) — supplier-facing view of these invoices.
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — settles several invoices at once; the invoice's own Payment tab settles one.
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/), [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/), [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/) — post-FINAL corrections.
- [Supplier Applet](/applets/master-data/supplier-applet-1/) — the entity, its AR/AP type and the self-billed flag.
- [Chart of Account Applet](/applets/master-data/chart-of-account-applet/), [Tax Configuration Applet](/applets/master-data/tax-configuration-applet/), [Cashbook Applet](/applets/master-data/cashbook-applet/), [Organisation Applet](/applets/master-data/organisation-applet/) — the master data FINAL and Payment depend on.
- [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) — where the posted journal is reviewed.
- [My E-invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/) — submission and tracking of self-billed invoices.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| FINAL fails with `MISSING_DEFAULT_GL_CODE: CREDITOR` (or `CREDITOR_NON_TRADE`, `EMPLOYEE_OTHER_PAYABLE`) | The company has no default GL code linked for the supplier's AR/AP type | Add the mapping under the company's default GL codes in the Chart of Account applet, then FINAL again |
| FINAL fails with `MISSING_CASHBOOK: STL_MTHD [code]` or `MISSING_GL_CODE: STL_MTHD [code]` | A settlement method on the Payment tab has no cashbook, or its cashbook has no GL code | Link the settlement item to a cashbook with a GL code in the Cashbook applet |
| FINAL fails with `FISCAL_PERIOD_LOCKED` | The transaction date falls in a closed fiscal period | Change the date, or reopen the period, then FINAL |
| *Generic Document has already been posted to FINAL* | A second FINAL request reached the backend (double click, or a stale tab) | Refresh; the document is already FINAL |
| Journal shows a different supplier from the invoice | The journal's creditor line is taken from the supplier at FINAL time; the supplier on the document was changed afterwards by a data fix or ETL | The backend has a journal re-posting service (`createJournalGenDocRePosting`) that is not exposed in this applet; raise it with support rather than editing the journal |
| Line posted to the generic `PURCHASE` account instead of the item's expense account | No GL code on the line or header, and the item has no company GL-code link with transaction code `PURCHASE` | Set the item's purchase GL link, or switch `HIDE_LINE_ITEMS_GL_CODE` off and choose the code per line; documents already finalised keep their journal |
| Average cost drops towards zero after invoices | Lines with quantity > 0 but a zero or blank amount post quantity without value into the moving-average chain (reported against `INTERNAL_PURCHASE_INVOICE` lines) | Enter the value before FINAL; a finalised line cannot be edited, so void the invoice where permitted and re-key it, or record the value on a Purchase Debit Note |
| FINAL rejected for serial numbers | A serial on the invoice already exists in the company, is duplicated within the document, or the serial count differs from the quantity | Remove or correct the serial; the error lists the offending `snIds` |
| **VOID** button missing on a finalised invoice | Company e-Invoice status is `ENABLED`, the document is locked, or `HIDE_GENDOC_VOID_BUTTON` is on without `SHOW_GENDOC_VOID_BUTTON` | Raise a Purchase Credit Note, or cancel via the e-Invoice portal; otherwise grant the permission |
| *The invoice has already been linked with a purchase return* on VOID | An active Purchase Return references this invoice (checked by the applet) | Void the return first, or correct with a credit note |
| *The currency rate cannot be ZERO.* | No rate was fetched for the chosen currency | Enter the rate manually (unless `CANNOT_EDIT_CURRENCY_RATE` is on) or configure the currency's rates |
| *No Default Printable Selected* when printing | No printable format, or none marked as Default Selection | Create one under Printable Format Settings and mark it as default; set the branch default in Branch Settings |
| Source document not found on *KO For* | Source is still draft or already fully knocked off | Finalise the source; check the remaining quantity |
| File Import / File Export menu missing | `HIDE_FILE_IMPORT_MENU` / `HIDE_FILE_EXPORT_MENU` on | Grant `SHOW_FILE_IMPORT_MENU` / `SHOW_FILE_EXPORT_MENU` to the user or switch the setting off |
| Contra document listed twice | Contra listing pagination returned the same link on two pages (reported and closed in 2026) | Refresh the listing; verify on TraceDocument that the contra was posted once |
| Listing shows posting status DRAFT for invoices believed final | Documents were created by an ETL/migration in DRAFT and never finalised | Open each and FINAL it, or ask support to bulk-finalise |
| Duplicate invoice after migration | A migrated GRN was invoiced twice | Void the duplicate if possible; otherwise correct stock with a stock adjustment |
| Line-item price columns missing for everyone | The hidden-by-default line columns (`HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_TAX_CONFIG_SELECTION`, …) were persisted by the first save of Application Settings | Switch the columns off under Application Settings > Line Items, or grant the matching `SHOW_…` permission per role |
| User cannot open the applet at all | No `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_READ_TGT_GUID` for the branch | Grant read (and create/update) for the required branches under Permission Set |

## Related documentation

- [Standard procurement workflow](/guides/purchasing-guides/standard-procurement-workflow/) — PR → PO → GRN → Purchase Invoice → Payment
- [Direct invoice workflow](/guides/purchasing-guides/direct-invoice-workflow/) — invoicing without a GRN
- [Invoice-first workflow](/guides/purchasing-guides/invoice-first-workflow/)
- [Malaysia e-Invoice guide](/guides/einvoice-guides/malaysia-e-invoice-guide/) — self-billed submissions
- [Financial Accounting module](/modules-v2/financial-accounting/) and [Purchasing module](/modules-v2/purchasing/)

### Video overview

{{< youtube 0dGRtyjV7-A >}}
