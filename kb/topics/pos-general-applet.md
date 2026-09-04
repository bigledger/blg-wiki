---
topic: pos-general-applet
aliases: [POS General, cash bill, cashbill, point of sale, INTERNAL_SALES_CASHBILL, retail checkout]
applets: [posGeneral]
modules: [pos, inventory, financial-accounting, membership, e-invoice]
related: [internal-sales-invoice-applet, internal-sales-return-applet, cashbook, bank-reconciliation, customer-maintenance, doc-item-maintenance, stock-availability, e-invoice, daily-cashier-report-applet, membership-admin-applet, non-stock-and-trade-in-applet]
wiki:
  - content/en/applets/sales-workflow/pos-general-applet.md
status: growing
updated: 2026-09-05
---

# POS General (cash bill)

The retail checkout applet. A cash bill (`INTERNAL_SALES_CASHBILL`) is a sales invoice settled on the spot: amount signum +1, quantity signum −1, settlement lines (`STL_MTHD`) post straight to the cashbook. Supervisors get Z Report, Cashier Collection, settlement adjustment, serial swap and sell-below-price approval; the applet can run offline with a local POS Agent.

## Facts

- 2026-09-05 — Registry code `posGeneral`, name "POS General", TNT-USER, ACTIVE; documentation_url already points at the wiki page [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Repo `blg-applet-wavelet-pos-general-applet`, applet at `micro-fe/projects/wavelet-erp/applets/pos-general-applet`; personalization screen shows "Version 3.79" [src:…/personalization-container/personalization-container.component.html]
- 2026-09-05 — Signums: amount +1, quantity −1 [src:javasdk/…/InternalSalesCashbillDataConsistencyObject.java]; trade-in lines use the purchase trade-in type (amount −1, quantity +1) [src:javasdk/…/InternalPurchaseTradeInDataConsistencyObject.java] [src:…/item-container/item-add-main/item-add-main.component.ts#L855]
- 2026-09-05 — Journal uses the `SALES` handler because the handler key is `serverDocType.contains("SALES")` [src:javasdk/…/JournalPostingService.java#L76]; return lines inside the bill keep `INTERNAL_SALES_RETURN` and use the `SALES_RETURN` txn code [src:javasdk/…/JournalPostingService.java#L151]
- 2026-09-05 — FINAL-only checks for cash bills: sum(PNS) must equal sum(STL_MTHD)+|contra| (`GENERIC_DOC_PNS_AND_STL_MTHD_DOES_NOT_MATCH`); bill location must equal the branch's `location_guid` (`GENERIC_DOC_BRANCH_DEFAULT_LOCATION_DOES_NOT_MATCH`); blacklisted customers rejected (`ENTITY_BLACKLISTED`, also for invoice / order / outbound DO) [src:javasdk/…/GenericDocumentService.java#L1639-L1656,#L3309,#L3339,#L3837]
- 2026-09-05 — A zero-amount cash bill gets a zero `STL_MTHD` line generated automatically; a bill with a member gets missing reward / redeem point lines generated on update using the `posGeneral` applet's settings [src:javasdk/…/GenericDocumentService.java#L768-L790,#L2942,#L4003]
- 2026-09-05 — Spending-limit lines are checked only for cash bills [src:javasdk/…/EntitySpendingLimitLineService.java#L54]; coupons and commission-scheme "sales invoice" rules include cash bills [src:javasdk/…/CouponService.java#L154] [src:javasdk/…/CommissionSchemeGenericRuleNode.java#L111]
- 2026-09-05 — e-Invoice: cash bill maps to type 01 Invoice; consolidated-by-branch processor handles cash bills [src:javasdk/…/MyEInvoiceToIRBProcessorService.java#L944] [src:javasdk/…/ConsolidatedEInvoiceProcessorByBranchService.java#L197]
- 2026-09-05 — Z Report reads FINAL bills only: collections per cashier by settlement method, sales by category, discounts vs member-point discounts, tax, void count, draft count, items sold, session open/close/cash-in/cash-out, contra [src:javasdk/…/ZReportUow.java]
- 2026-09-05 — The applet's `applet-settings.model.ts` declares only 38 keys, but the code reads ~200 master-settings keys via `master?.X`; 155 of them have a toggle on the shared Field Configuration screen (POS Settings panel ≈70, Auto UI, listing, lines, line permission, credit card, email) [src:blg-shared-utilities/…/field-configuration.component.html#L4932-L5512] — the model-based intersection in `applet-scan.sh` under-counts (11) for this applet
- 2026-09-05 — Applet-own settings screens: Default Selection (customer, pricing scheme, pricebook + auto points, entity type, currency, rounding / group-discount / points-discount adjustment items), Branch Settings (details, default settlement method, item category filter, menu list, pricing scheme priority, printable header/footer/image), Settlement Method Settings (code, name, cashbook, type), Device Settings (device MAC via POS Agent; card terminals CardBiz/Revenue, ECR/WIFI), Drawer, Return Remarks, Free Gift (stored as pricebook type `POS_FREE_GIFT`), Email Template; Personalization: per-user defaults and Offline Settings [src:…/components/settings-container/**] [src:…/components/personalization-container/**]
- 2026-09-05 — Legacy `settings/pos-settings` route exists but is not in `settingItems` [src:…/app.routing.ts#L109] [src:…/models/menu-items.ts]
- 2026-09-05 — Menu gating pairs: Approval = `POS_SHOW_APPROVAL` setting AND `ALLOW_APPROVE_SELL_BELOW_PRICE` perm; Settlement Adjustment = `ENABLE_EDIT_SETTLEMENT_FINAL` AND `POS_EDIT_SETTLEMENT_FINAL`; Swap Serial = `POS_SWAP_SERIAL_FINAL` AND `POS_SWAP_SERIAL_NUMBER_FINAL`; Z Report / Cashier Collection / Audit Trail = `HIDE_*` unless `POS_SHOW_*` perm; Session menu appears with `SESSION_FLOAT_CONTROL` [src:…/app.component.ts#L232-L310]
- 2026-09-05 — 31 ACTIVE client-side perms registered (POS_* + ALLOW_SELL_*); `POS_SHOW_Z_REPORT`, `POS_SHOW_CASHIER_COLECTION_REPORT`, `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH` and `ALLOW_<TYPE>_ITEM_PRICE_EDIT` are read but not registered; `POS_CLOSE_SESSION`, `POS_FLOAT_CASH_IN_OUT`, `POS_ATTACH_DRAWER` are registered but not read by the UI [src:akaun_master.bl_applet_client_side_perm_dfn] [src:…/components/**]
- 2026-09-05 — Backdate limited to 7 days (`minBackdate = today − 7`) [src:…/pos-container/others/others.component.ts#L101]; high-value e-Invoice validation threshold 10,000 [src:…/pos-container/e-invoice/submission/submission.component.ts#L132]
- 2026-09-05 — Copy From accepts `INTERNAL_JOBSHEET`, `INTERNAL_SALES_ORDER`, `INTERNAL_SALES_INVOICE` by document number [src:…/pos-container/copy-from/copy-from.component.html]
- 2026-09-05 — Applet repo has 7 issues (free gift #11, jobsheet points #12, listing reset filter #26, migration chores); real failure modes come from commit subjects referencing customer support repos: double-click double FINAL (fixed with exhaustMap), card-terminal amount validation, backdate limit, bundle with no child stock, duplicate serial, voucher/coupon daily limits, bank-recon unreconcile error surfaced on update/FINAL, offline sync [src:git-log:blg-applet-wavelet-pos-general-applet]

## How it connects

- **internal-sales-invoice-applet** — same `SALES` journal handler and the same reward-point generation path; invoice is the credit-terms sibling.
- **internal-sales-return-applet** — a POS return is lines on the cash bill, not a separate document; `SALES_RETURN` txn code either way.
- **cashbook** — every settlement method must carry a cashbook + GL; missing → `MISSING_CASHBOOK` / `MISSING_GL_CODE: STL_MTHD`.
- **bank-reconciliation** — reconciled settlement lines cause an unreconcile error when the bill is updated or finalised again.
- **customer-maintenance** — blacklist (credit limit / term) blocks FINAL; spending-limit lines apply to cash bills only.
- **stock-availability** — cash bills are counted with invoices and returns in the recent-sales quantity; `SHOW_ITEM_STOCK_BALANCE` validates balance at FINAL.
- **e-invoice** — type 01; consolidated by branch.
- **daily-cashier-report-applet** — Z Report and Cashier Collection use the same `API_TNT_DM_ERP_*` permissions.

## Open questions

- Are `POS_CLOSE_SESSION`, `POS_FLOAT_CASH_IN_OUT`, `POS_ATTACH_DRAWER` checked server-side, or are they dead registry rows?
- Why do `POS_SHOW_Z_REPORT` / `POS_SHOW_CASHIER_COLECTION_REPORT` exist in code but not in the registry while `POS_SHOW_AUDIT_TRAIL_REPORT` does?

## Wiki impact

- `sales-workflow/pos-general-applet` — rewritten to the standard (done 2026-09-05).
- `master-data/organisation-applet` — should say the branch **default location** is enforced at cash-bill FINAL.
- `master-data/customer-applet` — should mention credit-limit / credit-term blacklist blocks POS, invoice, order and outbound DO FINAL; spending limits apply to cash bills.
- `finance/bank-reconciliation-applet` — should mention the unreconcile error surfaced when a reconciled POS settlement line's bill is updated.
- `sales-workflow/daily-cashier-report-applet` (lane 1) — link back; the Z Report composition is documented here.
