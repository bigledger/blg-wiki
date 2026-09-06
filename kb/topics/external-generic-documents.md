---
topic: external-generic-documents
aliases: [xtn generic doc, bl_fi_xtn_generic_doc_hdr, external gen doc, xtn/gen-doc, external sales invoice applet, supplier sales invoice applet, document matching]
applets: []
modules: [purchasing, e-invoice, inventory]
related: [applet-registry, document-approval, e-invoice-reconciliation, warehouse-management, my-e-invoice-portal-applet, stock-conversion-applet]
wiki:
  - content/en/applets/sales-workflow/external-sales-invoice-applet.md
status: seed
updated: 2026-09-06
---

# External generic documents (`bl_fi_xtn_generic_doc_*`)

BigLedger keeps documents that originated **outside** the tenant — a supplier's invoice, a
warehouse operator's goods receipt, an e-invoice pulled from LHDN — in their own table family,
`bl_fi_xtn_generic_doc_hdr` / `_line` ("xtn" = external transaction). They are staging records, not
business documents: they never post a journal, never move stock and have no posting status. What
happens to them instead is **matching** — a set of link and balance tables pairs an external
document line against an internal generic-document line so a tenant can see what an outside party
says it sent versus what BigLedger recorded. This is a separate family from the internal generic
document (`bl_fi_generic_doc_hdr`) that every sales and purchase applet writes.

## Facts

- 2026-09-06 — The read surface is `/core2/tnt/dm/erp/xtn/gen-doc/backoffice-ep`, with a
  supplier-facing sibling at `xtn/gen-doc/supplier-ep`.
  [src:git:blg-akaun-ts-lib .../api-services/erp/generic-document-services/external-gen-doc.service.ts:11-20]
- 2026-09-06 — **No posting, no stock.** `ExternalGenericDocumentService` exposes only
  `create`, `createXtnTempGenericDoc`, `update`, `delete` and two guid-list readers;
  `ExternalGenericDocumentDataConsistencyObject` declares no amount or quantity signum and no
  posting-status transition; nothing in `JournalPostingService` or the inventory processors reads
  the xtn family.
  [src:git:blg-akaun-platform-java@1ff620ef javasdk/.../domain/erp/external/ExternalGenericDocumentService.java:25-81]
  [src:git:blg-akaun-platform-java@1ff620ef javasdk/.../validator/ExternalGenericDocumentDataConsistencyObjects/ExternalGenericDocumentDataConsistencyObject.java]
- 2026-09-06 — **`bl_fi_xtn_generic_doc_hdr` has no `posting_status` column.** It carries `status`,
  `matching_status`, `amount_matched`, `qty_matched` and the `client_doc_*` / `client_doc_status_*`
  columns that hold the external system's own identifiers.
  [src:tenant schema dump bl_fi/bl_fi_xtn_generic_doc_hdr.sql]
  [src:git:blg-akaun-ts-lib .../models/dbschema/bl_fi_xtn_generic_doc_hdr.model.ts:3-87]
- 2026-09-06 — Matching is its own DCO cluster: `GenDocToXtnGenDocLineMatchingBalanceDataConsistencyObject`,
  `XtnGenDocToGenDocLineMatchingBalanceDataConsistencyObject`,
  `ExternalGenericDocumentMatchingLineLinkDataConsistencyObject`, over
  `bl_fi_xtn_gen_doc_matching_line_link`, `bl_fi_generic_doc_line_xtn_doc_line_matching_balance` and
  `bl_fi_xtn_gen_doc_line_itn_doc_line_matching_balance`.
  [src:git:blg-akaun-platform-java@1ff620ef javasdk/.../validator/XtnItemDcos/]
- 2026-09-06 — Known producers of xtn rows in the backend: the WMS GRN link
  (`WmsGrnFiXtnGendocLineLinkDataConsistencyObject`), the e-invoice validate-from-IRB queue, and a
  temporary-queue path (`bl_fi_xtn_gen_doc_temp_queue`, `ExternalGenDocTemporaryQueueDataConsistencyObject`).
  [src:git:blg-akaun-platform-java@1ff620ef javasdk/.../validator/erp/wms/, .../validator/erp/eInvoice/]
- 2026-09-06 — **The one front end built on it is unregistered.** The repo
  `blg-applet-wavelet-external-sales-invoice-applet` (project `external-sales-invoice-applet`,
  route `applet/tnt/wavelet/erp/external-sales-invoice-applet`, HEAD `222d5699`, last touched
  2026-08-21) has no row in `bl_applet_hdr` under any name, code, guid or bundle URL. Its
  production publish script deploys to `s3://akaun-applets-my/bigledger/wavelet-erp/`
  **`supplier-sales-invoice-applet`**`/prod`, and its dev-only `sessionStorage.appletCode` is
  `external-supplier-sales-invoice-applet` — both suggest a supplier-portal intent rather than a
  customer-invoicing one.
  [src:git:blg-applet-wavelet-external-sales-invoice-applet@222d5699 micro-fe/bin/production/external-sales-invoice-applet/external_sales_invoice_applet_publish.sh]
  [src:query bl_applet_hdr 2026-09-06]
- 2026-09-06 — That applet is an unfinished **Stock Conversion clone**: only the listing effect is
  live; the create, edit, posting-status and job-order effects are commented out; the create form
  still asks for "Conversion Code" and "Conversion Name"; the grid columns still bind to
  `bl_inv_stock_conversion_hdr.*` while the data loaded is `bl_fi_xtn_generic_doc_hdr`.
  [src:git:blg-applet-wavelet-external-sales-invoice-applet@222d5699 .../store/effects/external-sales-invoice.effects.ts:27-296]
  [src:git:blg-applet-wavelet-external-sales-invoice-applet@222d5699 .../external-sales-invoice-listing/external-sales-invoice-listing.component.ts:75-86,261-285]

## How it connects

- **applet-registry** — the cleanest instance yet of the ADR-0007 shape: a maintained repo, a
  production deploy script, and no registry row. It also inverts run 33's finding (`t2tAdminApplet`:
  registry row, CDN bundle, no repo) — here the repo and the bundle exist and the row does not.
- **e-invoice-reconciliation** — inbound LHDN documents land in the xtn family and are matched
  against internal generic documents. The matching-balance tables described here are the same
  machinery, so anything learned about xtn matching applies to the e-invoice matching queues.
- **document-approval** — worth stating because pages keep assuming otherwise: there is no approval
  engine for any sales document, and the xtn family has no approval hook of its own either.
- **warehouse-management** — the WMS GRN links its lines to xtn generic-doc lines; that is
  the one place in the product where the family is demonstrably exercised end to end.

## Open questions

- Which tenants actually hold `bl_fi_xtn_generic_doc_hdr` rows today, and from which producer?
  Not yet queried; the answer would say whether this is live machinery or e-invoice-only plumbing.
- Is the supplier-portal reading (`supplier-ep`, the S3 target `supplier-sales-invoice-applet`) the
  intended product, i.e. a supplier submits their sales invoice and the buyer matches it? Nothing in
  the repo states an intent. Raised for Vincent as **Q-0060**.

## Wiki impact

- `content/en/applets/sales-workflow/external-sales-invoice-applet.md` — unpublished 2026-09-06
  (ADR-0008 tier 1; `planning/worklog/2026-09-06-external-sales-invoice-applet.md`). If the applet
  is ever registered, the replacement page is written from this topic, not from the repo name.
- Any page describing "external" documents as invoices to external customers is wrong: **external
  means the document came from outside BigLedger**, not that the counterparty is outside the group.
