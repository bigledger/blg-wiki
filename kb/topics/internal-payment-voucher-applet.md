---
topic: internal-payment-voucher-applet
aliases: [payment voucher, PV, PAYVCR, internal-payment-voucher-applet]
applets: ["internal-payment-voucher-applet"]
modules: [financial-accounting, purchasing]
related: [receipt-voucher, bank-reconciliation, cashbook, settlement-method, contra, purchase-invoice, default-gl-codes, client-side-permissions, intercompany]
wiki:
  - content/en/applets/finance/internal-payment-voucher-applet.md
  - content/en/applets/finance/internal-receipt-voucher-applet.md
status: growing
updated: 2026-09-05
---

# Payment Voucher (Internal) applet

Records money paid out to a payee as payment (settlement) lines, optionally with expense lines paid directly, applies it to open purchase documents by contra, and on FINAL posts one cashbook transaction per payment line plus the creditor journal.

## Facts

- 2026-09-05 — Registry: code `internal-payment-voucher-applet`, name "Payment Voucher (Internal)", TNT-USER, ACTIVE, documentation_url points at `/applets/finance/internal-payment-voucher-applet/`. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo `blg-applet-wavelet-internal-payment-voucher-applet` (active, last commit 2026-08-31; an `-old` project folder sits beside the live one). Constants: docType `INTERNAL_PAYMENT_VOUCHER`, `amount_signum = 1`, `quantity_signum = 0`. [src:blg-applet-wavelet-internal-payment-voucher-applet/.../models/constants/applet-constants.ts]
- 2026-09-05 — Menus: Internal Payment Voucher, File Import, Intercompany, File Export, Settlement Adjustment, Expenses Adjustment, Audit Trail. Menu gating in app.component: file-import/intercompany/file-export hidden by `HIDE_*_MENU` unless `SHOW_*_MENU` permission; Settlement Adjustment shown only when setting `ENABLE_EDIT_SETTLEMENT_FINAL` AND permission `SHOW_EDIT_SETTLEMENT_FINAL`; Expenses Adjustment hidden when `ALLOW_EXPENSES_EDITING_AFTER_FINAL` is on and the user lacks `ALLOW_EDIT_EXPENSES_AFTER_FINAL`. [src:.../models/menu-items.ts] [src:.../app.component.ts]
- 2026-09-05 — Edit tabs: Main Details, Account, Expenses, ARAP, Payment, Payment Adjustment, Department Hdr, Trace Document, Contra, Doc Link, Attachments, Export, Sales Commission, Expenses Adjustment. [src:.../internal-payment-voucher-edit.component.ts]
- 2026-09-05 — Required header controls: company, branch, location, currency. FINAL requires ≥1 payment line; VOID on FINAL only; no e-Invoice lock. Toasts: "The currency rate cannot be ZERO.", "No Default Printable Selected", "Failed to generate printable". [src:.../main-details/main-details.component.ts] [src:.../internal-payment-voucher-edit.component.ts]
- 2026-09-05 — Listing honours `VIEW_OWN_CREATED_TXN_ONLY` unless the user holds `VIEW_PAYMENT_VOUCHER_ALL_USER_CREATE`. [src:.../internal-payment-voucher-listing.component.ts]
- 2026-09-05 — Branch Settings use the shared `blg-shared-utilities/modules/branch-settings` screen: Branch Details (Rounding Five Cent, Group same item code, Disable device validation), Item Category Filter, Employee, Pricing Scheme, Printable Format, Printable Image, Default Settlement Method. [src:blg-shared-utilities/modules/branch-settings/]
- 2026-09-05 — Journal handler INTERNAL_PAYMENT_VOUCHER: PNS_ENTITY→CREDITOR, PNS→PURCHASE, PNS_DISCOUNT→PURCHASE_DISCOUNT, PNS_RETURN→PURCHASE_RETURN, PNS_TAX→INPUT_TAX, FOREX_GAIN/LOSS; STL_MTHD lines post to the cashbook's GL code; `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD [code]` on FINAL. AP type → CREDITOR / CREDITOR_NON_TRADE / EMPLOYEE_OTHER_PAYABLE. [src:blg-akaun-platform-java/javasdk/.../tenant/JournalPostingTypeHandler.java] [src:blg-akaun-platform-java/javasdk/.../tenant/JournalPostingService.java]
- 2026-09-05 — Backend maps STL_MTHD lines of INTERNAL_SALES_RETURN / INTERNAL_SALES_REFUND_NOTE onto INTERNAL_PAYMENT_VOUCHER for cashbook repair; intercompany PV→RCT mapping of STL_MTHD lines added 2026-07. [src:blg-akaun-platform-java/javasdk/.../validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java] [src:gh:bigledger/blg-sd-kenho-auto-parts#905]
- 2026-09-05 — Client-side permissions (41 ACTIVE): ALLOW_EDIT_EXPENSES_AFTER_FINAL, SHOW_EDIT_SETTLEMENT_FINAL, SHOW_DELETE_CONTRA, VIEW_PAYMENT_VOUCHER_ALL_USER_CREATE, VIEW_CASHBILL_ALL_USER_CREATE, INTERNAL_PAYMENT_VOUCHER_DISPLAY_PRICING, SHOW_GENDOC_*_BUTTON, SHOW_* field mirrors. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Issues (anonymised): settlement dropdown empty for a tenant (branch settlement methods) [src:gh:bigledger/blg-intranet#4259]; open-balance formula double-counts contra [src:gh:bigledger/blg-intranet#5397]; contra removed / not recognised until re-save [src:gh:bigledger/blg-sd-enter-technology#297] [src:gh:bigledger/blg-sd-enter-technology#322]; void journal missing / wrong date [src:gh:bigledger/blg-sd-enter-technology#311] [src:gh:bigledger/blg-sd-zonria#155]; PV to a customer-typed entity shows on debtor SOA [src:gh:bigledger/blg-sd-berdaya-marketing#372]; FOC 0.00 cannot be contra'd (by design) [src:gh:bigledger/blg-sd-enter-technology#309]; adjusted transaction no not on printout [src:gh:bigledger/blg-sd-enter-technology#332]; payment date not syncing with header [src:gh:bigledger/blg-sd-enter-technology#286].

## How it connects

- **receipt-voucher** — mirror; identical mechanics with DEBTOR instead of CREDITOR.
- **purchase-invoice** — contra target; VOID of the PV releases the invoice's outstanding.
- **bank-reconciliation / cashbook** — STL_MTHD lines; amounts locked once reconciled.
- **intercompany** — PV with intercompany data produces the receipt in the sister company.

## Open questions

- The `-old` project folder in the repo: confirm it is dead code (not built).
- Whether Sales Commission tab links to the Sales Commission applet's runs (component `sales-commission-link` only has a search field).

## Wiki impact

- `content/en/applets/master-data/supplier-applet-1.md` should explain AP_TRADE / AP_OTHER / AP_EMPLOYEE and their effect on PV posting.
- A page for the Reimbursement Payment Voucher applet is missing (registry ACTIVE, no wiki page).
