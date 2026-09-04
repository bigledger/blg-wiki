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
7. Budget: ~4–5 large document applets per run is the realistic pace with this depth. Small
   master-data or report applets go faster. Stop cleanly; never rush the Configuration section.
