---
title: "Purchase Quotation (Internal)"
description: "Reference for the Purchase Quotation (Internal) applet: the supplier-quotation record that sits between a Purchase Requisition and a Purchase Order, its screens, every configuration switch that actually works, fields, lifecycle (no stock movement, no journal), knock-off behaviour and known failure modes."
applet_code: "internal-purchase-quotation-applet"
applet_repo: "blg-applet-wavelet-internal-purchase-quotation-applet"
modules: [purchasing]
related_applets:
  - internal-purchase-requisition-applet
  - internal-purchase-order-applet
  - blanket-purchase-order-applet
  - internal-purchase-gin-applet
  - internal-sales-quotation-applet
  - supplier-applet-1
  - organisation-applet
  - doc-item-maintenance-applet
  - tax-configuration-applet
  - delivery-installation-applet
guides:
  - /guides/purchasing-guides/standard-procurement-workflow/
sources:
  configuration:
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/settings-container/branch-settings/branch/branch.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/settings-container/printable-format-settings-container/printable-format-listing/printable-format-listing.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-container.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-listing/purchase-quotation-listing.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-listing/purchase-quotation-listing.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/purchase-quotation-create.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/purchase-quotation-create.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/line-item/line-item-listing.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/add-line-item/add-line-item.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/add-line-item/item-details/main-details/main-details.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/add-line-item/item-details/department/department.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/payment/add-payment/add-payment.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-edit/purchase-quotation-edit.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-edit/purchase-quotation-edit.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-edit/import-knock-off/import-knock-off.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-edit/import-knock-off/import-knock-off.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-edit/import-knock-off/knock-off-purchase-requisition/knock-off-purchase-requisition.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-edit/export/export.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-edit/export/export.component.html
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
  fields:
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/account/account-entity-details/account-entity-details.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/add-line-item/item-details/department/department.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/delivery-details/delivery-details.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-create/contra/add-contra/add-contra.component.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-edit/edit-contra/edit-contra.component.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseQuotationDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ServerDocShortCodes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocLinkController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/journalPosting/JournalPostingJobProcessor.java
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/base-generic-doc-hdr.service.ts
    - blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/state-controllers/purchase-quotation-controller/store/effects/purchase-quotation.effects.ts
  troubleshooting:
    - gh:bigledger/blg-intranet#1312
    - gh:bigledger/blg-intranet#4490
    - gh:bigledger/blg-intranet#4115
    - gh:bigledger/blg-intranet#4807
    - gh:bigledger/blg-intranet#5076
    - gh:bigledger/blg-intranet#5412
    - gh:bigledger/blg-applet-wavelet-internal-purchase-quotation-applet#4
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocLinkService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java
tags:
- purchase-workflow
- purchase-quotation
- internal-purchase
- line-items
- knock-off
weight: 90
lastmod: 2026-09-05
---

## Overview

The **Purchase Quotation (Internal)** applet records the price a supplier has quoted you — supplier, items, quantities, unit prices, tax and terms — as a document of its own, so the quote can be compared, printed and later pulled into a [Purchase Order](/applets/purchase-workflow/internal-purchase-order-applet/). Purchasers open it after a [Purchase Requisition](/applets/purchase-workflow/internal-purchase-requisition-applet/) has been approved (the requisition lines can be knocked off into the quotation) and before the order is placed.

It is a **record-only** document: server document type `INTERNAL_PURCHASE_QUOTATION` (short code `PURQUO`) carries quantity signum **0** and amount signum **0**. Finalising it moves no stock, posts no journal and raises no creditor balance; its only side effect is the document-link / open-queue bookkeeping that lets a Purchase Order find it. The old description of the applet as enforcing "posting integrity" and "financial auditability" through the ledger is wrong — nothing reaches the ledger from here.

## Where it fits

Module: [Purchasing](/modules/purchasing/).

| Direction | Document / applet | Relationship |
|---|---|---|
| Upstream | [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/) | The only source the **KO For** tab offers. A FINAL requisition with open lines can be knocked off into a new quotation; the quotation copies the requisition's supplier, branch, location, delivery details and remaining line quantities (see Lifecycle). |
| Downstream | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) | The PO applet's KO For tab has a *Purchase Quotation* sub-tab (`koPQ`) that renders when the company's Knock Off Configuration has an enabled `LINE` row `INTERNAL_PURCHASE_QUOTATION → INTERNAL_PURCHASE_ORDER`; a FINAL quotation is queued for it. |
| Sibling | [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) | The other pre-order document a PO can knock off from. |
| Reference | [Purchase GIN (Internal)](/applets/purchase-workflow/internal-purchase-gin-applet/) | Lists the quotation among its eight source-document pickers. |
| Sales-side twin | [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/) | Same 0/0 shape on the sales side; the two applets share the shared-utilities settings screen. |
| Delivery | [Delivery & Installation](/applets/delivery-installation/delivery-installation-applet/) | The header **Delivery Details** tab is a read-only grid of delivery-job links (`bl_del_job_dochdr_link`) attached to the quotation. |

## Screens and menus

Menu items: **Purchase Quotation** (listing) and **Line Items** (every quotation line across documents). There is no file import / export menu and no inline settings gear in this applet.

**Listing.** Columns: Doc Short Code (`PURQUO`), Doc No, Posting Status, Branch Code, Supplier Name, Purchaser, Amount (the only column governed by a setting / permission pair: `HIDE_AMOUNT_MAIN_LISTING` / `SHOW_AMOUNT_MAIN_LISTING`), Created By, Created Date, Updated Date, Transaction Date. Toolbar: **Create (+)**, **FINAL** (multi-select; rows already FINAL are skipped), **DISCARD** (hidden by `HIDE_GENDOC_DISCARD_BUTTON`; only ACTIVE rows that are DRAFT or have no posting status), **VOID** (hidden by `HIDE_GENDOC_VOID_BUTTON`; only ACTIVE + FINAL rows). The listing loads the last three months by default (`purchase-quotation-container.component.ts` L79–82) unless `DISABLE_GEN_DOC_LISTING` is on, in which case nothing is loaded. The filter panel offers document number, keyword, supplier, branch, sales agent and created-date range; results are capped at 50 per query. There is no print button on the listing.

**Create form** tabs: Main Details, Account, Lines, Delivery Details, Payment, Department Hdr. **CREATE** is enabled when Main Details is valid, a supplier is selected and at least one line exists (`disableCreate()`). CREATE stores the document with status `TEMP` and opens it in the edit form.

**Edit form** tabs (fixed order — there is no tab-ordering setting in this applet): Main Details, Account, Lines, Delivery Details, Payment, **KO For** (rendered only while the document is still `TEMP` and `HIDE_KO_FOR_TAB` is off), Department Hdr, Contra, Doc Link, Attachments, Export. Buttons: **FINAL** (DRAFT documents only), **SAVE** (hidden by `HIDE_GENDOC_SAVE_BUTTON`; on a TEMP document SAVE converts it to ACTIVE / DRAFT), **DISCARD** at the foot of the form (same rule as the listing). There is no VOID button on the edit form — VOID is a listing action only — and although the component carries a two-click DELETE handler gated by the applet record's `SHOW_DOCUMENT_DELETE_BUTTON`, the template never renders it.

**Line editor** (Add / Edit Line Item): Item Details (Main Details, Delivery Instruction, Department — hidden by `HIDE_DEPARTMENT` — and, in edit mode, Doc Link and Delivery Details), Grouped Item (grouped items only), Serial Number / Batch Number / Bin Number (by the item's `sub_item_type`), Costing Details (`HIDE_COSTING_DETAILS`, re-shown per role by `SHOW_COSTING_DETAILS`) and Issue Link. The Pricing Details tab is commented out of the template. The Lines tab grid hides its three price columns unless the role holds `PURCHASE_QUOTATION_DISPLAY_PRICING`.

{{< figure src="/images/internal-purchase-quotation-applet/line-items-page-view.png" alt="Line Items listing with the Edit Line Item panel showing Item Details, Costing Details and Pricing Details tabs" caption="Line Items page (staging tenant, test items): every quotation line across documents, with the line editor on the right. Note the Pricing Details tab here belongs to the Line Items page's editor, not the document's line editor." >}}

**Line Items page**: columns Doc Short Code (hidden by `HIDE_DOC_SHORT_CODE_PREFIX`), Purchase Quotation No, Transaction Date, Item Code, Item Name, Qty, Unit Price (`HIDE_UNIT_PRICE_TXN` / `SHOW_UNIT_PRICE_TXN`), Tax Amount (`HIDE_SST_VAT_GST_AMOUNT` / `SHOW_SST_VAT_GST_AMOUNT`), Amount (`HIDE_AMOUNT_TXN` / `SHOW_AMOUNT_TXN`).

**Settings** menu (System Configuration): Application Settings, Default Selection, Printable Format Settings, Branch Settings; the routes also expose Webhook, Feature Visibility and the shared permission listings (client-side permission, permission wizard, permission set, user / team / role permission). **Personalization**: Default Selection and Sidebar.

## Configuration

### Before you can use it

- **Company, branch and location** in [Organisation](/applets/master-data/organisation-applet/). Branch, Company and Location are required on the header (`Validators.required`, `main-details.component.ts` L129–131). The location is stored on the header (`guid_store`) but no inventory transaction is ever created from it.
- **Suppliers** in [Supplier](/applets/master-data/supplier-applet-1/). The Account tab requires an entity (`entityId` required); the supplier's credit terms populate the Credit Terms drop-down.
- **Items** in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/). Any item type is accepted; serialised / batch / bin items open the matching sub-tab in the line editor.
- **Tax codes** in [Tax Configuration](/applets/master-data/tax-configuration-applet/) only if you want tax shown on the quote — nothing is posted.
- **No GL codes are needed.** The document type has no `JournalPostingTypeHandler` entry and never reaches `JournalPostingService` (see Lifecycle).
- **Knock Off Configuration** for the company (Organisation → Company → Knock Off Configuration, table `bl_fi_comp_gendoc_flow_config`). Two rows matter:
  - an enabled `LINE` row **`INTERNAL_PURCHASE_REQUISITION → INTERNAL_PURCHASE_ORDER`** — this is what the quotation's KO For tab actually checks. `import-knock-off.component.ts` L51 requests the flow rows for target `INTERNAL_PURCHASE_ORDER` (copied from the PO applet), and the *Purchase Requisition* sub-tab renders only when that PR→PO row is enabled (L86–90). The requisition picker likewise lists open-queue rows whose `server_doc_type_2` is `INTERNAL_PURCHASE_ORDER` (`knock-off-purchase-requisition.component.ts` L273–281, L757–770). A tenant that configures only a PR→PQ row never sees the tab.
  - an enabled `LINE` row **`INTERNAL_PURCHASE_QUOTATION → INTERNAL_PURCHASE_ORDER`** so that FINAL quotations are queued for the Purchase Order's *Purchase Quotation* sub-tab (`GenericDocLineOpenQueueProcessor.getConfigContainer`, L80–95).
- **Backend permissions**: `TNT_API_DOC_INTERNAL_PURCHASE_QUOTATION_CREATE / READ / UPDATE / DELETE_TGT_GUID` (`GenericDocumentTypeHandler` L591–598); knocking off additionally needs `API_TNT_DM_ERP_GENERIC_DOC_LINKS_CREATE` (`GenericDocLinkController` L455–463). The KO For tab also checks client-side that the user holds `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_CREATE_TGT_GUID` or is tenant admin / owner (`knock-off-purchase-requisition.component.ts` L112, L168–176) — a purchase-**order** permission, another leftover of the copy.
- **Printable formats** (Jasper templates) in Printable Format Settings if you want the Export tab to produce a PDF.

### Applet settings

Where settings live (read from `app.routing.ts` and `menu-items.ts`, applet @1f16762 with the shared-utilities submodule pinned at 49b834e; the field-configuration screen at that commit and at HEAD af523eb render the same set for this applet code):

| Screen | Component | What it holds |
|---|---|---|
| Settings → Application Settings (`field-settings`) | shared `FieldConfigurationComponent` (blg-shared-utilities) | The HIDE_* / ENABLE_* toggles below. The registry code `internal-purchase-quotation-applet` is **not** in the shared screen's `tabMappings`, so the KO, Payment, Account, External Document and tab-hide sections stay collapsed: 41 of the 102 keys the applet's model declares get a control; the code is in `shouldHideSetting()`'s list, so the price / discount / tax line toggles are pre-selected as hidden when nothing has been saved yet. |
| Settings → Default Selection | applet-local `DefaultSettingsComponent` | Default Branch, Default Location (auto-filled with the branch's `MAIN_LOCATION`), Default Language. |
| Settings → Printable Format Settings | applet-local listing with "set default" | `PRINTABLE` (default Jasper template GUID). |
| Settings → Branch Settings | applet-local, per branch | Branch Details, Item Category Filter, Pricing Scheme, **Printable Format** (per-branch default template, read by Export ahead of `PRINTABLE`), Default Settlement Method. |
| Personalization → Default Selection | applet-local `PersonalDefaultSettingsComponent` | Personal Default Branch / Location / Language; the document forms read `{...master, ...personal}`, so a personal value wins. |

Master settings are changed by OWNER / ADMIN users through the Settings menu; Personalization is open to every user. Master settings are persisted by the shared session effect as a merge into the applet's `APPLET_SETTINGS` extension (`session.effects.ts` L355–368). Defaults: every toggle below is off / empty unless the row says otherwise — the document code treats an absent key as "not hidden", but the shared screen pre-selects the `shouldHideSetting()` keys as hidden, so the first Save of Application Settings hides the standard-price, UOM-price, discount, tax and WHT line fields unless you untick them.

The table lists the 44 keys that pass all four proofs (declared in `applet-settings.model.ts`, rendered on the shared screen or an applet-local screen, persisted by the settings effect, and read by this applet's code or — for the language pair — by the shared session effect).

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `DISABLE_GEN_DOC_LISTING` | Listing | off | The container skips the initial load; the listing stays empty. |
| `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON` | Listing VOID / DISCARD buttons, edit-form DISCARD and SAVE | off | Hide the button for everyone; no `SHOW_*` permission re-shows them in this applet. |
| `HIDE_SERVER_DOC_TYPE`, `HIDE_DOC_SHORT_CODE_PREFIX` | Document Type field on Main Details / Contra; Doc Short Code column and prefixed document numbers | off | Hide the field / column (`HIDE_DOC_SHORT_CODE_PREFIX` switches Main Details to the un-prefixed Doc No). |
| `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID` | Permit No and Tracking ID on Main Details | off | Hide the field. |
| `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION` | Delivery Branch / Delivery Location columns of the KO For requisition picker | off | Hide the column. There is no delivery branch / location field on this applet's own Main Details. |
| `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Purchaser | off | On a TEMP document the purchaser is looked up from the logged-in user's employee record (`main-details.component.ts` L244). |
| `HIDE_DEPARTMENT` | Department tab of the line editor | off | Hides the tab; when hidden the department form no longer blocks the line SAVE (`add-line-item.component.ts` L164). |
| `HIDE_SEGMENT`, `HIDE_DIMENSION`, `HIDE_PROFIT_CENTER`, `HIDE_PROJECT` | Dimension pickers on the line Department tab | off | Hide the picker (a hidden picker is only skipped by validation when the matching `MANDATORY_*` key is off). |
| `HIDE_COSTING_DETAILS` | Costing Details tab of the line editor | off | Hides the tab; `SHOW_COSTING_DETAILS` (seeded) re-shows it per role. |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | Price, quantity, discount, tax and WHT fields of the line editor (and the matching Line Items page columns) | off; the shared screen pre-selects the `shouldHideSetting()` keys (`HIDE_UNIT_PRICE_STD_EXCL_TAX`, `…_STD_UOM_*`, `…_NET_*`, `…_TXN_UOM_INCL_TAX`, `HIDE_UNIT_DISCOUNT*`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_AMOUNT_STD/NET_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`) as hidden until saved | Hide the field; the same-named `SHOW_*` client-side permission (all seeded) re-shows it per role. |
| `ENABLE_ITEM_NAME_MAX_LIMIT`, `ITEM_NAME_MAX_LIMIT` | Item Name on lines | off / empty | Character counter and `maxlength` validation on the line's Item Name. |
| `DEFAULT_BRANCH`, `DEFAULT_LOCATION` (Default Selection, also personal) | New-document header | empty | Applied as Branch / Location when a document is created (`main-details.component.ts` L169–175). |
| `DEFAULT_LANGUAGE_GUID`, `DEFAULT_LANGUAGE_CODE` (Default Selection, also personal) | UI language of the applet | applet default (`en`) | Read by the shared session effect to pick the translation file (`session.effects.ts` L385). |
| `PRINTABLE` (Printable Format Settings) | Default template on the Export tab | empty | Pre-selects the template; a Branch Settings → Printable Format default for the document's branch overrides it (`export.component.ts` L73–74). |

Read at runtime but with **no control anywhere for this applet code** (declared and consumed, gated out of the shared screen by `showKOTab`, `showPaymentTab` or an applet-code list, and there is no gear): `HIDE_AMOUNT_MAIN_LISTING` (listing Amount column — only the `SHOW_AMOUNT_MAIN_LISTING` permission can act on it, and that code is not seeded), `HIDE_KO_FOR_TAB`, `ENABLE_MULTIPLE_KO` (multi-row selection in the requisition picker), `ENABLE_EDIT_PAYMENT_DATE`, `MANDATORY_SEGMENT`, `MANDATORY_DIMENSION`, `MANDATORY_PROFIT_CENTER`, `MANDATORY_PROJECT` (line Department validators), and the sixteen card `HIDE_* / MANDATORY_*` keys of the Payment panel. They can only be set by API.

Rendered and saved but **never read** by this applet: `HIDE_LAST_PURCHASE_PRICE`, `HIDE_VALIDITY_DATE` (there is no validity-date field), `DEFAULT_COMPANY` (written from the branch on the Default Selection screen). Model-only (no control, never read): the fifteen `ENABLE_CUSTOM_STATUS_*` keys, `ENABLE_ / INCLUDE_` dimension, SST and WHT flags, `DEFAULT_PRICING_SCHEME`, `DEFAULT_VALIDITY_DAYS`, `VALIDITY_DATE_REQUIRED`, `ENABLE_EDIT_SETTLEMENT_DATE`.

### Document behaviour settings

- **Posting** is not configurable: FINAL is fixed at quantity 0 / amount 0 (see Lifecycle). The applet sends `{ posting_status: "FINAL" }` with no `date_txn_logic` and no validation flags, so the backend defaults apply (`validate_serial_signum_zero = false`, `validate_stock_balance = true`, `GenericDocumentService` L387–392) — both irrelevant to a zero-signum document.
- **Status flow options**: `HIDE_GENDOC_VOID / DISCARD / SAVE_BUTTON` only. There is no FINAL → DRAFT action, no clone, no listing print and no auto-print after FINAL.
- **Transaction date**: the Main Details date picker is disabled unless the role holds the `SHOW_TRANSACTION_DATE` client-side permission (`main-details.component.html` L59); without it every quotation carries the creation date.
- **Knock-off**: a single **KNOCK OFF** action per document, while the document is still `TEMP`. The picker selects one requisition (several when `ENABLE_MULTIPLE_KO` is on) and calls the backend `knock-off/backoffice-ep`, which copies the open lines and header fields onto the quotation and sets it to ACTIVE / DRAFT — after which the KO For tab disappears.
- **Printables**: Jasper templates from Printable Format Settings; default from Branch Settings → Printable Format, else `PRINTABLE`. The Export tab offers **EXPORT AS PDF** only (DOCX / ZIP are disabled placeholders). The per-branch default was added for this applet in late 2025 (intranet #1312).
- **e-Invoice, workflow / approval, intercompany**: none wired.

### Feature visibility / permissions

24 client-side permission definitions are seeded for `internal-purchase-quotation-applet` in `bl_applet_client_side_perm_dfn` (intranet #4490), and every one of them is checked in code: the twenty `SHOW_UNIT_PRICE_* / SHOW_UNIT_DISCOUNT* / SHOW_QTY_* / SHOW_UOM_TO_BASE_RATIO / SHOW_AMOUNT_STD|NET_EXCL_TAX / SHOW_AMOUNT_TXN / SHOW_DISCOUNT_AMOUNT_EXCL_TAX / SHOW_TAX_CONFIG_SELECTION / SHOW_WHT_CONFIG_SELECTION` codes (re-show a line field hidden by the matching `HIDE_*` setting), `SHOW_COSTING_DETAILS` (re-shows the Costing Details tab), `SHOW_TRANSACTION_DATE` (unlocks the transaction-date picker), `PURCHASE_QUOTATION_DISPLAY_PRICING` (shows the Unit Price, Tax and Amount columns on the Lines tab grid; without it they are hidden and removed from the column chooser, `line-item-listing.component.ts` L132) and `HIDE_PRICE` — a *hide* permission: a role that holds it loses every price field in the line editor's Main Details regardless of settings (`main-details.component.ts` L198–200). The two mechanisms are independent: a role can hold `PURCHASE_QUOTATION_DISPLAY_PRICING` and `HIDE_PRICE` at once and see prices on the grid but not on the form.

Checked in code but **not seeded** (cannot be granted from the permission screens until seeded — the gap intranet #5412 closed for the neighbouring purchase applets but not this one): `SHOW_AMOUNT_MAIN_LISTING` (listing Amount column) and `SHOW_SST_VAT_GST_AMOUNT` (Line Items page Tax column).

Feature Visibility and Webhook are the shared screens from `blg-shared-utilities`; the applet adds nothing to them.

## Fields

### Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Document Type, Doc Short Code, Doc No (Tenant / Company / Branch) | Type and numbers | read-only | Numbers are assigned by the backend on FINAL; hidden by `HIDE_SERVER_DOC_TYPE` / `HIDE_DOC_SHORT_CODE_PREFIX`. |
| Branch, Company, Location | Owning branch, its company, store (`guid_store`) | Yes (`Validators.required`) | Branch fills Company and Currency; defaults from Default Selection; locked once the document is no longer TEMP. |
| Purchaser | Employee responsible | No | Employee picker (`is_employee = true`); auto-filled on a TEMP document by `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`. |
| Transaction Date | `date_txn` | No | Disabled unless the role holds `SHOW_TRANSACTION_DATE`. |
| Credit Terms | Supplier's terms | No | Disabled until a supplier is selected; options come from the supplier record. |
| Reference, Remarks | Free text | No | |
| Permit No, Tracking ID | Free text | No | Hidden by `HIDE_PERMIT_NO` / `HIDE_TRACKING_ID`. |
| Currency | `doc_ccy` | No | Set from the branch; editable while TEMP. No rate field. |

### Account

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity ID / Name, Status, Email, Phone, ID Number, Entity Type, Identity Type, Description | Supplier | Entity ID required | Chosen through the supplier picker, which can also create a supplier inline (name, type, AR/AP type and currency required) and edit one (Main, Category, Login, Payment Config, Tax tabs). |
| Bill To, Ship To | Billing / shipping contacts and addresses | No | Sub-tabs of Account; copied from the supplier's addresses. |

### Lines (line editor → Item Details → Main Details)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Item Code, Item Name | Item | Yes | From Search Item; Item Name limited by `ITEM_NAME_MAX_LIMIT` when enabled. |
| Blanket PO No / Sales Quotation No / Purchase Order No / Purchase Requisition No | Source document of a copied line | read-only | Shown only for lines that arrived through a knock-off (`itemType` set). |
| UOM, Pricing Scheme | Unit of measure and scheme | No | |
| Qty | `quantity_base` | Yes, ≥ 1 | |
| Unit Price STD (excl / incl tax, per UOM), Unit Discount, Unit Price NET, Unit Price TXN | Price ladder | No, ≥ 0 | Each pair is a `HIDE_*` setting with a `SHOW_*` permission; all hidden for a role holding `HIDE_PRICE`. |
| STD Amount, Discount Amount, Net Amount, Tax (SST/GST/VAT) code and amount, WHT code and amount, Txn Amount | Computed amounts | Net Amount, Net Amount with tax and Txn Amount required, ≥ 0 | Computed client-side from the price ladder. |

The **Department** tab (segment, dimension, profit centre, project) applies `Validators.required` per `MANDATORY_*` key; the **Delivery Instruction** tab holds the line's delivery note; serial / batch / bin sub-tabs validate `batch_no`, `qty`, `issue_date`, `expiry_date`, `bin_code`, `container_qty`, `container_measure` as required.

### Other header tabs

| Tab | Content |
|---|---|
| Delivery Details | Read-only grid of delivery jobs linked to the document: Trip No, Driver, Vehicle, Job start / end, Delivery Status, Recipient. Nothing is entered here. |
| Payment | Settlement lines (settlement method, amount, card / cheque / transaction references; `ENABLE_EDIT_PAYMENT_DATE` unlocks the date). The lines are sent with the document but the backend forces their amount signum to 0 (see Lifecycle), so they never settle anything. |
| Department Hdr | Header-level G/L Dimension, Profit Centre, Project, Segment. |
| Contra | Attaches `bl_fi_generic_doc_arap_contra` rows against other FINAL documents; the amount is limited client-side to the target's AR/AP balance (`add-contra.component.ts` L125–126). A 0-amount quotation has no balance of its own to offset. |
| Doc Link | Copied From (the requisition) / Copied To (the purchase order). |
| Attachments | File upload; attachments of a knocked-off requisition are copied onto the quotation by the backend. |
| Export | Template picker and EXPORT AS PDF. |

## Lifecycle and effects

Statuses: `TEMP` (created, not yet saved — the only state in which KO For works) → `ACTIVE` with posting status `DRAFT` (after SAVE or after a knock-off) → `FINAL` → `VOID`. `DISCARDED` is reached from DRAFT.

| Action | Where | Backend call and guard |
|---|---|---|
| SAVE (TEMP) | edit form | `PUT /generic-documents/{type}` with `status = ACTIVE`, `doc_source_type = INTERNAL`, `amount_signum = 0` (`purchase-quotation.effects.ts` L387–410). |
| KNOCK OFF | KO For tab | `POST bl_fi_generic_doc_link/knock-off/backoffice-ep`. Throws `Target Gen Doc is not in TEMP status` once the document has been saved (`GenericDocLinkService` L559–561), `The selected documents contain different entities or branches.` for a multi-select across suppliers or branches (L542–550), and `The quantity to be knocked off exceeds the generic doc line quantity.` when every selected line is already fully linked to a quotation (L598–601). Copies each ACTIVE source line with `remaining = quantity_base − Σ quantity_contra of existing links to quotation-type targets`, writes `KO` links with quantity signum −1, copies supplier, branch, location, delivery, dimensions, references and attachments from the requisition, and sets the quotation to ACTIVE / DRAFT (L640–720). |
| FINAL | listing (multi) or edit form | `PUT …/update-posting-status/{guid}` with `{posting_status: FINAL}`; then the applet re-`PUT`s the document's links with `posting_status = FINAL` (L702–746). Backend FINAL validation: fiscal-period lock (`FISCAL_PERIOD_LOCKED`, `validateGenericDocumentOnFinal` L1695), forex and bin checks; serial-existence checks are skipped because `purchaseDocTypeSignumZero` (L1865) does not list this type and the applet never sends `validate_serial_signum_zero`. |
| VOID | listing | `PUT …/backoffice-ep/void/{guid}`. `checkcanChangePostingStatusToNonFinal` throws `Generic Document cannot be change to VOID!` unless the document is FINAL, and `GENERIC_DOCUMENT_HAS_TARGET_LINKS` when an ACTIVE link points from this quotation to another document (`GenericDocumentController` L2907, L2921–2950) — a quotation already knocked off into a purchase order cannot be voided until that link is removed. |
| DISCARD | listing / edit form | `PUT …/discard/backoffice-ep/{guid}`; throws `Generic Document cannot be discarded!` for FINAL or VOID documents or a status other than ACTIVE / DRAFT (L700–702). |

**Posting proof block**

- *Server document type*: `INTERNAL_PURCHASE_QUOTATION`, short code `PURQUO` (`GenericDocServerDocTypeEnum` L29, `ServerDocShortCodes` L32).
- *Amount signum*: **0**. *Quantity signum*: **0**. The DCO checks the header amount signum on create and update and overwrites every line's signums with 0/0 (`InternalPurchaseQuotationDataConsistencyObject` L16–17, L21–34, L38–46) — including the Payment tab's settlement lines.
- *Dr/Cr equation*: none. `JournalPostingTypeHandler` has no entry for the type; `JournalPostingService.getJournalContainer` builds lines only where `amount_signum != 0` and throws `NO_JOURNAL_CREATED` on an empty journal (L580, L697, L841). A tenant whose `posting_final_json` subscribes every FINAL to `JournalPostingJobProcessor` sees that job fail for each quotation while the document itself stays FINAL.
- *GL precedence*: not applicable — no GL code is resolved for this type.
- *Stock processor*: none. `InventoryTransactionLineProcessorService.createInventoryTxnFromGenericDoc` filters lines to `quantity_signum != 0`; the type is absent from `StockBalanceHelper.MA_WA_SERVER_DOC_TYPES`.
- *Open queue*: on FINAL, `GenericDocLineOpenQueueProcessor` creates `bl_fi_generic_doc_line_open_queue` rows for each `PNS` line per enabled `INTERNAL_PURCHASE_QUOTATION → <target>` row in the company's Knock Off Configuration (L65–95). Without a PQ → PO row the Purchase Order applet cannot find the quotation.
- *What VOID reverses*: nothing financial — it flips `posting_status`, records `void_reason`, and the link / queue clean-up runs through `updatePostingStatusToNonFinal`.

**Knock-off and the requisition's open quantity.** The picker shows the requisition's `qty_open` from its PR → PO queue rows, but the backend decrements a queue row only where `server_doc_type_2` equals the link's target type (`GenericDocLinkService.getExistingOpenQueue` L398–405). A knock-off into a quotation therefore leaves the PR → PO open quantity untouched (the requisition can still be ordered directly), and only reduces a PR → PQ queue row if the company has that flow row enabled. What does stop a second quotation of the same line is the link sum in `knockOff` itself (L570–577).

## Related applets

- [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/) — the only knock-off source; the requisition's own page should say that a quotation does not consume its PR → PO open quantity.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — the document a FINAL quotation is queued for (`koPQ` sub-tab, PQ → PO flow row).
- [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) — the sibling pre-order document.
- [Purchase GIN (Internal)](/applets/purchase-workflow/internal-purchase-gin-applet/) — lists quotations among its source pickers.
- [Sales Quotation (Internal)](/applets/sales-workflow/internal-sales-quotation-applet/) — the sales-side equivalent.
- [Supplier](/applets/master-data/supplier-applet-1/), [Organisation](/applets/master-data/organisation-applet/), [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Tax Configuration](/applets/master-data/tax-configuration-applet/) — master data the form reads.
- [Delivery & Installation](/applets/delivery-installation/delivery-installation-applet/) — source of the Delivery Details grid.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The **KO For** tab is missing on a new quotation. | The tab renders only while the document is `TEMP` (before the first SAVE) and only when the company's Knock Off Configuration has an enabled `LINE` row `INTERNAL_PURCHASE_REQUISITION → INTERNAL_PURCHASE_ORDER` — the applet checks the purchase-**order** row, not a PR → PQ row. `HIDE_KO_FOR_TAB` (API-only) also hides it. | Enable the PR → PO row for the company; create a fresh quotation and knock off before saving. |
| The KO For picker is empty although requisitions are FINAL. | The picker lists PR → PO open-queue rows for the quotation's branch; requisitions finalised before that flow row was enabled have no queue rows, and the picker is filtered to the header branch. | Enable the row, then run the open-queue repair for the affected requisitions, or raise the quotation in the requisition's branch. |
| Error `Target Gen Doc is not in TEMP status` when knocking off. | The quotation was already saved (or already knocked off once); the backend allows a knock-off only on a `TEMP` document. | Create a new quotation; select several requisitions in one go (needs `ENABLE_MULTIPLE_KO`). |
| Error `The quantity to be knocked off exceeds the generic doc line quantity.` | Every line of the selected requisition is already fully linked to another quotation. | Open the existing quotation (Doc Link → Copied To on the requisition) or discard it. |
| Error `The selected documents contain different entities or branches.` | Multi-select across requisitions with different suppliers or branches. | Knock off one supplier / branch at a time. |
| Transaction Date is greyed out. | The picker is disabled unless the role holds the `SHOW_TRANSACTION_DATE` client-side permission; every quotation is dated on creation. | Grant `SHOW_TRANSACTION_DATE` to the purchasing role. |
| Prices are missing on the Lines grid, or on the line form for one role. | The Lines grid hides Unit Price / Tax / Amount unless the role holds `PURCHASE_QUOTATION_DISPLAY_PRICING`; the line form hides every price field for a role holding `HIDE_PRICE`, and hides individual fields per `HIDE_*` setting (pre-selected as hidden after the first Application Settings save). | Grant `PURCHASE_QUOTATION_DISPLAY_PRICING`, remove `HIDE_PRICE`, untick the `HIDE_UNIT_PRICE_*` toggles or grant the matching `SHOW_*` codes. |
| The Amount column cannot be re-shown for a role. | `HIDE_AMOUNT_MAIN_LISTING` has no control in this applet and its `SHOW_AMOUNT_MAIN_LISTING` permission is not seeded; the same applies to `SHOW_SST_VAT_GST_AMOUNT` on the Line Items page. | Clear the key by API, or seed the permission codes (see Questions in the lane findings). |
| **Cannot void**: `GENERIC_DOCUMENT_HAS_TARGET_LINKS` / "…already been linked with the following documents". | The quotation has an ACTIVE link to a purchase order. | Discard or unlink the purchase order line first, then void. |
| `Generic Document cannot be change to VOID!` | The row is not FINAL (VOID is offered only for ACTIVE + FINAL rows; a stale grid can show a discarded row). | Refresh the listing. |
| `Generic Document cannot be discarded!` | The document is FINAL or VOID. | Use VOID for a FINAL document. |
| FINAL fails with `FISCAL_PERIOD_LOCKED`. | The transaction date falls in a locked fiscal period. | Unlock the period or change the date (needs `SHOW_TRANSACTION_DATE`). |
| A journal job appears in the queue with `NO_JOURNAL_CREATED` after finalising quotations. | The company's `posting_final_json` subscribes every FINAL to the journal processor; a 0/0 document produces no journal lines. | Expected; nothing to post. Exclude the type from the subscription if the noise matters. |
| The Purchase Order's *Purchase Quotation* sub-tab does not show a FINAL quotation. | No enabled `INTERNAL_PURCHASE_QUOTATION → INTERNAL_PURCHASE_ORDER` row in the company's Knock Off Configuration when the quotation was finalised, so no open-queue rows exist. | Enable the row and repair the queue for the quotation. |
| Export prints with the wrong template. | Branch Settings → Printable Format for the document's branch overrides the applet-wide `PRINTABLE` default (intranet #1312). | Set or clear the branch default. |
| CREATE / SAVE stays disabled. | Main Details invalid (Branch, Company, Location), no supplier on the Account tab, or no lines. | Complete those three. |
| UI labels blank after an upgrade. | The translation service was not initialised in the deployed bundle (fixed in the December 2025 build; i18n itself is still an open task, intranet #5076). | Redeploy the current build. |

## Related documentation

- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow/) — where a supplier quotation sits between requisition and order.
- [Purchasing module](/modules/purchasing/) — the module page and its applet list.
