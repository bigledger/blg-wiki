---
title: "Pdg Applet"
description: "Reference for the PDG applet: head-office Product Distribution Guides (recommended display quantity per outlet size, outlet type and product category), the per-outlet OPDG copies that outlet managers adjust, brand-corner splits, the Excel import, the OPDG report, every setting that actually works, the asynchronous create/update job and known failure modes."
applet_code: "pdgApplet"
applet_repo: "customer-repo-de2e40"
modules: [inventory]
related_applets:
  - organisation-applet
  - doc-item-maintenance-applet
  - cp-commerce-admin-applet
guides: []
sources:
  configuration:
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/app.routing.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/app.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/models/menu-items.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/models/applet-settings.model.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/line-items-container/opdg-location-listing/opdg-location-listing.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/line-items-container/opdg-location-listing/opdg-add/opdg-add.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/line-items-container/opdg-location-listing/opdg-add/pdg-listing/pdg-for-opdg-listing.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/sales-invoice-container/sales-invoice-create/edit-opdg/edit opdg details/edit-opdg-details.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/sales-invoice-container/sales-invoice-create/edit-opdg/edit opdg details/edit-opdg-details.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/AkaunTenantPermissionsV3.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntInvPermissions.java
  fields:
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/sales-invoice-container/pdg-listing/pdg-listing.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/sales-invoice-container/pdg-edit/pdg-edit.component.html
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.html
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/sales-invoice-container/sales-invoice-create/pdg-chart/pdg-chart.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/line-items-container/opdg-location-listing/opdg-add/opdg-add.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/line-items-container/opdg-location-listing/edit-opdg/edit-opdg-details/edit-opdg-details.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/line-items-container/opdg-location-listing/edit-opdg/edit-opdg-details/edit-opdg-details.component.html
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/line-items-container/opdg-location-listing/edit-opdg/opdg-chart/opdg-chart.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/sales-invoice-container/sales-invoice-create/edit-opdg/opdg-chart/opdg-chart.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/sales-invoice-container/sales-invoice-create/edit-opdg-by-item/edit-opdg-by-item.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/opdg-report-listing-container/opdg-report-listing.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/file-import-container/file-import-create/file-import-create.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/file-import-container/file-import-listing/file-import-listing.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/file-import-container/file-import-edit/helper-checking-listing/helper-checking-listing-error/helper-checking-listing-error.component.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/components/audit-trail-container/audit-trail-listing/audit-trail-listing.component.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_pdg_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_opdg_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_opdg_element.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_opdg_element_by_brand.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_pdg_guide_element.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_outlet_size_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_outlet_type_hdr.java
  lifecycle:
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/state-controllers/pdg-controller/store/effects/pdg.effects.ts
    - customer-repo-de2e40/micro-fe/projects/wavelet-erp/applets/pdg-applet/src/app/state-controllers/pdg-controller/store/effects/opdg.effects.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/InventoryPdgUniqueCombinationController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/InventoryPdgHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/InventoryOpdgHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/InventoryOpdgElementController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/InventoryOpdgElementByBrandHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/PdgCreationAndUpdateProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/inventory/OpdgCreationProcessor.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/InventoryPdgUniqueCombinationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/GenerateAndDeleteInventoryUniqueCategoryCombinationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/GenerateAndDeleteInventoryUniqueLocationCombinationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/GenerateAndDeleteInventoryPdgGuideElementService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/OpdgCreationProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/InventoryOpdgElementByBrandHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/inventoryPdgElement/PdgElementImportFileHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/inventoryPdgElement/bl_inv_pdg_element_import_file_helper.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/InventoryPdgHdrUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/ddd/DbTableDao.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryPdgHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryOpdgHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryOpdgElementDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/InventoryOpdgElementByBrandHdrDataConsistencyObject.java
  troubleshooting:
    - gh:customer-repo-de2e40#4
    - gh:customer-repo-de2e40#5
    - gh:customer-repo-de2e40#8
    - gh:customer-repo-de2e40#17
    - gh:customer-repo-de2e40#20
    - gh:customer-repo-7b4a2c#22
    - gh:customer-repo-7b4a2c#29
    - gh:customer-repo-7b4a2c#31
    - gh:bigledger/blg-int-general-task#6557
tags:
- product-distribution
- outlet-management
- category-groups
- planning
- import-upload
- inventory
weight: 161
---

## Overview

The PDG applet holds a retail group's **Product Distribution Guides (PDG)** — head office's recommended display quantity for each product category at each kind of outlet — and the **Outlet Product Distribution Guides (OPDG)** that each outlet derives from them. Head-office planners create a PDG by choosing which outlet sizes, outlet types and product-category groups it applies to; the backend then generates one guide cell per *(outlet size × outlet type) × (category combination)* and the planner types the recommended quantity into each cell. An outlet manager opens the OPDG side, picks their outlet and a PDG, gets a copy of the applicable cells, and adjusts the quantity per cell — optionally splitting it by brand ("brand corner"). The OPDG Report lists every outlet's PDG quantity, OPDG quantity and brand split side by side.

This is a master-data / planning applet: it writes no generic document, no stock movement and no journal. Everything it stores lives in its own `bl_inv_pdg_*`, `bl_inv_opdg_*` and `bl_opdg_element_by_brand` tables. Registry code `pdgApplet`, applet type TNT-USER.

## Where it fits

| Direction | What | Where it is maintained |
|---|---|---|
| Upstream | **Outlet Type** and **Outlet Size** master lists, and the *Outlet Size* / *Outlet Type* assignment on each **Location** | [Organisation Applet](/applets/master-data/organisation-applet/) — Settings › Outlet Settings, and Location › Edit › Details |
| Upstream | **Category Groups**, **Categories** and the **Item Category** level mapping (Category Group 1…10) that decides which category columns a PDG can use, plus the items that carry those categories | [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) |
| Upstream | Which outlets (locations) a user may see on the OPDG side | Permission Wizard in this applet's Settings (`TNT_API_DOC_PDG_READ_LOCATION_TGT_GUID`, see *Feature visibility / permissions*) |
| Downstream | OPDG Report (read-only grid, CSV export) | This applet |
| Downstream | Auto-replenishment event / run tables reference OPDG headers and outlet-type/size filters (`bl_inv_auto_rep_*`) | Backend only — no applet in this wiki exposes them yet |

The [CP Commerce Admin](/applets/ecommerce/cp-commerce-admin-applet/) page lists PDG under "catalogue"; PDG does not feed the storefront — it is an in-store display-planning tool (see *Related applets*).

## Screens and menus

Sidebar (`menu-items.ts`): **PDG**, **OPDG**, **OPDG Report**, **File Import**, **Audit Trail**, then **Settings** and **Personalization**. Route root `applet/tnt/wavelet/erp/pdg-applet`; the empty route redirects to `pdg`.

- **PDG › PDG Listing** — columns Doc No (`running_no`), Pdg Name, Pdg Code, Created Date, Modified Date, Status. The listing asks for statuses `ACTIVE,PROCESSING` only, so a PDG whose background job failed (status `DELETED`) simply disappears. The **+** button opens *Create PDG* (Details tab only); clicking a row opens *Edit PDG* with three tabs:
  - **Details** — the PDG header (see *Fields*).
  - **Guide** — an ag-Grid with one row per category combination and one column per *outlet size – outlet type* pair; the cells are the recommended quantities (`bl_inv_pdg_guide_element.qty_manual`). Each cell saves on edit.
  - **Outlet Guide** — *Opdg Outlet Listing*: the OPDGs already created for this PDG (Name, Code, Description, Outlet Size, Outlet Type). **+** opens *Set OPDG Elements* › **Set Outlet**; once saved a second tab **OPDG Chart** appears, and each row's action opens *Edit Opdg* with **Opdg Chart Details** and **Opdg By Brands**.
- **OPDG › Opdg Outlet Listing** — one row per location that already has at least one ACTIVE OPDG element *and* that the user is permitted to see (Outlet Name, Outlet Code, Description, Outlet Size, Outlet Type, Created/Modified Date). **+** opens *Opdg Add*; clicking a row opens *Opdg Pdg Listing* (the PDGs applied at that outlet), then *Set OPDG Elements* › **Set Outlet** / **OPDG Chart**.
- **OPDG Report › OPDG Report Listing** — flat grid served by `GET …/inv/opdg-elements/backoffice-ep/opdg-report`: Outlet Name, Outlet Code, Description, Outlet Size, Outlet Type, Product Department (category level 1), Product Type (category level 2), PDG QTY, OPDG QTY, Brand Corner, Brand, Brand QTY, Created Date, Modified Date. Column filters are ag-Grid text filters; CSV export is enabled (`suppressCsvExport: false`).
- **File Import › File Import Listing** — File Name, File Size, Format, Status, Process Status, Error Message, Created Date. **+** opens *Upload The Pdg Import File* (drag-and-drop, `.xls`/`.xlsx` only). Clicking a row opens *File Details* with **Details** and **Checking** (sub-tabs **Error** and **All**, one row per spreadsheet line with Validation Error, Category Group 1/2 and their validation errors, Outlet Size / Outlet Type and their validation errors).
- **Audit Trail** — the shared applet audit-trail listing (Table Name, Status, Action Name, Action By, Date Created, Date Updated). Create, update and delete of PDG headers, OPDG headers, OPDG elements and brand rows write audit-trail rows from the backend controllers.
- **Settings** — Application Settings, Default Selection, Printable Format Settings, Email Template, Webhook, Feature Visibility, Permission Wizard, Permission Set, User Permission, Role Permission (routes in `app.routing.ts`). **Personalization** — Default Selection, Sidebar.

{{< figure src="/screenshots/pdg-applet/applet-settings-outlet-type.png" alt="Organisation Applet, Settings, Outlet Settings, Outlet Type Listing with four generic outlet types" caption="Outlet Type and Outlet Size are maintained in the Organisation Applet (Settings › Outlet Settings), not in the PDG applet." >}}

{{< figure src="/screenshots/pdg-applet/category-group-mapping.png" alt="Doc Item Maintenance Applet, Settings, Item Category tab, Category Group 0 to 10 drop-downs" caption="Doc Item Maintenance › Settings › Item Category: the Category Group 1…10 mapping decides which category groups the PDG Category Group Filter can offer." >}}

{{< figure src="/screenshots/pdg-applet/pdg-edit-quantity.png" alt="Edit PDG, Guide tab: rows PRODUCT_DEPARTMENT and PRODUCT_TYPE, one column per outlet size and type pair, quantity cell being edited" caption="Edit PDG › Guide: one row per category combination, one column per outlet size–type pair; the cell is the recommended quantity." >}}

{{< figure src="/screenshots/pdg-applet/opdg-set-outlet-empty.png" alt="Edit PDG, Outlet Guide tab with an empty Opdg Outlet Listing, and the Set OPDG Elements form with Opdg Name, Opdg Code and Outlet Name" caption="Edit PDG › Outlet Guide › Set OPDG Elements: create an OPDG for one outlet from this PDG." >}}

{{< figure src="/screenshots/pdg-applet/opdg-pdg-chart.png" alt="Opdg Pdg Listing on the left and the OPDG Chart on the right with PDG Quantity, OPDG Quantity and Brand Corner columns" caption="OPDG › outlet › PDG › OPDG Chart: PDG Quantity is read-only, OPDG Quantity and Brand Corner (Y/N) are edited in the grid." >}}

{{< figure src="/screenshots/pdg-applet/file-import-listing.png" alt="File Import Listing with FAILED and PROCESSING rows and the Upload The Pdg Import File drop zone" caption="File Import: each upload is a row; the Process Status column shows VALIDATING_DATA, PROCESSING, DONE or FAILED." >}}

{{< figure src="/screenshots/pdg-applet/pdg-upload-template.png" alt="Excel template: rows 2 to 7 hold PDG Name, PDG Code, Create Date, Modified Date, Effective Date, End Date; row 15 holds the column headers and rows 16 onward the category pairs and quantities" caption="The PDG upload workbook layout the importer expects (cell positions are fixed, see Fields › File Import)." >}}

## Configuration

### Before you can use it

1. **Outlet Type and Outlet Size lists** exist — [Organisation Applet](/applets/master-data/organisation-applet/) › Settings › Outlet Settings (`bl_inv_outlet_type_hdr`, `bl_inv_outlet_size_hdr`; code and name required).
2. **Every outlet location carries an Outlet Size and an Outlet Type** — Organisation Applet › Location › Edit › Details. The backend builds a PDG's outlet columns only from ACTIVE locations whose `outlet_size_guid` **and** `outlet_type_guid` match the PDG's filters (`GenerateAndDeleteInventoryUniqueLocationCombinationService.generateUniqueLocationCombination`, SQL on `bl_inv_mst_location`). A PDG whose filters match no such location fails its background job with *"In bl_inv_mst_location outlet_type_guids and outlet_size_guids pair doesn't exist"* and ends up `DELETED` (invisible in the listing). Nothing on the PDG create screen warns about this.
3. **Category groups mapped in Doc Item Maintenance › Settings › Item Category** (`bl_inv_mst_category_level_setting_hdr`, `level_01…10_category_group_code/guid`). The PDG *Category Group Filter* offers only category groups that appear in that mapping, and the PDG stores both the group (`fi_category_group_guid_1..3`) and the item column it maps to (`fi_category_group_1..3_table_column`).
4. **Items that carry those categories.** The category combinations of a PDG are generated with `SELECT DISTINCT` over `bl_fi_mst_item_hdr` joined to `bl_fi_mst_label_hdr` on the mapped column (`GenerateAndDeleteInventoryUniqueCategoryCombinationService.buildDynamicSql`) — only combinations used by at least one ACTIVE item become rows in the Guide.
5. **Outlet users need a location-scoped permission** — see *Feature visibility / permissions*. Without a target list they see every outlet (the applet filters only when the list is non-empty).
6. Backend permissions for the `TNT_DM_INV_PDG_*`, `TNT_DM_INV_OPDG_*`, `TNT_DM_INV_OUTLET_*` API families (`TntInvPermissions.java`) via Permission Wizard / Permission Set.

### Applet settings

Settings › **Application Settings** routes to the *shared* `FieldConfigurationComponent` from blg-shared-utilities (`app.routing.ts` → `settings/field-settings`). The applet-local `settings-container/field-configuration` component is not routed and its four "Lines Settings" / four "Department Settings" toggles have no form bindings — it is dead template code. Settings are saved by the shared screen into `bl_applet_ext` `APPLET_SETTINGS.value_json` (`session.effects.ts` L353-358) and read back through `SessionSelectors.selectMasterSettings`. Anyone who can open the applet's Settings can change them; they are tenant-wide for this applet.

The shared screen has no `appletCode` gate for `pdgApplet`, so it renders the whole generic sales-document settings catalogue (Main Details, Line Items, Listing, Miscellaneous … tabs). Only the keys below pass all four proofs (declared in `applet-settings.model.ts`, rendered, persisted, consumed by a PDG/OPDG screen):

| Setting (shared screen › tab › panel) | What it controls | Default | Effect when changed |
|---|---|---|---|
| `HIDE_OPDG_NAME` (Miscellaneous › **PDG Fields**) | Whether *Opdg Name* is required on *Opdg Add* (OPDG menu) and shown on *Edit Opdg › details* reached from PDG › Outlet Guide | off (`resolve?.HIDE_OPDG_NAME ?? false`, shared component L3451) | On: `opdg-add.component.ts` L117-124 clears the required validator; `edit-opdg-details.component.html` L27 hides the field. The header is still saved with whatever name the reducer holds (may be empty). |
| `HIDE_OPDG_CODE` (Miscellaneous › **PDG Fields**) | Same for *Opdg Code* | off (L3452) | Same mechanism (`opdg-add.component.ts` L118-124, `edit-opdg-details.component.html` L33). |
| `SORT_ORDER` (Listing tab) | Column used to order the *Opdg Pdg Listing* (PDG picker on the OPDG side) when no column sort is active | null → falls back to `updated_date` (`pdg-for-opdg-listing.component.ts` L641) | Changes the default order of that one listing. |

**Read at runtime without a control** for this applet code: `ENABLE_FILTER_BY_TODAYS_TXN` (`pdg-for-opdg-listing.component.ts` L355 and the PDG listing container L97 — the shared screen does not render it for `pdgApplet`). All other model keys (`HIDE_ARAP_*`, `HIDE_COSTING_DETAILS`, tab-hide keys, etc.) are read only by unrouted sales-invoice template components and have no effect on any PDG/OPDG screen.

**Default Selection** (applet-local `default-settings.component`) renders *Default Branch* and *Default Location* and saves `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY` (plus rounding/group-discount item keys with no control) into the same `APPLET_SETTINGS` JSON. No PDG, OPDG, report or import screen reads them; the branch filter it applies to its own drop-down looks for the target list of `TNT_API_DOC_INTERNAL_SALES_INVOICE_READ_TGT_GUID`, a permission this applet never loads. **Personalization › Default Selection** is a stub whose load subscription is commented out (`personal-default-settings.component.ts` L15-24) and whose save output is never wired.

### Document behaviour settings

Not a document applet. No status-flow, posting, printable, approval or e-Invoice options exist (routes and settings components checked at applet commit `e37bca3`, shared-utilities `a8c38a2`).

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Outlet Type / Outlet Size on a Location | Organisation Applet › Location › Edit › Details | Decides which PDG outlet columns exist and which PDG an outlet can take; missing values keep the outlet out of every PDG (and out of the OPDG Report — see Troubleshooting). |
| Item Category level mapping (Category Group 1…10) | Doc Item Maintenance › Settings › Item Category | Populates the PDG *Category Group Filter*; the importer rejects a category group that is not in this mapping (*"does not exist in Item Category of Doc Item Maintenance Settings"*). |
| Category assignment on each item | Doc Item Maintenance › Item › Item Category | Only category combinations carried by at least one ACTIVE item become PDG rows; the importer rejects a row whose pair has no item (*"No item exists for the Category combination …"*). |
| Brand label (`bl_fi_mst_label_hdr`) | Doc Item Maintenance › Categories | The *Opdg By Brands* drop-down and `bl_opdg_element_by_brand.label_hdr_guid` (FK) come from labels; a brand missing there cannot be picked (repo `customer-repo-7b4a2c` issues #22, #31). |

### Feature visibility / permissions

- **Backend (server-side) permission — the one that matters.** `app.component.ts` loads the user's target list for `TNT_API_DOC_PDG_READ_LOCATION_TGT_GUID` ("The assignee is allowed to access the target GUID of a location (OPDG) within the PDG Applet", `AkaunTenantPermissionsV3.java` L263) together with `TNT_TENANT_ADMIN` and `TNT_TENANT_OWNER`. The OPDG outlet listing and the *Opdg Add* outlet drop-down keep only locations whose GUID is in that target list (`opdg-location-listing.component.ts` L266-285, `opdg-add.component.ts` L187-206). **If the target list is empty the filter is skipped and every outlet is visible** — the permission narrows, it does not gate. Grant it per role or user through Settings › Permission Wizard with the outlet's location as target.
- **Client-side permission definitions:** none are seeded for `pdgApplet` in `bl_applet_client_side_perm_dfn` (0 rows on 2026-09-05), and the only `checkPermission` calls in the repo (`INTERNAL_SALES_INVOICE_DISPLAY_PRICING`) live in unrouted template components. `HIDE_*` settings therefore have no `SHOW_*` per-role override here.
- **Backend API permissions** checked by the controllers: `API_TNT_DM_INV_PDG_UNIQUE_COMBINATION_CREATE/UPDATE` (PDG create/update), `API_TNT_DM_INV_PDG_HDR_DELETE`, `API_TNT_DM_INV_OPDG_HDR_INV_OPDG_HDR_CREATE/UPDATE/DELETE`, `API_TNT_DM_INV_OPDG_ELEMENT_CREATE/UPDATE/DELETE/READ` (READ also guards the OPDG Report), `API_TNT_DM_INV_OPDG_ELEMENT_BY_BRAND_*`, `API_TNT_DM_INV_PDG_GUIDE_ELEMENT_*`, `API_TNT_DM_INV_OUTLET_TYPE_HDR_*`, `API_TNT_DM_INV_OUTLET_SIZE_HDR_*`. A missing one surfaces in the applet as *"The user is not authorized to perform this action."* (error code `CLIENT_AUTH_USER_NOT_AUTHORIZED`).
- Settings › **Permission Wizard** was blank for this applet until the resolver was added (`PermissionResolver` on the route; repo issue #20, closed 2026-05).

## Fields

### PDG › Details (`bl_inv_pdg_hdr`)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Doc No | `running_no`, generated by the backend (`PDG_RUNNING_NO` generator in `InventoryPdgHdrDataConsistencyObject` L279-280) | — | Read-only. |
| PDG Name | `name` | Yes (`Validators.required`) | Free text. |
| PDG Code | `code` | Yes | Free text; not checked for uniqueness by the DCO. |
| Description | `description` | No | |
| Outlet Size Filter | one or more `bl_inv_pdg_outlet_size_filter_link` rows | Yes | Multi-select with search; every selection becomes a link row. |
| Outlet Type Filter | one or more `bl_inv_pdg_outlet_type_filter_link` rows | Yes | Same. The cross product of the two filters, intersected with real locations, gives the Guide columns. |
| Effective Date / End Date | `effective_date`, `end_date` | No (the control is not required; the importer requires both) | Stored and searchable (`InventoryPdgHdrUow` criteria) — **no backend reader enforces them**; an "expired" PDG behaves exactly like a current one. |
| Created date / Modified date | `created_date`, `updated_date` | Read-only | Filled on create. |
| Category Group Filter | `fi_category_group_guid_1..3` + `fi_category_group_1..3_table_column` | Yes (`itemCategories`, `pairLabelHdrGuids` required) | Chips chosen from the Doc Item Maintenance Item Category mapping; up to three groups. Changing them on edit regenerates the combinations (`InventoryPdgUniqueCombinationService.update` step 2). |

### PDG › Guide (`bl_inv_pdg_guide_element`)

One row per `bl_inv_pdg_unique_category_combination_line`, one column per `bl_inv_pdg_unique_location_combination_line` (labelled *size–type*). Cell = `qty_manual`, parsed with `parseInt` on cell change and saved immediately by `PUT …/inv/pdg-guide-elements/backoffice-ep` (`updatePdgChartInit`). `qty_ai` and `qty_previous` exist in the table but no screen writes them. The unique key `(hdr_guid, unique_location_combination_guid, unique_category_combination_guid)` is enforced by the database.

### OPDG › Set Outlet / Opdg Add (`bl_inv_opdg_hdr`)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Opdg Name / Opdg Code | `name`, `code` | Yes unless `HIDE_OPDG_NAME` / `HIDE_OPDG_CODE` is on | |
| Outlet (Outlet Name) | `location_guid` | Yes | Drop-down limited to permitted locations (see permissions). Outlet Size / Outlet Type are shown read-only from the location. |
| Outlet Size / Outlet Type (Opdg Add only) | written to the **location** | Yes | If the chosen location has no size/type yet, Save writes them to `bl_inv_mst_location` (`updateLocationInit` → toast *"The Outlet Size and Outlet Type in location has been updated"*). If the location already has different values, a confirmation dialog warns *"…this will delete all OPDGs linked to the location…"*; on Yes the applet sets the location's existing OPDG headers and elements to `INACTIVE` (`opdg.effects.ts` L311-420) before writing the new size/type. |
| Opdg Creation date / Opdg Created By | `created_date`, creator | Read-only | |

### OPDG Chart (`bl_inv_opdg_element`)

| Column | Meaning | Editable | Client-side rules (toasts) |
|---|---|---|---|
| category columns | the PDG combination | No | |
| PDG Quantity | the PDG cell's `qty_manual` | No | Click-through to *Edit Opdg* (added 2026-07). |
| OPDG Quantity | `qty_manual` of the OPDG element | Yes | Integers only (*"Only integer values are allowed"*). On the OPDG-menu chart the value must be between 0 and the PDG Quantity and a PDG Quantity must exist (*"OPDG Quantity must be between 0 and PDG Quantity (n). Reverted to previous value."*). |
| Brand Corner | `brand_corner_boolean` — `'Y'` / `'N'` (varchar, not boolean) | Yes | Only Y or N (*"Brand Corner must be Y or N. Value cleared."*). Switching N→Y opens *Opdg By Brands*; switching Y→N calls `DELETE …/inv/opdg-element-by-brand-hdrs/backoffice-ep/opdgElement/{guid}`, which deletes every ACTIVE brand row of that element (*"All brand corner items have been deleted."*). On the OPDG-menu chart, moving to the next row with a Y whose OPDG Quantity is empty is blocked (*"Please fill OPDG QUANTITY and Brand Corner in Row n…"*). |

Each OPDG element carries `pdg_hdr_guid`, `hdr_guid` (OPDG header), the two combination GUIDs and `location_hdr_guid`; every cell save is a `PUT …/inv/opdg-elements/backoffice-ep` (`updateOpdgChartInit`).

### Opdg By Brands (`bl_opdg_element_by_brand`)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Brand | `label_hdr_guid` (+ `name`) — a label from Doc Item Maintenance | Yes | Drop-down of labels; a brand label that does not exist cannot be selected. |
| Quantity | `qty` | Yes | On the PDG › Outlet Guide chart the total of the brand rows must **equal** the OPDG Quantity before Save (*"OPDG Quantity does not tally with total Brand Corner quantity. Please fix highlighted rows before saving."*); on the OPDG-menu chart the total must not **exceed** the OPDG Quantity (*"OPDG Quantity (n) cannot be less than the total Brand Corner quantity (m)…"*). Both are client-side checks; the backend DCO validates only foreign keys and status. |

### File Import (`bl_inv_pdg_element_import_file_hdr` / `_helper`)

The upload form has no fields other than the file (`.xls`/`.xlsx`; the *delimiter* control belongs to the CSV template leftover and is not sent). The importer reads fixed cells (`bl_inv_pdg_element_import_file_helper.from`):

| Cell | Content | Rule |
|---|---|---|
| B2 | PDG Name | required (*"No PDG Name Provided…"*) |
| B3 | PDG Code | required |
| B4 / B5 | Create / Modified date | optional, `dd-MMM-yyyy` |
| B6 / B7 | Effective / End date | required, `dd-MMM-yyyy` (e.g. `01-Jan-2025`, `31-Dec-9999`) |
| B15 / C15 | Category group 1 / category group 2 codes | required; must differ (*"…B15 and C15 cannot be the same"*); each must exist and be in the Item Category mapping |
| E14 | Outlet Size code | required; must exist |
| E15 | Outlet Type code | required; must exist; a location with that size **and** type must exist |
| B16… / C16… | category 1 / category 2 codes or names per row | must exist under their group; the pair must be carried by at least one ACTIVE item |
| E16… | quantity | required (numeric or text) |

One workbook = one PDG for one *size–type* pair (the helper creates one `bl_inv_pdg_unique_location_combination_line` per file). Rows that fail validation are listed under *Checking › Error* with the message text above; any error sets Process Status `FAILED` and deletes the half-created PDG header.

## Lifecycle and effects

**Not a generic document.** There is no `*DataConsistencyObject` signum, no `JournalPostingTypeHandler` branch, no stock processor and no open queue for PDG or OPDG; the DCOs (`InventoryPdgHdrDataConsistencyObject`, `InventoryOpdgHdrDataConsistencyObject`, `InventoryOpdgElementDataConsistencyObject`, `InventoryOpdgElementByBrandHdrDataConsistencyObject`) check primary/foreign keys, subject GUIDs and a non-empty status only. Statuses are the generic `StatusColumn` values.

**PDG create / update is asynchronous.** `POST` / `PUT …/inv/pdg-unique-combination/backoffice-ep` (`InventoryPdgUniqueCombinationController` L64-165) saves the header with status **`PROCESSING`** (`createOnlyPdg` / `updateOnlyPdg`) and enqueues `PdgCreationAndUpdateProcessor` on tenant queue `PDG_CREATE_AND_UPDATE_PROCESSOR` (`RUN_NOW`). The job (`InventoryPdgUniqueCombinationService.create/update`):

1. writes the outlet-type and outlet-size filter links (update: diffs them, `generateFilterLinks`);
2. generates the **category combinations** from items (`GenerateAndDeleteInventoryUniqueCategoryCombinationService`; update: delete-and-regenerate);
3. generates the **location combinations** = distinct `(outlet_size_guid, outlet_type_guid)` of ACTIVE locations matching both filters — fails if none;
4. generates one **guide element** per location × category combination that does not exist yet (`GenerateAndDeleteInventoryPdgGuideElementService`) — and, for every ACTIVE OPDG of this PDG, a matching **OPDG element**, so existing outlets pick up new rows;
5. on success sets the header **`ACTIVE`**; on any failure sets it **`DELETED`** (`PdgCreationAndUpdateProcessor` L60-64, L86-90). Quantities already typed into removed combinations are not carried over.

**OPDG create is asynchronous too.** `POST …/inv/opdg-hdrs/backoffice-ep` stores the header as `PROCESSING` (`createProcessingContainer`) and enqueues `OpdgCreationProcessor` (same queue code), which copies every ACTIVE guide element of the PDG into `bl_inv_opdg_element` for the outlet (`OpdgCreationProcessorService.generateOpdgElements`) and then sets the header `ACTIVE`. Elements are created **without quantities** — the outlet starts from empty OPDG cells, not from the PDG numbers.

**Edits** — guide cells, OPDG cells and brand rows are plain `PUT`/`POST` calls validated by the DCOs; each writes an audit-trail row (`AppletAuditTrailService`, controllers).

**Delete PDG** (listing action → `DELETE …/inv/pdg-hdrs/backoffice-ep/{guid}`) is a **permanent** row delete (`InventoryPdgHdrUow.delete` → `SqlDeleteObject(…, deletePermanent = true)`). `bl_inv_pdg_guide_element` and `bl_inv_opdg_element` cascade (`ON DELETE CASCADE`), but `bl_inv_opdg_hdr.pdg_hdr_guid` has a plain foreign key, so a PDG that already has an OPDG header **cannot be deleted** — the database rejects it and the applet shows its generic error toast. Delete the OPDG headers first (`DELETE …/inv/opdg-hdrs/backoffice-ep/{guid}`; OPDG elements referencing the header are `NOT VALID` FKs and are not cascaded).

**What the applet reads elsewhere:** `bl_inv_mst_location` (and writes its `outlet_size_guid` / `outlet_type_guid` from *Opdg Add*), `bl_inv_outlet_type_hdr`, `bl_inv_outlet_size_hdr`, `bl_inv_mst_category_level_setting_hdr`, `bl_fi_mst_label_list_hdr`, `bl_fi_mst_label_hdr`, `bl_fi_mst_item_hdr`. It writes nothing to inventory balances, documents or the general ledger.

## Related applets

- [Organisation Applet](/applets/master-data/organisation-applet/) — owns the Outlet Type / Outlet Size lists and the per-location assignment that every PDG column and every OPDG depends on; *Opdg Add* writes back to the location.
- [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) — owns category groups, categories, the Item Category level mapping and the brand labels; PDG rows exist only for category pairs that real items carry.
- [CP Commerce Admin Applet](/applets/ecommerce/cp-commerce-admin-applet/) — links here as catalogue data; there is no data flow between the two applets (PDG is an in-store display plan, not a web catalogue).

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| A new PDG never leaves `PROCESSING`, or vanishes from the listing after a while | The background job failed — most often no ACTIVE location has *both* the chosen Outlet Size and Outlet Type, so location combinations cannot be generated; the processor then sets the header `DELETED`, which the listing hides. | Assign Outlet Size/Type on the outlets first (Organisation Applet › Location), or widen the filters; re-create the PDG. Check the tenant queue log for `PDG_CREATE_AND_UPDATE_PROCESSOR`. |
| Guide tab shows fewer rows than expected, or a category is missing | Only category pairs carried by at least one ACTIVE item are generated. | Assign the categories on the items in Doc Item Maintenance, then save the PDG again (update regenerates the combinations). |
| An outlet is missing from the OPDG Report / OPDG outlet listing although its manager "set it up" | The location's `outlet_size_guid` / `outlet_type_guid` is null or points to a size/type that is not ACTIVE; the report joins on both (repo issue #17, 2026-04). Also: an outlet appears in *Opdg Outlet Listing* only after it has at least one ACTIVE OPDG element. | Fix the location's Outlet Size/Type in the Organisation Applet (or via *Opdg Add*, which writes them) and re-create the OPDG. |
| Outlet user sees every outlet, or none | `TNT_API_DOC_PDG_READ_LOCATION_TGT_GUID` has no target list (→ no filtering) or a target list without their location. | Set the permission with the right location targets in Settings › Permission Wizard; the filter is client-side only. |
| Permission Wizard page is blank | Older builds lacked the route resolver (repo issue #20). | Redeploy a build after 2026-05. |
| *Opdg By Brands* quantities "do not save" after switching Brand Corner to Y | The brand rows and the OPDG cell were saved out of order / the chart was not reloaded (repo issues #5, #8, PRs #25, #29 in 2026-02 to 2026-07). Also, `brand_corner_boolean` is a varchar `'Y'/'N'` — a client sending a boolean is rejected (issue #4). | Use a build after 2026-07-08; enter the OPDG Quantity first, then Y, then the brand rows whose total equals (PDG › Outlet Guide chart) or does not exceed (OPDG-menu chart) the OPDG Quantity. |
| Brand missing from the *Opdg By Brands* drop-down | The brand is not a label in Doc Item Maintenance (`bl_fi_mst_label_hdr`); brand rows carry `label_hdr_guid` since 2025-09 (repo `customer-repo-7b4a2c` #22, #31). | Create the brand label, then pick it. |
| Import row fails with *"Category Group … does not exist in Item Category of Doc Item Maintenance Settings"* | B15/C15 name a category group that is not mapped to a Category Group 1…10 level. | Map it in Doc Item Maintenance › Settings › Item Category. |
| Import fails with *"Outlet Type and Outlet Size does not exist for any location"* | E14/E15 codes exist but no location carries that pair. | Assign the pair to at least one location. |
| Import fails with *"No item exists for the Category combination …"* | The row's category pair is not carried by any ACTIVE item. | Fix the items or remove the row. |
| Whole import fails with a `java.lang.RuntimeException` in Error Message | A required cell (B2, B3, B6, B7, B15, C15, E14, E15, or a row's category/qty) is blank, or a date is not `dd-MMM-yyyy`. | Compare the workbook with the template layout above; cell positions are fixed. |
| Cannot delete a PDG ("error" toast) | The PDG has OPDG headers; the FK `fk_bl_inv_opdg_hdr_pdg_hdr_guid` has no cascade and the delete is permanent. | Delete or inactivate the OPDG headers first. |
| PDG cell edits rejected with *"The user is not authorized to perform this action."* | Missing `API_TNT_DM_INV_PDG_GUIDE_ELEMENT_UPDATE` (or the OPDG-element / brand equivalents). | Add the permission set to the role. |

## Related documentation

- [Inventory module](/modules-v2/inventory/)
- [Organisation Applet](/applets/master-data/organisation-applet/) — Outlet Type / Outlet Size and Location Edit
- [Doc Item Maintenance Applet](/applets/master-data/doc-item-maintenance-applet/) — Category Groups, Item Category mapping
