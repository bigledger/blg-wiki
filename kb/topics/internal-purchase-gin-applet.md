---
topic: internal-purchase-gin-applet
aliases: [purchase GIN, purchase goods issue note, INTERNAL_PURCHASE_GOODS_ISSUED_NOTE, PURGIN]
applets: [internalPurchaseGINApplet]
modules: [purchasing]
related: [internal-purchase-return-applet, internal-purchase-grn-stock-in-applet, internal-purchase-grn-applet, internal-purchase-order-applet, internal-sales-gin-applet, internal-consignment-gin-applet, stock-adjustment-applet, knock-off-configuration, inline-gear-settings, fiscal-year]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-gin-applet.md
status: growing
updated: 2026-09-05
---

# Purchase GIN (Internal)

The purchase-side Goods Issue Note: a record that goods went out toward a supplier (return, warranty, sample). In BigLedger it is a zero-movement, zero-value generic document — it links to the source line but changes neither stock nor the ledger.

## Facts

- 2026-09-05 — Registry: code `internalPurchaseGINApplet`, name "Purchase GIN (Internal)", ACTIVE, documentation_url already points at the wiki page. Dev `main.ts` sets `appletCode` to `internal-purchase-gin-applet`, which differs from the registry code. [src:planning/private/registry-applets-2026-09-05.tsv] [src:refs/blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/main.ts]
- 2026-09-05 — Server doc type `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE`, short code `PURGIN`, amount signum 0 and quantity signum 0; the DCO checks the amount signum on create/update and overwrites the line signums with 0/0. [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseGoodsIssuedNoteDataConsistencyObject.java] [src:refs/blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java]
- 2026-09-05 — No stock movement: `InventoryTransactionLineProcessorService.createInventoryTxnFromGenericDoc` filters lines to `quantity_signum != 0`; the type is absent from `StockBalanceHelper.MA_WA_SERVER_DOC_TYPES` (the MA-feeding purchase-side types are PURCHASE_RETURN, PURCHASE_INVOICE, GRN_STOCK_IN, GIN_STOCK_OUT, CONSIGNMENT_GRN/GIN, TRADE_IN, STOCK_ADJUSTMENT). [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java] [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java]
- 2026-09-05 — No journal: `JournalPostingService.getJournalContainer` builds lines only where `amount_signum != 0`, then throws `NO_JOURNAL_CREATED` when totals are zero; `JournalPostingTypeHandler` has no entry for the type (falls back to the generic `PURCHASE` handler, but no line qualifies). If the tenant subscribes `JOURNAL_POSTING_JOB_PROCESSOR` to every FINAL, the queue job for a GIN fails with `NO_JOURNAL_CREATED` while the document stays FINAL. [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java] [src:refs/blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/journalPosting/JournalPostingJobProcessor.java]
- 2026-09-05 — FINAL validation for this type: forex check, duplicate serial numbers within the document, bin JSON checks, fiscal-period lock (`FISCAL_PERIOD_LOCKED`, LOCK_ALL / LOCK_TXN). Serial existence and serial-count-vs-qty checks run only for `quantity_signum != 0` lines unless the caller sends `validate_serial_signum_zero`, which the applet does not. [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java]
- 2026-09-05 — The applet offers FINAL (listing multi-select and edit form), SAVE and a non-FINAL DELETE; no VOID, DISCARD or set-to-draft action exists in its effects. The backend DELETE endpoint has no posting-status guard, so hiding DELETE for FINAL rows is client-side only. [src:refs/blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/state-controllers/internal-purchase-gin-controller/store/effects/internal-purchase-gin.effects.ts] [src:refs/blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java]
- 2026-09-05 — Source pickers: eight document types (PO, PR, PQ, PI, Purchase Return, DO, SO, Jobsheet). A copied line writes `bl_fi_generic_doc_link` with `txn_type` `<SRC>_IPGIN`, `quantity_signum` −1 and `quantity_contra` = quantity; the picker's open quantity is computed client-side from those links, not from the open queue. [src:refs/blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/internal-purchase-gin-container/internal-purchase-gin-create/add-line-item/add-line-item.component.ts] [src:…/line-item/line-item-create/purchase-order-item/line-purchase-order-item-listing.component.ts]
- 2026-09-05 — Open-queue rows on FINAL depend on the company's Knock Off Configuration having an enabled row for `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE` (`GenericDocLineOpenQueueProcessor.getConfigContainer`). [src:refs/blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/GenericDocLineOpenQueueProcessor.java]
- 2026-09-05 — Settings: shared `FieldConfigurationComponent` renders 125 of the 172 controls the model declares for the registry code; 47 are gated out because `internalPurchaseGINApplet` is in none of the shared screen's applet-code lists (`tabMappings`, external documents, menus). The inline gear is embedded on 31 screens. 63 keys pass all four proofs; 78 shared toggles are saved but never read; 31 gear keys are neither declared nor read. [src:refs/blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts] [src:refs/blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/models/applet-settings.model.ts]
- 2026-09-05 — `DEFAULT_BRANCH` / `DEFAULT_LOCATION` from Default Selection are persisted but no component in the applet reads them; `DEFAULT_COMPANY` is patched into a form without that control. Personal Default Selection's container is never populated and its SAVE output has no subscriber. [src:refs/blg-applet-wavelet-internal-purchase-gin-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-gin-applet/src/app/components/settings-container/default-settings/default-settings.component.ts] [src:…/personalization-container/personal-default-settings/personal-default-settings.component.ts]
- 2026-09-05 — Client-side permissions: 22 seeded (`SHOW_COSTING_DETAILS`, `SHOW_LAST_PURCHASE_PRICE`, 20 `SHOW_*` price/qty/tax column codes); `INTERNAL_PURCHASE_GIN_DISPLAY_PRICING` and `SHOW_GENDOC_FINAL_BUTTON` are checked but not seeded; `SHOW_LAST_PURCHASE_PRICE` is seeded but not checked. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:…/line-item/line-item-listing.component.ts]
- 2026-09-05 — Payment tab writes `INTERNAL_RECEIPT_VOUCHER` settlement lines (`INTERNAL_PAYMENT_VOUCHER` for CASH_BACK) and they are included in the create/edit request, but the DCO forces amount signum 0 on them; the Contra tab attaches `bl_fi_generic_doc_arap_contra` rows against any FINAL document type in the tenant. [src:…/payment/add-payment/add-payment.component.ts] [src:…/contra/select-document/contra-select-document.component.ts]
- 2026-09-05 — Fiscal-period-lock message wording was a programme-wide FE change. [src:gh:bigledger/blg-intranet#1616]; gear rollout for this applet. [src:gh:bigledger/blg-intranet#5429] [src:gh:bigledger/blg-intranet#5406] [src:gh:bigledger/blg-intranet#5380]; tab ordering setting. [src:gh:bigledger/blg-intranet#1089]; i18n not implemented. [src:gh:bigledger/blg-intranet#5065]

## How it connects

- **internal-purchase-return-applet** — the return (−1/+1) is the document that moves stock and debits the supplier; the GIN is documentation only. Guides that say "GIN reduces stock" must be corrected.
- **internal-purchase-grn-stock-in-applet** — the stock-moving inbound type (`INTERNAL_PURCHASE_GRN_STOCK_IN`) is in MA_WA types and has its own journal handler; the plain GRN is 0/0 like the GIN.
- **internal-sales-gin-applet** — same 0/0 shape on the sales side.
- **internal-consignment-gin-applet** — `INTERNAL_PURCHASE_CONSIGNMENT_GIN` is a stock-moving type; do not describe the two GINs alike.
- **stock-adjustment-applet** — the practical way to remove quantities physically dispatched on a GIN when no return is raised.
- **knock-off-configuration** — open-queue rows for any type depend on the company flow config.
- **inline-gear-settings** — the gear is now the only control for many keys gated out of the shared screen for codes absent from `tabMappings`.

## Open questions

- Is `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE` intended to stay 0/0, with `INTERNAL_PURCHASE_GIN_STOCK_OUT` (present in MA_WA types, no applet found in refs/) as the stock-moving variant? No applet repo or registry row for a "Purchase GIN Stock Out" exists.
- Should the gear key lists be trimmed to declared-and-read keys (31 dead toggles today)?

## Wiki impact

- content/en/applets/purchase-workflow/internal-purchase-gin-applet.md — rewritten (run 11) to say the GIN does not move stock or post.
- content/en/applets/purchase-workflow/internal-purchase-grn-applet.md and internal-purchase-grn-stock-in-applet.md — both link here as "GIN reduces stock"; wording to check when GRN Stock In is processed (next in queue).
- content/en/applets/sales-workflow/internal-sales-gin-applet.md (other lane) — should state the same 0/0 fact.
- content/en/applets/inventory-workflow/internal-consignment-gin-applet.md (other lane) — should say it differs from the purchase GIN by moving stock.
