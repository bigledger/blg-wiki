---
topic: internal-purchase-debit-note-applet
aliases: [purchase debit note, PURDBN, INTERNAL_PURCHASE_DEBIT_NOTE, supplier debit note]
applets: [internal_purchase_debit_note_applet]
modules: [purchasing, financial-accounting, e-invoice]
related: [internal-purchase-credit-note-applet, internal-purchase-invoice-applet, internal-sales-debit-note-applet, internal-payment-voucher-applet, gl-posting, e-invoice, intercompany]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-debit-note-applet.md
status: growing
updated: 2026-09-05
---

# Purchase Debit Note (Internal)

The debit note a company raises against a supplier. In BigLedger it posts Dr Creditor / Cr Purchase (amount signum +1, quantity signum 0), so it lowers the supplier's balance and is treated, together with the payment voucher, as a settlement document against purchase invoices.

## Facts

- 2026-09-05 — Registry: code `internal_purchase_debit_note_applet`, name "Purchase Debit Note (Internal)", TNT-USER, ACTIVE; documentation_url points at the old Confluence page, not the wiki. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo `blg-applet-wavelet-internal-purchase-debit-note-applet`; applet lives at `micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet`; the settings screen is the shared `FieldConfigurationComponent` from the `blg-shared-utilities` submodule (cloned separately under refs/). [src:blg-applet-wavelet-internal-purchase-debit-note-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-debit-note-applet/src/app/app.routing.ts]
- 2026-09-05 — Menus: Purchase Debit Note, Line Items, File Import (`debit-note-file-listing`); settings nav: Application Settings, Default Selection, Printable Format Settings, Branch Settings, Email Template. [src:…/src/app/models/menu-items.ts] [src:…/src/app/ui-navigation/applet-settings/applet-settings-navigation.config.ts]
- 2026-09-05 — Default Selection stores `DEFAULT_BRANCH`, `DEFAULT_LOCATION`, `DEFAULT_COMPANY` (derived from the branch) and `PURCHASE_DEBIT_NOTE_DETAILS_TAB_ORDER` (13 tabs, drag-and-drop). [src:…/src/app/components/settings-container/default-settings/default-settings.component.ts]
- 2026-09-05 — `AppletSettings` interface lists ~190 keys; the applet actually reads about 110 of them (counted by grep over components/state-controllers). Behavioural ones: `DEFAULT_POSTING_STATUS`, `DEFAULT_STATUS`, `DEFAULT_TRANSACTION_DATE` (1_day/1_week), `SORT_ORDER`, `FUZZY_SEARCH_COLUMNS`, `ENABLE_DUPLICATE_REFERENCE_CHECK`, `CANNOT_EDIT_CURRENCY_RATE`, `ENABLE_EMPLOYEE_LOGIN_AUTO_DETECTION`, `ENABLE_AUTO_POPUP`+`PRINTABLE`, `ENABLE_IMPORT_EXPORT`, `HIDE_FILE_IMPORT_MENU`, `HIDE_SEND_EMAIL_BUTTON`, `DISABLE_EDITING_AMOUNT_TXN`, `ENABLE_EDITING_UNIT_PRICE_STD`, `ENABLE_EDIT_PAYMENT_DATE`, `EDIT_CONTRA_TXN_DATE`. [src:…/src/app/models/applet-settings.model.ts]
- 2026-09-05 — The "External Documents" panel (HIDE_/MANDATORY_ QUOTATION, ORDER, DELIVERY_ORDER, INVOICE, OTHERS + dates) is rendered only for this applet's code in the shared settings screen. [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html]
- 2026-09-05 — File Import menu hidden when `HIDE_FILE_IMPORT_MENU` is on and the user lacks client-side perm `SHOW_FILE_IMPORT_MENU`. [src:…/src/app/app.component.ts]
- 2026-09-05 — Edit-screen buttons: `HIDE_GENDOC_{FINAL,VOID,DISCARD,SAVE}_BUTTON` settings are overridden by client-side perms `SHOW_GENDOC_{FINAL,DISCARD,VOID}_BUTTON`; clone by `HIDE_CLONE_BUTTON`/`SHOW_CLONE_BUTTON`. Those SHOW_ perms are not seeded in `bl_applet_client_side_perm_dfn` for this applet (34 seeded perms are all field-visibility SHOW_ keys plus `IPDN_HIDE_TRACKING_ID_AND_PERMIT_NO` and `INTERNAL_PURCHASE_DEBIT_NOTE_DISPLAY_PRICING`). [src:…/purchase-debit-note-edit.component.ts] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Branch Settings sub-tabs: Branch Details (Sales Agent, Rounding Five Cent + rounding item, Group Discount Item), Default Settlement Method, Item Category Filter, Menu List, Pricing Scheme, Printable Format. No "Employee" or "Printable Image" tab (the old page claimed both). [src:…/components/settings-container/branch-settings/branch/branch.component.html]
- 2026-09-05 — Backend DCO: server doc type `INTERNAL_PURCHASE_DEBIT_NOTE`, amount signum +1, quantity signum 0. Compare Purchase Invoice −1/+1, Purchase Credit Note −1/0, Purchase Return +1/−1. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseDebitNoteDataConsistencyObject.java]
- 2026-09-05 — Journal: `PURCHASE` handler (PNS_ENTITY=CREDITOR, PNS=PURCHASE, PNS_TAX=INPUT_TAX …). With signum +1 the PNS line is credited and the creditor line debited → AP falls. Missing creditor default GL → `MISSING_DEFAULT_GL_CODE`. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java] [src:…/JournalPostingTypeHandler.java]
- 2026-09-05 — Purchase Report treats `INTERNAL_PAYMENT_VOUCHER` and `INTERNAL_PURCHASE_DEBIT_NOTE` as the settlement/contra doc types against `INTERNAL_PURCHASE_INVOICE`. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/erp/reports/purchase/PurchaseReportUow.java]
- 2026-09-05 — Intercompany pairs `INTERNAL_SALES_DEBIT_NOTE` → `INTERNAL_PURCHASE_DEBIT_NOTE` (qty 0, amount +1) and `INTERNAL_SALES_CREDIT_NOTE` → `INTERNAL_PURCHASE_CREDIT_NOTE` (qty 0, amount −1). [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/intercompany/IntercompanyProcessingService.java]
- 2026-09-05 — FINAL: refuses already-FINAL; validates forex rate, SN/batch/bin qty, fiscal lock (`FISCAL_PERIOD_LOCKED`); forex documents get a shadow base-currency copy; queues generic-doc, message-template, member-point, e-Invoice. VOID: void processor, removes from e-Invoice queue and historical aging; refused when downstream links exist. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java]
- 2026-09-05 — e-Invoice: in `PURCHASE_DOC_TYPES`; skip via document / branch / entity `skip_einvoice`; listing bulk action sets `einvoice_self_billed`. Skip toggle for PDN added mid-2026. [src:blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dto/erp/eInvoice/EInvoiceConstants.java] [src:gh:bigledger/blg-int-general-task#7268]
- 2026-09-05 — Issues: FINAL-before-SAVE check + auto-popup printable (gh:bigledger/blg-int-general-task#8958); file import + currency-rate column added (#233); purchase upload columns AMOUNT_TAX_GST and e-Invoice tax-exemption (gh:bigledger/blg-akaun-platform-java#130, #1409); wrong-CSV-column validation (#1532). Applet repo itself has one issue (Angular 14 migration). [src:gh:bigledger/blg-applet-wavelet-internal-purchase-debit-note-applet#5]

## How it connects

- **internal-purchase-credit-note-applet** — opposite sign (−1): in this platform the *credit* note raises the supplier balance. The two wiki pages must say opposite things; the old PCN page says "reduces what you owe" — check against its DCO before rewriting.
- **internal-purchase-invoice-applet** — Search Document pulls PI lines in; PDN contra reduces PI open balance.
- **internal-sales-debit-note-applet** — intercompany source. Seller's SDN posts Dr Debtor (AR up); the generated PDN posts Dr Creditor (AP down) — the mirror is name-matched but sign-opposite. Question for Vincent.
- **internal-payment-voucher-applet** — the other settlement doc type; contra picker requires same `doc_ccy`, FINAL, non-zero `arap_bal`.
- **gl-posting** — the generic signum → Dr/Cr rule (`finalSign = amount_signum × sign(amount)`; <0 debit, else credit; entity line balances).
- **e-invoice** — purchase doc type; supplier is the issuer; self-billed flag.
- **intercompany** — queue-based mirror creation with per-pair signum table.

## Open questions

- Is the SDN → PDN intercompany pairing intended to produce AR-up / AP-down, or should SDN pair with PCN (−1)? (Same for SCN → PCN.) Needs a product answer.
- Which of the ~80 unread `AppletSettings` keys are dead (present in the interface, never read)? Not needed for the page; would shrink the settings table.

## Wiki impact

- The applet page now states the Dr Creditor / Cr Purchase direction. The Sales Debit Note (Internal) page (sales-workflow, another lane) describes the mirror as "Branch A owes +RM 500" — it should not claim the buyer's AP goes up.
- The Purchase Credit Note (Internal) page (this lane, next in queue) must be checked against signum −1.
- Old page's "SHOW_FILE_IMPORT_MENU permission required" FAQ was half right: the setting `HIDE_FILE_IMPORT_MENU` must also be on for the menu to disappear.
