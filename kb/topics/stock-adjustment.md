---
topic: stock-adjustment
aliases: [adjust-in, adjust-out, reset MA, moving average reset, serial number adjustment]
applets: [erp_stock_adjustment_applet]
modules: [inventory, financial-accounting]
related: [stock-availability, stock-balance, stock-take, gl-posting, chart-of-accounts, moving-average-cost, serial-number-tracking]
wiki:
  - content/en/applets/inventory-workflow/stock-adjustment-applet.md
status: growing
updated: 2026-09-05
---

# Stock Adjustment

Adjust-in / adjust-out documents that correct location stock balances and post a journal; plus serial/batch adjustments and moving-average cost resets.

## Facts

- 2026-09-05 — Registry: `erp_stock_adjustment_applet` "Stock Adjustment (Internal)", TNT-USER, ACTIVE; documentation_url → /applets/inventory-workflow/internal-stock-adjustment-applet/ (page alias). Current repo blg-applet-wavelet-stock-adjustment-applet (last commit 2026-08-24); blg-applet-akaun-platform-stock-adjustment-applet is a 2025-11 split with no later commits. [src:planning/private/registry-applets-2026-09-05.tsv] [src:git log both repos]
- 2026-09-05 — Menus: Stock Adjustment, Stock Adjustment By Batch Item, Serial Number Adjustment (state serial-data-fix), File Import, Reset MA, Reset MA By Location, File Import Reset MA, Stock Adjustment by Reset MA, Audit Trail; "Stock Adjustment By Serial Item" commented out. [src:.../models/menu-items.ts]
- 2026-09-05 — Settings keys (applet-settings.model.ts): DEFAULT_BRANCH/LOCATION/COMPANY, INCLUDE_DIMENSION/PROFIT_CENTER/PROJECT/SEGMENT/SST/WHT, PRINTABLE, DISABLE_GEN_DOC_LISTING, HIDE_GENDOC_SAVE_BUTTON, HIDE_GENDOC_FINAL_BUTTON, HIDE_CREATED_BY_DETAILS, HIDE_SERIAL_NUMBER_ADJUSTMENT_MENU, HIDE_BATCH_NUMBER_ADJUSTMENT_MENU, HIDE_SERIAL_DATA_FIX_MENU, HIDE_FILE_IMPORT_MENU, HIDE_RESET_MA_MENU, HIDE_FILE_IMPORT_RESET_MA_MENU, HIDE_STOCK_ADJUSTMENT_RESET_MA_MENU, DEFAULT_TOGGLE_COLUMN, DEFAULT_ORIENTATION, VERTICAL_ORIENTATION, DEFAULT_ADJUSTMENT_METHOD, HIDE_AMOUNT_TXN_MAIN_LISTING, HIDE_UNIT_PRICE_TXN, HIDE_CLONE_BUTTON, RESET_MA_DATE_NOT_EDITABLE. The applet's own settings screens (field-configuration) are unbound toggles; the keys are edited through the platform settings component (`<app-settings>`). [src:.../models/applet-settings.model.ts] [src:.../app.component.ts L100-106] [src:.../settings-container/settings-container.component.html]
- 2026-09-05 — Permissions (11): SHOW_SERIAL_ADJUSTMENT_MENU, SHOW_BATCH_ADJUSTMENT_MENU, SHOW_SERIAL_DATA_FIX_MENU, SHOW_SERIAL_NUMBER_ADJUSTMENT_TAB, SHOW_FILE_IMPORT_MENU, SHOW_RESET_MA_MENU, SHOW_FILE_IMPORT_RESET_MA_MENU, SHOW_STOCK_ADJUSTMENT_RESET_MA_MENU, SHOW_UNIT_PRICE_TXN, SHOW_AMOUNT_TXN_MAIN_LISTING, SHOW_TRANSACTION_DATE. Menu shown if permission OR !HIDE setting. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:.../app.component.ts]
- 2026-09-05 — Line field model: itemCode, itemName, invType, glCode, baseUOM, stockBalanceQty, adjustmentQty, adjust (Adjust-In/Adjust-Out), currentCompanyStockBalance, currentLocationStockBalance, systemStockBalance, reflectedStockBalance, baseOnCost (cost_ma_price, cost_fifo_price, cost_lifo_price, cost_last_purchase_company), costMaPrice, quantity, unitPriceNet, remarks; batch tab batch_no/qty/container_measure/container_qty/issue_date/expiry_date; bin tab bin_code/qty; serial tab Listing/Scan/Import. [src:.../stock-adjustment-item-details/ field model]
- 2026-09-05 — Posting: JournalPostingTypeHandler maps INTERNAL_STOCK_ADJUSTMENT → PNS:STOCK_ADJUSTMENT, PNS_STOCK:COGS. JournalPostingService: for INTERNAL_STOCK_ADJUSTMENT every line posts (even zero signum); quantity_base < 0 → debit |amount|, else credit; line guid_glcode (then header guid_glcode, then item-company GL link, then default) resolves the account via company sub-ledger. [src:blg-akaun-platform-java/javasdk/.../JournalPostingTypeHandler.java L104-109] [src:.../JournalPostingService.java L93-160]
- 2026-09-05 — Statuses seen in GenericDocumentService: FINAL and DISCARDED (posting_status / status); fiscal lock LOCK_TXN/LOCK_ALL applies. VOID not found in that service for generic docs this pass. [src:.../GenericDocumentService.java L705, L741, L1681-1689]
- 2026-09-05 — Issues: user cannot FINAL after choosing GL code (gt#9495, 2026-08); request to disable Serial Number Adjustment tab for non-admins (gt#8734); item code missing from line selection (gt#6940); serial change not reflected in stock movement report (gt#9265); costing investigation for INTERNAL_STOCK_ADJUSTMENT (gt#5598). [src:gh:bigledger/blg-int-general-task#9495] [src:gh:bigledger/blg-int-general-task#8734] [src:gh:bigledger/blg-int-general-task#6940] [src:gh:bigledger/blg-int-general-task#9265] [src:gh:bigledger/blg-int-general-task#5598]

## How it connects

- **gl-posting** — the only inventory document whose journal side can be chosen per line (glCode field); default STOCK_ADJUSTMENT.
- **moving-average-cost** — Reset MA family rewrites cost_ma_price; Base On decides the unit price used on the journal.
- **stock-availability** — Adj Qty/Available reflect the finalised adjustment immediately.

## Open questions

- Whether VOID is a valid transition for stock adjustments (previous wiki text said yes; not confirmed in code).
- The stock-side account: handler maps PNS_STOCK to COGS while the stock balance account is STOCK_BALANCE — confirm which account the stock side actually hits for adjustments.
- Where exactly the Application Settings keys are edited (platform `<app-settings>` component from blg-akaun-ng-lib) — not enumerable from this repo.

## Wiki impact

- stock-take-applet (lane 4): state that variances are posted as stock adjustments and link here.
- chart-of-account-applet (lane 4, done): already lists STOCK_ADJUSTMENT / COGS / STOCK_BALANCE default keys.
- general-ledger-applet (finance lane): note stock adjustment journals debit/credit rule.
