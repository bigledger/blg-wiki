---
topic: deposit-management
aliases: [money market deposit, MM deposit, fixed deposit placement, deposit requisition, deposit register, deposit rollover]
applets: [depositApplet]
modules: [financial-accounting]
related: [chart-of-accounts, document-numbering, workflow-design, investment, cashbook, bank-reconciliation]
wiki:
  - content/en/applets/finance/deposit-applet.md
  - content/en/applets/finance/mm-deposit-applet.md
status: growing
updated: 2026-09-06
---

# Deposit management (money market placements)

Company cash placed with a financial institution for a fixed term at an agreed rate. BigLedger
records the request for quotes (**requisition**), the live placement and its interest schedule
(**register**), and a grouping label (**category**). It is a treasury register only — the money
itself moves through payment and receipt vouchers, and the deposit tables never touch the ledger.

## Facts

- 2026-09-06 — One registry row, `depositApplet` "Deposit Applet" (TNT-USER, ACTIVE), covers all
  three menus: MM Deposit Requisition, MM Deposit Register, MM Deposit Category. There is no
  separate "general deposits" applet for security or utility deposits.
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../deposit-applet/src/app/app.routing.ts]
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../deposit-applet/src/app/models/menu-items.ts]
- 2026-09-06 — The applet posts **no journal**. `bl_fi_deposit_requisition_hdr` and
  `bl_fi_deposit_register_hdr` have no `ServerDocTypes` entry, no
  `FinancialDocDataConsistencyObject`, and no reference in `JournalPostingService`.
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../domain/tenant/JournalPostingService.java]
- 2026-09-06 — The rows on the register's Transactions tab are `bl_fi_deposit_register_txn_line`
  records written by `DepositRegisterTxnLineService.createAutomaticTransactions` on the
  `posting_status ≠FINAL → FINAL` transition: PLACEMENT, INTEREST (one per payout period for MULTI,
  one at maturity for ONCE), INFLATION when the impact is > 0, COMPOUND when Interest Convert to
  Principal is YES, MATURITY, and two SUMMARY lines dated maturity + 1 second.
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../domain/DepositRegisterTxnLineService.java]
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../domain/DepositRegisterHdrService.java]
- 2026-09-06 — Interest and inflation are simple daily accrual:
  `principal × rate × days ÷ (100 × 365)`, HALF_UP to 2 decimals. The UI computes Term (Days)
  inclusively (`end − start + 1`); MULTI periods are measured exclusively with `+1` on the last
  period so the whole term is counted once.
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../domain/DepositRegisterTxnLineService.java]
- 2026-09-06 — The register's maturity amount and interest are computed **server side** by
  `POST .../deposit-register-hdrs/deposit-calculations/backoffice-ep`, not in the browser; the form
  nulls both fields, calls the endpoint, and patches the answer back. A failed call leaves them null.
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../sales-invoice-create/main-details/main-details.component.ts]
- 2026-09-06 — Finalising a **requisition** is the only event that sends e-mail:
  `DepositRequisitionHdrService.updateDepositRequisitionHdr` compares stored and incoming
  `posting_status` and, on `≠FINAL → FINAL`, calls
  `DepositRequisitionEmailService.sendEmailsToEntityLinks` — one AWS SES HTML mail per invitee row
  with a non-blank e-mail. The body is built in Java and is not configurable from the product; the
  stated submission deadline is always `now + 7 days` and is neither stored nor enforced.
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../domain/DepositRequisitionEmailService.java]
- 2026-09-06 — The invitee quotation form
  (`/core2/tnt/dm/erp/fi/deposit/requisition/hdr-entity-links/submission-form/{tenantCode}/{guid}`)
  and the two endpoints behind it (`GET`/`PUT .../hdr-entity-links/public-ep`) are declared
  `AnonymousTenantEndpoint`: no login, no token, no expiry, no permission check. The link GUID is the
  only credential, and a PUT overwrites the invitee row's copy of the terms.
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../DepositReqHdrEntityLinkThymeleafFormController.java]
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../DepositRequisitionHdrEntityLinkController.java]
- 2026-09-06 — Rollover is manual only. The button renders when `posting_status = FINAL` **and**
  Rollover options = `Manual Rollover` **and** Auto Rollover Logic = `YES` **and** `process_status`
  is not `ROLLED_OVER`. `Automatic Rollover` starts nothing.
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../edit-deposit-register/transactions/transactions-listing/transactions-listing.component.ts]
- 2026-09-06 — `DepositRegisterHdrService.createRollover` always sets the child's principal to the
  parent's `amount_upon_maturity` — `rollover_options` plays no part in the amount, so "principal
  only" rollover does not exist. The child's term is `Duration.between(start, end).toDays()`, one day
  shorter than the inclusive Term (Days) the form shows. The child is created with
  `posting_status = FINAL` and its own generated transaction schedule; the parent gets
  `next_deposit_hdr_guid` and `process_status = ROLLED_OVER`.
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../domain/DepositRegisterHdrService.java]
- 2026-09-06 — `DepositRolloverProcessor` (queue `DEPOSIT_ROLLOVER_PROCESSOR`) does **not** roll
  deposits over. Its own description is "Create Monthly Opening and Closing Rows in
  bl_fi_deposit_register_txn_line"; it writes one MONTH_CLOSING and one MONTH_OPENING line per run
  without setting `hdr_guid`, so those rows belong to no register.
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../tenant/dm/DepositRolloverProcessor.java]
- 2026-09-06 — Only the requisition gets a running number, from `DEPOSIT_REQUISITION_NO` via
  `RunningNumberGeneratorUtil` in `fillMissingDataForCreation`. The register's DCO never sets
  `server_doc_no`, so register rows have no document number (and the listing has no such column).
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../validator/DepositRequisitionHdrDataConsistencyObject.java]
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../validator/DepositRegisterHdrDataConsistencyObject.java]
- 2026-09-06 — Both DCOs validate only structural fields (guid, category FK, created/updated subject
  and dates, status, revision). No amount, date, rate, company or GL-code validation exists server
  side, and there is no FK check on the register's `gl_code_guid` or `company_guid`. Every business
  rule is an Angular validator.
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../validator/DepositRegisterHdrDataConsistencyObject.java]
- 2026-09-06 — **Select Requisition** copies terms into the register form but never sets
  `deposit_requisition_hdr_guid` (initialised null in the draft state and written nowhere), so a saved
  register does not point back at its requisition. The picker filters on `status = ACTIVE` only, so a
  DRAFT requisition can be selected. `interestRate`, Currency, Deposit Category and Financial
  Institution are not among the copied fields.
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../edit-deposit-register/edit-deposit-register-main-details/main-details.component.ts]
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../edit-deposit-register/registration-deposit-requisition-listing/registration-deposit-requisition-listing.component.ts]
- 2026-09-06 — The applet has **no settings UI at all**: `app.component.ts` sets
  `hideSettings = true` (which hides both the gear and the Personalization link in the shared
  sidebar), `app.routing.ts` declares no settings route, and `AppletSettingsModule` — which declares
  the Field Configuration and Default Settings components — is imported by no module. Open requests:
  `gh:bigledger/blg-applet-wavelet-deposit-applet#8`, `#9`.
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../deposit-applet/src/app/app.component.ts]
  [src:git:blg-shared-utilities@f1ded04 modules/layout/sidebar/sidebar.component.html]
- 2026-09-06 — Three `APPLET_SETTINGS` keys are still read at runtime with no control anywhere in the
  applet: `SORT_ORDER` (listing order, consumed), `DISABLE_GEN_DOC_LISTING` (skips the initial
  requisition search, consumed) and `ENABLE_FILTER_BY_TODAYS_TXN` (computes a `dateRange` that is
  never read — no effect).
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../sales-invoice-container/sales-invoice-container.component.ts]
- 2026-09-06 — `bl_applet_client_side_perm_dfn` has no rows for `depositApplet` (akaun_master,
  checked 2026-09-06). Server side, requisition and invitee use the granular
  `API_TNT_DEPOSIT_REQUISITION_HDR_*` / `..._ENTITY_LINK_*` codes, but the register, its transaction
  lines, attachments, gen-doc links and the category are all gated by `TNT_API_DEPOSIT_READ` for
  create-non-temp, update **and** delete. `TNT_API_DEPOSIT_UPDATE` and `TNT_API_DEPOSIT_DELETE` are
  defined but used by no deposit controller.
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../controller/DepositRegisterHdrController.java]
  [src:git:blg-akaun-platform-java@1ff620e javasdk/.../permissions/AkaunTenantPermissions.java]
- 2026-09-06 — Pressing **+** on any of the three listings calls a `temp/backoffice-ep` endpoint and
  creates a server row with `status = TEMP` before the user types anything; abandoned rows are swept
  by `TempDepositRequisitionHdrProcessor` / `TempDepositRegisterHdrProcessor` /
  `TempDepositCategoryProcessor` ("Delete Temp rows after certain time", configurable `noOfHours`).
  Same stub-accumulation shape as the Supplier applet.
  [src:git:blg-akaun-platform-java@1ff620e akaun-api/.../tenant/dm/TempDepositRegisterHdrProcessor.java]
- 2026-09-06 — DELETE is dead on both document screens: the requisition's `showDeleteButton` flag is
  initialised `false` and never set; the register's `deleteCondition()` returns `null` on its first
  line and `onDelete()` returns immediately. Only MM Deposit Category has a working delete.
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../sales-invoice-edit/sales-invoice-edit.component.ts]
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../edit-deposit-register/edit-deposit-register.component.ts]
- 2026-09-06 — The Payment/Receipt tab links **existing** documents only, and its picker is
  hard-coded to `INTERNAL_RECEIPT_VOUCHER, INTERNAL_PAYMENT_VOUCHER`. The link row
  (`bl_fi_deposit_register_hdr_gendoc_link`) carries no amount and drives no posting.
  [src:git:blg-applet-wavelet-deposit-applet@442b3ae .../edit-deposit-register/receipt/receipt-add/add-receipt.component.ts]
- 2026-09-06 — Interest dropdown domains live in blg-shared-utilities, not in the applet:
  `INTEREST_TYPE_LIST` = ONCE|MULTI; `INTEREST_CALC_LIST` = FIXED|FLOATING;
  `INTEREST_CALC_PERIOD_ALL` = Full Term, Daily, Weekly, Monthly, Quarterly, Semi-Annual, Annual
  (Full Term is the only option for ONCE and is removed for MULTI); `INTEREST_RATE_REF_TYPE_LIST` =
  SBR, BR, BLR, ELR. Backend values are the UPPER_UNDERSCORE form of the display label.
  [src:git:blg-shared-utilities@f1ded04 utilities/deposit.constants.ts]

## How it connects

- **chart-of-accounts** — GL Code, GL Code for Interest and GL Code for Interest Expense are all
  drawn from the selected company's chart, loaded 200 rows at a time. None of them is read by any
  posting code; they are labels stored on the header and copied onto each generated transaction line.
- **document-numbering** — `DEPOSIT_REQUISITION_NO` must exist for the requisition to get a document
  number. The register deliberately has none, which is why its listing has no Doc No. column.
- **investment** — the adjacent treasury register. Deposits are term placements with a maturity and
  an interest schedule; investments are holdings. `content/en/applets/finance/investment-applet.md`
  already links to this page.
- **cashbook** / **bank-reconciliation** — the real cash movement is the payment voucher out and the
  receipt voucher back. A deposit that has been finalised but never linked to a voucher is a
  reconciliation gap that nothing in this applet will flag.
- **workflow-design** — the register's "Approval Workflow" field is a free-text box, not a link to a
  workflow process and not an approval engine. The header does carry `process_hdr_guid` /
  `process_status_guid` columns (copied on rollover), but no screen in the applet sets them.

## Open questions

- Is any live tenant setting `SORT_ORDER` / `DISABLE_GEN_DOC_LISTING` for `depositApplet` given there
  is no screen that writes them? If not, the three runtime reads could be deleted with the rest of
  the fork residue.
- `bl_fi_deposit_register_hdr.interest_earned` is a form field that nothing maintains. Is it meant to
  be updated when a receipt voucher is linked?
- The orphan MONTH_OPENING / MONTH_CLOSING rows written by `DepositRolloverProcessor` have no
  consumer that has been found. Is any report reading them tenant-wide?
