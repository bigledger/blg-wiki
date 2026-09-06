---
title: "Purchase GIN (Internal)"
description: "Reference for the Purchase GIN (Internal) applet: the purchase-side Goods Issue Note that records what left your premises toward a supplier without moving stock or posting a journal, with its screens, every configuration switch, fields, posting facts and known failure modes."
applet_code: "internalPurchaseGINApplet"
applet_repo: "blg-applet-wavelet-internal-purchase-gin-applet"
modules: [purchasing]
related_applets:
  - internal-purchase-return-applet
  - internal-purchase-grn-applet
  - internal-purchase-grn-stock-in-applet
  - internal-purchase-order-applet
  - internal-purchase-requisition-applet
  - internal-purchase-quotation-applet
  - internal-purchase-invoice-applet
  - internal-delivery-order-applet
  - internal-sales-order-applet
  - internal-jobsheet-applet
  - internal-sales-gin-applet
  - internal-consignment-gin-applet
  - stock-adjustment-applet
  - supplier-applet-1
  - organisation-applet
  - inv-item-maintenance-applet
  - doc-item-maintenance-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/app.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/main.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/state-controllers/printable-format-controller/store/effects/printable-format.effects.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-listing/internal-purchase-gin-listing.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-listing/internal-purchase-gin-listing.component.html
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-edit/internal-purchase-gin-edit.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-edit/internal-purchase-gin-edit.component.html
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-edit/export/export.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/add-line-item/item-details/item-details.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-container.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/settings/applet-settings-toggle/applet-settings-toggle.component.ts
    - blg-shared-utilities/utilities/ag-grid-custom/ag-grid-custom.component.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - akaun_master.bl_applet_client_side_perm_dfn (applet code internalPurchaseGINApplet, 22 rows)
  fields:
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/add-line-item/add-line-item.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/add-line-item/batch-number/batch-number.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/add-line-item/bin-number/bin-number.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/line-item/line-item-create/line-item-create.component.html
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/line-item/line-item-create/purchase-order-item/line-purchase-order-item-listing.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/payment/add-payment/add-payment.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/contra/add-contra/add-contra.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/contra/select-document/contra-select-document.component.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/state-controllers/draft-controller/store/effects/payment.effects.ts
  lifecycle:
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/state-controllers/internal-purchase-gin-controller/store/effects/internal-purchase-gin.effects.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/internal-purchase-goods-issued-notes.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/shared/base-api-template-service.model.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseGoodsIssuedNoteDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/journalPosting/JournalPostingJobProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/InventoryTransactionLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
  troubleshooting:
    - gh:bigledger/blg-intranet#1616
    - gh:bigledger/blg-intranet#1089
    - gh:bigledger/blg-intranet#5429
    - gh:bigledger/blg-intranet#5406
    - gh:bigledger/blg-intranet#5065
    - gh:bigledger/blg-wiki#78
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
tags:
- purchase-management
- goods-issue-note
- inventory-tracking
- warehouse-operations
- procurement-management
weight: 170
date: 2026-04-06
lastmod: 2026-09-05
draft: false
---

## Overview

The **Purchase GIN (Internal)** applet creates and finalises **Goods Issue Notes** on the purchase side: a record that goods (returns to a supplier, warranty send-backs, samples going out for evaluation) left your premises, addressed to a supplier entity. Warehouse or purchasing staff open it after a Purchase Order, GRN or Purchase Invoice exists and before the supplier's credit note or replacement arrives.

Read this before anything else: in the backend the Purchase GIN is a **zero-movement, zero-value document**. Its server document type `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE` (short code `PURGIN`) carries quantity signum 0 and amount signum 0, so FINAL **does not reduce stock, does not touch Moving Average cost and does not post a journal**. It is a traceable paper trail, linked line-by-line to the source document. If the goods must actually leave stock and the supplier's account must be debited, use [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) (quantity signum −1, amount signum +1) instead, or a [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) for the physical movement alone.

## Where it fits

Module: [Purchasing](/modules/purchasing/). The GIN sits between receiving and settlement, but it moves neither stock nor money.

| Direction | Document | Relationship to the Purchase GIN |
|---|---|---|
| Upstream (source pickers) | [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Requisition](/applets/purchase-workflow/internal-purchase-requisition-applet/), [Purchase Quotation](/applets/purchase-workflow/internal-purchase-quotation-applet/), [Purchase Invoice](/applets/finance/internal-purchase-invoice-applet/), [Purchase Return](/applets/purchase-workflow/internal-purchase-return-applet/), [Delivery Order](/applets/sales-workflow/internal-delivery-order-applet/), [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Jobsheet](/applets/sales-workflow/internal-jobsheet-applet/) | The Lines tab can copy a line from any of these eight document types and writes a `bl_fi_generic_doc_link` row (`txn_type` `IPO_IPGIN`, `IPI_IPGIN`, `IPR_IPGIN`, `IPRO_IPGIN`, `IPQO_IPGIN`, `IODO_IPGIN`, `ISO_IPGIN`, `IJS_IPGIN`) so the source line's open quantity is reduced in the picker. |
| Sibling (stock actually moves) | [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) | The return is the document that takes goods out of stock and debits the supplier; the GIN only records the dispatch. |
| Sibling (inbound counterpart) | [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), [Purchase GRN Stock In](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) | GRN records receipt; GRN Stock In is the receiving document that moves stock and feeds MA cost. |
| Same family, other side | [Sales GIN (Internal)](/applets/sales-workflow/internal-sales-gin-applet/), [Consignment GIN (Internal)](/applets/inventory-workflow/internal-consignment-gin-applet/) | Sales GIN is also signum 0/0; Consignment GIN (`INTERNAL_PURCHASE_CONSIGNMENT_GIN`) does move stock. |
| Downstream | Supplier credit note, replacement GRN | Not linked by the applet; reference the GIN number manually. |

## Screens and menus

The applet has two menu items, **Internal Purchase GIN** (the document listing) and **Line Items** (every GIN line across documents, searchable by document number, item code, item name and quantity). `HIDE_LINE_ITEMS_MENU` removes the second item.

**Listing.** Columns: Purchase GIN No, Posting Status, Branch, Supplier Name, Purchaser, Updated Date, Created Date, Transaction Date, Created by. Toolbar: Create (+), search, advanced search, rows-per-page, a grid/pivot toggle, an inline settings gear, and a **FINAL** button that finalises every selected non-FINAL row. There is no VOID or DISCARD action anywhere in this applet's code.

**Create form** tabs: Main Details, Account (Entity Details, Bill To, Ship To), Lines, Payment (hidden by `HIDE_PAYMENT_TAB`), Department Hdr (hidden by `HIDE_DEPARTMENT_HDR_TAB`). The **CREATE** button stays disabled until Main Details is valid, at least one line exists and the supplier form is valid.

**Edit form** (opened by clicking a listing row) shows the same tabs plus Contra, Doc Link, Attachments and Export, with RESET, FINAL (hidden by `HIDE_FINAL_BUTTON`), SAVE and, for non-FINAL documents, a two-click DELETE. The tab order is configurable (Default Selection, "Details Panel Ordering") and the same panels can be rendered as vertical expansion panels (`VERTICAL_ORIENTATION`).

{{< figure src="/images/internal-purchase-gin-applet/edit-forms-from-main-listing.png" alt="Edit Internal Purchase GIN opened from the listing, Account tab showing a test supplier" caption="Edit form opened from the listing; Account tab, Entity Details sub-tab (staging tenant, test data)." >}}

**Line editor** (Add / Edit Line Item): Item Details (Main Details, Delivery Instruction, Department, Doc Link, Delivery Details sub-tabs), Pricing Details, Issue Link, plus Serial Number / Batch Number / Bin Number tabs that appear according to the item's sub-item type, and Costing Details.

{{< figure src="/images/internal-purchase-gin-applet/edit-line-items.png" alt="Line Items listing with the Edit Line Item panel open" caption="Line Items menu: every GIN line in the tenant, with the line editor on the right (staging tenant, test data)." >}}

**Settings** menu (System Configuration): Application Settings, Default Selection, Printable Format Settings; the routes also expose Webhook, Feature Visibility and the five permission listings from `blg-shared-utilities`. **Personalization**: Default Selection (personal) and Sidebar.

## Configuration

### Before you can use it

- **Company and branch** with a main location, in [Organisation](/applets/master-data/organisation-applet/). Branch, company and location are required on every GIN; picking a branch fills company and currency from the branch record.
- **Supplier entities** in [Supplier](/applets/master-data/supplier-applet-1/). Entity ID is required; credit terms are offered from the entity's `doc_entity_hdr_json.creditTerms` list and the field is disabled until a supplier with terms is chosen.
- **Items** in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) / [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/). Serial, batch and bin tabs follow the item's `sub_item_type`.
- **Running numbers** for `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE` are assigned by the backend on FINAL (`GenericDocRunningNumberService`), so the document-numbering configuration for this server document type must exist before the first FINAL.
- **Not required**: default GL codes, tax codes, cashbooks and settlement methods. The GIN posts nothing (see Lifecycle), so none of the `MISSING_DEFAULT_GL_CODE` / `MISSING_CASHBOOK` prerequisites of the invoice family apply.
- **Backend permissions**: `TNT_API_DOC_INTERNAL_PURCHASE_GOODS_ISSUED_NOTE_CREATE / READ / UPDATE / DELETE_TGT_GUID` (`TntErpPermissions.java`). FINAL uses the UPDATE permission.

### Applet settings

Where settings live (read from `app.routing.ts` and `menu-items.ts`, applet @57f86f1, shared utilities @af523eb):

| Screen | Component | What it holds |
|---|---|---|
| Settings → Application Settings (`field-settings`) | shared `FieldConfigurationComponent` (blg-shared-utilities) | The HIDE_* / ENABLE_* toggles below. For the registry code `internalPurchaseGINApplet`, 125 of the 172 controls that this applet's model declares are rendered; 47 are not, because the shared screen keys its tab-hide, KO-for, external-document and menu sections by applet code and this code is in none of its lists (METHOD.md §10). |
| Inline gear (`app-applet-settings-toggle`) | shared component embedded on 31 screens with explicit key lists (intranet #5380, #5406, #5429) | The same master settings, plus per-user personal overrides. Keys that are gated out of the shared screen but listed on a gear are still editable there. |
| Settings → Default Selection | applet-local `DefaultSettingsComponent` | `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `INTERNAL_PURCHASE_GIN_DETAILS_PANEL_ORDER` (drag-and-drop tab order; intranet #1089). |
| Settings → Printable Format Settings | applet-local listing with "set default" | `PRINTABLE` (default printable format GUID used by Export). |
| Personalization → Default Selection | applet-local `PersonalDefaultSettingsComponent` | Renders Default Branch / Default Location but its container is never populated and the SAVE output has no subscriber: choosing a branch throws in the console and nothing is saved. Use the gear's personal mode instead. |

Master settings are saved by users of rank OWNER or ADMIN (the gear's master mode is gated on `selectUserRank`; the Application Settings screen is reached through the Settings menu). Personal mode on the gear is available to every user and stores only `true` overrides. Settings are read as `{...master, ...personal}`.

The table lists every key that passes all four proofs (declared in `applet-settings.model.ts`, rendered on the shared screen or a gear, persisted by `saveMasterSettingsInit`, and read by this applet). All are off / empty by default: the shared screen patches the stored value or `false`, and the document code treats an absent key as "not hidden".

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DEFAULT_TRANSACTION_DATE` | Listing date filter preset (`1_day`, `1_week`, `1_month`) | empty (no filter) | Listing opens pre-filtered to the last day/week/month. |
| `DISABLE_GEN_DOC_LISTING` | Locks the listing | off | Hides the Create button and ignores row clicks; the listing becomes read-only. |
| `HIDE_GENDOC_FINAL_BUTTON` | FINAL button on the listing | off | Removes the multi-select FINAL button; the edit-form FINAL button is separate. Re-openable per role by the `SHOW_GENDOC_FINAL_BUTTON` client-side permission (not seeded, see below). |
| `HIDE_FINAL_BUTTON` | FINAL button on the edit form | off | Documents can then only be finalised from the listing. |
| `ENABLE_PRINT_FINAL_GEN_DOC_ONLY` | Export tab | off | EXPORT AS PDF appears only when posting status is FINAL. |
| `HIDE_EXPORT_AS_PDF_BUTTON` | Export tab | off | Removes the only export button (CSV/DOCX/ZIP are commented out). |
| `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Purchaser field | off | On a new document the purchaser is looked up from the logged-in user's employee record. |
| `HIDE_SALES_AGENT` | Purchaser field (labelled "Sales Agent/Purchaser" on the shared screen) | off | Hides the field **and clears its required validator**; without it Purchaser is mandatory. |
| `MANDATORY_REMARKS_FIELD` | Remarks | off | Makes Remarks required on Main Details. |
| `HIDE_REMARKS`, `HIDE_REFERENCE`, `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID`, `HIDE_CREDIT_TERMS`, `HIDE_MAIN_DETAILS_TRANSACTION_DATE` | Main Details fields | off | Hide the named field. `HIDE_REFERENCE`, `HIDE_REMARKS`, `HIDE_CREDIT_TERMS` and `HIDE_MAIN_DETAILS_TRANSACTION_DATE` are gated out of the shared screen for this applet code and are reachable only through the Main Details gear. |
| `HIDE_BILL_TO_TAB`, `HIDE_SHIP_TO_TAB` | Account sub-tabs | off | Hide the billing / shipping address sub-tab. |
| `HIDE_PAYMENT_TAB` | Create form | off | Hides the Payment tab on create (gear only; the shared control is PO-only). |
| `HIDE_DEPARTMENT_HDR_TAB` | Create and edit forms | off | Hides the header-level Department tab (gear only). |
| `HIDE_MAIN_CONTRA_TAB`, `HIDE_CONTRA_TAB` | Edit form | off | Either key hides the Contra tab. |
| `HIDE_DOC_LINK_FROM`, `HIDE_DOC_LINK_TO` | Doc Link tab (header and line) | off | Hide the "from" / "to" halves (gear only). |
| `HIDE_COSTING_DETAILS`, `HIDE_DELIVERY_DETAILS`, `SHOW_DELIVERY_DETAILS` | Line editor tabs | off | Costing Details tab hidden; Delivery Details hidden unless `SHOW_DELIVERY_DETAILS` forces it back (`!HIDE || SHOW`). |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT` | Department tab (header and line) and line listing | off | Hide the dimension column and picker. |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | Line Main Details | off | Hide quantity fields. |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | Line Main Details price / tax fields | off | Hide the field for everyone; the matching `SHOW_*` client-side permission (seeded for this applet) shows it again for a role. |
| `HIDE_LINE_ITEM_DETAILS_REMARKS`, `HIDE_LINE_ITEM_LISTING_UOM`, `HIDE_LINE_ITEM_LISTING_TXN_AMOUNT` | Line remarks; Lines tab and Line Items listing columns | off | Hide the field / column (gear only for this applet code). |
| `VERTICAL_ORIENTATION`, `EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_PAYMENT_TAB`, `EXPAND_DEPARTMENT_HDR`, `EXPAND_MAIN_CONTRA`, `EXPAND_DOC_LINK`, `EXPAND_ATTACHMENT`, `EXPAND_EXPORT` | Vertical UI | off | Render the edit form as stacked expansion panels; the first `EXPAND_*` that is true is the panel opened by default. |
| `INTERNAL_PURCHASE_GIN_DETAILS_PANEL_ORDER` | Tab / panel order (Default Selection) | Main Details, Account, Lines, Payment, Department Hdr, Contra, Doc Link, Attachments, Export | Saved order is applied to the edit form; new panels are appended. |
| `PRINTABLE` | Default printable format (Printable Format Settings) | empty | Pre-selects the template on the Export tab; the user can still pick another. |

Read without a control (declared and consumed, but no shared or gear control exists for this applet code): `HIDE_LINE_ITEMS_MENU` (removes the Line Items menu; the shared toggle is rendered only for the delivery-order family), `DEFAULT_ORIENTATION` and `DEFAULT_TOGGLE_COLUMN` (column layout of the view-column container). They can be set only by another applet sharing the same settings store or by API.

Saved but never applied: `DEFAULT_BRANCH` and `DEFAULT_LOCATION` from Default Selection are persisted and the shared session effect loads the branch, but no component in this applet reads them, so a new GIN opens with an empty Branch. `DEFAULT_COMPANY` is patched into a form that has no such control and is never saved.

Dead toggles: the gears also list 31 keys that are neither declared in the model nor read anywhere in this applet (for example `HIDE_PO_LINE_WITH_GRN_KO_LISTING`, `SHOW_PO_FREE_GIFT_MENU`, `HIDE_EAN_CODE`, `HIDE_ETA`, `ENABLE_EDIT_PAYMENT_DATE`, the `MANDATORY_*` external-document keys). Flipping them changes nothing here. Likewise the 78 shared-screen toggles that this applet declares but never reads (`HIDE_GENDOC_SAVE_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_SERIAL_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_ENTITY_DETAILS_*`, `HIDE_CLIENT_DOC_*`, `SORT_ORDER`, `DEFAULT_POSTING_STATUS`, and so on) are saved and ignored.

### Document behaviour settings

- **Posting behaviour** is not configurable in the applet: FINAL is a fixed 0/0 document (see Lifecycle). `FINAL_STATUS_GUID`, `ENABLE_SERIAL_NUMBER_VALIDATION_FINAL`, `VALIDATE_STOCK_ON_FINALIZE` and the workflow-status keys are not read by this applet.
- **Printables**: Printable Format Settings manages Jasper templates for the applet; Export calls `POST …/internal-purchase-goods-issued-notes/print-jasper-pdf/{guid}` with the selected template. `ENABLE_PRINT_FINAL_GEN_DOC_ONLY` and `HIDE_EXPORT_AS_PDF_BUTTON` are the only switches.
- **Workflow / approval**: none wired. `HIDE_WORKFLOW_STATUS` / `HIDE_WORKFLOW_RESOLUTION` are rendered on the shared screen but never read.
- **e-Invoice**: not applicable; the backend copies the entity's `skip_einvoice` flag on FINAL but no LHDN submission exists for this type.

### Feature visibility / permissions

Client-side permission definitions seeded for `internalPurchaseGINApplet` in `bl_applet_client_side_perm_dfn` (22 rows): `SHOW_COSTING_DETAILS`, `SHOW_LAST_PURCHASE_PRICE` and the twenty `SHOW_*` price / quantity / tax column codes matching the `HIDE_UNIT_PRICE_*`, `HIDE_QTY_*`, `HIDE_AMOUNT_*`, `HIDE_UNIT_DISCOUNT*`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_TAX_CONFIG_SELECTION` and `HIDE_WHT_CONFIG_SELECTION` settings. The line editor checks each of these by `perm_code` and shows the field when the role has it, even if the tenant setting hides it.

Checked in code but **not seeded**: `INTERNAL_PURCHASE_GIN_DISPLAY_PRICING` (the Lines tab and Line Items listing hide unit price and amount columns for users without it; OWNER / ADMIN rank passes `ClientSidePermissionChecker` regardless, so ordinary users see no prices until the code is seeded and granted) and `SHOW_GENDOC_FINAL_BUTTON` (pair of `HIDE_GENDOC_FINAL_BUTTON`). Seeded but never checked: `SHOW_LAST_PURCHASE_PRICE`.

Feature Visibility and Webhook are the shared screens from `blg-shared-utilities`; the applet adds nothing to them.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Branch | Issuing branch | Yes | Selecting a branch sets Company (`comp_guid`) and Currency (`ccy_code`) from the branch. |
| Company | Owning company | Yes | Filled from the branch; hidden field. |
| Location | Issuing store / location | Yes | Location list is filtered by the branch. |
| Purchaser | Responsible buyer | Yes unless `HIDE_SALES_AGENT` | Auto-filled from the employee record when `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` is on. |
| Transaction Date | Document date | No (defaults to today) | Editable; on FINAL the backend checks it against locked fiscal periods. |
| Credit Terms | Supplier terms | Yes when a supplier with terms is selected | Disabled (and excluded from validation) until the Account tab has a supplier with a `creditTerms` list. |
| Reference, Remarks, Permit No, Tracking ID | Free text | Remarks only when `MANDATORY_REMARKS_FIELD` | Remarks shows a character counter. |
| Currency | Document currency | No | Copied from the branch; disabled once FINAL. |

### Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity ID | Supplier | Yes (`Validators.required`) | Picked from the Select Supplier listing; Name, Status, Type, Identity Type, ID Number, Currency, GL Code, Description, Email, Phone are shown read-only from the entity. |
| Bill To / Ship To | Addresses | No | Chosen from the entity's address list. |

### Lines

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item | Item code / name | Yes | From Search Item, or copied from one of the eight source-document tabs (Sales Order, Jobsheet, Delivery Order, Purchase Order, Purchase Requisition, Purchase Quotation, Purchase Invoice, Purchase Return). A copied line creates a doc link with `quantity_signum` −1 and `quantity_contra` = line quantity; the picker shows `open_qty` = source quantity plus the sum of existing `*_IPGIN` links. |
| Qty | Quantity issued | Yes | `Validators.min(1)`; default 1. |
| Unit price / discount / amount fields | Pricing | No | All `min(0)`; defaults 0.00. The header totals stay at 0.00 MYR because every line is saved with amount signum 0. |
| Remarks | Line remarks | When `MANDATORY_REMARKS_FIELD` | |
| Serial numbers | Per-unit serials | No (client) | Recorded in `serial_no.serialNumbers`; see Lifecycle for what the backend checks. |
| Batch: batch no, issue date, expiry date, qty | Batch tracking | Yes on the Batch tab | All four `Validators.required`. |
| Bin: bin code, container measure, container qty, qty | Bin tracking | Yes on the Bin tab | All four `Validators.required`; the backend also rejects zero or missing container values (`BIN_QTY_INVALID`, `BIN_CONTAINER_*_INVALID`). |
| Department (segment, dimension, profit centre, project) | Analysis codes | No | Hidden per `HIDE_*` setting. |
| Delivery Instruction | Requested delivery date | No | Stored as a `REQUESTED_DELIVERY_DATE` document extension. |

### Payment and Contra

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Payment lines | Settlement-method lines (`txn_type` `STL_MTHD`) | No | Written as `INTERNAL_RECEIPT_VOUCHER` lines (or `INTERNAL_PAYMENT_VOUCHER` for `CASH_BACK`) on this purchase document; the add guard compares the amount with `hdr.amount_open_balance`. Because the backend forces amount signum 0 on every line, these lines have no accounting effect. Record supplier settlement on the Purchase Invoice / Payment Voucher instead. |
| Contra | `bl_fi_generic_doc_arap_contra` rows | No | The Select Document screen offers every FINAL document type present in the tenant; amount is limited to the chosen document's `arap_bal` (client validator). A GIN itself has no AR/AP balance. |

## Lifecycle and posting

Statuses: a new GIN is saved as a draft (posting status empty). **FINAL** is the only transition the applet offers, from the listing (multi-select) or the edit form; both send `{ "posting_status": "FINAL" }` to `PUT …/internal-purchase-goods-issued-notes/update-posting-status/{guid}`. A FINAL document is refused a second FINAL (HTTP 403 "already been posted to FINAL", `GenericDocumentService.updatePostingStatusWithChecks`). There is no VOID, DISCARD or "set to draft" action in this applet. DELETE (edit form, non-FINAL only) calls `DELETE …/internal-purchase-goods-issued-notes/{guid}`; the hiding of the button for FINAL rows is client-side only — the backend `performGenericDocumentDeletion` has no posting-status check.

Posting proof block:

| Fact | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE`, short code `PURGIN` | `InternalPurchaseGoodsIssuedNoteDataConsistencyObject`, `ServerDocShortCodes`, `GenericDocServerDocTypeEnum` |
| Amount signum | **0** (checked on create and update: `checkAmountSignum`) | DCO `specificValidationForCreation/Update`; `ServerDocTypes.INTERNAL_PURCHASE_GOODS_ISSUED_NOTE(0,0)` |
| Quantity signum | **0** — `fillQuantitySignumAndAmountSignumForLine` overwrites whatever the applet sends (the applet's own constant is also 0) | DCO `specificFillMissingDataForLineCreation/Update`; `applet-constants.ts` |
| Dr/Cr equation | none — `JournalPostingService.getJournalContainer` builds journal lines only where `amount_signum != 0`; with none, `NO_JOURNAL_CREATED` is thrown | `JournalPostingService` ~L96, ~L580 |
| GL precedence | not applicable (no lines reach the GL resolution) | `JournalPostingTypeHandler` has no entry for this type; the fallback `PURCHASE` handler is looked up but no line qualifies |
| Stock processor | none — `InventoryTransactionLineProcessorService.createInventoryTxnFromGenericDoc` filters lines to `quantity_signum != 0`; the type is absent from `StockBalanceHelper.MA_WA_SERVER_DOC_TYPES` | `InventoryTransactionLineProcessorService`, `StockBalanceHelper` L40 |
| What VOID reverses | nothing; no VOID path in the applet | applet effects |

What FINAL actually does (`GenericDocumentService.updatePostingStatus`, FINAL branch):

1. `validateGenericDocumentOnFinal`: forex rate check; duplicate serial numbers within the document (`GENERIC_DOC_LINE_SERIAL_NUMBER_ID_IS_DUPLICATED`, always); serial count vs quantity and serial existence only for lines with `quantity_signum != 0` — so **a GIN's serial numbers are stored but not validated against stock** (the applet does not send `validate_serial_signum_zero`); bin JSON checks; stock-balance check only for negative-signum lines (none); `FISCAL_PERIOD_LOCKED` if the transaction date falls in a `LOCK_ALL` / `LOCK_TXN` period (intranet #1616).
2. Update, assign running numbers, set `date_finalized`.
3. Enqueue `GenericDocumentPrimaryProcessor`, which fans out to the subscribed job processors after applying the company's `posting_final_json` include / exclude list. The inventory processor creates no `bl_inv_txn_line` rows and marks `posting_inventory` POSTED; the journal processor, if subscribed for the tenant, fails its queue job with `NO_JOURNAL_CREATED` (the document stays FINAL); `GenericDocLineOpenQueueProcessor` creates open-queue rows only if the company's Knock Off Configuration (`bl_fi_comp_gendoc_flow_config`, `config_type` KO, `server_doc_type_1 = INTERNAL_PURCHASE_GOODS_ISSUED_NOTE`, `is_enabled`) has a row for this type.

## Related applets

- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — the document to use when stock must leave and the supplier must be debited; the GIN is documentation only.
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) and [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) — the inbound counterparts; the GIN's Purchase Order picker computes open quantity from `IPO_IPGIN` links, independently of GRN knock-offs.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/), [Purchase Quotation (Internal)](/applets/purchase-workflow/internal-purchase-quotation-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — purchase-side sources for GIN lines.
- [Delivery Order (Internal)](/applets/sales-workflow/internal-delivery-order-applet/), [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) — sales-side sources the picker also offers (e.g. returning a customer's faulty unit to the supplier).
- [Sales GIN (Internal)](/applets/sales-workflow/internal-sales-gin-applet/) — the sales-side twin, same 0/0 shape.
- [Consignment GIN (Internal)](/applets/inventory-workflow/internal-consignment-gin-applet/) — unlike this applet, the consignment GIN moves stock and feeds MA cost.
- [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) — the way to remove quantities physically sent out on a GIN when no Purchase Return is raised.
- [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inv Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) — master data the form depends on.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Stock did not go down after FINAL | Expected: quantity signum 0, no `bl_inv_txn_line` rows are created for this type. | Raise a Purchase Return (stock out, supplier debited) or a Stock Adjustment for the physical movement; keep the GIN as the dispatch record. |
| Supplier balance / creditor report unchanged; totals show 0.00 | Expected: amount signum 0, no journal. | Settle on the Purchase Invoice or Payment Voucher; use the GIN's Contra tab only to attach an existing FINAL document for reference. |
| Queue job `JOURNAL_POSTING_JOB_PROCESSOR` fails with `NO_JOURNAL_CREATED` for GIN documents | The tenant subscribes the journal processor to every FINAL; a 0-amount document produces no journal lines. | Harmless for the document. Exclude the processor for this company via `posting_final_json.excludeJobProcessorCode` if the failures clutter the queue. |
| FINAL fails with "The selected date falls within a locked fiscal period" | `FISCAL_PERIOD_LOCKED`: the Transaction Date is inside a `LOCK_ALL` / `LOCK_TXN` fiscal period. | Change the transaction date or reopen the period in the fiscal-year configuration. |
| FINAL fails with a duplicated serial number error | The same serial appears twice on the same item within the document. | Remove the duplicate; note that the backend does not check whether the serial exists in stock for this document type. |
| CREATE stays grey | Main Details invalid (Branch, Company, Location, Purchaser, Credit Terms), no lines, or no supplier. | Purchaser can be dropped from the check with `HIDE_SALES_AGENT`; Credit Terms only becomes required once a supplier with terms is chosen. |
| Ordinary users see no unit price / amount columns; admins do | `INTERNAL_PURCHASE_GIN_DISPLAY_PRICING` is checked but not seeded; OWNER / ADMIN rank passes automatically. | Seed the permission code for the applet and grant it to the buyer role (or accept that prices are admin-only). |
| A toggle in Application Settings or a gear does nothing | The key is one of the 78 declared-but-unread or 31 gear-only keys listed above (e.g. `HIDE_SERIAL_NUMBER`, `ENABLE_EDIT_PAYMENT_DATE`). | No fix in configuration; the field is not wired in this applet. |
| Default Branch set in Default Selection is ignored on Create | `DEFAULT_BRANCH` / `DEFAULT_LOCATION` are saved but never read by the create form. | Select the branch manually; personal Default Selection is non-functional too (its SAVE has no subscriber). |
| Tab-hide toggles (Delivery Details, Doc Link, Trace Document, KO For, ARAP) are missing from Application Settings | The shared screen renders those sections only for applet codes in its `tabMappings`; `internalPurchaseGINApplet` is not listed. | Use the inline gear on the edit form for `HIDE_DOC_LINK_TAB` / `HIDE_MAIN_CONTRA_TAB` / `HIDE_DEPARTMENT_HDR_TAB`; the others have no control here. |
| Downstream picker cannot find a FINAL GIN in its KO tab | Open-queue rows are created only when the company's Knock Off Configuration has an enabled row for `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE`. | Add the source → target row under Organisation → Company → Knock Off Configuration, then re-run the queue repair for existing documents. |
| A FINAL GIN disappeared | The DELETE endpoint has no FINAL guard; a client that bypasses the hidden button (or an older applet build) can delete it. | Restrict `…GOODS_ISSUED_NOTE_DELETE_TGT_GUID` to administrators. |
| Labels are English only | Internationalisation is not implemented for this applet (intranet #5065, open). | None yet. |

## Related documentation

- [Purchasing module](/modules/purchasing/)
- [Purchase Return (Internal)](/applets/purchase-workflow/internal-purchase-return-applet/) — for the document that actually moves stock and debits the supplier
- [Standard procurement workflow](/guides/purchasing-guides/standard-procurement-workflow/) — where GRN, invoice and return sit; the GIN is an optional dispatch record alongside it
