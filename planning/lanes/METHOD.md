# Lane method notes — what the first runs learned (read before your next page)

Three lanes independently converged on the same facts on 2026-09-05. Use them; do not rediscover.

1. **Discover where settings live before counting them — it differs by applet family.**
   Read `app.routing.ts` and the settings container first and classify: *shared*
   `FieldConfigurationComponent` in `/home/marketing/repos/refs/blg-shared-utilities` (the big
   document applets: sales/purchase invoice, order, notes — gated by `sessionStorage.appletCode`),
   *applet-local* field-configuration components (Chart of Account, Cashbook, Stock Availability,
   Financial Report, Purchase Report, Sales Report), *no settings model at all* (CP Commerce Admin —
   per-website tabs), *runtime reads without a model* (POS General reads `master?.X` directly: 155
   real keys vs 11 the scan reports). `kb/tools/applet-scan.sh` is a starting point for the shared
   family only; for the others grep every settings read in the applet and intersect with rendered
   controls. Document a key only if it is declared/rendered/persisted/consumed (standard §4).
2. **`HIDE_*` settings pair with `SHOW_*` client-side permissions** (`updateMenuItem(state,
   !SHOW && HIDE)`): a tenant-wide hide can be reopened per role — but only if the `SHOW_*` code
   is seeded in `bl_applet_client_side_perm_dfn`, which for most applets it is not. Word the
   permissions section accordingly ("checked in code; not seeded in the registry" — F-0044).
3. **Posting is not an applet setting.** FINAL behaviour is fixed by the backend's
   `*DataConsistencyObject` quantity/amount signums, `JournalPostingTypeHandler`, and the
   company's `posting_final_json` include/exclude list. Applet-side levers are validation flags
   and `FINAL_STATUS_GUID` only. Find the signums in
   `refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/`.
4. **Real failure modes are stock-location, rate/rounding and missing default GL codes**
   (`MISSING_DEFAULT_GL_CODE`, `MISSING_CASHBOOK`, `MISSING_GL_CODE: STL_MTHD [code]`) — mine
   issues for these, not for accounting theory.
5. **Codex review of run 1 (planning/reviews/2026-09-05-gpt-5.6-sol-lane-run-1-review.md) found
   two dangerous inversions in our own rewrites**: "missing default GL → saves without journal"
   (backend actually THROWS `MISSING_DEFAULT_GL_CODE`, JournalPostingService:339,412) and
   "`VALIDATE_STOCK_ON_FINALIZE` is a backend check" (it is a client-side confirm dialog). Hence
   standard §6: every must/blocks/rejects claim cites the backend throw; every default cites the UI
   initial value. GL precedence is line GL → header GL → item-company link → company default.
6. **Direction claims in old pages are often inverted.** Trust the signum constants over the
   existing prose, and record every reversal in findings.md so the guides get corrected too.
7. **Four-proof pitfalls found in the PI rework (lane 2, run 5):** (a) checkboxes *nested* inside
   gated `*ngIf` blocks are rendered even though the nearest-`*ngIf` heuristic says no; (b) keys
   consumed through indirection (`panel.expandSetting`, key lists) are not found by grepping the
   key name — grep the accessor; (c) a key can pass all four proofs through *another* listing's
   Default Selection (e.g. `PRINTABLE`). Also: the shared screen's `shouldHideSetting()` pre-selects
   per-applet hidden defaults, but the document form reads stored values — a fresh tenant sees
   everything until the first Save of Application Settings persists them. Document that failure mode.
8. **The inline gear is a second settings-rendering path (lane 3, run 4).** `app-applet-settings-toggle`
   from blg-shared-utilities is embedded per screen with explicit `appletSettingsKeys` (BPO: 15
   screens; PDN: 23). Keys there are *rendered* even when the shared Application Settings screen
   has no control for that applet code. The "rendered" proof = shared screen ∪ applet-local
   screens ∪ every gear key list. Earlier "read but no control" lists are suspect wherever a gear
   is embedded — check before trusting them.
9. **Purchase-side GL resolution** is line → header → item-company link → company default; only
   the creditor mapping throws `MISSING_DEFAULT_GL_CODE`. An unresolvable purchase/tax line is
   silently omitted (JournalPostingService ~L236/L271) and FINAL then fails with
   `TOTAL_DEBITS_AND_TOTAL_CREDITS_NOT_BALANCES` — that is the troubleshooting entry to write.
10. **Tab-hide sections are keyed by registry code (lane 4, run 10).** `FieldConfigurationComponent.getTabValue()`
    renders tab-hide toggles only when `sessionStorage.appletCode` (= registry code) matches its map.
    `applet-scan.sh` ignores that map (reports 0 tab hides where 9 render). Where an applet's
    `main.ts` dev-only code differs from the registry code (e.g. `internal-consignment-gin-applet`
    vs `internalConsignmentGINApplet`), the tab toggles never render on a live tenant — document
    them as "read without control" and file a bug.
11. **Whether FINAL creates open-queue rows is a COMPANY setting** (lane 3, run 9): `GenericDocLineOpenQueueProcessor`
    reads `bl_fi_comp_gendoc_flow_config` (Organisation → Company → Knock Off Configuration). Without an
    enabled source→target row the downstream document cannot find the order; `posting_ko` records it;
    the watchdog / `data-fix-missing-queue` repair it. Lead every "downstream can't find my document"
    troubleshooting row with this. Also: a tree-walking enclosing-`*ngIf` check beats the
    nearest-`*ngIf` heuristic for the "rendered" proof.
12. **Not every applet is a generic document** (lane 3, run 10). Check the ts-lib `endpoint_path`
    and the backend container first: Consignor Purchase Billing writes its own `bl_fi_csg_billing_*`
    tables — no DCO signums, no journal, no queue. And trace the object actually handed to
    `service.post/put`, not the reducer — two "features" there were dead in the request assembly.
13. **Use `kb/tools/gates.py`** (lane 3, run 11) for the "rendered" proof on the shared screen: it walks
    enclosing `*ngIf` gates, `tabMappings`, `appletCode` comparisons and the orientation guard, replacing
    the nearest-`*ngIf` heuristic in `applet-scan.sh`. Also check `isShowColumn(hide, show)` in the
    shared ag-grid base as a consumption path.
14. **Purchase GIN is 0/0** (no stock, no journal); the stock-moving purchase-side out document is
    Purchase Return. Any page or guide saying "GIN reduces stock" is wrong.
15. **An applet setting can be consumed by the BACKEND** (lane 4, run 13): `STOCK_DURING_OPENING_SHOP`
    is read from `bl_applet_ext` by `StockTakeSessionHdrService` and throws "Applet Settings Not
    Found!" if Field Settings were never saved. The "consumed" proof must include a Java-side grep
    for `getValue_json().containsKey(`.
16. **Exceptions to the GL precedence** (lane 3, run 12): `JournalPostingService` treats
    `INTERNAL_PURCHASE_GRN_STOCK_IN` like the consignment stock-in types (`isConsignmentStockIn`) —
    the line GL code is ignored (header → item-company link → company default) and the supplier's
    AR/AP type is overridden. Check which branch a doc type takes before writing precedence.
17. **Stock location precedence** (every stock-moving page): line `delivery_location_guid` → line
    `guid_store` → header `guid_store` → branch default (`InventoryTransactionLineFactory`).
18. **`SHOW_*`-named applet settings are opt-in** (`isShowColumn` shows only if setting OR permission is
    true) — do not list them as hide toggles.
19. **Four-proof accessor regex misses destructured reads** (`b.DEFAULT_LOCATION`, lane 3 run 13) — always do a
    plain-grep second pass for each key name. Applet-local "Knock Off Settings" screens are decoys:
    KO tabs read the company flow config (§11), not those keys.
20. **Check for auto-created GL codes before writing any missing-GL claim** (lane 4, run 16): NSTI
    auto-creates its "Non-Stock and Trade-In" GL code, company link and subledger. Grep the backend
    for `createDefaultGLCode`-style helpers per doc type.
21. **Master data evaluated elsewhere: prove "consumed" in the consumer engine** (lane 4, run 18).
    Pricebook rules are evaluated by the client-side `PricebookCalculator` in blg-shared-utilities
    (POS/SI/SO/SQ) and a separate server engine (OCR points) — and they disagree. Grep the consumer,
    not the applet, and document the divergence.
22. **Which documents move stock: only 25 of 137 doc types** (lane 4, run 19) — the truth is the DCO
    `correctQuantitySignum` constants across the whole `FinancialDocDataConsistencyObject/` directory,
    not the `ServerDocTypes` enum. All credit/debit notes and plain GRN/GIN are 0. The balance is a
    chain tip (linked `bl_inv_txn_line`), not a sum; VOID writes negated lines. Ten quantity columns
    on the balance tables are dead (only `qty_ledger`, `qty_reserved`, `qty_min/max_level`, cost live).
23. **Hub/index pages** (no registry row): build from the DCO signum sweep, the processors' queue codes,
    and a bounded `git grep` per applet repo for the read endpoints; gates.py / applet-scan.sh do not apply.
24. **Non-generic stock documents** (Stock Conversion, lane 4 run 22): direction proof = applet constants ×
    factory copy × `StockBalanceHelper.calculateResultBalance`, not a DCO signum. Diff `Validators.required`
    against the rendered template before writing "Before you can use it" (a commented-out control can keep
    a required validator → silent hard prerequisite, e.g. DEFAULT_BRANCH).
25. **Enquiry-applet permissions** hinge on the target-filter branch (companies derived from requested
    locations, intersected), not `hasPermission()` — explains "empty grid vs not authorised".
26. Budget: ~4–5 large document applets per run is the realistic pace with this depth. Small
   master-data or report applets go faster. Stop cleanly; never rush the Configuration section.
