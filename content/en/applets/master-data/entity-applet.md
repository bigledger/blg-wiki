---
title: "Entity Maintenance"
description: "Reference for the Entity Maintenance applet — the type-agnostic view of the shared entity master (one record can be customer, supplier, employee and merchant at once) with its Payment Config, Tax, Address, Contact, Intercompany Branch and Company Linking tabs, plus the Entity, Customer, Employee and Supplier category trees."
applet_code: "entity-maintenance-applet"
applet_repo: "blg-applet-akaun-platform-entity-applet"
modules: [core, purchasing, hr-payroll, claims]
related_applets: [customer-maintenance-applet, supplier-applet-1, employee-applet, merchant-applet, organisation-applet, tax-configuration-applet, cashbook-applet, tenant-admin-applet]
guides: []
sources:
  configuration:
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/app.routing.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/models/menu-items.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/resolver/permission.resolver.ts
    - akaun_master.bl_applet_client_side_perm_dfn (applet entity-maintenance-applet — no rows)
  fields:
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-listing/entity-listing.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/models/advanced-search-models/entity.model.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/models/entity.mappers.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/models/entity-constants.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/shared-utilities/models/entity-constant.model.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-create/entity-create.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-create/entity-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-create/entity-create-main/entity-create-main.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-create/entity-create-main/entity-create-main.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-edit.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-edit.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-login/entity-login.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-login/login-create/login-create.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-login/login-create/login-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-payment-config/entity-payment-config.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-payment-config/payment-config-create/payment-config-create.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-payment-config/payment-config-create/payment-config-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-tax/entity-tax.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-tax/tax-create/entity-tax-create.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-tax/tax-create/entity-tax-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-address/entity-address.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-address/address-create/entity-address-create.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-address/address-create/entity-address-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-contact/entity-contact.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-contact/contact-create/entity-contact-create.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-contact/contact-create/entity-contact-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-category/entity-category.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-category/category-add/category-add.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-intercompany-branch/entity-intercompany-branch.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-intercompany-branch/intercompany-branch-create/intercompany-branch-create.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-intercompany-branch/intercompany-branch-create/intercompany-branch-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-intercompany-branch/intercompany-branch-edit/intercompany-branch-edit.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-company/entity-company-listing/entity-company-listing.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-company/entity-company-listing/entity-company-create/entity-company-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-company/entity-company-listing/entity-company-edit/entity-company-edit.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-company/entity-company-listing/entity-company-edit/entity-company-edit.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/credit-termslimits-main/credit-termslimits-main.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/credit-termslimits-main/credit-terms/credit-terms.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/credit-termslimits-main/credit-terms/credit-terms.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/credit-limits-main/credit-limits-main.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/credit-limits-main/credit-limits/credit-limits.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/credit-limits-main/credit-limits/credit-limits.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/category-entity/entity-category-create/entity-cat-create.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/category-entity/entity-category-create/entity-cat-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/category-entity/entity-category-edit/entity-cat-edit.component.html
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/category-entity/entity-category-listing/category-listing.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/category-customer/customer-category-create/customer-cat-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/category-employee/employee-category-create/employee-cat-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/category-supplier/supplier-category-create/supplier-cat-create.component.ts
  lifecycle:
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/state-controllers/entity-controller/store/effects/entity.effects.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/state-controllers/entity-controller/store/actions/entity.actions.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/state-controllers/entity-controller/store/reducers/entity.reducers.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/facades/view-column.facade.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityPaymentMethodDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityBranchHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntitySubjectLinkDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/CompBranchLocationEntityLinkDco/CompBranchLocationEntityLinkDco.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/label/LabelHdrDataConsistencyObject.java
  troubleshooting:
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-login/entity-login.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-login/login-create/login-create.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-edit.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-create/entity-create-main/entity-create-main.component.ts
    - blg-applet-akaun-platform-entity-applet/micro-fe/projects/akaun-platform/applets/entity-applet/src/app/components/entity-container/entity-edit/entity-company/entity-company-listing/entity-company-create/entity-company-create.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntitySubjectLinkDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/label/LabelHdrDataConsistencyObject.java
    - gh:bigledger/blg-applet-akaun-platform-entity-applet#5
    - gh:bigledger/blg-int-general-task#6638
    - gh:bigledger/blg-wiki#166
tags:
- entity-management
- master-data
- customer-supplier
- credit-control
- configuration
weight: 200
---

## Overview

Entity Maintenance is the **type-agnostic view of BigLedger's entity master**. Every customer, supplier, employee and merchant is one row in the same table (`bl_fi_mst_entity_hdr`) with four flags — `is_customer`, `is_supplier`, `is_employee`, `is_merchant` — and this applet is the one place where you can create a record with any combination of those flags, or see all of them in a single listing regardless of type. The dedicated applets ([Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Employee Maintenance](/applets/master-data/employee-applet/), [Merchant](/applets/master-data/merchant-applet/)) edit the same rows through a richer, type-specific form.

It is opened by master-data administrators who need the cross-type view (for example, to turn an existing customer into a supplier as well), and by whoever maintains the four category trees — Entity, Customer, Employee and Supplier categories — that the type-specific applets tag their records with.

{{< callout type="warning" >}}
**Use this applet for the header, the four category trees, Payment Config, Tax, Address, Contact, Company Linking and Intercompany Branch.** Four of its tabs do not persist anything in the current code: **Entity Category** (on the edit form), **Login**, **Credit Term** and **Credit Limit**. The Settings screens (Field Settings, Default Selection, Personalisation) also save nothing. Details and citations are under [Configuration](#configuration) and [Lifecycle and effects](#lifecycle-and-effects); use the type-specific applets for those features.
{{< /callout >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Companies for the Company Linking tab; branches (and their company) for the Intercompany Branch tab |
| Upstream | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Tax codes, filtered by country, offered on the Tax tab |
| Upstream | [Cashbook](/applets/master-data/cashbook-applet/) | Settlement methods are the *Payment Type* choices on the Payment Config tab |
| Upstream | [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) | Confirmed logins that the Login tab looks up by e-mail (the tab cannot save the link — see below) |
| Sibling | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/), [Supplier](/applets/master-data/supplier-applet-1/), [Employee Maintenance](/applets/master-data/employee-applet/), [Merchant](/applets/master-data/merchant-applet/) | Same table, same rows; each sibling edits its own type and adds the type-specific tabs (e-Invoice, credit control, categories, logins, spending limits…) |
| Downstream | Sales, purchase, receivables and payables documents; claims; payroll | Pick the entity by type; the AR / AP type, currency, addresses, contacts and payment methods maintained here are read at document time |

Modules: Core, Purchasing, HR & Payroll, Claims.

## Screens and menus

Left menu (route `applets/wavelet/erp/entity/…`; the older `applets/wavelet/erp/entity` URL redirects to it):

| Menu | What it is for |
|---|---|
| **Entity** | Search, create and edit entities of any type |
| **Entity Category** | Tree of `ENTITY_CATEGORY` labels in the `ENTITY_CATEGORIES` label list |
| **Customer Category** | Tree of `CUSTOMER_CATEGORY` labels in the `CUSTOMER_CATEGORIES` list — the same categories the Customer Maintenance applet tags customers with |
| **Employee Category** | Tree of `EMPLOYEE_CATEGORY` labels in the `EMPLOYEE_CATEGORIES` list — as used by Employee Maintenance |
| **Supplier Category** | Tree of `SUPPLIER_CATEGORY` labels in the `SUPPLIER_CATEGORIES` list — as used by the Supplier applet |

Gear (Settings) menu: **Field Settings** and **Default Selection** under *System Configuration*. The routing also registers `settings/webhook`, `settings/feature-visibility` and the shared Permission Set / User / Team / Role permission listings, but the settings menu does not list them; they are reachable only by typing the URL. **Personalisation** offers a per-user *Default Selection*.

### Entity listing

Columns: Entity Name, Entity Ext Type (the type flags joined — for example `CUSTOMER, EMPLOYEE`), Entity Type (`CORPORATE` / `INDIVIDUAL`), Currency (from the record's `CURRENCY` extension), Status, Creation Date, Modified Date; newest modification first. The advanced search offers a keyword (matched against the name and the customer / supplier / employee / merchant codes), Entity Type, Status and a Modified Date range. The **+** button opens the create form; clicking a row opens the edit form.

{{< callout type="info" >}}
**Two "type" columns.** The listing's *Entity Ext Type* is the business role (customer / supplier / employee / merchant) and *Entity Type* is the legal form (corporate / individual). On the create and edit forms the same two fields are labelled **Type** and **Entity Type** respectively.
{{< /callout >}}

### Create form

A single **Main** tab. **CREATE** is enabled only while every required field is valid (see [Fields](#fields)).

### Edit form

Tabs, in order: **Main**, **Entity Category**, **Login**, **Payment Config**, **Tax**, **Address**, **Contact**, **Intercompany Branch**, **Company Linking**, **Remark**, **Credit Term and Limit** (with inner Credit Term and Credit Limit tabs). A **Branch** tab exists in the template but is commented out.

How the tabs save differs, and it matters:

- **Update** (header button) saves the Main tab, the Remark, and every row you added on the **Tax**, **Address** and **Contact** tabs — those tabs only stage rows in memory until you press Update (`entity-edit.component.ts` `onSave()`, L462-691).
- **Payment Config**, **Company Linking** and **Intercompany Branch** save immediately through their own services when you press Add / Save inside the tab.
- **Entity Category**, **Login**, **Credit Term** and **Credit Limit** have Add / Save buttons that persist nothing (see [Lifecycle and effects](#lifecycle-and-effects)).
- There is no delete: the *Remove* button is commented out of the template.

### Category screens

Each of the four category menus is a listing (Category Code, Category Name, Level Value, Type, Creation Date, Modified Date, Status; keyword search plus Status and Modified Date filters) with a create panel (Category Code, Category Name, Description — all mandatory — and an optional parent picked from the existing tree) and an edit panel that adds **Status**. The first time a category of a given kind is created the applet also creates the label list it belongs to (for example `ENTITY_CATEGORIES`, label type `ENTITY_CATEGORY_TYPE`).

{{< figure src="/images/entity-applet/employee-category-listing.png" alt="Employee Category Listing with Category Code, Category Name, Type, Level Value, Creation Date, Modified Date and Status columns" caption="Employee Category listing. The Entity, Customer and Supplier category screens are identical apart from the Type column value." >}}

## Configuration

### Before you can use it

- **Companies and branches** in the [Organisation applet](/applets/master-data/organisation-applet/) — Company Linking picks companies; Intercompany Branch picks a branch and derives its company.
- **Tax codes** in [Tax Configuration](/applets/master-data/tax-configuration-applet/) — the Tax tab lists the tax types and codes of the chosen country (`tax_country` criteria, `entity-tax-create.component.ts` L103-107); with no codes for that country the Tax Type list is empty.
- **Settlement methods** in the [Cashbook applet](/applets/master-data/cashbook-applet/) — they are the *Payment Type* options on Payment Config; the chosen method's guid is stored as the payment method's `item_guid`.
- **Entity code prefixes** — this applet never sends a customer / supplier / employee / merchant code, so the backend generates one for every flag that is set, from the `CUSTOMER_ID` / `SUPPLIER_ID` / `EMPLOYEE_ID` / `MERCHANT_ID` running numbers plus the tenant's per-type prefix (`EntityDataConsistencyObject` `setRunningNumbers` L1352-1375, `buildEntityCode` L1400-1410). Set the prefixes before you create entities if you want codes like `C000123`.

### Applet settings

Settings live in two **applet-local** screens in this repo — `settings/field-settings` (`FieldConfigurationComponent`) and `settings/default-selection` (`DefaultSettingsComponent`) — plus a per-user `personalization/personal-default-selection`. **None of them is functional**, and no component in the applet reads any applet setting:

| Screen | What you see | What happens |
|---|---|---|
| Field Settings | Eight slide toggles in two panels — *Lines Settings*: Unit Discount, SST/VAT/GST, WHT, Blanket Order; *Department Settings*: Segment, G/L Dimension, Profit Center, Project — and a **SAVE** button | The toggles are not bound to any form control and the button has no click handler (`field-configuration.component.html` L2, L14-46; the component class is empty). Nothing is saved |
| Default Selection | *Default Branch* and *Default Location* pickers and **SAVE** | The pickers write `DEFAULT_BRANCH` / `DEFAULT_LOCATION` into an applet container that is never loaded (the load subscription is commented out, `default-settings.component.ts` L31-39), so choosing a value fails on an undefined container, and **SAVE** emits an output that no parent listens to because the route renders the component directly (`app.routing.ts` L56-59) |
| Personalisation › Default Selection | The same two pickers under *User Default Settings — This will override Applet Default Settings* | Same code, same result (`personal-default-settings.component.ts` L31-39) |

No exposed control passes the declared / rendered / persisted / consumed test (routes, settings components and every `appletSettings`, `HIDE_*`, `SHOW_*`, `DEFAULT_*` read in the applet checked at commit 71162733). If you need hidden fields, mandatory-field switches or default currency / country / credit terms, they exist in [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) and [Employee Maintenance](/applets/master-data/employee-applet/), not here.

### Document behaviour settings

Not applicable — this is a master-data applet with no document statuses, posting or printables.

### Feature visibility / permissions

- **Client-side permissions:** `bl_applet_client_side_perm_dfn` holds **no rows** for `entity-maintenance-applet`, and the applet checks no `SHOW_*` codes. The Feature Visibility route is the shared *Manage Team Access* screen only.
- **Server-side permissions:** the Permission Set / User / Team / Role routes are the shared containers; this applet's `PermissionResolver` maps permission targets to the Applet, Branch, Company, Currency, Customer, Employee, Entity, Entity Login, GL Code, Label / Label List, Location, Merchant, Settlement Method, Supplier, Tax Code, Team and Tenant lookups.

## Fields

### Create — Main tab

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Entity Name | `name` | Yes | Max 255 |
| Status | `status` | Yes | `ACTIVE` / `INACTIVE`; defaults to `ACTIVE` |
| Type | The role flags, multi-select | Yes | `CUSTOMER`, `SUPPLIER`, `EMPLOYEE`, `MERCHANT`; saved as `is_customer` … `is_merchant`. Selecting `EMPLOYEE` clears *Entity Type* and restricts it to `INDIVIDUAL` (hint: "Please uncheck Employee Type for Corporate dropdown") |
| Entity Type | `txn_type` | Yes | `CORPORATE` / `INDIVIDUAL`; backend rejects anything else (`ENTITY_HDR_OBJECT_TXNTYPE_DOES_NOT_EXISTS`, L144) |
| Identity Type | `id_type` | Yes when `INDIVIDUAL` | `PASSPORT` / `IDENTITY_CARD`; shown for individuals only |
| ID Number / Company Registration Number | Identity or registration number | Yes | Label follows *Entity Type*; stored as the `ID_NO` extension (string) |
| Company Tax Registration ID | Tax registration | No | Shown for `CORPORATE` only; stored as the `TAX_REG_NO` extension |
| Currency | Document currency | Yes | Searchable list; the home currency is listed first; stored as the `CURRENCY` extension (`{currency}`) |
| Description | `descr` | No | Max 255 |
| AR / AP Type | `default_arap_type` | Yes | `AR_TRADE`, `AR_OTHER`, `AR_MERCHANT`, `AP_TRADE`, `AP_OTHER`, `AP_MERCHANT`, `AP_EMPLOYEE`; backend requires it (`…DEFAULT_ARAP_TYPE_IS_NULL_OR_EMPTY`, L247) |

### Edit — Main tab

The same fields plus **Tax Registration Number** (label changes to *Company Tax Registration Number* for `CORPORATE`), **Phone Number**, **Email** (both max 255, no format check), and read-only **Created By**, **Creation Date**, **Modified By**, **Modified Date**. Picking `INDIVIDUAL` defaults *Identity Type* to `IDENTITY_CARD` when empty. The *Currency* field is shown and marked required, but **Update does not write it back** — currency can only be set on create (see Troubleshooting).

### Edit — other tabs

| Tab | Fields (mandatory in bold) | Writes |
|---|---|---|
| Entity Category | Tick categories from the category grid (Category Code, Name, Level Value, dates, Status) | Nothing — the selection is dispatched to an action no reducer handles |
| Login | **User email** (Verify looks up a `USER_CONFIRMED` e-mail login), **Rank** (`OWNER`, `ADMIN`, `MANAGER`, `MEMBER`, `GUEST`, `VISITOR`, `ANNONYMOUS`), **Status** | Attempts `bl_fi_mst_entity_login_subject_link` but the entity guid is never filled in, so the backend rejects it |
| Payment Config | **Payee Residential Status** (`RESIDENT` / `NON-RESIDENT`), **Payment Type** (a settlement method), **Country**, Bank (a fixed list of Malaysian banks), Bank Identifier Code (settlement type: `BANK_TRANSFER`, `CASH`, `CHEQUE`, `CREDIT_CARD`, `E_WALLET`, `FPX_EMANDATE`, `PAYMENT_GATEWAY`, `MEMBERSHIP_POINT_CURRENCY`, `OPEN_CREDIT`, `OTHERS`, `VOUCHER`), Bank Acc No., Bank Acc Holder Name, IBN Number, Account Expiry | `bl_fi_mst_entity_payment_method` (immediately) |
| Tax | **Country** (Malaysia, Singapore, Thailand, Indonesia), **Tax Type**, **Tax Code**, **Tax Rate (%)**, **Tax Option** (`INCLUDE TAX` / `EXCLUDE TAX`) | A `TAX_DETAILS` extension (JSON) — on Update |
| Address | **Address Name**, **Address Type** (`BILLING_ADDRESS` / `SHIPPING_ADDRESS`), **Address Line 1**, lines 2-5, **Country**, **State**, **City**, **Postcode** | An `ADDRESS` extension (JSON) — on Update |
| Contact | **Contact Name**, **Contact ID**, **Designation/Position**, Office No, Extension No, **Mobile No**, Fax No, Phone Number, Email, Other No | A `CONTACT` line in `bl_fi_mst_entity_line` (position and numbers in `contact_json`) — on Update |
| Intercompany Branch | **Branch** (picker; the Company field fills from the branch), Selected Entity (read-only), Description | `bl_fi_mst_entity_branch_hdr` (immediately); the edit panel changes the description |
| Company Linking | Tick companies (Name, Code, Email) | `bl_fi_mst_comp_branch_location_entity_link` (immediately); the edit panel shows Code, Name, Registration No. and lets you set the link's **AR/AP Type** or delete the link |
| Remark | Rich-text remark | An `ENTITY_REMARK` extension (JSON) — on Update |
| Credit Term | **Credit Term Code**, **Credit Term Name**, **Status**, Set Year / Month / Day, Add Year / Month / Day | Nothing — `onSave()` only resets the form |
| Credit Limit | **Credit Limit Code**, **Credit Limit Name**, **Status**, **Currency**, Credit Limit Amount | Nothing — `onSave()` only formats the amount |

The Credit Term and Credit Limit listings read `CREDIT_TERMS` / `CREDIT_LIMITS` extensions that nothing in this applet writes; credit control is maintained in [Customer Maintenance](/applets/master-data/customer-maintenance-applet/).

## Lifecycle and effects

This applet writes master data; nothing here posts to the ledger or moves stock.

- **Status** is `ACTIVE` or `INACTIVE` in this applet's forms; the backend also accepts `TEMP`, which the sibling applets can set. Changing the status is a normal Update — no other effect is triggered.
- **Create** is one POST of the entity container (header + `CURRENCY`, `ID_NO`, `TAX_REG_NO` extensions). `EntityDataConsistencyObject` requires a status (L126), a `txn_type` of `INDIVIDUAL` or `CORPORATE` (L144) and a default AR / AP type (L247), then generates the per-type codes for every flag that is set (L1352-1375). Because the applet sends no codes, the `…CODE_SHOULD_NOT_BE_SET` and `…CODE_ALREADY_EXISTS` rules (L153-195) cannot fire from here.
- **Update** first re-reads the entity to copy the current revision of the header and of every extension and line, then PUTs the whole container (`entity.effects.ts` L62-110). Extensions and lines are validated for a header guid, status and revision (`ENTITY_EXT_OBJECT_*`, `ENTITY_LINE_OBJECT_*`, L268-575). A success toast "The Entity has been updated" returns you to the listing.
- **Payment methods** POST / PUT `bl_fi_mst_entity_payment_method`; `EntityPaymentMethodDataConsistencyObject` requires the entity header (L55-61), a country code that exists (L89-96), and — when given — an existing settlement item and bank header (L72, L81).
- **Company links** POST / PUT / DELETE `bl_fi_mst_comp_branch_location_entity_link`; `CompBranchLocationEntityLinkDco` requires an existing company (L67-71) and entity (L90-94). The client refuses to add a company that is already linked (toast "…is already linked to this entity") before calling the backend.
- **Intercompany branches** POST / PUT `bl_fi_mst_entity_branch_hdr`; `EntityBranchHdrDataConsistencyObject` requires an existing entity (L50-56) and branch (L65).
- **Logins** POST `bl_fi_mst_entity_login_subject_link`; `EntitySubjectLinkDataConsistencyObject` requires the entity guid (L64) and subject guid (L72). The create panel never sets the entity guid (`login-create.component.ts` L62, L149), so every attempt from this applet fails; the listing itself filters on a hard-coded entity guid (`entity-login.component.ts` L73) and therefore never shows the open entity's logins.
- **Categories** (all four menus) POST / PUT `bl_fi_mst_label_hdr` with `txn_type` `ENTITY_CATEGORY` / `CUSTOMER_CATEGORY` / `EMPLOYEE_CATEGORY` / `SUPPLIER_CATEGORY`, status `ACTIVE`, an optional `guid_parent`. `LabelHdrDataConsistencyObject` requires code, name, txn_type and status (L51, L71, L78, L85), an existing parent (L101), and a **code that is unique across every label in the tenant** — the check is `LabelQueryCriteria().withCode()` with no list or type filter (L56-66).
- **Tagging an entity with a category** is not persisted by this applet: the Entity Category tab's selection is dispatched as `[Item Applet] Get Item Category Container`, an action with no reducer, and Update does not include it.
- **No webhook or job** is triggered from this applet's code; the Webhook route is the shared configuration screen.

## Related applets

- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — the customer view of the same rows, with the working category, login, credit-term / credit-limit, e-Invoice and file-import features that this applet lacks.
- [Supplier](/applets/master-data/supplier-applet-1/) — the supplier view; uses the Supplier Category tree maintained here.
- [Employee Maintenance](/applets/master-data/employee-applet/) — the employee view; uses the Employee Category tree maintained here and adds logins, branch / company linking and spending limits.
- [Merchant](/applets/master-data/merchant-applet/) — the merchant view (`AR_MERCHANT` / `AP_MERCHANT`).
- [Organisation](/applets/master-data/organisation-applet/) — companies and branches for Company Linking and Intercompany Branch.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — the tax codes offered per country on the Tax tab.
- [Cashbook](/applets/master-data/cashbook-applet/) — settlement methods, the *Payment Type* list on Payment Config.
- [Tenant Admin](/applets/external-tenant-admin/tenant-admin-applet/) — the confirmed logins the Login tab verifies against.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| **CREATE** stays disabled after choosing `EMPLOYEE` in *Type* | Selecting `EMPLOYEE` clears *Entity Type* and limits it to `INDIVIDUAL` (`entity-create-main.component.ts` L177-194) | Re-select `INDIVIDUAL` in *Entity Type*; to create a corporate record, remove `EMPLOYEE` from *Type* |
| Currency changed on the edit form reverts after **Update** | `onSave()` never writes the `CURRENCY` extension (`entity-edit.component.ts` L462-691) | Set the currency when creating; to change it later use the sibling applet for that type |
| Categories ticked on the **Entity Category** tab disappear after **Update** | The selection is dispatched to an action with no reducer and is not part of the Update payload | Tag the record in Customer / Supplier / Employee Maintenance |
| **Login** tab shows logins that do not belong to this entity, or **Add** fails | The listing filters on a hard-coded entity guid (`entity-login.component.ts` L73); the create panel posts an empty `entity_hdr_guid`, rejected by `ENTITY_SUBJECT_LINK_OBJECT_ENTITY_HDR_GUID_IS_NULL_OR_EMPTY` (`EntitySubjectLinkDataConsistencyObject` L64) | Link logins on the Login tab of Customer / Supplier / Employee Maintenance |
| **Credit Term** / **Credit Limit** rows never appear | Both create forms discard the input; the listings read `CREDIT_TERMS` / `CREDIT_LIMITS` extensions nothing writes | Maintain credit terms and limits in Customer Maintenance |
| Field Settings or Default Selection do not save | Static template / never-loaded container (see [Applet settings](#applet-settings)) | Nothing to configure here; the switches you are looking for live in the sibling applets |
| Category create fails with `LABEL_HDR_OBJECT_CODE_ALREADY_EXISTS` although no category of that kind has the code | Label codes are unique across the whole tenant — item categories, customer categories and every other label share the namespace (`LabelHdrDataConsistencyObject` L56-66) | Choose a code not used by any other label |
| Category create fails with `LABEL_HDR_OBJECT_GUID_PARENT_DOES_NOT_EXIST` | The chosen parent was deleted or belongs to another tenant context | Refresh the tree and pick the parent again |
| Tax tab: *Tax Type* list is empty after choosing a country | No tax codes exist for that country (`tax_country` filter) | Create them in Tax Configuration |
| Payment Config: *Payment Type* list is empty | No settlement methods are defined for the tenant | Create them in the Cashbook applet |
| Payment Config save fails with `ENTITY_PAYMENT_METHOD_OBJECT_COUNTRY_CODE_*` | Country is mandatory and must be a known code (L89-96) | Pick a country from the list |
| "… company is already linked to this entity" when adding a company | Client-side check before the POST (`entity-company-create.component.ts` L196-203, L221-229) | Nothing to do — open the existing link to change its AR / AP type |
| Create fails with `ENTITY_HDR_OBJECT_TXNTYPE_DOES_NOT_EXISTS` from an integration | `txn_type` must be exactly `INDIVIDUAL` or `CORPORATE` (L144) | Fix the calling payload; the UI cannot send anything else |
| The record you need is missing from a sales / purchase picker | The relevant flag (`is_customer` / `is_supplier`) is not set on the entity, or the status is `INACTIVE` | Add the type in *Type* on the Main tab and set the status to `ACTIVE`; the backend then generates the missing code |

## Related documentation

- [Core module](/modules-v2/core/) · [Purchasing module](/modules-v2/purchasing/) · [HR & Payroll module](/modules-v2/hr-payroll/) · [Claims module](/modules-v2/claims/)
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — the fullest description of the shared entity model and its settings
