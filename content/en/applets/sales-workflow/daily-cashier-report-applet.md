---
title: "Daily Cashier Reports"
description: "Reference for the Daily Cashier Reports applet: two read-only reports — Cashier Collection and the Z Report — with the exact document types each counts, the five settings that work, and the third report screen that ships but cannot be reached."
applet_code: "dailyCashierReports"
applet_repo: "blg-applet-wavelet-daily-cashier-reports-applet"
page_type: applet
modules: [pos, sales-crm, financial-accounting]
related_applets:
  - pos-general-applet
  - internal-sales-invoice-applet
  - internal-sales-return-applet
  - internal-sales-refund-note-applet
  - sales-report-applet
  - cashbook-applet
  - organisation-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/app.routing.ts
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/app.component.ts
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/components/settings-container/field-configuration/field-configuration.component.html
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/components/settings-container/field-configuration/field-configuration.component.ts
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/components/personalization-container/personal-default-settings/personal-default-settings.component.html
  fields:
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/components/z-report-container/z-report/z-report.component.ts
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/components/z-report-container/z-report/z-report.component.html
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/components/cashier-collections-container/cashier-collections/cashier-collections.component.ts
  lifecycle:
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/services/api-service.ts
  troubleshooting:
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/app.component.ts
    - blg-applet-wavelet-daily-cashier-reports-applet/micro-fe/projects/wavelet-erp/applets/daily-cashier-reports-applet/src/app/components/cashier-collections-container/cashier-collections/cashier-collections.component.ts
tags:
- sales
- cashier
- collection
- z-report
- reconciliation
- reports
weight: 60
lastmod: 2026-09-06
draft: false
---

## Overview

**Daily Cashier Reports** is a read-only reporting applet with two screens: **Cashier Collection**,
a line-level listing of every settlement taken, and the **Z Report**, the end-of-day summary for one
branch and one date. It creates and changes nothing — both screens are single calls to the sales
reporting endpoints, rendered in a grid.

The same two reports are also reachable inside [POS General](/applets/sales-workflow/pos-general-applet/).
This applet exists so that a manager or back-office user can read them without a POS licence or a
till session, and its Z Report is a slightly reduced version of the POS one — it has no Device filter
and no *Show Settlement Methods By User* / *Show Category Details* options.

## Where it fits

| | Applet | Relationship |
|---|---|---|
| Data source | [POS General](/applets/sales-workflow/pos-general-applet/), [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Refund Note (Internal)](/applets/sales-workflow/internal-sales-refund-note-applet/) | The Z Report sums exactly these four document types |
| This applet | **Daily Cashier Reports** | Reads. Writes nothing |
| Adjacent | [Sales Report](/applets/sales-workflow/sales-report-applet/) | Broader sales analysis over the same documents |
| Where the money lands | [Cashbook](/applets/master-data/cashbook-applet/) | The bank and cash accounts the settlements post to |

## Screens and menus

Two menu entries by default:

| Menu item | Route | What it shows |
|---|---|---|
| **Cashier Collection** | `cashier-collection-report` | Every settlement line, filtered by advanced search |
| **Z Report** | `z-report` | The end-of-day summary for one branch and one date |

A third screen, **Cashier Collections By Settlement Type**, is built and routed
(`cashier-collections-settlement-type`) with its own backend endpoint, and the settings screen even
offers a toggle to hide its menu item — but its entry is commented out of the menu list, and the
menu builder only re-inserts entries that exist in that list. **It cannot be reached from the UI.**
Recorded as **P-0136**.

### Cashier Collection

One grid, twelve columns: **Branch, Settlement Method, Doc Type, Doc No, Created Date, Txn Date,
Sales Agent, Sales Agent Code, User Create, Device, Amount, Remarks**. Filtering is through the
shared advanced-search panel, which offers a create-date and a transaction-date range (each with a
Day / period selector) alongside the model's other criteria. Grouping and totalling are done in the
grid — drag Branch or Settlement Method into the group bar to get subtotals per payment method.

The branch list is restricted to the branches your `API_TNT_DM_ERP_REPORT_CASHIER_COLLECTION_READ`
permission target allows.

### Z Report

A short form — **Branch** and **Date** — then **SEARCH**, with **Export to PDF** beside it. The
grid has three columns, **Username**, **Description** and **Amount**, grouped by Username with the
amount summed per group.

The request asks for one day (the same date is sent as both from and to) and restricts the query to
four server document types: `INTERNAL_SALES_CASHBILL`, `INTERNAL_SALES_INVOICE`,
`INTERNAL_SALES_RETURN` and `INTERNAL_SALES_REFUND_NOTE`. Anything else — a credit note, a receipt
voucher, a journal — is not in the Z Report.

The response is rendered as five blocks in this order:

1. **Settlement totals** per payment method, ending in a **Total** row. Methods with a zero amount
   are dropped.
2. **Settlement detail** — the same payments broken out per user.
3. **Sales**: Gross Sales (net amount plus discount, less rounding), Discount, Rounding, and
   **Total Net Sales**, then the tax lines.
4. **Categories** — one row per item category.
5. **Counts**: No. of Transactions, No. of Transaction (Discounted), Item Sold, Item Sold
   (Discounted).

The branch list here is restricted by the `API_TNT_DM_ERP_Z_REPORT_READ` permission target.

**Export to PDF** renders the grid as it stands through the shared PDF exporter, with the Amount
column right-aligned. There is no separate "print" action — print the PDF.

A recorded walkthrough of these two reports is available:
[Daily Cashier Reports (video)](https://www.youtube.com/watch?v=eQ2V1zNr8QA).

## Configuration

### Before you can use it

| What | Where | Why |
|---|---|---|
| Branches | [Organisation](/applets/master-data/organisation-applet/) | Both screens are branch-scoped |
| Settlement methods | [Organisation](/applets/master-data/organisation-applet/) | The Settlement Method column and the Z Report's payment blocks |
| The read permission targets `API_TNT_DM_ERP_Z_REPORT_READ` and `API_TNT_DM_ERP_REPORT_CASHIER_COLLECTION_READ` | Settings → Permission Set / Role Permission | Without a branch target on these, the branch drop-down comes back empty |
| Sales documents of the four counted types | [POS General](/applets/sales-workflow/pos-general-applet/) and the sales applets | There is nothing to report otherwise |

No GL code, numbering or tax configuration is needed: this applet posts nothing.

### Applet settings

Settings live in an **applet-local** `FieldConfigurationComponent` — the route
`settings/field-settings` points at the applet's own component, not the shared one from
`blg-shared-utilities`. The settings menu has two entries, **Field Settings** and **Default
Selection**; a **Release Notes** route exists with no menu entry. Personalization has one entry,
**Default Selection**.

Five keys are bound to a control, saved by SAVE, and read at runtime:

| Setting | What it controls | Default | Effect when changed |
|---|---|---|---|
| **Allow viewing own created transactions only** (`VIEW_OWN_CREATED_TRANSACTIONS_ONLY`) | Restricts the Cashier Collection grid to rows the current user created | off (null until first save) | On: a user sees only their own collections, unless they hold the `ALLOW_VIEW_TRANSACTION_ALL_USER_CREATE` permission |
| **Hide Z-Report Menu** (`HIDE_ZREPORT_MENU`) | Removes the Z Report menu entry | off | The entry can be restored per role with the `SHOW_ZREPORT_MENU` client-side permission |
| **Hide Cashier Collection By Settlement Type Menu** (`HIDE_CASHIER_COLLECTION_BY_SETTLEMENT_MENU`) | Would remove that menu entry | off | No effect — the entry is commented out of the menu list, so the screen is unreachable either way (**P-0136**) |
| **Default Transaction Date Range** (`DEFAULT_TRANSACTION_DATE`) | Pre-fills the Cashier Collection transaction-date filter | unset | `1_day` or `1_week` sets the opening range |
| **Sorting Order** (`SORTING_ORDER`) | The column and direction the Cashier Collection grid opens on | unset | Applied as the query's `orderBy` |

{{< callout type="warning" >}}
**Eight toggles on the same screen are decoys.** Under *Lines Settings* (Unit Discount, SST/VAT/GST,
WHT, Blanket Order) and *Department Settings* (Segment, G/L Dimension, Profit Center, Project) the
slide toggles carry **no `formControl` binding at all**. They can be switched, they are never read,
and SAVE does not persist them. Recorded as **P-0137**.
{{< /callout >}}

**Default Selection** sets the applet-wide **Default Branch** and **Default Location**;
**Personalization → Default Selection** overrides them per user, and the Z Report pre-fills its
Branch field from the *personal* setting.

### Feature visibility and permissions

Two client-side permission codes are checked and both are seeded:

| Code | What it does |
|---|---|
| `SHOW_ZREPORT_MENU` | Restores the Z Report menu entry for a role even when `HIDE_ZREPORT_MENU` is on |
| `ALLOW_VIEW_TRANSACTION_ALL_USER_CREATE` | Lets a user see other users' rows on Cashier Collection when `VIEW_OWN_CREATED_TRANSACTIONS_ONLY` is on |

Server-side, the applet requests the `API_TNT_DM_ERP_Z_REPORT_READ` permission at start-up; the
Cashier Collection screen declares `API_TNT_DM_ERP_REPORT_CASHIER_COLLECTION_READ` as its branch
read permission. Both are *target* permissions — they decide which branches appear, not merely
whether the screen opens.

## Lifecycle and effects

This applet is **read-only**. It creates no documents, writes no journal, moves no stock and holds
no state of its own beyond the five settings above.

| Screen | What it reads | How |
|---|---|---|
| Cashier Collection | Settlement lines | The `cashier-collections/backoffice-ep` sales-report endpoint under the tenant ERP reports prefix |
| Z Report | Payments, sales, categories and transaction counts for one branch and date, over `INTERNAL_SALES_CASHBILL`, `INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_RETURN`, `INTERNAL_SALES_REFUND_NOTE` | The `z-report` sales-report endpoint |
| Cashier Collections By Settlement Type (unreachable) | The same collections grouped by settlement type | The `cashier-collections-settlement-type/backoffice-ep` endpoint |

## Related applets

- [POS General](/applets/sales-workflow/pos-general-applet/) — where the cash bills and settlements are taken, and where the fuller Z Report lives.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Refund Note (Internal)](/applets/sales-workflow/internal-sales-refund-note-applet/) — the other three document types the Z Report counts.
- [Sales Report](/applets/sales-workflow/sales-report-applet/) — analysis across the same documents, not restricted to one day.
- [Cashbook](/applets/master-data/cashbook-applet/) — the accounts the settlements post to; reconcile the Cashier Collection totals against them.
- [Organisation](/applets/master-data/organisation-applet/) — branches, locations and settlement methods.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| The Branch drop-down is empty on either screen | Your role has no branch target on `API_TNT_DM_ERP_Z_REPORT_READ` (Z Report) or `API_TNT_DM_ERP_REPORT_CASHIER_COLLECTION_READ` (Cashier Collection). This is a target filter, not a yes/no permission — the screen still opens | Add the branches to the permission target |
| The Z Report total does not match the day's takings | The Z Report counts only `INTERNAL_SALES_CASHBILL`, `INTERNAL_SALES_INVOICE`, `INTERNAL_SALES_RETURN` and `INTERNAL_SALES_REFUND_NOTE`. Credit notes, debit notes and receipt vouchers are excluded | Reconcile the excluded documents separately, or use [Sales Report](/applets/sales-workflow/sales-report-applet/) |
| The Z Report shows one day only | The form has a single Date field and the request sends it as both from and to | Run it once per day |
| A user sees no rows on Cashier Collection | `VIEW_OWN_CREATED_TRANSACTIONS_ONLY` is on and the user created none of the day's collections | Grant `ALLOW_VIEW_TRANSACTION_ALL_USER_CREATE`, or clear the setting |
| The Z Report menu entry is missing | `HIDE_ZREPORT_MENU` is on for the tenant | Grant `SHOW_ZREPORT_MENU` to the role, or clear the setting |
| The Cashier Collections By Settlement Type screen cannot be found | Its menu entry is commented out; the hide setting for it has no effect either way | No workaround from the UI. **P-0136** |
| Toggles under Lines Settings or Department Settings do nothing | They have no form binding and are not saved. **P-0137** | Ignore them |
| An *AG Grid Error* toast appears after SEARCH | The report endpoint returned an error; the applet surfaces the message verbatim under that heading | Read the message; the usual causes are an out-of-range date or a branch you have no target for |
| Export to PDF is empty | The grid is empty — export renders what is on screen | Run SEARCH first |

## Related documentation

- [POS module](/modules/pos/)
