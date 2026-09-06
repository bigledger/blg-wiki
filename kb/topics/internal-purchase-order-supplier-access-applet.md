---
topic: internal-purchase-order-supplier-access-applet
aliases: [PO supplier access, purchase order supplier portal, supplier PO acknowledgement]
applets: [internal-purchase-order-supplier-access-applet]
modules: [purchasing]
related: [internal-purchase-order-applet, supplier-login-access, workflow-process, internal-purchase-grn-supplier-access-applet, file-import, printable-format]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-order-supplier-access-applet.md
status: growing
updated: 2026-09-06
---

# Purchase Order Supplier Access applet

The only supplier-access applet in the purchase family that writes: the supplier can advance the order's workflow status and upload a CSV that creates purchase orders. Everything else (listing, line listing, PO-vs-GRN report, PDF export) is read-only and entity-scoped.

## Facts

- 2026-09-06 — Registry `internal-purchase-order-supplier-access-applet`, ACTIVE since 2021-11-11, `documentation_url` still points at Confluence. Repo @df256b6 (2026-08-30); shared-utilities pinned @f9e5782. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-06 — **Workflow status write.** Main Details carries a Workflow Status drop-down (statuses reachable from the current one, via `wfMdAvailableStatusService.getStatus(processGuid, currentStatus)`); selecting one stages an `XtnProcessApiModel` and the header **Update Status** button POSTs it to `…/erp/gen-doc/login-entity-ep/xtn-process`. The endpoint authorises with `UserPermissionService.isUserLoginEntity(subject, hdr.entity_hdr_guid)` and `GenericDocumentService.updateXtnProcess` merges the five `xtn_process_*` columns onto the header (and any lines sent) in one transaction after `GenericDocXtnProcessDCO` validation. [src:.../purchase-order-view.component.html L12] [src:.../main-details.component.ts L136-225] [src:blg-akaun-platform-java/.../GenericDocumentController.java L301-320] [src:.../GenericDocumentService.java updateXtnProcess] [src:.../GenericDocXtnProcessDCO.java]
- 2026-09-06 — Race: `selectApiDto` is dispatched from `workflowSelected()` before the resolution guid/code lookups return; they mutate the same object, so pressing Update Status immediately can post a null `xtn_process_resolution_guid` → `GENERIC_DOC_HDR_XTN_PROCESS_RESOLUTION_GUID_IS_NULL_OR_EMPTY`. The screen also patches the current status in a 3-second `setTimeout`. [src:.../main-details.component.ts L168-225]
- 2026-09-06 — **File import creates purchase orders.** `POST …/erp/internal-purchase-order/import-file-hdr/login-entity-ep` (multipart, delimiter + optional supplier) queues `InternalPurchaseOrderImportFileHdrProcessor` → `…HelperProcessor`: VALIDATING_DATA → column validation → any row error = FAILED and nothing created; zero errors = createGenericDoc, then PARTIALLY_DONE → calculate → DONE (or FAILED if rows remain unprocessed). The listing/read endpoints filter by the login's links; the POST itself has no entity-link check of its own. [src:blg-akaun-platform-java/.../InternalPurchaseOrderImportFileController.java L319-372] [src:.../InternalPurchaseOrderImportFileHelperProcessor.java L64-100]
- 2026-09-06 — Listing default `posting_statuses = FINAL` is **replaceable**: the component filters out any default whose columnName is also in the advanced-search criteria. This differs from the PCN/GRN/PI portals, where FINAL is unconditional. [src:.../purchase-order-listing.component.ts L120-135]
- 2026-09-06 — Export is the only correct one in the family: `InternalPurchaseOrderSupplierAccessPrintableService` targets `/{docType}/print-jasper-pdf/login-entity-ep/{guid}` and passes `INTERNAL_PURCHASE_ORDER_PRINT_SERVICE`; the backend resolves the document with `getByGuidForUserEntity` and needs no permission. [src:blg-akaun-ts-lib/.../internal-purchase-order-supplier-access-printable.service.ts] [src:.../purchase-order.effects.ts printJasperPdf$] [src:blg-akaun-platform-java/.../GenericDocumentController.java L2001-2040]
- 2026-09-06 — Four proofs at the pinned commit: 55 model keys, 295 rendered for this applet code, **22 consumed** — the 19 line hides plus `WORKFLOW_PROCESS_GUID` (Main Details), `SHOW_API_UPLOAD` (File Import's API Upload tab, `?? false`) and `VERTICAL_ORIENTATION` (File Import layout, with the personal `DEFAULT_ORIENTATION` / `DEFAULT_TOGGLE_COLUMN`). The applet-local `settings-container/field-configuration` component (which also renders a Workflow drop-down) is unrouted dead code — `app.routing.ts` binds `field-settings` to the shared component. [src:kb/tools/gates.py] [src:.../app.routing.ts L16,L56]
- 2026-09-06 — 19 `SHOW_*` codes seeded, and `SHOW_COSTING_DETAILS` is **not** among them although the line-view template checks it — `HIDE_COSTING_DETAILS` is therefore all-or-nothing for this applet (METHOD §2 pattern). [src:akaun_master.bl_applet_client_side_perm_dfn] [src:.../line-item-view.component.{ts,html}]
- 2026-09-06 — PO Detailed Report posts to `blanket-purchase-report/po/login-entity-ep`; rows grouped by PO Number/Item/Date/Qty with Unit Price, Total Amount, GRN Qty (`link.quantity_contra`), GRN Amount, Outstanding Qty/Amount; `LIMIT 500`. [src:blg-akaun-platform-java/.../BlanketPurchaseOrderReportUow.java L280-340]
- 2026-09-06 — Document `INTERNAL_PURCHASE_ORDER`: amount signum 0, quantity signum 0. [src:blg-akaun-platform-java/.../InternalPurchaseOrderDataConsistencyObject.java L15-17]
- 2026-09-06 — All 12 images in `static/images/internal-purchase-order-supplier-access-applet/` are screenshots of the **buyer-side** Internal Purchase Order applet (sidebar reads "Internal Purchase Order Applet", with Multi-PO / Intercompany / PO Replenishment menus this applet does not have); the old page used four of them. All dropped.

## How it connects

- **workflow-process** (`bl_wf_md_process_hdr` / `_status` / `_status_link` / `bl_wf_md_resolution`) — the supplier acknowledgement mechanism; the same xtn-process columns exist on every generic document, so any other portal could offer the same button.
- **file-import** — the supplier-side CSV import shares the buyer-side import tables and processors.
- **internal-purchase-grn-supplier-access-applet** — GRN Qty in the detailed report is the receipt side.

## Open questions

- Should `SHOW_COSTING_DETAILS` be seeded for this applet code, or is hiding costing from suppliers deliberate and absolute?
- The supplier-side CSV import creates purchase orders in the buyer's tenant. Is that intended for all tenants, or should the File Import menu be gated by a setting like `SHOW_API_UPLOAD`?

## Wiki impact

- Page rewritten 2026-09-06; the old page's "upload their own POs / acknowledge receipt / see fulfilment status" claims are now grounded (workflow status + CSV import) or removed.
