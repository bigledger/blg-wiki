---
topic: internal-purchase-credit-note-applet
aliases: [purchase credit note, PURCRN, INTERNAL_PURCHASE_CREDIT_NOTE, supplier credit note]
applets: [internal_purchase_credit_note_applet]
modules: [purchasing, financial-accounting, e-invoice]
related: [internal-purchase-debit-note-applet, internal-purchase-invoice-applet, internal-sales-credit-note-applet, internal-payment-voucher-applet, gl-posting, e-invoice, intercompany, file-import]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-credit-note-applet.md
status: growing
updated: 2026-09-05
---

# Purchase Credit Note (Internal)

The purchase-side credit note. In BigLedger's engine it has amount signum −1 — the same as a purchase invoice — so it posts Dr Purchase / Cr Creditor and raises the supplier balance. The wiki page written in June 2026 said it "reduces what you owe"; the code says otherwise.

## Facts

- 2026-09-05 — Registry: code `internal_purchase_credit_note_applet`, name "Purchase Credit Note (Internal)", ACTIVE; documentation_url already points at the wiki page. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo `blg-applet-wavelet-internal-purchase-credit-note-applet`; `AppletConstants.amount_signum = -1`, `quantity_signum = 0`. [src:blg-applet-wavelet-internal-purchase-credit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-credit-note-applet/src/app/models/constants/applet-constants.ts]
- 2026-09-05 — Backend DCO: `INTERNAL_PURCHASE_CREDIT_NOTE`, amount signum −1, quantity signum 0. No doc-type-specific branches in GenericDocumentService / JournalPostingService / PurchaseReportUow. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseCreditNoteDataConsistencyObject.java]
- 2026-09-05 — Menus: Internal Purchase Credit Note, Line Items, File Import (`file-import`), Audit Trail. Settings nav: Application Settings, Default Selection, Printable Format Settings, Branch Settings — no Email Template (unlike the debit-note applet). [src:…/src/app/models/menu-items.ts]
- 2026-09-05 — Listing bulk actions: FINAL, DISCARD, VOID only (no print / self-billed / send email). Listing columns include "Self Billed ?" and the five ARAP figures. [src:…/purchase-credit-note-listing.component.ts]
- 2026-09-05 — Create screen has a **KO For** tab (hidden by `HIDE_KO_FOR_TAB`) with sub-tabs for Purchase GRN, Purchase Order and Supplier Delivery Order (`INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`, `INTERNAL_PURCHASE_ORDER`, `INTERNAL_OUTBOUND_DELIVERY_ORDER`). No Search Document tab on edit, although Default Selection's tab-order list still contains one. [src:…/purchase-credit-note-create/import-knock-off/]
- 2026-09-05 — Required header controls: company, branch, location, currency. No `setControlValidator` for external documents (only `HIDE_EXTERNAL_*` keys are read). [src:…/purchase-credit-note-create/main-details/main-details.component.ts]
- 2026-09-05 — `AppletSettings` declares ~220 keys; 105 are read. Declared-but-unread include `ENABLE_PRINT_FINAL_GEN_DOC_ONLY`, `LOCK_PURCHASER_TO_CURRENT_USER`, `DISALLOW_LINE_ITEM_EDIT`, `DISABLE_LINE_ITEM_NAME_EDIT`, `SHOW_ITEM_STOCK_BALANCE`, `MANDATORY_REMARKS_FIELD`, `REQUIRE_VALIDITY_DATE`, `SHOW_BUDGET`, `HIDE_FINAL_BUTTON`, `HIDE_EXPORT_AS_PDF_BUTTON`, `ENABLE_UNSAVED_ITEM_RECOVERY`, `ENABLE_SELECT_MODE`, `ENABLE_BRANCH_FILTER`. [src:…/src/app/models/applet-settings.model.ts]
- 2026-09-05 — Client-side perms seeded: 35 (same field-visibility set as the debit note, plus `IPCN_HIDE_TRACKING_ID_AND_PERMIT_NO`, `INTERNAL_PURCHASE_CREDIT_NOTE_DISPLAY_PRICING`). Code also checks `SHOW_GENDOC_*_BUTTON`, `SHOW_CLONE_BUTTON`, `SHOW_FILE_IMPORT_MENU`, `SHOW_LAST_PURCHASE_PRICE`, `SHOW_ARAP_*` — not seeded. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:…/purchase-credit-note-edit.component.ts]
- 2026-09-05 — Issues: listing search lost line-item columns after sub-query migration, fixed with EXISTS sub-query (gh:bigledger/blg-int-general-task#9519); auto-fetch rate on supplier selection + live/custom forex toast + SAVE blocked at rate 0 (#9637); tab ordering added (#8590); FINAL check-before-SAVE + auto pop-up printable (#8957); Skip E-Invoice switch (#7269); Lines total shown negative (#3891); export named like a sales invoice (#232); file import + CCY rate column (#231); wrong-CSV-column check (gh:bigledger/blg-akaun-platform-java#1560); AMOUNT_TAX_GST and e-Invoice tax-exemption upload columns (#130, #1409).
- 2026-09-05 — Live-data hint (anonymised): a support ticket shows a FINAL Purchase Credit Note with `arap_bal` −0.35, i.e. on the payable side, expected to appear in the Payment Voucher contra picker. [src:gh:bigledger/blg-int-general-task#9630]

## How it connects

- **internal-purchase-debit-note-applet** — opposite sign (+1). Together they are the two purchase adjustment notes; the wiki pages now say opposite things about AP direction, consistent with the code.
- **internal-purchase-invoice-applet** — same posting side; the PCN is a top-up to an invoice, linked via Doc Link.
- **internal-sales-credit-note-applet** — intercompany source (SCN −1 → PCN −1): seller AR down, buyer AP up — sign-opposite mirror (open question).
- **internal-payment-voucher-applet** — settles / contras the PCN balance; the contra picker filters by same `doc_ccy`, FINAL, `arap_bal <> 0`.
- **file-import** — shared importer with target/source column picker; template gains columns over time (tax amount, tax exemption).

## Open questions

- Same as the debit-note topic: is "credit note raises the supplier balance" the intended product semantics, and is SCN → PCN intercompany pairing right?
- Should the Default Selection tab-order list drop "Search Document" for this applet (no such tab exists)?

## Wiki impact

- Page rewritten to the code's posting direction; the old FAQ ("credit note = we pay less") removed. If Vincent rules the naming is inverted, flip the two overview callouts and the Dr/Cr tables of both purchase-note pages together.
- Sales Credit Note (Internal) page (other lane) should add `internal-purchase-credit-note-applet` to `related_applets`.
