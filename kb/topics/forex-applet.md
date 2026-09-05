---
topic: forex-applet
aliases: [forex data source, exchange rate master, currency pair, forex history, Forex Applet]
applets: [forexApplet]
modules: [financial-accounting, purchasing, core]
related: [internal-purchase-order-applet, internal-sales-invoice-applet, claim-applet, chart-of-accounts, ledger-and-journal-applet, organisation-applet, forex-shadow-document]
wiki:
  - content/en/applets/master-data/forex-applet.md
status: growing
updated: 2026-09-05
---

# Forex Applet (forex data sources and dated rates)

The Forex applet is a small master-data applet: a **Forex Data Source** is a currency pair (base → foreign) and its **History Data** rows are dated sell / buy / mid rates. Document applets that switch on `SHOW_FOREX_DATA_SOURCE` show a drop-down of the pairs whose base equals the document's base currency; picking one sets the document currency and copies the newest recorded rate. The applet itself posts nothing.

## Facts

- 2026-09-05 — Registry row `forexApplet` "Forex Applet", ACTIVE, type TNT-USER; its `documentation_url` points at the catalogue anchor `/applets-workflows/#-forex-applets`, not at the applet page. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo `blg-applet-wavelet-forex-applet`, project `micro-fe/projects/wavelet-erp/applets/forex-applet`, route `applet/tnt/wavelet/erp/forex-applet`; two menu items, *Forex Data Source* (`forex`) and *Forex Live* (`forex-live`). Commit aa5850e (2026-09-02). [src:blg-applet-wavelet-forex-applet/.../src/app/app.routing.ts] [src:.../models/menu-items.ts]
- 2026-09-05 — Create form fields: code, name, descr, currency_base, currency_foreign (all but descr `Validators.required`); currencies come from the shared `select-multi-currency-drop-down`, which lists the tenant currency master ordered by `display_short`. [src:.../forex-create-main/forex-create-main.component.ts] [src:blg-shared-utilities/utilities/select-multi-currency-drop-down/select-multi-currency-drop-down.component.ts]
- 2026-09-05 — The store has create / delete / createHistory / deleteHistory actions and **no update action**; the View "Details" tab renders Name and Descriptions as inputs with no Save. Headers are immutable after create in practice. [src:.../state-controllers/forex-controller/store/actions/forex.actions.ts] [src:.../forex-view/forex-view.component.html]
- 2026-09-05 — View binds `descr: resolve.descriptions`; the API column is `description` (create sends `description: entity.descr`). Descriptions therefore always shows blank on View. [src:.../forex-view-main/forex-view-main.component.ts] [src:.../services/api-service.ts]
- 2026-09-05 — History Data form: date_txn (default today), sell_rate, buy_rate (required); mid_rate = (sell+buy)/2 computed client-side. The search button fills sell = provider *Ask Price*, buy = *Bid Price* from a third-party feed called directly from the browser with a key compiled into the applet (also duplicated in `blg-shared-utilities/services/forex.service.ts`). [src:.../forex-view-history/forex-view-history.component.ts] [src:.../services/finance-service.service.ts]
- 2026-09-05 — Forex Live calls the provider's `TIME_SERIES_DAILY` (equity daily series) with `currency_base + currency_foreign` concatenated as the symbol and charts `4. close`; no tenant data is written. [src:.../forex-live/forex-live.component.ts]
- 2026-09-05 — Applet-local settings screens are all dead: Field Settings is a static template (8 unbound toggles, SAVE without handler, empty class); Default Selection and Personal Default Selection never receive an `appletContainer` (route binds no input; subscription commented out) so a change throws and `save` emits to nobody. `applet-settings.model.ts` declares 50 keys nothing reads. Zero four-proof settings. [src:.../settings-container/field-configuration/field-configuration.component.html] [src:.../settings-container/default-settings/default-settings.component.ts] [src:.../personalization-container/personal-default-settings/personal-default-settings.component.ts]
- 2026-09-05 — `forexApplet` has 0 rows in `bl_applet_client_side_perm_dfn` and checks no SHOW_*/HIDE_* codes. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Backend permissions: header endpoints (`core2/tnt/dm/forex-data-source-hdr`) use `PlatformPermissions.API_BL_FI_FOREX_DATA_SOURCE_HDR_{CREATE,UPDATE,DELETE,READ}`; history endpoints (`core2/tnt/dm/erp/fi/forex-data-source-histories`) use `TntErpPermissionsV2.BL_FI_FOREX_DATA_SOURCE_HISTORY_{CREATE,UPDATE,DELETE,READ}`; listings in `ListingController` L718–L760 (`forex-data-source`, `forex-data-source-history`, `forex-data-source-config`). [src:blg-akaun-platform-java/akaun-api/.../platform/dm/bank/ForexDataSourceHdrController.java] [src:.../tenant/dm/erp/financialItem/ForexDataSourceHistoryController.java] [src:.../tenant/dm/erp/ListingController.java]
- 2026-09-05 — Backend validators (`ForexDataSourceHdrDataConsistencyObject`, `ForexDataSourceHistoryDataConsistencyObject`) check only guid/status/revision/subject/date columns and, for history, that `data_source_hdr_guid` exists. No code uniqueness (table has a plain btree index on `code`), no currency validation, no rate range. [src:.../validator/bank/ForexDataSourceHdrDataConsistencyObject.java] [src:.../validator/CompanyDataConsistencyObjects/ForexDataSourceHistoryDataConsistencyObject.java] [src:tenant-schemas/pcimage/tables/bl_fi/bl_fi_forex_data_source_hdr.sql]
- 2026-09-05 — Delete is a soft delete (`SqlDeleteObject` 4-arg ctor → `deletePermanent=false` → `UPDATE … SET status='DELETED'`, `DbTableDao.java` L421). Deleting a header does not touch its history rows (`ForexDataSourceHdrUow` L72–L74 lists only the hdr table). [src:.../dal/uow/bank/ForexDataSourceHdrUow.java] [src:.../common/ddd/DbTableDao.java]
- 2026-09-05 — Table `bl_fi_forex_data_source_history` also has open/high/low/close/period columns no screen writes; `bl_fi_forex_data_source_config` (param_code/value_json per source) exists with a controller and listing but no UI in this applet. [src:tenant-schemas/.../bl_fi_forex_data_source_history.sql] [src:.../bl_fi_forex_data_source_config.sql]
- 2026-09-05 — Consumer mechanism (shared `app-forex-data-source-drop-down`): lists `ACTIVE` sources filtered by `currency_base = document base currency` (or `currency_foreign` when `filterByForeignCurrency`), option text = code only; on select patches `forexSourceHdrGuid`, emits the row (consumer sets document currency = `currency_foreign`), then fetches history `orderBy date_txn desc, limit 1` and patches `currencyRate` with `buy_rate` if `isSales` else `sell_rate`. Never sets `forex_source_history_guid`. [src:blg-shared-utilities/utilities/forex-data-source-drop-down/forex-data-source-drop-down.component.ts] [src:.../forex-data-source-drop-down.component.html]
- 2026-09-05 — `SHOW_FOREX_DATA_SOURCE` is a shared Application Settings toggle (Main Details › Doc Settings, ungated by applet code), null-patched `?? false`; `CANNOT_EDIT_CURRENCY_RATE` sits next to it (`?? false`). `HIDE_FOREX_HISTORY` is rendered only for `salesInvoiceApplet` and declared in that applet's model but no component reads it. [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html L1686–L1692, L1917–L1920] [src:.../field-configuration.component.ts L1754, L1950–L1951]
- 2026-09-05 — Verified embedders of the drop-down: Purchase Order (`isSales=false`, L532–L542), Sales Invoice (`isSales=true`, L379–L389), Purchase Invoice, Purchase Invoice No Stock In, Purchase GRN, Purchase GRN Stock In, Purchase Credit Note, Receipt Voucher v2; the shared `gen-doc-simplified-ui` passes `isSales=false` on both its "Forex Source" and "Sales Forex Source" slots. [src:blg-applet-wavelet-internal-purchase-order-applet/.../main-details.component.html] [src:blg-applet-wavelet-internal-sales-invoice-applet/.../main-details.component.html] [src:blg-shared-utilities/modules/gen-doc-simplified-ui/gen-doc-simplified-ui.component.html L391–L401, L876–L886]
- 2026-09-05 — Generic documents store `forex_source_hdr_guid` / `forex_source_history_guid` on hdr and line; the generic-document validators never check them (only query criteria use them). Claim lines are validated: `ClaimDocumentLineDataConsistencyObject` L153–L159 / L430–L436 rejects a non-existent `forex_source_hdr_guid`. [src:.../dal/table/bl_fi_generic_doc_hdr.java] [src:.../validator/erp/auditAssuranceTax/claim/claimDocumentLineDCO/ClaimDocumentLineDataConsistencyObject.java]
- 2026-09-05 — Document-side backend rules (not this applet): `GenericDocumentService.validateForexExchangeRate` L1702–L1725 throws `FOREX_DOC_REQUIRES_NON_ZERO_XRATE` when currencies differ and `base_doc_xrate` is null/0; FINAL of a forex document (`JournalPostingService.isForex`) creates a base-currency shadow linked by `base_doc_guid` (L402–L437) and a second FINAL is refused with "Generic Document has already been convert to shadow". Undo/VOID now revert the shadow too (fixed 2026-08). [src:.../domain/tenant/GenericDocumentService.java] [src:gh:bigledger/blg-int-general-task#9250] [src:gh:bigledger/blg-int-general-task#9556]
- 2026-09-05 — Field issue: supplier selection patches currency via the store and the rate stays 0 until Refresh (Purchase Credit Note, fixed 2026-09 with auto-fetch + live/custom warning toast; SAVE blocked at rate 0 on edit only). [src:gh:bigledger/blg-int-general-task#9637]
- 2026-09-05 — Original intent recorded in support: "that rate will be link with Purchase Invoice but need to enable configuration on show forex". [src:gh:bigledger/blg-int-general-task#1198]
- 2026-09-05 — `bl_fi_forex_data_source_audit_trial` is written by `CurrencyController` (tenant currency master create/update), not by this applet. [src:blg-akaun-platform-java/akaun-api/.../tenant/dm/erp/currency/CurrencyController.java L88]

## How it connects

- **internal-purchase-order-applet / purchase documents** — take `sell_rate` of the newest history row when a source is selected; rate not matched to document date.
- **internal-sales-invoice-applet / receipt voucher** — take `buy_rate`; `HIDE_FOREX_HISTORY` exists for SI only and is unconsumed.
- **claim-applet** — the only consumer whose backend validates `forex_source_hdr_guid`; deleting a pair breaks claim-line saves that still reference it.
- **organisation-applet** — the company base currency is the filter on the document drop-down (`currency_base`).
- **chart-of-accounts / ledger-and-journal-applet** — `FOREX_GAIN` / `FOREX_LOSS` default GL codes and the *Missing Journal Forex Gain Loss* check consume the results, not this applet.
- **forex-shadow-document** — FINAL of a forex document creates a base-currency shadow; the process belongs to the document applets (topic to be created by the lane that owns them).

## Open questions

- Is `bl_fi_forex_data_source_config` (per-source param/value rows with a full controller) meant to hold provider settings per pair? No UI writes it.
- Should the document drop-down pick the history row on or before the document date instead of the newest row? Current behaviour surprises users who back-date documents.
- The shared `gen-doc-simplified-ui` passes `isSales=false` for its "Sales Forex Source" slot — intended?

## Wiki impact

- content/en/applets/master-data/forex-applet.md — rewritten 2026-09-05 (this topic).
- Purchase/sales document pages — their `SHOW_FOREX_DATA_SOURCE` rows should say "newest history row, sell rate (purchase) / buy rate (sales)" rather than "rate comes from the source".
- content/en/applets/claims/claim-applet.md — its default for `SHOW_FOREX_DATA_SOURCE` is stated as **true**; the shared screen null-patches `?? false`, so the claim applet must have its own local screen — worth a cross-check by the claims lane.
