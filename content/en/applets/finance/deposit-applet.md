---
title: "Deposit Applet"
description: "Reference for the money market deposit applet: requisition, register and category menus, the fields on each form, what FINAL creates, and how rollover works"
applet_code: "depositApplet"
page_type: applet
applet_repo: "blg-applet-wavelet-deposit-applet"
modules: [financial-accounting]
related_applets:
  - chart-of-account-applet
  - organisation-applet
  - customer-maintenance-applet
  - forex-applet
  - cashbook-applet
  - general-ledger-applet
  - investment-applet
  - txn-recon-applet
  - internal-payment-voucher-applet
  - internal-receipt-voucher-applet
guides: []
sources:
  screens_and_menus:
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/app.routing.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/models/menu-items.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/services/sales-invoice-pages.service.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/services/line-items-pages.service.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/services/pick-pack-queue-pages.service.ts
  configuration:
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/app.component.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/app.module.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/settings-container/applet-settings.module.ts
    - blg-shared-utilities/modules/layout/sidebar/sidebar.component.html
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/sales-invoice-container/sales-invoice-container.component.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/sales-invoice-container/sales-invoice-listing/sales-invoice-listing.component.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/line-items-container/deposit-register-listing/deposit-register-listing.component.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/pick-pack-queue-container/deposit-category-listing/deposit-category-listing.component.ts
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/DepositRegisterHdrController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/DepositRequisitionHdrController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/AkaunTenantPermissions.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/TntErpPermissionsV2.java
  fields:
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/sales-invoice-container/sales-invoice-create/main-details/main-details.component.html
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/sales-invoice-container/sales-invoice-edit/edit-invitee/edit invitee details/edit-invitee-details.component.html
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/line-items-container/edit-deposit-register/edit-deposit-register-main-details/main-details.component.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/line-items-container/edit-deposit-register/edit-deposit-register-main-details/main-details.component.html
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/pick-pack-queue-container/edit-deposit-category/edit-deposit-category-main-details/main-details.component.ts
    - blg-shared-utilities/utilities/deposit.constants.ts
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/DepositRegisterHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/DepositRegisterTxnLineService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/DepositRequisitionHdrService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/DepositRequisitionEmailService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/DepositRegisterHdrDataConsistencyObject.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/DepositRequisitionHdrDataConsistencyObject.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/DepositRolloverProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/TempDepositRegisterHdrProcessor.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/DepositReqHdrEntityLinkThymeleafFormController.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/DepositRequisitionHdrEntityLinkController.java
    - blg-akaun-platform-java/akaun-api/src/main/resources/templates/deposit-submission-form.html
  troubleshooting:
    - gh:bigledger/blg-applet-wavelet-deposit-applet#8
    - gh:bigledger/blg-applet-wavelet-deposit-applet#9
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/line-items-container/edit-deposit-register/transactions/transactions-listing/transactions-listing.component.ts
    - blg-applet-wavelet-deposit-applet/micro-fe/projects/wavelet-erp/applets/deposit-applet/src/app/components/line-items-container/edit-deposit-register/registration-deposit-requisition-listing/registration-deposit-requisition-listing.component.ts
tags:
- treasury-operations
- deposit-management
- interest-tracking
- money-market
- financial-controls
weight: 210
---

## Overview

The Deposit Applet records **money market (MM) deposit placements** — company cash placed with a
financial institution for a fixed term at an agreed interest rate. It is a treasury *register*, not a
posting document: it keeps the terms, the invited counterparties and their quotations, a computed
interest schedule, and links to the cash documents that actually moved the money.

The applet has three menus that map to three tables — a **requisition** (the request for quotes,
`bl_fi_deposit_requisition_hdr`), a **register** (the live placement,
`bl_fi_deposit_register_hdr`), and a **category** (a grouping label, `bl_fi_deposit_category`).

{{< callout type="warning" >}}
**This applet posts no journal.** Neither the requisition nor the register appears in
`JournalPostingService`, and neither has a `*DataConsistencyObject` quantity or amount signum. The
rows the Transactions tab shows are `bl_fi_deposit_register_txn_line` records — an interest schedule
in the applet's own table, not general ledger entries. The ledger effect of a placement comes from
the [Internal Payment Voucher](/applets/finance/internal-payment-voucher-applet/) that pays the bank
and the [Internal Receipt Voucher](/applets/finance/internal-receipt-voucher-applet/) that receives
the money back; those documents are *linked* to the register on the Payment/Receipt tab, never
created by it. See [Lifecycle and effects](#lifecycle-and-effects).
{{< /callout >}}

## Where it fits

| Direction | What | Why |
| :--- | :--- | :--- |
| Before | [Organization](/applets/master-data/organisation-applet/) → Company | The Company drop-down lists companies; the GL Code list is filtered by that company's chart of accounts. |
| Before | [Chart of Account](/applets/master-data/chart-of-account-applet/) | Supplies the GL Code on the requisition and the register, and the optional interest / interest-expense GL codes. |
| Before | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | The invitee's Entity Name on the Edit Invitee screen is picked from the entity list; the applet embeds the customer create/edit screens for this purpose. |
| Before | [Forex](/applets/master-data/forex-applet/) | Populates the Currency drop-down (MYR is pushed to the top of the list). |
| Alongside | [Internal Payment Voucher](/applets/finance/internal-payment-voucher-applet/) / [Internal Receipt Voucher](/applets/finance/internal-receipt-voucher-applet/) | The only documents the Payment/Receipt tab will link — the search is hard-coded to `INTERNAL_PAYMENT_VOUCHER, INTERNAL_RECEIPT_VOUCHER`. |
| After | [General Ledger](/applets/finance/general-ledger-applet/), [Cashbook](/applets/master-data/cashbook-applet/) | Where the cash movement is actually visible; the deposit register itself contributes nothing to either. |
| Adjacent | [Investment Applet](/applets/finance/investment-applet/) | The other treasury register; deposits are term placements, investments are holdings. |

## Screens and menus

`app.routing.ts` (`mainPath` = `applet/tnt/wavelet/erp/deposit-requisition-applet`) exposes exactly
three child routes. The sidebar labels come from `models/menu-items.ts`; the applet title shown in the
layout header is **Money Market Deposit Applet** (`app.component.ts`, `appletName`).

| Menu | Route | Container | Opens on |
| :--- | :--- | :--- | :--- |
| MM Deposit Requisition | `deposit-requisition` | `SalesInvoiceContainerComponent` | Deposit Requisition Listing |
| MM Deposit Register | `deposit-register` | `LineItemsContainerComponent` | Deposit Register Listing |
| MM Deposit Category | `deposit-category` | `PickPackQueueContainerComponent` | Deposit Category Listing |

An empty path redirects to `deposit-requisition`; anything else redirects to the applet's 404 screen.
There is **no settings route** — see [Configuration](#configuration).

{{< callout type="info" >}}
The container class names (`SalesInvoiceContainerComponent`, `LineItemsContainerComponent`,
`PickPackQueueContainerComponent`) and many folder names are left over from the Sales Invoice applet
this repo was forked from. They have no bearing on behaviour; the screens they load are the deposit
screens listed above.
{{< /callout >}}

### MM Deposit Requisition

The listing is an ag-grid over `bl_fi_deposit_requisition_hdr` filtered to `status = ACTIVE`, sorted
by `updated_date DESC`. Columns: Doc No., Deposit Name, Deposit Code, Company, Amount Initial Deposit,
Amount Upon Maturity, Interest Type, Currency, Interest Rate (%), Interest Rate Effective (%),
Est. Interest Amount, Est. Start Date, Est. End Date, Posting Status, Status.

Pressing **+** calls the `temp/backoffice-ep` endpoint immediately: a row is created on the server
with `status = TEMP` **before you type anything**, and the screen jumps straight to *Edit MM Deposit
Requisition*. The fork's separate "Create" screen (`SalesInvoiceCreateComponent`) is still registered
in the view-column stack but nothing navigates to it, and its Main Details tab is commented out.

The edit screen has two tabs:

- **Details** — the form documented under [Fields](#fields).
- **Invitee** — hidden while `status = TEMP`; appears after the first SAVE. An ag-grid of
  `bl_fi_deposit_requisition_hdr_entity_link` rows, with **+** and row-click both opening the same
  *Edit Invitee* panel.

{{< figure src="/images/deposit-applet/deposit-requisition-details-tab.png" alt="Edit MM Deposit Requisition, Details tab, showing an empty form with Deposit Name, Deposit Code, Company, GL Code, Currency, amounts, interest fields, dates and Auto Rollover Logic" caption="Edit MM Deposit Requisition — Details. The GL Code drop-down stays empty and shows the hint 'Company must be selected first' until a Company is chosen." >}}

Action buttons on the requisition: **FINAL** (rendered only while `posting_status !== 'FINAL'` and
`status === 'ACTIVE'`), **SAVE**, and a **DELETE** button whose `*ngIf` reads a `showDeleteButton`
flag that is initialised `false` and never set — so **DELETE never renders** on a requisition.

### MM Deposit Register

The listing is an ag-grid over `bl_fi_deposit_register_hdr` sorted by `updated_date DESC`. Columns:
Deposit Name, Company, Posting Status, Deposit Date, Maturity Date, Principal Amount, Interest Rate
(%), Interest Rate Effective (%), Interest Earned, Interest Amount, Amount Upon Maturity, Rollover.
There is no document-number column because the register has no running number (see
[Lifecycle](#lifecycle-and-effects)).

**+** creates a TEMP register row on the server the same way the requisition does, then opens *Edit
MM Deposit Register* with five tabs. The last four are hidden while `status = TEMP`:

| Tab | What it holds |
| :--- | :--- |
| Details | The placement terms — see [Fields](#fields). |
| Transactions | `bl_fi_deposit_register_txn_line` rows for this deposit. **+** opens an Edit Transaction panel (Transaction Type, Transaction Date, Total Amount, Principal Amount, Interest Amount, GL Code, Description) so a line can be added or corrected by hand. This tab also carries the **Manual Rollover** button. |
| Payment/Receipt | Links existing Internal Payment Vouchers / Internal Receipt Vouchers to this deposit through `bl_fi_deposit_register_hdr_gendoc_link`. The picker lists documents of those two types only; ticking rows and pressing **Add** creates the links. It does not create a voucher. |
| Attachment | File uploads against `bl_fi_deposit_register_hdr_attachment` — the bank's confirmation letter, the signed placement agreement. |
| Rollover | A read-only grid of the deposits in the same rollover chain, with the transaction lines of each. |

An **Agreement** tab exists in the code but its `<mat-tab>` is commented out.

{{< figure src="/images/deposit-applet/deposit-register-transactions-tab.png" alt="Edit MM Deposit Register with the Transactions tab selected and the Edit Transaction panel open, showing Transaction Type, Transaction Date, Total Amount, Principal Amount, Interest Amount, GL Code and Description" caption="Register — Transactions tab and the Edit Transaction panel. Lines are generated by FINAL; this panel lets one be added or corrected by hand." >}}

{{< figure src="/images/deposit-applet/deposit-register-payment-tab.png" alt="Edit MM Deposit Register with the Payment/Receipt tab selected and the Add Payment / Receipt Voucher picker open, listing INTERNAL_RECEIPT_VOUCHER and INTERNAL_PAYMENT_VOUCHER rows with tick boxes" caption="Payment/Receipt — the picker is restricted to Internal Payment Voucher and Internal Receipt Voucher. Ticking rows links them to the deposit; no voucher is created here." >}}

{{< figure src="/images/deposit-applet/deposit-register-attachment-tab.png" alt="Edit MM Deposit Register with the Attachment tab selected and the Add Attachment drag-and-drop panel open" caption="Attachment — supporting documents for the placement." >}}

Action buttons on the register: **FINAL**, **Select Requisition**, **SAVE** (all three hidden once
`posting_status === 'FINAL'`; **Select Requisition** is also hidden when `status === 'INACTIVE'`).
The **DELETE** button's `*ngIf` calls `deleteCondition()`, which returns `null` on its first line —
so **DELETE never renders** on a register either, and `onDelete()` returns before doing anything.

### MM Deposit Category

A single-tab master-data screen over `bl_fi_deposit_category`. The listing shows Category Code,
Category Name, Posting Status, Created Date, Updated Date, Status. The edit screen has **SAVE**,
**FINAL** (while `posting_status !== 'FINAL'` and `status === 'ACTIVE'`) and a working **DELETE**
(two clicks to confirm; rendered whenever `status === 'ACTIVE'`, regardless of posting status).

## Configuration

### Before you can use it

| Prerequisite | Where it is set | Why it matters |
| :--- | :--- | :--- |
| At least one company | [Organization](/applets/master-data/organisation-applet/) | Company is a required field on both the requisition and the register, and it is what filters the GL Code list. |
| A chart of accounts with the placement GL code | [Chart of Account](/applets/master-data/chart-of-account-applet/) | GL Code is required on both forms. The list is loaded with `chart_of_acc_guid = <the selected company's chart>`, capped at 200 rows. |
| Currencies | [Forex](/applets/master-data/forex-applet/) | Currency is required. The drop-down is the full `bl_fi_mst_ccy` list with MYR sorted first. |
| A running number for `DEPOSIT_REQUISITION_NO` | Document numbering | The requisition's `server_doc_no` is generated from this code by `RunningNumberGeneratorUtil`. Without it the requisition saves with no document number. The register has no equivalent. |
| At least one deposit category | MM Deposit Category, in this applet | Deposit Category is `Validators.required` on the register form — the register cannot be saved until one exists. |
| Entities for the invitees | [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) | Edit Invitee picks Entity Name from the entity listing. |
| Outbound e-mail | Platform (Amazon SES) | Finalising a requisition sends the invitation e-mails through `AwsSes.sendHtmlEmail`. |

### Applet settings

**This applet has no settings screen.** Three separate proofs:

1. `app.component.ts` sets `readonly hideSettings = true` and passes it to `<app-layout>`. In
   blg-shared-utilities the sidebar wraps both the settings gear
   (`*ngIf="(userRank === 'OWNER' || userRank === 'ADMIN') && (!hideSettings)"`) and the
   Personalization link (`*ngIf="!hideSettings"`) in that flag — so neither renders, for anyone.
2. `app.routing.ts` declares no `settings` route. It imports the shared permission and personalization
   containers but never routes them.
3. A `components/settings-container/` folder exists with a Field Configuration component, a Default
   Settings component, an Email Template container and a Printable Format container. They are declared
   in `AppletSettingsModule`, and **`AppletSettingsModule` is imported by nothing** — `app.module.ts`
   does not list it. The whole folder is unreachable dead code inherited from the fork.

Consequently there is no Application Settings screen, no Default Selection, no printable format
configuration and no configurable e-mail template in this applet. The invitation e-mail body is built
in Java (`DepositRequisitionEmailService.buildEmailTemplate`) and is not editable from the product.

{{< callout type="info" >}}
Two open issues on the applet repository ask for exactly this
(`gh:bigledger/blg-applet-wavelet-deposit-applet#8` and `#9`, both "Deposit Applet — To add Setting
and Personalization menu"). Until they are done, the settings gear is absent by design.
{{< /callout >}}

### Settings read at runtime without a control

Three `APPLET_SETTINGS` keys are read from the session's master settings by reachable components.
Because there is no settings screen, the `bl_applet_ext` row that carries them cannot be created from
inside this applet — it would have to be written through the API. All three default to undefined,
which the code treats as "off".

| Key | Read by | Effect when true / set |
| :--- | :--- | :--- |
| `SORT_ORDER` | All three listings | Replaces `updated_date` as the `orderBy` of the listing search. |
| `DISABLE_GEN_DOC_LISTING` | `sales-invoice-container.component.ts` | Skips the initial requisition search, so MM Deposit Requisition opens with an empty grid until you search. |
| `ENABLE_FILTER_BY_TODAYS_TXN` | Requisition container and listing | Computes a `dateRange` of today 06:00 instead of one month back — but `dateRange` is never read anywhere in the applet, so the setting currently has **no observable effect**. |

Every other `appletSettings.*` reference in the repository (the `HIDE_*` line-item and delivery keys,
`DISALLOW_SELL_BELOW_MIN_PRICE`, `ENABLE_MULTIPLE_KO`, the `HIDE_JOB_*` group and the rest) sits in
fork-inherited components that no route or view-column stack reaches. They are not settings of this
applet.

### Feature visibility and permissions

`bl_applet_client_side_perm_dfn` has **no rows** for applet code `depositApplet` (checked against
`akaun_master`, 2026-09-06), and the applet contains no `HIDE_*`/`SHOW_*` menu gating. Everything is
enforced server side.

`app.component.ts` asks the permission-inquiry endpoint for
`TNT_API_DOC_INTERNAL_SALES_INVOICE_READ/CREATE/UPDATE_TGT_GUID`, `TNT_TENANT_ADMIN` and
`TNT_TENANT_OWNER` — the sales-invoice codes are fork leftovers, and the requisition container uses
the `..._SALES_INVOICE_READ_TGT_GUID` target to build its branch filter list.

Server-side gates, by table:

| Area | Permission codes |
| :--- | :--- |
| Deposit requisition header | `API_TNT_DEPOSIT_REQUISITION_HDR_` `OWNER` / `ADMIN` / `CREATE` / `READ` / `UPDATE` / `DELETE` |
| Requisition invitee (entity link) | `API_TNT_DEPOSIT_REQUISITION_HDR_ENTITY_LINK_` `OWNER` / `ADMIN` / `CREATE` / `READ` / `UPDATE` / `DELETE` |
| Requisition invitee attachment | `API_TNT_DEPOSIT_REQUISITION_HDR_ENTITY_ATTACHMENT_` `OWNER` / `ADMIN` / `CREATE` / `READ` / `UPDATE` / `DELETE` |
| Register header, transaction lines, attachments, gen-doc links, category | `TNT_API_DEPOSIT_` `OWNER` / `ADMIN` / `CREATE` / `READ` |

{{< callout type="warning" >}}
The register side is coarser than it looks. In `DepositRegisterHdrController`, only the TEMP-create
and rollover endpoints ask for `TNT_API_DEPOSIT_CREATE`; the ordinary **create, update and delete**
endpoints all ask for `TNT_API_DEPOSIT_READ`. `TNT_API_DEPOSIT_UPDATE` and `TNT_API_DEPOSIT_DELETE`
are defined in `AkaunTenantPermissions` but are not used by any deposit controller. Grant
`TNT_API_DEPOSIT_READ` only to people who may also change deposits. The same pattern applies to the
transaction-line, attachment, gen-doc-link and category controllers.
{{< /callout >}}

The `temp/backoffice-ep` endpoint on the requisition controller checks
`API_TNT_BUDGET_VOTEBOOK_CREATE` rather than a deposit permission — a copy-paste from another
controller.

## Fields

### Requisition — Details tab

Validators are from the reactive form in
`sales-invoice-create/main-details/main-details.component.ts`; the backend validates none of them
(see [Lifecycle](#lifecycle-and-effects)). Fields marked *calculated* are `disabled` form controls
rendered read-only.

| Field | Meaning | Required | Notes |
| :--- | :--- | :--- | :--- |
| Server Doc No | Running number from `DEPOSIT_REQUISITION_NO` | — | Read-only, assigned on create. |
| Deposit Name | Free-text label for the placement | Yes | |
| Deposit Code | Free-text internal reference | Yes | No uniqueness check. |
| Company | Owning company | Yes | Changing it reloads the GL Code list. |
| GL Code | Balance-sheet account for the placement | Yes | Disabled until Company is chosen; the hint says so. Loaded 200 at a time from the company's chart of accounts. |
| Currency | Placement currency | Yes | MYR first, then alphabetical; type-ahead search. |
| Amount Initial Deposit | Principal | Yes | Formatted to 2 decimals with thousands separators on blur, unformatted on focus. |
| Amount Upon Maturity | Principal ± interest ± inflation | *calculated* | Returned by the backend `deposit-calculations/backoffice-ep` endpoint, rounded to 2 decimals. |
| Interest Amount | Total interest over the term | *calculated* | Same endpoint (`totalInterest`). |
| Interest Type | `ONCE` (interest paid once) or `MULTI` (periodic) | Yes | Choosing `ONCE` forces Interest Payout Frequency to `Full Term`, disables it, and clears Auto Rollover Logic. |
| Interest Payout Frequency | `Full Term`, `Daily`, `Weekly`, `Monthly`, `Quarterly`, `Semi-Annual`, `Annual` | Yes for `MULTI` | `Full Term` is removed from the list for `MULTI` (reset to `Monthly`); it is the only option for `ONCE`. |
| Interest Calculation | `FIXED` or `FLOATING` | Yes | Switching to `FLOATING` disables Interest Rate, sets it to 0, and makes the three reference fields required. Switching back to `FIXED` clears the reference value/delta and sets Interest Rate Effective to 0. |
| Interest Rate (%) | Agreed rate | Yes when `FIXED` | Hidden when `FLOATING`. |
| Interest Rate Reference Type | `SBR - Singapore Swap Offer Rate`, `BR - Base Rate`, `BLR - Base Lending Rate`, `ELR - Effective Lending Rate` | Yes when `FLOATING` | List is `INTEREST_RATE_REF_TYPE_LIST` in blg-shared-utilities. |
| Interest Rate Reference Source | Free text | No | |
| Interest Rate Reference Value (%) | The benchmark rate | Yes when `FLOATING` | |
| Interest Rate Reference Delta (%) | Spread over the benchmark | Yes when `FLOATING` | |
| Interest Rate Effective (%) | Reference Value + Delta, rounded to 2 decimals | *calculated* | Shown only when `FLOATING`. |
| Interest Convert to Principal | `YES` / `NO` | Yes | `YES` compounds interest into the principal at each payout. Reset to `NO` if the previous value is not valid for the chosen Interest Type. |
| Est Start Date | Planned value date | Yes | |
| Est End Date | Planned maturity | Yes | |
| Term (Days) | `end − start + 1` (inclusive) | *calculated* | Recomputed whenever either date changes. |
| Requisition Status | `ACTIVE` / `INACTIVE` | Yes | Hidden while the row is still `TEMP`. |
| Inflation Rate | Optional annual rate used to compute an inflation-adjustment line | No | Leave blank unless you want the adjustment. |
| Auto Rollover Logic | `YES` / `NO` | Yes | Cleared automatically when Interest Type is `ONCE`. |
| Created by / Created date / Modified by / Modified date | Audit | — | Read-only. |

### Requisition — Invitee tab

One row per invited institution in `bl_fi_deposit_requisition_hdr_entity_link`. The panel repeats the
requisition's terms so the recipient's quotation can be compared against them, but only three controls
accept input:

| Field | Required | Notes |
| :--- | :--- | :--- |
| Entity Name | Yes | Opens the entity selector; the create/edit customer screens are embedded so a new entity can be added without leaving the applet. |
| Email Address | Yes, and must pass `Validators.email` | The address the invitation is sent to. A blank address is skipped silently at send time and logged as "Email address is empty or null". |
| Winner | No | A Yes/No radio you set after comparing quotes. It is a label — nothing in the applet or the backend reads it. |

Everything else on the panel — amounts, currency, interest type, rates, dates, Term (Days),
Interest Convert to Principal, Auto Rollover Logic, status, inflation rate — is `readonly` or
`disabled`, so an invitee row cannot drift from its requisition through this screen.

### Register — Details tab

| Field | Meaning | Required | Notes |
| :--- | :--- | :--- | :--- |
| Deposit Name | Label | Yes | |
| Financial Institution | Free text — the bank holding the money | No | Plain text field; not a link to an entity record. |
| Deposit Category | Grouping label | Yes | From MM Deposit Category. |
| Company | Owning company | Yes | Filters the GL Code list as on the requisition. |
| Deposit Status | `ACTIVE` / `INACTIVE` | Yes | |
| GL Code | Balance-sheet account for the placement | Yes | |
| Principal Amount | The amount placed | Yes | |
| Amount Upon Maturity | Computed | Yes on the form, *calculated* in practice | Filled from the backend calculation endpoint. |
| Interest Amount | Total interest over the term | *calculated* | |
| Interest Earned | Interest received so far | No | Not maintained by the applet — nothing writes it when a receipt is linked. |
| Interest Type / Payout Frequency / Calculation / rate and reference fields / Interest Convert to Principal | As on the requisition | Same rules | The same `handleInterestTypeChange` / `handleInterestCalculationChange` logic applies. |
| Est Start Date / Est End Date | Value date and maturity | Yes | |
| Term (Days) | `end − start + 1` | *calculated* | |
| Inflation Rate % | Optional | No | |
| Auto Rollover Logic | `YES` / `NO` | Yes | See the rollover rule in [Lifecycle](#lifecycle-and-effects) — this alone does not roll anything over. |
| Rollover options | `Manual Rollover` / ` Automatic Rollover` | Yes when Auto Rollover Logic is `YES` | Only `Manual Rollover` does anything. Note the stray leading space in the second option's value. |
| GL Code for Interest | Account for interest income | No | Stored on the header; no journal uses it. |
| GL Code for Interest Expense | Account for interest cost | No | Stored on the header; no journal uses it. |
| Collaterals | Free text | No | |
| Approval Workflow | Free text | No | A text box, not a link to [Workflow Design](/applets/master-data/workflow-design-applet/) and not an approval engine. |
| Currency | Placement currency | Yes | |
| Description / Supervisor Remarks | Free text | No | |
| Created by / date, Modified by / date | Audit | — | Read-only. |

### Register — Transaction line (Edit Transaction panel)

| Field | Required |
| :--- | :--- |
| Transaction Type | Yes |
| Transaction Date | Yes |
| Total Amount (RM) | Yes |
| Principal Amount (RM) | Yes |
| Interest Amount (RM) | Yes |
| GL Code | Yes |
| Description | No |

### Category — Details tab

| Field | Required | Notes |
| :--- | :--- | :--- |
| Category Name | Yes | |
| Category Code | No | Despite the listing column, the form has no validator on it. |
| Status | Yes | `ACTIVE` / `INACTIVE`. |
| Description | No | |
| Created by / date, Modified by / date | — | Read-only. |

## Lifecycle and effects

### Posting proof

| Aspect | Value |
| :--- | :--- |
| Server document type | **None.** `bl_fi_deposit_requisition_hdr` and `bl_fi_deposit_register_hdr` are not generic documents and have no `ServerDocTypes` entry. |
| Amount signum | Not applicable — no `FinancialDocDataConsistencyObject` exists for either table. |
| Quantity signum | Not applicable — the applet moves no stock. |
| Dr/Cr equation | None. `JournalPostingService` contains no reference to either table. |
| GL precedence | Not applicable. The GL Code fields are stored on the header and copied onto each generated transaction line (`gl_code_guid`, `gl_code_code`); nothing reads them afterwards. |
| Stock processor | None. |
| What VOID reverses | There is no VOID. The register cannot be deleted from the UI (the button never renders) and `posting_status` never leaves `FINAL`. |

The ledger effect of a placement therefore comes entirely from the
[Internal Payment Voucher](/applets/finance/internal-payment-voucher-applet/) that pays the bank and
the [Internal Receipt Voucher](/applets/finance/internal-receipt-voucher-applet/) that receives
principal and interest back. Linking those to
the register on the Payment/Receipt tab is a cross-reference only — `bl_fi_deposit_register_hdr_gendoc_link`
carries no amount and drives no posting.

### Requisition statuses

`TEMP` → `ACTIVE` (first SAVE) → `posting_status = FINAL`.

- A **TEMP** row exists on the server from the moment you press **+**. Abandoning the screen leaves it
  behind; `TempDepositRequisitionHdrProcessor` ("Delete Temp rows after certain time") sweeps them on
  a schedule with a configurable `noOfHours`.
- **SAVE** is disabled while the form is invalid or `posting_status === 'FINAL'`.
- **FINAL** is the same disabled condition plus the update permission, and the button is only rendered
  while the row is `ACTIVE` and not already `FINAL`.
- **FINAL sends the invitation e-mails.** `DepositRequisitionHdrService.updateDepositRequisitionHdr`
  compares the stored `posting_status` with the incoming one and, on the `≠FINAL → FINAL` transition
  only, calls `DepositRequisitionEmailService.sendEmailsToEntityLinks`. One HTML e-mail per invitee
  row with a non-blank e-mail, subject *"Money Market Deposit Placement Invitation — &lt;deposit
  name&gt;"*, containing the deposit terms, the floating-reference block when a reference type is set,
  a link to the quotation form, and the requisition creator's e-mail address as the contact. The
  stated submission deadline is always **seven days from the moment the e-mail is built** and is not
  stored or enforced anywhere.

### The invitee quotation form

The link in the e-mail points at
`/core2/tnt/dm/erp/fi/deposit/requisition/hdr-entity-links/submission-form/{tenantCode}/{linkGuid}` —
a Thymeleaf page that reads the invitee row and renders a quotation form. The form loads the row
through `GET .../hdr-entity-links/public-ep/{guid}` and submits with
`PUT .../hdr-entity-links/public-ep`. Both are declared `AnonymousTenantEndpoint`: **no login, no
token, no expiry, no permission check**. Anyone holding the link GUID can read and overwrite that
invitee row. Treat the link as the credential and send it only to the intended institution.

Submitting overwrites the invitee's own copy of the terms (amount, maturity amount, currency, dates,
interest type, payout frequency, calculation logic, rate, the floating-reference fields, effective
rate and estimated interest). The requisition header is untouched.

### Register statuses

`TEMP` → `ACTIVE` → `posting_status = FINAL`.

- **Select Requisition** copies values from a requisition into the register form. It does **not**
  create a link: the register's `deposit_requisition_hdr_guid` is initialised to `null` in the draft
  state and is never set by this path, so a saved register does not point back at the requisition it
  came from. The requisition is not knocked off, closed or changed.
  The picker lists requisitions filtered on `status = ACTIVE` only — a requisition that is still
  `DRAFT` can be selected. What is copied: name, principal, maturity amount, interest type, payout
  frequency, calculation logic, the four reference fields, effective rate, Interest Convert to
  Principal, dates, term, inflation rate, Auto Rollover Logic, and — after the company and GL-code
  lists reload — Company and GL Code. What is **not** copied: **Interest Rate**, Currency, Deposit
  Category, Financial Institution.
- **FINAL** (`updateDepositRegisterHdrWithPostingStatusFinal`) does two things on the
  `≠FINAL → FINAL` transition:
  1. If `prev_guid` is null and `auto_rollover_logic` is `YES`, it stamps a fresh `group_01_guid` —
     the identifier that ties a rollover chain together.
  2. It calls `DepositRegisterTxnLineService.createAutomaticTransactions`, which writes the interest
     schedule described below.
- The register has **no running number**. `DepositRegisterHdrDataConsistencyObject.fillMissingDataForCreation`
  sets only guid, dates, status and revision — `server_doc_no` is left null.

### What FINAL generates on the register

`createAutomaticTransactions` reads the saved header and writes `bl_fi_deposit_register_txn_line`
rows. The rate used is `interest_rate_effective` when the calculation logic is `FLOATING`, otherwise
`interest_rate`. Both interest and inflation use simple daily accrual:

```
amount = principal × rate × days ÷ (100 × 365)     rounded HALF_UP to 2 decimals
```

| Order | Line | `deposit_register_txn_type_code` | When |
| :--- | :--- | :--- | :--- |
| 1 | Deposit Placement (Debit) | `PLACEMENT` | Always, dated the deposit start date |
| 2 | Interest Earned (Credit) | `INTEREST` | `ONCE`: one line at maturity. `MULTI`: one line per payout date |
| 3 | Inflation Adjustment (Debit) | `INFLATION` | Only when the computed inflation impact is greater than zero |
| 4 | Interest Capitalized (Credit) | `COMPOUND` | `MULTI` only, and only when Interest Convert to Principal is `YES` |
| 5 | Principal Return (Credit) | `MATURITY` | Always, dated the maturity date |
| 6 | Total Interest Earned, Total Inflation Impact | `SUMMARY` | Always, dated maturity + 1 second |

For `MULTI`, payout dates are generated by stepping the frequency from the start date while the cursor
is before the end date, then appending the maturity date. Each period is measured exclusively
(`end − start`), and the final period gets `+1` day so the whole term is counted inclusively once.

The maturity value is `principal + interest − inflation` when Interest Convert to Principal is `YES`,
and `principal − inflation` when it is `NO` — that is, with `NO` the interest is *not* added to the
principal return line, because it has already been paid out on the interest lines.

FINAL does not check whether transactions already exist. Re-issuing the same FINAL transition against
an already-final register through the API would append a second schedule.

### Rollover

There is exactly one rollover path and it is manual. The **Manual Rollover** button on the
Transactions tab renders and is clickable only when *all* of these hold
(`transactions-listing.component.ts`, `canClickManualRollover`):

- `posting_status = FINAL`, **and**
- Rollover options = `Manual Rollover`, **and**
- Auto Rollover Logic = `YES`, **and**
- `process_status` is not already `ROLLED_OVER`.

Setting Auto Rollover Logic to `YES` and Rollover options to `Automatic Rollover` therefore gives you
**no rollover at all** — the button is hidden and nothing runs on a schedule.

{{< callout type="warning" >}}
`DepositRolloverProcessor` is not a rollover job despite its name and its
`DEPOSIT_ROLLOVER_PROCESSOR` queue code. Its own description reads *"Create Monthly Opening and
Closing Rows in bl_fi_deposit_register_txn_line"*, and it writes exactly two `MONTH_CLOSING` /
`MONTH_OPENING` lines per tenant per run without setting `hdr_guid`, so those rows belong to no
deposit. No scheduled job rolls a deposit over.
{{< /callout >}}

`DepositRegisterHdrService.createRollover` (`POST create-rollover/backoffice-ep/{guid}`) does the
work:

1. Refuses with *"Deposit already Rolled Over"* if the parent's `process_status` is `ROLLED_OVER`,
   and with *"Deposit not found for GUID"* if the header is missing.
2. Creates a new register header copying company, category, GL codes, currency, interest terms,
   rollover settings and `group_01_guid` from the parent, with `prev_guid` pointing at the parent and
   `prev_server_doc_type` / `prev_server_doc_no` / `prev_deposit_date` / `prev_maturity_date` recording
   where it came from. `server_doc_no` is set to null, Supervisor Remarks is cleared, and the
   Description is set to *"Rollover of deposit &lt;name&gt; WITH DEPOSIT START DATE … AND END DATE …"*.
3. Sets the child's **principal to the parent's Amount Upon Maturity** — always. `rollover_options`
   is copied but plays no part in the amount, so there is no "principal only" behaviour: a rollover
   always carries principal plus interest less inflation forward.
4. Sets the child's start date to the parent's maturity date and its end date to that plus the parent's
   term, computed here as `Duration.between(start, end).toDays()` — the *exclusive* day count, one day
   shorter than the inclusive Term (Days) the form shows.
5. Recomputes the child's maturity amount and estimated interest with `computeDepositSummary`.
6. Creates the child with `posting_status = FINAL` directly, sets the parent's `next_deposit_hdr_guid`
   and `process_status = ROLLED_OVER`, and runs `createAutomaticTransactions` for the child.

### What the backend actually validates

`DepositRegisterHdrDataConsistencyObject` and `DepositRequisitionHdrDataConsistencyObject` check only
structural things: the GUID is present and new (or present and existing, on update), the category
GUID resolves to a `bl_fi_deposit_category` row, `created_by` / `updated_by` subject GUIDs are
present, the created and updated dates are present, and status and revision are present. **No
business field is validated server side** — not the amounts, not the dates, not the rate, not the
company, not the GL code. There is no foreign-key check on `gl_code_guid` or `company_guid` on the
register. Every rule you see enforced in the register and requisition forms is an Angular validator
and disappears if the row is written through the API.

## Related applets

- [Chart of Account](/applets/master-data/chart-of-account-applet/) — supplies GL Code, GL Code for
  Interest and GL Code for Interest Expense. The list is scoped to the selected company's chart.
- [Organization](/applets/master-data/organisation-applet/) — the Company drop-down and, through it,
  the chart of accounts used for the GL Code list.
- [Customer Maintenance](/applets/master-data/customer-maintenance-applet/) — the entity behind each
  invitee; this applet embeds its create/edit screens for the Entity Name picker.
- [Forex](/applets/master-data/forex-applet/) — the Currency drop-down.
- [General Ledger](/applets/finance/general-ledger-applet/) — where the placement is visible in the
  accounts, via the payment and receipt vouchers rather than this applet.
- [Cashbook](/applets/master-data/cashbook-applet/) and
  [Transaction Reconciliation](/applets/finance/txn-recon-applet/) — the bank side of the same money.
- [Internal Payment Voucher](/applets/finance/internal-payment-voucher-applet/) and
  [Internal Receipt Voucher](/applets/finance/internal-receipt-voucher-applet/) — the only documents
  the Payment/Receipt tab links, and the only ones that post a journal for the placement.
- [Investment Applet](/applets/finance/investment-applet/) — the adjacent treasury register for
  holdings rather than term placements.

## Troubleshooting

| Symptom | Cause | Fix |
| :--- | :--- | :--- |
| No settings gear and no Personalization link in the sidebar | `hideSettings = true` in `app.component.ts` hides both, and no settings route exists. Tracked as `gh:bigledger/blg-applet-wavelet-deposit-applet#8` / `#9`. | Nothing to change in the tenant — this is the applet's current state. |
| GL Code drop-down is empty | It is disabled until a Company is chosen; the field's own hint says *"Company must be selected first"*. It then loads at most 200 GL codes from that company's chart of accounts. | Choose the Company first. If the account you want is beyond the first 200 rows of the chart, it will not appear — narrow the chart or raise the issue. |
| Interest Rate is blank on a register built with **Select Requisition**, and the form will not validate | `interestRate` is missing from the patch list in the register's `depReqForRegistration$` subscription. Every other term is copied; the rate is not. | Re-enter the Interest Rate on the register before saving. Also re-check Currency, Deposit Category and Financial Institution, which are likewise not copied. |
| A register does not show which requisition it came from | `deposit_requisition_hdr_guid` is never populated by Select Requisition. | Record the requisition's document number in the register's Description or Supervisor Remarks. |
| Amount Upon Maturity and Interest Amount stay blank | They are filled by the backend `deposit-calculations/backoffice-ep` call, which only runs when principal, interest type, calculation logic and Term (Days) are all set — plus Interest Rate for `FIXED` or Interest Rate Effective for `FLOATING`. If the call fails, the code logs a warning and leaves the fields null. | Fill both dates (Term is derived from them) and the rate. If they are still blank, the calculation call failed — check the browser console. |
| **Manual Rollover** button is not there | It renders only when posting status is FINAL **and** Rollover options is `Manual Rollover` **and** Auto Rollover Logic is `YES` **and** the deposit is not already `ROLLED_OVER`. | Set Auto Rollover Logic to `YES` and Rollover options to `Manual Rollover` before finalising. `Automatic Rollover` disables the button and starts nothing. |
| A rollover carried the full maturity amount when only the principal was wanted | `createRollover` always sets the child's principal to the parent's `amount_upon_maturity`; `rollover_options` does not change this. | Create the next register manually with the principal you want, instead of using rollover. |
| The rolled-over deposit's term is one day shorter than the parent's | The form computes Term (Days) inclusively (`end − start + 1`); `createRollover` computes it exclusively with `Duration.between(...).toDays()`. | Correct the child's Est End Date before it matters, or accept the one-day difference. |
| No DELETE button on a requisition or a register | Both are dead: the requisition's `showDeleteButton` flag is never set to true, and the register's `deleteCondition()` returns `null` on its first line. Only the category has a working DELETE. | Set the record's status to `INACTIVE` instead. Deletion is possible through the API for someone with the right permission. |
| Invitees did not receive the invitation | E-mails are sent only on the `≠FINAL → FINAL` transition of the requisition, one per invitee row with a non-blank Email Address. A blank address is skipped and logged. | Check every invitee has an Email Address before pressing FINAL. Re-saving a requisition that is already FINAL sends nothing. |
| The deadline in the invitation e-mail is wrong | The e-mail always states *now + 7 days*. It is generated at send time, not stored, and nothing enforces it. | State the real deadline in the deposit name or agree it out of band. |
| An invitee's quotation changed after the deadline | The quotation form and both endpoints behind it are anonymous — no login, no token, no expiry. The link GUID is the only credential. | Do not forward the link. Compare the invitee row's Modified date against when you expected the quote. |
| MM Deposit Requisition opens with an empty grid | `DISABLE_GEN_DOC_LISTING` is set in the tenant's applet settings, which skips the initial search. | Use the search box, or clear the setting through the API — there is no screen for it in this applet. |
| Interest lines look a day short or a day long against the bank's advice | Interest is simple daily accrual on a 365-day year (`principal × rate × days ÷ 36500`), the whole term counted inclusively, `MULTI` periods counted exclusively with `+1` on the last. Banks using a different day count will differ. | Correct the affected line on the Transactions tab, or use Inflation Rate / a manual line to record the difference. |
| Stray `MONTH_CLOSING` / `MONTH_OPENING` rows with no deposit | `DepositRolloverProcessor` writes two such lines per run without a `hdr_guid`. | They do not belong to any register and are invisible on the Transactions tab. Ignore them; they are a known defect. |

## Related documentation

- [Financial Accounting module](/modules/financial-accounting/)
- [Investment Applet](/applets/finance/investment-applet/) — the adjacent treasury register
- [General Ledger Applet](/applets/finance/general-ledger-applet/) — where the cash movement appears
- [Chart of Account Applet](/applets/master-data/chart-of-account-applet/) — GL code setup
