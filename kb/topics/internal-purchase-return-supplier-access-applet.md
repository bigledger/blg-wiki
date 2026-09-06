---
topic: internal-purchase-return-supplier-access-applet
aliases: [PR supplier access, purchase return supplier portal, supplier RMA view]
applets: [internal-purchase-return-supplier-access-applet]
modules: [purchasing, inventory]
related: [internal-purchase-return-applet, supplier-login-access, internal-purchase-credit-note-supplier-access-applet, printable-format]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-return-supplier-access-applet.md
status: growing
updated: 2026-09-06
---

# Purchase Return Supplier Access applet

Read-only supplier view of the buyer's purchase returns — at **every** posting status, unlike the rest of the family. Eight-tab document view, flat line listing, no Doc Link tab, broken PDF export.

## Facts

- 2026-09-06 — Registry `internal-purchase-return-supplier-access-applet`, ACTIVE since 2022-06-27, no documentation_url. Repo @129d9da (2026-07-21); shared-utilities pinned @cf8379f. Route base `applets/akaun/dev/internal-purchase-return-supplier-access-applet` — a dev path in shipped code (the BPO supplier-access applet has the same problem with `staging`). [src:planning/private/registry-applets-2026-09-05.tsv] [src:.../app.routing.ts]
- 2026-09-06 — Listing criteria are `server_doc_type = INTERNAL_PURCHASE_RETURN` and `status = ACTIVE` — **no** `posting_statuses` filter, so the supplier sees DRAFT, FINAL, VOID and DISCARDED returns. PCN, GRN and PI supplier access all pin FINAL; PO supplier access defaults to FINAL but lets the search replace it. Four different policies in one family. [src:.../purchase-return-listing.component.ts L118-125]
- 2026-09-06 — Export repeats the PI Supplier Access defect: `endpoint_path` already ends in `/login-entity-ep`, so the inherited `printJasperPdf` builds `…/internal-purchase-returns/login-entity-ep/print-jasper-pdf/{guid}`, which matches no controller mapping; the effect also hard-codes a printable-format GUID and passes `CP_COMMERCE_INTERNAL_SALES_ORDERS_JASPER_PRINT_SERVICE`. [src:blg-akaun-ts-lib/.../internal-purchase-return-supplier-access.service.ts] [src:.../purchase-return.effects.ts]
- 2026-09-06 — The repo also carries a whole `purchase-grn-controller` effects module (copied from the GRN supplier-access applet, injecting `InternalPurchaseGRNSupplierAccessService`) with no screen behind it. [src:.../state-controllers/purchase-grn-controller/store/effects/purchase-grn.effects.ts]
- 2026-09-06 — Four proofs at the pinned commit: 50 model keys, 210 rendered for this applet code, 19 consumed (18 line hides + `HIDE_COSTING_DETAILS`); 20 `SHOW_*` codes seeded. HEAD renders 297 and adds nothing. [src:kb/tools/gates.py] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-06 — No Doc Link tab (the other portals have one), so the supplier cannot trace the return back to its invoice or GRN from here. [src:.../purchase-return-view.component.html]
- 2026-09-06 — Document `INTERNAL_PURCHASE_RETURN`: amount signum +1, quantity signum −1 — the purchase-side stock-out document. [src:blg-akaun-platform-java/.../InternalPurchaseReturnDataConsistencyObject.java L16-17]
- 2026-09-06 — All 9 images in `static/images/internal-purchase-return-supplier-access-applet/` are buyer-side Purchase Return applet screenshots (FINAL / VOID / DISCARD / SELF-BILLED toolbar, ARAP columns) and the grids show real staff names and a real brand as test data. All dropped from the page; the folder needs quarantine.

## How it connects

- **internal-purchase-return-applet** — the write side; its FINAL validates stock at the return location.
- **internal-purchase-credit-note-supplier-access-applet** — the follow-on credit; the two portals together are how a supplier reconciles a return.
- **supplier-login-access** — same family filter.

## Open questions

- Should the four supplier portals agree on which posting statuses a supplier may see? Today: PR = all, PCN/GRN/PI = FINAL only, PO = FINAL by default but searchable.

## Wiki impact

- Page rewritten 2026-09-06; the old page's "verify and resolve returns / collaboration portal" framing removed - there is no supplier action of any kind in this applet.
