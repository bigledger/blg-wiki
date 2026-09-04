# Lane method notes — what the first runs learned (read before your next page)

Three lanes independently converged on the same facts on 2026-09-05. Use them; do not rediscover.

1. **Configuration lives in a shared screen, not in the applet.** Every applet routes "Application
   Settings" to the ~8,300-line `FieldConfigurationComponent` in `refs/blg-shared-utilities`
   (a submodule that is NOT checked out inside applet clones — read it from
   `/home/marketing/repos/refs/blg-shared-utilities`). It is gated per applet by
   `sessionStorage.appletCode`. The toggles that apply to an applet = the intersection of that
   template with the keys the applet's `applet-settings.model.ts` actually **reads** (models
   over-declare: e.g. ~220 declared, 105 read). `kb/tools/applet-scan.sh <applet repo>` computes
   the intersection — run it first, then document only keys the code reads.
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
5. **Direction claims in old pages are often inverted.** Trust the signum constants over the
   existing prose, and record every reversal in findings.md so the guides get corrected too.
6. Budget: ~4–5 large document applets per run is the realistic pace with this depth. Small
   master-data or report applets go faster. Stop cleanly; never rush the Configuration section.
