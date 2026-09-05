---
title: "Stock Take"
description: "Reference for the Stock Take applet — counting sessions per location, registered counting devices, scan and manual record capture with serial and batch validation, and the variance report that compares counted quantities with the stock ledger."
applet_code: "StockTakev2"
applet_repo: "blg-applet-wavelet-stock-take-applet"
modules: [inventory]
related_applets: [stock-adjustment-applet, stock-balance-applet, stock-availability-applet, stock-report-applet, inv-item-maintenance-applet, warehouse-management-applet, organisation-applet, workflow-design-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/main.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/app.routing.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/app.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/shared/menu-items.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/models/stock-take.constants.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/create/create.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/edit/edit.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/record-container/edit/edit.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/record-container/listing-scan/listing-scan.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/record-container/items-container/create/create.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/report-container/upload-excel/upload-excel-file.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/state-controllers/stock-take-controller/store/effects/item.effects.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/resolver/permission.resolver.ts
    - blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts
    - blg-shared-utilities/utilities/workflow-process/workflow-process.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/StockTakeSessionHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/StockTakeSessionHdrPermissionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/AkaunTenantPermissions.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/AkaunTenantPermissionsV2.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissions.java
    - akaun_master.bl_applet_hdr (code StockTakev2) and bl_applet_client_side_perm_dfn (applet StockTakev2)
  fields:
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/create/create.component.html
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/edit.component.html
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/edit.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/device-container/create/create.component.html
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/create/create.component.html
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/create/create.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/edit/edit.component.html
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/record-container/items-container/create/create.component.html
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/record-container/listing-scan/listing-scan.component.html
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/record-container/edit/edit.component.html
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/record-container/listing/listing.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/report-container/listing/listing.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/listing/listing.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/report-container/listing/listing.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/models/stock-take.model.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/models/dbschema/bl_inv_stock_take_session_hdr.model.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/models/dbschema/bl_inv_stock_take_session_record.model.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/models/dbschema/bl_inv_stock_take_session_report_line.model.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/StocktakeReportLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/StockTakeSessionHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/StockTakeSessionRecordService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/stocktakedataconsistencyobjects/StockTakeHeaderDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/stocktakedataconsistencyobjects/StockTakeSessionRecordDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/stocktakedataconsistencyobjects/StockTakeReportLineDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/stocktakedataconsistencyobjects/StockTakeRecordCollectionDco.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/StockTakeSessionReportLineUow.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/StockTakeSessionHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/StockTakeSessionRecordController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/StockTakeSessionReportLineController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/custom/digi/StockTakeReportLineController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/stock/StakeTakeMobileOfflineController.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_stock_take_session_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_inv_stock_take_session_report_line.java
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/stock-service/stocktake-generate-report.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/stock-service/stocktake-hdr.service.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/state-controllers/stock-take-controller/store/effects/st-session.effects.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/state-controllers/stock-take-controller/store/effects/session.record.effects.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/state-controllers/stock-take-controller/store/effects/device.record.effects.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/state-controllers/stock-take-controller/store/effects/session.report.effects.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/report-container/listing/listing.component.html
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ErrorCodesConstants.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ErrorCodesConstants2.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/errorCodesConstants/TntErpErrorCodesConstants.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/StocktakeReportLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/StockTakeSessionHdrService.java
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/state-controllers/stock-take-controller/store/effects/item.effects.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/device-container/record-container/listing-scan/listing-scan.component.ts
    - blg-applet-wavelet-stock-take-applet/micro-fe/projects/wavelet-erp/applets/stock-take-applet/src/app/components/session-container/edit/report-container/upload-excel/upload-excel-file.component.ts
    - gh:customer-repo-ce5219#512
    - gh:customer-repo-ce5219#513
    - gh:customer-repo-ce5219#532
    - gh:customer-repo-ce5219#533
    - gh:customer-repo-ce5219#525
    - gh:customer-repo-ce5219#184
    - gh:customer-repo-ce5219#181
    - gh:customer-repo-ce5219#201
    - gh:customer-repo-ce5219#281
    - gh:customer-repo-ce5219#508
    - gh:bigledger/blg-intranet#3449
    - gh:bigledger/blg-intranet#4420
    - gh:bigledger/blg-intranet#4421
    - gh:bigledger/blg-intranet#4406
tags:
- stock-take
- inventory-control
- variance-management
- cycle-count
- warehouse-operations
weight: 165
aliases:
- /applets/stock-take-applet/
---

## Overview

The Stock Take applet is where you count what is physically on the shelf and compare it with what the stock ledger says. You open a **session** for one location, attach the **devices** that will do the counting, capture **records** (item, quantity, unit of measure, serial or batch number) by scanning or by typing, and then generate the session **report**: for every item the counted quantity beside the system balance, a tolerance band that allows for movements during the count, the serial numbers that are missing or unexpected, and the cost of the difference.

It is used by store and warehouse staff to count, by supervisors to run and close sessions, and by finance or audit to review variances and record reasons. It comes after the stock ledger has been built up by purchasing, sales and transfers, and before a [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) — the stock take **never changes a balance itself**; it only measures the gap.

An Android companion app (repository `akn-kotlin-mobile-stocktake`) writes to the same sessions and records through the same endpoints and adds an offline mode; this page documents the web applet.

## Where it fits

| Position | Applet / document | Why |
|---|---|---|
| Module | [Inventory](/modules-v2/inventory/) | Physical audit of one location at a time |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) (locations and their company), [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) (scan codes, multi-UOM barcodes, serial / batch type) | A session is keyed by location; records are keyed by item scan code |
| Upstream | Finalised stock documents — GRN, sales, transfers, adjustments | They build the ledger the report compares against; without them every system balance is 0 |
| Sibling | [Stock Balance](/applets/inventory-workflow/stock-balance-applet/), [Stock Availability](/applets/inventory-workflow/stock-availability-applet/), [Stock Report](/applets/inventory-workflow/stock-report-applet/) | Read the same ledger; the Stock Balance With Serial report doubles as a count sheet |
| Downstream | [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/) | The only way a counted variance becomes a ledger movement — raised manually, not by this applet |
| Optional | [Workflow Design](/applets/master-data/workflow-design-applet/) | Supplies the Workflow Status / Resolution values shown on a session |
| Optional | [Warehouse Management System](/applets/inventory-workflow/warehouse-management-applet/) | Bundles this applet's build for counting inside the WMS |

## Screens and menus

The applet's own menu has three entries plus the standard Settings and Personalization.

**Stock Take Session** — the session listing (Session Name, Session Code, Location, Company, Status, Start Date, Modified Date; 100 rows per page). **+** opens *Create Session*. Clicking a row opens *Edit Session* with four tabs:

- **Details** — the session header (see Fields).
- **Devices** — the counting devices attached to this session. **+** opens *Create Device Session*; clicking a row opens *Edit Device Session*, which has its own **Details** tab (device, brand, model, status, Remove) and **Records** tab. The device's Records tab is where counting happens: with *Automatically Scan Item To The Listing* on it is the **Scan Form**; off it is a plain record listing whose **+** opens *Add Item* (an item search) and then *Create Record Session* (the structured entry form).
- **Records** — every record in the session across all devices (Item Name, Item Code, Device Name, Quantity, UOM, Modified Date). Clicking a row opens *Edit Record Session* (quantity and serial number editable; Remove).
- **Report** — **GENERATE** (first time) / **REGENERATE**, **UPLOAD REASON**, a search with a *Report Type* filter, and the variance grid with an inline-editable *Reason* column. Edits to Reason are saved by the session's **SAVE** button.

{{< figure src="/images/stock-take-applet/session-report-tab.png" alt="Edit Session with the Report tab selected, showing the GENERATE button, the search box and the report grid with Item Name, Item Code and EAN Code columns." caption="Edit Session › Report before the first generation. GENERATE builds one report line per item at the session's location." >}}

{{< figure src="/images/stock-take-applet/session-report.png" alt="Edit Session Report tab after generation, showing REGENERATE and UPLOAD REASON buttons above the report grid." caption="After the first run the button becomes REGENERATE and UPLOAD REASON appears. Both stay disabled once the session is Closed." >}}

{{< figure src="/images/stock-take-applet/session-report-search.png" alt="Report tab advanced search panel with Report Type, Item Code and Item Name filters." caption="Report tab search: Report Type narrows the grid to Scanned Items (counted quantity above zero), Active Items (item EMP status ACTIVE) or All Items." >}}

**UPLOAD REASON** opens *Upload report excel file*: choose a Report Type, **EXPORT** the variance report to `.xlsx`, fill in `TotalQty` and `reason`, drop the file back and press **Fill the reason**.

{{< figure src="/images/stock-take-applet/stock-take-upload-reason-1.png" alt="Upload report excel file screen beside the Report tab, with Report Type set to Scanned items, an EXPORT button, a drop zone with a file attached and the Fill the reason button." caption="Upload report excel file: export, fill TotalQty and reason, re-import." >}}

**Devices** — the device master (Device Name, Device Code, Brand, Model, Status, Modified Date). **+** opens *Create Device*; a row opens *Edit Device* (same fields plus audit fields and a Delete button). Only ACTIVE devices can be attached to a session.

**Report** — a cross-session listing grouped by location (Date, Session Name, Status, Status Variance) with **Download**, which exports the grid to Excel. Clicking a row opens the same *Edit Session* screen.

**Settings** — *Field Settings* and *Default Selection* under System Configuration, then the shared Permission Wizard, Permission Set, User Permission, Role Permission, Team Permission, Client-Side Permission, Feature Visibility and Webhook screens, and the Release Notes / Audit Trail developer tools.

{{< figure src="/images/stock-take-applet/stock-take-settings-page.png" alt="Applet Settings screen listing Field Settings, Default Selection, the server-side permission screens and developer tools." caption="Settings: Field Settings holds every setting this applet reads." >}}

**Personalization** — shows a *Default Selection* entry; see Configuration for why it does not open.

## Configuration

### Before you can use it

| Prerequisite | Where | Why it matters |
|---|---|---|
| A location, linked to a company | [Organisation](/applets/master-data/organisation-applet/) | A session is created against one location; the company is read from the location and cannot be typed. Branch is never set by this applet. |
| Items with scan codes | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | A scanned code is matched against the item's scan code and its `MULTI_UOM` line barcodes; an unmatched code is rejected as *Code invalid*. Serialised items need sub-item type `SERIAL_NUMBER`; batch items need batch numbers registered. |
| A stock ledger at that location | Finalised GRN, sales, transfer and adjustment documents | The report's opening balance, movements and closing balance come from `bl_inv_txn_line` at the session location; an item with no lines reports a system balance of 0. |
| Serial numbers with a positive balance | Purchase / adjustment documents that registered them | With *Validate Serial Numbers* on, a typed or scanned serial must exist with quantity balance above 0 or the record is rejected. |
| At least one ACTIVE device | This applet › Devices | A session with no attached device cannot receive records; the mobile app registers its own device on first login. |
| A workflow process (optional) | [Workflow Design](/applets/master-data/workflow-design-applet/) | Needed only if you want the Workflow Status / Resolution fields on a session to hold values. |
| Field Settings saved at least once | This applet › Settings › Field Settings | Closing a session makes the backend read `STOCK_DURING_OPENING_SHOP` from the stored applet settings; if the key has never been saved the close returns *Applet Settings Not Found!* (see Lifecycle). |
| Server-side permissions | Settings › Permission Wizard | Every session, record, device and report-line endpoint checks its own `API_TNT_DM_STOCK_TAKE_*` permission (see Feature visibility / permissions). |

### Applet settings

Settings live in an **applet-local Field Settings screen** (`Settings › Field Settings`), not on the shared Application Settings screen used by the document applets. The screen is one form; **SAVE** writes the whole form as the `APPLET_SETTINGS` JSON on the applet record (`bl_applet_ext`, through the shared session effects), so all settings are tenant-wide and apply to every user. Anyone who can open the applet's Settings menu can change them; there is no per-setting permission.

{{< figure src="/images/stock-take-applet/auto-scan.png" alt="Field Settings screen with six slide toggles under Records Settings and a Workflow Process drop-down under Workflow Settings." caption="Settings › Field Settings — the only settings screen this applet reads." >}}

Every control has no initial value (`new FormControl()`), so on a fresh tenant each toggle is *off* until the first SAVE.

| Setting (label · key) | What it controls | Default | Effect when changed |
|---|---|---|---|
| Automatically Scan Item To The Listing · `ENABLE_AUTO_SCAN` | Which counting screen a device's Records tab shows. On: the **Scan Form** (scan code → validate → add). Off: the plain record listing whose **+** leads to *Add Item* → *Create Record Session*. | off | Takes effect the next time a device's Records tab is opened. Existing records are unaffected. |
| Validate Serial Numbers · `ENABLE_VALIDATE_SERIAL` | Whether a serial number typed or scanned into a record must exist in the serial-number register with a positive balance. Structured entry marks the field *invalid serial*; the Scan Form marks the row INVALID and, for a serialised item scanned without a serial, adds the remark *Serialized item but no serial number provided*; a serial already in the list is *Serial number already exist*. Also read by the Excel upload screen (stored, not acted on there). | off | Immediate for new records. Off means any string is accepted as a serial. |
| Do The Stock During Opening Store · `STOCK_DURING_OPENING_SHOP` | **Read by the backend, not the applet.** When a session is saved as Closed, `StockTakeSessionHdrService.updateReport` reads this key: *on* — the session's Status Variance is YES if the counted quantity falls outside the report's Min–Max band; *off* — YES if counted quantity differs from the system closing balance (EMP Quantity). | off (unset — see Lifecycle for the error when the key is absent) | Only affects sessions closed after the change. |
| Scan Code Mobile View · `SCAN_CODE_MOBILE_VIEW` | Shows the camera scanner block (Barcode Type drop-down, SCAN / STOP) on the Scan Form, using the browser camera. | off | Immediate. Needs the Scan Form (`ENABLE_AUTO_SCAN` on). |
| Hide Add Button · `HIDE_ADD_BUTTON` | On the Scan Form, hides **ADD** and adds the scanned item automatically as soon as it validates. | off | Immediate. With it off, each scan must be confirmed with ADD. |
| Workflow Process · `WORKFLOW_PROCESS_GUID` | The Workflow Design process whose default status and resolution are stamped on every new session; the session's *Workflow Status* drop-down then offers that process's available transitions. | none | New sessions only. Sessions created before the change keep whatever process (or none) they were created with. Nothing in the applet or backend enforces the workflow status (see Lifecycle). |

**Stored but read by nothing.** *Check serialized item from item extension* (`SERIALIZED_ITEM_EXT`) is rendered and saved, but no component reads it — both entry screens decide "serialised" from the item's sub-item type `SERIAL_NUMBER` regardless of the toggle.

**Declared but not rendered.** `QTY_DELIMITER` is in the settings model and form but its input is commented out of the template; the Scan Form always splits `quantity*code` on a hard-coded `*`.

**Default Selection (Settings)** shows *Default Branch* and *Default Location* drop-downs, but the component is routed without the container that supplies the applet record: choosing a value throws on an undefined container and **SAVE** emits to no listener. Nothing reads `DEFAULT_BRANCH` / `DEFAULT_LOCATION`. **Personalization › Default Selection** has no route at all — the link falls through to the wildcard redirect and reopens the session listing.

### Session behaviour settings

This applet is not a generic document: there are no posting, printable, e-Invoice or approval toggles. The only behaviour switches are the `WORKFLOW_PROCESS_GUID` and `STOCK_DURING_OPENING_SHOP` rows above.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Item scan code and `MULTI_UOM` line barcodes / ratios | Inventory Item Maintenance › item › UOM lines | A scan is matched against the item code, the item scan code and every UOM barcode; the UOM drop-down on both entry screens lists the base UOM plus each `MULTI_UOM` line, and the record quantity is stored in base units (`count × ratio`). The report divides all quantities by the largest conversion so the grid shows pack counts. |
| Sub-item type `SERIAL_NUMBER` / batch numbers | Inventory Item Maintenance | Decides whether the serial / batch fields are required and validated. |
| Item EMP status | Inventory Item Maintenance | The *Active Items* report type keeps only items whose EMP status is ACTIVE. |
| Moving-average unit cost | Written by finalised stock documents | The report's *Cost Value* is the item's latest `cost_ma_price` at the location; *Total Cost* = (counted − system balance) × that price. FIFO tenants therefore see the MA cost, not their FIFO cost. |
| Location → company link | Organisation | Fills the read-only Company field on a session. |
| Workflow process, statuses, resolutions | Workflow Design | Populate the Workflow Status / Resolution fields when `WORKFLOW_PROCESS_GUID` is set. |

### Feature visibility / permissions

**Client-side permission.** One definition is seeded for `StockTakev2` in `bl_applet_client_side_perm_dfn`: `COST_COLUMN_VIEW` (*Cost Column View*). Nothing in the applet or the shared utilities checks it — the *Cost Value* and *Total Cost* columns render for everyone. No `HIDE_*` / `SHOW_*` pairs exist in this applet.

**Server-side permissions** (Settings › Permission Wizard / Permission Set / User, Role, Team Permission). Each object has its own OWNER / ADMIN / MEMBER / CREATE / UPDATE / DELETE / READ family; a tenant owner or admin passes every check.

| Family | Guards | Target of the check |
|---|---|---|
| `API_TNT_DM_STOCK_TAKE_SESSION_HDR_*` | Create, update, delete, read sessions | The session's company, branch and location (`StockTakeSessionHdrPermissionService.targetsForSession`) — a user permitted only for location A cannot save a session at location B |
| `API_TNT_DM_STOCK_TAKE_SESSION_RECORD_*` | Create / update (multi endpoints) and delete records | Create and update are checked without a target; delete and single read are targeted at the record |
| `API_TNT_DM_STOCK_TAKE_SESSION_DEVICE_*` | Attaching devices to a session | Session device row |
| `API_TNT_DM_STOCKTAKE_DEVICE_*` | The device master | Device row |
| `API_TNT_DM_STOCK_TAKE_SESSION_REPORT_LINE_*` | Editing report lines (Reason, Excel upload) | Report line |
| `API_TNT_DM_ERP_STOCK_TAKE_PROCESS_INSTANCE_*` | The workflow process-instance endpoints | Not called by the web applet |

The applet shell asks the permission inquiry endpoint for `API_TNT_DM_STOCK_TAKE_SESSION_HDR_READ`, `…_CREATE`, `TNT_TENANT_ADMIN` and `TNT_TENANT_OWNER` at start-up; the results are loaded into the store but no screen or button in this applet is gated by them — denial surfaces as a backend error when the call is made. Report generation (`generate-stocktake-reports/session/{guid}`) is an anonymous tenant endpoint: any signed-in tenant user can regenerate any session's report.

## Fields

### Session — Create Session / Details tab

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Session Name | Free text | Yes | |
| Session Code | Your reference for the count | Yes | Not checked for uniqueness by the backend |
| Location | The one location being counted | Yes | Drop-down of all locations. Changing it on an existing session changes what the next REGENERATE compares against. |
| Company | Read-only | — | Filled from the selected location's company |
| Description | Free text | No | Trimmed on save |
| Status | `Open` / `Closed` | — | Defaults to Open. Setting Closed and saving disables SAVE, record and device changes in the UI and triggers the Status Variance calculation (see Lifecycle). |
| Workflow Status | Current status of the linked workflow process | — | Read-only on create (the process's default status); on edit a drop-down of the transitions available from the current status. Empty when no `WORKFLOW_PROCESS_GUID` is set. |
| Workflow Resolution | Resolution mapped to the chosen status | — | Read-only; follows Workflow Status |
| Session Start Date / Session End Date | First and last record capture times | — | Read-only; maintained by the applet from record timestamps (see Lifecycle) |
| Created By / Created Date / Modified By / Modified Date | Audit | — | Created By and Modified By show the subject GUID, not a name |

### Device master — Create Device / Edit Device

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Device Name | Label shown in listings | Yes | |
| Device Code | Identifier | Yes | The mobile app registers its hardware id here |
| Brand / Model | Free text | No | |
| Status | `ACTIVE` / `INACTIVE` | — | Defaults to ACTIVE. Only ACTIVE devices appear in the session's device picker, and the Scan Form refuses to scan on an inactive device (*This Device is Inactive, Cannot scan items*). |

### Session device — Create Device Session / Edit Device Session

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Device Code & Name | Pick from ACTIVE master devices | Yes | Searchable drop-down |
| Brand / Model | Read-only | — | Copied from the master device |
| Status | `ACTIVE` / `INACTIVE` for this session | — | Defaults to ACTIVE |
| Remove | Detaches the device | — | Disabled once the session is Closed |

The logged-in user's GUID is stored as the session device's `login_guid`; records created through it carry the session device GUID.

### Record — Create Record Session (structured entry; `ENABLE_AUTO_SCAN` off)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Scan Code | Item code, item scan code or a UOM barcode | Yes | Looked up on Enter or the search icon. Errors: *invalid_item_code*, *session_unavailable*, *device_unavailable*. |
| UOM | Unit the count is in | Yes | Base UOM plus each `MULTI_UOM` line; the stored quantity is count × ratio |
| Quantity Count | The quantity to record | Yes | Filled from *Quantity Scan* (number of serials entered) or *Quantity Manual* depending on the radio button |
| Item Name / Item Code / EAN Code | Read-only | — | Filled by the lookup |
| Quantity Scan / Quantity Manual | Radio choice of which quantity applies | Yes | *Quantity Manual* must be at least 1 |
| Serial Number | One serial, or several separated by commas | For serialised items | Upper-cased; duplicates ignored; with *Validate Serial Numbers* on each must exist with balance above 0 (*invalid_serial* / *invalid_serial_multi*) |
| List of added serial numbers | Chips of accepted serials | — | The number of chips must equal Quantity Count or the form shows *serial_number_qty_imbalance* and cannot be saved |
| SAVE & CONTINUE / SAVE & NEW | Save and stay on the form / save and clear it | — | |

### Record — Scan Form (`ENABLE_AUTO_SCAN` on)

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Barcode Type + SCAN / STOP | Browser-camera scanner | — | Only with *Scan Code Mobile View*. Readers: Code 128, EAN, EAN-8, Code 39, Code 39 VIN, Codabar, UPC, UPC-E, I2of5, standard 2 of 5, Code 93. |
| Scan code | Item code, scan code or UOM barcode; `3*CODE` records quantity 3 | Yes | Validated in the background; the row is orange while *VALIDATION IN PROGRESS*, red when *INVALID* (*Code invalid*) |
| UOM | Unit of the quantity | No | Defaults to the matched UOM |
| Quantity | Count | — | Defaults to 1; multiplied by the UOM ratio when stored |
| Batch/Serial Number | Serial or batch, validated on Enter | For serialised / batch items | *Invalid serial number* / *Invalid batch number* when not found; *Item is not serialized or batch & expiry type* when a value is given for a plain item |
| Remarks | Free text | No | Also editable inline in the grid after the record is created |
| ADD | Confirms the row | — | Hidden by *Hide Add Button*, in which case a validated scan is added automatically |

Grid columns: Quantity (in the selected UOM), Record Status (`IN PROGRESS`, `VALIDATION IN PROGRESS`, `VALID`, `INVALID`, `CREATED`), Remarks, SN# / Batch #.

### Record — Edit Record Session

Item Name, Item Code, EAN Code and audit fields are read-only. Quantity is editable for non-serialised items; for serialised items the Serial Number field is edited instead and the quantity is recomputed as the number of comma-separated serials. UOM can be changed from the item's UOM list. SAVE and Remove are disabled once the session is Closed.

### Report line — Report tab

| Column | Source | Meaning |
|---|---|---|
| Item Name / Item Code / EAN Code | Item master | The first `MULTI_UOM` barcode is shown as EAN Code |
| Min Quantity | `qty_calc_min` = opening balance + outbound movements during the session | Lowest quantity the shelf could legitimately hold |
| Max Quantity | `qty_calc_max` = opening balance + inbound movements during the session | Highest quantity it could hold |
| Total Quantity | `qty_counted_sum` = sum of record quantities for the item | What was counted |
| EMP Quantity | `sys_bal_end` = opening balance + all movements between start and end | The system closing balance |
| Variance | Min − Total if below Min; Max − Total if above Max; otherwise 0 | Red when non-zero |
| Variance 2 | Total − EMP Quantity | Straight difference; positive means more on the shelf than in the ledger |
| System Serial No | Serials with a positive balance at the location that were not counted | |
| ST Serial Number | Serials counted that the ledger does not hold | |
| SN Variance | Number of serials in the two columns above | |
| Cost Value | Latest moving-average unit price at the location | Two decimals |
| Total Cost | (Total − EMP) × Cost Value | The value of the discrepancy |
| Reason | `remarks` | Editable inline; saved by the session SAVE button or by the Excel upload |

All quantity columns are divided by the item's largest UOM conversion factor when the item has `MULTI_UOM` lines, so they read as pack counts; the underlying report line stays in base units.

**Excel export columns:** `no`, `itemCode`, `eanCode`, `itemName`, `TotalQty`, `MaxQty`, `MinQty`, `EMPQty`, `systemSerialNumber`, `STSerialNumber`, `SNVariance`, `variance1`, `variance2`, `costValue`, `totalCost`, `reason`. **The import reads** `itemCode`, `TotalQty` and `reason` from the sheet named `data` (or `Sheet1`). For multi-UOM items the key is the largest UOM's barcode and `TotalQty` is multiplied back by that ratio.

## Lifecycle and effects

**Statuses.** A session is `OPEN` or `CLOSED` (the two values the Status drop-down offers). The backend accepts any string and its report generator additionally recognises `COMPLETED`; there is no state machine — Closed is chosen from the drop-down and saved.

**What Closed does.**

- In the web applet: the session **SAVE** button, device Remove, record SAVE / Remove, the **+** on record listings and GENERATE / REGENERATE / UPLOAD REASON are disabled. These are client-side guards only: the record and device DCOs validate existence and references, not the parent session's status, so the API (and the mobile app) can still write records to a Closed session.
- In the backend: the update endpoint, when the saved status is `CLOSED` and the request carries the applet GUID (`PUT …/stocktake-hdr?app_hdr_guid=…`, which the web applet always sends), runs `StockTakeSessionHdrService.updateReport`. It reads `STOCK_DURING_OPENING_SHOP` from the applet's stored settings — throwing `Applet Settings Not Found!` if the key was never saved, after the status change has already been committed — and writes `status_variance` on the session: `YES` or `NO` by the rule in the settings table, `NA` for any save that is not Closed. The check evaluates **only the first report line returned** (the loop breaks after one row), so the Status Variance column on the Report listing is not a reliable summary of the whole session.
- Reopening: the web applet offers no way back from Closed (SAVE is disabled); the API accepts a status of `OPEN` on the same endpoint.

**Session dates.** `date_start` and `date_end` are set by the applet, not by the user: the first record created stamps `date_start`, every later create or edit moves `date_end`, and deleting records recomputes both from the remaining records. The report uses them as the window for "movements during the count".

**Report generation.** GENERATE / REGENERATE call `generate-stocktake-reports/session/{sessionGuid}?update_report=true&active_items=false`. `StocktakeReportLineService.generateReportUsingSqll` requires the session to be `OPEN`, `CLOSED` or `COMPLETED` (otherwise *STOCKTAKE STATUS SHOULD BE CLOSED OR COMPLETED!*), a location, and both dates (*STOCK_TAKE_SESSION_HDR_START_DATE_IS_NULL_OR_EMPTY* / *…END_DATE…*). One SQL statement then upserts a report line for **every non-deleted item in the tenant** (unique on session + item):

- opening balance = signed sum of `bl_inv_txn_line` at the location before `date_start`, from the latest brought-forward line;
- inbound / outbound = positive / negative signum lines dated strictly between `date_start` and `date_end`;
- `qty_calc_min` = opening + outbound, `qty_calc_max` = opening + inbound, `sys_bal_end` = opening + both;
- `qty_counted_sum` = sum of the session's non-deleted records for the item; `stocktake_sn` = their serials; `sys_bal_sn` = serials with a positive balance at the location;
- `unit_cost_value` = the latest `cost_ma_price`, `unit_cost_method` = `MA`.

A regeneration overwrites counted quantities, balances, serials and cost on existing lines but keeps `remarks`, so reasons survive a REGENERATE; quantities uploaded through the Excel screen do not.

**Reason upload** validates every `itemCode` against the current report (*this item code X is not exist* stops the whole import; *Some fields(Phy qty or item code) are empty* lists blank rows), then updates the report lines in batches of 1000 through `PUT …/stocktake-report-line/multi`, setting `qty_counted_sum` and `remarks`. It changes the report line only — the records are untouched.

**Posting proof block.** *Server document type:* none — sessions, devices, records and report lines are their own tables (`bl_inv_stock_take_session_hdr`, `_device`, `_record`, `_report_line`), not generic documents. *Amount signum / quantity signum:* not applicable — there is no `*DataConsistencyObject` signum, no `JournalPostingTypeHandler` entry, no `JournalPostingService` path. *Dr/Cr equation:* none. *GL precedence:* none. *Stock processor:* none — nothing here writes `bl_inv_txn_line`; the report only reads it. *What VOID reverses:* there is no VOID; a session delete is a soft delete (`status = DELETED`) of the header and is reachable only through the API (the Delete button is commented out of the Edit Session screen). The report line carries `action_adjust_*` columns and the session a `status_adjustment` column, but no backend code reads or writes them: **converting a variance into a stock movement is a manual [Stock Adjustment](/applets/inventory-workflow/stock-adjustment-applet/)**.

**Backend validation that can reject a save** (each returns a `Core2DataConsistencyException` with the code shown): session — `STOCKTAKE_HDR_OBJECT_COMP_GUID_DOES_NOT_EXIST`, `…_BRANCH_GUID_DOES_NOT_EXIST`, `…_LOCATION_GUID_DOES_NOT_EXIST`, `API_TNT_DM_ERP_STOCK_TAKE_SESSION_HDR_WF_PROCESS_HDR_GUID_DOES_NOT_EXIST` / `…_WF_PROCESS_STATUS_GUID_…` / `…_WF_RESOLUTION_GUID_…`; record — `STOCKTAKE_RECORD_OBJECT_HDR_GUID_DOES_NOT_EXIST`, `…_GUID_ITEM_DOES_NOT_EXIST`, `…_GUID_BIN_DOES_NOT_EXIST`, `…_DEVICE_GUID_DOES_NOT_EXIST` (checked only when a device GUID is supplied), `STOCKTAKE_RECORD_OBJECT_ITEM_CODE_IS_NULL_OR_EMPTY`, `STOCKTAKE_RECORD_OBJECT_GUID_DUPLICATE` on a multi-create. Nothing on the server checks that a quantity is positive, that serial count equals quantity, or that the device belongs to the session.

## Related applets

- [Stock Adjustment (Internal)](/applets/inventory-workflow/stock-adjustment-applet/) — the document you raise, by hand, for each variance you decide to write on or off; the stock take itself moves nothing.
- [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — the live view of the ledger the report compares against; use them to investigate a variance line.
- [Stock Report](/applets/inventory-workflow/stock-report-applet/) — the Stock Balance With Serial report is a printable count sheet for a location.
- [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) — scan codes, UOM barcodes and serial / batch types decide whether a scan is recognised and how it is validated.
- [Organisation](/applets/master-data/organisation-applet/) — locations and their companies; the permission targets for sessions.
- [Workflow Design](/applets/master-data/workflow-design-applet/) — the optional process behind Workflow Status / Resolution.
- [Warehouse Management System](/applets/inventory-workflow/warehouse-management-applet/) — bundles this applet for counting inside the WMS.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Report *Total Quantity* is higher than the records you can see in the Records tab, or the variance does not match what was scanned | Records exist with no session-device GUID (created by the mobile app before its device row was loaded). The report sums every non-deleted record for the item; the Records tab lists records by device, so orphans are counted but invisible. The backend does not reject a record without a device. | Query `bl_inv_stock_take_session_record` for the session with a null `guid_session_device`, mark them DELETED or re-attach them, then REGENERATE. Update the mobile app to a build that waits for the device row. |
| Scanning an EAN fails with *Code invalid*, typing the full item code works | The item's inventory scan code differs from its financial scan code (the two are stored separately) or the barcode is not on a `MULTI_UOM` line. | Correct the scan code in Inventory Item Maintenance (or run the scan-code sync data fix) and rescan. |
| Items scanned on the mobile app never appear in the web Records tab, or only the first few do | The app discarded records whose POST failed (fixed in later app builds, which reconcile local records against `stocktake-record/query`). | Update the app; re-sync; check the Records tab count before closing. |
| *Cost Value* is 0 or does not match your FIFO cost | The report takes the latest moving-average price at the location; items with no MA history show 0, and FIFO tenants never see FIFO cost here. | Value the variance from the Stock Report / FIFO endpoints; treat *Total Cost* as indicative. |
| GENERATE returns *STOCK_TAKE_SESSION_HDR_START_DATE_IS_NULL_OR_EMPTY* | The session has no records, or the records were created by a client that did not stamp `date_start` (older mobile builds). | Add or edit one record from the web applet — every create / edit refreshes the dates — then GENERATE. |
| Saving a session as Closed shows an error, yet the status is now Closed | `Applet Settings Not Found!` — Field Settings were never saved, so the backend cannot read `STOCK_DURING_OPENING_SHOP`. The status update was already committed. | Open Settings › Field Settings and press SAVE once; the Status Variance for that session stays NA unless it is reopened and closed through the API. |
| *Status Variance* says NO although several lines show a variance | The close-time check evaluates only the first report line. | Use the Report tab's Variance / Variance 2 columns or the Excel export, not the Status Variance column. |
| *Serialized item but no serial number provided* / *Serial number already exist* / *Invalid serial number* on the Scan Form | *Validate Serial Numbers* is on: the item is serialised and the code scanned was the item code, the serial is already in this device's list, or the serial has no positive balance. | Scan the serial itself; remove the duplicate; register the serial through a stock document before counting it — or turn the toggle off for an unvalidated count. |
| *Item is not serialized or batch & expiry type* | A Batch/Serial Number was entered for an item whose sub-item type is neither serial nor batch. | Clear the field; count the item by quantity. |
| *This Device is Inactive, Cannot scan items* | The session device (or its master device) is INACTIVE. | Set it to ACTIVE in Devices or in the session's Devices tab. |
| Cannot add or remove records; SAVE greyed out | The session is Closed. | There is no reopen control in the web applet; reopen through the API or leave the session as a record and open a new one. |
| Records tab shows at most 100 rows; session listing pages by 100 | The Records tab requests 100 rows per page; the device Records tab 1000. | Use the pager or the search box; exports are not limited. |
| *Fill the reason* reports *this item code X is not exist* | An `itemCode` in the sheet is not on the current report — usually a multi-UOM item, whose key must be the largest UOM's barcode, or a Scanned-Items export re-imported after a REGENERATE changed the set. | Export again with the same Report Type, edit only `TotalQty` and `reason`, re-import. |
| Reasons disappeared after REGENERATE | Reasons survive regeneration; uploaded quantities do not. If reasons are missing they were never saved — the inline edit needs the session SAVE. | Press SAVE after editing Reason cells. |
| Personalization › Default Selection reopens the session listing; Settings › Default Selection does nothing | Neither screen is wired (no route / no container). | Ignore both; the applet has no default branch or location. |
| Workflow Status changes but nothing is enforced | The workflow fields are stored on the session only; no code freezes a session by workflow status. | Use Status = Closed to lock a session in the UI. |

## Related documentation

- [Inventory module](/modules-v2/inventory/) — where stock takes sit in the receive → move → count → adjust cycle.
- [Stock Adjustment (Internal)](/applets/inventory-workflow/stock-adjustment-applet/) — posting the variances you accept.
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — investigating a variance line before adjusting.
