---
topic: chart-of-accounts
aliases: [COA, GL codes, default GL codes, fiscal period lock]
applets: [chartOfAccountApplet]
modules: [core, financial-accounting]
related: [gl-posting, journal-entry, financial-reports, organisation, cashbook, doc-item-maintenance, tax-configuration]
wiki:
  - content/en/applets/master-data/chart-of-account-applet.md
  - content/en/guides/accounting-guides/chart-of-accounts-setup.md
status: growing
updated: 2026-09-05
---

# Chart of Accounts

GL sections → categories → codes; per-company default GL code mapping; ledgers, sets of books; fiscal years and period locks.

## Facts

- 2026-09-05 — Registry: `chartOfAccountApplet` "Chart of Account", TNT-ADMIN, ACTIVE. No client-side permission definitions registered in akaun_master. [src:planning/private/registry-applets-2026-09-05.tsv] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Menus: Chart of Account, GL Section, GL Category, Import GL Category, GL Code, Import GL Code, Companies, Set Of Books, Fiscal Year, GL Code Merge, GL Code Create Item, Audit Trail; settings General Settings / Field Settings / Default Selection. [src:blg-applet-wavelet-chart-of-account-applet/.../models/menu-items.ts]
- 2026-09-05 — General Settings: COA_DEFAULT_GL_CODE (JSON textarea) + SHOW_INVENTORY/RAW_MATERIAL/WIP/FINISHED_GOODS/NSTI_STOCK_VALUE toggles. Default Selection: CHART_OF_ACCOUNT_DETAILS_TAB_ORDER, DEFAULT_BRANCH, DEFAULT_LOCATION. Field Settings shows 8 toggles with no form binding (no effect). [src:.../general-settings.component.ts] [src:.../default-settings.component.ts] [src:.../field-configuration.component.html]
- 2026-09-05 — Company Default GL Codes: 41 keys across tabs General (RETAINED_EARNING, PROFIT_LOSS, NSTI, FIXED_ASSET_REGISTER, ROUNDING, SETTLEMENT_CHARGES), Entity (DEBTOR*, CREDITOR*, MERCHANT_RECEIVABLE/PAYABLE, EMPLOYEE_OTHER_PAYABLE), Sales, Purchase, Stock (STOCK_ADJUSTMENT, RESET_MA, STOCK_BALANCE[_RAW/_WIP/_FG/_NSTI], COGS[_RAW/_WIP/_FG/_NSTI], INVENTORY_NOT_INVOICED), Forex, Consignment. [src:.../company-container/default-glcode/default-glcode.component.html]
- 2026-09-05 — Fiscal period closing statuses OPEN / LOCK_GL / LOCK_TXN / LOCK_ALL; fiscal year status ACTIVE / CLOSED. [src:.../fiscal-year-edit.component.ts]
- 2026-09-05 — Enforcement: JournalController blocks manual journal creation when the period is LOCK_GL or LOCK_ALL (HTTP 403 FISCAL_PERIOD_LOCKED "The selected date falls within a locked fiscal period"), except journals with auto_flag = AUTO. GenericDocumentService blocks generic documents when LOCK_TXN or LOCK_ALL. LOCK_GL does not stop documents; LOCK_TXN does not stop manual journals. [src:blg-akaun-platform-java/akaun-api/.../JournalController.java L123-135] [src:.../GenericDocumentService.java L1681-1689]
- 2026-09-05 — GL code create: code and name required (max 255); backend GlcodeDataConsistencyObject: chart and category must exist, unique constraint on code. Ledger types PRIMARY / SECONDARY / CONSOLIDATED. [src:.../gl-code-create.component.ts] [src:javasdk/.../GlcodeDataConsistencyObject.java]

## How it connects

- **gl-posting** — a document whose needed default GL code is unmapped saves without a journal (existing wiki claim; consistent with default-GL lookup design, not re-verified in Java this pass).
- **journal-entry** — LOCK_GL/LOCK_ALL gate manual journals; AUTO journals bypass.
- **financial-reports** — SHOW_*_STOCK_VALUE toggles decide closing-stock lines.
- **organisation** — company must be assigned a COA there before it shows under Companies.

## Open questions

- Exact behaviour of COA_DEFAULT_GL_CODE JSON (which consumer reads it) — not traced in Java this pass.
- Whether "document saves but does not post when default GL code is missing" is universal or per document type.

## Wiki impact

- general-ledger-applet / ledger-and-journal-applet (lane finance): state the LOCK_GL rule and the AUTO-journal exception.
- financial-report-applet: mention SHOW_*_STOCK_VALUE toggles live in Chart of Account > General Settings.
- organisation-applet (lane 4): state that assigning a COA to a company is what makes it appear in Chart of Account > Companies.
