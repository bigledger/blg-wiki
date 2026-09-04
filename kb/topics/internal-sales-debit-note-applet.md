---
topic: internal-sales-debit-note-applet
aliases: [sales debit note, debit note, INTERNAL_SALES_DEBIT_NOTE, InternalSalesDebitNote]
applets: [InternalSalesDebitNote]
modules: [financial-accounting, e-invoice]
related: [internal-sales-invoice-applet, internal-sales-credit-note-applet, internal-receipt-voucher-applet, internal-purchase-debit-note-applet, intercompany, company-default-gl-codes, my-e-invoice-portal-applet]
wiki:
  - content/en/applets/sales-workflow/internal-sales-debit-note-applet.md
status: growing
updated: 2026-09-05
---

# Sales Debit Note (Internal)

Raises an extra charge against a customer or an intercompany branch after invoicing. Amount signum +1, quantity signum 0: invoice-style journal (Dr Debtor, Cr Sales/line GL, Cr Output tax) with no stock movement; mirrored as a Purchase Debit Note in the receiving company.

## Facts

- 2026-09-05 — Registry has two rows with code `InternalSalesDebitNote`: an ACTIVE one named "Sales Debit Note (Internal)" (2022-07-12) and a DELETED one named "Internal Sales Debit Note" (2021-12-22). The page uses the ACTIVE row. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Validator: doc type + amount signum +1; line quantity signum 0. [src:javasdk/…/InternalSalesDebitNoteDataConsistencyObject.java] [src:…/models/constants/applet-constants.ts]
- 2026-09-05 — Intercompany mapping SALES_DEBIT_NOTE → PURCHASE_DEBIT_NOTE. [src:javasdk/…/IntercompanyProcessingService.java#L110]
- 2026-09-05 — Unique settings screen: Knock-Off Settings (`KNOCK_OFF_BY_{SALES_ORDER,DELIVERY_ORDER,JOBSHEET}`, `KNOCK_OFF_FOR_*`, `ENABLE_AUTO_SCAN`, `ENABLE_VALIDATE_SERIAL`). Default Selection has only branch, location and 11-tab order. [src:…/settings-container/knock-off-settings/] [src:…/default-settings.component.{html,ts}]
- 2026-09-05 — 163 shared-screen toggles apply; distinctive ones: `ENABLE_PRINT_FINAL_GEN_DOC_ONLY`, `LOCK_PURCHASER_TO_CURRENT_USER`, `DISALLOW_LINE_ITEM_EDIT`, `ENABLE_SELECT_MODE`, `HIDE_VALIDITY_DATE`, `HIDE_DEBIT_TERMS`, External Documents hide group; the shared screen also shows purchase-order menu toggles that this applet has no menus for. [src:field-configuration.component.html ∩ applet-settings.model.ts]
- 2026-09-05 — Menus: Internal Sales Debit Note, Line Items, File Import, Intercompany; `HIDE_FILE_IMPORT_MENU` / `HIDE_INTERCOMPANY_MENU` overridable by `SHOW_*` perms not registered (35 defs). [src:…/menu-items.ts] [src:…/app.component.ts#L33-L79] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Commit-log (anonymised): duplicate reference check; clone button + setting + permission; sales-agent autofill; ALLOW_EDIT_SALES_AGENT_FINAL added; grid no longer resets after save/final; child views mutating global column mode fixed; price auto-calculation from tax-inclusive figure. [src:git-log]
- 2026-09-05 — Old wiki page referenced screenshot `Internal_Sales_Debit_Note_14a7809355…png` which is not in static/images; dropped. [src:static/images/internal-sales-debit-note-applet/]

## How it connects

- **internal-sales-credit-note-applet** — mirror-image adjustment; often contra'd against each other.
- **internal-purchase-debit-note-applet** — intercompany mirror.
- **internal-sales-invoice-applet** — original document for e-invoice reference.

## Open questions

- Whether the DELETED duplicate registry row should be purged (same code, different name) — parity tooling should key on code + status.

## Wiki impact

- `purchase-workflow/internal-purchase-debit-note-applet` should list this applet as its intercompany source.
