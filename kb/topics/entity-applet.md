---
topic: entity-applet
aliases: [entity maintenance, entity master, generic entity applet, entity categories]
applets: [entity-maintenance-applet]
modules: [core, purchasing, hr-payroll, claims]
related: [customer-maintenance, employee-applet, supplier-maintenance, merchant, organisation, tax-configuration, cashbook, tenant-admin, entity-categories, credit-limit]
wiki:
  - content/en/applets/master-data/entity-applet.md
status: growing
updated: 2026-09-05
---

# Entity Maintenance (generic entity master)

The type-agnostic view of `bl_fi_mst_entity_hdr`: one record with `is_customer` / `is_supplier` / `is_employee` / `is_merchant` flags, edited through a small common form, plus the four category trees (entity, customer, employee, supplier) that the type-specific applets tag their records with.

## Facts

- 2026-09-05 — Registry: one ACTIVE row `entity-maintenance-applet` "Entity Maintenance" (TNT-USER, created 2022-06-08); `documentation_url` points at an Atlassian Confluence page, not the wiki. Page title changed from "Entity Maintenance Applet" to the registry name. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo `blg-applet-akaun-platform-entity-applet` (commit 71162733, 2026-09-02; Angular 14 migration gh#5). Routes: entity-listing, entity-category, customer-category, employee-category, supplier-category, settings/{default-selection, field-settings, webhook, feature-visibility, permission-set-listing, user/team/role-permission-listing}, personalization/personal-default-selection. Left menu = Entity + four category menus; settings menu lists only Field Settings and Default Selection. [src:blg-applet-akaun-platform-entity-applet/.../app.routing.ts] [src:.../models/menu-items.ts]
- 2026-09-05 — **No functional applet settings.** Field Settings is a static template (8 unbound toggles, SAVE without handler; component class empty). Default Selection and Personalisation Default Selection write DEFAULT_BRANCH/DEFAULT_LOCATION into an applet container that is never loaded (load subscription commented out L31-39) and emit `save` to nobody (route renders the component directly). No component reads `appletSettings`, `HIDE_*`, `SHOW_*` or `DEFAULT_*`. [src:.../settings-container/field-configuration/field-configuration.component.html] [src:.../settings-container/default-settings/default-settings.component.ts] [src:.../personalization-container/personal-default-settings/personal-default-settings.component.ts]
- 2026-09-05 — Zero rows in `bl_applet_client_side_perm_dfn` for `entity-maintenance-applet`; code checks no SHOW_* codes. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Create form (single Main tab): name, status (ACTIVE/INACTIVE, default ACTIVE), Type multi-select (CUSTOMER/SUPPLIER/EMPLOYEE/MERCHANT → is_* flags), Entity Type (CORPORATE/INDIVIDUAL; EMPLOYEE forces INDIVIDUAL and clears the field), id_type (PASSPORT/IDENTITY_CARD, individuals), ID Number (required), Company Tax Registration ID (corporate), Currency (required), Description, AR/AP Type (required; AR_TRADE, AR_OTHER, AR_MERCHANT, AP_TRADE, AP_OTHER, AP_MERCHANT, AP_EMPLOYEE). Currency, ID number and tax reg are stored as entity extensions CURRENCY (JSON {currency}), ID_NO (string), TAX_REG_NO (string) — NOT as hdr.ccy_code / id_no / tax_reg_number. No entity code is sent; backend generates per-type codes with prefixes. [src:.../entity-create/entity-create-main/entity-create-main.component.html] [src:.../entity-create/entity-create.component.ts] [src:blg-akaun-platform-java/.../EntityDataConsistencyObject.java L1352-1410]
- 2026-09-05 — Edit tabs: Main, Entity Category, Login, Payment Config, Tax, Address, Contact, Intercompany Branch, Company Linking, Remark, Credit Term and Limit (Credit Term / Credit Limit). Branch tab commented out; Remove button commented out (no delete). Update (L462-691) writes header fields + ENTITY_REMARK ext + staged Tax (TAX_DETAILS ext), Address (ADDRESS ext), Contact (CONTACT line) rows; it does not write CURRENCY (currency cannot be changed after create). [src:.../entity-edit/entity-edit.component.html] [src:.../entity-edit/entity-edit.component.ts]
- 2026-09-05 — Persist immediately via own services: Payment Config (`bl_fi_mst_entity_payment_method`, EntityPaymentMethodService), Company Linking (`bl_fi_mst_comp_branch_location_entity_link`, CompBranchLocationEntityLinkService post/put(arap type)/delete), Intercompany Branch (`bl_fi_mst_entity_branch_hdr`, IntercompanyBranchService post/put). [src:.../state-controllers/entity-controller/store/effects/entity.effects.ts]
- 2026-09-05 — **Dead tabs:** Entity Category tab dispatches `itemCategory` ("[Item Applet] Get Item Category Container") which has no reducer and is not in the Update payload; Login tab lists links for a hard-coded entity guid (entity-login.component.ts L73) and posts with empty entity_hdr_guid (login-create L62/L149) → backend `ENTITY_SUBJECT_LINK_OBJECT_ENTITY_HDR_GUID_IS_NULL_OR_EMPTY` (EntitySubjectLinkDataConsistencyObject L64); Credit Term `onSave()` only resets the form; Credit Limit `onSave()` only formats the amount; their listings read CREDIT_TERMS/CREDIT_LIMITS exts nothing writes. [src:.../entity-edit/entity-category/category-add/category-add.component.ts] [src:.../store/actions/entity.actions.ts L96] [src:.../entity-edit/entity-login/entity-login.component.ts] [src:.../entity-edit/entity-login/login-create/login-create.component.ts] [src:.../credit-termslimits-main/credit-terms/credit-terms.component.ts] [src:.../credit-limits-main/credit-limits/credit-limits.component.ts]
- 2026-09-05 — Category menus create `bl_fi_mst_label_hdr` with txn_type ENTITY_CATEGORY / CUSTOMER_CATEGORY / EMPLOYEE_CATEGORY / SUPPLIER_CATEGORY in label lists ENTITY_CATEGORIES / CUSTOMER_CATEGORIES / EMPLOYEE_CATEGORIES / SUPPLIER_CATEGORIES (list auto-created on first use; entity list label_type ENTITY_CATEGORY_TYPE). Fields: code, name, description (all mandatory), optional parent; edit adds status. Backend `LabelHdrDataConsistencyObject`: code/name/txn_type/status required; parent must exist; **code unique across all labels of the tenant** (`LabelQueryCriteria().withCode`, L56-66). [src:.../category-entity/entity-category-create/entity-cat-create.component.ts] [src:blg-akaun-platform-java/javasdk/.../validator/label/LabelHdrDataConsistencyObject.java]
- 2026-09-05 — Backend header rules relevant here: status not null (L126), txn_type INDIVIDUAL|CORPORATE (L144, `ENTITY_HDR_OBJECT_TXNTYPE_DOES_NOT_EXISTS`), default_arap_type not null (L247), per-type code uniqueness and SHOULD_NOT_BE_SET (L153-195), ext/line hdr-guid/status/revision rules (L268-575); update effect re-reads the entity to sync revisions before PUT. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/entitydataconsistencyobjects/EntityDataConsistencyObject.java]
- 2026-09-05 — Payment Config options: payee RESIDENT/NON-RESIDENT; Payment Type = tenant settlement methods (SettlementMethodService; stored as item_guid); Bank = fixed list of Malaysian banks (typo entries "AGRROBANK", "HSBS", UOB mapped to CITYBANK value); Bank Identifier Code = SettlementTypeOptions. Backend: hdr guid must exist, country code required + must exist, item/bank guid must exist when set. [src:.../payment-config-create/payment-config-create.component.ts] [src:blg-akaun-platform-java/.../EntityPaymentMethodDataConsistencyObject.java]
- 2026-09-05 — Listing: Entity Name, Entity Ext Type (flags joined), Entity Type, Currency (from CURRENCY ext), Status, Creation Date, Modified Date; search keyword → name + customer/supplier/employee/merchant codes; filters txn_type, status, updated_date range (SubQuery removed 2026-08, gt#6638/#9406/#9403). [src:.../entity-listing/entity-listing.component.ts] [src:.../models/advanced-search-models/entity.model.ts] [src:.../models/entity.mappers.ts]
- 2026-09-05 — Screenshots: 11 of 12 files under static/images/entity-applet/ carry personal data (real staff names / e-mails / a real customer-name fragment) or are an AI infographic; only employee-category-listing.png is used. [src:static/images/entity-applet/]

- 2026-09-03 — Proposal (not yet built) to add an entity status filter to the entity listing so inactive customers can be managed. [src:gmail:1a0663d23d98e303]

## How it connects
- **customer-maintenance** — TIN space-stripping on save shipped 2026-09-03; the status filter proposal would apply to the shared listing.

- **customer-maintenance / supplier-maintenance / employee-applet / merchant** — same rows; this applet can set any flag combination, the siblings own the type-specific tabs and the working category / login / credit features.
- **entity-categories** — the four label trees maintained here are what the sibling applets' Category tabs pick from; label codes share one tenant-wide namespace with item categories.
- **credit-limit** — the Credit Term / Credit Limit tabs here are dead; the customer applet is the only writer.
- **cashbook** — settlement methods are the Payment Type list on Payment Config.
- **tax-configuration** — Tax tab lists tax codes by `tax_country`.
- **organisation** — Company Linking (companies) and Intercompany Branch (branch → company).
- **tenant-admin** — Login tab verifies against USER_CONFIRMED EMAIL_USERNAME principals but cannot save the link.

## Open questions

- Is Entity Maintenance still meant to be installed for tenants, given that four tabs and all settings are non-functional and the siblings cover everything? (question for Vincent / product)
- Where does `bl_fi_mst_entity_ext.value_string` with param_code AKN_ETY_CTG (validated against EntityTypeConstants, EntityDataConsistencyObject L843-850) get written — none of the entity applets read so far send it.

## Wiki impact

- content/en/applets/master-data/entity-applet.md — rewritten (run 7); title "Entity Maintenance".
- Pages linking here as "Entity Applet" (debtor-report-applet, commission-scheme-applet) should say "Entity Maintenance" and, where they mean customer data, link Customer Maintenance instead; modules claims / hr-payroll / purchasing pages describe this applet as holding job grades, bank profiles and payment terms — those live in Employee Maintenance / Supplier / Customer Maintenance.
