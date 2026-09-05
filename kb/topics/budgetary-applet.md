---
topic: budgetary-applet
aliases: [budget applet, budgetary module, votebook, budget register, budget virement, budget adjustment, budget item, budget category group, budget report, budget sub line]
applets: [budgetaryApplet, internalPurchaseInvoiceApplet, salesInvoiceApplet, internalPurchaseOrderApplet, developer-sysadmin-applet]
modules: [financial-accounting]
related: [internal-purchase-invoice-applet, internal-sales-invoice-applet, internal-purchase-order-applet, developer-sysadmin-applet, job-processors, profit-center]
wiki:
  - content/en/applets/finance/budgetary-applet.md
  - content/en/applets/finance/budget-applet.md
  - content/en/modules/budgetary.md
  - content/en/modules-v2/financial-accounting/_index.md
status: growing
updated: 2026-09-05
---

# Budgetary Applet (votebooks, registers, virements, adjustments)

The Budgetary Applet sets up budget control for a tenant: budget items classified through up to eleven category slots, profit centres as owners, and votebooks that group items for a fiscal year. Opening a fiscal year creates one budget register per item per month. Virements move allocation between registers, adjustments raise or lower one register, and finalised purchase/sales invoices that carry budget details consume registers. Nothing in the flow posts a journal or blocks overspending.

## Facts

- 2026-09-05 — Registry: code `budgetaryApplet`, name "Budgetary Applet", type TNT-ADMIN, ACTIVE; documentation_url `/applets/finance/budgetary-applet/`. There is no registry row for "Budget Applet" (the 1,495-line `budget-applet.md`). [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo `blg-applet-wavelet-budgetary-applet` (Angular, `micro-fe/projects/wavelet-erp/applets/budgetary-applet`, main at `2bd6097`). Route root `applet/tnt/wavelet/erp/budget-applet`. Menu: Votebook, Virement, Adjustment, Profit Center, Categories, Category Groups, Items, Report. [src:blg-applet-wavelet-budgetary-applet/…/models/menu-items.ts] [src:…/app.routing.ts]
- 2026-09-05 — The only persisted, consumed setting is `ITEM_CATEGORY_CATEGORY_GROUP_SETTINGS_LIST` (11 slots × {categoryGroupGuid, required}) on Settings → Field Settings, saved into `bl_applet_ext` `APPLET_SETTINGS` through the shared session effect; `categoryGroupGuid` filters the Category n dropdown on items, `required` is never read. [src:…/settings-container/field-configuration/field-configuration.component.ts] [src:blg-shared-utilities/modules/session/session-controller/effects/session.effects.ts#L353-L375] [src:…/shared/budget-item-category-slots/budget-item-category-slots.component.ts]
- 2026-09-05 — Default Selection (applet and personal) and General Settings (`DEFAULT_GL_CODE`) screens store nothing usable: input never bound / SAVE only logs / route without menu and no reader. [src:…/settings-container/default-settings/default-settings.component.ts] [src:…/settings-container/general-settings/general-settings.component.ts] [src:…/personalization-container/personal-default-settings/personal-default-settings.component.ts]
- 2026-09-05 — No client-side permission definitions (0 rows in `bl_applet_client_side_perm_dfn` for `budgetaryApplet`, no constants in the repo). Server side: `API_TNT_BUDGET_{VOTEBOOK,LINE,VOTEBOOK_ITEM_LINK,FISCAL_YEAR,REGISTER,GENERIC_DOCUMENT,CATEGORY,CATEGORY_GRP}_{CREATE,READ,UPDATE,DELETE,ADMIN,OWNER}`. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:blg-akaun-platform-java/akaun-api/…/controller/tenant/dm/Budget*.java]
- 2026-09-05 — Budget item categories are eleven fixed slots (`bl_fi_budget_item.category_hdr_0_guid…category_hdr_10_guid` + `category_n_code`), one category per slot, each slot bound to a category group by Field Settings — not a many-to-many link. [src:blg-akaun-platform-java/client-sdk/…/table/bl_fi_budget_item.java] [src:gh:bigledger/blg-applet-wavelet-budgetary-applet#12]
- 2026-09-05 — Fiscal year create generates monthly periods client-side (`MMMM YYYY`) and the backend queues `BUDGET_FISCAL_YEAR_REGISTER_PROCESSOR`, which creates one register per linked item per period (currency hard-coded `MYR`, all amounts 0, account type and profit centre copied from the votebook; existing year/period/item/votebook register skipped). [src:…/fiscal-year-create/fiscal-year-create.component.ts#L215-L265] [src:blg-akaun-platform-java/akaun-api/…/jobProcessor/BudgetFiscalYearRegisterProcessor.java] [src:blg-akaun-platform-java/javasdk/…/domain/budget/BudgetRegisterService.java#createMultipleFromSingleWithCustomLogic]
- 2026-09-05 — Linking an existing item to a votebook posts a budget line and `POST …/budget/registers/custom/backoffice-ep` per loaded fiscal year; the *Create Item* path posts item + line only (no registers). Deleting the line queues `BUDGET_REGISTER_DELETION_PROCESSOR`. [src:…/votebook-container/item-listing/add-item/add-item.component.ts#L270-L345] [src:blg-akaun-platform-java/javasdk/…/domain/budget/BudgetLineService.java]
- 2026-09-05 — Virement/adjustment are `bl_fi_budget_generic_doc_hdr` (`txn_type` VIREMENT/ADJUSTMENT), `posting_status` null until FINAL; the controller rejects FINAL→FINAL, VOID→VOID and draft→VOID with 403; only FINAL queues `BUDGET_GEN_DOC_PRIMARY_PROCESSOR`; no VOID button in the UI; VOID reverses nothing. [src:blg-akaun-platform-java/akaun-api/…/controller/tenant/dm/BudgetGenericDocumentController.java#L166-L215] [src:blg-akaun-platform-java/javasdk/…/domain/budget/BudgetGenericDocumentService.java#updatePostingStatus]
- 2026-09-05 — Register txn line signum: from-register −amount (adjustment IN: +amount), to-register +amount (`BudgetGenDocRegisterTxnLineProcessor.mapTxnLine`). Register update: VIREMENT/ADJUSTMENT/TRANSFER → `latest_allocated += amount`; OPENING → initial = latest = balance = amount; anything else → `actual_used += amount`, `latest_used = amount`; balance = latest_allocated − actual_used (`BudgetTxnLineUpdateRegisterProcessor`). Nothing creates OPENING, so the initial allocation is an Adjust In. [src:blg-akaun-platform-java/akaun-api/…/jobProcessor/BudgetGenDocRegisterTxnLineProcessor.java] [src:blg-akaun-platform-java/akaun-api/…/jobProcessor/BudgetTxnLineUpdateRegisterProcessor.java#L50-L75]
- 2026-09-05 — `FI_GEN_DOC_BUDGET_REGISTER_TRANSACTION_LINE_PROCESSOR` consumes registers only for `INTERNAL_SALES_INVOICE` and `INTERNAL_PURCHASE_INVOICE` (per line `budget_register_guid` or per `bl_fi_generic_doc_budget_sub_line`), sets `posting_budget = POSTED`; purchase orders carry the fields but are filtered out. Subscriptions come from the applet-trigger templates/configuration (`JobProcessorService.getSubscriberJobProcessors`); no seed found in the repo. [src:blg-akaun-platform-java/akaun-api/…/jobProcessor/FiGenDocBudgetRegisterTxnLineProcessor.java] [src:blg-akaun-platform-java/javasdk/…/domain/jobProcessor/JobProcessorService.java#L538]
- 2026-09-05 — No server-side budget availability check anywhere (sub-line DCO validates keys/nulls only; no client validator on virement amount). The shared budget sub-line editor only colours the cell and shows "Amount exceeds register balance by …". `reserved_amt` is never written. [src:blg-akaun-platform-java/javasdk/…/validator/GenericDocumentBudgetSubLineDataConsistencyObject.java] [src:blg-shared-utilities/utilities/budget-subline-editor/budget-subline-editor.component.ts#L76-L95]
- 2026-09-05 — Document applets show budget fields under their own `SHOW_BUDGET` setting (PO, PI, SI item-details and the shared gen-doc simplified UI). [src:blg-shared-utilities/modules/gen-doc-simplified-ui/gen-doc-simplified-ui.component.html#L483] [src:blg-applet-wavelet-internal-purchase-invoice-applet/…/line-item-add/item-details/item-details.component.html#L26]
- 2026-09-05 — Manual txn line (Report → create) has `txn_type = MANUAL` and no `budget_register_guid`; the register-update job throws "Budget Register Does not exist", so the line is listed but no register moves. [src:…/report-container/budget-txn-line-create/budget-txn-line-create.component.ts#L205-L235] [src:blg-akaun-platform-java/akaun-api/…/jobProcessor/BudgetTxnLineUpdateRegisterProcessor.java#L76]
- 2026-09-05 — Budget Report binds both "Initial Amount Allocated" and "Latest Amount Allocated" to `latest_allocated_amt`. [src:…/report-container/report-listing/report-listing.component.ts#L242-L250]
- 2026-09-05 — Category Group "Type" and Category "Search Filter"/parent controls are shown but their save mappings are commented out. [src:…/group-category-container/group-category-create/item-cat-create.component.ts#L129] [src:…/category-container/item-category-create/item-cat-create.component.ts#L308-L328]
- 2026-09-05 — July 2026 fixes: virement line update `CREATED_DATE_IS_NULL` (#10), category image/add buttons (#5, #7, #9), Items tab on Category (#6), Permission Wizard crash and missing route (#8), manual txn-line create wired (#9 branch). [src:gh:bigledger/blg-applet-wavelet-budgetary-applet#5] [src:gh:…#6] [src:gh:…#7] [src:gh:…#8] [src:gh:…#9] [src:gh:…#10]

## How it connects

- **internal-purchase-invoice-applet / internal-sales-invoice-applet** — the only documents whose FINAL writes `bl_fi_budget_register_txn_line` and moves `actual_used_amt`; needs `SHOW_BUDGET` on and the FI_GEN_DOC budget processor subscribed.
- **internal-purchase-order-applet** — shows the same budget fields and sub-line editor but never consumes a register (processor filter), so "commitment" is not recorded.
- **developer-sysadmin-applet / job-processors** — the three budget processors run only when subscribed; failed jobs (missing register) are visible there.
- **profit-center** — `bl_fi_mst_profit_center` is a shared master; the votebook's profit centre is copied onto every register and drives the Budget Report grouping.

## Open questions

- Which applet is the canonical owner of profit centres (this applet creates them; the Organisation v3 applet repo has no profit-centre screen)?
- Is the `bl_fi_budget_register_approval_*` / `BudgetReservationHdr` backend (approval flow, reserved amounts) used by any UI at all? No applet repo references it.
- `budget_default_side` / `budget_account_type` on votebook and register: never set from the applet UI — dead columns or set elsewhere?

## Wiki impact

- `content/en/applets/finance/budget-applet.md` (no registry row) describes "automatic distribution of an initial amount across periods", "budget validation fails" and approval workflows that do not exist in code; it should be retired in favour of `budgetary-applet.md` (F-0079).
- `content/en/modules/budgetary.md` and `content/en/modules-v2/financial-accounting/_index.md` claim overspend blocking / "budget validation"; the code only warns.
- `content/en/applets/purchase-workflow/internal-purchase-order-applet.md` should state that PO budget fields are informational (processor skips POs); PI and SI pages should document `SHOW_BUDGET` and the budget sub-line tab.
