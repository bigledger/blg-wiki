---
title: "Non Stock and Trade In Applet"
description: "Reference for the Non Stock and Trade In (NSTI) applet — the per-unit register of traded-in and non-stock items (bl_fi_nsti_stock_hdr), its categories, the CSV import, the Field Settings that hide columns and lock finalised records, and how POS / sales documents create and consume NSTI stock through the NSTI transaction-line processors."
applet_code: "nonStockAndTradeInApplet"
applet_repo: "blg-applet-wavelet-non-stock-and-trade-in-applet"
modules: [inventory, pos, financial-accounting]
related_applets: [doc-item-maintenance-applet, pos-general-applet, internal-sales-invoice-applet, internal-sales-credit-note-applet, stock-availability-applet, stock-balance-applet, stock-report-applet, chart-of-account-applet, financial-report-applet, organisation-applet, tax-configuration-applet, employee-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/app.routing.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/nsti-stock-container.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/listing-nsti/nsti-listing.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-nsti-stock.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-nsti-stock.component.html
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-line-items/line-item-listing.component.html
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-line-items/edit-line-item/edit-line-item.component.html
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/category-container/nsti-category-listing/category-listing.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-import-container/nsti-import-listing/nsti-import-listing.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/NonStockTradeInApplet/NonStockTradeInHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/NonStockTradeInApplet/NonStockTradeInTxnLineController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/NonStockTradeInApplet/NonStockTradeInCategoryController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocumentPrimaryProcessor.java
    - akaun_master.bl_applet_client_side_perm_dfn (applet nonStockAndTradeInApplet — no rows)
  fields:
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/create-nsti/create-nsti.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/create-nsti/item-details/item-details.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/create-nsti/item-details/item-details.component.html
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-details/edit-details.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-details/edit-details.component.html
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-line-items/add-line-item/add-line-item.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-line-items/add-line-item/add-line-item.component.html
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-line-items/line-item-listing.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/edit-nsti/edit-attachments/add-attachment/add-attachment.component.html
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/category-container/nsti-category-create/item-cat-create.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/category-container/nsti-category-create/item-cat-create.component.html
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/category-container/nsti-category-edit/item-cat-edit.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-import-container/nsti-import-create/nsti-import-create.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-import-container/nsti-import-edit/import-file-helper/import-file-helper-listing.component.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/sdk/ERP/nsti-stock/nsti-stock-constants.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/NonStockTradeInAppletUows/NonStockTradeInImportFileColumnNames.java
  lifecycle:
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/state-controllers/nsti-stock-controller/store/effects/nsti-stock.effects.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/non-stock-and-trade-in/nsti-stock.service.ts
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/non-stock-and-trade-in/nsti-stock-txn-line.service.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/NonStockTradeInApplet/NonStockTradeInStockHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/NonStockTradeInApplet/NonStockTradeInTxnLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/NonStockTradeInApplet/NonStockTradeInCategoryService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/NonStockTradeInApplet/NonStockTradeInImportFileHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/NonStockTradeInTxnLineFactory.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/NonStockTradeInAppletDCOs/NonStockTradeInHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/NonStockTradeInAppletDCOs/NonStockTradeInTxnLineDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/NonStockTradeInAppletDCOs/NonStockTradeInCategoryDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseTradeInDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesTradeInDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/NonStockTradeInAppletUows/NonStockTradeInHdrUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/NonStockTradeInAppletUows/NonStockTradeInCategoryUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/stock/StockAvailabilityUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/FinancialReportService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/NonStockTradeInTxnLineProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/NonStockTradeInTxnLineToCurrentStockBalanceProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/NonStockTradeInImportFileProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/JobProcessorClassName.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/NonStockTradeInApplet/NonStockTradeInImportFileHdrController.java
  troubleshooting:
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-stock-container/create-nsti/create-nsti.component.ts
    - blg-applet-wavelet-non-stock-and-trade-in-applet/micro-fe/projects/wavelet-erp/applets/non-stock-and-trade-in-applet/src/app/components/nsti-import-container/nsti-import-create/nsti-import-create.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/NonStockTradeInApplet/NonStockTradeInImportFileHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/NonStockTradeInApplet/NonStockTradeInTxnLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/NonStockTradeInApplet/NonStockTradeInCategoryController.java
    - gh:bigledger/blg-applet-wavelet-non-stock-and-trade-in-applet#8
    - gh:bigledger/blg-applet-wavelet-non-stock-and-trade-in-applet#9
    - gh:bigledger/blg-applet-wavelet-non-stock-and-trade-in-applet#10
    - gh:bigledger/blg-applet-wavelet-non-stock-and-trade-in-applet#11
    - gh:bigledger/blg-intranet#4302
    - gh:bigledger/blg-intranet#4045
    - gh:bigledger/blg-intranet#4046
    - gh:bigledger/blg-int-general-task#1421
    - gh:bigledger/blg-int-general-task#1422
    - gh:customer-repo-a2de10#454
tags:
  - inventory-management
  - non-stock
  - trade-in
  - secondary-market
  - master-data
---

## Overview

The Non Stock and Trade In applet (NSTI) is the register of items that sit outside the normal inventory ledger: **trade-in units** taken from customers (a used phone accepted against a new one at the POS) and **non-stock** items you still want to track one unit at a time. Each record in the listing is one unit — one serial number at one location — with its purchase and sale prices, category, GL code and a running quantity balance. The applet also maintains the NSTI categories and offers a CSV import.

It is opened by the store or inventory team that receives and resells trade-ins, and by finance for the GL side. Most NSTI records are **not typed in here**: they are created by the backend when a POS cash bill or sales document with a trade-in line is finalised, and they are reduced again when the unit is sold. This applet is where you look them up, correct them, finalise them and attach documents.

{{< callout type="info" >}}
**NSTI stock is not inventory stock.** An NSTI unit lives in `bl_fi_nsti_stock_hdr`, not in the inventory ledger. It appears in [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) (which unions the two tables) but not in the historical stock balance report, and its value is closed at month end through the separate `COGS_NSTI` / `STOCK_BALANCE_NSTI` default GL codes. The item itself is an ordinary doc item whose *Transaction Type* is **NSTI** ([Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/)).
{{< /callout >}}

## Where it fits

| Direction | Applet / document | Why |
|---|---|---|
| Upstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) | The *Financial Item* on every NSTI record; only items with transaction type `NSTI` are picked up by the document processors |
| Upstream | [Organisation](/applets/master-data/organisation-applet/) | Company, branch and location on each record; the balance is kept per location |
| Upstream | [Chart of Account](/applets/master-data/chart-of-account-applet/) | The company default GL code `NSTI` (auto-created as "Non-Stock and Trade-In" if missing), `COGS_NSTI` and `STOCK_BALANCE_NSTI` for month-end closing |
| Upstream | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | SST/GST and WHT codes on manually added transaction lines |
| Upstream | [Employee Maintenance](/applets/master-data/employee-applet/) | The optional *Employee* (person in charge) on a record |
| Upstream | [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Credit Note](/applets/sales-workflow/internal-sales-credit-note-applet/) and any other generic document | FINAL documents with serialised NSTI item lines create the transaction lines that create or move NSTI units (trade-in lines add, sales lines remove, credit notes add back) |
| Downstream | [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) | Shows NSTI balances alongside inventory balances |
| Downstream | Month-end closing in [Chart of Account](/applets/master-data/chart-of-account-applet/) / [Financial Report](/applets/finance/financial-report-applet/) | Posts the NSTI closing-stock journal from the closing-stock record |
| Downstream | Sales documents | The backend refuses to sell an NSTI serial that has no balance at the line's location |

Modules: Inventory, Sales, Financial Accounting.

## Screens and menus

Left menu (route `applet/tnt/wavelet/erp/nsti-applet/…`):

| Menu | What it is for |
|---|---|
| **NSTI Stock** | Listing, create and edit of NSTI units (`bl_fi_nsti_stock_hdr`) with their transaction lines and attachments |
| **NSTI Category** | Flat list of categories (`bl_fi_nsti_stock_category`) — code, name, description, status |
| **Import NSTI** | CSV upload into the import helper table, with a listing of past uploads |

Gear (Settings) menu: *System Configuration* › **Field Settings**, **Default Selection**; the shared frame adds *Server Side Permissions* (Permission Wizard, Permission Set, User Permission, Role Permission), *Integration* › Triggers (webhooks) and *Developer Tools*. All of those have routes in this applet except the developer-tools links; Feature Visibility is routed but has no menu entry. **Personalization** lists *Field Settings* (no personalization route — the link does nothing) and *Default Selection*.

{{< figure src="/images/non-stock-and-trade-in-applet/settings.png" alt="Applet Settings page listing Field Settings, Default Selection, Permission Wizard, Permission Set, User Permission, Role Permission, Release Notes and Audit Trail" caption="Settings. Field Settings holds the column-hide and lock toggles described under Configuration; the Teams panel is the shared Manage Team Access screen." >}}

### NSTI Stock listing

Columns: NSTI Code, NSTI Name, Type (`TRADE_IN` / `NON_STOCK`), Serial Number, Category, Branch, Location, Amount (purchase price incl. tax), Stock Balance (`qty_base`), Posting Status (`DRAFT` / `FINAL`), Status, Created Date (the purchase date), Updated Date. Keyword search plus column filters. **+** opens the create panel; clicking a row opens the edit panel.

### Create panel

One *Details* tab (see [Fields](#fields)). Pressing **+** first posts a temporary header (`status = TEMP`, `posting_status = DRAFT`) so that the record already has a guid; **SAVE** then updates it to `ACTIVE` (`nsti-listing.component.ts` `onAdd()`, `nsti-stock.effects.ts` `createTempNstiStock$` / `createActiveNstiStock$`). A **SCAN** button next to *Serial Number* opens the camera barcode reader.

### Edit panel

Tabs **Details**, **Txn Line**, **Attachment** (or three stacked panels when *Vertical Orientation* is on). Header buttons **SAVE** and **FINAL**; a **Delete** button below the tabs (two clicks — the first arms it, the second sends the delete).

- **Details** — the create fields plus read-only *Purchase Date*, *Purchase Price*, *Sales Date*, *Sales Price* (filled by the document processors) and editable *Current Value* and *Current For Sale Price*.
- **Txn Line** — the unit's transaction history (`bl_fi_nsti_stock_txn_line`): Txn Doc No, Txn Date, Doc Short Code, Txn Type (`ACQUISITION` / `DISPOSAL` / `ADJUSTMENT`), Qty, Unit Price, SST/VAT/GST, WHT, Txn Amount; filter by keyword and document type. **Add Transaction** creates a manual line; lines that came from a document are read-only.
- **Attachment** — files attached to the unit (`bl_fi_nsti_stock_attachment`): Attachment Name, Details, file.

### NSTI Category

Listing: Category Code, Category Name, Creation Date, Updated Date, Status. Create: Code, Name, Description, Status. Edit adds **Delete** (two-click). There is no parent category — the list is flat.

### Import NSTI

Listing: File Name, File Size, Format, Status, Process Status (`PROCESSING` / `DONE` / `FAILED`), User Error Message, Created Date, Updated Date, Created by. Create: drag-and-drop or **Upload File**, **ADD**, and a **Sample Format** link that downloads `MasterData_Upload_Nsti_Stock.csv` from the backend. Opening a row shows the parsed helper rows (Code, Name, Type, Category Code …) and a **Delete**.

{{< figure src="/images/non-stock-and-trade-in-applet/import-add.png" alt="Upload Nsti File panel with a drag-and-drop zone, Upload File button, ADD button and a Sample Format link" caption="Import NSTI. Sample Format downloads the CSV template; ADD uploads the file and queues the import processor." >}}

## Configuration

### Before you can use it

- **A doc item of transaction type `NSTI`** in [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/). The *Financial Item* picker on the NSTI record lists **every** ACTIVE doc item (`item-details.component.ts` `getFiItems()`), but the document processors only act on lines whose item has `txn_type = NSTI` (`NonStockTradeInTxnLineService.isNSTIItem`, L98-108). Pick a non-NSTI item and the unit will never be moved by documents.
- **Company, branch and location** in [Organisation](/applets/master-data/organisation-applet/) — all three are mandatory on the record; the backend rejects unknown guids (`NON_STOCK_TRADE_IN_HDR_COMPANY_GUID_DOES_NOT_EXIST`, `…_BRANCH_GUID_…`, `…_LOCATION_GUID_…`, `NonStockTradeInHdrDataConsistencyObject`).
- **Company default GL code `NSTI`** in [Chart of Account](/applets/master-data/chart-of-account-applet/) › Companies › Default GL Codes — optional: if the company has no valid `NSTI` link when a document creates or updates a unit, the backend creates a GL code named "Non-Stock and Trade-In", links it to the company and resolves a subledger (`NonStockTradeInStockHdrService.createTradeInStock` L108-160, `ensureNSTIGLCode` L298-425). Set it deliberately if you want the value on an account of your choosing. `COGS_NSTI` and `STOCK_BALANCE_NSTI` are needed only for the month-end closing-stock journal (`FinancialReportService` L504-508).
- **Job-processor subscriptions.** Documents create NSTI transaction lines only if the tenant's job-template links subscribe `NSTI_TXN_LINE_PROCESSOR` to the generic-document primary queue (`BLG_ERP_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`, `GenericDocumentPrimaryProcessor` L73-90) and `NSTI_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR` to `NSTI_TXN_LINE_PROCESSOR` (`NonStockTradeInTxnLineProcessor.findAndTrigger`, L126-149). Neither is an applet setting; ask the platform team when FINAL documents leave no trace here.
- **Server-side permissions** — `TNT_API_NON_STOCK_TRADE_IN_HDR_{CREATE,READ,UPDATE,DELETE}` (or `_OWNER` / `_ADMIN`), the same set with `_TXN_LINE_`, `_CATEGORY_`, `_ATTACHMENT_` and the import-file controllers (`NonStockTradeInHdrController` L62-128 and siblings).

### Applet settings

Settings are **applet-local**: `settings/field-settings` renders this repo's own `FieldConfigurationComponent` (four panels: *Stock Settings*, *Category Settings*, *Import File Settings*, *Vertical UI Setting*), saved by the shared session effect into the applet's `APPLET_SETTINGS` extension. The shared document-applet Field Configuration screen is not used, so `applet-scan.sh` / `gates.py` do not apply. Every control starts unset, so all hides are off, records lock at FINAL and the layout is horizontal until someone saves the screen. Anyone with access to the Settings menu can change them; they apply tenant-wide.

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| `STOCK_HIDE_NSTI_CODE`, `STOCK_HIDE_NSTI_NAME`, `STOCK_HIDE_CATEGORY`, `STOCK_HIDE_LOCATION`, `STOCK_HIDE_STOCK_BALANCE`, `STOCK_HIDE_POSTING_STATUS`, `STOCK_HIDE_STATUS` | Hide the matching column of the NSTI Stock listing (`nsti-listing.component.ts` L126-136, `hide` + `suppressColumnsToolPanel`) | Off | On: the column disappears and cannot be re-enabled from the Columns panel |
| `STOCK_HIDE_DELETE_BUTTON` | Hides the **Delete** button on the edit panel (`edit-nsti-stock.component.html` L54) | Off | On: units cannot be deleted from the UI |
| `ALLOW_EDIT_TXN_LINE_AFTER_FINAL` | Whether a record with `posting_status = FINAL` can still be saved, re-finalised, and have transaction lines added, edited or deleted (`edit-nsti-stock.component.html` L14-15; `line-item-listing.component.html` L7; `edit-line-item.component.html` L8, L122) | Off — FINAL locks the record | On: SAVE, FINAL, Add Transaction and line Save / Delete stay enabled after FINAL. Lines created by documents stay read-only regardless (`fromGenericDocLine`) |
| `CATEGORY_HIDE_CATEGORY_CODE`, `CATEGORY_HIDE_CATEGORY_NAME`, `CATEGORY_HIDE_CREATION_DATE`, `CATEGORY_HIDE_UPDATED_DATE`, `CATEGORY_HIDE_STATUS` | Hide the matching column of the NSTI Category listing (`category-listing.component.ts` L127-143) | Off | As above |
| `IMPORT_FILE_HIDE_FILE_NAME`, `…_FILE_SIZE`, `…_FORMAT`, `…_STATUS`, `…_PROCESS_STATUS`, `…_USER_ERROR_MESSAGE`, `…_CREATED_DATE`, `…_UPDATED_DATE`, `…_CREATED_BY` | Hide the matching column of the Import NSTI listing (`nsti-import-listing.component.ts` L126-160) | Off | As above |
| `VERTICAL_ORIENTATION` (labelled *ENABLE VERTICAL ORIENTATION*) | Stacks listing and detail panels vertically instead of side by side (`nsti-stock-container.component.ts` L73-75 and the category / import containers) | Off | On: every container switches to the stacked layout; the edit form shows expansion panels instead of tabs |
| `EXPAND_MAIN_DETAILS`, `EXPAND_TXN_LINE`, `EXPAND_ATTACHMENT` | Which panels of the edit form open expanded in the stacked layout (`edit-nsti-stock.component.ts` L87-89, L152 via `panel.expandSetting`) | Off | On: that panel starts expanded. No effect in the tabbed layout |

Those 27 keys pass the declared / rendered / persisted / consumed test (checked at commit 209aafd). Also on the screen or in the model, but short of it:

- **`STOCK_HIDE_COMPANY`** — rendered and saved, but the listing has no Company column and nothing reads the key.
- **`SHOW_API_UPLOAD`** — declared and saved (the save handler even logs it) but has no toggle and no reader.
- **Read without a control:** `STOCK_HIDE_TYPE`, `STOCK_HIDE_BRANCH`, `STOCK_HIDE_SN`, `STOCK_HIDE_AMOUNT`, `STOCK_HIDE_PURCHASE_DATE`, `STOCK_HIDE_UPDATED_DATE` (listing columns Type, Branch, Serial Number, Amount, Created Date, Updated Date — `nsti-listing.component.ts` L128-143) and `DEFAULT_TOGGLE_COLUMN` / `DEFAULT_ORIENTATION` (the orientation formula). They can be set only by writing `APPLET_SETTINGS` directly.
- **Default Selection** (*Default Branch*, *Default Location*): the subscription that would load the container is commented out, so choosing a value throws on an undefined `appletContainer`; nothing reads `DEFAULT_BRANCH` / `DEFAULT_LOCATION` (`default-settings.component.ts` L30-66). **Personalization › Default Selection** is the same code (`personal-default-settings.component.ts` L31-75). `PRINTABLE` is model-only.

### Document behaviour settings

Not applicable in the document sense — this is master data with its own `posting_status`. What FINAL does is described under [Lifecycle and effects](#lifecycle-and-effects): it is a header field that the applet's own buttons honour; the backend does not post anything on it.

### Settings in other applets that control this applet

| Setting | Where it is set | Effect here |
|---|---|---|
| Company default GL codes `NSTI`, `COGS_NSTI`, `STOCK_BALANCE_NSTI` | [Chart of Account](/applets/master-data/chart-of-account-applet/) › Companies › Default GL Codes | GL code stamped on units created by documents (auto-created if missing); accounts for the month-end NSTI closing-stock journal |
| `SHOW_NSTI_STOCK_VALUE` and the closing-stock record's NSTI values (`manual_nsti_closing_value` / `sysauto_nsti_closing_value`, "select NSTI manual") | [Chart of Account](/applets/master-data/chart-of-account-applet/) › Settings › General Settings, Closing Stock Balance | Whether the NSTI tab appears on the closing-stock record and which value the month-end journal uses (`FinancialReportService` L602-607) |
| `SHOW_TRADE_IN`, `TRADE_IN_BASIC_ITEM` | [POS General](/applets/sales-workflow/pos-general-applet/) Field Settings | Whether cashiers can add trade-in lines — the main source of `TRADE_IN` units |
| Job-template subscriptions for `NSTI_TXN_LINE_PROCESSOR` and `NSTI_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR` | Tenant job-processor configuration (platform team) | Whether FINAL documents create and post NSTI transaction lines at all |

### Feature visibility / permissions

- **Client-side permissions:** `bl_applet_client_side_perm_dfn` holds **no rows** for `nonStockAndTradeInApplet`, and the applet checks no `SHOW_*` codes. Feature Visibility is the shared *Manage Team Access* screen only; the `HIDE_*` settings cannot be reopened per role.
- **Server-side permissions:** the Permission Set / User / Role routes are the shared containers; each NSTI controller checks its own `TNT_API_NON_STOCK_TRADE_IN_*` code (`checkNormalPermissionWithBC`) with the tenant owner / admin roles as fallback.

## Fields

### NSTI Stock — Details

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| NSTI Status | `posting_status` | — | Read-only. `DRAFT` on create; the edit form shows `DRAFT` / `FINAL` but the control is disabled — use the **FINAL** button |
| NSTI Code | `code` | No | Max 255. Blank → a random base-36 code (upper-cased) generated in the browser and checked against the codes already loaded (`create-nsti.component.ts` L115-135); the backend has **no** uniqueness check on `code` |
| NSTI Name | `name` | Yes | Max 255 |
| Type | `type`: **Non Stock** (`NON_STOCK`) / **Trade In** (`TRADE_IN`) | Yes | Trade In is saved with `posting_status = FINAL` at once and every later Save re-sends FINAL; Non Stock is saved as `DRAFT` (`create-nsti.component.ts` L169-174; `edit-nsti-stock.component.ts` L176-179) |
| Financial Item | `guid_fi_item_hdr` | Yes | Any ACTIVE doc item; must exist (`NON_STOCK_TRADE_IN_HDR_ITEM_GUID_DOES_NOT_EXIST`). Should be an `NSTI`-type item (see above) |
| Category | `category_guid` | Yes | ACTIVE NSTI categories only; must exist |
| Employee | `pic_name` + `property_json.data.employeed_guid` | No | Active employees |
| Company / Branch / Location | `guid_company`, `guid_branch`, `guid_location` | Yes | Must exist. The location is part of the balance key |
| Currency | `ccy` | Yes | |
| GL Code | `glcode_guid` | No | Must exist if set (`…_GLCODE_GUID_DOES_NOT_EXIST`); documents overwrite it with the company `NSTI` code when they update the unit |
| Warranty Expiry | `warranty_expiry` | No | Date |
| Serial Number | `serial_no` | No on the form | Camera **SCAN** available. Units created by documents always have one, and the balance key is item + serial + location — a unit without a serial can never be matched by a document |
| Description | `descr` | No | Max 255 |
| Purchase Date / Purchase Price / Sales Date / Sales Price | `purchase_date`, `purchase_price_incl_tax`, `sales_date`, `sales_price_incl_tax` | — | Read-only on the edit form; the create form sets the purchase date to now and every price to 0 |
| Current Value / Current For Sale Price | `current_value_incl_tax`, `current_for_sales_price_incl_tax` | No | Edit form only |

### Txn Line — Add Transaction

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Transactions Type | `txn_type`: Acquisition / Disposal / Adjustment | Yes | |
| Quantity Base | `quantity_base` | Yes | Default 1 |
| Unit Price Net (Exclusive of tax) | `unit_price_net` | Yes | ≥ 0, two decimals; the form recomputes net amount from quantity × price |
| SST/GST/VAT, WHT | tax code and WHT code | Yes | From [Tax Configuration](/applets/master-data/tax-configuration-applet/); Tax Amount and WHT Amount are computed, ≥ 0 |
| Txn Amount | `amount_txn` | Yes | ≥ 0, two decimals |

A manual line is stored with `nsti_stock_hdr_guid` = the unit and no document; the backend validates existence of any guids set (`NonStockTradeInTxnLineDataConsistencyObject`) and **does not change the unit's Stock Balance** — only the balance processor does that, and it runs for document-generated lines only (see below).

### Attachment

Attachment Name, Details, one file → `bl_fi_nsti_stock_attachment` (`file_name`, `import_format`, `file_details`, `upload_date`).

### NSTI Category

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Category Code | `code` | Yes | Upper-cased on create; no backend uniqueness check |
| Category Name | `name` | Yes | |
| Description | `descr` | No | |
| Status | `status`: ACTIVE / INACTIVE | Yes | INACTIVE categories are not offered on the NSTI record |

### Import NSTI — CSV columns

`CODE, NAME, TYPE, FINANCIAL_ITEM_CODE, CATEGORY_CODE, COMPANY_CODE, BRANCH_CODE, LOCATION_CODE, EMPLOYEE_NAME, CURRENCY, GL_CODE, WARRANTY_EXPIRY, SERIAL_NUMBER, PURCHASE_DATE, PURCHASE_PRICE_INCL_TAX, SALES_DATE, SALES_PRICE_INCL_TAX, CURRENT_VALUE_INCL_TAX, CURRENT_FOR_SALES_PRICE_INCL_TAX` (`NonStockTradeInImportFileColumnNames`). Header row required (case-insensitive), values trimmed, dates as ISO zoned date-times, UTF-8 with or without BOM (`NonStockTradeInImportFileHdrService.readCSV`, L136-168).

## Lifecycle and effects

This is a master-data applet with its own tables — no server document type, no amount or quantity signum of its own, no journal from this applet, no open-queue rows. The `posting_status` on a unit is set by the applet's **FINAL** / **SAVE** buttons through an ordinary `PUT …/non-stock-trade-in/stock-hdrs/backoffice-ep`; the backend validates the container and updates the row (`NonStockTradeInStockHdrService.updateNonStockTradeInHdr`) — it posts nothing and does not lock anything server-side. The lock is enforced only by the applet's buttons and reopened by `ALLOW_EDIT_TXN_LINE_AFTER_FINAL`.

**What the applet writes**

| What | Where | How |
|---|---|---|
| Unit | `bl_fi_nsti_stock_hdr` | `POST` (temporary header on **+**), `PUT` (Save / Final), `DELETE …/{guid}` (physical delete of the header row only — `NonStockTradeInHdrUow.delete` L67-73; transaction lines and attachments are left behind) |
| Manual transaction line | `bl_fi_nsti_stock_txn_line` | `POST` / `PUT` / `DELETE …/non-stock-trade-in/txn-lines/backoffice-ep` — no balance update |
| Attachment | `bl_fi_nsti_stock_attachment` | `…/non-stock-trade-in/stock-attachments/backoffice-ep` |
| Category | `bl_fi_nsti_stock_category` | `…/non-stock-trade-in/stock-categories/backoffice-ep`; **delete is refused while any unit uses the category** (`CATEGORY_IS_STILL_LINKED_TO_ITEMS_ERROR`, `NonStockTradeInCategoryController` L90-93) |
| Import | `bl_fi_nsti_stock_import_file_hdr` + `bl_fi_nsti_stock_import_file_helper` | `POST …/stock-import-file-hdrs/backoffice-ep` (multipart) queues `NonStockTradeInImportFileProcessor`; `readCSV` writes one helper row per CSV line with `processed = true` and sets `process_status` to `DONE`, or `FAILED` at the first row that fails validation. **No code turns helper rows into `bl_fi_nsti_stock_hdr` units** (checked at backend commit 871dbf5c96: `createNonStockTradeInHdr` is called only by the header controller and the balance processor) — the import populates the helper table and nothing else |

**How documents create and move units (the real lifecycle)**

1. A generic document is finalised. `BLG_ERP_GENERIC_DOCUMENT_PRIMARY_PROCESSOR` fans out to the tenant's subscribed processors; `NSTI_TXN_LINE_PROCESSOR` (`NonStockTradeInTxnLineProcessor`) calls `createAndPostNstiTxnLines` (`NonStockTradeInTxnLineService` L243-344). It returns nothing when the header's `posting_trade_in` is already set (`checkCanBePosted`, L64-66) or when the document is in a foreign currency (`doc_ccy ≠ base_doc_ccy`, L255-265).
2. For every `PNS` line with a non-zero quantity whose item has `txn_type = NSTI` **and which carries serial numbers**, `NonStockTradeInTxnLineFactory` writes **one transaction line per serial** with `quantity_base = 1`, the document's quantity signum (forced to **+1** for `INTERNAL_SALES_CREDIT_NOTE`) and the line's amounts, prices and taxes; `txn_type` = `ACQUISITION` for +1, `DISPOSAL` for −1, `ADJUSTMENT` for 0 (L20-48, L115-135, L160-170). Lines without serial numbers create nothing. Stock-in-transit counter-lines are added for transfer-type documents (`createStockInTransitTxns`, L383-420).
3. Each new line is handed to `NSTI_TXN_LINE_TO_CURRENT_STOCK_BALANCE_PROCESSOR` → `processTxnLine` (L111-198): the unit is looked up by **item + serial number + location** (`getCurrentBalanceQtyContainer`, L72-88 — all three mandatory). If it exists, `qty_base += quantity_base × quantity_signum` and an invalid GL link is repaired; if not, a unit is **created** with `type = TRADE_IN`, `posting_status = FINAL`, a code from the `CODE` running number, the line's item name, currency, company / branch / location, purchase date and price (`amount_txn / quantity_base`), the serial, `qty_base` = the line quantity, and the company `NSTI` GL code (created if missing) plus subledger (`createTradeInStock`, L89-168).
4. `POST …/non-stock-trade-in/txn-lines/posting/{docGuid}` (`NonStockTradeInTxnLineController` L178-200) re-runs steps 1-3 for one document by hand — the repair path when the queue was not subscribed.

**Signums of the trade-in document types** (`GenericDocumentTypeHandler` L824-839): `INTERNAL_PURCHASE_TRADE_IN` — quantity **+1**, amount **−1** (the POS trade-in line: the unit comes in, the customer's bill goes down); `INTERNAL_SALES_TRADE_IN` — quantity **−1**, amount **+1**. A normal sales line (`INTERNAL_SALES_CASHBILL`, `INTERNAL_SALES_INVOICE`, quantity −1) on an NSTI serial disposes of the unit; a sales credit note brings it back.

**Journal.** NSTI lines are posted by the document's own posting, not by this applet: `JournalPostingService` maps a `PNS` line whose item is `NSTI` (or whose document type is either trade-in type) to transaction code `NSTI` (L154-157) and resolves the GL as line GL → header GL → item-company link with code `NSTI` → company default `NSTI` (L158-188). Month end: `FinancialReportService` posts the NSTI closing-stock value between `COGS_NSTI` and `STOCK_BALANCE_NSTI` (L504-508, L602-607).

**Stock check on sale.** When the backend validates stock for a document (`GenericDocumentService.validateStockBalance`, called at L1667), every NSTI serial on a line must have `qty_base ≥ 1` at the line's location (delivery location, else `guid_store`), otherwise the document is rejected with `STOCK_BALANCE_OBJECT_NO_STOCK_AT_LOCATION` — "There's not enough stock for NSTI item *code*, serial number *sn*" (L2115-2152).

**Backend validation that stops a save (the exact throws):** unit — guid unique (`NON_STOCK_TRADE_IN_HDR_GUID_ALREADY_EXISTS`); company, branch, location, category, GL code, subledger, item, applet, module and linked purchase / sales document guids must exist if set (`NON_STOCK_TRADE_IN_HDR_*_DOES_NOT_EXIST`); status, revision, created / updated dates and subjects mandatory (`NonStockTradeInHdrDataConsistencyObject`). Transaction line — the same shape (`NON_STOCK_TRADE_IN_TXN_LINE_OBJECT_*`), including `NSTI_STOCK_HDR_GUID_DOES_NOT_EXIST`. Category — guid, applet, module, label header and audit fields (`NON_STOCK_TRADE_IN_CATEGORY_*`). There is **no** uniqueness check on unit code, serial number or category code.

**What it only reads.** [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) unions `bl_fi_nsti_stock_hdr` (grouped by company, location, item; cost = `purchase_price_incl_tax`) with inventory balances for items of type `NSTI` (`StockAvailabilityUow` L261-307). The historical stock balance report does not include NSTI units (gh:bigledger/blg-int-general-task#1422, open).

## Related applets

- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — creates the `NSTI`-type items that the record's *Financial Item* should point at; only those are recognised by the document processors.
- [POS General](/applets/sales-workflow/pos-general-applet/) — trade-in lines (`INTERNAL_PURCHASE_TRADE_IN`) on a cash bill are the main way `TRADE_IN` units are created; selling the unit later disposes of it.
- [Sales Invoice](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Credit Note](/applets/sales-workflow/internal-sales-credit-note-applet/) — dispose of and restore NSTI serials; the credit note's quantity signum is forced to +1 for NSTI lines.
- [Stock Availability](/applets/inventory-workflow/stock-availability-applet/) — the only stock report that shows NSTI balances; [Stock Balance](/applets/inventory-workflow/stock-balance-applet/) and [Stock Report](/applets/inventory-workflow/stock-report-applet/) show inventory only.
- [Chart of Account](/applets/master-data/chart-of-account-applet/) — company default GL codes `NSTI`, `COGS_NSTI`, `STOCK_BALANCE_NSTI` and the closing-stock record's NSTI value; [Financial Report](/applets/finance/financial-report-applet/) — where the month-end NSTI closing journal lands.
- [Organisation](/applets/master-data/organisation-applet/) — company, branch and location; the location is part of the unit's identity.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — tax and WHT codes on manual transaction lines.
- [Employee Maintenance](/applets/master-data/employee-applet/) — the optional person in charge on a unit.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| **SAVE** stays grey on the create panel | A mandatory field is empty — Name, Type, Financial Item, Category, Company, Branch, Location, Currency (`item-details.component.ts` L105-120) | Fill them; Code, Employee, GL Code, Warranty Expiry, Serial Number and Description are optional |
| **SAVE** / **FINAL** grey on the edit panel although every field is filled | The unit is `FINAL` and `ALLOW_EDIT_TXN_LINE_AFTER_FINAL` is off (gh:bigledger/blg-intranet#4045). Trade-in units are FINAL from creation | Turn the setting on in Settings › Field Settings, or leave the unit as it is |
| **Add Transaction** / line **Save** / **Delete** disabled | Same lock (gh:bigledger/blg-intranet#4046); lines that came from a document are always read-only (`fromGenericDocLine`) | As above; document lines are corrected by correcting the document |
| "Auto-generated NSTI Code already exists! Click save again!" | The random code collided with an existing one | Press SAVE again, or type a code |
| A FINAL POS bill with a trade-in line created no NSTI unit | (a) the item is not of transaction type `NSTI`; (b) the line has no serial number — the factory creates nothing without serials; (c) the document is in a foreign currency; (d) `NSTI_TXN_LINE_PROCESSOR` / the balance processor are not subscribed for the tenant; (e) `posting_trade_in` was already set (a clone or an earlier run) | Check the item type and serial; ask the platform team to enable the two processors; re-run `POST …/txn-lines/posting/{docGuid}` for the document |
| Sale rejected with *There's not enough stock for NSTI item …, serial number …* | The serial has no unit with `qty_base ≥ 1` at the line's location — it was never received, was received at another location, or has already been sold | Sell from the location that holds it, or create the unit (with serial, location and quantity) in this applet |
| A unit shows Stock Balance 0 although a manual Acquisition line was added | Manual transaction lines never update `qty_base`; only document-generated lines do | Edit the unit and set the quantity through a document (trade-in line) or accept that manual lines are a record only |
| Two units for the same serial | The balance key is item + serial + **location**; the same serial received at two locations is two units, and units typed in by hand without a serial never match | Keep one location per serial; always fill Serial Number on hand-made units |
| Import shows `DONE` but nothing appears in NSTI Stock; or rows with empty columns | The import only fills the helper table — no unit is created from it (gh:bigledger/blg-applet-wavelet-non-stock-and-trade-in-applet#8, #10, #11). Empty columns mean the header names did not match the template | Use the CSV as a staging record only; create units through documents or the create panel. Use the exact template headers |
| Import shows `FAILED` with no message | A helper row failed validation; the service stops at the first failure and sets `FAILED` without a user message (`readCSV` L151-163; gh:bigledger/blg-applet-wavelet-non-stock-and-trade-in-applet#9) | Check the file for a bad date / number in that row; the *User Error Message* column is not filled by this import |
| **Sample Format** does nothing | Builds before May 2026 had the download stubbed (gh:bigledger/blg-intranet#4302, customer-repo-a2de10#454); since applet commit abfcfc4 it calls `…/stock-import-file-hdrs/backoffice-ep/download-master-data-template`, which returns `MASTER_DATA_TEMPLATE_DOES_NOT_EXIST` if the template file is missing on the server | Update the applet; if the error persists, the server-side template file is missing — platform team |
| Category **Delete** fails | Units still reference the category (`CATEGORY_IS_STILL_LINKED_TO_ITEMS_ERROR`, gh:bigledger/blg-int-general-task#1421) | Re-categorise the units first, or set the category INACTIVE |
| Category **Update** enabled without changes | Cosmetic (gh:bigledger/blg-intranet#4301) | — |
| Trade-in units missing from Stock Balance / historical stock reports | They are not inventory; only Stock Availability unions the NSTI table (gh:bigledger/blg-int-general-task#1422, open) | Use Stock Availability or this listing |
| Default Selection does nothing / console error on choosing a branch | The screen is not wired (undefined container) and nothing reads `DEFAULT_BRANCH` / `DEFAULT_LOCATION` | Nothing to configure; see [Applet settings](#applet-settings) |
| Deleted unit's lines still show in searches / API queries | Delete removes the header only | Delete the lines and attachments through their own endpoints, or leave them |

## Related documentation

- [Inventory Workflow applets](/applets/inventory-workflow/)
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — where the `NSTI` item type is set
- [POS General](/applets/sales-workflow/pos-general-applet/) — trade-in lines at the till
- [Inventory module](/modules/inventory/)
