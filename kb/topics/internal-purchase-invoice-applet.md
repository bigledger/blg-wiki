---
topic: internal-purchase-invoice-applet
aliases: [purchase invoice, supplier invoice, PI, IPI, internal_purchase_invoice_applet]
applets: ["internal_purchase_invoice_applet"]
modules: [financial-accounting, purchasing]
related: [purchase-grn, purchase-order, purchase-invoice-no-stock-in, payment-voucher, purchase-return, e-invoice, gl-posting, moving-average-cost, default-gl-codes, client-side-permissions]
wiki:
  - content/en/applets/finance/internal-purchase-invoice-applet.md
  - content/en/applets/purchase-workflow/internal-purchase-grn-applet.md
  - content/en/guides/purchasing-guides/standard-procurement-workflow.md
status: growing
updated: 2026-09-05
---

# Purchase Invoice (Internal) applet

The applet that records supplier bills. FINAL posts the supplier liability, purchase and input tax to the ledger and — in the standard flow — books the invoiced quantity into stock. Settled from its own Payment tab, by Contra, or by a Payment Voucher.

## Facts

- 2026-09-05 — Registry: code `internal_purchase_invoice_applet`, name "Purchase Invoice (Internal)", TNT-USER, ACTIVE. A second row with the same code and name "Internal Purchase Invoice" is DELETED. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo is `blg-applet-wavelet-internal-purchase-invoice-applet`; the Angular app lives under `micro-fe/projects/wavelet-erp/applets/internal-purchase-invoice-applet`; the Application Settings screen is the shared `field-configuration` component in the `blg-shared-utilities` submodule, gated per applet code. [src:blg-applet-wavelet-internal-purchase-invoice-applet/.gitmodules] [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.html]
- 2026-09-05 — Applet constants: `amount_signum = -1`, `quantity_signum = 1`. Every line the applet creates (keyed, PO knock-off, GRN knock-off) carries quantity signum +1, i.e. the invoice is a stock-in document. [src:blg-applet-wavelet-internal-purchase-invoice-applet/.../models/constants/applet-constants.ts] [src:.../import-knock-off/knock-off-grn/knock-off-grn.component.ts]
- 2026-09-05 — By contrast the standard Purchase GRN applet has `quantity_signum = 0` (no stock movement); GRN Stock In has `1`; Purchase Invoice No Stock In has `0`. The backend lists `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` among "purchase doc types with signum zero" for serial validation. [src:blg-applet-wavelet-internal-purchase-grn-applet/.../applet-constants.ts] [src:blg-applet-wavelet-internal-purchase-grn-stock-in-applet/.../applet-constants.ts] [src:blg-applet-wavelet-internal-purchase-invoice-no-stock-in-applet/.../applet-constants.ts] [src:blg-akaun-platform-java/javasdk/.../tenant/GenericDocumentService.java]
- 2026-09-05 — Journal handler "PURCHASE": PNS_ENTITY→`CREDITOR`, PNS→`PURCHASE`, PNS_DISCOUNT→`PURCHASE_DISCOUNT`, PNS_RETURN→`PURCHASE_RETURN`, PNS_TAX→`INPUT_TAX`, FOREX_GAIN/LOSS. Entity line resolves by AR/AP type: AP_TRADE→CREDITOR, AP_OTHER→CREDITOR_NON_TRADE, AP_EMPLOYEE→EMPLOYEE_OTHER_PAYABLE; missing mapping throws `MISSING_DEFAULT_GL_CODE: <code>`. [src:blg-akaun-platform-java/javasdk/.../tenant/JournalPostingTypeHandler.java] [src:blg-akaun-platform-java/javasdk/.../tenant/JournalPostingService.java]
- 2026-09-05 — Line GL resolution order: line `guid_glcode` → item company GL link with txn_code PURCHASE → company default PURCHASE. [src:blg-akaun-platform-java/javasdk/.../tenant/JournalPostingService.java]
- 2026-09-05 — `INTERNAL_PURCHASE_INVOICE_NO_STOCK_IN` additionally posts Dr `CREDITOR_NOT_INVOICED` (GR/IR clearing) when linked to a GRN Stock In. [src:blg-akaun-platform-java/javasdk/.../tenant/JournalPostingService.java]
- 2026-09-05 — Inventory: on an INTERNAL_PURCHASE_INVOICE inv txn line the backend updates `cost_last_purchase_company` and `cost_last_purchase_location` with `amount_net / qty_base`. [src:blg-akaun-platform-java/javasdk/.../erp/stock/StockBalanceHelper.java]
- 2026-09-05 — Backend has a dedicated GRN→PI converter (`PurchaseGRNToPurchaseInvoiceConverter`, amount_signum −1, posting_inventory null) and a GRN Stock In→PI No Stock In converter. [src:blg-akaun-platform-java/javasdk/.../erp/factory/GenericDocumentConverterFactory.java]
- 2026-09-05 — Update-posting-status endpoint: refuses re-FINAL (403 "Generic Document has already been posted to FINAL"); stamps `date_finalized`; applies `date_txn_logic` USE_FINAL / USE_CREATED / USE_UPDATED unless the header has `use_date_txn`; optional flags validate_serial_signum_zero, validate_stock_balance (default true), disallow_sell_below_cost, validate_points_redeemed. [src:blg-akaun-platform-java/javasdk/.../tenant/GenericDocumentService.java]
- 2026-09-05 — UI: VOID is hidden when the company's `einvoice_status === 'ENABLED'`; refused when an ACTIVE `RETURN` link to an INTERNAL_PURCHASE_RETURN exists. DISCARD only on ACTIVE+DRAFT. FINAL requires valid main form, valid account, ≥1 line, no duplicate serials, not TEMP, not gen-doc-locked. [src:blg-applet-wavelet-internal-purchase-invoice-applet/.../purchase-invoice-edit/purchase-invoice-edit.component.ts] [src:.../purchase-invoice.reducers.ts]
- 2026-09-05 — Settings menu: Application Settings (field-settings), Default Selection, Printable Format Settings, Branch Settings; Knock Off Settings route exists but menu entry is commented out. Personalization: Default Selection, Sidebar. [src:blg-applet-wavelet-internal-purchase-invoice-applet/.../models/menu-items.ts] [src:.../app.routing.ts]
- 2026-09-05 — Default Selection: DEFAULT_BRANCH, DEFAULT_LOCATION (auto from branch ext MAIN_LOCATION), DEFAULT_DECIMAL_PRECISION 2–4 (default 2), DATE_TXN_LOGIC (default USE_DATE_TXN), PURCHASE_INVOICE_DETAILS_TAB_ORDER (16 tabs, drag). [src:.../settings-container/default-settings/default-settings.component.ts]
- 2026-09-05 — Branch Settings tabs: Branch Details (Rounding Five Cent), Item Category Filter, Menu List, Pricing Scheme (Level, Priority), Printable Format (Header/Footer/Remarks), Default Settlement Method. [src:.../settings-container/branch-settings/branch/branch.component.html]
- 2026-09-05 — Main Details: only `branch` and `location` are unconditionally `Validators.required`; external doc refs 1–5 and their dates become required through MANDATORY_* settings. Purchaser is starred in the label. [src:.../purchase-invoice-create/main-details/main-details.component.ts]
- 2026-09-05 — Client-side permissions (73 rows, 69 ACTIVE) are mostly `SHOW_*` mirrors of `HIDE_*` settings; notable: SHOW_INTERCOMPANY_PI_SCREEN, HIDE_PRICE, INTERNAL_PURCHASE_INVOICE_DISPLAY_PRICING, IPI_HIDE_TRACKING_ID_AND_PERMIT_NO, EDIT_CURRENCY_RATE, DISABLE_EMPLOYEE_LOGIN_AUTO_DETECTION, SHOW_FILE_IMPORT_MENU/SHOW_FILE_EXPORT_MENU. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Issues (anonymised): sales invoice and self-billed purchase invoice sequences both start at 1000001 so numbers collide in e-Invoice listings (no double submission) [src:gh:bigledger/blg-intranet#5588]; purchase lines with qty>0 and zero amount dilute MA cost, overwhelmingly INTERNAL_PURCHASE_INVOICE [src:gh:bigledger/blg-akaun-platform-java#1950]; journal creditor differs from document supplier after supplier change [src:gh:bigledger/blg-sd-steven-tele#466]; lines posted to generic "purchase" GL instead of item GL [src:gh:bigledger/blg-sd-grex-multimedia#205]; duplicate-reference warning requested for Reference and external refs [src:gh:bigledger/blg-intranet#4017]; contra listing shown twice [src:gh:bigledger/blg-sd-monaliza#440]; ETL-created invoices left in DRAFT [src:gh:bigledger/blg-sd-kamming#239]; request to edit Doc Ref Date → ALLOW_EDITING_DOC_REF_DATE [src:gh:bigledger/blg-sd-jet-machinery#481].

## How it connects

- **purchase-grn** — the standard GRN does not move stock; the invoice does. Any page saying "stock was received on the GRN, the invoice does not move stock again" is inverted for the standard applet pair.
- **purchase-invoice-no-stock-in** — the journal-only twin, used with GRN Stock In; posts CREDITOR_NOT_INVOICED clearing.
- **payment-voucher** — settles the creditor line this invoice creates; the invoice's own Payment tab does the same for one document.
- **purchase-return** — an active RETURN link blocks VOID.
- **e-invoice** — self-billed flag on header; company e-Invoice ENABLED hides VOID.
- **default-gl-codes** — CREDITOR / CREDITOR_NON_TRADE / PURCHASE / INPUT_TAX / PURCHASE_DISCOUNT must exist per company.
- **moving-average-cost** — invoice value feeds MA and last purchase cost; zero-value lines dilute it.

## Open questions

- Does any tenant-level setting flip the standard GRN to stock-in (other than using the GRN Stock In applet)? Not found in the GRN applet constants; needs a look at the GRN page's own repo when Lane 3/4 process it.
- Where is the "Purchase GRN Stock In / No Stock In" choice documented as a tenant-level decision? Candidate for a purchasing guide.

## Wiki impact

- `content/en/applets/purchase-workflow/internal-purchase-grn-applet.md` — currently says GRN performs "automatic stock-in"; per code the standard GRN has quantity signum 0. Needs correction (other lane).
- `content/en/guides/purchasing-guides/standard-procurement-workflow.md` and the previous version of the PI page — same inverted claim.
- `content/en/modules-v2/purchasing/_index.md` — links "Purchase Invoice Applet" to the No Stock In page; should point to `/applets/finance/internal-purchase-invoice-applet/`.
