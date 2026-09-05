---
title: "Pricebook"
description: "Reference for the Pricebook applet, used by pricing administrators to define price books and their price sets (rules for who, where, when and which items, plus discount, sales-price and membership-point treatments) that POS, the sales document applets and the OCR membership processor apply."
applet_code: "PricebookApplet"
applet_repo: "blg-applet-wavelet-pricebook-applet"
modules: [core, pos, membership, purchasing]
related_applets: [pos-general-applet, internal-sales-invoice-applet, internal-sales-order-applet, internal-sales-quotation-applet, internal-purchase-order-applet, membership-admin-applet, ocr-cash-bill-applet, shipping-pricebook-applet, doc-item-maintenance-applet, inv-item-maintenance-applet, customer-maintenance-applet, employee-applet, entity-applet, organisation-applet]
guides: [/guides/sales-guides/standard-sales-workflow/]
sources:
  configuration:
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/main.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/app.routing.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/priceset-edit/priceset-edit.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/redemption-validity-rule/redemption-validity-add.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/pricebook-listing/pricebook-listing.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/state-controllers/priceset-controller/store/effects/priceset.effect.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/state-controllers/pos-controller/store/effects/pos.effects.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/app.component.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-sales-order-applet-v2/micro-fe/projects/wavelet-erp/applets/internal-sales-order-applet-v2/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-sales-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-quotation-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-internal-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-applet/src/app/components/po-free-gift-container/create/create.component.ts
    - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/free-gift-container/listing/listing.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/ocr/OcrGenericDocPrimaryProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/jobProcessor/ocr/OcrGenericDocumentPrimaryProcessorProperties.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/AkaunTenantPermissions.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/priceBook/PriceBookPackageController.java
  fields:
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/models/options.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/models/pricebook-models/pricebook-constants.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/pricebook-create/pricebook-create.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/pricebook-create/pricebook-create.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/pricebook-edit/pricebook-edit.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/pricebook-edit/pricebook-edit.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/pricebook-create-priceset/pricebook-create-priceset.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/pricebook-edit-priceset/pricebook-edit-priceset.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/rule-add-pricebook/rule-add-pricebook.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/pricebook-container/rule-add-pricebook/item-rule/item-rule-listing/item-rule-listing.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/priceset-listing/priceset-listing.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/priceset-create/priceset-create.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/priceset-create/priceset-create.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/priceset-edit/priceset-edit.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/priceset-edit/priceset-edit.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/rule-add-priceset.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/rule-add-priceset.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/redemption-validity-rule/redemption-validity-add.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/entity-type-rule/entity-type-add.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/item-rule/regex-add/regex-add.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/item-rule/item-rule-listing/item-rule-listing.component.html
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/item-rule/item-rule-listing/item-rule-listing.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/item-rule/category-rule-listing/category-rule-listing.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/branch-rule/branch-rule-listing/branch-rule-listing.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/entity-type-rule/entity-type-add.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/priceBook/PriceBookLineJsonMapper.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_mst_price_book_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/api/constants/PriceBookCalculationLogic.java
  lifecycle:
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/state-controllers/pricebook-controller/store/effects/pricebook.effect.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/state-controllers/priceset-controller/store/effects/priceset.effect.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/price-book-services/price-book.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/priceBook/PriceBookPackageController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/priceBook/PriceBookEventController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/ListingController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/PriceBookService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/PricebookTypeConstant.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/PriceBookDataConsistencyObjects/PriceBookDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/PriceBookDataConsistencyObjects/PriceBookLineDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/PriceBookDataConsistencyObjects/PriceBookEventDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ErrorCodesConstants.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/PriceBookUows/PriceBookUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/PriceBookUows/PriceBookHeaderUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/ddd/DbTableDao.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/util/SqlGenerator.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentLineDataConsistencyObject.java
    - blg-shared-utilities/modules/gen-doc-simplified-ui/pricebook-calculator.ts
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/add-line-item/item-details/main-details/main-details.component.ts
    - blg-applet-wavelet-pos-general-applet/micro-fe/projects/wavelet-erp/applets/pos-general-applet/src/app/components/item-container/item-add-main/item-add-main.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/priceBook/PriceBookOcrGenDocMatchingService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/ocr/OcrGenericDocMembershipPointsPriceBookProcessor.java
  troubleshooting:
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/priceset-edit/priceset-edit.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/branch-rule/branch-rule-listing/branch-rule-listing.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/components/priceset-container/rule-add-priceset/item-rule/regex-add/regex-add.component.ts
    - blg-applet-wavelet-pricebook-applet/micro-fe/projects/wavelet-erp/applets/pricebook-applet/src/app/state-controllers/priceset-controller/store/effects/priceset.effect.ts
    - blg-shared-utilities/modules/gen-doc-simplified-ui/pricebook-calculator.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/PriceBookDataConsistencyObjects/PriceBookDataConsistencyObject.java
    - gh:bigledger/blg-applet-wavelet-pricebook-applet#2
    - gh:bigledger/blg-applet-wavelet-pricebook-applet#4
    - gh:bigledger/blg-applet-wavelet-pricebook-applet#7
    - gh:bigledger/blg-wiki#128
weight: 80
tags:
- applets
- pricing
- promotions
- sales
aliases:
- /applets/pricebook-applet/
---

## Overview

The **Pricebook** applet is where a pricing administrator defines conditional pricing: a **Price Book** is a named container with a calculation logic, and each **Price Set** inside it says *who* qualifies (entity type, member class, branch, company, customer or employee category, date range), *which items* it covers (items, categories, code or name patterns, with minimum quantity and amount) and *what happens* (a discount, a sales price, or membership points). The applet only maintains this master data. The rules are applied by the consumers: the POS General, Sales Invoice, Sales Order and Sales Quotation applets evaluate the price book selected in their *Default Pricebook* setting when a line is added, and the OCR membership-points processor evaluates a price book on the server for scanned cash bills.

Free-gift promotions for purchase orders and POS are stored in the same tables as price books of type `PO_FREE_GIFT` / `POS_FREE_GIFT`, but they are created and listed in the Purchase Order and POS General applets and are deliberately hidden here.

## Where it fits

| Direction | Applet | Relationship |
|---|---|---|
| Upstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | Items, item categories (category labels 1 to 10) and pricing schemes referenced by line rules and treatments |
| Upstream | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Employee](/applets/master-data/employee-applet/), [Entity](/applets/master-data/entity-applet/) | Entity types and the customer / employee category labels used by header rules |
| Upstream | [Organization](/applets/master-data/organisation-applet/) | Companies and branches used by Company / Branch rules |
| Upstream | [Membership Admin](/applets/membership/membership-admin-applet/) | Member classes, member labels and points currencies used by member rules and the Point treatment |
| Downstream | [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Sales Quotation](/applets/sales-workflow/internal-sales-quotation-applet/) | Load the price book named in their *Default Pricebook* setting and apply the matching price set to each line |
| Downstream | [OCR Cash Bill](/applets/membership/ocr-cash-bill-applet/) | The server-side membership-points processor evaluates a price book against scanned documents |
| Sibling | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [POS General](/applets/sales-workflow/pos-general-applet/) | Own the free-gift price books (`PO_FREE_GIFT`, `POS_FREE_GIFT`) that share these tables |
| Sibling | [Shipping Pricebook](/applets/master-data/shipping-pricebook-applet/) | Same rule/treatment design applied to shipping charges, on its own tables |

## Screens and menus

The applet has two menu entries, **Price Book** and **Price Set**, plus Settings and Personalization.

| Screen | Path | What it shows |
|---|---|---|
| Price Book listing | `pricebook` | Columns Price Book Code, Price Book Name, Description, Created Date, Updated Date; server-side paging through `pricebook-hdr/backoffice-ep`, filtered to rows whose `price_book_type` is null (free-gift books are excluded) |
| Price Book create | Price Book → **+** | Code, Name, Status, Description |
| Price Book edit | select a row | Tabs **Details** (code, name, calculation logic, status, description, audit fields, Delete) and **Pricing Set** (the book's price sets with search, create and edit) |
| Price Set listing | `priceset` | Every price set of every non-free-gift price book: Price Set Code, Price Set Name, Description, Modified Date (sorted descending), Created Date, Status |
| Price Set create | Price Set → **+** | Price Book (searchable select), Pricing Set Code, Pricing Set Name, Priority Level, Status, Description |
| Price Set edit | select a row | Tabs **Details**, **Rules - Doc Hdr**, **Rules - Multi Line**, **Rules - Single Line**, **Treatment** |
| Add Rule | Create on a Rules tab | Rule Type selector, then the type-specific form or selection grid |
| Settings | gear → Settings | Menu: **Field Settings**, **Default Selection**. Routes that exist without a menu entry: `feature-visibility` (the default landing page of Settings), `webhook`, `permission-set-listing`, `user-permission-listing`, `team-permission-listing`, `role-permission-listing` |
| Personalization | gear → Personalization | **Default Selection** (branch / location; non-functional, see Configuration), Sidebar |

There are two editors for a price set. The **Price Set** menu opens `priceset-edit`; the **Pricing Set** tab of a Price Book opens the nested `pricebook-edit-priceset`. They save the same `bl_fi_mst_price_book_line` row but offer different rule types and treatments (see Fields).

No screenshots are included on this page yet; the previous marketing infographic was removed because it did not show the product.

## Configuration

### Before you can use it

- **Items and categories** exist in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) or [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/). Category rules match on the item's category labels (`label_hdr_1_guid` … `label_hdr_10_guid`).
- **Pricing schemes** exist if a treatment uses *Price Source = Pricing Scheme*; the Treatment tab lists them from `PricingSchemeListService`.
- **Customer / employee category labels** are assigned on the entity ([Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Employee](/applets/master-data/employee-applet/)) for Customer Category / Employee Category rules.
- **Member classes, member labels and points currencies** exist in [Membership Admin](/applets/membership/membership-admin-applet/) for Member Class / Member Label rules and the Point treatment.
- **Companies and branches** exist in [Organization](/applets/master-data/organisation-applet/) for Company / Branch rules.
- **The consuming applet points at the price book.** Nothing is applied until *Default Selection → Default Pricebook* is set in POS General, Sales Invoice, Sales Order or Sales Quotation (see *Settings in other applets*).
- **Tenant permissions.** The API checks `TNT_LOG_PRICE_BOOK_OWNER` / `TNT_LOG_PRICE_BOOK_ADMIN` or `TNT_API_PRICE_BOOK_CREATE` / `UPDATE` / `DELETE` / `READ` (`AkaunTenantPermissions` L302-314) on every price-book endpoint; read access is also what POS and the sales applets need to load the price book.

### Applet settings

Settings are **applet-local**: `app.routing.ts` routes `settings/field-settings` to the applet's own `FieldConfigurationComponent` (one toggle) and `settings/default-selection` to its own `DefaultSettingsComponent`. The shared `FieldConfigurationComponent` in blg-shared-utilities is not used (`gates.py PricebookApplet` reports no controls for this code). Both screens save through the shared session effect into the applet's `bl_applet_ext` row `APPLET_SETTINGS` (`session.effects.ts` L353-373), so a value is tenant-wide and applies to every user of the applet; anyone who can open Settings can change them.

| Setting | Screen | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| `SHOW_SALES_TREATMENT` | Field Settings → tab *Price Set* (the toggle is labelled with its key) | Whether the **Sales Treatment** block (checkbox, price source, operator, value, priority, apply-to) is shown on the Treatment tab of the Price Set editor (`priceset-edit.component.ts` L271-276, template L306) | Off — the control is patched from `resolve?.SHOW_SALES_TREATMENT`, which is undefined until first saved, and the template tests it for truth | Turning it on reveals the block. A `SALES` treatment saved earlier stays in `treatment_json` and keeps being evaluated by the consumers whether or not the block is visible. The nested editor opened from Price Book → Pricing Set never shows Sales Treatment regardless of this setting |
| `DEFAULT_TIMEZONE` | Default Selection | The timezone used to display the Absolute Period dates of a Valid Date Range rule (`redemption-validity-add.component.ts` L85-87 in the Price Set editor, L79-81 in the Price Book editor) | Empty (dates display in the browser timezone) | Dates on the rule form are shown in that zone; stored values are converted without shifting the wall-clock time |

Rendered and saved on Default Selection but read by nothing in this applet: `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY` (a bounded grep of `src/app/components` finds no reader outside the settings screens). Picking a branch also fills Company and the branch's `MAIN_LOCATION` into those three controls.

`applet-settings.model.ts` also declares `ENABLE_DIMENSION`, `ENABLE_PROJECT`, `ENABLE_SST`, `PRINTABLE`, the custom-status keys and others; none has a control or a reader here and they are not documented.

**Personalization → Default Selection** is non-functional: the subscription that loads `appletContainer` is commented out (`personal-default-settings.component.ts` L31-38), so changing Branch or Location throws before anything is saved.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect on price books |
|---|---|---|
| **Default Pricebook** (`DEFAULT_PRICEBOOK`) | Default Selection in [POS General](/applets/sales-workflow/pos-general-applet/) (`posGeneral`), [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Order](/applets/sales-workflow/internal-sales-order-applet/) and [Sales Quotation](/applets/sales-workflow/internal-sales-quotation-applet/) | The one price book that applet loads at start-up (`app.component.ts` L95-96 in Sales Invoice; `pos.effects.ts` L10841-10843 in POS) and evaluates for every line. Only one price book per applet; with no value nothing is evaluated |
| **Auto Apply Points From Pricebook** (`PRICEBOOK_POINTS_AUTO_APPLY`) | POS General → Default Selection | Rendered and saved; no reader found in the POS repository at commit 4fb19b6 (see the POS page) |
| `POS_APPLY_GROUP_ITEM_PRICEBOOK_DISCOUNT_LOGIC`, `POS_MANUAL_PROMOTION_SELECTION` | Shared Field Settings screen, rendered only for `appletCode === 'posGeneral'` | How POS applies a matched discount to group items and whether the cashier picks the promotion manually; documented on the POS page |
| OCR job template `priceBookHdrGuid` | OCR job template configuration (`OcrGenericDocPrimaryProcessor` L84 → `OcrGenericDocumentPrimaryProcessorProperties.priceBookHdrGuid`) | The price book the server-side membership-points processor evaluates for each scanned cash bill; the processor throws `PRICE_BOOK_HDR_GUID_IS_NULL` without it |
| Free-gift setup | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) → PO Free Gift; POS General → Free Gift | Create price books with `price_book_type` `PO_FREE_GIFT` / `POS_FREE_GIFT`; the backend assigns their code from the running-number generator (`PriceBookService.createPriceBook` L27-35). This applet hides them (listing filter `price_book_type IS NULL`; Price Set loader drops any `*FREE_GIFT*` book, `priceset.effect.ts` L38, issue #4) |

### Feature visibility / permissions

No client-side permission definitions are seeded for this applet (`bl_applet_client_side_perm_dfn` has no rows for `PricebookApplet`, checked 2026-09-05), so the Feature Visibility screen and the role / team / user permission listings under Settings have nothing applet-specific to gate. Access is decided by the tenant permissions listed under *Before you can use it*; the API returns *not authorised* when none of them is assigned (`PriceBookPackageController` L63-150).

## Fields

Code and name inputs on the create forms accept letters, digits, space, hyphen and underscore only (`blockSpecialChar`), are upper-cased on save and are limited to 255 characters.

### Price Book — create

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Pricebook Code | Business key | Yes | Must be unique among non-deleted price books; the backend rejects a duplicate with `PRICEBOOK_HDR_OBJECT_CODE_ALREADY_EXIST` (`PriceBookDataConsistencyObject`, `BL_FI_MST_PRICE_BOOK_HDR_CODE_VALIDATION_FOR_CREATION`) |
| Pricebook Name | Display name | Yes | |
| Status | Active / Inactive | Yes | Default Active. Stored as the extension `PRICE_BOOK_STATUS` (param type STRING), not in `bl_fi_mst_price_book_hdr.status`, which the backend sets to ACTIVE. See Lifecycle for what does and does not read it |
| Description | Free text | No | |

### Price Book — edit › Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Pricebook Code | Read-only after creation | — | |
| Pricebook Name | | Yes | |
| Calculation Logic | How a consumer chooses between several matching price sets | No | Options `SEQUENTIAL_MATCH`, `AMOUNT_LOWEST`, `AMOUNT_HIGHEST`, `POINTS_REWARD_HIGHEST`, `POINTS_REWARD_LOWEST`, `POINTS_REDEEM_HIGHEST`, `POINTS_REDEEM_LOWEST`, `PRICESET_PRIORITY_DESCENDING`, `PRICESET_PRIORITY_ASCENDING` (`PriceBookCalculationLogic`). Saved to `bl_fi_mst_price_book_hdr.calculation_logic`. Only the OCR processor honours it, and only four values (see Lifecycle) |
| Status | Active / Inactive | | Updates the `PRICE_BOOK_STATUS` extension |
| Description | | No | |
| Created By / Date, Modified By / Date | Audit | — | Read-only |
| Delete | Soft-deletes the price book and its lines | — | No confirmation is enforced by the backend; consumers stop finding it |

### Price Set — Details

Created from the Price Set menu (choose the Price Book first) or from Price Book → Pricing Set (book pre-filled).

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Price Book Name | Parent price book | Yes | Read-only in the edit screens |
| Pricing Set Code | Business key | Yes | Read-only after creation; not checked for uniqueness by the backend (`PriceBookLineDataConsistencyObject` validates guid, header guid, revision and status only) |
| Pricing Set Name | | Yes | |
| Priority Level | Order of evaluation among the price sets of one book | Yes on create | Integer, saved to `priority_line` and `property_json.priority_line`. The consumers evaluate the **highest** number first |
| Status | Active / Inactive | Yes | Saved to `bl_fi_mst_price_book_line.status` and `property_json.status`. Consumers only evaluate ACTIVE lines |
| Description | | No | |
| Delete | | — | Sets the line's status to DELETED through a full price-book update; the line disappears from both listings |

A new price set is saved with empty rules on all three filters (`top_level_logic` AND, `negation_logic` FALSE) and an empty `treatment_json.treatment` list (`priceset.effect.ts` `createNewLine`).

### Price Set — Rules tabs

Each of **Rules - Doc Hdr**, **Rules - Multi Line** and **Rules - Single Line** has:

| Field | Meaning | Default | Notes |
|---|---|---|---|
| Rules Logic | And / Or across the rules of that tab | And | Saved as `top_level_logic` |
| Negation Logic | Enabled / Disabled — invert the tab's result | Disabled | Saved as `negation_logic` |
| Rule grid | One row per rule (Rule Name, Rule Type) | — | **Create** opens Add Rule; one rule of each type per tab, a second attempt shows *Rule already exist!* |

Rules are edited in memory and written only when you press **Save** on the price set (the toasts say *Please save your data to prevent losses*).

Rule types offered by the two editors:

| Tab | Price Set menu editor | Price Book → Pricing Set editor |
|---|---|---|
| Doc Hdr | Valid Date Range, Entity Type, Member Class, Member Label, Company, Branch, Currency, Settlement Method, OCR Company | Valid Date Range, Entity Type, Member Class, Member Label, Company, Branch, Employee Category, Customer Category, OCR Company |
| Multi Line / Single Line | Item, Item Category, Item Code Regex, Item Name Regex, Category Code Regex, Category Name Regex | the same six plus Category 0 … Category 10 |

Every rule has **Rule Name** (required) and **Negation Logic** (Enabled / Disabled). The type-specific part:

| Rule type | Input | Stored as |
|---|---|---|
| Valid Date Range | *Relative Period* (unit NA / Days / Months / Years and a number) or *Absolute Period* (From, To dates) | `date_logic` RELATIVE or ABSOLUTE, `period`, `unit`, `start_date`, `end_date` |
| Entity Type | Checkboxes All Customer, All Supplier, All Employee | `rule_filter_values` with codes CUSTOMER / SUPPLIER / EMPLOYEE |
| Member Class, Member Label, Company, Branch, Currency, Settlement Method, OCR Company, Employee Category, Customer Category | Multi-select grid | `rule_filter_values` (guid, code, name) |
| Item, Item Category, Category N | Multi-select grid plus **Min Quantity** and **Min Amount** (default 0); the Price Book editor also has **Max Quantity** | `rule_filter_values`, `minQty`, `minAmt`, `maxQty` |
| Item / Category Code / Name Regex | Name and a JavaScript regular expression | `rule_filter_values[].code` holds the pattern |

### Price Set — Treatment tab

| Treatment | Fields | Defaults |
|---|---|---|
| Sales Treatment (only with `SHOW_SALES_TREATMENT`; not in the nested editor) | Price Source, Operator, Formula (when Operator = Formula), Pricing Scheme (when Price Source = Pricing Scheme), Value, Priority, Apply Treatment To, Auto Apply to All Child Items | Price Source NA, Operator NA, Priority 1, Apply To `unit_price_net` |
| Discount Treatment | Same set of fields | Priority 2 |
| Point Treatment | Price Source, Point Currency, Operator, Formula or Value, Validity Period (Days), Pricing Scheme, Point Decimal Precision, Rounding Mode (UP / DOWN / HALF_UP / HALF_DOWN) | Price Source NA, Operator NA |

Option values: Price Source `NA`, `qty_base` (Base Quantity), `amount_std` (Standard Amount), `price_unit_cost` (Price Unit Cost), `amount_net` (Net Amount), `amount_txn` (Transaction Amount), `pricing_scheme`; Operator `NA`, `MULTIPLY`, `ABSOLUTE`, `ADD`, `SUBTRACT`, `FORMULA`; Apply Treatment To `unit_price_net`, `amount_net`, `amount_txn`. A formula may use the placeholder `{PRICE_SOURCE}`. Sales and Discount priorities must differ — Save is refused client-side with *Sales Treatment and Discount Treatment cannot have the same priority* (`validateTreatmentPriority`, L596-607). Each ticked treatment becomes one entry of `treatment_json.treatment` with `treatment_type` SALES, DISCOUNT or POINT; unticking removes it.

## Lifecycle and effects

**What the applet writes.** `bl_fi_mst_price_book_hdr` (one per price book), `bl_fi_mst_price_book_line` (one per price set, carrying `conditional_filter_json`, `treatment_json`, `priority_line`), `bl_fi_mst_price_book_ext` (`PRICE_BOOK_STATUS`) and `bl_fi_mst_price_book_event` (an audit row per action: `PRICE_BOOK_CREATED`, `PRICE_BOOK_UPDATED`, `PRICE_BOOK_DELETED`, `PRICING_SET_CREATED`, with `txn_type` `SYS_APPLET`). Every save of a price set is a full `PUT` of the parent price book container (`PriceBookService.put` to `…/erp/pricebooks`). The backend fires the webhooks `PRICE_BOOK_CREATED`, `PRICE_BOOK_UPDATED` and `PRICE_BOOK_DELETED` (`PriceBookService.java` L44, L57, L63).

**Posting.** This is master data: there is no `*DataConsistencyObject` signum, no journal, no stock processor and no open queue. The only document-side link is that a generic document line may carry `pricebook_hdr_guid` / `pricebook_line_guid`, which the backend validates as foreign keys when present (`GenericDocumentLineDataConsistencyObject` L345-361); the sales applets and POS do not populate them at commit efcad942 / 4fb19b6.

**Statuses.** Price books have `hdr.status` (ACTIVE, DELETED) and the extension `PRICE_BOOK_STATUS` (ACTIVE / INACTIVE from the Status field). Price sets have `line.status` (ACTIVE / INACTIVE / DELETED). Delete is a soft delete: `PriceBookUow.delete` runs the generated statement `UPDATE … SET STATUS='DELETED'` on the header, its extensions and its lines (`SqlGenerator` L115); all reads filter `status != 'DELETED'`.

**Backend validation on save** (`PriceBookDataConsistencyObject`, `PriceBookLineDataConsistencyObject`, `PriceBookEventDataConsistencyObject`): unique header code; header `branch_guid`, `entity_guid`, `item_guid` must exist when supplied; every extension / line / event needs a guid, revision and status, and its `hdr_guid` must match the header. Nothing on the server validates the contents of `conditional_filter_json` or `treatment_json`.

**How consumers evaluate a price book.** Two engines exist and they do not agree:

*Client side — `PricebookCalculator` (blg-shared-utilities, used by POS General, Sales Invoice, Sales Order, Sales Quotation, commit a8c38a2).*
- Takes the whole price book loaded by guid; keeps lines with `status === 'ACTIVE'` and sorts them by `property_json.priority_line` descending (L703-712). The Price Book's own Status extension and its Calculation Logic are never read.
- Header rules evaluated: `VALID_DATE_RANGE` (absolute `start_date` 00:00 to `end_date` 23:59:59 against the current date; a *Relative* period stores null dates and therefore never matches), `BRANCH`, `ENTITY_TYPE` (passes when the document has no entity, or when the rule ticks All Customer), `MEMBER_CLASS`, `EMPLOYEE_CATEGORY`, `CUSTOMER_CATEGORY` (L720-750). `COMPANY`, `MEMBER_LABEL`, `OCR_COMPANY`, `CURRENCY` and `SETTLEMENT_METHOD` rules are ignored, i.e. treated as satisfied. All evaluated rules must pass (the tab's *Or* logic is not applied); *Negation Logic* Enabled inverts the result (L753-755). **Multi Line rules are not evaluated at all** (`multi_line_doc_filter` is never read).
- Single-line rules evaluated, in priority order, first match wins (L858-880): `ITEM`, `ITEM_CODE_REG_EX`, `ITEM_CATEGORY_1` … `ITEM_CATEGORY_10` (matched against the item's `label_hdr_N_guid`), then `qty >= minQty`, `amount >= minAmt` and, when set, `qty <= maxQty` (L889-925). `ITEM_CATEGORY`, `ITEM_NAME_REG_EX` and the category regex types never match.
- Treatment: with both SALES and DISCOUNT present the one with the lower Priority wins, a tie applies DISCOUNT (`determineActiveTreatment`); `calculateSequentialTreatments` (newer path) applies each in order using the price source `price_unit_cost` (falls back to the standard price when the MA cost is 0), `amount_std` or `amount_net`. A discount is only applied when the computed price is greater than 0 and lower than the target price (`getDiscount` L998-1040). Sales Invoice writes the result into the line's Unit Discount and shows the price set name as the description (`main-details.component.ts` L800-830); POINT treatments produce reward points with `validity_period_days` (`calculatePoints` L640-700). In the POS path (`calculateUnitDiscountWithParent`), a treatment that names a Pricing Scheme makes the price set apply only to lines on that scheme (`checkPricingSchemeMatch` L306-334).

*Server side — `PriceBookOcrGenDocMatchingService` (OCR generic documents only).*
- Evaluates `hdr_doc_filter` and `multi_line_doc_filter` with their `top_level_logic` and `negation_logic` through `PriceBookOcrGenDocValidationEngine`; `VALID_DATE_RANGE` and the six item/category rule types have dedicated nodes, every other type falls to a generic node (L103-114). Matching lines are ordered by creation date, and the Price Book's Calculation Logic picks between them for `POINTS_REWARD_HIGHEST`, `POINTS_REWARD_LOWEST`, `PRICESET_PRIORITY_ASCENDING`, `PRICESET_PRIORITY_DESCENDING`; any other value (or none) takes the first (L118-129).
- Only the POINT treatment is used ("Supports only 1 treatment", L37-55); the processor `OcrGenericDocMembershipPointsPriceBookProcessor` writes `bl_crm_membership_points_txn_line` rows and marks the document's `posting_membership` POSTED.

## Related applets

- [POS General](/applets/sales-workflow/pos-general-applet/) — loads *Default Pricebook*, syncs price books for offline use, and owns the `POS_FREE_GIFT` books.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Order](/applets/sales-workflow/internal-sales-order-applet/), [Sales Quotation](/applets/sales-workflow/internal-sales-quotation-applet/) — apply the matched discount or sales price per line through the shared calculator.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — creates and lists the `PO_FREE_GIFT` price books that this applet hides.
- [Membership Admin](/applets/membership/membership-admin-applet/) — member classes, member labels and points currencies referenced by member rules and Point treatments.
- [OCR Cash Bill](/applets/membership/ocr-cash-bill-applet/) — the server-side price-book evaluation for scanned bills.
- [Shipping Pricebook](/applets/master-data/shipping-pricebook-applet/) — the same design on the shipping-price tables.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/), [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Employee](/applets/master-data/employee-applet/), [Entity](/applets/master-data/entity-applet/), [Organization](/applets/master-data/organisation-applet/) — the master data the rules point at.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A price set never applies in POS or a sales document | The consuming applet has no *Default Pricebook*, or points at another price book; the calculator is only built for that one book | Set Default Selection → Default Pricebook in that applet and reload it |
| A Company, Member Label, OCR Company, Currency or Settlement Method header rule has no effect on sales documents | The client calculator ignores those rule types (satisfied by default) | Use Branch, Entity Type, Member Class, Customer Category or Employee Category, which are evaluated; the ignored types only matter for the OCR processor's generic nodes |
| A *Relative Period* Valid Date Range never matches | Relative rules store null `start_date` / `end_date`; the calculator compares absolute dates only | Use an *Absolute Period* |
| Multi Line rules, or *Or* logic on the Doc Hdr tab, make no difference in sales documents | The calculator never reads `multi_line_doc_filter` and applies header rules as AND | Put item conditions on the Single Line tab; use Negation for exclusions |
| Item Category, Item Name Regex or category regex line rules never match | The calculator only evaluates Item, Item Code Regex and Category 1 … 10 | Use Item, Item Code Regex, or the Category N types from the Price Book → Pricing Set editor |
| Setting a Price Book to Inactive does not stop it applying | The Status field is an extension the calculator does not read; only the price set status and the consumer's Default Pricebook matter | Set each price set Inactive, or clear Default Pricebook in the consuming applet |
| *Rule already exist!* when adding a rule | One rule of each type is allowed per tab | Open the existing rule from the grid and change its selection |
| Rules or treatments added but gone after navigating away | Rule edits are held in memory until **Save** on the price set | Press Save on the Details tab before leaving |
| *Sales Treatment and Discount Treatment cannot have the same priority* | Client-side check on Save | Give the two treatments different Priority numbers |
| Sales Treatment block is missing on the Treatment tab | `SHOW_SALES_TREATMENT` is off, or you opened the nested editor from Price Book → Pricing Set, which never shows it | Turn the setting on and edit from the Price Set menu |
| A free-gift price book created in Purchase Order or POS is not listed here | By design (issue #4): the listing filters `price_book_type IS NULL` and the Price Set loader drops `*FREE_GIFT*` books | Manage free gifts in the Purchase Order or POS General applet |
| Save rejected with `PRICEBOOK_HDR_OBJECT_CODE_ALREADY_EXIST` | Another non-deleted price book has the same code | Choose another code (deleted books do not block reuse) |
| OCR membership points never posted | The job template has no `priceBookHdrGuid`, or the price book has no POINT treatment | Configure the price book on the OCR job template; add a Point treatment |

## Related documentation

- [Standard sales workflow](/guides/sales-guides/standard-sales-workflow/) — where pricing is applied in the sales cycle.
- [Pricebook configuration for membership tiers](/modules-v2/membership/configuration/rewards-setup/pricebook-configuration/) — using Member Class rules for tier pricing.
- [POS module](/modules-v2/pos/) and [Core module](/modules-v2/core/).
