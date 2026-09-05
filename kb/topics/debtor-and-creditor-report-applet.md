---
topic: debtor-and-creditor-report-applet
aliases: [debtor and creditor report, combined AR AP report, debtor & creditor report, two-sided sub-ledger report]
applets: [debtor-and-creditor-report-applet, debtor_report_applet, creditor_report_applet]
modules: [financial-accounting, crm-digital, purchasing]
related: [debtor-report-applet, creditor-report-applet, internal-receipt-voucher-applet, internal-payment-voucher-applet, entity-applet, aging-period, printable-format, historical-ageing, arap-contra]
wiki:
  - content/en/applets/finance/debtor-and-creditor-report-applet.md
  - content/en/applets/finance/debtor-report-applet.md
  - content/en/applets/finance/creditor-report-applet.md
  - content/en/user-guide/reports-analytics-v2/_index.md
status: growing
updated: 2026-09-05
---

# Debtor and Creditor Report (combined AR/AP report applet)

A separate applet (registry code `debtor-and-creditor-report-applet`, name "Debtor and Creditor Report", TNT-USER, ACTIVE since 2022-01-10) that carries fifteen reports — a debtor and a creditor copy of the outstanding-document, aging, statement-of-account, historical-aging and historical-balance reports, the AR/AP transaction reports, the salesman collection report and the two purchase payment/settlement reports — over the same backend endpoints as the single-sided applets. It is read-only and has almost no working settings: only Printable Format Settings persists anything.

## Facts

- 2026-09-05 — Repo `blg-applet-wavelet-debtor-and-creditor-report-applet` (main `0567e78`, 2026-08-26, 25 commits; no `-V2`). Route root `applet/tnt/wavelet/erp/debtor-and-creditor-report-applet`; UI title "Debtor & Creditor Report"; default landing page Debtor Outstanding Document Report. [src:blg-applet-wavelet-debtor-and-creditor-report-applet/…/app.routing.ts] [src:…/models/menu-items.ts]
- 2026-09-05 — The creditor menus (Creditor Outstanding Document / Aging / Statement of Account / Historical Transaction Aging / Historical Report, AP Transaction, Payment Details with PI, PI with Settlement) were added 2026-06-14 for a customer; before that the applet had three debtor-only menus. The old wiki page ("no As of Date filter", "no separate debtor/creditor aging menus", "ARAP Type filter") described the three-menu version. [src:blg-applet-wavelet-debtor-and-creditor-report-applet git log]
- 2026-09-05 — **Field Settings is a placeholder**: eight `mat-slide-toggle`s (Lines Settings, Department Settings) with no form control, no load, and a SAVE button without a click handler; the component class is empty. [src:…/settings-container/field-configuration/field-configuration.component.ts] [src:…/field-configuration.component.html]
- 2026-09-05 — **Default Selection (applet-wide) and Personalization → Default Selection never persist**: both components declare an `appletSettings$` input that is never subscribed, so `appletContainer` is undefined (selecting a branch throws), and `save.emit(appletContainer)` has no listener because the settings container only renders `<app-settings [routes]>`. [src:…/settings-container/default-settings/default-settings.component.ts] [src:…/personalization-container/personal-default-settings/personal-default-settings.component.ts] [src:…/settings-container/settings-container.component.html]
- 2026-09-05 — Printable Format Settings is live: `.jrxml` only, types `STATEMENT_OF_ACCOUNT_TRANSACTION` / `STATEMENT_OF_ACCOUNT_AGING`; Default writes `PRINTABLE_STATEMENT_OF_ACCOUNT_TRANSACTION` / `_AGING` through the applet's own `saveSettings` effect (merge into `APPLET_SETTINGS`). Consumed by the SOA Transaction/Aging tabs on both sides (toast "The default print preferences have not been configured"). [src:…/printable-format-controller/store/effects/printable-format.effects.ts#L190-L260] [src:…/add-printable-format.component.ts#L40-L41,L93]
- 2026-09-05 — No Aging Period Settings menu. Listings still read `AGING_PERIOD_TYPE` / `AGING_PERIOD_HDR_GUID` (month buckets, six months, when unset), `ENABLE_BRANCH_FILTER_PERMISSION`, `USE_SALESMAN_CODE_INSTEAD_OF_NAME`, `ENABLE_PORTRAIT_HISTORICAL_TRANSACTION_AGING_ANALYSIS_REPORT`, `ENABLE_DEFAULT_DATE_FROM`; only Creditor Historical Report reads `CREDITOR_EXCLUDE_SERVER_DOC_TYPES`. None has a control here. [src:…/outstanding-aging-report-listing.component.ts#L286-L318] [src:…/txn-history-listing.component.ts#L350-L373] [src:…/historical-creditor-report-listing.component.ts#L191] [src:…/entity-soa-txn.component.ts#L207]
- 2026-09-05 — Excluded document types are **hard-coded constants**: `excludeServerDocTypesDebtor` (22 purchase-side types) and `excludeServerDocTypesCreditor` (25 sales-side types), both including `INTERNAL_PURCHASE_GRN_STOCK_IN` (added 2026-06/07 after a GRN stock-in double-count report). Not configurable. [src:…/models/constants/server-doc-type.constant.ts]
- 2026-09-05 — The `Statement` / `Statement(aging)` header buttons shown in the old screenshots are gone from both Entity Report Transactions templates; `onPrintStatement*` (toast "Please setup the default printable format") is unreachable. Export is via the Statement Of Account tab. [src:…/outstanding-entity-report-view/outstanding-entity-report-view.component.html] [src:…/creditor-outstanding-entity-report-container/…/outstanding-entity-report-view.component.html]
- 2026-09-05 — Creditor Outstanding Document Report and Creditor Aging Report register only a listing column; the debtor row-click effect (`onNextAndReset(0,1)`) runs but there is no second column, so nothing opens. Historical Transaction Aging listings (both sides) also have no view. [src:…/services/creditor-outstanding-document-report-pages.service.ts] [src:…/creditor-outstanding-document-report-controller/store/effects/outstanding-document-report.effects.ts#L33-L43]
- 2026-09-05 — Writes nothing: the contra-create endpoint is declared in `api-service.ts` (L303) but no component calls it; Contra tabs only `getByCriteria`. [src:…/outstanding-document-report-view/contra/contra.component.ts#L77] [src:…/outstanding-document-report-view/contra/contra.component.html]
- 2026-09-05 — Endpoints: outstanding documents `entity-ar-ap-report/outstanding-documents/backoffice-ep`; aging `entity-ar-ap-report/outstanding-aging/details` (both sides — the backend's `/creditor/details` is not called); SOA `entity-reports/entity/backoffice-ep`; historical aging `reports/transaction-history/debtor|creditor`; historical debtor **and** creditor `entity-reports/historical-debtor/backoffice-ep`; AR/AP transactions `entity-reports/arap-transations/backoffice-ep`; collection `entity-reports/dynamic-report/backoffice-ep`; purchase reports `reports/purchase/*`. [src:…/services/api-service.ts]
- 2026-09-05 — Permissions asked at start-up: creditor+debtor outstanding document/entity/aging READ, both transaction-history READ, purchase settlement/payment READ, `ARAP_TRANSACTION_READ`, `TNT_DEBTOR_REPORT_BRANCH_TGT_READ`, admin/owner. `HISTORICAL_DEBTOR_READ` (needed by both historical reports, `EntityReportController` L124–L134) is not asked. Company scoping (`readPermissionDefintion.company`) uses **debtor** outstanding-document/entity permissions on the creditor listings too. [src:…/app.component.ts#L26-L72] [src:grep readPermissionDefintion over components/]
- 2026-09-05 — No filter model has an `arapType` key (15 models checked); the side is fixed by the menu. AR/AP Transaction require Company; PI with Settlement requires Branch ("Please select branch."). Toasts: "The default print preferences have not been configured", "No data to print. Please run the search first.". [src:…/models/advanced-search-models/*.ts] [src:grep toastr over components/]
- 2026-09-05 — Client-side permission definitions: 0 rows for this applet. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Repo issues: #1 (split from monorepo, 2025-12), #2 (Angular 14 migration, 2026-04). Wiki issue #52 (user-guide task, closed). [src:gh:bigledger/blg-applet-wavelet-debtor-and-creditor-report-applet#1] [src:gh:bigledger/blg-applet-wavelet-debtor-and-creditor-report-applet#2] [src:gh:bigledger/blg-wiki#52]

## How it connects

- **debtor-report-applet / creditor-report-applet** — the single-sided applets have the working settings (aging periods, exclusions, salesman code, popup hiding, personal defaults) and contra creation; this applet is the two-sided read-only view.
- **internal-receipt-voucher-applet / internal-payment-voucher-applet** — settlements feed the Settlement tabs, transaction reports and the collection/payment reports.
- **entity-applet** — `AR_*` vs `AP_*` default type decides the side.
- **aging-period** — no menu here; month buckets unless keys are injected.
- **printable-format** — the only live settings screen.
- **historical-ageing** — snapshot behind the four historical reports.
- **arap-contra** — read only here.

## Open questions

- Is the placeholder Field Settings screen (Lines/Department toggles copied from a document applet) meant to be removed, or to get real controls? Same for the two dead Default Selection screens.
- Should the creditor listings scope companies by `CREDITOR_*` permissions instead of the debtor ones (AP-only roles get an empty company dropdown)?
- Why does Creditor Aging call the debtor `/outstanding-aging/details` endpoint when `/creditor/details` exists?

## Wiki impact

- `content/en/applets/finance/debtor-and-creditor-report-applet.md` — rewritten 2026-09-05 (this topic).
- `content/en/user-guide/reports-analytics-v2/_index.md` and `modules-v2/financial-accounting/_index.md` — if they describe this applet as configurable or as having Statement buttons, correct to "read-only, Printable Format Settings only".
