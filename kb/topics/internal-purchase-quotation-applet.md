---
topic: internal-purchase-quotation-applet
aliases: [purchase quotation, PQ, supplier quotation, INTERNAL_PURCHASE_QUOTATION, PURQUO]
applets: [internal-purchase-quotation-applet]
modules: [purchasing]
related: [internal-purchase-requisition-applet, internal-purchase-order-applet, blanket-purchase-order-applet, internal-purchase-gin-applet, internal-sales-quotation-applet, knock-off-configuration, client-side-permissions, printable-format, inline-gear-settings]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-quotation-applet.md
status: growing
updated: 2026-09-05
---

# Purchase Quotation (Internal)

The record of a price a supplier quoted you. In BigLedger it is a zero-movement, zero-value generic document that sits between the Purchase Requisition (its only knock-off source) and the Purchase Order (which can knock it off). Finalising it changes neither stock nor the ledger; it only creates the document links and open-queue rows the Purchase Order needs.

## Facts

- 2026-09-05 — Registry: code `internal-purchase-quotation-applet`, name "Purchase Quotation (Internal)", ACTIVE, `documentation_url` already points at the wiki page. The dev `main.ts` sets the same code, so the shared settings screen behaves identically in dev and on a tenant. [src:planning/private/registry-applets-2026-09-05.tsv] [src:refs/blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/main.ts]
- 2026-09-05 — Server doc type `INTERNAL_PURCHASE_QUOTATION`, short code `PURQUO`, amount signum 0 and quantity signum 0; the DCO checks the header amount signum on create/update and overwrites every line's signums with 0/0, including Payment-tab settlement lines. [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseQuotationDataConsistencyObject.java] [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/ServerDocShortCodes.java]
- 2026-09-05 — The type appears in only six backend files (DCO, type handler, short codes, permissions, two enums): no `JournalPostingTypeHandler` entry, no converter, no inventory or stock-balance reference. FINAL creates no journal (`NO_JOURNAL_CREATED` if a journal job is forced) and no inventory transaction. [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java] [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java]
- 2026-09-05 — Status flow: CREATE stores a `TEMP` document; SAVE converts it to ACTIVE / DRAFT (`convertToActiveInit`, effects L387–410); FINAL via `update-posting-status` then a re-PUT of the links; VOID via `/backoffice-ep/void/{guid}` (listing only); DISCARD via `/discard/backoffice-ep/{guid}`. No FINAL→DRAFT, no clone, no listing print; the edit form's DELETE handler is never rendered. [src:refs/blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/state-controllers/purchase-quotation-controller/store/effects/purchase-quotation.effects.ts] [src:refs/blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/erp/generic-document-services/base-generic-doc-hdr.service.ts]
- 2026-09-05 — VOID guard: `checkcanChangePostingStatusToNonFinal` throws unless FINAL and throws `GENERIC_DOCUMENT_HAS_TARGET_LINKS` when an ACTIVE link points from the quotation to another document (a PO that knocked it off). DISCARD throws `Generic Document cannot be discarded!` for FINAL / VOID. [src:refs/blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocumentController.java]
- 2026-09-05 — **The KO For tab is a copy of the Purchase Order applet's**: it requests flow rows for target `INTERNAL_PURCHASE_ORDER`, renders the Purchase Requisition sub-tab only when the PR→PO `LINE` row is enabled, lists PR open-queue rows whose `server_doc_type_2 = INTERNAL_PURCHASE_ORDER`, and checks `TNT_API_DOC_INTERNAL_PURCHASE_ORDER_CREATE_TGT_GUID` client-side. Only one sub-tab (PR) exists although `koSO/koBPO/koPQ` flags are computed. [src:refs/blg-applet-wavelet-internal-purchase-quotation-applet/micro-fe/projects/wavelet-erp/applets/internal-purchase-quotation-applet/src/app/components/purchase-quotation-container/purchase-quotation-edit/import-knock-off/import-knock-off.component.ts] [src:…/import-knock-off/knock-off-purchase-requisition/knock-off-purchase-requisition.component.ts]
- 2026-09-05 — Knock-off runs server-side (`knock-off/backoffice-ep` → `GenericDocLinkService.knockOff`): target must be `TEMP` ("Target Gen Doc is not in TEMP status"), multi-select must share entity and branch, each source line is copied with `remaining = quantity_base − Σ quantity_contra of existing links to targets of the same type`, header fields and attachments are copied from the source, and the target becomes ACTIVE / DRAFT. The open queue is decremented only where a queue row has `server_doc_type_2` equal to the target type — so a PR→PQ knock-off does not reduce the PR→PO open quantity unless the company also has a PR→PQ flow row. [src:refs/blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocLinkService.java] [src:refs/blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/tenant/dm/erp/genericDocument/GenericDocLinkController.java]
- 2026-09-05 — The Transaction Date picker is disabled unless the role holds the `SHOW_TRANSACTION_DATE` client-side permission. [src:…/purchase-quotation-create/main-details/main-details.component.html]
- 2026-09-05 — Settings: shared `FieldConfigurationComponent` renders 41 of the 102 model keys for this code (code not in `tabMappings`; KO / Payment / Account / tab-hide sections gated out; same result at the pinned submodule 49b834e and at HEAD af523eb). 44 keys pass four proofs (39 shared + Default Branch / Location / Language pair + PRINTABLE); 24 keys are read without any control (`HIDE_AMOUNT_MAIN_LISTING`, `HIDE_KO_FOR_TAB`, `ENABLE_MULTIPLE_KO`, `ENABLE_EDIT_PAYMENT_DATE`, four `MANDATORY_*` dimension keys, sixteen card keys); `HIDE_LAST_PURCHASE_PRICE`, `HIDE_VALIDITY_DATE`, `DEFAULT_COMPANY` are saved and ignored; 31 keys are model-only. No inline gear is embedded anywhere in the applet. The code is in `shouldHideSetting()`'s list, so price / discount / tax line toggles are pre-selected hidden on first save. [src:refs/blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts] [src:…/models/applet-settings.model.ts]
- 2026-09-05 — Client-side permissions: 24 seeded (20 `SHOW_*` line-field codes, `SHOW_COSTING_DETAILS`, `SHOW_TRANSACTION_DATE`, `PURCHASE_QUOTATION_DISPLAY_PRICING`, `HIDE_PRICE`), all checked; `SHOW_AMOUNT_MAIN_LISTING` and `SHOW_SST_VAT_GST_AMOUNT` are checked but not seeded. `HIDE_PRICE` is a hide-permission (granting it hides the line form's price fields); `PURCHASE_QUOTATION_DISPLAY_PRICING` is a show-permission for the Lines grid. [src:akaun_master.bl_applet_client_side_perm_dfn] [src:…/purchase-quotation-create/line-item/line-item-listing.component.ts] [src:gh:bigledger/blg-intranet#4490]
- 2026-09-05 — Export reads Branch Settings → Printable Format for the document's branch ahead of `PRINTABLE`; EXPORT AS PDF only. [src:…/purchase-quotation-edit/export/export.component.ts] [src:gh:bigledger/blg-intranet#1312]
- 2026-09-05 — Header Delivery Details tab is a read-only grid of `bl_del_job_dochdr_link` rows (trip, driver, vehicle, job dates, delivery status, recipient); the old page's "Delivery Instruction / Delivery Date" header fields do not exist — delivery instruction is a line-editor tab. [src:…/purchase-quotation-create/delivery-details/delivery-details.component.ts]
- 2026-09-05 — Images: of the seven files under `static/images/internal-purchase-quotation-applet/`, one (`golden-triangle-procurement-lifecycle.png`) is a screenshot of a video-sharing site with a third-party advertisement, four are generated marketing infographics, one listing screenshot shows branch / supplier codes matching a customer repo slug; only `line-items-page-view.png` is kept. [src:static/images/internal-purchase-quotation-applet/]

## How it connects

- **internal-purchase-requisition-applet** — the only KO source; a quotation does not consume the requisition's PR→PO open quantity (the requisition can still be ordered directly).
- **internal-purchase-order-applet** — the PO's `koPQ` sub-tab needs a PQ→PO flow row; a PO link blocks VOID of the quotation.
- **blanket-purchase-order-applet** — sibling pre-order document; the PQ's KO component computes a `koBPO` flag it never uses.
- **internal-purchase-gin-applet** — lists PQ among its source pickers; same 0/0 shape.
- **internal-sales-quotation-applet** — sales twin; both share the shared settings screen, both absent from `tabMappings`.
- **knock-off-configuration** — this applet reads the PR→PO row for its own KO tab (copy-paste); the correct row for queue decrement would be PR→PQ.
- **client-side-permissions** — `HIDE_PRICE` is the only hide-permission seen so far in the purchase family; `SHOW_TRANSACTION_DATE` locking the date picker is unusual.
- **printable-format** — branch default precedes the applet default here too.
- **inline-gear-settings** — none in this applet; the 24 read-without-control keys have no UI path at all.

## Open questions

- Should the KO For tab query PR→PQ flow rows and queue rows (and the PQ create permission) instead of the PO ones? As coded, a tenant must enable PR→PO to quote from a requisition, and the requisition's open quantity is not reduced by the quotation.
- Is a single knock-off per quotation (TEMP-only) intended, or should `knock-off-draft/backoffice-ep` (DRAFT targets) be wired to the tab as in newer applets?
- Should `SHOW_AMOUNT_MAIN_LISTING` and `SHOW_SST_VAT_GST_AMOUNT` be seeded, and the 24 API-only keys be given controls (or the model trimmed)?
- Is the `SHOW_TRANSACTION_DATE` lock on the date picker intended for all tenants?

## Wiki impact

- content/en/applets/purchase-workflow/internal-purchase-quotation-applet.md — rewritten (run 15): 0/0, single TEMP-only knock-off, PO-row dependency, permission facts, six images dropped.
- content/en/applets/purchase-workflow/internal-purchase-requisition-applet.md — should say a quotation knock-off does not reduce the PR→PO open quantity and that the PQ's tab needs the PR→PO row.
- content/en/applets/purchase-workflow/internal-purchase-order-applet.md — should say a PO link blocks VOID of the quotation (`GENERIC_DOCUMENT_HAS_TARGET_LINKS`).
- content/en/applets/sales-workflow/internal-sales-quotation-applet.md (other lane) — check for the same copy-paste KO tab and the same 0/0 statement.
- content/en/guides/purchasing-guides/standard-procurement-workflow.md — the guide never mentions the quotation applet; it should place it between requisition and order and say it posts nothing.
