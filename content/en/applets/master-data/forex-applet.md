---
title: "Forex Applet"
description: "Reference for the Forex applet, used by finance administrators to define currency pairs (forex data sources) and record dated buy, sell and mid rates that document applets pick up through the Forex Data Source selector."
applet_code: "forexApplet"
applet_repo: "blg-applet-wavelet-forex-applet"
modules: [financial-accounting, purchasing, core]
related_applets: [organisation-applet, chart-of-account-applet, internal-purchase-order-applet, internal-purchase-invoice-applet, internal-purchase-invoice-no-stock-in-applet, internal-purchase-grn-applet, internal-purchase-grn-stock-in-applet, internal-purchase-credit-note-applet, internal-sales-invoice-applet, internal-receipt-voucher-applet, claim-applet, ledger-and-journal-applet]
guides: [/guides/accounting-guides/chart-of-accounts-setup/]
sources:
  configuration:
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/app.routing.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/settings-container/settings-container.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/settings-container/default-settings/default-settings.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/settings-container/release-notes/release-notes.component.html
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/services/finance-service.service.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
    - blg-shared-utilities/utilities/forex-data-source-drop-down/forex-data-source-drop-down.component.ts
    - blg-shared-utilities/utilities/forex-data-source-drop-down/forex-data-source-drop-down.component.html
    - blg-shared-utilities/services/forex.service.ts
    - blg-applet-wavelet-internal-purchase-order-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-order-applet/src/app/components/purchase-order-container/purchase-order-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-sales-invoice-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-invoice-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.html
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/platform/dm/bank/ForexDataSourceHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/financialItem/ForexDataSourceHistoryController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/ListingController.java
  fields:
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-listing/forex-listing.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-create/forex-create.component.html
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-create/forex-create-main/forex-create-main.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-create/forex-create-main/forex-create-main.component.html
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-view/forex-view.component.html
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-view/forex-view-main/forex-view-main.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-view/forex-view-main/forex-view-main.component.html
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-view/forex-view-history/forex-view-history.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-view/forex-view-history/forex-view-history.component.html
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-view/forex-view-chart/forex-view-chart.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-live/forex-live.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-live/forex-live.component.html
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/services/api-service.ts
    - blg-shared-utilities/utilities/select-multi-currency-drop-down/select-multi-currency-drop-down.component.ts
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_forex_data_source_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_forex_data_source_history.java
  lifecycle:
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/state-controllers/forex-controller/store/effects/forex.effects.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/state-controllers/forex-controller/store/actions/forex.actions.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/facades/view-column.facade.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/bank/ForexDataSourceHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/CompanyDataConsistencyObjects/ForexDataSourceHistoryDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/bank/ForexDataSourceHdrUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/CompanyUows/ForexDataSourceHistoryUow.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/ddd/DbTableDao.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_fi_generic_doc_hdr.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/auditAssuranceTax/claim/bl_aat_claim_document_line.java
  troubleshooting:
    - blg-shared-utilities/utilities/forex-data-source-drop-down/forex-data-source-drop-down.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-view/forex-view-main/forex-view-main.component.ts
    - blg-applet-wavelet-forex-applet/micro-fe/projects/wavelet-erp/applets/forex-applet/src/app/components/forex-container/forex-live/forex-live.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java
    - gh:bigledger/blg-int-general-task#1198
    - gh:bigledger/blg-int-general-task#9637
    - gh:bigledger/blg-int-general-task#9250
    - gh:bigledger/blg-int-general-task#9556
tags:
- forex-management
- currency-exchange
- multi-currency
- exchange-rates
- financial-control
weight: 65
---

## Overview

The **Forex Applet** is where a finance administrator defines the currency pairs a tenant trades in and records the exchange rates for them, one dated row at a time. Each pair is a **Forex Data Source** (for example *base MYR → foreign USD*), and each dated row in its **History Data** holds a sell rate, a buy rate and a computed mid rate. Document applets — purchase orders, purchase and sales invoices, GRNs, credit notes, receipt vouchers and claim lines — show a *Forex Data Source* selector when their `SHOW_FOREX_DATA_SOURCE` setting is on; picking a source sets the document currency and copies the **latest** recorded rate into the document's Currency Rate.

The applet stores rates; it does not post anything. Forex gain and loss journals, base-currency "shadow" documents and the non-zero-rate check at FINAL all live in the document applets and the backend, and are only summarised here.

A second menu item, **Forex Live**, charts rates from a third-party market feed for reference. It does not write to the tenant.

## Where it fits

| Direction | Applet / data | Why |
|---|---|---|
| Upstream | Tenant currency master (`bl_fi_mst_ccy`) | The Currency Base and Currency Foreign drop-downs list the tenant's currencies, ordered by short name. A currency that is not in the master cannot be used in a pair. |
| Upstream | [Organisation Applet](/applets/master-data/organisation-applet/) | Each company's base currency decides which data sources a document can pick: the selector only lists sources whose Currency Base equals the document's base currency. |
| Downstream | [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/), [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/), [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) | Purchase-side documents embed the shared Forex Data Source drop-down with `isSales = false`: selecting a source copies the latest **sell rate** into Currency Rate and stores `forex_source_hdr_guid` on the document header. |
| Downstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) | Sales-side documents embed the same drop-down with `isSales = true`: the latest **buy rate** is copied. |
| Downstream | [Claim Applet](/applets/claims/claim-applet/) | Foreign-currency claim lines store `forex_source_hdr_guid`; the backend checks that the guid exists (`ClaimDocumentLineDataConsistencyObject` L153–L159). |
| Downstream | [Ledger And Journal](/applets/finance/ledger-and-journal-applet/), [Chart of Account](/applets/master-data/chart-of-account-applet/) | Gain/loss on settlement is posted by the document applets to the company's `FOREX_GAIN` / `FOREX_LOSS` default GL codes, not by this applet. |

## Screens and menus

The applet has two menu items (`menu-items.ts`):

| Menu item | Route | What it shows |
|---|---|---|
| **Forex Data Source** | `forex` | The listing of currency pairs. Columns: Code, Name, Currency Base, Currency Foreign, Created Date, Created By, Updated Date, Updated By. Keyword search covers code, name, base and foreign currency (minimum three characters); the advanced search adds a Create Date range. Only `ACTIVE` rows are listed, newest update first, 50 per page. |
| **Forex Live** | `forex-live` | A reference chart pulled from a third-party feed for a chosen base/foreign pair and timeframe (1 week to 5 years). Nothing on this screen is saved. |

From the listing:

- **Create Forex** — a single **Main** tab with Code, Name, Descriptions, Currency Base and Currency Foreign. **RESET** clears the form; **CREATE** is enabled once the four required fields are filled.
- **View Forex** — opens when you click a row. Three tabs:
  - **Details** — Code, Name, Descriptions, Currency Base, Currency Foreign plus Created By / Creation Date / Updated By / Updated Date, and a **DELETE** button that needs a second click within three seconds to confirm. There is no Save on this tab: the Name and Descriptions boxes accept typing but nothing persists it (no update action exists in `forex.actions.ts`).
  - **Chart** — a Date Txn from/to pair (both default to today) and **SEARCH**; plots Sell, Buy and Mid rate from the History Data rows in that range.
  - **History Data** — the rate rows for this pair: Date, Sell Rate, Buy Rate, Middle Rate, and a delete action per row (with a confirmation dialog). Above the grid: Date Txn (defaults to today), Sell Rate, Buy Rate, a **search** button that fills the two rates from the third-party feed, and an **add** button that saves the row.

Settings (gear icon) offers Field Settings, Default Selection, Webhook, the five shared permission screens and Release Notes; Personalisation offers Default Selection and Sidebar. See Configuration for what these do.

## Configuration

### Before you can use it

| Prerequisite | Where | Why it matters |
|---|---|---|
| Both currencies of the pair exist in the tenant currency master | Tenant currency list (`bl_fi_mst_ccy`); the drop-down calls the shared `currency` listing ordered by `display_short` | Currency Base and Currency Foreign are pick-lists, not free text. |
| The company's base currency is set | [Organisation Applet](/applets/master-data/organisation-applet/) — company Details | The document selector filters data sources by `currency_base = <document base currency>` (`forex-data-source-drop-down.component.ts` `getInputModel()`). A source whose base is not the company currency never appears on that company's documents. |
| `SHOW_FOREX_DATA_SOURCE` switched on in each document applet that should use the rates | That applet's *Settings › Application Settings › Main Details › Doc Settings* (shared screen) | Off by default (`?? false`, `field-configuration.component.ts` L1950). Without it the document shows the plain Currency / Currency Rate pair and never reads this applet. |
| `FOREX_GAIN` and `FOREX_LOSS` company default GL codes | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Needed by the document applets when a foreign-currency document is settled; not read by this applet. |
| API permissions | Permission Set / Role screens under this applet's Settings, or Tenant Admin | Creating a pair needs `API_BL_FI_FOREX_DATA_SOURCE_HDR_CREATE`; adding a rate row needs `BL_FI_FOREX_DATA_SOURCE_HISTORY_CREATE`; see *Feature visibility / permissions*. |

### Applet settings

Classification (from `app.routing.ts` and `settings-container.component.ts`): the applet ships its **own** settings components — `FieldConfigurationComponent`, `DefaultSettingsComponent` and `PersonalDefaultSettingsComponent` — and does not use the shared blg-shared-utilities Application Settings screen. None of the three is wired to storage.

**No exposed control found (routes and settings components checked at commit aa5850e, 2026-09-02).** The `AppletSettings` interface in `applet-settings.model.ts` declares 50 keys (`INCLUDE_*`, `ENABLE_*`, `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `PRINTABLE`, custom-status lists) that are copied from a document-applet template; no component in the applet reads any of them, so they are model-only and are not documented here.

What the visible settings screens actually do, so you can stop looking for a switch that is not there:

| Screen | Route | Behaviour in code |
|---|---|---|
| Field Settings | `settings/field-settings` | Static template: eight `mat-slide-toggle`s (Unit Discount, SST/VAT/GST, WHT, Blanket Order, Segment, G/L Dimension, Profit Center, Project) with no form binding and a SAVE button with no click handler; the component class is empty. |
| Default Selection | `settings/default-selection` | Default Branch / Default Location drop-downs. The component's `appletContainer` is never assigned (the route binds no input), so changing either drop-down throws in the console and SAVE emits an event nothing subscribes to. Nothing is stored. |
| Personalisation › Default Selection | `personalization/personal-default-selection` | Same code as above (the container subscription is commented out). Nothing is stored. |
| Webhook, Sidebar, permission screens | shared components | Standard shared screens; the permission screens are functional but the applet defines no client-side permission codes (below). |
| Release Notes | `settings/release-notes` | Two entries: 1.00 (2023-08-05) and 1.01 (2024-07-06, "resolved wrong end point call"). |

### Settings in other applets that control this applet's use

These are the switches that decide whether a document reads the rates recorded here. They live in the **shared** Application Settings screen (`blg-shared-utilities` `FieldConfigurationComponent`, *Main Details › Doc Settings* panel) of each document applet, and are saved into that applet's `APPLET_SETTINGS` extension. Any user who can open that applet's Settings can change them.

| Setting (in the document applet) | What it controls | Default | Effect when changed |
|---|---|---|---|
| `SHOW_FOREX_DATA_SOURCE` | Renders the *Forex Data Source* drop-down on the document's Main Details (Purchase Order L532–L542, Sales Invoice L379–L389 of their `main-details.component.html`). The drop-down lists this applet's `ACTIVE` sources with `currency_base` equal to the document's base currency, ordered by code, and on selection sets the document currency to the source's foreign currency and fetches the newest History Data row (`orderBy date_txn desc, limit 1`) — `buy_rate` when `isSales`, `sell_rate` otherwise — into Currency Rate. | Off (`?? false`, L1950) | Off: plain Currency + Currency Rate fields; the rate comes from the Refresh button (third-party live feed) or typing. On: the selector appears; a rate is only filled if the chosen source has at least one History Data row. |
| `CANNOT_EDIT_CURRENCY_RATE` | Locks the Currency Rate box on the document. | Off (`?? false`, L1951) | With `SHOW_FOREX_DATA_SOURCE` on, this makes the recorded rate the only way to set a rate; a source with no History Data rows then leaves the document at rate 0 (see Troubleshooting). |
| `HIDE_FOREX_HISTORY` | Rendered only for `salesInvoiceApplet` (L1917–L1920) and persisted, but no component in the Sales Invoice applet reads it. | Unset (`resolve?.HIDE_FOREX_HISTORY`, L1754) | None observed. |

### Document behaviour settings

Not applicable — this is a master-data applet. The document-side effects (shadow documents, non-zero rate at FINAL) are described under Lifecycle and effects.

### Third-party rate feed

The **search** buttons on Create Forex and History Data, the Refresh button on document applets and the whole **Forex Live** screen call an external market-data provider over HTTPS from the browser (`finance-service.service.ts` in this applet; `services/forex.service.ts` in blg-shared-utilities). The API key is compiled into the applet and shared by every tenant; there is no tenant-level setting for the provider, the key or the refresh frequency. History Data takes the provider's *Ask Price* as Sell Rate and *Bid Price* as Buy Rate; Mid Rate is `(sell + buy) / 2` computed client-side.

### Feature visibility / permissions

- **Client-side permissions:** `forexApplet` has no rows in `bl_applet_client_side_perm_dfn`, and the applet's code checks no `SHOW_*` / `HIDE_*` codes. The Client-Side Permission screen under Settings is therefore empty; nothing in this applet can be hidden per role.
- **Backend (API) permissions**, enforced by the controllers:

| Action | Endpoint | Permission code checked |
|---|---|---|
| List data sources | `POST …/erp/forex-data-source/backoffice-ep` (`ListingController` L718–L727) | `API_BL_FI_FOREX_DATA_SOURCE_HDR_READ` (or `_OWNER` / `_ADMIN`) |
| Create / delete a data source | `POST` / `DELETE …/forex-data-source-hdr/backoffice-ep` (`ForexDataSourceHdrController` L63, L142) | `API_BL_FI_FOREX_DATA_SOURCE_HDR_CREATE` / `_DELETE` |
| List rate rows | `POST …/erp/forex-data-source-history/backoffice-ep` (`ListingController` L734–L743) | `BL_FI_FOREX_DATA_SOURCE_HISTORY_READ` (or `_OWNER` / `_ADMIN`) |
| Add / delete a rate row | `POST` / `DELETE …/erp/fi/forex-data-source-histories/backoffice-ep` (`ForexDataSourceHistoryController` L60, L128) | `BL_FI_FOREX_DATA_SOURCE_HISTORY_CREATE` / `_DELETE` |

The data-source header lives in the **platform** permission family (`PlatformPermissions`) while the rate rows live in the **tenant ERP** family (`TntErpPermissionsV2`); a role needs codes from both to maintain a pair end to end. A user with tenant Owner / Admin passes all of them.

## Fields

### Create Forex — Main tab

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Code | Short identifier of the pair, e.g. `MYR-USD`. Shown as the option text in every document drop-down. | Yes (`Validators.required`) | Free text. **No uniqueness check** — neither the backend validator nor the table enforces it (`bl_fi_forex_data_source_hdr` has a plain index on `code`). |
| Name | Descriptive name. | Yes | Free text. |
| Descriptions | Longer note. | No | Saved to `description`. Not shown back on View (see Troubleshooting). |
| Currency Base | The currency you hold — normally the company base currency. | Yes | Pick-list from the tenant currency master. Read-only after create. |
| Currency Foreign | The currency you are pricing. | Yes | Pick-list from the tenant currency master. Read-only after create. Documents that select this source switch their document currency to this value. |

The backend fills `guid`, `status = ACTIVE`, `revision` and the audit columns (`ForexDataSourceHdrDataConsistencyObject.fillMissingDataForCreation` L179–L186); its creation validators check only those system columns, not the business fields.

### View Forex — Details tab

Code, Currency Base and Currency Foreign are read-only. Name and Descriptions render as editable inputs but there is no Save/Update control and no update action in the store, so the header is effectively **immutable after create**; to change it, delete and re-create.

### View Forex — History Data tab

| Field | Meaning | Required | Notes / validation |
|---|---|---|---|
| Date Txn | The date the rate applies to. | Yes (form default: today) | Date picker. Rows are listed newest first; documents read the row with the latest `date_txn`, whatever the document date. |
| Sell Rate | The rate copied into **purchase-side** documents (`isSales = false`). The feed's *Ask Price* when filled by search. | Yes | Number; `type="number"`, no range check. Saved to `sell_rate` (`numeric(70,22)`). |
| Buy Rate | The rate copied into **sales-side** documents (`isSales = true`). The feed's *Bid Price* when filled by search. | Yes | Number; no range check. Saved to `buy_rate`. |
| Middle Rate | `(sell + buy) / 2`, computed on add. | — | Not editable. Saved to `mid_rate`. |
| Search (magnifier) | Fills Sell Rate (Ask) and Buy Rate (Bid) for this pair from the third-party feed. | — | Leaves the row unsaved until you press add. |
| Add | Saves the row. | — | Disabled while Sell or Buy Rate is empty. The backend only checks that `data_source_hdr_guid` exists (`ForexDataSourceHistoryDataConsistencyObject` L42–L50). Several rows for the same date are allowed. |

The table also has `open`, `high`, `low`, `close` and `period` columns that no screen writes.

### Forex Live

Currency Base, Currency Foreign (both required, from the currency master) and Timeframe (default *1 Month*). SEARCH queries the feed's daily time series for the concatenated pair and charts the closing values for the chosen number of trading days.

## Lifecycle and effects

This is master data: there are no DRAFT/FINAL statuses and no journal posting.

- **Statuses.** A data source and a rate row are created as `ACTIVE`; the listings and the document drop-down request `status = ACTIVE` only.
- **Delete is a soft delete.** DELETE on the Details tab (and the per-row delete on History Data) calls `ForexDataSourceHdrUow.delete` / `ForexDataSourceHistoryUow.delete`, which build a `SqlDeleteObject` with `deletePermanent = false`; the SQL is `UPDATE … SET status='DELETED' WHERE guid IN (…) AND status != 'DELETED'` (`DbTableDao.java` L421). Rows stay in the table.
- **Deleting a data source does not touch its rate rows.** Only `bl_fi_forex_data_source_hdr` is in the delete list (`ForexDataSourceHdrUow` L72–L74); the history rows remain `ACTIVE` but are unreachable from the UI once the header is gone.
- **What documents store.** Selecting a source patches the document form's `forexSourceHdrGuid`, saved as `forex_source_hdr_guid` on `bl_fi_generic_doc_hdr`. The `forex_source_history_guid` column exists on header and line but the drop-down never sets it — the document records *which pair*, not *which dated row*; the rate itself is copied into the document's Currency Rate at selection time and is not re-read later. The generic-document validators do not check that `forex_source_hdr_guid` still exists, so deleting a source leaves existing documents untouched. Claim lines are the exception: `ClaimDocumentLineDataConsistencyObject` (L153–L159, L430–L436) rejects a line whose `forex_source_hdr_guid` does not exist.
- **Backend checks at document FINAL (not in this applet).** When document and base currency differ, `GenericDocumentService.validateForexExchangeRate` (L1702–L1725) rejects a null or zero `base_doc_xrate` with `FOREX_DOC_REQUIRES_NON_ZERO_XRATE` — "Exchange rate is required for a foreign currency document." On FINAL of a forex document the backend creates a base-currency **shadow document** and links it through `base_doc_guid` (L402–L437); a second FINAL on a document that already has a shadow is refused with *"Generic Document has already been convert to shadow"* (L405–L408). Undo-to-DRAFT and VOID now revert the shadow as well.
- **Audit trail.** `bl_fi_forex_data_source_audit_trial` is written by the tenant *currency* controller when a currency is created or changed, not by this applet.

Posting proof block: not applicable — the applet has no server document type, signums, GL precedence or stock processor. Gain/loss journals are described on the document applets' pages and on [Ledger And Journal](/applets/finance/ledger-and-journal-applet/).

## Related applets

- [Organisation Applet](/applets/master-data/organisation-applet/) — sets each company's base currency, which is the filter the document selector applies to your data sources.
- [Chart of Account](/applets/master-data/chart-of-account-applet/) — holds the `FOREX_GAIN` / `FOREX_LOSS` default GL codes the document applets post to on settlement.
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/), [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/), [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/), [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/), [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/), [Purchase Credit Note (Internal)](/applets/purchase-workflow/internal-purchase-credit-note-applet/) — purchase documents that take the **sell rate** from a selected source.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Receipt Voucher (Internal)](/applets/finance/internal-receipt-voucher-applet/) — sales-side documents that take the **buy rate**.
- [Claim Applet](/applets/claims/claim-applet/) — foreign-currency claim lines reference a data source and the backend validates the reference.
- [Ledger And Journal](/applets/finance/ledger-and-journal-applet/) — where the forex gain/loss journals and the *Missing Journal Forex Gain Loss* check live.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The document has no *Forex Data Source* drop-down, only Currency and Currency Rate. | `SHOW_FOREX_DATA_SOURCE` is off (default) in that document applet. | Open the document applet's *Settings › Application Settings › Main Details › Doc Settings*, switch on **Show Forex Data Source**, save, reload the document screen. |
| The drop-down opens but lists nothing, although pairs exist. | The selector lists only `ACTIVE` sources whose Currency Base equals the document's base currency (`getInputModel()` filters `currency_base`). Pairs created with the foreign currency as base, or for another company's currency, are excluded. | Create the pair with Currency Base = the company's base currency (e.g. `MYR` base, `USD` foreign). |
| Selecting a source changes the currency but leaves Currency Rate at 0; FINAL later fails with `FOREX_DOC_REQUIRES_NON_ZERO_XRATE`. | The source has no History Data rows — `getCurrencyRate()` only patches the rate when at least one row comes back. With `CANNOT_EDIT_CURRENCY_RATE` on there is no manual fallback. | Add a dated row on the pair's History Data tab, then re-select the source (or type the rate if the box is editable). |
| The rate on the document is not the rate for the document date. | The drop-down always takes the row with the newest `date_txn` (`limit 1`, `order desc`); it does not match the document's transaction date. | Record the rate for the day before creating documents, or overwrite Currency Rate on the document. Back-dated documents need the rate typed in. |
| Changing the supplier switches the currency but the rate stays 0 until Refresh. | Supplier selection patches the currency through the store, which does not trigger the rate fetch (reported on Purchase Credit Note, fixed there in 2026-09 by auto-fetching on currency change and warning "live vs custom rate"). | Press Refresh, or select the forex source again; upgrade the applet where the fix has shipped. |
| Re-finalising a forex document after undoing it fails with *"Generic Document has already been convert to shadow"*. | Older backend builds reverted only the original to DRAFT and left the shadow at FINAL, so the original still pointed at a shadow. | Fixed in the backend (undo now reverts the shadow, `GenericDocumentService.updatePostingStatusToNonFinal`). On an old build: void the document and re-create it. |
| The search button on History Data / Forex Live returns nothing, or the console shows an error from the feed. | The third-party provider is called from the browser with a shared key on a free tier; it rate-limits and returns an *Error Message* / *Note* body instead of data. Forex Live requests the provider's daily **stock** time series with the two currency codes concatenated as the symbol; when the response has no `Time Series (Daily)` block the chart stays empty. | Type the rates manually on History Data. Treat Forex Live as best-effort reference only. |
| Descriptions is blank on View Forex although it was filled on create. | The view binds `resolve.descriptions` but the column is `description` (`forex-view-main.component.ts` `ngOnInit`). | Cosmetic; the value is stored. Check it in the listing export or the API. |
| Edits to Name / Descriptions on View Forex disappear. | The Details tab has no Save and the store has no update action. | Delete and re-create the pair. Documents that referenced the old guid keep it. |
| Two pairs with the same code appear in the document drop-down and cannot be told apart. | No uniqueness check on `code`; the drop-down shows only the code. | Delete the duplicate (soft delete) and keep codes unique by convention, e.g. `<BASE>-<FOREIGN>`. |
| A pair was deleted but old documents still show a forex source, and a claim line save fails with *forex_source_hdr_guid does not exist*. | Generic documents keep the stored guid with no validation; claim lines are validated (`ClaimDocumentLineDataConsistencyObject`). | Re-create the pair (a new guid) and re-select it on the claim line. |

## Related documentation

- [Chart of Accounts setup guide](/guides/accounting-guides/chart-of-accounts-setup/) — where the Forex Gain / Forex Loss default accounts are assigned.
- [Financial Accounting module](/modules/financial-accounting/) and [Purchasing module](/modules/purchasing/).
- [Applets and Workflows catalogue](/applets-workflows/#-forex-applets).
