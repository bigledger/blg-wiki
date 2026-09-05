---
title: "Purchase Invoice No Stock In (Internal)"
description: "Reference for the Purchase Invoice No Stock In (Internal) applet: the supplier invoice that follows a Purchase GRN Stock In, books the trade creditor without moving stock, its screens, every configuration switch, fields, posting proof, VOID behaviour and known failure modes."
applet_code: "internalPurchaseInvoiceNoStockInApplet"
applet_repo: "blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet"
modules: [purchasing, financial-accounting]
related_applets:
  - internal-purchase-grn-stock-in-applet
  - internal-purchase-grn-applet
  - internal-purchase-invoice-applet
  - internal-purchase-order-applet
  - internal-purchase-requisition-applet
  - internal-purchase-return-applet
  - internal-purchase-credit-note-applet
  - internal-purchase-debit-note-applet
  - internal-payment-voucher-applet
  - internal-purchase-invoice-supplier-access-applet
  - supplier-delivery-order-applet
  - my-e-invoice-admin-applet
  - supplier-applet-1
  - organisation-applet
  - chart-of-account-applet
  - doc-item-maintenance-applet
  - tax-configuration-applet
guides:
  - /guides/purchasing-guides/standard-procurement-workflow/
  - /guides/purchasing-guides/direct-grn-workflow/
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/app.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/settings-container/knock-off-settings/knock-off-settings.component.html
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-listing/purchase-invoice-listing.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-listing/purchase-invoice-listing.component.html
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/purchase-invoice-edit.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/purchase-invoice-edit.component.html
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/export/export.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/line-item-edit/line-item-edit.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/purchase-invoice-create.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/purchase-invoice-create.component.html
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/import-knock-off/import-knock-off.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/line-items/line-items-listing.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/line-items/line-items-create/line-items-create.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/line-item-add/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/line-item-add/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/search-documents/search-documents.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-edit/e-invoice/e-invoice.component.html
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/state-controllers/purchase-invoice-controller/store/effects/purchase-invoice.effects.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/file-import-container/file-import-create/file-import-create.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/e-invoice/einvoice_self_billed.service.ts
  fields:
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/purchase-invoice-container/purchase-invoice-create/line-item-add/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/line-items-container/edit-line-item/batch-number/batch-number.component.ts
    - blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-no-stock-in-applet/src/app/components/line-items-container/edit-line-item/bin-number/bin-number.component.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseInvoiceNoStockInDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/GenericDocumentLinkUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/GenericDocumentConverterFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/genericDocumentConverter/GenericDocumentConverter.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/genericDocumentConverter/PurchaseGRNStockInToPurchaseInvoiceNoInStockConverter.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceToIRBProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEInvoiceGenDocToIrbSubmissionQueueService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoiceSelfBilledConversionService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/eInvoice/MyEInvoiceToIrbController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/intercompany/IntercompanyController.java
  troubleshooting:
    - gh:bigledger/blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet#18
    - gh:bigledger/blg-intranet#3940
    - gh:bigledger/blg-intranet#3939
    - gh:bigledger/blg-intranet#4339
    - gh:bigledger/blg-intranet#3329
    - gh:bigledger/blg-intranet#4338
    - gh:bigledger/blg-intranet#1616
    - gh:bigledger/blg-intranet#5071
    - gh:bigledger/blg-intranet#4803
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
tags:
- purchase-invoice
- no-stock-in
- accounts-payable
- purchase-workflow
- grn-stock-in
weight: 50
lastmod: 2026-09-05
---

## Overview

The **Purchase Invoice No Stock In (Internal)** applet records the supplier's invoice for goods that were **already booked into stock by a [Purchase GRN Stock In](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/)**. On FINAL it books the trade creditor and, when the invoice is linked to the GRN Stock In it settles, clears the *Creditor Not Invoiced* / *Inventory Not Invoiced* accruals that the GRN Stock In raised — it never creates an inventory transaction (quantity signum **0**, amount signum **−1**). Finance or accounts-payable staff create it against a FINAL GRN Stock In (or a Purchase Order), and the backend can create it automatically from the GRN Stock In open queue.

It is the second document of one of the two receiving pairs on the purchase side:

| Pair | Receipt document | Invoice document |
|---|---|---|
| **GRN Stock In + PI No Stock In** (this applet) | [Purchase GRN Stock In](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) — `INTERNAL_PURCHASE_GRN_STOCK_IN`, quantity +1 / amount −1: moves stock, updates cost, accrues *Inventory Not Invoiced* / *Creditor Not Invoiced* | **This applet** — `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` (short code `PURINVNSI`), quantity 0 / amount −1: no stock, books the trade creditor and reverses the accrual |
| GRN + Purchase Invoice | [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/) — 0 / 0, receipt record only | [Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/) — +1 / −1, moves stock and books the creditor |

The old framing of this applet as an invoice "for services and overheads" is wrong: nothing in the backend restricts the items, but the journal is designed around a preceding GRN Stock In. An invoice for a service can be raised here, but the ordinary [Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/) with a non-inventory item does the same without the accrual leg.

## Where it fits

Modules: [Purchasing](/modules-v2/purchasing/) and [Financial Accounting](/modules-v2/financial-accounting/).

| Direction | Document / applet | Relationship |
|---|---|---|
| Upstream | [Purchase GRN Stock In](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) | The receipt this invoice settles. The header **KO For** tab offers *Purchase GRN Stock In* when the company's Knock Off Configuration has an enabled `LINE` row `INTERNAL_PURCHASE_GRN_STOCK_IN → INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN`; `PurchaseGRNStockInToPurchaseInvoiceNoInStockConverter` creates this document automatically from that queue. |
| Upstream | [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase GRN](/applets/purchase-workflow/internal-purchase-grn-applet/), [Purchase Requisition](/applets/purchase-workflow/internal-purchase-requisition-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) | Other knock-off sources: KO For offers *Purchase Order* and *Purchase GRN*; the line editor's KO sub-tabs (PO, GRN, PR, Supplier DO) appear per enabled `LINE` flow row. A link from any of these also triggers the accrual-reversal journal leg (see Lifecycle). |
| Downstream | [Purchase Return](/applets/purchase-workflow/internal-purchase-return-applet/), [Purchase Credit Note](/applets/purchase-workflow/internal-purchase-credit-note-applet/), [Purchase Debit Note](/applets/purchase-workflow/internal-purchase-debit-note-applet/), [Payment Voucher](/applets/finance/internal-payment-voucher-applet/) | Return, adjustment and settlement of the creditor balance; a `RETURN` link from a Purchase Return blocks VOID in the applet. |
| Sibling | [Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/) | The stock-moving invoice of the other pair. Raising it for goods already received on a GRN Stock In counts the stock twice (intranet #3940). |
| Supplier-side view | [Purchase Invoice Supplier Access](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) | External view of purchase invoices. |
| e-Invoice | [MY e-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) | The applet carries an E-Invoice tab and a SELF-BILLED action, but the backend submission pipeline does not list this document type (see Document behaviour settings). |

## Screens and menus

Menu items: **Internal Purchase Invoice No Stock In** (listing), **Line Items** (every line across documents), **File Import**, **File Export**. The *Knock Off Settings* route exists but its menu entry is commented out.

**Listing.** Columns (each governed by a `HIDE_*` setting with a matching `SHOW_*` permission): Doc Short Code (`PURINVNSI`), E-Invoice Running No. and E-Invoice Date, Doc No (Tenant / Company / Branch), Branch, Transaction Date, Client Doc Type and Client Doc 1–5, the AR/AP amount columns (PNS, Settlement, Doc Open, Contra, Balance), Amount, the five External document numbers with their dates, Description, Document Links, Reference, Posting Status, Status, Currency. Toolbar: **FINAL** (multi-select, every row DRAFT), **DISCARD** (DRAFT rows), **VOID** (FINAL rows), **SINGLE/MULTIPLE PRINT** (needs `PRINTABLE`), and **SELF-BILLED**. `DEFAULT_TRANSACTION_DATE`, `DEFAULT_POSTING_STATUS`, `DEFAULT_STATUS`, `SORT_ORDER` and `FUZZY_SEARCH_COLUMNS` shape the initial query; the filter panel adds Supplier, Company, date ranges (transaction, created, updated, e-Invoice billing period, e-Invoice date, external document dates) and Order By.

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/invoice-listing.png" alt="Purchase Invoice No Stock In listing with FINAL, DISCARD, VOID, print and SELF-BILLED buttons" caption="Listing, staging tenant with test documents. Every column is a HIDE_* setting paired with a SHOW_* permission." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/listing-search-filter-extended.png" alt="Listing filter panel with e-Invoice billing period, e-Invoice date and external document date ranges" caption="Filter panel: e-Invoice and external-document date ranges added in 2026 (intranet #4717)." >}}

**Create form** tabs: Main Details, Account, Line Items, Delivery Details, Payment, KO For, Department Hdr (the last four hide with `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_KO_FOR_TAB`, `HIDE_DEPARTMENT_HDR_TAB`). The intercompany *Search* tab is commented out of the template even though `SHOW_INTERCOMPANY_PI_SCREEN` is still read. **CREATE** is enabled when Main Details is valid, a supplier is selected and at least one line exists (`disableCreate()`).

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/create-main-details.png" alt="Create form Main Details tab with the branch picker open" caption="Main Details: Branch and Location are required; Delivery Branch / Location default to them." >}}

**Edit form** tabs (order configurable in Default Selection): Search Document (TEMP documents only — *Search Purchase Order*, *Search Purchase GRN*, *Search Purchase Invoice*, which clones a FINAL document of this type), Main Details, E-Invoice, Account, Line Items, KO For (TEMP only), Delivery Details, ARAP, Payment, Department Hdr, Posting, TraceDocument, Contra, Doc Link, Attachment, Export. Buttons: currency switch (forex documents), **FINAL**, **VOID**, **SAVE**, **DISCARD**, and a **CLONE** menu entry; a two-click **DELETE** appears for non-FINAL documents when the applet record's `APPLET_SETTINGS` extension has `SHOW_DOCUMENT_DELETE_BUTTON`. All tabs can render as vertical expansion panels (`VERTICAL_ORIENTATION`).

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/create-search-document.png" alt="Search Document tab with the Search Purchase Invoice sub-tab and CLONE button" caption="Search Document: the Search Purchase Invoice sub-tab clones an existing PI No Stock In (optionally with attachments)." >}}

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/edit-e-invoice-tab.png" alt="E-Invoice tab with Submission Type, Document No, Document Type, E-invoice Number, UUID and billing period fields" caption="E-Invoice tab. The fields render, but the backend submission pipeline does not recognise this document type (see Document behaviour settings)." >}}

**Line editor** (Add / Edit Line Item): Item Details (Main Details, Delivery Instruction, Department, Doc Link, Delivery Details, Multi Discount, Related Documents), Serial Number / Batch Number / Bin Number (by the item's `sub_item_type`), Costing Details, Pricing Details, Issue Link, Group Item. The Lines tab offers Search Item (item types BASIC_ITEM, MADE_TO_ORDER, BUNDLE, NSTI, VOUCHER, ACCOUNT_CODE), a *Landed Cost* amount with **ALLOCATE** / **CONFIRM**, and KO sub-tabs per enabled flow row.

{{< figure src="/images/Purchase-Invoice-No-Stock%20In-applet/create-line-items-select-item.png" alt="Line Items tab with the Select Item dialog and its Item Type filter" caption="Line Items: Search Item with the Item Type filter; Landed Cost allocation controls above the grid." >}}

**Settings** menu (System Configuration): Application Settings, Default Selection, Printable Format Settings, Branch Settings; the routes also expose Knock Off Settings, Webhook, Feature Visibility, Release Notes, Applet Log and the shared permission listings (client-side permission, permission wizard, permission set, user / team / role permission, role pricing scheme link). **Personalization**: Default Selection and Sidebar.

## Configuration

### Before you can use it

- **Company, branch and location** in [Organisation](/applets/master-data/organisation-applet/). Branch and Location are required on the header (`Validators.required`); Delivery Branch / Delivery Location default to them. No inventory transaction is created, so the location only travels to the journal and the knocked-off lines.
- **Default GL codes** for the company: `CREDITOR` (or `CREDITOR_NON_TRADE`, chosen by the supplier's AR/AP type), `PURCHASE` for lines without their own GL code, `INPUT_TAX` when tax is captured, and — for every invoice that carries a knock-off link — `CREDITOR_NOT_INVOICED` and `INVENTORY_NOT_INVOICED`. Set them through [Chart of Account](/applets/master-data/chart-of-account-applet/) and the company's default GL mapping. Missing creditor, `CREDITOR_NOT_INVOICED` or `INVENTORY_NOT_INVOICED` codes make the journal job throw `MISSING_DEFAULT_GL_CODE: <code>` (`JournalPostingService` L339, L490, L526); a missing `PURCHASE` / `INPUT_TAX` code silently drops the line and the job fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES`.
- **Knock Off Configuration** for the company (Organisation → Company → Knock Off Configuration, table `bl_fi_comp_gendoc_flow_config`): an enabled `LINE` row `INTERNAL_PURCHASE_GRN_STOCK_IN → INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` so FINAL GRN Stock Ins are queued for this invoice and the *Purchase GRN Stock In* KO tab renders (`import-knock-off.component.ts` L134–138); the same row's `doc_2_posting_status` decides whether the auto-created invoice is DRAFT or FINAL (default FINAL, converter L47). Rows for `INTERNAL_PURCHASE_ORDER`, `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`, `INTERNAL_PURCHASE_REQUISITION` and `INTERNAL_OUTBOUND_DELIVERY_ORDER` enable the other KO tabs. Downstream rows (`INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN → …`) decide whether FINAL opens the lines for a Purchase Return or a Payment Voucher.
- **Suppliers** in [Supplier](/applets/master-data/supplier-applet-1/): the entity's AR/AP type picks the creditor account (`resolveArap`, `JournalPostingService` L1561–1575).
- **Items** in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — any item type is accepted; an item-company GL link with txn code `PURCHASE` overrides the company default for that item.
- **Tax codes** in [Tax Configuration](/applets/master-data/tax-configuration-applet/) if input tax is captured on lines. Capture the tax on **one** document of the pair only (see Lifecycle).
- **Running numbers** for `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` are assigned by the backend on FINAL.
- **Backend permissions**: `TNT_API_DOC_INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN_CREATE / READ / UPDATE / DELETE_TGT_GUID` (`GenericDocumentTypeHandler` L808–815) plus `…_DELIVERY_BRANCH_READ` for documents whose delivery branch the user is not a member of. Marking a document self-billed additionally needs `API_TNT_DM_ERP_MY_E_INVOICE_TO_IRB_UPDATE`.

### Applet settings

Where settings live (read from `app.routing.ts` and `menu-items.ts`, applet @77722d9, shared utilities @af523eb):

| Screen | Component | What it holds |
|---|---|---|
| Settings → Application Settings (`field-settings`) | shared `FieldConfigurationComponent` (blg-shared-utilities) | The HIDE_* / ENABLE_* toggles below. The registry code `internalPurchaseInvoiceNoStockInApplet` is in the shared screen's `tabMappings` (eleven tab-hide toggles render), its purchase-family lists and its `lockTxnAmount` list, so 188 controls render for this applet code. |
| Inline gear (`app-applet-settings-toggle`, shown when `ENABLE_INLINE_APPLET_CONFIG` is on) | shared component on 19 screens: listing (37 keys), edit form (33), Main Details (35), Account and its sub-panels (19), line editor (8), Item Details (7), Lines tab (3), ARAP (5), Department Hdr (4), Doc Link (2 ×2), Export (1), Payment (1–2), supplier picker and supplier edit (6) | Master and personal overrides for the listed keys. 24 keys are gear-only for this applet code (`HIDE_CREDIT_TERMS`, `HIDE_CREDIT_LIMIT`, `HIDE_REFERENCE`, `HIDE_REMARKS`, `HIDE_EXPORT_TAB`, `HIDE_FILE_IMPORT_MENU`, `HIDE_FILE_EXPORT_MENU`, `HIDE_LISTING_BRANCH`, `HIDE_EINVOICE_NUMBER`, `HIDE_EINVOICE_DATE`, `HIDE_SETTLEMENT_TAB`, `HIDE_SUPPLIER_*_TAB`, `EXPAND_E_INVOICE`, `EXPAND_PAYMENT`, `ENABLE_SELECT_MODE`, `SHOW_CUSTOM_DOC_NO`, the bare `HIDE_QUOTATION / ORDER / DELIVERY_ORDER / INVOICE / OTHERS`, `ENABLE_IMPORT_EXPORT`). |
| Settings → Default Selection | applet-local `DefaultSettingsComponent` | Default Branch, Default Location (auto-filled with the branch's `MAIN_LOCATION`), Unit Price Decimal Precision, **Transaction Date Logic**, and drag-and-drop **Details Tab Ordering** (`PURCHASE_INVOICE_NO_STOCK_IN_DETAILS_TAB_ORDER`). |
| Settings → Printable Format Settings | applet-local listing with "set default" | `PRINTABLE` (default Jasper template GUID for Export and bulk print). |
| Settings → Branch Settings | applet-local, per branch | Branch Details, Item Category Filter, Pricing Scheme, **Printable Format** (per-branch default template, read by Export ahead of `PRINTABLE`), Default Settlement Method. |
| Settings → Knock Off Settings (route only) | applet-local form | `KNOCK_OFF_BY_* / KNOCK_OFF_FOR_*` (GRN, PO, PR, Supplier DO), `ENABLE_AUTO_SCAN`, `ENABLE_VALIDATE_SERIAL` — saved and **never read**; the KO tabs are driven by the company Knock Off Configuration instead. |
| Personalization → Default Selection | applet-local `PersonalDefaultSettingsComponent` | Personal Default Branch / Location / Company, Toggle Column (`DEFAULT_TOGGLE_COLUMN`), Default Item Search Item Type, Tab Orientation (`DEFAULT_ORIENTATION`); settings are read as `{...master, ...personal}`. |

Master settings are changed by OWNER / ADMIN users through the Settings menu or the gear's master mode; personal mode on the gear and Personalization are open to every user. Defaults: every toggle below is off / empty unless the row says otherwise — the shared screen patches the stored value or `false`, and the document code treats an absent key as "not hidden". A fresh tenant therefore sees every field until Application Settings is saved once.

The table lists the keys that pass all four proofs (declared in `applet-settings.model.ts` — 266 keys — rendered on the shared screen, a gear or an applet-local screen, persisted by the settings service, and read by this applet's code, including reads through `isShowColumn()`, `showExternalDocField()` and the tab list's `hide:` / `expandSetting:` accessors).

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_TRANSACTION_DATE` | Listing date preset (`1_day`, `1_week`, `1_month`) | empty (one month back) | Listing opens pre-filtered. |
| `DEFAULT_POSTING_STATUS`, `DEFAULT_STATUS`, `SORT_ORDER`, `FUZZY_SEARCH_COLUMNS` | Listing default filters, ordering (`updated_date`) and the columns the keyword search hits | empty | Shared listing behaviour. |
| `DISABLE_GEN_DOC_LISTING` | Locks the listing | off | Hides Create and ignores row clicks. |
| `ENABLE_AUTO_POPUP` | Print after listing FINAL | off | Bulk-prints the selected documents after FINAL (the edit-form variant is commented out). |
| `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON`, `HIDE_PRINT_BUTTON`, `HIDE_CLONE_BUTTON`, `HIDE_EXPORT_AS_PDF_BUTTON` | Listing / edit-form action buttons | off | Hide the button for everyone; `SHOW_GENDOC_FINAL / VOID / DISCARD_BUTTON` client-side permissions re-show the first three per role (seeded for this applet). |
| `HIDE_SERVER_DOC_1…3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1…5`, `HIDE_EINVOICE_NUMBER`, `HIDE_EINVOICE_DATE`, `HIDE_LISTING_BRANCH`, `HIDE_TRANSACTION_DATE`, `HIDE_DESCRIPTION`, `HIDE_DOCUMENT_LINKS`, `HIDE_AMOUNT_TXN_MAIN_LISTING` | Listing columns (and the matching Main Details fields) | off | Hidden; the `SHOW_*` permission in the listing column map re-shows them. |
| `HIDE_EXTERNAL_QUOTATION`, `HIDE_EXTERNAL_ORDER`, `HIDE_EXTERNAL_DELIVERY_ORDER`, `HIDE_EXTERNAL_INVOICE`, `HIDE_EXTERNAL_OTHERS` (fallback keys `HIDE_QUOTATION`, `HIDE_ORDER`, `HIDE_DELIVERY_ORDER`, `HIDE_INVOICE`, `HIDE_OTHERS`) | External Quotation / Order / Delivery Order / Invoice / Others number **and date** fields and columns | off | The `HIDE_EXTERNAL_*` key wins when set; otherwise the bare key is read. |
| `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | AR/AP columns on the listing and the ARAP tab | off | `HIDE_MAIN_ARAP_TAB` hides the whole tab. |
| `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT`, `HIDE_BILL_TO_TAB`, `HIDE_SHIP_TO_TAB`, `HIDE_ENTITY_BRANCH`, `HIDE_ENTITY_DETAILS_CURRENCY / STATUS / IDENTITY_TYPE / DESCRIPTION / TYPE / ID_NUMBER / EMAIL / PHONE_NUMBER` | Account tab panels and entity fields | off | Hide the panel / field. |
| `HIDE_SUPPLIER_CATEGORY_TAB`, `HIDE_SUPPLIER_LOGIN_TAB`, `HIDE_SUPPLIER_PAYMENT_CONFIG_TAB`, `ENABLE_SELECT_MODE` | Inline supplier edit / picker | off | Hide supplier-edit tabs; row-selection mode in the picker. |
| `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION`, `HIDE_CREDIT_TERMS`, `HIDE_CREDIT_LIMIT`, `HIDE_REFERENCE`, `HIDE_REMARKS`, `HIDE_EXTERNAL_REMARKS`, `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID`, `HIDE_SOURCE_DOC_NO`, `HIDE_CREATED_BY_DETAILS`, `HIDE_BASE_CURRENCY`, `HIDE_CURRENCY`, `SHOW_CUSTOM_DOC_NO` | Main Details fields | off | Hide (or, for `SHOW_CUSTOM_DOC_NO`, show) the field. |
| `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE` | Currency rate field | off | Lock the rate / show the data-source picker. |
| `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Purchaser | off | On a TEMP document the purchaser is looked up from the logged-in user's employee record. |
| `ENABLE_DUPLICATE_REFERENCE_CHECK` | Reference | off | Warns when the same reference already exists on another PI No Stock In. |
| `HIDE_SEARCH_BY_DOCUMENT_BUTTON`, `HIDE_KO_FOR_TAB`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_MAIN_ARAP_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_POSTING_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB` | Create / edit-form tabs | off | Hide the tab. The E-Invoice tab has no hide key. |
| `EXPAND_MAIN_DETAILS`, `EXPAND_E_INVOICE`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_KO_FOR`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_MAIN_ARAP`, `EXPAND_PAYMENT`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_POSTING`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_MAIN_CONTRA`, `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT`, `VERTICAL_ORIENTATION` | Vertical layout | off | Stacked expansion panels; `EXPAND_*` chooses the panel opened by default. |
| `HIDE_SERIAL_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_BATCH_ISSUE_DATE`, `HIDE_BATCH_EXPIRY_DATE`, `HIDE_COSTING_DETAILS`, `HIDE_ISSUE_LINK`, `HIDE_DOC_LINK`, `HIDE_DOC_LINK_FROM`, `HIDE_DOC_LINK_TO`, `HIDE_DELIVERY_DETAILS`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DEPARTMENT`, `HIDE_MULTI_DISCOUNT`, `HIDE_RELATED_DOCUMENTS`, `HIDE_DELIVERY_TRIPS` | Line editor tabs | off | Hide the tab. |
| `DISALLOW_LINE_ITEM_EDIT` | Edit Line Item | off | Hides the line SAVE controls; the `ALLOW_LINE_ITEM_EDIT` permission (not seeded) re-enables them per role. |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT` | Department pickers (header and line) | off | Hide the dimension; the listing reads `SHOW_GL_DIMENSION / SEGMENT / PROFIT_CENTER / PROJECT` as opt-in column settings or permissions. |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_GROUP_DISCOUNT_PERCENTAGE`, `HIDE_LINE_ITEMS_GL_CODE` | Line Main Details quantity / price / tax / GL fields | off | Hide for everyone; the seeded `SHOW_*` permission re-shows the field for a role. |
| `HIDE_TOTAL_TXN_AMOUNT`, `HIDE_TOTAL_SST_VAT_GST_AMOUNT`, `HIDE_LANDED_COST` | Totals and the Landed Cost allocation controls on the Lines tab | off | Hide. |
| `SHOW_BUDGET` | Budget pickers (vote book, fiscal period, budget item, register) on line Main Details | off | Shows the budget controls. |
| `ENABLE_EDITING_UNIT_PRICE_STD` | Unit Price STD | off | Makes the standard price editable (the shared control renders for every applet because of a truthy literal in its `*ngIf`). |
| `DISABLE_EDITING_AMOUNT_TXN` | Transaction amount on lines | off | Locks the amount to the computed value (this code is in the shared screen's `lockTxnAmount` list). |
| `ENABLE_ITEM_NAME_MAX_LIMIT`, `ITEM_NAME_MAX_LIMIT`, `DISABLE_LINE_ITEM_NAME_EDIT` | Item Name on lines | off / empty | Character counter and limit (intranet #3714); lock the name. |
| `ENABLE_MULTIPLE_KO` | KO For and line KO grids | off | Allows lines from several source documents in one knock-off. |
| `EDIT_CONTRA_TXN_DATE`, `ENABLE_EDIT_PAYMENT_DATE` | Contra and Payment tabs | off | Make the contra / settlement date editable. |
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY` (Default Selection, also personal) | New-document header | empty | Applied as Branch / Location / Company when a document is created. |
| `DEFAULT_DECIMAL_PRECISION` (Default Selection) | Unit price decimals on lines | 2 (`DEFAULTS.DECIMAL_PRECISION`, allowed 2–4) | Sets the decimal places and step of every price field (intranet #4338). |
| `DATE_TXN_LOGIC` (Default Selection) | Transaction date written on FINAL | `USE_DATE_TXN` | `USE_FINAL`, `USE_CREATED`, `USE_UPDATED` make the backend overwrite `date_txn` at FINAL (`GenericDocumentService` L375–385) — a document dated in a locked period can then pass or fail differently from what the form shows. |
| `PURCHASE_INVOICE_NO_STOCK_IN_DETAILS_TAB_ORDER` (Default Selection) | Edit-form tab order | Search Document, Main Details, E-Invoice, Account, Line Items, KO For, Delivery Details, ARAP, Payment, Department Hdr, Posting, TraceDocument, Contra, Doc Link, Attachment, Export | Saved order applied to the edit form; new tabs are appended (intranet #934). |
| `PRINTABLE` (Printable Format Settings) | Default template | empty | Pre-selects the template on Export and enables bulk print; a Branch Settings → Printable Format default for the branch overrides it. |
| `DEFAULT_TOGGLE_COLUMN`, `DEFAULT_ORIENTATION`, `DEFAULT_ITEM_SEARCH_ITEM_TYPE` (Personalization) | Listing column layout, tab orientation, Search Item type filter | empty | Per-user preferences. |

Read at runtime without a model declaration (set through a gear or by API): `DISABLE_ITEM_LISTING`, `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING`, `HIDE_PRICING_DETAILS`, `SHOW_ITEM_STOCK_BALANCE`, `HIDE_LINE_ITEM_PRICING` (Lines-tab price columns, paired with the `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN_DISPLAY_PRICING` permission), `SHOW_GL_DIMENSION / SEGMENT / PROFIT_CENTER / PROJECT`.

Read without any control for this applet code (declared and consumed, gated out of the shared screen and on no gear): `DEFAULT_DECIMAL_STEP` (derived from the precision), `HIDE_E_INVOICE_TAB`, `HIDE_SUPPLIER_CODE`, `HIDE_EMAIL`, `HIDE_PHONE_NUMBER`, `HIDE_SIC_CODE_AND_BUSINESS_ACTIVITY_DESCRIPTION` (all on the inline supplier edit), `HIDE_MAIN_DETAILS_INVOICE`, `HIDE_MAIN_DETAILS_EXTERNAL_DOC_1_DATE`, and the six `MANDATORY_*` keys the form actually applies (`MANDATORY_REFERENCE`, `MANDATORY_INVOICE`, `MANDATORY_SEGMENT`, `MANDATORY_DIMENSION`, `MANDATORY_PROFIT_CENTER`, `MANDATORY_PROJECT`); `setControlValidator` also names `MANDATORY_QUOTATION / ORDER / DELIVERY_ORDER / OTHERS` and their `_DATE` twins, but those keys are model-only.

Declared and rendered but never read (saved and ignored): the eight `KNOCK_OFF_BY_* / KNOCK_OFF_FOR_*` keys, `ENABLE_AUTO_SCAN`, `ENABLE_VALIDATE_SERIAL`, `ALLOW_DIFFERENT_PAYEE_THAN_SELECTED_ENTITY`, `ENABLE_BRANCH_FILTER`, `ENABLE_IMPORT_EXPORT`, `EXPAND_DELIVERY_TRIPS`, `EXPAND_SETTLEMENT`, `HIDE_SETTLEMENT_TAB`, `HIDE_SST_VAT_GST_AMOUNT`, `HIDE_CREATED_DATE`, `HIDE_UPDATED_DATE`, and the card / batch `HIDE_* / MANDATORY_*` keys of the payment panel. Model-only (no control, never read): the fifteen custom-status keys, `ENABLE_ / INCLUDE_` dimension, SST and WHT flags, `HIDE_MAIN_DETAILS_*`, `HIDE_INVOICE_DATE`, `ENABLE_FILTER_BY_TODAYS_TXN`, `ENABLE_EDIT_SETTLEMENT_DATE`.

### Document behaviour settings

- **Posting** is not configurable in the applet: FINAL is fixed at quantity 0 / amount −1 (see Lifecycle). The applet sends `{ posting_status: "FINAL" }` with no validation flags; the backend defaults are `validate_serial_signum_zero = false` and `validate_stock_balance = true`, both irrelevant to a zero-signum document (stock checks apply to negative lines only, `GenericDocumentService` L387–392, L2064–2110).
- **Serial and batch numbers before FINAL**: the edit form disables FINAL while a serialised line has an invalid serial or a batch line's batch quantities do not add up to the line quantity (`disableFinal()` L765–790); the listing FINAL refuses rows whose lines fail `checkDoclineError`. These are client-side; on the backend a zero-signum document only gets the count check (`GENERIC_DOC_LINE_QTY_BASE_AND_SERIAL_NUMBER_QTY_DOES_NOT_MATCH`) and the existence checks are skipped for this document type (`purchaseDocTypeSignumZero` does not list it, L1866).
- **Status flow options**: `HIDE_GENDOC_*` hide FINAL / VOID / DISCARD; `SHOW_DOCUMENT_DELETE_BUTTON` on the applet's `APPLET_SETTINGS` extension exposes DELETE. There is no FINAL → DRAFT button in this applet (the seeded `HIDE_DRAFT_BUTTON` permission is never checked).
- **Transaction date**: `DATE_TXN_LOGIC` (Default Selection) is sent as `date_txn_logic` and can overwrite the date on FINAL.
- **Printables**: Jasper templates from Printable Format Settings; default from Branch Settings → Printable Format, else `PRINTABLE`. Export offers **EXPORT AS PDF** only (CSV / DOCX / ZIP are disabled placeholders). The seeded `PRINTABLE_FORMAT_WITH_NO_PRICE` permission is not checked by this applet.
- **e-Invoice (self-billed)**: the listing's **SELF-BILLED** action posts the selected documents to `fi/e-invoice/to-irbs/doc-self-billed/backoffice-ep` (`MyEInvoiceToIrbController` L289), which flags the header `einvoice_self_billed`, removes it from the purchase-matching queue and creates a posting-queue row; the E-Invoice tab shows Submission, Progress, Notification, Cancellation and Matched History panels, and the edit form hides VOID once e-Invoice is enabled for the document. However, the submission pipeline's purchase document-type lists (`MyEInvoiceToIRBProcessorService` L55–62; `getDocumentTypeCodes` returns `""` for anything but `INTERNAL_PURCHASE_INVOICE`, `…_SELF_BILLED_INVOICE`, `…_DEBIT_NOTE`, `…_CREDIT_NOTE`, `…_REFUND_NOTE`) do not include `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN`, so a document marked self-billed here does not reach LHDN as a self-billed invoice. Applet issue #18 (open) tracks adding it. Use the ordinary [Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/) for self-billed submissions today.
- **Workflow / approval**: none wired. **Intercompany**: `SHOW_INTERCOMPANY_PI_SCREEN` is read but the Search tab is commented out; the backend `sales-invoice-to-purchase-invoice` endpoint creates an ordinary `INTERNAL_PURCHASE_INVOICE`, not this type (`IntercompanyController` L52, L69–84).
- **File Import**: CSV only, PIPE or COMMA delimiter, template `Purchase_Invoice_Master_Data_Template.csv`; the Checking tab lists per-line validation errors (for example `BRANCH_VALIDATE_ERROR` when the branch code is not the tenant's). **File Export** generates a CSV for a transaction-date range asynchronously.

### Feature visibility / permissions

66 client-side permission definitions are seeded for `internalPurchaseInvoiceNoStockInApplet` in `bl_applet_client_side_perm_dfn`; 38 of them are checked in code: `SHOW_GENDOC_FINAL / VOID / DISCARD_BUTTON` (re-show the hidden buttons on the edit form), `SHOW_DOC_NO_TENANT / COMPANY / BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1…5`, `SHOW_TRANSACTION_DATE`, the line price / quantity / tax columns (`SHOW_UNIT_PRICE_*`, `SHOW_UNIT_DISCOUNT*`, `SHOW_AMOUNT_*`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_QTY_BASE / UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_LAST_PURCHASE_PRICE`, `SHOW_COSTING_DETAILS`), `SHOW_INTERCOMPANY_PI_SCREEN`, `HIDE_PRICE`, and `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN_DISPLAY_PRICING` (unit price, tax, discount, amount and landed-cost columns on the Lines tab and the Line Items listing; OWNER / ADMIN rank passes automatically).

Seeded but never checked (28): `SHOW_FINAL_BUTTON`, `SHOW_SAVE_BUTTON`, `SHOW_PRINT_BUTTON`, `SHOW_CLOSE_BUTTON`, `SHOW_SEND_EMAIL_BUTTON`, `HIDE_DRAFT_BUTTON`, `HIDE_EMAIL_PAYMENT_URL_BUTTON`, `HIDE_CUSTOM_DOC_NO`, `HIDE_DELIVERY_LOCATION`, `HIDE_FOREX_DATA_SOURCE`, `EDIT_CURRENCY_RATE`, `DISABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `REQUIRE_VALIDITY_DATE`, `SHOW_VALIDITY_DATE`, `SHOW_REASON`, `SHOW_SOURCE_DOC_NO`, `SHOW_BASE_CURRENCY`, `SHOW_CURRENCY`, `SHOW_CREDIT_LIMIT`, `SHOW_CREDIT_TERMS`, `SHOW_CREATED_BY_DETAILS`, `SHOW_DELIVERY_BRANCH`, `SHOW_LOCATION`, `SHOW_REFERENCE`, `SHOW_REMARKS`, `SHOW_EXTERNAL_REMARKS`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING`, `IPI_HIDE_TRACKING_ID_AND_PERMIT_NO`. Checked but **not seeded** (27): `SHOW_GENDOC_SAVE_BUTTON`, `SHOW_LISTING_BRANCH`, `SHOW_AMOUNT_MAIN_LISTING`, `SHOW_ARAP_PNS / SETTLEMENT / DOC_OPEN / CONTRA / BAL`, `SHOW_EINVOICE_NUMBER / DATE`, `SHOW_DESCRIPTION`, `SHOW_DOCUMENT_LINKS`, `SHOW_QUOTATION / ORDER / DELIVERY_ORDER / INVOICE / OTHERS`, `SHOW_FILE_IMPORT_MENU`, `SHOW_FILE_EXPORT_MENU`, `SHOW_SERIAL_NUMBER`, `SHOW_GL_DIMENSION / SEGMENT / PROFIT_CENTER / PROJECT`, `SHOW_INTERCOMPANY_TAB`, `ALLOW_TO_CREATE_EDIT_ACCOUNT`, `ALLOW_LINE_ITEM_EDIT` — until they are seeded, a tenant-wide hide of those items cannot be reopened per role, and inline supplier creation from the Account tab is unavailable.

Feature Visibility and Webhook are the shared screens from `blg-shared-utilities`; the applet adds nothing to them.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Doc Short Code, Doc No (Tenant / Company / Branch), Client Doc Short Code | Document numbers | read-only | Assigned on FINAL; hidden by `HIDE_SERVER_DOC_*` / `HIDE_CLIENT_DOC_*`. |
| Branch, Location | Owning branch and store (`guid_store`) | Yes (`Validators.required`) | Branch fills Company and Currency; defaults from Default Selection. |
| Delivery Branch, Delivery Location | Where the goods were received | No | Default to Branch / Location; copied to knocked-off lines. |
| Transaction Date | Document date | Defaults to today (`date_txn = new Date()` when empty) | May be overwritten on FINAL by `DATE_TXN_LOGIC`; checked against locked fiscal periods. |
| Purchaser | Responsible buyer (employee) | No | Auto-filled with `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`. |
| Credit Terms, Credit Limit | Supplier terms | No | Read from the supplier once selected. |
| Reference, Remarks, External Remarks, Description, Permit No, Tracking ID | Free text | No unless `MANDATORY_REFERENCE` | `ENABLE_DUPLICATE_REFERENCE_CHECK` warns on duplicates. |
| External Quotation / Order / Delivery Order / Invoice / Others, each with a Date | Supplier's document numbers (`xtn_doc_ref_1…5`, `_date`) | No unless `MANDATORY_INVOICE` | Enter the supplier's invoice number in *External Invoice*; the dates were added in 2026 (intranet #4717, #3324). |
| Client Document Type, Client Doc 1…5 No | Tenant-defined numbering | No | Hidden by `HIDE_CLIENT_DOC_*`. |
| Currency, Base Currency, Currency Rate | Document currency | No | From the branch; rate locked by `CANNOT_EDIT_CURRENCY_RATE`; SAVE refuses a zero rate on a forex document (client-side toast). |
| Created By / Date, Modified By / Date | Audit fields | read-only | Hidden by `HIDE_CREATED_BY_DETAILS`. |

### Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity (Supplier) | Supplier entity | Yes (`entityId` `Validators.required`; CREATE stays disabled without it) | Picked from Select Supplier; inline create / edit needs the `ALLOW_TO_CREATE_EDIT_ACCOUNT` permission (not seeded). |
| Bill To / Ship To | Addresses | No | From the entity's address list. |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item | Item code / name | Yes | From Search Item, or copied by a KO sub-tab (open-queue lines only). A knocked-off line writes a `bl_fi_generic_doc_link` row with `txn_type` `KO`. |
| Qty | Quantity invoiced (`quantity_base`) | Yes | `Validators.required`, `min(1)`; default 1. Does not move stock. |
| Unit price, discount, tax, WHT, net / transaction amount fields | Purchase value | `txnAmt`, `netAmt`, `netAmtWithTax` required, all `min(0)` | Decimal places from `DEFAULT_DECIMAL_PRECISION`; `DISABLE_EDITING_AMOUNT_TXN` locks the transaction amount. |
| GL Code (`guid_glcode`) | Line-level purchase account | No | Wins over header GL, item-company link and company default for this document type. Hidden by `HIDE_LINE_ITEMS_GL_CODE`. |
| Landed Cost | Amount allocated across lines (**ALLOCATE** / **CONFIRM**) | No | Written to `landed_txn_amount`; hidden by `HIDE_LANDED_COST`. |
| Serial numbers | Per-unit serials | When the item is serialised | Count must equal Qty (backend `GENERIC_DOC_LINE_QTY_BASE_AND_SERIAL_NUMBER_QTY_DOES_NOT_MATCH`); no company existence check for this document type. |
| Batch: batch no, issue date, expiry date, qty | Batch tracking | Yes on the Batch tab | Batch quantities must sum to Qty (client `disableFinal()`); date fields hidden by `HIDE_BATCH_ISSUE_DATE` / `HIDE_BATCH_EXPIRY_DATE`. |
| Bin: bin code, container measure, container qty, qty | Bin tracking | Yes on the Bin tab | Client-required only; no inventory transaction results. |
| Department (segment, dimension, profit centre, project) | Analysis codes | No unless `MANDATORY_*` | Copied to the journal lines; header values are the fallback. |
| Budget (vote book, fiscal period, budget item, register) | Budget control | No | Shown only with `SHOW_BUDGET`. |
| Delivery Details, Costing Details, Pricing Details, Issue Link, Doc Link, Multi Discount, Related Documents | Auxiliary tabs | No | |

### Delivery Details, Payment, Contra, KO For

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Delivery Details tab | Tracking ID, delivery type, delivery branch / location with *Apply to Lines* | No | Bulk-assigns the per-line delivery fields. |
| Payment lines | Settlement-method lines (`txn_type` `STL_MTHD`) | No | Settlement date editable with `ENABLE_EDIT_PAYMENT_DATE`; the journal resolves the cashbook GL per settlement item and throws `MISSING_CASHBOOK: STL_MTHD [code]` when none exists. |
| Contra | `bl_fi_generic_doc_arap_contra` rows against other FINAL purchase documents | No | Date editable with `EDIT_CONTRA_TXN_DATE`. |
| KO For (header) | Purchase GRN, Purchase GRN Stock In, Purchase Order grids | No | Each grid renders only with an enabled `LINE` flow row for that source type; `ENABLE_MULTIPLE_KO` allows several source documents. |

## Lifecycle and posting

Statuses: DRAFT (new documents; SAVE keeps them here) → **FINAL** → **VOID**. DRAFT documents can be **DISCARDED** (listing or edit form, confirmation dialog). FINAL is sent as `{ posting_status: "FINAL" }` to the generic-document posting-status endpoint; a second FINAL is refused with HTTP 403 "Generic Document has already been posted to FINAL" (`GenericDocumentService` L364, L2889). VOID is refused by the applet when an active `RETURN` link to an `INTERNAL_PURCHASE_RETURN` exists ("The invoice has already been linked with a purchase return", client-side toast) or when e-Invoice is enabled for the document (`showVoid()`); the backend refuses VOID with `GENERIC_DOCUMENT_HAS_TARGET_LINKS` when any downstream document has knocked this one off (`GenericDocumentController` L2950). DELETE (edit form, non-FINAL only, two clicks) calls the DELETE endpoint; its FINAL guard is client-side only. **Search Purchase Invoice** clones a FINAL PI No Stock In into a new document, optionally with attachments.

Posting proof block:

| Fact | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN`, short code `PURINVNSI` | `InternalPurchaseInvoiceNoStockInDataConsistencyObject` L15; `GenericDocServerDocTypeEnum` L67 |
| Amount signum | **−1** (checked on create and update: `checkAmountSignum`) | DCO `specificValidationForCreation/Update`; applet `AppletConstants.amount_signum = -1` |
| Quantity signum | **0** — `fillQuantitySignumAndAmountSignumForLine` overwrites whatever the client sends | DCO `specificFillMissingDataForLineCreation/Update`; `AppletConstants.quantity_signum = 0` |
| Dr/Cr equation | For each `PNS` line: **Dr Purchase** (`amount_net`, line GL if set); **Dr Input Tax** for `amount_tax_gst`; one header line **Cr Creditor** (supplier AR/AP type → `CREDITOR` / `CREDITOR_NON_TRADE`) for the sum. **Only when the document has at least one active `bl_fi_generic_doc_link` row as `doc_2`** (a knock-off from a GRN Stock In, PO, GRN, PR or Supplier DO — `getGenDoc1Guids` filters on status only): a second pair **Dr Creditor Not Invoiced / Cr Inventory Not Invoiced** for the same total (net **plus tax**). Purchase discount / return sub-ledgers exist for negative lines. | `JournalPostingTypeHandler` L53–61 (`PURCHASE`: `PNS_ENTITY → CREDITOR`, `PNS → PURCHASE`, `PNS_TAX → INPUT_TAX`); `JournalPostingService` L96–130, L235–275, L325–360, L474–540; `GenericDocumentLinkUow` L405–410 |
| GL precedence | Line GL code → header GL code → item-company link (`PURCHASE` txn code) → company default `PURCHASE` (`isConsignmentStockIn` is false for this type, so the line GL is honoured). Creditor: company default for the resolved AR/AP code, `MISSING_DEFAULT_GL_CODE: CREDITOR` if absent (L339). Accrual legs: company defaults `CREDITOR_NOT_INVOICED` (L490) and `INVENTORY_NOT_INVOICED` (L526), each throwing `MISSING_DEFAULT_GL_CODE` if absent. | `JournalPostingService` L64–66, L138–190 (PNS branch from L150) |
| Stock processor | None. `InventoryTransactionLineProcessorService` creates `bl_inv_txn_line` rows only for lines with a non-zero quantity signum (L39–40, L74–75); the type is not in `StockBalanceHelper.MA_WA_SERVER_DOC_TYPES` (L40–42), so the moving-average cost is untouched. Stock and cost were booked by the GRN Stock In. | |
| Open queue / auto-create | `PurchaseGRNStockInToPurchaseInvoiceNoInStockConverter` (mapped in `GenericDocumentConverterFactory` L21) copies a FINAL GRN Stock In, sets amount signum −1, writes one `KO` link per line (`GenericDocumentConverter` L47–90 — so the accrual leg fires), takes posting status from `doc_2_posting_status` (default FINAL) and, when FINAL, assigns running numbers and enqueues the primary processor. Downstream rows in the Knock Off Configuration decide whether FINAL opens this invoice's lines for a Purchase Return or a Payment Voucher. | converter L40–70 |
| What VOID reverses | `VoidGenericDocumentPrimaryProcessor` fans out: the journal processor posts the reverse journal (all legs above), the knock-off processor marks this document's open-queue rows DELETED (the GRN Stock In lines become open again), tax and ARAP contra processors reverse their entries. No inventory reversal, because none was posted. | run-12 citations on the GRN Stock In page |

What FINAL actually does (`GenericDocumentService.updatePostingStatus`, FINAL branch):

1. Apply `date_txn_logic` (L375–385), then `validateGenericDocumentOnFinal`: forex rate check; serial-number duplicates within the document (`GENERIC_DOC_LINE_SERIAL_NUMBER_ID_IS_DUPLICATED`) and count equal to `quantity_base`; batch and bin JSON checks; `FISCAL_PERIOD_LOCKED` when the transaction date is inside a `LOCK_ALL` / `LOCK_TXN` period (L1695, intranet #1616). Serial existence and stock-balance checks are skipped for zero-signum lines.
2. Update the header, assign running numbers, set `date_finalized`.
3. Enqueue `GenericDocumentPrimaryProcessor`, which applies the company's `posting_final_json` include / exclude list and fans out to the journal, open-queue, tax, ARAP and webhook processors. The inventory job finds no movement lines.

**Tax on the pair.** The accrual-reversal leg uses the invoice's *total including tax* (`totalAmount` is summed after the tax lines are added, L322–325), while the GRN Stock In debited `INVENTORY_NOT_INVOICED` for the net only and `INPUT_TAX` for the tax. Capturing tax on both documents therefore debits input tax twice and leaves `INVENTORY_NOT_INVOICED` with a credit residual equal to the tax; capturing it only on the invoice leaves the same residual on the accrual accounts. The accounts reconcile exactly only for tax-free lines. Reconcile *Creditor Not Invoiced* against *Inventory Not Invoiced* monthly until this is changed (question raised in the lane findings).

## Related applets

- [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) — the receipt this invoice settles; its FINAL raised the accrual this document reverses.
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) and [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the other receiving pair; never mix pairs for the same delivery (intranet #3940).
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) — other knock-off sources; a link from any of them also triggers the accrual-reversal journal leg.
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — returns goods and debits the supplier; an active return link blocks VOID here.
- [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/), [Purchase Debit Note (Internal)](/applets/purchase-workflow/internal-purchase-debit-note-applet/), [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — adjust and settle the creditor balance shown on the ARAP tab.
- [Purchase Invoice Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet/) — supplier-facing view.
- [MY e-Invoice Admin](/applets/e-invoice/my-e-invoice-admin-applet/) — where self-billed submissions are monitored; this document type is not yet in the pipeline.
- [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) — master data and default GL codes the posting depends on.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Journal job fails with `MISSING_DEFAULT_GL_CODE: CREDITOR_NOT_INVOICED` or `…: INVENTORY_NOT_INVOICED` after FINAL | The invoice carries a knock-off link, so the accrual-reversal leg runs, and the company has no default GL code for that txn code. The document is already FINAL; only the journal is missing. | Add the company default GL codes, then re-post the journal. |
| Journal job fails with `MISSING_DEFAULT_GL_CODE: CREDITOR` | The supplier's AR/AP type resolves to a creditor code the company has no default for. | Add the default (`CREDITOR` or `CREDITOR_NON_TRADE`) or fix the supplier's AR/AP type. |
| Journal job fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` | A line had no resolvable purchase GL (no line GL, header GL, item-company `PURCHASE` link or company default) or no `INPUT_TAX` default, so the line was silently omitted. | Set the GL code on the line or the company default; re-post. |
| *Creditor Not Invoiced* and *Inventory Not Invoiced* never net to zero although every GRN Stock In has been invoiced | The reversal leg is posted with the invoice total including tax, while the GRN Stock In accrued net only (see Lifecycle). | Capture tax on one document only and reconcile the residual (equal to the input tax) monthly; raise a change request. |
| The accrual accounts move on an invoice that was knocked off from a Purchase Order, with no GRN Stock In | The reversal leg fires on *any* active link where this document is the target (`getGenDoc1Guids` does not filter by source type). | Use the ordinary Purchase Invoice for PO-only flows; reverse with a manual journal. |
| Stock counted twice (intranet #3940) | A stock-moving Purchase Invoice was raised for goods already received on a GRN Stock In, or the Knock Off Configuration routes the GRN Stock In into `INTERNAL_PURCHASE_INVOICE`. | Route `INTERNAL_PURCHASE_GRN_STOCK_IN → INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN`; void the duplicate. |
| KO For shows no *Purchase GRN Stock In* tab, or the grid is empty | The company has no enabled `LINE` row `INTERNAL_PURCHASE_GRN_STOCK_IN → INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN`, the GRN Stock In is not FINAL, or its lines are fully invoiced; the grid reads the open queue, not the GRN listing (intranet #3939 for stale queue rows). | Add / enable the row; run the queue repair for stale rows. |
| Auto-created invoice appears as DRAFT (or as FINAL when a review step was expected) | `doc_2_posting_status` on the Knock Off Configuration row; the converter defaults to FINAL. | Set the row's target posting status. |
| SELF-BILLED marks the document but nothing reaches LHDN, or the e-Invoice type is blank | The e-Invoice submission pipeline does not list `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` (applet issue #18, open). | Submit self-billed e-Invoices from the ordinary Purchase Invoice until the type is added. |
| SELF-BILLED fails with "E-Invoice status not enabled for company" or "already in posting queue / batch pool" | Company e-Invoice status is not `ENABLED`, or the document is already queued (`MyEInvoiceSelfBilledConversionService` L56–62). | Enable e-Invoice for the company; check the queue in MY e-Invoice Admin. |
| VOID button missing on a FINAL document | e-Invoice is enabled for the document (`showVoid()`), or `HIDE_GENDOC_VOID_BUTTON` is set and the role lacks `SHOW_GENDOC_VOID_BUTTON`. | Cancel the e-Invoice first; grant the permission. |
| VOID refused: "The invoice has already been linked with a purchase return" / `GENERIC_DOCUMENT_HAS_TARGET_LINKS` | A Purchase Return (client check) or any downstream document (backend) has knocked this invoice off. | Void the downstream document first. |
| FINAL fails with "The selected date falls within a locked fiscal period" | `FISCAL_PERIOD_LOCKED` (intranet #1616); note `DATE_TXN_LOGIC` may have replaced the date you entered. | Change the date or reopen the period; check Default Selection. |
| FINAL button greyed on the edit form | A serialised line has an invalid serial, or a batch line's quantities do not add up (`disableFinal()`). | Fix the line. |
| Line grid columns appear in a confusing order when opened from a GRN Stock In (intranet #4339, open) | Known default column-order issue across PO / GRN / PI applets. | Reorder columns and rely on the saved layout. |
| Application Settings lacks a tab the applet uses (intranet #3329, open) | The shared screen's tab sections are keyed by applet code; sections not mapped for this code do not render. | Use the inline gear (`ENABLE_INLINE_APPLET_CONFIG`) for those keys. |
| Ordinary users see no prices on the Lines tab or Line Items listing | `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN_DISPLAY_PRICING` is not granted (OWNER / ADMIN rank passes automatically); `HIDE_LINE_ITEM_PRICING` hides the same columns tenant-wide. | Grant the permission. |
| Unit price cannot take three decimals (intranet #4338) | `DEFAULT_DECIMAL_PRECISION` in Default Selection is 2. | Change it there (2–4). |
| Cannot create a supplier from the Account tab | `ALLOW_TO_CREATE_EDIT_ACCOUNT` is checked but not seeded for this applet. | Seed the code in the client-side permission listing, then grant. |
| File import rows fail with `BRANCH_VALIDATE_ERROR` | The branch code in the CSV does not match a branch of the tenant. | Correct the code; re-upload. |
| Labels are English only; layout breaks on mobile | Internationalisation (intranet #5071) and responsive UI (intranet #4803) are open. | None yet. |

## Related documentation

- [Purchasing module](/modules-v2/purchasing/) and [Financial Accounting module](/modules-v2/financial-accounting/)
- [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) — the receipt leg of this pair
- [Standard procurement workflow](/guides/purchasing-guides/standard-procurement-workflow/) and [Direct GRN workflow](/guides/purchasing-guides/direct-grn-workflow/) — where the GRN Stock In → PI No Stock In pair sits in the PO → receipt → invoice flow
