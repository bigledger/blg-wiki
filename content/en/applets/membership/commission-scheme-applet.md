---
title: "Commission Scheme"
description: "Master data for rule-based sales commission and membership-point schemes: who qualifies (header and line rules), how much is earned per level (treatment), plus the Sales Groups and tiered Pricing Models the schemes reference."
applet_code: "Commission_Scheme"
applet_repo: "blg-applet-wavelet-commission-scheme-applet"
modules: [membership, pos, ecommerce]
related_applets: [sales-commission-applet, membership-admin-applet, membership-points-currency, cp-commerce-admin-applet, internal-sales-invoice-applet, internal-sales-order-applet, internal-receipt-voucher-applet, pos-general-applet, employee-applet, customer-applet, inv-item-maintenance-applet, organisation-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/app.routing.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/models/organisation-constants.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-edit/commission-scheme-edit.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/resolver/permission.resolver.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntCommissionPermissions.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/CommissionScheme/CommissionSchemeController.java
  fields:
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-create/commission-scheme-create.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-create/commission-scheme-create.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-edit/main-details/main-details.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-edit/rules/rules.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-edit/rules/rules.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-edit/rules/rules-add/rules-add.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-edit/rules/rules-add/rules-add.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/all-rules/date-validity-rule/date-validity-rule.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/all-rules/document-type-rule/document-type-rule.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/all-rules/entity-type-rule/entity-type-rule.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/all-rules/line-rule-listing/line-rule-listing.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/all-rules/line-rule-listing/line-rule-listing.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/all-rules/regex-rule/regex-rule-add/regex-rule-add.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/all-rules/employee-category-rule/employee-category-rule-add/employee-category-rule-add.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-edit/treatment/treatment.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/commission-scheme-container/commission-scheme-edit/treatment/treatment.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/models/constants/rules.constants.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/models/constants/treatment.constants.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/models/rules.model.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/sales-group-container/group/group.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/sales-group-container/group/group.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/sales-group-container/salesman/salesman-listing.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/sales-group-container/salesman/salesman-link-create/salesman-link-create.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/sales-group-container/salesman/salesman-link-edit/salesman-link-edit.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/pricing-model-container/details/details.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/pricing-model-container/details/details.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/pricing-model-container/pricing-model-line/line-details/line-details.component.html
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/pricing-model-container/pricing-model-line/line-details/line-details.component.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/components/utilities/validators/pricing-model-line.validator.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/state-controllers/pricing-model-controller/store/effects/pricing-model-line.effects.ts
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/state-controllers/commission-scheme-controller/store/effects/commission-scheme.effects.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_commission_scheme_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_sale_commission_pricing_model_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_sale_commission_pricing_model_line.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_sfa_sales_group_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_sfa_sales_group_entity_link.java
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeMatchingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeValidationEngine.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeGenericRuleNode.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeItemRuleNode.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeGenDocLineItemRuleNode.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeTreatmentEngine.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeJsonMapper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/CommissionSchemeDataConsistencyObjects/CommissionSchemeHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/sfa/SfaSalesGroupHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/sfa/SfaSalesGroupEntityLinkDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/saleCommission/SaleCommissionPricingModelLineDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionReport/CommissionPostingServices.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/CommissionSchemeUows/CommissionSchemeHdrUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/CompanyUows/CompanyUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/CommissionReportControllers/CommissionPostingBackofficeController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/commission/SalesCommissionPostingJobProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/commission/MembershipPointsCommissionQueueProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/commission/MembershipPointsCommissionGetGenDocProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/commission/MembershipPointsCommissionGenDocToCommissionReportProcessor.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_cms_website_commission_scheme_link.java
  troubleshooting:
    - blg-applet-wavelet-commission-scheme-applet/micro-fe/projects/wavelet-erp/applets/commission-scheme-applet/src/app/models/constants/snack-bar.constants.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/errorCodesConstants/CommissionSchemeErrorCodeConstants.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeGenericRuleNode.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/commissionScheme/CommissionSchemeTreatmentEngine.java
    - gh:bigledger/blg-applet-wavelet-commission-scheme-applet#5
    - gh:bigledger/blg-wiki#46
tags:
- membership
- sales
- commission
- pricing-model
- sales-group
- mlm
weight: 20
aliases:
  - /applets/sales-workflow/commission-scheme-applet/
---

## Overview

The Commission Scheme applet is where you define **how sales commissions and membership points are earned**. A scheme is master data: a set of **rules** that decide which sales documents qualify (by branch, company, document type, date, customer type, member class, sales agent category, items or item categories) and a **treatment** that says how much is paid per downline level (a price source, an operator and a value, optionally through a formula or a tiered Pricing Model). Two supporting masters live in the same applet: **Sales Groups** (named groups of employees) and **Pricing Models** (range-to-rate tables).

The applet itself never pays anything. Active schemes are read by two backend processes: the sales-commission posting run started from the [Sales Commission Applet](/applets/sales-workflow/sales-commission-applet/) (cash commission for sales agents and MLM uplines) and the scheduled membership-points run described on the [Membership Admin Applet](/applets/membership/membership-admin-applet/) page (points on qualifying bills). A scheme can also be attached to an e-commerce website in [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) and to an MLM program in Membership Admin.

## Where it fits

| Direction | Applet / data | Why |
|---|---|---|
| Upstream (master data the rules reference) | [Organisation](/applets/master-data/organisation-applet/) (companies, branches), [Employee](/applets/master-data/employee-applet/) (sales agents, employee categories, sales-group members), [Customer](/applets/master-data/customer-applet/) (entity type flags), [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/) (items, item categories), [Membership Admin](/applets/membership/membership-admin-applet/) (member classes, member labels, MLM lineage), [Membership Points Currency](/applets/membership/membership-points-currency/) (points currency on the treatment) | Every rule and treatment picks from these lists |
| Upstream (documents evaluated) | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [POS General](/applets/sales-workflow/pos-general-applet/) cash bills, [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | The only server document types a Document Type rule can match (`INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_CASHBILL`, `INTERNAL_SALES_ORDER`, `INTERNAL_RECEIPT_VOUCHER`) |
| Downstream (consumers) | [Sales Commission Applet](/applets/sales-workflow/sales-commission-applet/) | Runs the posting that turns matching schemes into commission transaction lines and commission reports |
| Downstream (consumers) | [Membership Admin Applet](/applets/membership/membership-admin-applet/) | Scheduled membership-points run awards points from the Level 0 *Membership Points* treatment; MLM programs reference a scheme |
| Downstream (consumers) | [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) | Website › Commission Scheme tab stores a `bl_cms_website_commission_scheme_link` |

## Screens and menus

The applet root route is `applet/tnt/wavelet/erp/commission-scheme-applet`. The left menu has three listings plus Settings and Personalization.

| Menu item | Screen | What it holds |
|---|---|---|
| **Commission Scheme** (default landing) | Listing (code, name, description, created date, modified date, status) with search and an advanced filter (status, created-date range, modified-date range, keyword). `+` opens **Create Commission Scheme**; clicking a row opens **Edit Commission Scheme** with tabs **Main Details**, **Rules - Doc Hdr**, **Rules - Multi Line**, **Rules - Single Line**, **Treatment**, a RESET/SAVE pair and a DELETE button that must be clicked twice within three seconds | `bl_fi_commission_scheme_hdr` — rules are stored in `conditional_filter_json`, treatments in `treatment_json` |
| **Sales Group** | Listing (code, name, creation date, modified date, status). Edit has two tabs: **Group** (the header) and **Salesman** (linked employees with a Weightage column) | `bl_sfa_sales_group_hdr`, `bl_sfa_sales_group_entity_link` |
| **Pricing Model** | Listing (code, name, logic code, logic type, dates). Edit shows the header plus a line grid (range from, range to, commission multiplier, commission absolute, membership point multiplier / value) | `bl_fi_sale_commission_pricing_model_hdr`, `bl_fi_sale_commission_pricing_model_line` |
| **Settings** | Feature Visibility (landing), Field Settings, Default Selection, Webhook, Permission Wizard / Permission Set / User / Team / Role Permission listings, Release Notes | Shared platform screens except Field Settings and Default Selection |
| **Personalization** | Default Selection, Sidebar | Per-user |

Rules are added from inside the Edit screen: on a Rules tab, `+` opens **Add Rule - Doc Hdr / Multi Line / Single Line**, where a **Rule Type** dropdown reveals the form for that rule type. Adding a rule, adding filter values to a rule, or editing a treatment only updates the draft in the browser; nothing reaches the server until you click **SAVE** on the Edit screen (every snackbar ends with "Please save changes").

No screenshots are embedded on this page: every capture under `static/images/commission-scheme-applet/` shows staff names, an e-mail address or a real company name in the listing panel (see the lane findings).

## Configuration

### Before you can use it

- **Companies and branches** exist in [Organisation](/applets/master-data/organisation-applet/) — needed for Company and Branch rules.
- **Employees** exist in the [Employee Applet](/applets/master-data/employee-applet/) with `is_employee` set: only such entities appear in the Sales Group › Salesman picker, and the **Employee Category** rule matches the categories (labels from the `EMPLOYEE_CATEGORIES` list) tagged on the document's sales agent.
- **Items and item categories** exist in [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/) — the Item, Item Category and regex line rules read `item_guid`, `item_code`, `item_name` and the item's categories from the document line.
- **Member classes and labels** exist in [Membership Admin](/applets/membership/membership-admin-applet/); a **points currency** exists in [Membership Points Currency](/applets/membership/membership-points-currency/) if the treatment awards points.
- **Pricing schemes** (`bl_fi_mst_pricing_scheme_hdr`, maintained outside this applet) exist if a treatment uses the *Pricing Scheme* price source; the Treatment tab lists the pricing schemes it can find.
- For the money to be paid, the [Sales Commission Applet](/applets/sales-workflow/sales-commission-applet/) must be installed and run. For points, the company's member-point settings in Organisation (`member_point_award_doc_in`, `member_point_in_doc_status`) decide which document type and posting status the scheduled run picks up.
- API permissions: the endpoints check `TNT_API_COMMISSION_SCHEME_HDR_{READ, CREATE, UPDATE, DELETE, OWNER, ADMIN, MEMBER}` (tenant owner/admin bypasses), and the corresponding `TNT_API_SALE_COMMISSION_PRICING_MODEL_HDR_*` / `_LINE_*` sets for pricing models. The posting and points processors read schemes with `TNT_API_COMMISSION_SCHEME_HDR_READ` under the anonymous system token.

### Applet settings

Settings are **applet-local** — this applet does not use the shared `FieldConfigurationComponent` from blg-shared-utilities. `settings/field-settings` routes to the applet's own 20-line `FieldConfigurationComponent`; `settings/default-selection` to its own `DefaultSettingsComponent`, which saves through `SessionActions.saveMasterSettingsInit` (tenant-wide master settings). Anyone with access to the applet's Settings menu can change them.

Only one key passes all four proofs (declared in `applet-settings.model.ts`, rendered, persisted, and read back by a screen):

| Setting | Where | What it controls | Default | Effect when changed |
|---|---|---|---|---|
| **Details Tab Ordering** (`COMMISSION_SCHEME_DETAILS_TAB_ORDER`) | Settings › Default Selection › *Details Tab Ordering* (drag-and-drop list) | The order of the five tabs on Edit Commission Scheme | Main Details, Rules - Doc Hdr, Rules - Multi Line, Rules - Single Line, Treatment (the hard-coded `detailsTabs` array) | `commission-scheme-edit.component.ts` sorts its panels by the saved order; tabs added later in code are appended at the end |

Rendered and saved but read by nothing in this applet:

- **Default Branch** (`DEFAULT_BRANCH`) and **Default Location** (`DEFAULT_LOCATION`) on the same Default Selection screen. They are written to master settings (picking a branch also copies the branch's `MAIN_LOCATION` into the location control), but no create or edit screen in this applet reads them — commission schemes, sales groups and pricing models have no branch or location field. RESET writes both back to null.

Not functional:

- **Settings › Field Settings** shows eight unbound toggles (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) and a SAVE button wired to nothing. The `AppletSettings` model declares the matching `INCLUDE_*`, `ENABLE_*` and custom-status keys copied from the document applets, but no screen reads or writes them. Treat the screen as a placeholder.
- **Personalization › Default Selection** renders Default Branch / Default Location, but the component never loads the applet container it tries to update (`appletSettings$` subscription is commented out), so choosing a value fails in the browser and SAVE emits nothing usable.

There are no document-behaviour settings: schemes have no posting status, numbering or printables.

### Feature visibility / permissions

The applet's `PermissionResolver` only feeds the shared permission-wizard screens (company, branch, location, entity, applet, tenant, team, hostname, item targets). No `SHOW_*` / `HIDE_*` client-side permission is checked anywhere in the applet code, and the registry seeds **0** `bl_applet_client_side_perm_dfn` rows for `Commission_Scheme` — consistent. Access control is therefore the API permission set listed above plus the shared Feature Visibility screen.

## Fields

### Commission Scheme — Create and Main Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Commission Scheme Code | Identifier of the scheme | Yes | Max 255; the input blocks special characters; read-only after creation ("The code cannot be modified after creation"). The backend `CommissionSchemeHdrDataConsistencyObject` does **not** check uniqueness — two schemes may carry the same code |
| Status | `ACTIVE` / `INACTIVE` | Yes | Defaults to ACTIVE. Only ACTIVE schemes are loaded by the posting and points processes (`getActiveCommissionSchemes` filters `status = ACTIVE`) |
| Commission Scheme Name | Display name | Yes | Max 255, special characters blocked |
| Description | Free text | No | Max 255 on create; character counter |
| Commission Type | `SALES_AGENT` or `MLM` | Yes | Defaults to SALES_AGENT. Decides whether the posting run walks the customer's MLM lineage (see Lifecycle) |
| Created By / Created Date / Updated By / Updated Date | Audit columns | — | Read-only on Main Details |

On CREATE the effect writes the header with all three rule groups set to Rules Logic `AND` / Negation `DISABLED` and one Level 0 treatment whose commission and membership-points price source and operator are `NA`.

### Rules tabs (Doc Hdr, Multi Line, Single Line)

Each tab has two group-level fields and a grid of rules (Rule Name, Rule Type, Negation Logic):

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Rules Logic | `AND` (every rule in the group must pass) or `OR` (any rule) | Yes | Stored as `top_level_logic`; default AND |
| Negation Logic | `ENABLED` inverts the result of the whole group | Yes | Stored as `negation_logic` = `TRUE`/`FALSE`; default DISABLED |

Every rule form carries **Rule Name** (required, max 255) and its own **Negation Logic** (inverts that one rule). Each rule type can be added **once per tab** — a second attempt shows "RuleType already exists. Cannot add rule with same ruleType again" and returns to the tab.

**Rules - Doc Hdr** (document-level; rule types in the dropdown):

| Rule type | Form | What the backend compares it with |
|---|---|---|
| Valid Date Range | Relative Period (period + unit Day(s)/Month(s)/Year(s)) or Absolute Period (From / To dates) | Absolute: document `date_txn` between From and To inclusive (an unparsable bound is ignored). **Relative is not implemented** — it always evaluates false |
| Entity Type | All Entity, or Selected Entity with All Customer / All Supplier / All Employee / All Merchant | "All" passes; "Selected" checks the document customer's `is_customer` / `is_supplier` / `is_employee` / `is_merchant` flags |
| Member Class | Pick member classes | The member on the document (`member_guid`) → membership card → `membership_class_guid` is one of the picked classes; no member on the document → false |
| Member Label | Pick member labels | Passes when the document's member has **any** CRM label link — the picked labels are not compared |
| Company | Pick companies | Document `guid_comp` |
| Branch | Pick branches | Document `guid_branch` |
| Sales Group | Pick sales groups | **Not implemented** in the backend (`// TODO`): the rule always evaluates false, so with Rules Logic AND it disqualifies every document, and with Negation ENABLED it always passes |
| Document Type | Checkboxes Sales Contract, Receipt Voucher, Sales Order, Sales Invoice | Sales Order = `INTERNAL_SALES_ORDER`; Sales Invoice = `INTERNAL_SALES_INVOICE` **or** `INTERNAL_SALES_CASHBILL`; Receipt Voucher = `INTERNAL_RECEIPT_VOUCHER`. **Sales Contract is never evaluated** |
| Employee Category | Pick employee categories (`EMPLOYEE_CATEGORIES` labels) | Categories of the document's sales agent (`sales_entity_hdr_guid`); no sales agent → false |

A Company, Branch, Member Class, Member Label, Sales Group or Employee Category rule saved with an **empty** pick list passes unconditionally (the negation is not applied either).

**Rules - Multi Line** and **Rules - Single Line** (item-level; same dropdown):

| Rule type | Form | Match |
|---|---|---|
| Item | Pick items; Min Quantity, Min Amount (default 0) | `item_guid` of the line |
| Item Category | Pick categories; Min Quantity, Min Amount | Any category of the line's item |
| Item Code Regex / Item Name Regex | Name + Regular Expression rows | Regex found anywhere in `item_code` / `item_name` |
| Category Code Regex / Category Name Regex | Name + Regular Expression rows | Regex found in any of the item's category codes / names |

Only lines with transaction type `PNS` (product and service lines) are considered. *Multi Line* is evaluated on the whole document: the matching lines are collected, then their summed `quantity_base` must be ≥ Min Quantity and summed `amount_txn` ≥ Min Amount (no matching line → rule fails). *Single Line* is evaluated per line during treatment: each line must individually match and meet both minimums, and only matching lines earn commission or points.

### Treatment tab

One block per level; **Level 0 (Self)** always exists, **Add Uplines** appends Level 1 (Parent), Level 2 … up to **10** levels (`MAX_DOWNLINE`); the last level can be deleted.

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Commission › Price Source | Base amount for cash commission | No (default `NA`) | Doc Hdr Standard / Net / Transaction / Open Balance Amount; Doc Line Standard / Net / Transaction Amount; Base Quantity; Price Unit Cost; Pricing Scheme; NA |
| Commission › Operator | How the value is applied | No (default `NA`) | MULTIPLY, ABSOLUTE, ADD, SUBTRACT, PRICING MODEL, FORMULA, NA |
| Commission › Value | Number | No (default 0) | Rate for MULTIPLY (0.05 = 5 %), fixed amount for ABSOLUTE |
| Commission › Pricing Scheme | Shown when Price Source = Pricing Scheme | — | Dropdown of pricing schemes |
| Commission › Formula | Shown when Operator = FORMULA | — | Hint: `{PRICE_SOURCE}*(150-{DAY})/150*0.016` |
| Commission › Pricing Model | Shown when Operator = PRICING MODEL | — | Dropdown of this applet's pricing models |
| Commission › Below Cost | Checkbox, default **checked** | — | Unchecked: line-level commission is zero when the price-source value is below the line's unit moving-average cost |
| Membership Points › Price Source / Operator / Value | Same lists as commission | No (defaults `NA` / `NA` / 0) | Pricing Model and Formula operators have no effect for points |
| Membership Points › Pts Currency | Points currency | — | From [Membership Points Currency](/applets/membership/membership-points-currency/) |
| Membership Points › Validity Period (Days) | Days the points stay valid | No (default 0) | Validity starts at the document's `date_txn` |
| Membership Points › Pricing Scheme | Shown when Price Source = Pricing Scheme | — | |

### Sales Group

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Sales Group Code | Identifier | Yes | Backend rejects a duplicate with `SFA_SALES_GROUP_HDR_OBJECT_SALES_GROUP_CODE_ALREADY_EXISTS` |
| Sales Group Name | Display name | Yes | |
| Description | Free text | No | |
| Status | ACTIVE / INACTIVE | Yes | Default ACTIVE |
| Salesman tab › `+` | Multi-select grid of entities with `is_employee = true` (Salesman Code = employee code, Salesman Name) | — | Creates `bl_sfa_sales_group_entity_link`; linking the same employee twice is rejected with `SFA_SALES_GROUP_ENTITY_LINK_OBJECT_COMPOUND_PK_ALREADY_EXIST` |
| Salesman tab › Weightage | Number on the link edit form (default 0) | No | Stored in the link's `property_json.weightage`; not read by the commission backend |

### Pricing Model

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Pricing Model Code / Name | Identifier and display name | Yes | No uniqueness check in the backend DCO |
| Logic Code | Free text | Yes | Stored only; not read by the treatment engine |
| Logic Type | `TIERED` or `VOLUME` | Yes | Default TIERED; stored only — the engine applies the same first-matching-band lookup for both |
| Line › Range From / Range To | Band boundaries | Yes | Matched as `from ≤ value < to` |
| Line › Commission Operator + Value | MULTIPLY or ABSOLUTE with a number | One of commission or point value | MULTIPLY stores the number in `commission_multiplier`, ABSOLUTE in `commission_value` (the other column is written as 0); the edit form infers the operator from whichever column is > 0 |
| Line › Membership Point Operator + Value | Same pattern | | Stored in `membership_point_multiplier` / `membership_point_value`; **not read** by any backend service |

The line form enforces "Please enter one of the following fields: Commission Value or Membership Point Value".

## Lifecycle and effects

Commission schemes, sales groups and pricing models are master data: no posting status, no journal, no stock. `CommissionSchemeHdrService` validates (guid, entity, audit columns, status, revision) and writes `bl_fi_commission_scheme_hdr`; DELETE issues a delete for the header guid without checking whether websites, MLM programs or existing commission reports still reference it.

### How a scheme is evaluated (`CommissionSchemeMatchingService`)

1. Load every scheme with status ACTIVE.
2. For each scheme, build a `CommissionSchemeValidationEngine` per rule group. **Doc Hdr** and **Multi Line** groups are evaluated against the whole document and both must pass (`matchHdrDocFilter && matchMultiLineDocFilter`). Inside a group the rule results are folded with AND/OR (`top_level_logic`) and then the group negation is applied; an empty group passes.
3. If the scheme has **Single Line** rules, the treatment is computed line by line (only `PNS` lines) and summed; otherwise it is computed once on the document.
4. `evaluateTreatment` keeps a scheme for cash commission only if at least one level has a commission price source ≠ NA **and** operator ≠ NA.

### How the treatment amount is computed (`CommissionSchemeTreatmentEngine`)

- **Price source**: header amounts come from `bl_fi_generic_doc_hdr` (`amount_std`, `amount_net`, `amount_txn`, `amount_open_balance`); line amounts and Base Quantity are summed over the `PNS` lines (or the single line); Price Unit Cost = Σ `cost_ma_price × quantity_base`; Pricing Scheme = the item's `sales_unit_price` in the chosen scheme × `quantity_base`.
- **Operator**: MULTIPLY = source × value; ABSOLUTE = value; ADD / SUBTRACT = source ± value; FORMULA = the expression evaluated with `{PRICE_SOURCE}` replaced by the source (or, for receipt vouchers, the contra amount) and `{DAY}` by the days between the invoice date and the receipt's contra date (0 when there is no contra) — a parse error or a negative result yields 0; NA = 0.
- **PRICING MODEL** is **not** applied in the document path (it returns 0 there). It is applied only by `getCommissionPricingModelValue` on the intermediate transaction lines of a commission cycle (`create-full-commission` in the Sales Commission Applet): the first line whose band contains the summed source value is used, `commission_multiplier` when non-zero, otherwise `commission_value`.
- **Below Cost** unchecked: for line-level commission, if the price-source value is lower than `cost_ma_price ÷ quantity_base` the commission for that line is 0.

### Cash commission (Sales Commission Applet)

`POST …/fi/sales-commission-posting/backoffice-ep/{genDocGuid}` (or the `SALES_COMMISSION_POSTING_JOB_PROCESSOR` queue) calls `CommissionPostingServices.createTxnLines`: it loads the document, rejects it with `GEN_DOC_HAS_BEEN_POSTED` if `posting_sales_commission_queue` is already `POSTED`, finds the matching schemes with a usable treatment, and writes one `bl_fi_sale_commission_intermediate_processing_txn_line` per scheme (per line when Single Line rules or MLM are involved). Then it marks the document `POSTED` in `posting_sales_commission_queue`. Details that matter for scheme design:

- `SALES_AGENT` schemes use the **Level 0** treatment for the document's sales agent (`sales_entity_hdr_guid`).
- `MLM` schemes look up the customer's MLM lineage (`bl_mlm_lineage_hdr`): each upline at level *n* receives the Level *n* treatment, computed per line.
- A **Receipt Voucher** earns commission only through its contra links to invoices (`getByContraForSalesCommission`); an RV with no contra produces nothing. This is the path where `{DAY}` in a formula is meaningful.

### Membership points (scheduled)

`MEMBERSHIP_POINTS_COMMISSION_QUEUE_PROCESSOR` (crontab) → `MembershipPointsCommissionGetGenDocProcessor` selects documents of the company's `member_point_award_doc_in` type at `member_point_in_doc_status` whose `posting_membership_points_commission_queue` is not yet `POSTED` → `MembershipPointsCommissionGenDocToCommissionReportProcessor` evaluates the rules (treatment presence is not checked) and applies only the **first treatment's** Membership Points block ("Supports only 1 treatment"), creating a membership-points commission report with validity from `date_txn` to `date_txn + Validity Period`. `GET …/commission/commission-scheme/calculate-membership-treatment-value/{genDocGuid}` previews the same number for one document.

### Other references

- **CP Commerce Admin** › Website › Commission Scheme stores `bl_cms_website_commission_scheme_link (website_hdr_guid, commission_scheme_hdr_guid)`.
- **Membership Admin** MLM programs carry `commission_scheme_guid` / `commission_scheme_name`.

## Related applets

- [Sales Commission Applet](/applets/sales-workflow/sales-commission-applet/) — runs the posting that reads active schemes and produces commission transaction lines, reports and payouts; the only place a Pricing Model treatment produces a number.
- [Membership Admin Applet](/applets/membership/membership-admin-applet/) — member classes and labels used by header rules, MLM lineage used by `MLM` schemes, MLM programs that reference a scheme, and the company member-point settings that drive the points run.
- [Membership Points Currency](/applets/membership/membership-points-currency/) — the currency picked on the Membership Points treatment.
- [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) — links a scheme to a website.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — the document types a scheme can match; the invoice's sales agent field is the agent paid.
- [Employee](/applets/master-data/employee-applet/), [Customer](/applets/master-data/customer-applet/), [Organisation](/applets/master-data/organisation-applet/), [Inventory Item Maintenance](/applets/inventory-workflow/inv-item-maintenance-applet/) — the masters the rules pick from.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A scheme with a **Sales Group** rule never matches any document | The backend has no evaluation for `SALES_GROUP` (`CommissionSchemeGenericRuleNode` falls through to `false`) | Remove the rule; restrict by **Employee Category** on the sales agent instead, or by Branch / Company. Do not rely on Negation to "fix" it — a negated Sales Group rule passes every document |
| A **Valid Date Range** rule set to *Relative Period* never matches | Only `ABSOLUTE` is implemented; `RELATIVE` returns false | Use Absolute Period with explicit From / To dates |
| **Member Label** rule pays every member, not just the labelled ones | The rule only checks that the member has *some* label link; the picked labels are ignored | Use Member Class, or accept the behaviour until the rule is fixed |
| Commission expected on **Sales Contracts** never appears | The Sales Contract checkbox is stored but never evaluated; only SO, SI/cash bill and RV server types match | Pay on the resulting invoice instead |
| Treatment with Operator **PRICING MODEL** yields 0 in the commission transaction lines | The document path returns 0 for PRICING MODEL; it is applied only during the cycle's full-commission pass on intermediate lines | Run the full commission generation in the Sales Commission Applet, or use MULTIPLY / ABSOLUTE for per-document amounts |
| Points from Level 1 or higher are never awarded | The points run uses the first treatment only | Put the points logic on Level 0 |
| Scheme matches but the commission amount is 0 | Price source or operator left at `NA`, Value 0, a FORMULA that fails to parse or evaluates negative, or *Below Cost* unchecked with a selling price below unit cost | Check the treatment values; test a formula with `{PRICE_SOURCE}` only before adding `{DAY}` |
| An empty Company / Branch / Item rule "applies to everything" | A rule with no picked values passes unconditionally | Pick at least one value or delete the rule |
| "RuleType already exists. Cannot add rule with same ruleType again" | One rule per type per tab | Edit the existing rule (click its row) and add values there |
| Rule or treatment changes vanished after navigating away | Rules and filter values only live in the browser draft until **SAVE** on Edit Commission Scheme | Save before leaving the scheme |
| Two schemes with the same code | The backend does not enforce code uniqueness | Rename one; downstream reports show the scheme guid, so duplicates are confusing rather than blocking |
| Re-running the posting for a document fails with `GEN_DOC_HAS_BEEN_POSTED` | `posting_sales_commission_queue` is already `POSTED` for that document | Use the regenerate endpoint from the Sales Commission Applet rather than re-posting |
| Field Settings / Personal Default Selection do nothing | Placeholder screens (see Configuration) | Nothing to configure there |
| Applet build or deployment problems after the Angular 14 migration | Tracked in the applet repository (issue #5, closed) | Upgrade to the current build |

## Related documentation

- [Membership module](/modules/membership/) — core concepts and the MLM use case.
- [Sales Commission Applet](/applets/sales-workflow/sales-commission-applet/) — commission reports and payouts.
- [Membership Admin Applet](/applets/membership/membership-admin-applet/) — member classes, labels, MLM lineage and the points run.
