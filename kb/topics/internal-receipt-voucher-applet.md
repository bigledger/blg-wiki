---
topic: internal-receipt-voucher-applet
aliases: [receipt voucher, RCT, RV, official receipt, internal-receipt-voucher-applet]
applets: ["internal-receipt-voucher-applet"]
modules: [financial-accounting, sales-crm]
related: [payment-voucher, bank-reconciliation, cashbook, settlement-method, contra, sales-invoice, default-gl-codes, client-side-permissions]
wiki:
  - content/en/applets/finance/internal-receipt-voucher-applet.md
  - content/en/applets/finance/bank-reconciliation-applet.md
  - content/en/applets/master-data/cashbook-applet.md
status: growing
updated: 2026-09-05
---

# Receipt Voucher (Internal) applet

Records money received from a customer as one or more settlement lines, applies it to open documents by contra, and on FINAL posts a cashbook transaction per settlement line plus a debtor journal.

## Facts

- 2026-09-05 — Registry: code `internal-receipt-voucher-applet`, name "Receipt Voucher (Internal)", TNT-USER, ACTIVE, documentation_url `/applets/internal-receipt-voucher-applet/` (page has that alias). [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Live repo is `blg-applet-wavelet-internal-receipt-voucher-applet-v2` (last commit 2026-08-31); the non-v2 repo is stale (2025-11) and its dev environment points at a different applet code. [src:git:blg-applet-wavelet-internal-receipt-voucher-applet-v2] [src:blg-applet-wavelet-internal-receipt-voucher-applet/micro-fe/src/environments/environment.ts]
- 2026-09-05 — Applet constants: docType `INTERNAL_RECEIPT_VOUCHER`, `amount_signum = -1`, `quantity_signum = 0` (no stock movement). [src:blg-applet-wavelet-internal-receipt-voucher-applet-v2/.../models/constants/applet-constants.ts]
- 2026-09-05 — Menus: Internal RCT Voucher, Import Receipt Voucher, Settlement Adjustment, Audit Trail. Settings nav: Application Settings, Default Selection, Printable Format Settings, Branch Settings, Email Template, Custom Resource Bundle Configuration, Custom Field Placement (+ webhook, feature-visibility, permission screens, release notes, applet log). [src:.../models/menu-items.ts] [src:.../ui-navigation/applet-settings/applet-settings-navigation.config.ts]
- 2026-09-05 — Edit tabs (13): Main Details, Account, Revenue, Expenses, Settlement, Payment Adjustment, ARAP, Department Hdr, TraceDocument, Contra, Doc Link, Export, Attachments; order stored in `RECEIPT_VOUCHER_DETAILS_TAB_ORDER`. [src:.../settings-container/default-settings/default-settings.component.ts] [src:.../internal-receipt-voucher-edit.component.ts]
- 2026-09-05 — Required header controls: branch, location, transactionDate. Toasts: "Please complete the required fields before saving/posting.", "The currency rate cannot be ZERO or negative.", "This document has not been finalized yet". [src:.../main-details/main-details.component.ts] [src:.../internal-receipt-voucher-edit.component.ts]
- 2026-09-05 — FINAL shown only when status ACTIVE, posting DRAFT, `payment.length > 0` (≥1 settlement line), not gen-doc-locked; VOID when posting FINAL (no e-Invoice lock). [src:.../internal-receipt-voucher-edit.component.ts]
- 2026-09-05 — Contra dialog: total contra cannot exceed the receipt's open amount unless `ALLOW_EXCEED_CONTRA`; `CONTRA_DATE_SAME_AS_DOC_DATE_TXN` forces the contra date. [src:.../contra/select-document/contra-select-document.component.ts]
- 2026-09-05 — Journal handler INTERNAL_RECEIPT_VOUCHER: PNS_ENTITY→DEBTOR, PNS→SALES, PNS_DISCOUNT→SALES_DISCOUNT, PNS_RETURN→SALES_RETURN, PNS_TAX→OUTPUT_TAX, FOREX_GAIN/LOSS. STL_MTHD lines post to the cashbook's GL code (sub-ledger auto-created); missing cashbook → `MISSING_CASHBOOK: STL_MTHD [code]`, missing GL → `MISSING_GL_CODE: STL_MTHD [code]`; settlement charges to `SETTLEMENT_CHARGES`. [src:blg-akaun-platform-java/javasdk/.../tenant/JournalPostingTypeHandler.java] [src:blg-akaun-platform-java/javasdk/.../tenant/JournalPostingService.java]
- 2026-09-05 — Cashbook lines are synced only for FINAL docs already posted to cashbook; changing a reconciled line's amount throws "Please unreconcile this transaction from bank recon first before changing the amount: Cashbook [x] - Bank Recon [y] (month)". The v2 applet surfaces this via a toaster (commit 2026-08-25). [src:blg-akaun-platform-java/javasdk/.../tenant/bankRecon/CashbookTxnLinePostingService.java] [src:blg-akaun-platform-java/javasdk/.../tenant/bankRecon/CashbookTxnLineBankReconGuard.java] [src:git:blg-applet-wavelet-internal-receipt-voucher-applet-v2@8f8bc3f]
- 2026-09-05 — Client-side permissions (19 ACTIVE): ENABLE_EDIT_SETTLEMENT_DATE, SHOW_DELETE_CONTRA, SHOW_EDIT_SETTLEMENT_FINAL, SHOW_REVENUE_TAB, SHOW_EXPENSES_TAB, SHOW_GENDOC_FINAL/VOID/DISCARD_BUTTON, SHOW_TRACE_DOCUMENT_TAB, SHOW_TRANSACTION_DATE, SHOW_DOC_NO_*, SHOW_CLIENT_DOC_*. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Revenue and Expenses post-FINAL adjustment tabs added 2026-08, gated by setting + permission + FINAL. [src:gh:bigledger/blg-int-general-task#9196]
- 2026-09-05 — Issues (anonymised): auto TEMP→ACTIVE conversion race closed the document when pressing + on Settlement and could create two vouchers in different locations (fixed 2026-08) [src:gh:bigledger/blg-int-general-task#9567] [src:gh:bigledger/blg-sd-aeco#1170]; open-balance formula double-counts contra so a fully contra'd voucher still shows a balance [src:gh:bigledger/blg-intranet#5397]; receipt not found in bank recon because settlement method mapped to another cashbook [src:gh:bigledger/blg-sd-enter-technology#318]; branch dropdown limited by branch-targeted read permission [src:gh:bigledger/blg-sd-aeco#822] [src:gh:bigledger/blg-sd-pc-image#795]; request for Branch Settings distinct from POS General [src:gh:bigledger/blg-intranet#3622]; duplicate running number [src:gh:bigledger/blg-sd-hanlim-trading#179].

## How it connects

- **payment-voucher** — mirror document; same settlement/contra/adjustment mechanics with CREDITOR instead of DEBTOR.
- **bank-reconciliation** — consumes the STL_MTHD cashbook lines; once matched, the amount is locked.
- **cashbook / settlement-method** — the settlement method item must map to a cashbook with a GL code; per-branch assignment in Branch Settings.
- **sales-invoice** — the contra target; a receipt without contra is an unapplied credit.

## Open questions

- Which document types the contra search offers by default (the dialog has a doc-type filter; the list is server-driven).
- Whether Branch Settings are still shared with POS General (issue open since 2025).

## Wiki impact

- `content/en/applets/finance/bank-reconciliation-applet.md` should mention the "unreconcile first" guard when amounts are edited on RV/PV.
- `content/en/applets/master-data/cashbook-applet.md` should state that settlement methods are items linked to a cashbook and that FINAL of RV/PV fails without the link.
