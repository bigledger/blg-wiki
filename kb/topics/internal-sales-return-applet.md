---
topic: internal-sales-return-applet
aliases: [sales return, customer return, INTERNAL_SALES_RETURN, internalSalesReturnApplet]
applets: [internalSalesReturnApplet]
modules: [inventory, financial-accounting, e-invoice, pos]
related: [internal-sales-invoice-applet, pos-general-applet, internal-sales-credit-note-applet, internal-sales-refund-note-applet, internal-purchase-return-applet, company-default-gl-codes, contra-settlement, my-e-invoice-portal-applet, return-reasons]
wiki:
  - content/en/applets/sales-workflow/internal-sales-return-applet.md
status: growing
updated: 2026-09-05
---

# Sales Return (Internal)

Brings goods back into stock and reverses the sale. Amount signum −1, quantity signum +1; journal hits `SALES_RETURN` (not `SALES`), stock-in at MA cost, Cr Debtor.

## Facts

- 2026-09-05 — Registry name "Sales Return (Internal) " (trailing space in the registry row), code `internalSalesReturnApplet`; the repo was renamed to "Internal Sales Return" in 2026 (commit "Applet Name Change"). [src:registry] [src:git-log]
- 2026-09-05 — Validator: doc type + amount signum −1; line quantity signum +1. [src:javasdk/…/InternalSalesReturnDataConsistencyObject.java]
- 2026-09-05 — `docTypeConnectorMap["internal-sales-invoices"]` = previous {INTERNAL_SALES_INVOICE, INTERNAL_SALES_CASHBILL} → return INTERNAL_SALES_RETURN. [src:javasdk/…/GenericDocumentTypeHandler.java#L951-L955]
- 2026-09-05 — Journal: PNS lines of INTERNAL_SALES_RETURN use txn code `SALES_RETURN` (pnsReturn) when resolving item-company / company default GL. [src:javasdk/…/JournalPostingService.java#L150-L153]
- 2026-09-05 — GenericDocumentService has no special-case code for INTERNAL_SALES_RETURN (0 mentions); blacklist and stock-balance checks therefore do not apply. [src:javasdk/…/GenericDocumentService.java]
- 2026-09-05 — Menus: Internal Sales Return, Line Items, Intercompany, File Export, File Import, Swap Serial Number; `HIDE_INTERCOMPANY_MENU` / `HIDE_FILE_EXPORT_MENU` overridable by `SHOW_*` perms that are NOT registered (45 defs, none of them). [src:…/menu-items.ts] [src:…/app.component.ts#L49-L118] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Unique settings: Return Reasons screen (`settings/return-reasons-settings`, Reason Code / Reason Name); shared-screen toggles `WARN_EXCESS_RETURN_QUANTITY`, `SHOW_INVOICES_FROM` (default dateFrom of invoice search), `SALES_RETURN_WITH_PAYMENT`, `CONTRA_DATE_SAME_AS_DOC_DATE_TXN`, `HIDE_SEARCH_BY_CUSTOMER` / `HIDE_SEARCH_BY_CASHBILL`, `HIDE_REASON`, `HIDE_BATCH_ISSUE_DATE` / `HIDE_BATCH_EXPIRY_DATE`. [src:…/reason-settings-container/] [src:field-configuration.component.html] [src:git-log]
- 2026-09-05 — Search tab: Search By Customer, By Invoice, By Cashbill, By Serial Number, Search Item; Add Selected/Add All apportion invoice amounts to returned qty; invoice must match header entity and branch; entity locked once linked. [src:…/sales-return-create/ search tabs] [src:git-log "add checking for entity or branch not match", "block user from changing entity id if linked to sales inv", "Search By Invoice amount mapping"]
- 2026-09-05 — 15 form tabs incl. E-Invoice (Submission with original e-invoice ref no/UUID picker, Skip E-Invoice), Payment, Payment Adjustment, Contra. [src:…/default-settings.component.ts] [src:existing wiki page 2026-04]
- 2026-09-05 — Client-side perm `SHOW_EDIT_SETTLEMENT_FINAL` ("To Edit payment after doc is finalize") pairs with setting `ENABLE_EDIT_SETTLEMENT_FINAL`. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Commit-log fixes (anonymised): zero amounts from Search By Invoice; edit line resetting manual price; customer name missing in listing; skip e-invoice; e-invoice void message; swap serial for lines; inverse currency rate field; listing restore after save/final; bill-to/ship-to edits persisted. [src:git-log] [src:gh:…#10, #16]

## How it connects

- **internal-sales-invoice-applet / pos-general-applet** — sources; return reverses their journal with SALES_RETURN.
- **internal-sales-credit-note-applet** — non-stock alternative.
- **internal-purchase-return-applet** — intercompany mirror.
- **my-e-invoice-portal-applet** — return references the original e-invoice; void blocked once submitted.

## Open questions

- Registry row name carries a trailing space ("Sales Return (Internal) ") — parity check should trim.

## Wiki impact

- `purchase-workflow/internal-purchase-return-applet` and `e-invoice/my-e-invoice-admin-applet` should list this applet.
