---
topic: cashbook
aliases: [bank account, settlement method, cash transfer, tender type]
applets: [cashbook-applet]
modules: [core, financial-accounting, pos]
related: [bank-reconciliation, receipt-voucher, payment-voucher, chart-of-accounts, gl-posting, pos-tender, doc-item-maintenance]
wiki:
  - content/en/applets/master-data/cashbook-applet.md
  - content/en/guides/accounting-guides/bank-reconciliation-guide.md
status: growing
updated: 2026-09-05
---

# Cashbook

Cashbooks (bank/cash accounts tied to company + GL code) and settlement methods (tender types with charges and branch access); cash transfers and adjustments post journals.

## Facts

- 2026-09-05 — Registry: `cashbook-applet` "Cashbook", TNT-USER, ACTIVE (an older `cashbookApplet` row is DELETED). Repo blg-applet-wavelet-cashbook-v3-applet. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Menus: Cashbook, Settlement Method, Import Cashbook, Import Settlement Method, Import Settlement Method Branch, Cash Transfer, Cash Transfer By Transaction, Upload Cash Transfer, PD Cheque (Queue, History), Query Cashbook Transaction, Cash Adjustment, Cash Level, Cashbook Discrepancy Checking, Audit Trail. Settings: Application Settings, Default Selection, Printable Format Settings, Branch Settings. [src:blg-applet-wavelet-cashbook-v3-applet/.../models/menu-items.ts]
- 2026-09-05 — Application Settings: 11 HIDE_*_MENU switches; SORT_BY_COLUMN/ORDER_BY; DISPLAY_CASH_TRANSFER_RUNNING_NUMBER; SAVE_CASH_TRANSFER_DETAILS (localStorage persistence of unsaved transfer lines); VERTICAL_ORIENTATION; ENABLE_AUTO_POPUP; HIDE_VOID_TRANSACTIONS; ENABLE_SETTLEMENT_METHOD; HIDE_EXTERNAL_SETTLEMENT_CODE / HIDE_INSTALLMENT_PERIOD / HIDE_THRESHOLD_AMOUNT / HIDE_PGW_PAYMENT_ID / HIDE_PGW_PAYMENT_TYPE_CODE. [src:.../field-configuration.component.html] [src:.../cash-transfer-line-listing.component.ts L112]
- 2026-09-05 — Branch Settings: per-branch default settlement method for cash, cheque, bank_transfer, credit_card, debit_card, ewallet, voucher, membership_point_currency, others. [src:.../branch-settings/branch/default-settlement-method/default-settlement-method.component.html]
- 2026-09-05 — Permissions registered (8): SHOW_CASH_TRANSFER, SHOW_CASH_ADJUSTMENT_MENU, SHOW_CASH_LEVEL_MENU, SHOW_PD_CHEQUE_MENU, SHOW_QUERY_CASHBOOK_TRANSACTION_MENU, SHOW_UPLOAD_CASH_TRANSFER_MENU, SHOW_IMPORT_SETTLEMENT_METHOD_MENU, SHOW_IMPORT_SETTLEMENT_METHOD_BRANCH_MENU. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Cashbook create: code+name required; edit tabs Details / Triggers & Limits (low/high trigger, overdraft limit, facility amount) / Members (email, rank, status) / Weightage Configuration (code, name, object type, threshold 70–100). Backend: company and GL code required, GL code must belong to the company (COMPANY_AND_GLCODE_GUID_ARE_INCONGRUENT), code unique, branch must exist. [src:.../cashbook-create.component.ts] [src:.../cashbook-edit.component.html] [src:javasdk/.../CashbookDataConsistencyObject.java]
- 2026-09-05 — Settlement method: code/name/sort_code/cashbook required; tabs Details, Branch, Charges, Tax, Payment Provider Error Codes, FPX e-Mandate (type FPX_EMANDATE only). Types: BANK_TRANSFER, CASH, CHEQUE, CREDIT_CARD, DEBIT_CARD, E_WALLET, FPX_EMANDATE, MEMBERSHIP_POINT_CURRENCY, OPEN_CREDIT, OTHERS, VOUCHER. Charges mode NONE/RATIO/ABSOLUTE with rate, absolute value, min/max limit, additional surcharge; separate sending charges; surcharge-to-customer (mode, rate/value, rounding precision, item code). A settlement method is persisted as a financial item (SettlementMethodDataConsistencyObject uses ITEM_HDR_* error codes; type STL_MTHD). [src:.../settlement-method-edit.component.html] [src:javasdk/.../SettlementMethodDataConsistencyObject.java] [src:doc-item repo models/item-constants.ts SettlementConstants]
- 2026-09-05 — Cash transfer: types Bank In / TT / Cash; statuses DRAFT/FINAL/VOID; CashTransferJournalPostingService posts only when posting_status FINAL (CASH_DOC_POSTING_STATUS_NOT_FINAL otherwise); negative line amount → credit (from cashbook); GL resolved company + settlement/cashbook → subledger → glcode; update of a FINAL doc rewrites the existing journal. [src:javasdk/.../CashTransferJournalPostingService.java L74-80, L118-130, L323-328]
- 2026-09-05 — Issues: Cash Level cashbook dropdown ignored company filter (fixed, gt#9138); FINAL transfers not posting because idempotency check counted DELETED journals (gt#9120); settlement method "item" appearing in PV expense list (gt#7616); cash bill doc number missing on cashbook line (gt#7381). [src:gh:bigledger/blg-int-general-task#9138] [src:gh:bigledger/blg-int-general-task#9120] [src:gh:bigledger/blg-int-general-task#7616] [src:gh:bigledger/blg-int-general-task#7381]

## How it connects

- **bank-reconciliation** — reconciles one cashbook's txn lines against statement lines.
- **pos-tender** — POS tender types are settlement types; branch defaults set in Cashbook > Branch Settings.
- **doc-item-maintenance** — settlement methods are fi items of type STL_MTHD; surcharge-to-customer bills an item.
- **gl-posting** — cash transfer/adjustment journals via company GL-code links (default GL codes).

## Open questions

- Exact accounts used by Cash Adjustment posting (not traced this pass).
- What Weightage Configuration / member rank + threshold (70–100) is used for (looks like a member ranking feature; no doc found).

## Wiki impact

- bank-reconciliation-applet (finance lane): link to cashbook-applet.
- internal-receipt-voucher / internal-payment-voucher (finance lane): settlement method → cashbook → GL code resolution; charges posting via SETTLEMENT_CHARGES default GL.
- pos-general-applet (sales lane): branch default settlement methods live in Cashbook > Branch Settings.
