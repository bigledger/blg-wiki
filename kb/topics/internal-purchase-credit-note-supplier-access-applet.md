---
topic: internal-purchase-credit-note-supplier-access-applet
aliases: [PCN supplier access, purchase credit note supplier portal]
applets: [internal-purchase-credit-note-supplier-access-applet]
modules: [purchasing, financial-accounting]
related: [internal-purchase-credit-note-applet, supplier-login-access, internal-purchase-invoice-supplier-access-applet, internal-purchase-return-supplier-access-applet, printable-format]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-credit-note-supplier-access-applet.md
status: growing
updated: 2026-09-06
---

# Purchase Credit Note Supplier Access applet

Read-only supplier view of the buyer's FINAL purchase credit notes. Two menus (document listing, line listing), a nine-tab read-only document view, no create/save/delete and no working export.

## Facts

- 2026-09-06 — Registry: `internal-purchase-credit-note-supplier-access-applet` "Purchase Credit Note Supplier Access (Internal)", TNT-USER, ACTIVE, created 2022-05-31. Repo @bf0b95a (2026-07-31); shared-utilities pinned @e2f57c4. Route base `applets/tnt/wavelet/erp/internal-purchase-credit-note-supplier-access-applet`. [src:planning/private/registry-applets-2026-09-05.tsv] [src:.../app.routing.ts]
- 2026-09-06 — The listing and the Line Items listing both pin `posting_statuses = FINAL` in the pagination criteria — the supplier never sees DRAFT or DISCARDED credit notes. Line listing also pins `line_txn_type = PNS`. [src:.../purchase-credit-note-listing.component.ts setGridData] [src:.../line-items-listing.component.ts L126-133]
- 2026-09-06 — ts-lib service sets `endpoint_path` **including** `/login-entity-ep`, so the inherited `getByCriteria`/`getByGuid` are entity-scoped for free, but the inherited `printJasperPdf` builds `…/login-entity-ep/print-jasper-pdf/{guid}`, which no controller mapping matches (the real one is `/{docType}/print-jasper-pdf/login-entity-ep/{guid}`). Moot here because all four Export buttons are `disabled` in the template; the effect behind them also passes `CP_COMMERCE_INTERNAL_SALES_ORDERS_JASPER_PRINT_SERVICE` and a hard-coded printable-format GUID with a "Replace with printable once mockup received" comment. [src:blg-akaun-ts-lib/.../internal-purchase-credit-note-supplier-access.service.ts] [src:.../export/export.component.html] [src:.../purchase-credit-note.effects.ts L20-43]
- 2026-09-06 — Row enrichment uses the **applet-login** endpoints for branch (`branches/basic-info/applet-login-ep/{appletGuid}/{guid}`) and purchase agent (entity applet-login ep) but the ordinary permission-checked supplier endpoint for Supplier Name / Supplier ID; failures print the error code into the cell. [src:.../purchase-credit-note-listing.component.ts] [src:blg-akaun-ts-lib/.../branch-services/branch.service.ts L143-153]
- 2026-09-06 — Four proofs: 251 keys declared; gates.py at the pinned shared-utilities commit renders 193 for this applet code, 114 of which are in the model; only **18** are consumed by the applet, all line-field hides in `line-item-view/item-details/main-details` plus `HIDE_COSTING_DETAILS` on the line tab. Each is written `!appletSettings.HIDE_X || SHOW_X`, and 22 matching `SHOW_*` codes are seeded in `bl_applet_client_side_perm_dfn` — this is the one applet family where the HIDE/SHOW pair is actually seeded. [src:kb/tools/gates.py] [src:.../main-details.component.html] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-06 — `DEFAULT_BRANCH` / `DEFAULT_LOCATION` are rendered and saved by the applet-local Default Selection screen but read by nothing (no create form). `PRINTABLE` is written/read only by Printable Format Settings. [src:.../settings-container/default-settings/default-settings.component.{ts,html}] [src:.../printable-format-listing.component.ts L91]
- 2026-09-06 — Attachment tab lists `GEN_DOC_FILE` ext rows (File Name, Doc Type, Size, Status, Date); `onRowClicked` body is commented out, so there is no download. The old wiki page claimed suppliers could download attachments. [src:.../attachment/attachment-listing.component.ts]
- 2026-09-06 — Document: `INTERNAL_PURCHASE_CREDIT_NOTE`, amount signum −1, quantity signum 0. [src:blg-akaun-platform-java/.../InternalPurchaseCreditNoteDataConsistencyObject.java L15-17]

## How it connects

- **internal-purchase-credit-note-applet** — the write side; everything the supplier sees was posted there.
- **supplier-login-access** — same `bl_fi_mst_entity_login_subject_link` filter as the whole supplier-access family.
- **printable-format** — third applet in this lane whose print effect carries a hard-coded printable-format GUID.

## Open questions

- Was `posting_statuses = FINAL` a deliberate policy (suppliers must not see drafts) or a copy from another applet? It is consistent across PCN and its Line Items screen.

## Wiki impact

- Page rewritten 2026-09-06: read-only nature, FINAL-only filter, 18 four-proof settings with their SHOW_* pairs, attachment download claim removed, export documented as disabled.
