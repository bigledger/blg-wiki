---
title: "Sales Refund Note Applet (Internal)"
description: "Reference for the Sales Refund Note (Internal) applet: refund a customer against an invoice or cash bill, with LHDN e-Invoice credit-note submission, intercompany routing, and file import and export. Covers screens, settings, fields, what FINAL posts, and the failure modes in the code."
applet_code: "internalSalesRefundNoteApplet"
applet_repo: "blg-applet-wavelet-internal-sales-refund-note-applet-v3"
page_type: applet
modules: [sales-crm, financial-accounting, e-invoice, inventory]
related_applets:
  - internal-sales-invoice-applet
  - internal-sales-return-applet
  - internal-sales-credit-note-applet
  - internal-sales-order-applet
  - pos-general-applet
  - customer-applet
  - employee-applet
  - organisation-applet
  - chart-of-account-applet
  - tax-configuration-applet
guides: []
sources:
  configuration:
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/app.routing.ts
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/models/menu-items.ts
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/models/applet-settings.model.ts
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/app.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts
    - blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html
  fields:
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/components/sales-refund-note-container/sales-refund-note-listing/sales-refund-note-listing.component.ts
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/components/sales-refund-note-container/sales-refund-note-create/sales-refund-note-create.component.html
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/components/sales-refund-note-container/sales-refund-note-edit/sales-refund-note-edit.component.ts
  lifecycle:
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/models/constants/applet-constants.ts
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/components/sales-refund-note-container/sales-refund-note-edit/sales-refund-note-edit.component.ts
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesRefundNoteDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/GenericDocServerDocTypeEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/factory/InventoryTransactionLineFactory.java
  troubleshooting:
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/components/sales-refund-note-container/sales-refund-note-create/search-invoices/search-by-invoice/invoice-line-listing/invoice-line-listing.component.ts
    - blg-applet-wavelet-internal-sales-refund-note-applet-v3/micro-fe/projects/wavelet-erp/applets/internal-sales-refund-note-applet-v3/src/app/components/sales-refund-note-container/sales-refund-note-edit/sales-refund-note-edit.component.ts
tags:
- sales
- refund
- accounts-receivable
- e-invoice
weight: 120
lastmod: 2026-09-06
draft: false
---

## Overview

**Sales Refund Note (Internal)** records money going back to a customer against a sale: which items,
which settlement methods, and — where the tenant is registered for Malaysian e-Invoice — the credit
note submitted to LHDN. It is the money-side counterpart of a
[Sales Return](/applets/sales-workflow/internal-sales-return-applet/).

Server document type `INTERNAL_SALES_REFUND_NOTE`, short code **ISRN**. The registry serves the
**v3** bundle (`internal-sales-refund-note-applet-v3`); v1 and v2 repositories also exist and are
not what ships.

{{< callout type="info" >}}
**What FINAL does.** Every line is stamped amount signum **−1** and quantity signum **+1** by the
backend. The journal therefore debits sales and output tax and credits the customer's receivable —
the reverse of a sales invoice — and the quantity comes **back into stock**. See
[Lifecycle and posting](#lifecycle-and-posting), including a signum discrepancy in the backend worth
knowing about.
{{< /callout >}}

## Where it fits

| | Document | What it does |
|---|---|---|
| Upstream | [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/), internal sales cash bill ([POS General](/applets/sales-workflow/pos-general-applet/)) | What the refund is raised against; the Search tab finds them by customer or by document |
| This applet | **Sales Refund Note (Internal)** | Records the refund, its settlement, and the e-Invoice credit note |
| Alternative | [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) | Use when goods come back and the customer is not paid out |
| Alternative | [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) | Use to reduce a receivable without a stock movement (`INTERNAL_SALES_CREDIT_NOTE` is quantity 0) |
| Downstream | Intercompany queue | When the company's intercompany configuration applies, a mirror document is queued in the counterparty company |

## Screens and menus

Five menu entries:

| Menu item | Route | What it shows |
|---|---|---|
| **Internal Sales Refund Note** | `internal-sales-refund-note` | The listing, create panel and edit panel |
| **Line Items** | `line-items` | Cross-document line listing: Sales Refund Note No, Transaction Date, Branch Code, Item Code, Item Name, Ordered Qty, Unit Price, SST/VAT/GST, Tax |
| **Intercompany** | `intercompany` | The intercompany transaction listing — **UNPROCESSED** (the processing queue) and **PROCESSED** (the generic-document intercompany links) |
| **File Export** | `file-export` | Batch export jobs: Report Name, Doc Type, Status, Error Message, Created Date, Updated Date, Actions |
| **File Import** | `file-import` | CSV import of refund notes |

The Intercompany and File Export entries are removed from the menu when
`HIDE_INTERCOMPANY_MENU` / `HIDE_FILE_EXPORT_MENU` are set — see
[Feature visibility and permissions](#feature-visibility-and-permissions) for why that is one-way.

{{< figure src="/images/internal-sales-refund-note-applet/sales-refund-note-listing-view.png" alt="Sales Refund Note listing with the edit panel open on Main Details" caption="The listing with FINAL, DISCARD, VOID and SINGLE/MULTIPLE PRINT above the grid, and the edit panel on the right. Doc Short Code ISRN." >}}

### Listing

Thirty-four columns, including a Group column, the three document numbers, Reference, Remarks,
Posting Status, Status, Branch Code, Currency, Customer Name, Sales Agent, Transaction Date, Amount
Txn, the five ARAP columns (PNS, Settlement, Doc Open, Contra, Balance), Created/Updated By and Date,
Client Doc Type and Client Doc 1–5, and the four GL analysis columns (GL Dimension, Segment, Profit
Center, Project — each shown by its own `SHOW_*` setting). Buttons above the grid: **FINAL**,
**DISCARD**, **VOID**, **SINGLE/MULTIPLE PRINT**.

### Create

| Tab | Shown when | Contents |
|---|---|---|
| **Search** | `HIDE_SEARCH_TAB` off | Three sub-tabs: **Search By Customer**, **Search By Invoice**, **Search By Cashbill**. Once one document type is linked the other of Invoice/Cashbill is hidden. This is where refund lines are pulled from the original sale |
| **Main Details** | always | Document numbering, customer, dates, currency, sales agent |
| **Account** | always | Entity details and addresses |
| **Lines** | always | The refunded items |
| **Payment** | always | The settlement lines — how the money goes back |
| **Delivery Details** | `HIDE_DELIVERY_DETAILS_TAB` off | Delivery branch, location, tracking |
| **Department Hdr** | `HIDE_DEPARTMENT_HDR_TAB` off | Dimension, profit centre, project, segment |

A **KO For** tab exists in the template but is commented out.

### Edit

The edit screen builds its tab strip from an ordered list, so the tab order is configurable per
tenant (`SALES_REFUND_NOTE_DETAILS_TAB_ORDER`). The full set, in default order:

Search · Main Details · **E-Invoice** · Account · Lines · Payment · ARAP · Delivery Details ·
**Payment Adjustment** · Department Hdr · TraceDocument · Contra · Doc Link · Attachments · Export.

Each is hidden by its `HIDE_*` key and starts expanded (in panel mode) according to its `EXPAND_*`
key. Buttons: **FINAL** and **SAVE** at the top, **DISCARD** and **VOID** with the document.

### E-Invoice tab

Four sub-tabs, backed by real services against the LHDN submission tables:

| Sub-tab | Shown when | What it shows |
|---|---|---|
| **Submission** | always | The document's e-Invoice submission state and the pending-submission, pending-posting and batch-pool queues |
| **Progress** | e-Invoice is enabled **and** posting status is `FINAL` | Submission history against IRB |
| **Notification** | always | The e-Invoice notification queue |
| **Cancellation** | e-Invoice is enabled **and** posting status is `FINAL` | Requests a cancellation / rejection with IRB |

{{< callout type="warning" >}}
**When e-Invoice is enabled the VOID button disappears.** `showVoid()` requires
`!eInvoiceEnabled`, so on an e-Invoice tenant a finalised refund note cannot be voided from the
document — the correct route is the **Cancellation** sub-tab, which follows the IRB cancellation
window rather than reversing the document locally.
{{< /callout >}}

## Configuration

### Before you can use it

| What | Where | Why |
|---|---|---|
| Branch, location, document numbering for `ISRN` | [Organisation](/applets/master-data/organisation-applet/) | Header context and the three running numbers |
| A sales agent (employee) | [Employee Maintenance](/applets/master-data/employee-applet/) | Both SAVE and FINAL abort with *Please select a Sales Agent to proceed.* if one is not set |
| A customer entity with an AR/AP type | [Customer](/applets/master-data/customer-applet/) | The journal's entity line |
| Default GL codes for the debtor mapping, `SALES`, `SALES_RETURN`, `SALES_DISCOUNT` and `OUTPUT_TAX` | [Chart of Accounts](/applets/master-data/chart-of-account-applet/) | The debtor mapping **throws** `MISSING_DEFAULT_GL_CODE` when unmapped; an unresolvable item or tax line is silently dropped and FINAL then fails on an unbalanced journal |
| Tax codes | [Tax Configuration](/applets/master-data/tax-configuration-applet/) | Line tax; hidden by `HIDE_TAX_CONFIG_SELECTION` |
| Settlement methods | [Organisation](/applets/master-data/organisation-applet/) | The Payment tab pays the customer through them |
| A default printable format | Settings → Printable Format Settings | SINGLE/MULTIPLE PRINT and the auto pop-up after FINAL |
| Return reasons | This applet's **Return Reasons Settings** | The Reason field on a line, unless `HIDE_REASON` is on |
| Company e-Invoice registration | Organisation → Company | Turns on the E-Invoice tab's Progress and Cancellation sub-tabs — and removes the VOID button |

### Applet settings

Settings live on the **shared** `FieldConfigurationComponent` from `blg-shared-utilities`, routed as
`settings/field-settings`. The applet also declares a local `field-configuration` component that no
route uses.

Settings menu: **Application Settings**, **Default Selection**, **Printable Format Settings**,
**Return Reasons Settings**, **Branch Settings**, **Workflow Settings** — plus **Release Notes** and
**Applet Log** routes that have no menu entry. Personalization has one entry, **Default Selection**.

The settings model declares **165** keys; **101** pass all four proofs for applet code
`internalSalesRefundNoteApplet`. Grouped:

| Group | Keys | What they control |
|---|---|---|
| Layout | `VERTICAL_ORIENTATION`, and the fifteen `EXPAND_*` keys (`EXPAND_MAIN_DETAILS`, `EXPAND_ACCOUNT`, `EXPAND_LINE_ITEMS`, `EXPAND_PAYMENT`… ) | Tabs versus expansion panels, and which sections start open |
| Status flow | `DEFAULT_STATUS`, `DEFAULT_POSTING_STATUS`, `DEFAULT_TRANSACTION_DATE`, `FINAL_STATUS_GUID`, `WORKFLOW_PROCESS_GUID` | The custom-status workflow. FINAL only appears when the document's current status matches `FINAL_STATUS_GUID`, or that key is unset |
| Buttons | `HIDE_GENDOC_FINAL_BUTTON`, `HIDE_GENDOC_VOID_BUTTON`, `HIDE_GENDOC_DISCARD_BUTTON`, `HIDE_GENDOC_SAVE_BUTTON`, `SHOW_DOCUMENT_DELETE_BUTTON` | Which document actions are offered |
| Listing | `DISABLE_GEN_DOC_LISTING`, `SORT_ORDER`, `FUZZY_SEARCH_COLUMNS`, `HIDE_AMOUNT_TXN_MAIN_LISTING`, `HIDE_SERVER_DOC_1/2/3`, `HIDE_CREATED_BY_DETAILS`, `ENABLE_BRANCH_FILTER` | The grid: which columns, how it sorts and searches, whether branch filtering applies |
| Refund control | `WARN_EXCESS_RETURN_QUANTITY`, `SALES_RETURN_WITH_PAYMENT`, `ENABLE_EDITING_UNIT_PRICE_STD` | Whether a line may exceed what was invoiced, whether a refund carries payment lines, whether the standard unit price may be edited |
| Line grid and item form | `HIDE_QTY_BASE`, `HIDE_QTY_UOM`, `HIDE_UOM_TO_BASE_RATIO`, `HIDE_AMOUNT_*`, `HIDE_DISCOUNT_AMOUNT_EXCL_TAX`, `HIDE_MULTI_DISCOUNT`, `HIDE_TOTAL_DISCOUNT_AMOUNT`, `HIDE_UNIT_DISCOUNT*`, the eight `HIDE_UNIT_PRICE_*`, `HIDE_DESCRIPTION`, `HIDE_REASON`, `HIDE_LOCATION`, `HIDE_DELIVERY_BRANCH`, `HIDE_DELIVERY_LOCATION`, `HIDE_COSTING_DETAILS`, `HIDE_BATCH_NUMBER`, `HIDE_BIN_NUMBER`, `HIDE_TAX_CONFIG_SELECTION`, `HIDE_WHT_CONFIG_SELECTION`, `DISABLE_ITEM_LISTING`, `ENABLE_ITEM_NAME_MAX_LIMIT` + `ITEM_NAME_MAX_LIMIT` | What appears on the Lines tab and the add/edit line panel |
| Header fields | `CANNOT_EDIT_CURRENCY_RATE`, `SHOW_FOREX_DATA_SOURCE`, `HIDE_TRANSACTION_DATE`, `HIDE_PERMIT_NO`, `HIDE_TRACKING_ID`, `HIDE_SALES_AGENT`, `HIDE_CLIENT_DOC_TYPE`, `HIDE_CLIENT_DOC_1`…`_5`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` | Which header fields render and whether the sales agent is derived from the logged-in employee |
| GL analysis | `SHOW_GL_DIMENSION`, `SHOW_PROFIT_CENTER`, `SHOW_PROJECT`, `SHOW_SEGMENT` | The four analysis columns and fields (opt-in) |
| Tabs | `HIDE_ATTACHMENT_TAB`, `HIDE_EXPORT_TAB`, `HIDE_MAIN_CONTRA_TAB`, `HIDE_DOC_LINK`, `HIDE_RELATED_DOCUMENTS` | Hide those sections |
| ARAP and contra | `HIDE_ARAP_PNS`, `HIDE_ARAP_SETTLEMENT`, `HIDE_ARAP_DOC_OPEN`, `HIDE_ARAP_CONTRA`, `HIDE_ARAP_BAL`, `EDIT_CONTRA_TXN_DATE` | ARAP columns and whether a contra transaction date may be edited |
| Serial numbers | `ENABLE_DRAFT_LOCK_SERIAL_NUMBER_CHECKING` | Blocks a serial number already held by another draft |
| After FINAL | `ENABLE_AUTO_POPUP` | Opens the printable PDF automatically |

**Read at runtime with no control on the shared screen** — the tab-hide keys `HIDE_SEARCH_TAB`,
`HIDE_PAYMENT_TAB`, `HIDE_DELIVERY_DETAILS_TAB`, `HIDE_DEPARTMENT_HDR_TAB`, `HIDE_MAIN_ARAP_TAB` and
`HIDE_DOC_LINK_TAB`, and the two menu-hide keys `HIDE_INTERCOMPANY_MENU` and
`HIDE_FILE_EXPORT_MENU`. Their toggles on the shared screen are gated behind applet-code lists that
do not include `internalSalesRefundNoteApplet`. They keep whatever value the tenant already holds;
on a tenant that has never set them every gated tab and both menus render. Recorded as **P-0133**.

**Return Reasons Settings** is an applet-local screen: a listing of reason rows with **Reason Code**,
**Reason Name** and a **Default Selection** flag, with ADD and SAVE panels. Those are the values the
line-level Reason field offers.

**Workflow Settings** designs the custom status flow whose selected FINAL status is stored in
`FINAL_STATUS_GUID`; `WORKFLOW_PROCESS_GUID` names the process. Note the general rule for this
product: the Workflow Design engine is inert unless a status flow is configured and selected here.

**Branch Settings** and **Default Selection / Personalization → Default Selection** follow the
standard pattern: applet-wide branch, location and company defaults, overridable per user.

### Document behaviour settings

| Behaviour | Governed by | Effect |
|---|---|---|
| FINAL offered | `HIDE_GENDOC_FINAL_BUTTON` off (or the `SHOW_GENDOC_FINAL_BUTTON` permission), document `ACTIVE`, posting status empty or `DRAFT`, no invalid serial number, and the current status equals `FINAL_STATUS_GUID` (or that key is null) | Sends `{ posting_status: 'FINAL' }` |
| FINAL blocked when unbalanced | not configurable | See the balancing rule below |
| DISCARD offered | `HIDE_GENDOC_DISCARD_BUTTON` off, document `ACTIVE`, posting status empty or `DRAFT` | |
| VOID offered | `HIDE_GENDOC_VOID_BUTTON` off, posting status `FINAL`, **and e-Invoice not enabled** | |
| Everything locked | a generic-document lock is held on the record | FINAL, SAVE, DISCARD and VOID are all withdrawn |

{{< callout type="warning" >}}
**The PNS / STL balancing rule is a client-side check.** Before sending FINAL the applet compares
the total of the product-and-service lines (PNS) with the total of the settlement lines (STL) and,
if they differ, shows *PNS total amount (x) must equal STL total amount (y) for finalization* and
sends nothing. It is enforced in the browser, not by the backend: a refund note created through the
API or the file import is not subject to it.
{{< /callout >}}

### Feature visibility and permissions

The applet checks **45** client-side permission codes. **One** is seeded:
`SHOW_TRANSACTION_DATE`.

The other 44 — including `SHOW_GENDOC_FINAL_BUTTON`, `SHOW_GENDOC_VOID_BUTTON`,
`SHOW_GENDOC_DISCARD_BUTTON`, `SHOW_EDIT_SETTLEMENT_FINAL`, `SHOW_INTERCOMPANY_MENU`,
`SHOW_FILE_EXPORT_MENU`, `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH` and the `SHOW_*`
counterparts of every hideable column — have no definition row in
`bl_applet_client_side_perm_dfn` and therefore cannot be granted to any role, team or user.

The practical consequence: every `HIDE_*` setting on this applet is all-or-nothing. Hide the
Intercompany menu and no role can get it back; hide the FINAL button and nobody can post. Recorded
as **P-0134**.

Server-side permissions are unaffected: `TNT_API_DOC_INTERNAL_SALES_REFUND_NOTE_CREATE_TGT_GUID`,
`…_READ_…`, `…_UPDATE_…` and `…_DELETE_…` are all defined and used.

## Fields

### Main Details

Document type (read-only, `INTERNAL_SALES_REFUND_NOTE`), Doc No (Tenant / Company / Branch), Client
Document type, Client Doc 1–5 No, Customer, Sales Agent (**required** — both SAVE and FINAL abort
without one), Transaction Date, Reference, Remarks, Permit No, Tracking ID, Currency and Currency
Rate. Each of the client-document and reference fields is hidden by its own `HIDE_*` key; the
currency rate is locked by `CANNOT_EDIT_CURRENCY_RATE`.

### Lines

Item Code, Item Name, UOM, UOM-to-base ratio, pricing scheme, the eight unit-price variants,
Quantity Base, unit / multi / total discounts, tax and withholding-tax codes, Description, **Reason**
(from Return Reasons Settings), Location, Delivery Branch and Delivery Location, plus batch, bin and
serial sub-tabs where the item uses them. Each hideable by its `HIDE_*` key.

### Payment and Payment Adjustment

**Payment** holds the settlement lines that pay the customer back — these are the STL side of the
balancing rule. **Payment Adjustment** holds settlement adjustments against them, on its own panel.

## Lifecycle and posting

| Status (`posting_status`) | Meaning | Allowed next |
|---|---|---|
| empty / `DRAFT` | Editable | `FINAL`, or `DISCARDED` |
| `FINAL` | Posted; document locked | `VOID` — unless e-Invoice is enabled, in which case use the Cancellation sub-tab |
| `VOID` | Reversed by the void processors | — |
| `DISCARDED` | Abandoned draft | — |

A document saved from the create panel starts as `TEMP` and is promoted to `ACTIVE` by the first
SAVE on the edit panel.

Posting proof:

| Item | Value | Source |
|---|---|---|
| Server document type | `INTERNAL_SALES_REFUND_NOTE`, short code `ISRN` | `GenericDocServerDocTypeEnum` L63; `GenericDocumentTypeHandler` L784–L791 |
| Amount signum | **−1** | `InternalSalesRefundNoteDataConsistencyObject` L16, validated on create and update by `checkAmountSignum`; the applet's `applet-constants.ts` agrees |
| Quantity signum | **+1** — stock returns to the location on the line | DCO L17, applied unconditionally by `fillQuantitySignumAndAmountSignumForLine` (`GenericDocumentDataConsistencyObject` L1215–L1219); the applet's `applet-constants.ts` agrees |
| **Discrepancy to be aware of** | `ServerDocTypes` L82 declares `INTERNAL_SALES_REFUND_NOTE(0,-1)` — quantity **0**. The DCO, which is what stamps the persisted line, says **+1**, and `InventoryTransactionLineFactory` L124 copies the line's own quantity signum into the inventory transaction. The enum value is used only by a few controller endpoints. Treat +1 as the behaviour and the enum entry as stale | `ServerDocTypes` L82; DCO L17; `InventoryTransactionLineFactory` L124. Recorded as **P-0135** |
| Which handler | No entry of its own in `JournalPostingTypeHandler`; the fallback matches the name containing `SALES`, so the `SALES` handler applies: entity → `DEBTOR`, item lines → `SALES`, discount → `SALES_DISCOUNT`, return → `SALES_RETURN`, tax → `OUTPUT_TAX`, plus forex gain/loss | `JournalPostingService` L68–L82; `JournalPostingTypeHandler` L42–L52 |
| Dr/Cr equation | Line amount × amount signum (−1) → **debit** `SALES` and `OUTPUT_TAX`; the balancing entity line is a **credit** to the customer's resolved AR account. Exactly the reverse of a sales invoice | `JournalPostingService` L95–L128, L322–L361 |
| GL precedence | Line GL → header GL → item-company link → company default. The entity mapping **throws** `MISSING_DEFAULT_GL_CODE` when unmapped; an unresolvable item or tax line is silently omitted and FINAL then fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` | `JournalPostingService` L326–L346 |
| Stock processor | Quantity × +1 against the line's delivery location, falling back to the line store, the header store and the branch default | `InventoryTransactionLineFactory` |
| What VOID reverses | `updatePostingStatusToNonFinal` queues `BLG_ERP_VOID_GENERIC_DOCUMENT_PRIMARY_PROCESSOR`, which fans out to the subscribed void processors: the inventory lines are voided and balances recomputed, the journal is reversed, knocked-off lines are reopened and contra is reversed | `GenericDocumentService` L663–L706 |

## Related applets

- [Sales Invoice (Internal)](/applets/sales-workflow/internal-sales-invoice-applet/) — the document a refund is normally raised against; Search By Invoice reads it.
- [POS General](/applets/sales-workflow/pos-general-applet/) — the source of the cash bills Search By Cashbill reads.
- [Sales Return (Internal)](/applets/sales-workflow/internal-sales-return-applet/) — same stock effect, no pay-out.
- [Sales Credit Note (Internal)](/applets/sales-workflow/internal-sales-credit-note-applet/) — reduces the receivable without moving stock.
- [Customer](/applets/master-data/customer-applet/) — the entity, its AR type and its credit terms.
- [Employee Maintenance](/applets/master-data/employee-applet/) — the required Sales Agent.
- [Organisation](/applets/master-data/organisation-applet/) — branches, locations, numbering, settlement methods, intercompany configuration and the company e-Invoice registration.
- [Chart of Accounts](/applets/master-data/chart-of-account-applet/) — the debtor, sales, discount, return and output-tax GL codes.
- [Tax Configuration](/applets/master-data/tax-configuration-applet/) — line tax codes.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| *Please select a Sales Agent to proceed.* on SAVE or FINAL | The Sales Agent field is empty; the check runs before anything is sent | Set the sales agent, or switch on `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION` to derive it from the logged-in employee |
| *PNS total amount (x) must equal STL total amount (y) for finalization* | The refunded line total does not equal the settlement total. Client-side; nothing was sent | Adjust the Payment tab so the settlement equals the lines |
| *The currency rate cannot be ZERO or negative.* on SAVE | The document currency differs from base and the rate is 0 or below | Enter a rate; if the field is locked, clear `CANNOT_EDIT_CURRENCY_RATE` |
| No FINAL button on a draft | `HIDE_GENDOC_FINAL_BUTTON` is on (and the `SHOW_GENDOC_FINAL_BUTTON` permission cannot be granted), the document is not `ACTIVE`, a serial number is invalid, or the workflow status does not match `FINAL_STATUS_GUID` | Check the workflow status first; then the setting |
| No VOID button on a finalised note | e-Invoice is enabled for the company, which withdraws VOID entirely | Use the **Cancellation** sub-tab on the E-Invoice tab |
| Every button disappears on one document | A generic-document lock is held on the record | Release the lock; check whether another session has the document open |
| A refund line can be added for more than was invoiced | `WARN_EXCESS_RETURN_QUANTITY` is off | Switch it on; with it on, the Search screens refuse a line where already-returned plus this return exceeds the invoiced quantity |
| The Intercompany or File Export menu is missing and cannot be restored per role | `HIDE_INTERCOMPANY_MENU` / `HIDE_FILE_EXPORT_MENU` are set, and `SHOW_INTERCOMPANY_MENU` / `SHOW_FILE_EXPORT_MENU` have no permission definition rows | Clear the setting for the whole tenant. **P-0134** |
| No tab-hide toggles on Application Settings | The shared settings screen renders them only for applet codes in its `tabMappings`, and this one is absent | The keys keep whatever value the tenant already holds. **P-0133** |
| FINAL fails with `MISSING_DEFAULT_GL_CODE` | The customer's AR/AP type resolves to a transaction code with no company default GL code | Map it in Chart of Accounts |
| FINAL fails with `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` | An item or tax line could not resolve any GL code and was dropped from the journal | Set the GL code on the line, the item-company link, or as a company default |
| *No Default Printable Selected* after FINAL | `ENABLE_AUTO_POPUP` is on but no `PRINTABLE` default is set | Set one under Settings → Printable Format Settings |
| An intercompany mirror document never appears | The row is still in the **UNPROCESSED** tab of the Intercompany listing, or no intercompany configuration matched | Open Intercompany → UNPROCESSED and check the Status and Used Config columns |
| Search By Invoice and Search By Cashbill cannot both be used | Once a line is linked to one document type the other tab is hidden | Raise one refund note per source document type |

## Related documentation

- [Sales & CRM module](/modules/crm-digital/) and [e-Invoice module](/modules/e-invoice/).
