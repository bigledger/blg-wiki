---
topic: pdg-applet
aliases: [product distribution guide, PDG, OPDG, outlet product distribution guide, brand corner, outlet type, outlet size]
applets: [pdgApplet]
modules: [inventory]
related: [organisation-applet, doc-item-maintenance-applet, stock-replenishment-applet, cp-commerce-admin-applet, permission-wizard]
wiki:
  - content/en/applets/ecommerce/pdg-applet.md
status: growing
updated: 2026-09-05
---

# PDG / OPDG (Product Distribution Guide)

Head office defines, per outlet size × outlet type × product-category combination, how many units of a category an outlet should display (PDG). Each outlet derives its own copy (OPDG), adjusts the quantity per cell and can split it by brand. Planning master data only: no document, no stock, no journal.

## Facts

- 2026-09-05 — Registry: `pdgApplet` / "Pdg Applet" / TNT-USER / ACTIVE, created 2024-09-29, no documentation_url. The applet repo was renamed from `blg-applet-wavelet-pdg-applet` to a customer-named slug (cited as `customer-repo-de2e40`); a second customer repo `customer-repo-7b4a2c` is a README-only tracker with 31 support issues. [src:planning/private/registry-applets-2026-09-05.tsv] [src:gh:bigledger/blg-int-general-task#6557]
- 2026-09-05 — The applet is a sales-invoice template clone: PDG screens live under `sales-invoice-container/`, OPDG screens under `line-items-container/`; the Account/Lines/Settlement/KO tabs, ARAP, deposit, pick-pack and contra components are unrouted leftovers. [src:customer-repo-de2e40/…/pdg-applet/src/app/app.routing.ts]
- 2026-09-05 — Settings › Application Settings routes to the shared `FieldConfigurationComponent`; the applet-local field-configuration component is unrouted and unbound. Four-proof keys: `HIDE_OPDG_NAME`, `HIDE_OPDG_CODE` (shared screen › Miscellaneous › "PDG Fields", default false) and `SORT_ORDER`; `ENABLE_FILTER_BY_TODAYS_TXN` is read without a control. Default Selection saves DEFAULT_BRANCH/LOCATION/COMPANY that nothing PDG-related reads. [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html] [src:customer-repo-de2e40/…/opdg-add/opdg-add.component.ts]
- 2026-09-05 — Zero client-side permission definitions seeded for `pdgApplet`. The only permission the applet loads is `TNT_API_DOC_PDG_READ_LOCATION_TGT_GUID`; its location target list filters the OPDG outlet listing and the Opdg Add outlet drop-down client-side — an empty target list means no filtering (every outlet visible). [src:customer-repo-de2e40/…/opdg-location-listing.component.ts] [src:blg-akaun-platform-java/javasdk/…/AkaunTenantPermissionsV3.java]
- 2026-09-05 — PDG create/update: header saved `PROCESSING`, tenant-queue job `PDG_CREATE_AND_UPDATE_PROCESSOR` writes filter links → category combinations (SELECT DISTINCT over items joined to labels — only pairs carried by ≥1 ACTIVE item) → location combinations (distinct size/type of ACTIVE locations matching both filters; fails "…pair doesn't exist" when none) → guide elements (and OPDG elements for existing OPDGs) → `ACTIVE`; any failure → header `DELETED`, which the listing (statuses ACTIVE,PROCESSING) hides. [src:blg-akaun-platform-java/akaun-api/…/PdgCreationAndUpdateProcessor.java] [src:blg-akaun-platform-java/javasdk/…/InventoryPdgUniqueCombinationService.java] [src:blg-akaun-platform-java/javasdk/…/GenerateAndDeleteInventoryUniqueLocationCombinationService.java]
- 2026-09-05 — OPDG create: header `PROCESSING` → `OpdgCreationProcessor` copies every ACTIVE guide element to `bl_inv_opdg_element` with **no quantity** → `ACTIVE`. Outlets start from empty cells, not from PDG numbers. [src:blg-akaun-platform-java/javasdk/…/OpdgCreationProcessorService.java]
- 2026-09-05 — Effective/End date on the PDG are stored and searchable only; no backend reader enforces them. [src:blg-akaun-platform-java/javasdk/…/InventoryPdgHdrUow.java]
- 2026-09-05 — Delete PDG is a permanent row delete (`deletePermanent=true`); guide elements and OPDG elements cascade, `bl_inv_opdg_hdr.pdg_hdr_guid` does not → a PDG with OPDG headers cannot be deleted. [src:blg-akaun-platform-java/javasdk/…/InventoryPdgHdrUow.java] [src:blg-akaun-platform-java/javasdk/…/DbTableDao.java] [src:tenant-schema bl_inv_opdg_hdr.sql]
- 2026-09-05 — Brand corner: `brand_corner_boolean` is a varchar 'Y'/'N' (issue #4). Two chart components enforce different client rules: PDG › Outlet Guide chart requires brand total == OPDG qty at Save; OPDG-menu chart requires brand total <= OPDG qty and 0 <= OPDG qty <= PDG qty. Y→N deletes all brand rows via `DELETE …/opdg-element-by-brand-hdrs/backoffice-ep/opdgElement/{guid}`. Backend DCO validates FKs/status only. [src:customer-repo-de2e40/…/edit-opdg/opdg-chart/opdg-chart.component.ts] [src:customer-repo-de2e40/…/sales-invoice-create/edit-opdg/opdg-chart/opdg-chart.component.ts] [src:gh:customer-repo-de2e40#4]
- 2026-09-05 — Opdg Add writes Outlet Size/Type back to `bl_inv_mst_location` when missing; when different it confirms and sets the location's existing OPDG headers/elements `INACTIVE` (client-side, via PUT). [src:customer-repo-de2e40/…/opdg-add/opdg-add.component.ts] [src:customer-repo-de2e40/…/pdg-controller/store/effects/opdg.effects.ts]
- 2026-09-05 — Excel import: fixed cells (B2 name, B3 code, B6/B7 effective/end `dd-MMM-yyyy`, B15/C15 category groups, E14 size, E15 type, rows from 16); validation messages "CATEGORY GROUP INVALID", "OUTLET SIZE INVALID", "OUTLET TYPE INVALID", "No item exists for the Category combination"; one workbook = one PDG for one size–type pair. [src:blg-akaun-platform-java/javasdk/…/bl_inv_pdg_element_import_file_helper.java] [src:blg-akaun-platform-java/javasdk/…/PdgElementImportFileHdrService.java]
- 2026-09-05 — OPDG Report endpoint `GET …/inv/opdg-elements/backoffice-ep/opdg-report` (perm `API_TNT_DM_INV_OPDG_ELEMENT_READ`) joins location → outlet size/type; a location with a null or non-ACTIVE size/type drops out (issue #17). [src:blg-akaun-platform-java/akaun-api/…/InventoryOpdgElementController.java] [src:gh:customer-repo-de2e40#17]
- 2026-09-05 — Backend auto-replenishment tables (`bl_inv_auto_rep_event_*`, `bl_inv_auto_rep_run_*`) reference OPDG headers and outlet-type/size filters; no applet page documents them. [src:blg-akaun-platform-java/javasdk/…/InventoryAutoReplenishmentEventOpdgHdrService.java]

## How it connects

- **organisation-applet** — Outlet Type / Outlet Size lists and the per-location assignment are the axis of every PDG; Opdg Add writes them back to the location.
- **doc-item-maintenance-applet** — category groups, the Item Category level mapping (Category Group 1…10) and brand labels feed the PDG rows and brand rows; PDG rows exist only for category pairs carried by items.
- **stock-replenishment-applet** — the backend's auto-replenishment event/run tables carry OPDG and outlet filters; if that applet ever surfaces them, the OPDG quantity is the replenishment target.
- **cp-commerce-admin-applet** — links to PDG as "catalogue"; no data flow.
- **permission-wizard** — `TNT_API_DOC_PDG_READ_LOCATION_TGT_GUID` with location targets is the only per-outlet access control.

## Open questions

- Is a customer-specific applet (single-tenant naming, outlet-type scheme) meant to have a public wiki page at all? The registry row is ACTIVE and not on the exclusion list.
- Should the backend enforce Effective/End dates, the OPDG ≤ PDG rule and the brand-total rule (today all client-side)?
- Should an empty `TNT_API_DOC_PDG_READ_LOCATION_TGT_GUID` target list mean "no outlets" rather than "all outlets"?

## Wiki impact

- content/en/applets/ecommerce/pdg-applet.md — rewritten 2026-09-05 (this record).
- content/en/applets/master-data/organisation-applet.md — add `pdg-applet` to related_applets; note that Opdg Add can write Outlet Size/Type onto a location and that a location without both never appears in a PDG.
- content/en/applets/master-data/doc-item-maintenance-applet.md — add `pdg-applet`; note the Item Category level mapping is what PDG's Category Group Filter reads and that brand labels are FK targets of OPDG brand rows.
- content/en/applets/ecommerce/cp-commerce-admin-applet.md — stop describing PDG as storefront catalogue data.
