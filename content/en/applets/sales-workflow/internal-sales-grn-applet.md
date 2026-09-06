---
title: "Sales GRN (Internal)"
description: "Reference for the Sales GRN (Internal) applet: record a goods return note against an internal sale, with line-item, settlement and contra detail. The document carries no stock movement and no journal — the stock-moving counterpart is a separate document type."
applet_code: "internalSalesGRNApplet"
applet_repo: "blg-applet-wavelet-internal-sales-grn-applet"
page_type: applet
modules: [inventory, financial-accounting, sales-crm]
related_applets: [internal-sales-gin-applet, internal-sales-return-applet, internal-sales-invoice-applet, internal-sales-order-applet, internal-jobsheet-applet, internal-sales-credit-note-applet, customer-applet, inv-item-maintenance-applet, chart-of-account-applet, organisation-applet]
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/app.routing.ts
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/components/settings-container/default-settings/default-settings.component.html
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts (tabMappings, getTabValue)
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  fields:
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/components/internal-sales-grn-container/internal-sales-grn-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/components/internal-sales-grn-container/internal-sales-grn-create/main-details/main-details.component.html
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/components/internal-sales-grn-container/internal-sales-grn-create/internal-sales-grn-create.component.ts
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/components/internal-sales-grn-container/internal-sales-grn-create/add-line-item/add-line-item.component.ts
  lifecycle:
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/components/internal-sales-grn-container/internal-sales-grn-listing/internal-sales-grn-listing.component.ts
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/components/internal-sales-grn-container/internal-sales-grn-edit/internal-sales-grn-edit.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesGoodsReceivedNoteDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
  troubleshooting:
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/components/internal-sales-grn-container/internal-sales-grn-create/main-details/main-details.component.ts
    - blg-applet-wavelet-internal-sales-grn-applet/micro-fe/projects/wavelet-erp/applets/internal-sales-grn-applet/src/app/components/internal-sales-grn-container/internal-sales-grn-edit/internal-sales-grn-edit.component.ts
tags:
- grn
- goods-return-note
- sales-returns
- customer-returns
weight: 125
date: 2026-04-06
lastmod: 2026-09-06
draft: false
---

## Overview

**Sales GRN (Internal)** records a goods return note raised against an internal sale: which customer
is returning, which items and quantities, and — where your process uses them — a settlement line and
a contra link to the original document. It is the sales-side mirror of Purchase GRN.

{{< callout type="warning" >}}
**This document does not move stock and does not post a journal.** Its server document type is
`INTERNAL_SALES_GOODS_RECEIVED_NOTE`, whose quantity signum and amount signum are both **0**, and the
type has no entry in the journal posting handler. Setting a GRN to **FINAL** changes its posting
status and nothing else in the ledgers. If you need returned goods to come back into stock and the
receivable to be reduced, that happens on a different document — see
[What FINAL actually does](#lifecycle-and-effects).
{{< /callout >}}

## Where it fits

| | Document | What it does |
|---|---|---|
| Upstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/), [Jobsheet (Internal)](/applets/sales-workflow/internal-jobsheet-applet/) | The sale the return is raised against. Lines can be pulled from these on the **Select Item** panel. |
| This applet | **Sales GRN (Internal)** | Records the return. No stock movement, no journal. |
| Counterpart | [Sales GIN (Internal)](/applets/sales-workflow/internal-sales-gin-applet/) | The outbound twin, also 0/0. |
| Where stock and money actually move | [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/), [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) | Sales Return brings goods back into stock and reverses the sale; the credit note reduces the receivable. |

## Screens and menus

The applet's left menu has three entries — there are no others:

| Menu item | Route | What it shows |
|---|---|---|
| **Internal Sales GRN** | `internal-sales-grn` | The listing, and the create/edit panel |
| **Line Items** | `line-items` | A cross-document listing of GRN lines, with its own edit panel |
| **Audit Trail** | `audit-trail` | The shared audit-trail viewer |

{{< figure src="/images/internal-sales-grn-applet/grn-listing.png" alt="Internal Sales GRN listing with the create panel open on the Main Details tab" caption="The listing (left) with FINAL above the grid, and the create panel (right) showing the Main Details, Account, Lines, Settlement and Department Hdr tabs." >}}

**Listing columns:** Sales GRN No, Branch, Posting Status (empty renders as `DRAFT`), Customer Name,
Sales Agent, Transaction Date, Created By, Created Date, Updated Date.

**Create panel tabs:** Main Details · Account · Lines · Settlement · Department.

**Edit panel tabs:** Main Details · Account · Lines · Settlement · Department Hdr · Contra · Doc Link ·
Attachments · Export.

**Edit panel buttons:** RESET, SAVE, FINAL, and — only when enabled, see below — DELETE. DELETE is a
two-click action: the first click relabels the button `CLICK AGAIN TO CONFIRM`.

### Adding a line

The **Lines** tab opens a **Select Item** panel whose tabs let you search the item master or pull
lines from an existing Sales Order, Jobsheet or Delivery Order. Each line then has its own sub-tabs:

Item Details · Serial Number · Batch Number · Bin Number · Costing Details · Pricing Details · Issue Link.

{{< figure src="/images/internal-sales-grn-applet/tab-settlement.png" alt="The Settlement tab of a GRN, showing an empty settlement grid and the Add Settlement panel with a Settlement Method drop-down" caption="Settlement records how the return was squared with the customer. Total and Outstanding are shown above the grid." >}}

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why |
|---|---|---|
| At least one branch and one location | [Organisation](/applets/master-data/organisation-applet/) | **Branch** and **Location** are both required on Main Details. |
| Customer entities | [Customer Maintenance](/applets/master-data/customer-applet/) | **Customer** is required, and **Credit Terms** stays disabled until an entity is chosen. |
| A sales agent | [Employee Maintenance](/applets/master-data/employee-applet/) | **Sales Agent** is required on Main Details. |
| Items | [Inventory Item Maintenance](/applets/master-data/inv-item-maintenance-applet/) | The Select Item panel searches the item master. |

No default GL code, cashbook or settlement-method mapping is needed to save or finalise a GRN,
because the document posts nothing.

### Applet settings

Settings live in the **shared** `FieldConfigurationComponent` from `blg-shared-utilities` — the
applet routes `settings/field-settings` straight to it. The applet also contains a *local*
`settings-container/field-configuration` component, but nothing imports or routes to it; it is dead
code and its toggles never appear.

The shared screen renders per applet code. Intersecting the applet's own `AppletSettings` model with
the controls the shared template actually renders for `internalSalesGRNApplet` gives this set:

| Setting | What it controls | Where it renders |
|---|---|---|
| `VERTICAL_ORIENTATION` | Lays the settings screen out vertically instead of horizontally | Top of the screen |
| `DISABLE_GEN_DOC_LISTING` | Suppresses the generic-document listing behaviour | Gen Doc Listing section |
| `ENABLE_BRANCH_FILTER` | Filters the entity picker by the selected branch | Account section |
| `ENABLE_ITEM_NAME_MAX_LIMIT` / `ITEM_NAME_MAX_LIMIT` | Caps the length of an edited line item name | Line Items section |
| `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO` | Hide quantity columns on the line | Line Items section |
| `HIDE_UNIT_PRICE_STD_PRICING_SCHEME`, `HIDE_UNIT_PRICE_STD_INCL_TAX`, `HIDE_UNIT_PRICE_STD_EXCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_INCL_TAX`, `HIDE_UNIT_PRICE_STD_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_EXCL_TAX`, `HIDE_UNIT_PRICE_NET_UOM_EXCL_TAX`, `HIDE_UNIT_PRICE_TXN`, `HIDE_UNIT_PRICE_TXN_UOM_INCL_TAX` | Hide the corresponding unit-price columns | Line Items section |
| `HIDE_UNIT_DISCOUNT`, `HIDE_UNIT_DISCOUNT_UOM_EXCL_TAX`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX` | Hide discount columns | Line Items section |
| `HIDE_AMOUNT_STD_EXCL_TAX`, `HIDE_AMOUNT_NET_EXCL_TAX`, `HIDE_AMOUNT_TXN` | Hide amount columns | Line Items section |
| `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION` | Hide the tax and withholding-tax pickers on a line | Line Items section |
| `HIDE_COSTING_DETAILS`, `HIDE_PRICING_DETAILS`, `HIDE_SERIAL_NUMBER`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER` | Hide those line sub-panels | Line Items section |
| `HIDE_DOC_LINK`, `HIDE_ISSUE_LINK`, `HIDE_ATTACHMENT` | Hide those tabs / panels | Miscellaneous section |

Every one of these is a hide toggle whose default is unset (the control starts unchecked), so a
tenant that has never saved Application Settings sees everything.

{{< callout type="info" >}}
**Declared but never rendered for this applet.** The model also declares `HIDE_ACCOUNT`,
`HIDE_LINES`, `HIDE_SETTLEMENT`, `HIDE_CONTRA`, `HIDE_EXPORT`, `HIDE_DEPARTMENT_HDR`, the
`HIDE_*_TAB` / `EXPAND_*` pairs, `PRINTABLE`, `DEFAULT_BRANCH`, `DEFAULT_LOCATION`,
`DEFAULT_COMPANY`, `DEFAULT_ORIENTATION`, `DEFAULT_TOGGLE_COLUMN`, the `ENABLE_CUSTOM_STATUS_*`
family, and the `INCLUDE_*` / `ENABLE_*` dimension-and-tax family. Those controls sit behind
`getTabValue()`'s `tabMappings`, and `internalSalesGRNApplet` is **not** a key in that map, so none
of them render on a live tenant. Do not plan around them.
{{< /callout >}}

**Read at runtime with no model declaration:** `SHOW_DOCUMENT_DELETE_BUTTON`. The edit screen reads it
from the applet's `APPLET_SETTINGS` extension record and shows the DELETE button only when it is
true. There is no control for it on the Application Settings screen.

### Default Selection

*Settings → System Configuration → Default Selection.* Three controls only:

| Control | What it sets |
|---|---|
| Default Branch | Pre-selects Branch on a new GRN |
| Default Location | Pre-selects Location; the list is filtered by the chosen branch |
| Default Language | The resource bundle used for this applet's labels |

**Personalization → Default Selection** offers the same per-user, plus the shared **Sidebar** editor.

Other settings routes present: Printable Format Settings, Custom Resource Bundle Configuration
(translation), Webhook, Feature Visibility, and the five permission screens. Webhook and Feature
Visibility are routed but are not listed in the settings menu.

### Feature visibility / permissions

Twenty-one client-side permission codes are seeded for this applet in
`bl_applet_client_side_perm_dfn`, and all twenty-one are checked in the applet's code — an unusually
clean match. They all gate line-item columns and panels:

`SHOW_COSTING_DETAILS` · `SHOW_QTY_BASE` · `SHOW_QTY_UOM` · `SHOW_UOM_TO_BASE_RATIO` ·
`SHOW_UNIT_PRICE_STD_PRICING_SCHEME` · `SHOW_UNIT_PRICE_STD_INCL_TAX` · `SHOW_UNIT_PRICE_STD_EXCL_TAX` ·
`SHOW_UNIT_PRICE_STD_UOM_INCL_TAX` · `SHOW_UNIT_PRICE_STD_UOM_EXCL_TAX` · `SHOW_UNIT_PRICE_NET_EXCL_TAX` ·
`SHOW_UNIT_PRICE_NET_UOM_EXCL_TAX` · `SHOW_UNIT_PRICE_TXN` · `SHOW_UNIT_PRICE_TXN_UOM_INCL_TAX` ·
`SHOW_UNIT_DISCOUNT` · `SHOW_UNIT_DISCOUNT_UOM_EXCL_TAX` · `SHOW_DISCOUNT_AMOUNT_EXCL_TAX` ·
`SHOW_AMOUNT_STD_EXCL_TAX` · `SHOW_AMOUNT_NET_EXCL_TAX` · `SHOW_AMOUNT_TXN` ·
`SHOW_TAX_CONFIG_SELECTION` · `SHOW_WHT_CONFIG_SELECTION`.

Each pairs with the matching `HIDE_*` applet setting: the column shows if the permission grants it,
even when the tenant-wide hide toggle is on.

Server-side, the document type is governed by four permissions in `TntErpPermissions` —
`TNT_API_DOC_INTERNAL_SALES_GOODS_RECEIVED_NOTE_CREATE/READ/UPDATE/DELETE_TGT_GUID`.

## Fields

### Main Details

| Field | Meaning | Required | Notes |
|---|---|---|---|
| Branch | Branch the return is booked to | Yes | |
| Location | Location within the branch | Yes | Filtered by branch |
| Sales Agent | Agent credited with the return | Yes | |
| Member Card | Loyalty card of the returning customer | Yes | Carries `Validators.required` and is rendered as a click-to-select field |
| Customer | The returning entity | Yes | |
| Credit Terms | Terms copied from the entity | Yes | Disabled until an entity is chosen — the screen shows *Entity ID must be selected first* |
| Transaction Date | Document date | No | Defaults to today |
| Due Date | Derived due date | No | |
| Reference | Free-text reference | No | |
| Remarks | Free-text note | No | |
| Permit No | Permit reference | No | |
| Currency | Document currency | No | |
| Tracking ID | External tracking reference | No | |
| Doc Type | Document type label | No | |
| Tenant Doc No / Company Doc No / Branch Doc No | The three numbering levels | No | Assigned by document numbering |

{{< callout type="warning" >}}
**Member Card is a required control.** It is declared with `Validators.required` in
`main-details.component.ts` and rendered in the template, so a GRN cannot be created for a customer
who has no member card unless your tenant populates the field some other way. If this is not what
your process expects, raise it — it is recorded as a product question.
{{< /callout >}}

### Line sub-tabs

Item Details, Serial Number, Batch Number, Bin Number, Costing Details, Pricing Details and Issue
Link. Costing Details is additionally gated by the `SHOW_COSTING_DETAILS` client-side permission.

## Lifecycle and effects

### Statuses

`DRAFT` → `FINAL`. There is no VOID: the string `VOID` does not appear anywhere in the applet, and
the listing's `onFinal()` simply patches `posting_status: 'FINAL'` on every selected row that is not
already FINAL. Once a document is FINAL, RESET on the edit screen reports *This document has been
posted*.

DELETE removes a document outright, needs a second confirming click, and only appears when
`SHOW_DOCUMENT_DELETE_BUTTON` is set on the applet's settings record.

### Posting proof

| | |
|---|---|
| Server document type | `INTERNAL_SALES_GOODS_RECEIVED_NOTE` (short code `SLSGRN`) |
| Amount signum | **0** |
| Quantity signum | **0** |
| Dr/Cr equation | None — the type has no `JournalPostingTypeHandler` entry |
| GL precedence | Not applicable; no journal is produced |
| Stock processor | None — quantity signum 0 means no `bl_inv_txn_line` is written |
| What VOID reverses | Not applicable; the applet has no VOID |

Evidence: `InternalSalesGoodsReceivedNoteDataConsistencyObject.java:17–18` sets both
`correctAmountSignum` and `correctQuantitySignum` to `BigDecimal.ZERO`;
`ServerDocTypes.java:30` records `INTERNAL_SALES_GOODS_RECEIVED_NOTE(0,0)`; the applet's own
`applet-constants.ts` declares `amount_signum = 0` and `quantity_signum = 0`; and a search of
`JournalPostingTypeHandler.java` returns no entry for this document type.

{{< callout type="info" >}}
**The stock-moving relative.** The backend also defines `INTERNAL_SALES_GRN_STOCK_IN`
(`InternalSalesGrnStockInDataConsistencyObject`: quantity signum **+1**, amount signum **−1**) and
`INTERNAL_SALES_GIN_STOCK_OUT` (quantity **−1**, amount **+1**). Those are the document types that
actually move stock on the sales side. They are handled by separate applets, which are not currently
in the applet registry, so they are not documented here.
{{< /callout >}}

## Related applets

- [Sales GIN (Internal)](/applets/sales-workflow/internal-sales-gin-applet/) — the outbound twin, also 0/0.
- [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) — the document that does bring goods back into stock and reverse the sale.
- [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) — reduces what the customer owes after invoicing.
- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) and [Sales Order (Internal)](/applets/sales-workflow/internal-sales-order-applet/) — upstream documents whose lines the Select Item panel can pull.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| CREATE stays greyed out | One of the five required Main Details fields is empty: Branch, Location, Sales Agent, Member Card, Customer — or Credit Terms | Fill all five; Credit Terms unlocks only after the customer is chosen |
| *Entity ID must be selected first* under Credit Terms | The customer has not been picked yet | Choose the customer on Main Details first |
| Stock balance did not change after FINAL | Expected — this document type has quantity signum 0 | Use [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) if stock must move |
| No journal appeared after FINAL | Expected — the type is not in the journal posting handler | Raise a credit note if the receivable must be reduced |
| *This document has been posted* when clicking RESET | Posting status is FINAL | FINAL is one-way in this applet; there is no VOID |
| No DELETE button on the edit screen | `SHOW_DOCUMENT_DELETE_BUTTON` is not set on the applet settings record | Ask an administrator to set it |
| The Contra / Settlement / Export hide toggles are missing from Application Settings | `internalSalesGRNApplet` is not in the shared screen's `tabMappings`, so those sections never render | The tabs themselves still work; only their hide toggles are unreachable |

## Related documentation

- [Sales Workflow applets](/applets/sales-workflow/)
- [Inventory module](/modules/inventory/)
