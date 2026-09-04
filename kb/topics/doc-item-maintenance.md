---
topic: doc-item-maintenance
aliases: [item master, doc item, financial item, product master]
applets: [DocItemApplet, InvItemMaintenanceApplet]
modules: [core, inventory, ecommerce, pos, e-invoice]
related: [inv-item-maintenance, tax-configuration, chart-of-accounts, organisation, pricing-scheme, e-invoice, stock-availability, t2t]
wiki:
  - content/en/applets/master-data/doc-item-maintenance-applet.md
status: growing
updated: 2026-09-05
---

# Doc Item Maintenance (item master)

The commercial definition of every item BigLedger can put on a document line — code, name, type, UOM, tax, pricing, categories, visibility, e-Invoice classification. The stock-side twin is the inventory item.

## Facts

- 2026-09-05 — Registry: code `DocItemApplet`, name "Doc Item Maintenance", TNT-APPLET, ACTIVE. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Application Settings is one tenant-wide JSON saved via `SessionActions.saveMasterSettingsInit`; the model has ~300 keys, almost all `HIDE_*` / `SHOW_*` / `EXPAND_*` visibility switches, plus defaults (UOM, currency, temp-save status, e-Invoice classification/taxable type/UOM), `ITEM_CODE_FORMAT` + `RUNNING_NUMBER_GENERATION_METHOD` (RANDOM_NUMBER_GENERATOR | RUNNING_NUMBER_BY_ITEM), `AVAILABLE_ITEM_TYPES`, `EDIT_ITEM_CODE`, `AUTO_CAPITALIZE_ITEM_CODE`, code/name max-length limits, `MANDATORY_EAN_CODE`. [src:blg-applet-wavelet-doc-item-maintenance-applet/.../models/applet-settings.model.ts] [src:.../application-settings.component.ts]
- 2026-09-05 — Settings screen panels: Sidebar Settings (HIDE_<MENU>_MENU generated from menu state), Costings Tab Settings, Department Settings (4 unbound toggles, no effect), Items Settings, Item Edit Tab Hidden, Category Group Settings, Hide Features Based on Permissions, Hide Category Groups (HIDE_CAT_0..20), Categories Listing Settings, CP Commerce Item Settings. [src:.../application-settings.component.html]
- 2026-09-05 — Category slots 0–20 are bound to category groups in `bl_inv_mst_category_level_setting_hdr` (level_NN_category_group_guid / _mandatory); changing a slot's group resets that category on all items using the old group (UI confirms first). [src:.../application-settings.component.ts onSave]
- 2026-09-05 — Registered client-side permissions for DocItemApplet: ENABLE_EDIT_SUB_ITEM_TYPE, SHOW_COSTINGS_TAB, SHOW_COMPANY_CODE, SHOW_COST_* / SHOW_LANDED_* (one per cost figure), SHOW_COMMENTS, SHOW_CATEGORIES_GRID, SHOW_CATEGORY_GROUP_GRID, SHOW_PRICING_SCHEME_GRID. Pattern: a SHOW_ permission overrides the tenant HIDE_ setting for its holder. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:.../item-edit.component.ts]
- 2026-09-05 — Item types offered by the UI (options.ts): BASIC_ITEM, GROUPED_ITEM, BUNDLE, COUPON (label "Voucher"), SERVICE, WARRANTY, GL_CODE (label "Account Code"), DOC_HEADER_ADJUSTMENT, MEMBERSHIP, MADE_TO_ORDER, DIGITAL_GOODS, FIXED_ASSET_REGISTER, SALES_CONTRACT, DELIVERY_CHARGE, NSTI, GROUP_DISCOUNT, CURRENCY, ALIAS, MEMBER_POINT_DISCOUNT, EXTERNAL. Sub item types for BASIC_ITEM: BASIC_QUANTITY, BATCH_NUMBER, SERIAL_NUMBER, BIN_NUMBER, UNITY. [src:.../shared/options.ts]
- 2026-09-05 — Tab visibility: Stock Card only for BASIC_ITEM; MTO Config only MADE_TO_ORDER; Bundle Config only BUNDLE; Child Item only grouped; Eligible Categories/Items/Pricing Bands only WARRANTY; Entity Pricing hidden for MADE_TO_ORDER; Costings shown if !HIDE_COSTINGS_TAB or SHOW_COSTINGS_TAB permission. [src:.../item-edit.component.ts ~L1085-1160]
- 2026-09-05 — Create form defaults: uom 'PCS', currency 'MYR', inventoryChecked true; code/name/type/uom/sub_item_type/currency required; description max 255. [src:.../item-create-default.component.ts ngOnInit]
- 2026-09-05 — Backend: item code must be non-blank (ITEM_HDR_OBJECT_CODE_IS_NULL_OR_EMPTY) and unique among existing items (ITEM_HDR_OBJECT_CODE_ALREADY_EXIST); inv_item_hdr_guid must reference a non-DELETED bl_inv_mst_item_hdr. UI comment: uniqueness is among non-DELETED rows, so a deleted item can share a code with a live one. [src:blg-akaun-platform-java/javasdk/.../FinancialItemDataConsistencyObject.java] [src:.../item-create-default.component.ts getFiItems]
- 2026-09-05 — Listing performance: the fi-item listing eagerly aggregates remarks, marketplace and pricing per row via LATERAL JSONB_AGG; pricing dominates (~6 s of 7 s per page on a tenant with 70k pricing links). [src:gh:bigledger/blg-int-general-task#8633]
- 2026-09-05 — "Optional Serial No" checkbox semantics: enabling it means a serial number is NOT required. [src:gh:bigledger/blg-int-general-task#4332]
- 2026-09-05 — Company Linking overrides Branch Linking: an item linked to a company is visible at all of that company's branches regardless of branch links. [src:existing wiki page, consistent with basic-item-company / basic-item-branch components]

## How it connects

- **inv-item-maintenance** — stock-tracked doc items point at an inventory item; category groups are shared between both applets; FiItemService updates inv_item status asynchronously on doc-item update.
- **tax-configuration** — Tax tab and Entity Pricing select tax codes defined there.
- **chart-of-accounts** — GL code on Main tab; GL_CODE item type posts to that account from documents.
- **organisation** — companies/branches for Branch/Company Linking.
- **pricing-scheme** — schemes are templates in this applet; POS settings choose which scheme is retail/min/max.
- **e-invoice** — item classification, taxable type code and e-Invoice UOM live on the item; tenant defaults DEFAULT_EINVOICE_* pre-fill them.
- **t2t** — T2T Item Mapping needs T2T Admin permissions first.

## Open questions

- Which release fixed the listing pricing-lateral performance issue (#8633) — closed 2026-08-10, patch reference not confirmed.
- Whether SHOW_CAT_n / SHOW_SUB_ITEM_TYPE / SHOW_MARKETPLACE permissions (referenced by the listing component) are meant to be registered in bl_applet_client_side_perm_dfn — they are not today.

## Wiki impact

- inv-item-maintenance-applet page should state that category groups/categories are shared with Doc Item Maintenance and that a doc item's inv_item_hdr_guid must point at a non-deleted inventory item.
- tax-configuration-applet, chart-of-account-applet, organisation-applet, stock-availability-applet, stock-balance-applet, pricebook-applet (lane 4) and t2t-admin-applet, pos-general-applet, cp-commerce-admin-applet, voucher-management-applet, my-e-invoice-portal-applet (other lanes) should list doc-item-maintenance-applet in related_applets.
