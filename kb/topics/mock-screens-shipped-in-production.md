---
topic: mock-screens-shipped-in-production
aliases: [mock grid, dummy data, testData, Issue Link, Edit Issue, unbound toggle, dead settings screen, decoy control]
applets: [internal_sales_inquiry_applet, internalConsignmentBillingApplet, dailyCashierReports, salesCommissionApplet, internalSalesGRNApplet]
modules: [sales-crm, purchasing, pos]
related: [applet-settings-storage, applet-registry, consignment-billing-is-a-purchase-document, sales-gin-grn-no-ledger-effect, user-permission-manager]
wiki:
  - content/en/applets/sales-workflow/internal-sales-inquiry-applet.md
  - content/en/applets/sales-workflow/internal-consignment-billing-applet.md
  - content/en/applets/sales-workflow/daily-cashier-report-applet.md
  - content/en/applets/sales-workflow/sales-commission-applet.md
status: growing
updated: 2026-09-06
---

# Finished-looking screens that do nothing — the four shapes found so far

Every applet audit so far has found at least one control that renders, responds and stores nothing.
They are dangerous for documentation because they photograph well: a screenshot of a mock is
indistinguishable from a screenshot of a feature. Four distinct shapes, with live examples.

## 1. A grid fed by a hard-coded array

The component declares `rowData` / `testData` inline, injects no service, and either has no
data-source call or has one commented out.

- **Sales Inquiry — line item → Issue Link.** `ngOnInit` does
  `this.rowData.push({ project: 'Dummy Project', issueNumber: 'ABC-123', assignee: '<initials>', … })`.
  Clicking the row opens **Edit Issue**, a nine-screen Jira-style sub-application (Main Details,
  Planning, Attachment, Comment, Subtasks, Linked Issues, Activity, Worklog, Log Time) in which
  **no component imports a service at all**; the Worklog grid carries a hard-coded row naming a
  developer.
- **Consignment Billing — line item → Issue Link.** The same tab with its own `testData` row and its
  `getByCriteria` call commented out inside the ag-grid datasource.
- Earlier finding of the same shape: the Developer SysAdmin client-side-permission seeding screen
  (P-0008) — hard-coded `rowData`, SAVE toasts success and makes no HTTP call.

**Test:** grep the component for `Service` in the constructor. No service, no data.

## 2. A toggle with no form binding

`<mat-slide-toggle>` written without `[formControl]`. It moves, it is never read, SAVE persists
nothing.

- **Daily Cashier Reports → Field Settings**: eight of eleven toggles — *Lines Settings* (Unit
  Discount, SST/VAT/GST, WHT, Blanket Order) and *Department Settings* (Segment, G/L Dimension,
  Profit Center, Project). The three that work (`VIEW_OWN_CREATED_TRANSACTIONS_ONLY`,
  `HIDE_ZREPORT_MENU`, `HIDE_CASHIER_COLLECTION_BY_SETTLEMENT_MENU`) plus two selects
  (`DEFAULT_TRANSACTION_DATE`, `SORTING_ORDER`) sit on the same screen.
- The same unbound eight-toggle stub is the applet-local `field-configuration` component in Sales
  Commission and in Consignment Billing (METHOD §29 first recorded it in Merchant Admin, Shipping
  Pricebook, Supplier and Tax Configuration).

**Test:** for every rendered control, require a `formControl`/`formControlName` **and** a key in the
component's `FormGroup` **and** a save handler.

## 3. A routed component with no menu entry

The route exists, the component compiles, the backend endpoint is live — and nothing links to it.

- **Daily Cashier Reports → Cashier Collections By Settlement Type** (P-0136). Route, component and
  a `…/reports/sales/cashier-collections-settlement-type/backoffice-ep` endpoint all exist; the menu
  entry is commented out of `menu-items.ts`, and `updateMenuItem()` only re-inserts entries present
  in that list, so its `if (menuItem && …)` guard never fires. A settings toggle to hide the menu
  item is still on the settings screen.
- **Consignment Billing → Knock Off Settings**: routed, componentised, menu entry commented out.
- **Sales Commission**: the `release-notes` route; **Sales Refund Note**: `release-notes` and
  `applet-log`.

**Test:** diff the `path:` list in `app.routing.ts` against `menuItems` + `settingItems` +
`personalizationItems`.

## 4. A declared component that no route imports

The settings module `declares` a local `FieldConfigurationComponent`, but `app.routing.ts` imports
the shared one from `blg-shared-utilities` by explicit path. The local one is dead.

- Consignment Billing (declared in `applet-settings.module.ts`, route uses the shared component),
  Sales Inquiry, Sales Refund Note, Sales Commission (where the local import is even commented out
  in the routing file), Sales GRN (P-0106).

**Test:** read what `app.routing.ts` imports, not what the module declares (METHOD §29).

## Why this belongs in the KB rather than in one page

Three of these four shapes were previously found one applet at a time and written up as one-off
defects. They are a class. Before documenting any screen, run the four tests above; before writing
"the applet lets you …", confirm a service call. Wiki pages that describe a mock as a feature are
the single most common tier-1 error found in the applet programme after direction-of-posting errors.

## Open questions

- Is there a build-time lint that could catch shapes 2 and 4 across all applet repos? Both are
  mechanically detectable.
- How many of the mock screens are abandoned prototypes versus features awaiting a backend? The
  Issue Link / Edit Issue tree is large enough to have been an intended feature.
