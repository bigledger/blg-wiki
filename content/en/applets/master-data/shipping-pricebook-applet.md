---
title: "Shipping Pricebook"
description: "Reference for the Shipping Pricebook applet, used by e-commerce and logistics administrators to define shipping price books and their price sets (who, where and which items, plus Standard Shipping Fee, Handling Fee and Fuel Surcharge treatments) that the CP Commerce storefront evaluates at checkout."
applet_code: "ShippingPricebookApplet"
page_type: applet
applet_repo: "blg-applet-wavelet-shipping-pricebook-applet"
modules: [ecommerce, core]
related_applets: [pricebook-applet, cp-commerce-admin-applet, shopping-cart-applet, doc-item-maintenance-applet, organisation-applet, membership-admin-applet, customer-maintenance-applet, internal-sales-order-applet]
guides: [/guides/roles/ecommerce-specialist/]
sources:
  configuration:
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/app.routing.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/models/pricebook-models/pricebook-constants.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/settings-container/settings-container.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-shared-utilities/modules/settings/settings.component.html
    - blg-shared-utilities/modules/settings/settings.component.ts
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/website-edit.component.html
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/components/website-container/website-edit/website-edit.component.ts
    - blg-applets-wavelet-cp-commerce/micro-fe/projects/akaun-platform/applets/cp-commerce-admin-applet/src/app/models/shipping-fee-constants.ts
    - wavelet-cp-commerce/src/app/state-controllers/pricebook-store/selectors/pricebook.selector.ts
    - wavelet-cp-commerce/src/app/state-controllers/pricebook-store/states/pricebook.state.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/shippingPriceBook/ShippingPriceBookPackageController.java
  fields:
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/models/options.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/pricebook-container/pricebook-create/pricebook-create.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/pricebook-container/pricebook-create/pricebook-create.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/pricebook-container/pricebook-edit/pricebook-edit.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/pricebook-container/pricebook-edit/pricebook-edit.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/pricebook-container/pricebook-listing/pricebook-listing.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/pricebook-container/pricebook-create-priceset/pricebook-create-priceset.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/pricebook-container/pricebook-edit-priceset/pricebook-edit-priceset.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/priceset-listing/priceset-listing.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/priceset-create/priceset-create.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/priceset-create/priceset-create.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/priceset-edit/priceset-edit.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/priceset-edit/priceset-edit.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/rule-add-priceset/rule-add-priceset.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/rule-add-priceset/rule-add-priceset.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/rule-add-priceset/redemption-validity-rule/redemption-validity-add.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/rule-add-priceset/redemption-validity-rule/redemption-validity-add.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/rule-add-priceset/entity-type-rule/entity-type-add.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/rule-add-priceset/delivery-region-rule/delivery-region-rule-listing/delivery-region-rule-listing.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/rule-add-priceset/item-rule/item-rule-listing/item-rule-listing.component.html
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/rule-add-priceset/item-rule/item-rule-listing/item-rule-listing.component.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/components/priceset-container/rule-add-priceset/item-rule/regex-add/regex-add.component.html
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_mst_shipping_price_book_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_mst_shipping_price_book_line.java
  lifecycle:
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/state-controllers/pricebook-controller/store/effects/pricebook.effect.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/state-controllers/priceset-controller/store/effects/priceset.effect.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/shipping-price-book-services/shipping-price-book.service.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/shippingPriceBook/ShippingPriceBookPackageController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/shippingPriceBook/ShippingPriceBookPackageService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/ShippingPriceBookDataConsistencyObjects/ShippingPriceBookDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/shippingPriceBooksUow/ShippingPriceBookUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/ddd/DbTableDao.java
    - wavelet-cp-commerce/src/app/state-controllers/pricebook-store/effects/pricebook.effects.ts
    - wavelet-cp-commerce/src/app/components/checkout-step-v2/checkout-step-shipping/checkout-step-shipping.page.html
    - wavelet-cp-commerce/src/app/state-controllers/shopping-cart-store/effects/shopping-cart.effects.ts
    - wavelet-cp-commerce/src/app/models/shipping-models/shipping-manager.ts
    - wavelet-cp-commerce/src/app/models/shipping-models/shipping-pricebook.model.ts
    - wavelet-cp-commerce/src/app/utils/mappers/shipping-pricebook-mappers/shipping-pricebook.mappers.ts
    - wavelet-cp-commerce/src/app/models/pricebook-discount-models/pricebook-discount-priceset.model.ts
    - wavelet-cp-commerce/src/app/models/rule-conditional-nodes/rule-generic.node.ts
    - wavelet-cp-commerce/src/app/models/rule-conditional-nodes/rule-delivery-region.node.ts
    - wavelet-cp-commerce/src/app/models/rule-conditional-nodes/rule-item-dimensions.node.ts
    - wavelet-cp-commerce/src/app/models/rule-conditional-nodes/rule-abs-datetime.node.ts
    - wavelet-cp-commerce/src/app/models/rule-conditional-nodes/rule-rel-datetime.node.ts
  troubleshooting:
    - wavelet-cp-commerce/src/app/models/shipping-models/shipping-manager.ts
    - wavelet-cp-commerce/src/app/utils/mappers/shipping-pricebook-mappers/shipping-pricebook.mappers.ts
    - wavelet-cp-commerce/src/app/models/rule-conditional-nodes/rule-abs-datetime.node.ts
    - wavelet-cp-commerce/src/app/models/rule-conditional-nodes/rule-delivery-region.node.ts
    - blg-applet-wavelet-shipping-pricebook-applet/micro-fe/projects/wavelet-erp/applets/shipping-pricebook-applet/src/app/state-controllers/priceset-controller/store/effects/priceset.effect.ts
    - gh:bigledger/wavelet-cp-commerce#57
    - gh:bigledger/wavelet-cp-commerce#67
    - gh:bigledger/blg-applet-wavelet-shipping-pricebook-applet#1
tags:
- shipping-management
- logistics-controls
- fee-automation
- pricebook-rules
- surcharge-calculation
weight: 150
---

## Overview

The **Shipping Pricebook** applet is where an e-commerce or logistics administrator defines conditional shipping charges: a **Shipping Pricebook** is a named container, and each **Shipping Priceset** inside it says *who* qualifies (entity type, member class, member label, company, branch, delivery region, date range), *which items* in the cart it looks at (items, categories, code or name patterns, with minimum quantity, minimum amount and weight bands) and *what is charged* (a Standard Shipping Fee, a Handling Fee and a Fuel Surcharge, each with a price source, an operator and a value).

The applet only maintains this master data. The rules are applied by one consumer: the **CP Commerce storefront**. At checkout the shopper picks a shipping price book as the *Shipping method*, the storefront evaluates its price sets in the browser and writes the resulting fee as a line for the website's shipping-fee service item on the shopping cart. Nothing in the ERP back office (POS, sales documents, the Java backend) evaluates shipping price books.

## Where it fits

| Direction | Applet | Relationship |
|---|---|---|
| Upstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | Items, item categories and pricing schemes referenced by line rules and treatments; item weight and dimensions feed the weight bands; the SERVICE item that carries the fee |
| Upstream | [Organization](/applets/master-data/organisation-applet/) | Companies and branches for Company / Branch rules |
| Upstream | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | Entity types (customer / supplier / employee) matched by Entity Type rules |
| Upstream | [Membership Admin](/applets/membership/membership-admin-applet/) | Member classes and member labels for the member rules |
| Consumer | [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) | Website settings that switch the shipping-fee process on, choose the *Shipping Pricebook* option, the default price book and the shipping-fee item |
| Consumer | [Shopping Cart](/applets/ecommerce/shopping-cart-applet/) | The storefront writes the computed fee as a DRAFT-cart line; the cart converts to a [Sales Order](/applets/sales-workflow/internal-sales-order-applet/) that carries it as a normal service line |
| Sibling | [Pricebook](/applets/master-data/pricebook-applet/) | Same rule / treatment design applied to discounts and points, on its own tables and with its own consumers |

## Screens and menus

The applet has two menu entries, **Shipping Pricebook** and **Shipping Priceset**, plus Settings and Personalization.

| Screen | Path | What it shows |
|---|---|---|
| Shipping Pricebook listing | `pricebook` | Columns Shipping Pricebook Code, Name, Description, Modified Date (sorted descending), Created Date, Status (read from the `PRICE_BOOK_STATUS` extension); server-side paging through `shipping-pricebooks/query`, deleted books excluded |
| Shipping Pricebook create | Shipping Pricebook → **+** | Code, Name, Menu Icon, Status, Description |
| Shipping Pricebook edit | select a row | Tabs **Details** (code, name, menu icon, calculation logic, status, description, audit fields, Delete) and **Pricing Set** (the book's price sets with Priority column, search, create and edit) |
| Shipping Priceset listing | `priceset` | Every price set of every price book, loaded client-side from `shipping-pricebooks` (no server paging): Code, Name, Description, Modified Date, Created Date, Status |
| Shipping Priceset create | Shipping Priceset → **+** | Pricebook Name (searchable select), Code, Name, Priority Level, Status, Description |
| Shipping Priceset edit | select a row | Tabs **Details**, **Rules - Doc Hdr**, **Rules - Multi Line**, **Rules - Single Line**, **Treatment** |
| Add Rule | **+** on a Rules tab | Rule Type selector, then the type-specific form or selection grid |
| Settings | gear → Settings | Menu: **Field Settings**, **Default Selection**. Routes that exist without a menu entry: `feature-visibility` (the landing page of Settings), `webhook`, `permission-set-listing`, `user-permission-listing`, `team-permission-listing`, `role-permission-listing` |
| Personalization | gear → Personalization | **Default Selection** (branch / location; non-functional, see Configuration), Sidebar |

There are two editors for a price set. The **Shipping Priceset** menu opens `priceset-edit`; the **Pricing Set** tab of a Shipping Pricebook opens the nested `pricebook-edit-priceset`. Unlike the Pricebook applet, both offer the same rule types and the same three treatments and save the same `bl_fi_mst_shipping_price_book_line` row.

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-pricebook-edit-add-priceset.png" alt="Shipping Pricebook edit, Pricing Set tab, with the Create Shipping Priceset form open" caption="Shipping Pricebook edit › Pricing Set: the nested Create Shipping Priceset form (Code, Name, Priority Level, Status, Description)." >}}

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-add.png" alt="Shipping Priceset listing with the Create Shipping Priceset form open" caption="Shipping Priceset menu › Create: the same form with a Pricebook Name selector in front." >}}

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-details.png" alt="Edit Shipping Priceset, Details tab" caption="Edit Shipping Priceset › Details: code and price book are read-only, Priority Level and Status are editable, Delete at the bottom." >}}

## Configuration

### Before you can use it

- **A website with the shipping-fee process switched on** in [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) → Website Edit → Details: tick *Enable Shipping Fee Process*, choose *Shipping Fee Options = Shipping Pricebook*, pick the *Default Shipping Price Book Code* and the *Item Code for Shipping Fee*. Without the item the storefront computes no line (the fee shows as RM 0.00); without the option the storefront runs the delivery-charge path instead (see *Settings in other applets*).
- **A SERVICE item for the fee** in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) (`txn_type` SERVICE). Its GL and tax settings decide how the fee posts once the cart becomes a sales order.
- **Items and categories** exist in Doc Item Maintenance for item / category rules; **pricing schemes** exist if a treatment uses *Price Source = Pricing Scheme* (the Treatment tab lists the schemes of the `PRICING_SCHEME_ITEM` list).
- **Companies and branches** exist in [Organization](/applets/master-data/organisation-applet/) for Company / Branch rules; **member classes and labels** exist in [Membership Admin](/applets/membership/membership-admin-applet/) for the member rules.
- **Delivery regions with a State value** for Delivery Region rules — the storefront matches the shopper's shipping-address *state* against the region's State (see Lifecycle).
- **Tenant permissions.** Every applet endpoint checks `API_TNT_DM_ERP_SHIPPING_PRICE_BOOK_OWNER` / `ADMIN` or the matching `CREATE` / `UPDATE` / `DELETE` / `READ` code (`TntErpPermissions` L371-383; `ShippingPriceBookPackageController` L56-215). The storefront does not need any of them: it reads through `shipping-pricebooks/website-ep/{websiteHdrGuid}/query`, an anonymous tenant endpoint that only validates the website guid (controller L219-245).

### Applet settings

Settings are **applet-local** in layout only: `app.routing.ts` routes `settings/field-settings` and `settings/default-selection` to the applet's own components, and the shared `FieldConfigurationComponent` in blg-shared-utilities is not routed (`gates.py` has no controls for `ShippingPricebookApplet`). None of the applet's own screens is functional:

- **Field Settings** is a static template — eight slide toggles (*Lines Settings*: Unit Discount, SST/VAT/GST, WHT, Blanket Order; *Department Settings*: Segment, G/L Dimension, Profit Center, Project) with no form binding, a SAVE button with no click handler and a component class with no logic (`field-configuration.component.html`, `.ts`). They are rendered but neither declared, persisted nor consumed.
- **Default Selection** renders *Default Branch* and *Default Location*. The component writes each change into `this.appletContainer.bl_applet_exts`, but `appletContainer` is never assigned (there is no subscription to `appletSettings$`, and the routed host `<app-settings>` neither binds that input nor listens to `save`; the shared `SettingsComponent.onSaveDefault` is commented out). Changing a value throws in the browser console and nothing is saved; no code in the applet reads `DEFAULT_BRANCH` or `DEFAULT_LOCATION`.
- **Personalization → Default Selection** has the same defect (`personal-default-settings.component.ts` L31-38 commented out).

No exposed, working control found (routes and settings components checked at commit 7894b78, 2026-09-02).

### Settings in other applets that control this applet

| Setting | Where it is set | Effect on shipping price books |
|---|---|---|
| **Enable Shipping Fee Process** | [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) → Website Edit → Details | Master switch; when off the storefront never calculates a shipping fee |
| **Shipping Fee Options** (`Shipping Pricebook` / `Delivery Charges` / `Delivery Charges by Country` / `Delivery Charges by Region`) | same screen | Only *Shipping Pricebook* uses this applet. The storefront branches on `useDeliveryChargeItem`: delivery-charge options call the server-side `loginEntityGenerateDeliveryChargesDocLine`, the price book option runs the client-side engine described under Lifecycle |
| **Default Shipping Price Book Code** (website extension `SYS_AKN_WEB_CP_COMMERCE_SHIPPING_PRICEBOOK`) | same screen, shown for the *Shipping Pricebook* option | The price book pre-selected as *Shipping method* at checkout (`selectActivePricebook`: the shopper's choice, else this default) |
| **Item Code for Shipping Fee** (`SYS_AKN_WEB_CP_COMMERCE_SHIPPING_SERVICE_ITEM`) | same screen | The SERVICE item the computed fee is written against (quantity 1). With no item the storefront adds no line and shows RM 0.00 |
| **Pick-up in store** (website content flag `selectPickupStoreEnabled`) | website configuration | Adds a synthetic "PICK UP IN STORE" entry (code `PICKUP_STORE`, guid `DEFAULT_UUID`) to the *Shipping method* list; choosing it skips the shipping address and the fee |
| Item property `free_shipping` | item master data used by the storefront | Lines whose item carries `item_property_json.free_shipping` are left out of the item / category data fetched for rule evaluation |

### Feature visibility / permissions

No client-side permission definitions are seeded for this applet (`bl_applet_client_side_perm_dfn` has no rows for `ShippingPricebookApplet`, checked 2026-09-05), so the Feature Visibility screen and the role / team / user permission listings under Settings have nothing applet-specific to gate. Access is decided by the tenant permissions listed under *Before you can use it*; the API returns *not authorised* when none of them is assigned.

## Fields

Code and name inputs on the create forms accept letters, digits, space, hyphen and underscore only (`blockSpecialChar`), are upper-cased and trimmed on save, and are limited to 255 characters.

### Shipping Pricebook — create

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Shipping Pricebook Code | Unique identifier of the book | Yes | Immutable after creation (read-only on edit). The backend does **not** check uniqueness (`ShippingPriceBookDataConsistencyObject` validates guid, revision, status and `hdr_guid` links only) |
| Shipping Pricebook Name | Display name; what the shopper sees as the *Shipping method* | Yes | Stored upper-cased |
| Menu Icon | Icon shown next to the shipping method in the storefront | No | Ionicon name, stored as `property_json.icon` |
| Status | Active / Inactive | Yes | Default *Active*. Stored as extension `PRICE_BOOK_STATUS`, not as the header `status` column — see Lifecycle for the consequence |
| Description | Free text | No | Max 255 characters |

### Shipping Pricebook — edit › Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Pricebook Code | As created | — | Read-only |
| Pricebook Name | Display name | Yes | Save is disabled until the form is touched |
| Menu Icon | As above | No | |
| Calculation Logic | How the storefront picks among matching price sets | No | Options *Sequential Match*, *Amount Lowest*, *Amount Highest*, *Points Reward Highest / Lowest*, *Points Redeem Highest / Lowest* (`Options.firstMatchOptions`, stored as extension `FIRST_MATCH`). The storefront treats every value as Sequential Match — see Lifecycle |
| Status | Active / Inactive | No | Extension `PRICE_BOOK_STATUS` |
| Description | Free text | No | Character counter, no limit on edit |
| Created By / Date, Modified By / Date | Audit | — | Read-only; the *By* fields resolve the subject to its e-mail login principal |
| Delete | Soft-deletes the book | — | Backend sets status DELETED on header, extensions and lines (`ShippingPriceBookUow.delete` → `DbTableDao.delete` with `deletePermanent = false`) |

### Shipping Priceset — create

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Pricebook Name | Parent book (menu form only; the nested form shows it read-only) | Yes | Searchable select over all books returned by `shipping-pricebooks` |
| Shipping Priceset Code | Identifier within the book | Yes | Immutable after creation; not checked for uniqueness |
| Shipping Priceset Name | Display name | Yes | |
| Priority Level | Evaluation order at checkout | Yes | Number; **lower value is evaluated first**. Stored as `property_json.priority_line` |
| Status | Active / Inactive | Yes | Default *Active*; stored as `property_json.status` |
| Description | Free text | No | Max 255 characters |

Creating a price set appends a line to the book with three empty rule groups (`hdr_doc_filter`, `multi_line_doc_filter`, `single_line_doc_filter`, each `top_level_logic = AND`, `negation_logic = FALSE`, `rules = []`) and an empty `treatment_json.treatment` array, and PUTs the whole book.

### Shipping Priceset — Rules tabs

Each Rules tab has **Rules Logic** (*And* / *Or* → `top_level_logic`) and **Negation Logic** (*Enabled* / *Disabled* → `negation_logic`) for the whole group, a grid of *Rule Name · Rule Type*, and a **+** that opens *Add Rule*. Every rule form has a required **Rule Name** and its own **Negation Logic**. Rules are saved immediately by the rule form (a PUT of the book), independently of the SAVE button of the price set.

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-rules-doc-hdr.png" alt="Rules - Doc Hdr tab with the Add Rule type list open" caption="Rules - Doc Hdr: group logic on the left, the Rule Type list of the Add Rule column on the right." >}}

| Tab | Rule Type | Form / picker | Stored keys |
|---|---|---|---|
| Rules - Doc Hdr | Valid Date Range | *Period Unit* (Day(s) / Month(s) / Year(s)), *Relative Period* (number), *Absolute Period From / To* (date pickers) | `start_date`, `end_date`, `period` |
| Rules - Doc Hdr | Entity Type | Checkboxes *All Customer*, *All Supplier*, *All Employee* | `rule_filter_values` (entity type codes) |
| Rules - Doc Hdr | Member Class, Member Label | Selection grid of classes / labels | `rule_filter_values` (guids) |
| Rules - Doc Hdr | Company, Branch | Selection grid of companies / branches | `rule_filter_values` (guids) |
| Rules - Doc Hdr | Delivery Region | Selection grid *Code · Delivery Region · State · Country* | `rule_filter_values` (regions with `state`) |
| Rules - Multi Line, Rules - Single Line | Item, Item Category | *Min Quantity*, *Min Amount* ("measured against the selected items only, after discount"), *Total Weight From / To*, *Total Volumetric Weight From / To*, *Divisor*, then the item / category selection grid | `minQty`, `minAmt`, `totalWeightFrom`, `totalWeightTo`, `totalVolumetricWeightFrom`, `totalVolumetricWeightTo`, `volumetricWeightDivisor`, `rule_filter_values` |
| Rules - Multi Line, Rules - Single Line | Item Code Regex, Item Name Regex, Category Code Regex, Category Name Regex | *Name* and the regular expression, added to a list | `rule_filter_values` (name / code pairs) |

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-rules-multi-line.png" alt="Rules - Multi Line tab with the Add Rule type list open" caption="Rules - Multi Line: the six item and pattern rule types." >}}

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-rules-single-line.png" alt="Rules - Single Line tab with the Add Rule type list open" caption="Rules - Single Line offers the same six types; the storefront does not evaluate this tab (see Lifecycle)." >}}

### Shipping Priceset — Treatment tab

Three independent blocks, each enabled by its checkbox: **Standard Shipping Fee** (`STANDARD_SHIPPING_FEE`), **Handling Fee** (`HANDLING_FEE`) and **Fuel Surcharge** (`FUEL_SURCHARGE`). Unticking a block removes its entry from `treatment_json.treatment` on save.

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Price Source | The cart figure the fee is derived from | No | *Base Quantity* (`qty_base`), *Standard Amount* (`amount_std`), *Price Unit Cost* (`price_unit_cost`), *Net Amount* (`amount_net`), *Transaction Amount* (`amount_txn`), *Pricing Scheme* (`pricing_scheme`) |
| Operator | The arithmetic applied | No | `MULTIPLY`, `ABSOLUTE`, `ADD`, `SUBTRACT` |
| Value | The number the operator uses | No | Numeric input, no validation |
| Pricing Scheme | Shown only when Price Source = Pricing Scheme | No | Schemes of the `PRICING_SCHEME_ITEM` list; stored as `pricing_scheme` (guid) |
| Auto apply to all child items | Standard Shipping Fee block only | No | "When a group item is selected in this priceset's rules, also match every child item of that group in the cart"; stored as `auto_apply_to_all_child_items` and read while evaluating item rules |

{{< figure src="/images/shipping-pricebook-applet/shipping-pricebook-applet-priceset-edit-treatment.png" alt="Treatment tab with the Price Source list open" caption="Treatment: Standard Shipping Fee, Handling Fee and Fuel Surcharge, each with Price Source, Operator and Value." >}}

## Lifecycle and effects

**What the applet writes.** Every action is a full PUT of the price book container (`shipping-pricebooks`, `ShippingPriceBookService.put`): header, extensions and lines together. Price set *Delete* does not remove the line; it sets `status` and `property_json.status` to `DELETED` and PUTs. Price book *Delete* calls DELETE `/{guid}` and the backend soft-deletes header, extensions and lines. Update, delete and price set actions also POST an audit row to `shipping-pricebooks/events` (`bl_fi_mst_shipping_price_book_event`, `txn_type` `SYS_APPLET`, actions `PRICE_BOOK_UPDATED`, `PRICE_BOOK_DELETED`, `PRICING_SET_CREATED`, `PRICE_SET_UPDATED`, `PRICE_SET_DELETED`); the create effect builds its `PRICE_BOOK_CREATED` event inside an inner pipe that is never subscribed, so that event is never written.

**Backend validation.** `ShippingPriceBookPackageService.create/update` run `ShippingPriceBookDataConsistencyObject`: header guid present and (on create) not already existing, revision and status present, every extension and line with a guid, `hdr_guid` equal to the header guid, revision and status. Failures come back as `Core2DataConsistencyException` with codes such as `SHIPPING_PRICEBOOK_HDR_OBJECT_GUID_ALREADY_EXISTS` or `SHIPPING_PRICEBOOK_LINE_OBJECT_HDR_GUID_DIFFERENT_FROM_PRICEBOOK_HDR_OBJECT_GUID`. Nothing validates the rule or treatment JSON and nothing checks code uniqueness. The `bl_fi_mst_shipping_price_book_rule_*` tables, DCOs and controllers exist in the backend but no applet, storefront or admin code references them.

**No posting.** A shipping price book is master data: no server document type, no signums, no journal, no stock processor. The fee reaches the ledger only as an ordinary service-item line on the sales order the cart converts into, and posts by that item's GL and tax configuration.

**How the storefront applies it (the only consumer).** All of this runs in the shopper's browser (`wavelet-cp-commerce`, commit 247243251, 2026-09-03):

1. **Load.** `loadShippingPricebookInit$` calls the anonymous website endpoint asking for header status ACTIVE, ordered by created date. The applet's *Status* field is the extension `PRICE_BOOK_STATUS`, which the storefront never reads, so an *Inactive* price book is still loaded and offered; only a deleted one disappears.
2. **Choose.** The *Shipping method* block at checkout lists every loaded price book by name and icon (plus *PICK UP IN STORE* when enabled) with the website default pre-selected; `selectActivePricebook` = the shopper's choice, else the website default.
3. **Qualify.** `ShippingManager` sorts the book's price sets by `priority_line` ascending (missing → last; ties keep API order), drops DELETED ones — *Inactive* price sets are still evaluated — and keeps those whose **Doc Hdr rules and Multi Line rules both pass**. The Single Line tab is never evaluated. Within a group, *Rules Logic* And / Or and *Negation Logic* are honoured.
4. **Select.** `selectPricesetBasedOnCalculationLogic` always returns the first qualifying set. *Calculation Logic* on the book (`FIRST_MATCH`) is read but every value behaves as *Sequential Match*.
5. **Compute.** Aggregate = Σ over all cart lines of the **Standard Shipping Fee** price source (`qty_base` → `quantity_base`, `amount_std`, `amount_net`, `amount_txn`, `price_unit_cost` → `unit_price_std`). Each ticked treatment applies its operator to that same aggregate: `MULTIPLY` = aggregate × value, `ABSOLUTE` = value, `ADD` = aggregate + value, `SUBTRACT` = aggregate − value; an unticked treatment contributes 0. Fee = Standard + Handling + Fuel, rounded to two decimals. The Handling Fee and Fuel Surcharge blocks' own *Price Source* is not used; *Pricing Scheme* as a price source reads a field that is not on the cart line and yields no usable number.
6. **Write.** The fee becomes a quantity-1 line for the website's shipping-fee item (`addShippingDocLine`; the previous shipping line is marked DELETED), the cart revision is checked, and the coupon engine is re-run so a free-shipping voucher can discount the line.

**Rule coverage at checkout.**

| Rule Type | Evaluated as |
|---|---|
| Entity Type | Cart entity has any of the selected types (`containsEntity`) |
| Member Class, Member Label | Cart member's class guid / label guids include any selected |
| Company, Branch | Cart company / branch guid equals any selected |
| Delivery Region | Shipping address **state** equals (case-insensitive) the State of any selected region; region code, country and postcode are not compared |
| Item, Item Category, code / name regexes | Selected items / categories / patterns present in the cart with `minQty`, `minAmt` (after discount, selected items only), total weight and volumetric weight bands; group items expand to child lines when *Auto apply to all child items* is on |
| Valid Date Range | Mapped to a node with **null start and end dates**, so it always passes; with Negation *Enabled* it never passes. The dates and period entered in the applet are not used |
| Any item / category rule with nothing selected | Evaluates to false and, with the default *And*, disables the whole price set (a known gap noted in the mapper) |

## Related applets

- [Pricebook](/applets/master-data/pricebook-applet/) — the discount / sales-price / points sibling with the same rule and treatment design; its consumers (POS, sales documents, OCR) never read shipping price books.
- [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — owns the website switches that decide whether, with which price book and against which item the storefront charges shipping.
- [Shopping Cart](/applets/ecommerce/shopping-cart-applet/) — the fee is a line of the DRAFT cart; the coupon engine may discount it.
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — the shipping-fee SERVICE item, the items and categories in line rules, the pricing schemes offered in the Treatment tab, and the weight / dimensions used by weight bands.
- [Organization](/applets/master-data/organisation-applet/) — companies and branches for Company / Branch rules.
- [Membership Admin](/applets/membership/membership-admin-applet/) — member classes and labels for member rules.
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — entity types for Entity Type rules.
- [Sales Order](/applets/sales-workflow/internal-sales-order-applet/) — receives the fee as a service line when the cart converts.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Checkout charges a fixed fee (e.g. RM 20) although the shopper does not match the rules you expected (gh:bigledger/wavelet-cp-commerce#57, #67) | The first price set in `priority_line` order whose Doc Hdr and Multi Line rules pass wins; a price set with no rules always qualifies; Single Line rules are ignored; Inactive price sets are still evaluated | Give every price set a distinct Priority Level, put the most specific sets on the lowest numbers, move item conditions to the Multi Line tab, and delete (not deactivate) sets that must not apply |
| A price set never applies even though its rules look right | An Item / Item Category / regex rule was saved with nothing selected; it evaluates to false and, under *And*, disables the whole set | Open the rule and delete it, or select items |
| Valid Date Range has no effect (promotion rate applies outside the dates, or never applies) | The storefront evaluates the rule with null dates: it always passes, and with Negation *Enabled* never passes | Do not rely on date rules for shipping; switch price sets manually, or deactivate the book |
| Delivery Region rule does not match an address in the right region | Only the address *state* text is compared with the region's State (case-insensitive); postcode, city and country are ignored | Make the region's State exactly the value the storefront stores in the shipping address; create one region per state spelling |
| Handling Fee or Fuel Surcharge is calculated on the wrong base | Both use the aggregate of the **Standard Shipping Fee** price source; their own Price Source is ignored. With Standard Shipping Fee unticked the aggregate is 0, so `MULTIPLY` gives 0 and `ADD` / `ABSOLUTE` give the bare value | Tick Standard Shipping Fee and set its Price Source to the base you want for all three |
| *Calculation Logic* = Amount Lowest / Highest makes no difference | The storefront always takes the first qualifying price set in priority order | Order the price sets by Priority Level instead |
| An Inactive price book still appears as a shipping method | Status is stored as the `PRICE_BOOK_STATUS` extension; the storefront filters on the header status column | Delete the book (soft delete) or remove it as website default and rename it; ask the product team about the extension / column mismatch |
| No *Shipping method* block, or fee always RM 0.00 | Website has *Enable Shipping Fee Process* off, *Shipping Fee Options* is not *Shipping Pricebook*, no *Default Shipping Price Book Code*, or no *Item Code for Shipping Fee* (no item → no line) | Complete the website Details section in [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) |
| Price Source = Pricing Scheme gives no fee | The storefront reads `pricing_scheme` from the cart line, which carries no such number | Use Base Quantity, Standard / Net / Transaction Amount or Price Unit Cost; model tiers as several price sets |
| Old price sets carry duplicate treatment entries | An earlier version of the save effect appended a second `STANDARD_SHIPPING_FEE` / `HANDLING_FEE` / `FUEL_SURCHARGE` entry whenever the set had exactly one treatment | Open the price set and Save once: the current effect collapses duplicates, keeping the last entry per type |
| Default Selection throws or does not keep Branch / Location | The settings component is not wired to the applet store (no container loaded, no save listener) | Nothing to configure here; the applet reads no default branch or location |
| "Could not calculate the shipping fee because the cart kept changing" | The cart revision changed while the fee was being computed; the storefront retries a bounded number of times and then gives up | Retry checkout once the cart is stable |

## Related documentation

- [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — website *Shipping Fee Options*, default shipping price book, shipping-fee item and shipping providers.
- [Pricebook](/applets/master-data/pricebook-applet/) — discounts, sales prices and membership points with the same rule engine design.
- [E-Commerce module](/modules-v2/ecommerce/) and [Core module](/modules-v2/core/).
- [E-commerce specialist role guide](/guides/roles/ecommerce-specialist/).
