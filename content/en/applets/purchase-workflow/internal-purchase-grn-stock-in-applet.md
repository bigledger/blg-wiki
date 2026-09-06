---
title: "Purchase GRN Stock In Applet (Internal)"
description: "Reference for the Purchase GRN Stock In (Internal) applet: the goods-received document that books stock in and accrues the supplier liability at receipt, its screens, every configuration switch, fields, posting proof, VOID behaviour and known failure modes."
applet_code: "internalPurchaseGrnStockInApplet"
applet_repo: "blg-applet-wavelet-internal-purchase-grn-stock-in-applet"
modules: [purchasing, inventory]
related_applets:
  - internal-purchase-invoice-no-stock-in-applet
  - internal-purchase-grn-applet
  - internal-purchase-invoice-applet
  - internal-purchase-order-applet
  - internal-purchase-requisition-applet
  - internal-purchase-return-applet
  - internal-purchase-gin-applet
  - internal-purchase-grn-supplier-access-applet
  - supplier-delivery-order-applet
  - stock-availability-applet
  - stock-balance-applet
  - stock-adjustment-applet
  - supplier-applet-1
  - organisation-applet
  - chart-of-account-applet
  - doc-item-maintenance-applet
  - inv-item-maintenance-applet
  - tax-configuration-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/app.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/settings-container/custom-status/custom-status.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-listing/internal-purchase-grn-listing.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-listing/internal-purchase-grn-listing.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-edit/internal-purchase-grn-edit.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-edit/export/export.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-edit/edit-contra/edit-contra.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/internal-purchase-grn-create.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/internal-purchase-grn-create.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/line-item/line-item-listing.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/line-item/line-item-create/line-item-create.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/import-knock-off/knock-off-purchase-order/knock-off-purchase-order.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/add-line-item/add-line-item.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/settings/applet-settings-toggle/applet-settings-toggle.component.ts
    - akaun_master.bl_applet_client_side_perm_dfn (applet code internalPurchaseGrnStockInApplet, 51 rows)
  fields:
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/delivery-details/delivery-details.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/add-line-item/add-line-item.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/add-line-item/item-details/item-details.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/line-item/line-item-create/line-item-create.component.html
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-create/payment/add-payment/add-payment.component.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/state-controllers/draft-controller/store/reducers/hdr.reducers.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/state-controllers/draft-controller/store/reducers/pns.reducers.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/state-controllers/draft-controller/store/effects/pns.effects.ts
  lifecycle:
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/state-controllers/internal-purchase-grn-controller/store/effects/internal-purchase-grn.effects.ts
    - blg-applet-wavelet-internal-purchase-grn-stock-in-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-grn-stock-in-applet/src/app/components/internal-purchase-grn-container/internal-purchase-grn-edit/search-documents/search-grn/search-grn.component.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-grn-stock-in.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/intercompany-services/intercompany.service.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseGrnStockInDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/InventoryTransactionLineFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/GenericDocumentConverterFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/genericDocument/genericDocumentConverter/PurchaseGRNStockInToPurchaseInvoiceNoInStockConverter.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/StockAvailabilityUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/intercompany/IntercompanyController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/VoidGenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/VoidInventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/journalPosting/VoidJournalPostingProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/VoidKnockOffProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentOpenAutoConvertQueueProcessor.java
  troubleshooting:
    - gh:bigledger/blg-intranet#3856
    - gh:bigledger/blg-intranet#3939
    - gh:bigledger/blg-intranet#3940
    - gh:bigledger/blg-intranet#3330
    - gh:bigledger/blg-intranet#3919
    - gh:bigledger/blg-intranet#4338
    - gh:bigledger/blg-intranet#4339
    - gh:bigledger/blg-intranet#3337
    - gh:bigledger/blg-intranet#3671
    - gh:bigledger/blg-intranet#5348
    - gh:bigledger/blg-intranet#5260
    - gh:bigledger/blg-intranet#1616
    - gh:bigledger/blg-intranet#5067
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
tags:
- purchase-workflow
- grn
- goods-received-note
- stock-in
- warehouse-operations
- inventory-management
weight: 19
date: 2026-05-06
lastmod: 2026-09-05
draft: false
---

## Overview

The **Purchase GRN Stock In Applet (Internal)** records the physical receipt of goods from a supplier **and books them into stock on FINAL**. It is the receiving document for tenants that want inventory and cost updated the moment the goods arrive, with the supplier's invoice matched later. Warehouse or receiving staff create it against a Purchase Order (or by searching items directly); finance follows it with a [Purchase Invoice No Stock In](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/).

This applet is one of two receiving documents on the purchase side and the two behave very differently in the backend:

| Document | Server document type | Quantity | Amount | What FINAL does |
|---|---|---|---|---|
| **Purchase GRN Stock In** (this applet) | `INTERNAL_PURCHASE_GRN_STOCK_IN` (short code `PURGRNSI`) | **+1** | **−1** | Creates inventory transactions, updates the item's moving-average cost, posts a journal to *Inventory Not Invoiced* / *Creditor Not Invoiced*, opens the lines for the PI No Stock In. |
| [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` | 0 | 0 | Records receipt only; the [Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/) moves stock and books the creditor. |

Pick one pair per company and configure the Knock Off Configuration accordingly; mixing them double-counts stock (see Troubleshooting).

## Where it fits

Modules: [Purchasing](/modules/purchasing/) and inventory.

| Direction | Document / applet | Relationship |
|---|---|---|
| Upstream | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) | Knock-off sources. The **KO For** tab offers Purchase Order; the line editor's KO sub-tabs (PO, PR, PI) appear only when the company's Knock Off Configuration has an enabled `LINE` row for that source type. |
| Downstream | [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) | The invoice that settles a GRN Stock In. The backend converter `PurchaseGRNStockInToPurchaseInvoiceNoInStockConverter` can create it automatically from the open queue. |
| Reversal | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | Sends goods back to the supplier (quantity −1, amount +1). [Purchase GIN (Internal)](/applets/purchase-workflow/internal-purchase-gin-applet/) is a dispatch record only (0/0) and does not reverse this document's stock. |
| Sibling | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) | The non-posting receipt, paired with the ordinary Purchase Invoice. |
| Supplier-side view | [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) | External views of receipts and deliveries. |
| Stock enquiries | [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) | Stock Availability counts DRAFT GRN Stock In lines as *GRN Stock In draft balance* (`HIDE_GRN_STOCK_IN_DRAFT_BALANCE` option) and open PO→GRN Stock In queue rows as `po_qty`. |

## Screens and menus

The applet has two menu items: **Internal Purchase GRN Stock In** (the document listing) and **Line Items** (every GRN Stock In line across documents; the File Export menu is present in the code but commented out).

**Listing.** Columns: Doc Short Code (`PURGRNSI`), Doc No (Tenant / Company / Branch), Invoice No and the other external references, Supplier Name, Branch, Transaction Date, posting status, AR/AP balance columns and ordered / received / outstanding quantity and amount columns; every column is governed by a `HIDE_*` setting with a matching `SHOW_*` permission (see Configuration). Toolbar buttons: **FINAL** (multi-select, DRAFT rows only), **DISCARD** (DRAFT rows), **VOID** (FINAL rows), **SINGLE/MULTIPLE PRINT**, and an opt-in **DRAFT** button that sends FINAL documents back to draft. A `DEFAULT_TRANSACTION_DATE` preset and the `DEFAULT_STATUS` filter shape the initial query.

{{< figure src="/images/internal-purchase-grn-stock-in-applet/path-b.png" alt="Purchase GRN Stock In listing with FINAL, DISCARD, VOID and print buttons, and the create form open on the KO For tab" caption="Listing (left) and the create form's KO For → Purchase Order tab (right), staging tenant with test data." >}}

**Create form** tabs: Search (intercompany, permission-gated), Main Details, Account, Lines, Delivery Details, Payment, KO For (Purchase Order), Department Hdr. **CREATE** is enabled once Main Details is valid, a supplier is selected and at least one line exists.

**Edit form** tabs (order configurable in Default Selection): Search Document (TEMP documents only: *Search Purchase Order* and *Search Purchase GRN*, which clones a FINAL GRN Stock In), Main Details, Account, Lines, Delivery Details, KO For (TEMP only), Payment, Department Hdr, TraceDocument, Contra, Doc Link, Export, Attachments, Status. Buttons: RESET, SAVE, FINAL, VOID, DISCARD and (when the applet extension `SHOW_DOCUMENT_DELETE_BUTTON` is set on the applet record) a two-click DELETE for non-FINAL documents. All tabs can be rendered as vertical expansion panels (`VERTICAL_ORIENTATION`).

**Line editor** (Add / Edit Line Item): Item Details (Main Details, Delivery Instruction, Child Items for grouped / bundle items, Department, Doc Link in edit mode, Multi Discount, Delivery Details), Serial Number / Batch Number / Bin Number (shown according to the item's `sub_item_type`), Costing Details, Pricing Details, Issue Link. The Lines tab itself offers Search Item plus *KO For Purchase Order / Requisition / Invoice* sub-tabs.

{{< figure src="/images/internal-purchase-grn-stock-in-applet/line-item-workspace-purgrn-stock-in.png" alt="Line Items listing with the Edit Line Item panel open on Item Details" caption="Line Items menu: every GRN Stock In line in the tenant, with the line editor on the right (staging tenant, test data)." >}}

**Settings** menu (System Configuration): Application Settings, Default Selection, Printable Format Settings, Branch Settings, Custom Status; the routes also expose Webhook, Feature Visibility, Release Notes, Applet Log and the shared permission listings (client-side permission, role pricing scheme link, permission wizard, permission set, user / team / role permission). **Personalization**: Default Selection and Sidebar.

## Configuration

### Before you can use it

- **Company, branch and locations** in [Organisation](/applets/master-data/organisation-applet/). Branch, Company and Location are required on the header; Delivery Branch / Delivery Location default to them. Stock is booked to the line's delivery location, else the line's store, else the header location, else the branch's default location (`InventoryTransactionLineFactory`), so every receiving branch needs a default location.
- **Default GL codes** for the company: `INVENTORY_NOT_INVOICED`, `CREDITOR_NOT_INVOICED` and, when tax lines exist, `INPUT_TAX` (company GL-code links, set up through [Chart of Account](/applets/master-data/chart-of-account-applet/) / the company's default GL mapping). Without `CREDITOR_NOT_INVOICED` the journal job throws `MISSING_DEFAULT_GL_CODE: CREDITOR_NOT_INVOICED` (`JournalPostingService` L339); without `INVENTORY_NOT_INVOICED` the purchase lines are silently omitted and the job fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` (L575).
- **Knock Off Configuration** for the company (Organisation → Company → Knock Off Configuration, table `bl_fi_comp_gendoc_flow_config`): an enabled `INTERNAL_PURCHASE_ORDER → INTERNAL_PURCHASE_GRN_STOCK_IN` row so POs appear in KO For, and an `INTERNAL_PURCHASE_GRN_STOCK_IN → INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` row so FINAL GRNs are queued for the invoice. The same table's `doc_2_posting_status` decides whether the auto-created PI No Stock In is DRAFT or FINAL.
- **Suppliers** in [Supplier](/applets/master-data/supplier-applet-1/); the entity's AR/AP type is read but overridden to `CREDITOR_NOT_INVOICED` for this document type.
- **Items** in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) / [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/): only basic / alias items with an inventory item link (or serialised coupons) create inventory transactions; grouped and bundle items post through their component links.
- **Tax codes** in [Tax Configuration](/applets/master-data/tax-configuration-applet/) if input tax is captured on lines.
- **Running numbers** for `INTERNAL_PURCHASE_GRN_STOCK_IN` are assigned by the backend on FINAL.
- **Backend permissions**: `TNT_API_DOC_INTERNAL_PURCHASE_GRN_STOCK_IN_CREATE / READ / UPDATE / DELETE_TGT_GUID` (`GenericDocumentTypeHandler`). The KO For and Search Purchase Order screens additionally read the `…_DELIVERY_BRANCH_READ` target so a user can receive into a delivery branch they are not a member of.

### Applet settings

Where settings live (read from `app.routing.ts` and `menu-items.ts`, applet @45f0bbd, shared utilities @af523eb):

| Screen | Component | What it holds |
|---|---|---|
| Settings → Application Settings (`field-settings`) | shared `FieldConfigurationComponent` (blg-shared-utilities) | The HIDE_* / ENABLE_* toggles below. The registry code `internalPurchaseGrnStockInApplet` **is** in the shared screen's `tabMappings` (Search, Department Hdr, KO, Contra, Doc Link, Attachments, Export, Status, Delivery Details, Payment tab toggles render) and in its purchase-family lists, so 117 of the 212 keys this applet declares have a control there. |
| Inline gear (`app-applet-settings-toggle`) | shared component on 8 screens: listing (41 keys), edit form (32), create form (9), Main Details (33), Line Items listing (5), line editor (8), Item Details (4), line Main Details (22) | Master and personal overrides for the listed keys. Five keys are gear-only for this applet (`HIDE_AMOUNT_MAIN_LISTING`, `HIDE_CREDIT_TERMS`, `HIDE_REFERENCE`, `HIDE_REMARKS`, `HIDE_TRACE_DOCUMENT_TAB`). |
| Settings → Default Selection | applet-local `DefaultSettingsComponent` | Default Branch, Default Location (auto-filled with the branch's `MAIN_LOCATION`), Unit Price Decimal Precision, and drag-and-drop **Details Tab Ordering** (`INTERNAL_PURCHASE_GRN_DETAILS_TAB_ORDER`). |
| Settings → Printable Format Settings | applet-local listing with "set default" | `PRINTABLE` (default Jasper template GUID for Export and bulk print). |
| Settings → Branch Settings | applet-local, per branch | Branch Details, Default Settlement Method, Item Category Filter, Menu List, Pricing Scheme, **Printable Format** (per-branch default template for this document type, read by Export ahead of `PRINTABLE`). |
| Settings → Custom Status | applet-local | Five header statuses (`ENABLE_ / NAME_ / LIST_CUSTOM_STATUS_HDR_1…5`). Line statuses are declared but never read. |
| Personalization → Default Selection | applet-local `PersonalDefaultSettingsComponent` | Personal Default Branch / Location, saved through `savePersonalSettingsInit`; settings are read as `{...master, ...personal}`. |

Master settings are changed by OWNER / ADMIN users through the Settings menu or the gear's master mode; personal mode on the gear and Personalization are open to every user. Defaults: every toggle below is off / empty unless the row says otherwise — the shared screen patches the stored value or `false`, and the document code treats an absent key as "not hidden".

The table lists the keys that pass all four proofs (declared in `applet-settings.model.ts`, rendered on the shared screen, a gear or an applet-local screen, persisted by the settings service, and read by this applet's code — including reads through `isShowColumn()`, `showExternalDocField()` and the tab list's `hide:` / `expandSetting:` accessors).

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_TRANSACTION_DATE` | Listing date preset (`1_day`, `1_week`, `1_month`) | empty | Listing opens pre-filtered. |
| `DEFAULT_POSTING_STATUS`, `SORT_ORDER` | Listing default filter and ordering | empty | Shared listing behaviour. |
| `DISABLE_GEN_DOC_LISTING` | Locks the listing | off | Hides Create and ignores row clicks. |
| `ENABLE_AUTO_POPUP` | Print after FINAL | off | Bulk-prints the selected documents after a listing FINAL. |
| `ENABLE_SELECT_MODE` | Select Supplier listing | off | Row selection mode in the supplier picker. |
| `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON` | Listing and edit-form action buttons | off | Hide the button for everyone; the matching `SHOW_GENDOC_*` client-side permission re-shows it per role (not seeded, see below). `HIDE_GENDOC_SAVE_BUTTON` is read by the edit template only. |
| `HIDE_SERVER_DOC_1`, `HIDE_SERVER_DOC_2`, `HIDE_SERVER_DOC_3`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1…5` | Document-number and client-document columns / fields | off | Hidden on the listing and Main Details; `SHOW_DOC_NO_TENANT / COMPANY / BRANCH` and `SHOW_CLIENT_DOC_*` permissions re-show them. |
| `HIDE_EXTERNAL_QUOTATION`, `HIDE_EXTERNAL_ORDER`, `HIDE_EXTERNAL_DELIVERY_ORDER`, `HIDE_EXTERNAL_INVOICE`, `HIDE_EXTERNAL_OTHERS` (fallback keys `HIDE_QUOTATION`, `HIDE_ORDER`, `HIDE_DELIVERY_ORDER`, `HIDE_INVOICE`, `HIDE_OTHERS`) | External Quotation / Order / Delivery Order / Invoice / Others number **and date** fields and listing columns | off | The `HIDE_EXTERNAL_*` key wins when set; otherwise the bare key is read. |
| `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL` | AR/AP amount columns on the listing | off | `HIDE_MAIN_ARAP_TAB` (gear, no model key) hides all five at once. |
| `HIDE_AMOUNT_TXN_MAIN_LISTING`, `HIDE_AMOUNT_MAIN_LISTING`, `HIDE_QTY_MAIN_LISTING` | Amount ordered / received / outstanding and quantity columns on the listing | off | Either amount key hides the amount columns. |
| `HIDE_ACCOUNT_TAB_DETAILS`, `HIDE_ACCOUNT_BILLING_CONTACT`, `HIDE_ACCOUNT_SHIPPING_CONTACT` | Account tab and its Bill To / Ship To panels; Supplier Name listing column | off | `SHOW_ACCOUNT_TAB_DETAILS` permission re-shows the tab. |
| `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION` | Main Details location fields and the KO grids' delivery columns | off | With `HIDE_DELIVERY_LOCATION` on, selecting a location copies branch and location into the delivery fields silently. |
| `HIDE_CREDIT_TERMS`, `HIDE_REFERENCE`, `HIDE_REMARKS`, `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID`, `HIDE_CREATED_BY_DETAILS`, `HIDE_BASE_CURRENCY`, `HIDE_CURRENCY`, `HIDE_DESCRIPTION` | Main Details fields | off | Hide the field. The first three are gear-only for this applet code. |
| `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE` | Currency rate field | off | Lock the rate / show the data-source picker. |
| `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Purchaser | off | On create, the purchaser is looked up from the logged-in user's employee record. |
| `ENABLE_DUPLICATE_REFERENCE_CHECK` | Reference / external numbers | off | Warns when the same reference already exists on another GRN Stock In. |
| `HIDE_SEARCH_BY_DOCUMENT_BUTTON`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_TRACE_DOCUMENT_TAB`, `HIDE_DOC_LINK_TAB`, `HIDE_EXPORT_TAB`, `HIDE_ATTACHMENT_TAB`, `HIDE_STATUS_TAB` | Edit-form tabs | off | Hide the tab; `SHOW_EXPORT_TAB` permission re-shows Export. |
| `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_DELIVERY_DETAILS`, `EXPAND_KO_FOR`, `EXPAND_SETTLEMENT`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_TRACE_DOCUMENT`, `EXPAND_MAIN_CONTRA`, `EXPAND_DOC_LINK`, `EXPAND_EXPORT`, `EXPAND_ATTACHMENT`, `VERTICAL_ORIENTATION` | Vertical layout | off | Stacked expansion panels; the `EXPAND_*` flags choose the panel opened by default. |
| `MAKE_ATTACHMENT_TAB_COMPULSORY` | Attachments | off | Attachment required before FINAL (client-side). |
| `HIDE_SERIAL_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_BATCH_ISSUE_DATE`, `HIDE_BATCH_EXPIRY_DATE` | Line editor tracking tabs and batch date fields | off | Hide the tab / field; the backend still validates whatever is stored (see Lifecycle). |
| `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_ISSUE_LINK`, `HIDE_DOC_LINK`, `HIDE_DELIVERY_DETAILS`, `HIDE_DELIVERY_INSTRUCTION`, `HIDE_DEPARTMENT` | Line editor tabs | off | Hide the tab; `SHOW_COSTING_DETAILS` permission re-shows Costing Details. |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT` | Department tab pickers (header and line) | off | Hide the dimension. |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `HIDE_LAST_PURCHASE_PRICE`, `HIDE_GROUP_DISCOUNT_PERCENTAGE`, `HIDE_LINE_ITEMS_GL_CODE` | Line Main Details quantity / price / tax fields | off | Hide the field for everyone; the matching seeded `SHOW_*` permission re-shows it for a role. |
| `HIDE_TOTAL_TXN_AMOUNT`, `HIDE_TOTAL_SST_VAT_GST_AMOUNT` | Totals on the Lines tab | off | Re-shown by `SHOW_TOTAL_TXN_AMOUNT` / `SHOW_TOTAL_SST_VAT_GST_AMOUNT`. |
| `ENABLE_EDITING_UNIT_PRICE_STD` | Unit Price STD | off | Makes the standard price editable (the shared control renders for every applet because of a truthy string literal in its `*ngIf`). |
| `DISABLE_EDITING_AMOUNT_TXN` | Transaction amount on lines | off | Locks the amount to the computed value. |
| `ENABLE_ITEM_NAME_MAX_LIMIT`, `ITEM_NAME_MAX_LIMIT`, `DISABLE_LINE_ITEM_NAME_EDIT` | Item Name on lines | off / empty | Character counter and limit; lock the name. |
| `ENABLE_MULTIPLE_KO` | KO For and line KO grids | off | Allows selecting lines from several source documents in one knock-off; otherwise the grid is single-document. |
| `EDIT_CONTRA_TXN_DATE` | Contra tab | off | Allows editing the contra transaction date. |
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY` (Default Selection, also personal) | New-document header | empty | Applied as Branch / Location / Company when a document is created (branch from the picker wins if one was chosen first). |
| `DEFAULT_DECIMAL_PRECISION` (Default Selection) | Unit price decimals on lines | 2 (`DEFAULTS.DECIMAL_PRECISION`) | Sets the decimal places and step of every price field. This is the "3 decimal places for unit price" request (intranet #4338). |
| `INTERNAL_PURCHASE_GRN_DETAILS_TAB_ORDER` (Default Selection) | Edit-form tab order | Search Document, Main Details, KO For, Account, Lines, Delivery Details, Payment, Department Hdr, TraceDocument, Contra, Doc Link, Export, Attachments, Status | Saved order applied to the edit form; new tabs are appended. |
| `PRINTABLE` (Printable Format Settings) | Default template | empty | Pre-selects the template on Export and bulk print; a Branch Settings → Printable Format default for the branch overrides it. |
| `ENABLE_CUSTOM_STATUS_HDR_1…5`, `NAME_CUSTOM_STATUS_HDR_n`, `LIST_CUSTOM_STATUS_HDR_n` (Custom Status) | Status tab | off | Adds up to five header-level custom status pickers. |

Read at runtime without a model declaration (set them through a gear or by API): `HIDE_KO_FOR_TAB`, `HIDE_MAIN_PAYMENT_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_MAIN_ARAP_TAB`, `EXPAND_PAYMENT`, `EXPAND_STATUS`, `HIDE_LISTING_BRANCH`, `HIDE_TRANSACTION_DATE` (listing columns), `SHOW_DRAFT_BUTTON` (opt-in listing button that returns FINAL documents to DRAFT; also a permission code), `HIDE_LINE_ITEM_PRICING` (Lines-tab price columns, paired with the `INTERNAL_PURCHASE_GRN_DISPLAY_PRICING` permission), `DISABLE_ADD_WHEN_KO` (blocks Search Item once a knock-off exists), `SHOW_ITEM_STOCK_BALANCE`, `DISABLE_ITEM_LISTING`, `HIDE_MULTI_DISCOUNT`, `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING`, `DISABLE_DEFAULT_SETTING_ADVANCE_SEARCH`, `FUZZY_SEARCH_COLUMNS`, `DEFAULT_STATUS`.

Read without any control for this applet code (declared and consumed, but gated out of the shared screen and on no gear): `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL` (sends `validate_serial_signum_zero` on FINAL — irrelevant here because the lines are signum +1 and always validated), `SERIAL_NUMBER_QTY_FOLLOW_BASIC_QTY`, `HIDE_CREDIT_LIMIT`, `HIDE_EXTERNAL_REMARKS`, `HIDE_FILE_EXPORT_MENU`, `ENABLE_FILTER_BY_TODAYS_TXN`, `DEFAULT_ORIENTATION`, `DEFAULT_DECIMAL_STEP` (derived from the precision), and the fifteen `MANDATORY_*` keys (`MANDATORY_QUOTATION / ORDER / DELIVERY_ORDER / INVOICE / OTHERS` and their `_DATE` twins, `MANDATORY_BIN_NUMBER`, `MANDATORY_SEGMENT / DIMENSION / PROFIT_CENTER / PROJECT`) that add `Validators.required` to the external-document and department fields.

Declared and rendered but never read (saved and ignored): `EXPAND_DELIVERY_TRIPS`, `EXPAND_MAIN_ARAP`, `EXPAND_POSTING`, and the 41 model-only keys (`DISALLOW_DUPLICATE_INVOICE`, `SHOW_VOID_BUTTON`, `DEFAULT_TOGGLE_COLUMN`, `HIDE_MAIN_DETAILS_*`, `ENABLE_ / INCLUDE_` dimension, SST and WHT flags, and the line-level custom status keys). The gears also carry `HIDE_REASON`, `SHOW_GL_DIMENSION`, `SHOW_SEGMENT`, `SHOW_PROFIT_CENTER`, `SHOW_PROJECT` as settings; the listing reads the last four as opt-in column settings *or* permissions.

### Document behaviour settings

- **Posting** is not configurable in the applet: FINAL is fixed at quantity +1 / amount −1 (see Lifecycle). The only FINAL-time flag the applet sends is `validate_serial_signum_zero` (from `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL`), which has no effect on a +1 document. `validate_stock_balance` defaults to true on the backend but only checks negative-signum lines.
- **Serial numbers before FINAL**: on every line save the applet calls `validateMultiSerialNumbers` with `txn_type: PURCHASE` and `server_doc_types: [INTERNAL_PURCHASE_GRN_STOCK_IN, INTERNAL_PURCHASE_INVOICE]`; serials already live in the company are flagged and the FINAL button is disabled while a line carries an invalid serial (`disableFinal()`). Batch lines must have batch quantities that add up to the line quantity.
- **Status flow options**: `SHOW_DRAFT_BUTTON` (setting or permission) exposes the FINAL → DRAFT action; `HIDE_GENDOC_*` hide FINAL / VOID / DISCARD; `SHOW_DOCUMENT_DELETE_BUTTON` on the applet's `APPLET_SETTINGS` extension exposes DELETE.
- **Printables**: Jasper templates from Printable Format Settings; default from Branch Settings → Printable Format, else `PRINTABLE`. The `PRINTABLE_FORMAT_WITH_NO_PRICE` permission restricts the Export picker to templates in the `no_price` category. Export offers **EXPORT AS PDF** only (CSV / DOCX / ZIP are commented out) and is disabled for VOID documents.
- **Workflow / approval**: none wired. Custom Status is a label, not a gate.
- **e-Invoice**: not applicable to this document type.

### Feature visibility / permissions

51 client-side permission definitions are seeded for `internalPurchaseGrnStockInApplet` in `bl_applet_client_side_perm_dfn` and 48 of them are checked in code: the `SHOW_*` counterparts of the listing columns (`SHOW_DOC_NO_TENANT / COMPANY / BRANCH`, `SHOW_CLIENT_DOC_TYPE`, `SHOW_CLIENT_DOC_1…5`, `SHOW_TRANSACTION_DATE`, `SHOW_ARAP_PNS / SETTLEMENT / DOC_OPEN / CONTRA / BAL`, `SHOW_AMOUNT_TXN_MAIN_LISTING`, `SHOW_DESCRIPTION`), the line price / quantity / tax columns (`SHOW_UNIT_PRICE_*`, `SHOW_UNIT_DISCOUNT*`, `SHOW_AMOUNT_*`, `SHOW_DISCOUNT_AMOUNT_EXCL_TAX`, `SHOW_QTY_BASE / UOM`, `SHOW_UOM_TO_BASE_RATIO`, `SHOW_TAX_CONFIG_SELECTION`, `SHOW_WHT_CONFIG_SELECTION`, `SHOW_LAST_PURCHASE_PRICE`, `SHOW_COSTING_DETAILS`, `SHOW_TOTAL_TXN_AMOUNT`, `SHOW_TOTAL_SST_VAT_GST_AMOUNT`), `SHOW_ACCOUNT_TAB_DETAILS`, `SHOW_EXPORT_TAB`, `SHOW_DRAFT_BUTTON`, `SHOW_INTERCOMPANY_PGRN_SCREEN` (the create form's intercompany Search tab), `ALLOW_TO_CREATE_EDIT_ACCOUNT` (create / edit suppliers from the picker), `PRINTABLE_FORMAT_WITH_NO_PRICE`, and `INTERNAL_PURCHASE_GRN_DISPLAY_PRICING` (unit price, tax, discount and amount columns on the Lines tab and the Line Items listing; OWNER / ADMIN rank passes automatically).

Seeded but never checked: `SHOW_FINAL_BUTTON`, `SHOW_DISABLE_EDITING_AMOUNT_TXN_SETTING`, `IPGRN_HIDE_TRACKING_ID_AND_PERMIT_NO`. Checked but **not seeded**: `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`, `SHOW_GENDOC_DISCARD_BUTTON` (the re-show pairs of the `HIDE_GENDOC_*` settings), `SHOW_LISTING_BRANCH`, `SHOW_QTY_MAIN_LISTING`, `SHOW_QUOTATION / ORDER / DELIVERY_ORDER / INVOICE / OTHERS`, `SHOW_GL_DIMENSION / SEGMENT / PROFIT_CENTER / PROJECT` — until they are seeded a tenant-wide hide of those items cannot be reopened per role.

Feature Visibility and Webhook are the shared screens from `blg-shared-utilities`; the applet adds nothing to them.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Company, Branch, Location | Owning company, branch and the store the goods are booked to (`guid_store`) | Yes (all three, `Validators.required`) | Branch fills Company and Currency; Location list is filtered by branch; defaults from Default Selection. |
| Delivery Branch, Delivery Location | Where the goods physically arrive | No | Default to Branch / Location; written to the header and copied to each knocked-off line. |
| Transaction Date | Document date | Defaults to today | Checked against locked fiscal periods on FINAL. |
| Purchaser | Responsible buyer (employee) | No | Auto-filled with `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`. |
| Credit Terms, Credit Limit | Supplier terms | No | Read from the supplier once selected. |
| Reference, Remarks, External Remarks, Description, Permit No, Tracking ID | Free text | No unless a `MANDATORY_*` key is set | Remarks has a character counter; `ENABLE_DUPLICATE_REFERENCE_CHECK` warns on duplicates. |
| External Quotation / Order / Delivery Order / Invoice / Others, each with a Date | Supplier's document numbers (`xtn_doc_ref_1…5`, `_date`) | No unless `MANDATORY_*` | Added in 2026 (intranet #4717, #4998); shown on the listing as columns. |
| Client Document Type, Client Doc 1…5 No | Tenant-defined numbering | No | Hidden by `HIDE_CLIENT_DOC_*`. |
| Currency, Base Currency, Currency Rate | Document currency | No | From the branch; rate locked by `CANNOT_EDIT_CURRENCY_RATE`. |
| Created By / Date, Modified By / Date | Audit fields | read-only | Hidden by `HIDE_CREATED_BY_DETAILS`. |

### Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity (Supplier) | Supplier entity | Yes (CREATE stays disabled without it) | Picked from Select Supplier; new suppliers can be created inline with `ALLOW_TO_CREATE_EDIT_ACCOUNT`. |
| Bill To / Ship To | Addresses | No | From the entity's address list. |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item | Item code / name | Yes | From Search Item, or copied by KO For Purchase Order / Requisition / Invoice (open-queue lines only). A knocked-off line writes a `bl_fi_generic_doc_link` row with `txn_type` `KO`. |
| Qty | Quantity received (`quantity_base`) | Yes | `Validators.required`, `min(1)`; default 1. |
| Unit price, discount, tax, WHT fields | Purchase cost | No | All `min(0)`; the line's `amount_txn` is what the inventory transaction and moving-average cost use, so a zero-price stock-in leaves the item's cost unestablished (intranet #5348). |
| Serial numbers | Per-unit serials | When the item is serialised and `optional_sn` is not set | Validated against the company on save and on FINAL (`BL_INV_SERIAL_NUMBER_HDR_OBJECT_SERIAL_NUMBER_ALREADY_EXISTS_FOR_COMPANY`); count must equal Qty. |
| Batch: batch no, issue date, expiry date, qty | Batch tracking | Yes on the Batch tab | Batch quantities must sum to Qty (client `disableFinal()`); date fields hidden by `HIDE_BATCH_ISSUE_DATE` / `HIDE_BATCH_EXPIRY_DATE`. |
| Bin: bin code, container measure, container qty, qty | Bin tracking | Yes on the Bin tab | Backend rejects zero / missing container values. |
| Delivery Details (per line) | Delivery branch and location for this line | No | Copied from the header; the backend books the inventory transaction to the line's `delivery_location_guid` first. |
| Department (segment, dimension, profit centre, project) | Analysis codes | No unless `MANDATORY_*` | Copied to the journal lines. |
| Costing Details, Pricing Details, Issue Link, Doc Link, Multi Discount | Auxiliary tabs | No | |

### Delivery Details, Payment, Contra

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Delivery Details tab | Per-line delivery type, shipping branch, shipping location, tracking ID grid | No | Location list is the branch's linked locations. |
| Payment lines | Settlement-method lines (`txn_type` `STL_MTHD`, written as `INTERNAL_RECEIPT_VOUCHER` / `INTERNAL_PAYMENT_VOUCHER` lines) | No | Sales-side component reused on a purchase document; the amount guard compares with `amount_open_balance`. Settle the supplier on the PI No Stock In / Payment Voucher instead. |
| Contra | `bl_fi_generic_doc_arap_contra` rows against other FINAL documents | No | Transaction date editable with `EDIT_CONTRA_TXN_DATE`. |

## Lifecycle and posting

Statuses: DRAFT (new documents; SAVE keeps them here) → **FINAL** → **VOID**. DRAFT documents can be **DISCARDED** (listing or edit form, confirmation dialog) and FINAL documents can be returned to **DRAFT** with the opt-in DRAFT button. FINAL is sent as `{ posting_status: "FINAL" }` to `PUT …/update-posting-status/{guid}` (with a 1-second client delay and a serial pre-check); a second FINAL is refused with HTTP 403 "Generic Document has already been posted to FINAL" (`GenericDocumentService.updatePostingStatusWithChecks`). VOID, DRAFT and DISCARD go through the generic-document void / draft / discard endpoints; the backend refuses VOID and DRAFT with `GENERIC_DOCUMENT_HAS_TARGET_LINKS` ("cannot be changed to VOID because it has already been linked with the following documents: PURINVNSI-…") when a downstream document has knocked this one off (`GenericDocumentController` ~L2940). DELETE (edit form, non-FINAL only, two clicks) calls the DELETE endpoint; the FINAL guard is client-side only. **Search Purchase GRN** clones a FINAL GRN Stock In into a new TEMP document (polls up to three times for the clone).

Posting proof block:

| Fact | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_PURCHASE_GRN_STOCK_IN`, short code `PURGRNSI` | `InternalPurchaseGrnStockInDataConsistencyObject`, `GenericDocServerDocTypeEnum` L62 |
| Amount signum | **−1** (checked on create and update: `checkAmountSignum`) | DCO `specificValidationForCreation/Update`; applet `AppletConstants.amount_signum = -1` |
| Quantity signum | **+1** — `fillQuantitySignumAndAmountSignumForLine` overwrites whatever the client sends | DCO `specificFillMissingDataForLineCreation/Update`; `AppletConstants.quantity_signum = 1` |
| Dr/Cr equation | For each `PNS` line: amount signum −1 × positive amount → **Dr Inventory Not Invoiced** (`amount_net`); **Dr Input Tax** for `amount_tax_gst`; then one header line **Cr Creditor Not Invoiced** for the sum. Purchase discount / return sub-ledgers exist for negative lines. | `JournalPostingTypeHandler` L64–71 (`PNS_ENTITY → CREDITOR_NOT_INVOICED`, `PNS → INVENTORY_NOT_INVOICED`, `PNS_TAX → INPUT_TAX`, `PNS_DISCOUNT`, `PNS_RETURN`); `JournalPostingService` L96–130, L235–275, L325–360 |
| GL precedence | **header GL → item-company link (`INVENTORY_NOT_INVOICED` txn code) → company default `INVENTORY_NOT_INVOICED`.** The line's own GL code is *skipped* for this type (`isConsignmentStockIn` is true for `INTERNAL_PURCHASE_GRN_STOCK_IN`, L64–66, L138). The creditor line always uses the company default `CREDITOR_NOT_INVOICED` (`resolveArap` returns the handler default when `isSkip` is true, L1561–1569) and throws `MISSING_DEFAULT_GL_CODE: CREDITOR_NOT_INVOICED` if it is missing (L339). | `JournalPostingService` |
| Stock processor | `InventoryTransactionLineProcessorService.createInventoryTxnFromGenericDoc` creates a `bl_inv_txn_line` per `PNS` line with quantity signum ≠ 0; location = line `delivery_location_guid` → line `guid_store` → header `guid_store` → branch default location (`InventoryTransactionLineFactory` L49–52). The type is in `StockBalanceHelper.MA_WA_SERVER_DOC_TYPES` (L41–42), so the line's `amount_txn` is added to the company MA cost amount and the unit MA cost is recomputed. | `InventoryTransactionLineProcessorService` L37–70; `StockBalanceHelper` L165–170 |
| Open queue / auto-convert | `GenericDocLineOpenQueueProcessor` opens the lines for `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` when the company's Knock Off Configuration has that row; `GenericDocumentConverterFactory` maps the pair to `PurchaseGRNStockInToPurchaseInvoiceNoInStockConverter`, which copies the document, sets amount signum −1, takes posting status from `doc_2_posting_status` (default FINAL) and enqueues it. | `GenericDocumentConverterFactory` L21; converter L40–70 |
| What VOID reverses | `VoidGenericDocumentPrimaryProcessor` fans out to the subscribed void processors: `VOID_INVENTORY_TRANSACTION_LINE_PROCESSOR` writes negated inventory lines with `txn_code = VOID`, sets `posting_inventory = VOID`, unlocks the document's serial numbers and re-queues the stock-balance refresh; `VOID_JOURNAL_POSTING_PROCESSOR` posts the reverse journal (`createJournalGenDocReversePosting`); `VOID_KNOCK_OFF_PROCESSOR` marks this document's open-queue rows DELETED; tax and ARAP contra processors reverse their entries. Stock and cost are therefore reversed, but the MA cost is recomputed on the reversal, not restored to the pre-receipt value. | `VoidInventoryTransactionLineProcessor` L55–62; `VoidJournalPostingProcessor` L65; `VoidKnockOffProcessor` L88 |

What FINAL actually does (`GenericDocumentService.updatePostingStatus`, FINAL branch):

1. `validateGenericDocumentOnFinal`: forex rate check; serial numbers — duplicates within the document (`GENERIC_DOC_LINE_SERIAL_NUMBER_ID_IS_DUPLICATED`), count equal to `quantity_base` (`GENERIC_DOC_LINE_QTY_BASE_AND_SERIAL_NUMBER_QTY_DOES_NOT_MATCH`), and because the movement signum is +1, every serial must **not** already exist in the company (`BL_INV_SERIAL_NUMBER_HDR_OBJECT_SERIAL_NUMBER_ALREADY_EXISTS_FOR_COMPANY`, L1885–1888); bin JSON checks; `FISCAL_PERIOD_LOCKED` when the transaction date is inside a `LOCK_ALL` / `LOCK_TXN` period (L1695, intranet #1616). Stock-balance checks apply only to negative lines.
2. Update the header, assign running numbers, set `date_finalized`.
3. Enqueue `GenericDocumentPrimaryProcessor`, which applies the company's `posting_final_json` include / exclude list and fans out to the inventory, journal, open-queue, tax and webhook processors. The inventory job marks `posting_inventory = POSTED` and pushes a current-stock-balance refresh; the journal job posts the entries above and marks `posting_journal`; the open-queue job records the GRN Stock In lines for the PI No Stock In and, if `GENERIC_DOCUMENT_OPEN_AUTO_CONVERT_QUEUE_PROCESSOR` is subscribed, creates that invoice.

## Related applets

- [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) — the invoice that follows this document (quantity 0 / amount −1); on FINAL it moves the liability from *Creditor Not Invoiced* / *Inventory Not Invoiced* to the trade creditor, but only when it carries a link to a GRN Stock In (`JournalPostingService` L470–540).
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the non-posting receipt for tenants that book stock on the Purchase Invoice; the intercompany *Search* tab in this applet actually creates that document type, not a GRN Stock In (see Troubleshooting).
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the other stock-moving purchase document (+1 / −1); never pair it with a GRN Stock In for the same delivery.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/) — knock-off sources; Stock Availability counts PO → GRN Stock In open queue rows as incoming quantity.
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — takes received goods back out of stock and debits the supplier; [Purchase GIN (Internal)](/applets/purchase-workflow/internal-purchase-gin-applet/) only documents the dispatch.
- [Purchase GRN Supplier Access (Internal)](/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet/), [Supplier Delivery Order](/applets/purchase-workflow/supplier-delivery-order-applet/) — supplier-facing counterparts. Note the registry's `documentation_url` for this applet currently points at the supplier-access page.
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) — where the posted quantities and costs are visible and corrected.
- [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) — master data and default GL codes the posting depends on.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Journal job fails with `MISSING_DEFAULT_GL_CODE: CREDITOR_NOT_INVOICED` after FINAL | The company has no default GL code for `CREDITOR_NOT_INVOICED`; the document is already FINAL and stock is posted, only the journal is missing. | Add the company default GL code, then re-post the journal (`createJournalGenDocRePosting` / journal re-post tool). |
| Journal job fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` | No `INVENTORY_NOT_INVOICED` (or `INPUT_TAX`) GL could be resolved for one or more lines, so those lines were silently omitted and only the creditor line remained. Line-level GL codes are ignored for this document type. | Set the header GL, the item-company link with txn code `INVENTORY_NOT_INVOICED`, or the company default; re-post. |
| Stock went to the wrong location, or lines of one document landed in different locations (intranet #3856) | Each line is booked to its own `delivery_location_guid`, then `guid_store`, then the header location, then the branch default. Lines knocked off from a PO carry the PO line's delivery location; lines from Search Item carry the header location at the time they were added. | Check the per-line Delivery Details before FINAL; correct with a stock transfer or Stock Adjustment after. |
| Stock counted twice (once on GRN Stock In, once on Purchase Invoice) — "double entry" (intranet #3940) | Both documents are +1 stock documents. The Knock Off Configuration routed the GRN Stock In into an ordinary Purchase Invoice, or the invoice was raised separately. | Use only the GRN Stock In → PI No Stock In pair (quantity 0) for companies that receive with this applet; void the duplicate. |
| Sales report shows 100 % gross profit / zero cost for items received here (intranet #5348, #5260) | The stock-in lines carried `amount_txn = 0`, so nothing was added to the company moving-average cost. | Enter the purchase price on the GRN Stock In lines (or the landed cost); correct existing items with Reset MA / stock adjustment after review. |
| PO still shows as open in Stock Availability after it was knocked off to a GRN Stock In (intranet #3939, open) | The queue row `INTERNAL_PURCHASE_ORDER → INTERNAL_PURCHASE_GRN_STOCK_IN` was not updated. | Run the queue repair / `data-fix-missing-queue`; check the Knock Off Configuration row is enabled. |
| KO For lists no purchase orders | The PO is not FINAL, is fully received, or the company has no enabled `INTERNAL_PURCHASE_ORDER → INTERNAL_PURCHASE_GRN_STOCK_IN` Knock Off Configuration row; the search also needs at least three characters and read permission on the PO's branch or delivery branch. | Fix the configuration; the KO grid reads the open queue, not the PO listing. |
| The line editor's KO For Purchase Requisition / Invoice sub-tabs are missing | Those sub-tabs render only when the company's Knock Off Configuration has an enabled `LINE` flow row for `INTERNAL_PURCHASE_REQUISITION` / `INTERNAL_PURCHASE_INVOICE`. | Add the row. |
| FINAL fails with a serial number "already exists for company" error | A serial on the document is already in stock (or was received on another draft); +1 documents always run this check. | Remove or correct the serial; check for duplicate migration imports (intranet #5389). |
| FINAL button greyed on the edit form | A serialised line has an invalid serial, or a batch line's batch quantities do not add up to the line quantity (`disableFinal()`); on the listing, FINAL needs every selected row to be DRAFT with `amount_net > 0`. | Fix the line; a zero-amount document can be finalised from the edit form only. |
| FINAL fails with "The selected date falls within a locked fiscal period" | `FISCAL_PERIOD_LOCKED` (intranet #1616). | Change the transaction date or reopen the period. |
| VOID (or DRAFT) refused: "cannot be changed to VOID because it has already been linked with the following documents: PURINVNSI-…" | `GENERIC_DOCUMENT_HAS_TARGET_LINKS`: a PI No Stock In (or other document) has knocked this GRN off. | Void the downstream document first. |
| Line Items menu shows "No Data" (intranet #3330, open) | Known listing issue; the query is by line server document type. | Reload; report with the tenant if it persists. |
| Ordinary users see no prices on the Lines tab or Line Items listing | `INTERNAL_PURCHASE_GRN_DISPLAY_PRICING` is not granted (OWNER / ADMIN rank passes automatically); `HIDE_LINE_ITEM_PRICING` hides the same columns tenant-wide (intranet #3919). | Grant the permission to the buyer role. |
| Unit price cannot take three decimals (intranet #4338) | `DEFAULT_DECIMAL_PRECISION` in Default Selection is 2. | Change it there; it applies to every price field. |
| Document created from the intercompany Search tab does not move stock | `IntercompanyController` creates an `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` (0/0) from the sales invoice, not a GRN Stock In; it appears in the [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) applet. | Receive intercompany deliveries with an ordinary PO knock-off, or use the GRN + Purchase Invoice pair for that company. |
| A `HIDE_GENDOC_*` button cannot be re-enabled for one role | The `SHOW_GENDOC_FINAL / VOID / DISCARD_BUTTON` permission codes are checked but not seeded for this applet. | Seed the codes in the client-side permission listing, then grant. |
| Application Settings shows no "Attachment tab compulsory" control | The shared screen gates it on the misspelt code `internalPurchaseGRNStcokInApplet`. | Use the edit-form gear (`MAKE_ATTACHMENT_TAB_COMPULSORY` is listed there). |
| Labels are English only | Internationalisation is not implemented (intranet #5067, open). | None yet. |

## Related documentation

- [Purchasing module](/modules/purchasing/)
- [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) — the invoice leg of this pair
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the non-posting alternative
- [Standard procurement workflow](/guides/purchasing-guides/standard-procurement-workflow/) — where receiving sits in the PO → GRN → invoice flow
