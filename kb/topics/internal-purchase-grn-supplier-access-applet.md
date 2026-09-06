---
topic: internal-purchase-grn-supplier-access-applet
aliases: [GRN supplier access, purchase GRN supplier portal]
applets: [internal-purchase-grn-supplier-access-applet]
modules: [purchasing, inventory]
related: [internal-purchase-grn-applet, internal-purchase-grn-stock-in-applet, supplier-login-access, internal-purchase-order-supplier-access-applet, printable-format]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-grn-supplier-access-applet.md
status: growing
updated: 2026-09-06
---

# Purchase GRN Supplier Access applet

Read-only supplier view of the buyer's FINAL goods received notes: a listing, a nine-tab document view, a flat line listing, a working printable-format picker and a PDF export that calls the buyer-side print endpoint.

## Facts

- 2026-09-06 — Registry `internal-purchase-grn-supplier-access-applet`, ACTIVE since 2021-11-11; its `documentation_url` points at this wiki page. Note the registry ALSO points `internalPurchaseGrnStockInApplet`'s documentation_url at this same URL — a product-side mistake. Repo @084005d (2026-02-23, the least recently touched applet in the family); shared-utilities pinned @637553b. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-06 — Listing and Line Items pin `posting_statuses = FINAL`; the advanced search still offers a Posting Status filter with DRAFT/FINAL/VOID/DISCARDED, which is intersected with it and therefore returns nothing for the other three. Search resolves GUIDs through `SubQueryService.post` first, then pages over the returned list client-side (`guids` criterion). [src:.../purchase-grn-listing.component.ts L113-126,L200-215] [src:.../models/advanced-search-models/internal-purchase-grn.model.ts]
- 2026-09-06 — Export and attachment download call the **back-office** endpoints (`…/print-jasper-pdf/{guid}`, `…/file/{extGuid}`), both gated by the targeted `TNT_API_DOC_INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE_READ_TGT_GUID` permission, even though login-entity variants of both exist. The ts-lib service carries the comment "Replace this … with this once api endpoint is enhanced". The print effect also passes `CP_COMMERCE_INTERNAL_SALES_ORDERS_JASPER_PRINT_SERVICE` for a purchase GRN. [src:blg-akaun-ts-lib/.../internal-purchase-goods-received-notes-supplier-access.service.ts L48-56] [src:.../purchase-grn.effects.ts printJasperPdf$] [src:.../attachment.effects.ts] [src:blg-akaun-platform-java/.../GenericDocumentController.java L1302-1330,L1566-1600]
- 2026-09-06 — Four proofs at the pinned shared-utilities commit: 251 model keys, 208 rendered for this applet code, 19 consumed — all line-field hides plus `HIDE_COSTING_DETAILS`; all 19 written `!HIDE_X || SHOW_X`; 21 `SHOW_*` codes seeded (`SHOW_UNIT_PRICE_STD_PRICING_SCHEME` DELETED). HEAD renders 297 and adds nothing consumed. [src:kb/tools/gates.py] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-06 — `PRINTABLE` is genuinely consumed here (Export tab pre-selects it); `DEFAULT_BRANCH`/`DEFAULT_LOCATION` are saved by the local Default Selection screen and read by nothing. [src:.../purchase-grn-view/export/export.component.ts L55-75]
- 2026-09-06 — Document `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE`: amount signum 0, quantity signum 0 — a plain GRN moves no stock and posts no journal. [src:blg-akaun-platform-java/.../InternalPurchaseGoodReceivedNoteDataConsistencyObject.java L15-17]
- 2026-09-06 — Only image in `static/images/internal-purchase-grn-supplier-access-applet/` is a 6.4 MB NotebookLM overview infographic; dropped from the page. No real screenshots exist for this applet.

## How it connects

- **internal-purchase-grn-applet** — the write side.
- **internal-purchase-grn-stock-in-applet** — the document that actually moves stock; the registry mistakenly points its documentation_url at the GRN Supplier Access page.
- **supplier-login-access** — the family-wide entity-login filter.
- **printable-format** — export depends on a format built for the (wrong) CP Commerce sales-order print service.

## Open questions

- Should the applet be switched to the login-entity print and file endpoints? Both exist server-side; only the client is behind.

## Wiki impact

- Page rewritten 2026-09-06.
- Cross-lane: `internalPurchaseGrnStockInApplet`'s registry `documentation_url` should point at `/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/`, not at this page.
