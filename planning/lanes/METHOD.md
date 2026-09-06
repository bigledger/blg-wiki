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
26. **The shared-utilities submodule is pinned per applet** (lane 3, run 22): run gates.py at the applet's
    pinned commit AND at HEAD; note which rows differ. One document type can have three backends
    (back-office gen-doc, login-entity/ecom endpoint, storefront conversion) — check all paths.
27. **Some applet repos VENDOR a private copy of shared-utilities** (Supplier, Merchant Admin — no
    `.gitmodules`, no link to refs/blg-shared-utilities), so gates.py cannot be run at all: neither
    "pinned" nor "HEAD" applies. Check for `.gitmodules` first; otherwise build the rendered proof from
    the applet's own field-configuration template ∪ its inline-gear key lists. (It also means
    shared-utilities fixes never reach these applets.)
28. **Enumerate every component dispatching `saveMasterSettingsInit`** — a second settings screen can
    own keys the main screen has never heard of (Supplier: Default Selection writes ALLOWED_AR_AP_TYPES
    and SUPPLIER_DETAILS_TAB_ORDER; two more keys are reachable only through the inline gear).
29. **A `.gitmodules` entry does NOT mean the shared settings screen is in use** (refines §27): Tax
    Configuration has the submodule and still defines its own local `FieldConfigurationComponent` —
    the same unbound 8-toggle stub found in Merchant Admin, Shipping Pricebook and Supplier.
    Classify by what `app.routing.ts` imports, and require a form binding + SAVE handler before
    documenting any toggle.
30. Budget: ~4–5 large document applets per run is the realistic pace with this depth. Small
   master-data or report applets go faster. Stop cleanly; never rush the Configuration section.
31. **Check `property_json->>'es_module_url'` before choosing a repo to read** (sales-workflow sweep,
    2026-09-06). Repo name ≠ shipped bundle. `internalSalesRefundNoteApplet` serves
    `internal-sales-refund-note-applet-**v3**` while `refs/` holds v1, v2 and v3;
    `internalSalesProformaInvoiceApplet` and `recurringSalesInvoiceApplet` each serve the **v1**
    bundle although a v2 repo exists. A bundle served from a **customer-namespaced** prefix
    (not `bigledger/wavelet-erp/…`) is an exclusion-list candidate, not a documentation gap.
32. **Every applet restates its own signums** in `src/app/models/constants/applet-constants.ts`
    (`docType`, `amount_signum`, `quantity_signum`). One line, and it agreed with the backend DCO in
    every case checked. Use it as the first check, then confirm against the DCO and `ServerDocTypes`.
33. **The plain GIN/GRN family is 0/0 on both sides** — extends §14 and §22. `INTERNAL_SALES_GOODS_ISSUED_NOTE`,
    `INTERNAL_SALES_GOODS_RECEIVED_NOTE` and `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE` all carry quantity
    signum 0, amount signum 0, and none appears in `JournalPostingTypeHandler`. The stock-moving
    variants are separate document types (`INTERNAL_SALES_GIN_STOCK_OUT` qty −1,
    `INTERNAL_SALES_GRN_STOCK_IN` qty +1) whose applets are **not in the registry** (Q-0093).
    Any page saying "GIN reduces stock" or "GRN restocks the item" is wrong for the registered applet.
    See `kb/topics/sales-gin-grn-no-ledger-effect.md`.
34. **Front-matter extraction breaks on the UTF-8 BOM.** Many pages under `content/en/applets/` begin
    with `\xef\xbb\xbf---`, so `awk '/^---$/{n++}'` silently reports "no front matter" and a triage
    sweep under-counts. Strip the BOM first (`sed 's/^\xef\xbb\xbf//'`) or the registry audit will
    invent gaps that are not there.
35. **`applet-constants.ts` can disagree with the backend — and the backend wins** (sales-workflow
    sweep pass 3, 2026-09-06). This refines §32, which said the applet constant agreed with the DCO
    in every case checked. Two counterexamples, in opposite directions:
    `internalConsignmentBillingApplet` sends `quantity_signum = 1` and the DCO forces **0**
    (`InternalPurchaseConsignmentInvoiceDataConsistencyObject:16`); `ServerDocTypes.java:82` declares
    `INTERNAL_SALES_REFUND_NOTE(0,-1)` while its DCO sets quantity **+1**. In both cases the DCO
    wins, because `fillQuantitySignumAndAmountSignumForLine`
    (`GenericDocumentDataConsistencyObject:1215-1219`) **overwrites** the line's signums
    unconditionally on every create and update — it does not fill only when missing. Use the applet
    constant as a one-line first check, then always confirm against the DCO, and treat
    `ServerDocTypes` as the least trustworthy of the three (`INTERNAL_PURCHASE_CONSIGNMENT_INVOICE`
    is missing from it altogether).
36. **The two settings findings to check on every applet before writing the Configuration section**:
    (a) is the registry `code` in `FieldConfigurationComponent.getTabValue()`'s `tabMappings`? If
    not, every tab-hide key the applet reads has no control (extends §10 — now found on
    `internalConsignmentBillingApplet`, `internalSalesRefundNoteApplet` and
    `internal_sales_inquiry_applet`); (b) `SELECT count(*) FROM bl_applet_client_side_perm_dfn d JOIN
    bl_applet_hdr h ON h.guid=d.applet_guid WHERE h.code='<code>'`. Five sales-workflow applets have
    **zero** rows and one has a single row against 45 checked codes, which turns every `HIDE_*`
    setting into an all-or-nothing tenant-wide switch with no per-role exception. Both are one query
    each and both change how the whole Configuration section must be worded.
37. **Four shapes of shipped-but-dead UI, with tests for each** — hard-coded grid, unbound toggle,
    routed-but-unlinked screen, declared-but-unrouted component. Written up once in
    `kb/topics/mock-screens-shipped-in-production.md`; read it before describing any screen. The
    cheapest of the four tests: diff the `path:` list in `app.routing.ts` against `menuItems` +
    `settingItems` + `personalizationItems`.
38. **Build the "consumed" proof from the rendered list, not from a prefix regex.** Grepping
    `appletSettings\.(HIDE|SHOW|…)[A-Z_]+` misses keys read through indirection
    (`appletSettings[panel.expandSetting]`), keys whose names start with something else
    (`VERTICAL_ORIENTATION`), and typo'd accessors (`appletSettinsgMain.HIDE_KO_FOR_TAB` — real, in
    the refund note and consignment billing repos). Instead: run `gates.py <code>`, take every
    `RENDERED*` key, and `grep -rqw` each one in the applet. One loop, no false negatives.
39. **A report applet's real gate is usually a *target* permission, not a yes/no one** (extends §25).
    Daily Cashier Reports declares `API_TNT_DM_ERP_Z_REPORT_READ` and
    `API_TNT_DM_ERP_REPORT_CASHIER_COLLECTION_READ` as *branch* read permissions: the screen opens
    for anyone, and the branch drop-down comes back empty when the role has no branch target. That is
    the troubleshooting row to write, and it is different from "not authorised".
40. **Read the i18n bundle for screen and column labels, not the template.** Several sales applets
    are fully localised (Sales Inquiry and Sales Commission ship en/zh/ms/ar/hi/id), so the templates
    render `{{ some_key }}` and the real label is in `src/assets/i18n/en.json`. It also catches
    labels copied from the applet a repo was cloned from — Sales Inquiry's listing calls its first
    column *Sales Order No*, and Consignment Billing's file import downloads a template named
    `Sales_Invoice_Master_Data_Template.csv`.
