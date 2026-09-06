---
topic: internal-purchase-invoice-supplier-access-applet
aliases: [PI supplier access, purchase invoice supplier portal]
applets: [internal-purchase-invoice-supplier-access-applet]
modules: [purchasing, financial-accounting]
related: [internal-purchase-invoice-applet, supplier-login-access, internal-purchase-grn-supplier-access-applet, internal-purchase-credit-note-supplier-access-applet, printable-format]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-invoice-supplier-access-applet.md
status: growing
updated: 2026-09-06
---

# Purchase Invoice Supplier Access applet

Read-only supplier view of the buyer's FINAL purchase invoices: listing, nine-tab document view, flat line listing. Export exists but targets an endpoint that does not.

## Facts

- 2026-09-06 — Registry `internal-purchase-invoice-supplier-access-applet`, ACTIVE since 2022-05-31; `documentation_url` still points at a Confluence page, not the wiki. Repo @0588cbb (2026-08-26); shared-utilities pinned @5f74f2d. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-06 — Listing and Line Items pin `posting_statuses = FINAL`. [src:.../purchase-invoice-listing.component.ts L127] [src:.../line-items-listing.component.ts L130]
- 2026-09-06 — **Export is broken by URL construction.** The ts-lib service sets `endpoint_path` to `…/internal-purchase-invoices/login-entity-ep`; `BaseApiTemplateService.getByCriteria` then sets `apiUrl` to that, and the service's own `printJasperPdf` appends `/print-jasper-pdf/{guid}`, producing `…/internal-purchase-invoices/login-entity-ep/print-jasper-pdf/{guid}`. `GenericDocumentController` maps only `/{docType}/print-jasper-pdf/{guid}` and `/{docType}/print-jasper-pdf/login-entity-ep/{guid}`, so the request 404s and the applet shows a failure toast. The effect also hard-codes a printable-format GUID and passes `CP_COMMERCE_INTERNAL_SALES_ORDERS_JASPER_PRINT_SERVICE`. [src:blg-akaun-ts-lib/.../internal-purchase-invoice-supplier-access.service.ts] [src:blg-akaun-ts-lib/.../base-api-template-service.model.ts L395-404] [src:.../purchase-invoice.effects.ts printJasperPdf$] [src:blg-akaun-platform-java/.../GenericDocumentController.java L1302,L2001]
- 2026-09-06 — Trimmed settings model: 50 keys (the buyer-side applet declares 250+). 19 pass four proofs at the pinned commit — the same 18 line-field hides as GRN Supplier Access plus `HIDE_COSTING_DETAILS`; 20 `SHOW_*` codes seeded (the 18 pairs + `SHOW_COSTING_DETAILS` + `SHOW_UNIT_PRICE_TXN`, which has no matching HIDE in the templates). [src:kb/tools/gates.py] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-06 — Attachment tab: metadata only, `onRowClicked` body commented out (identical to the credit-note applet). Payment tab: Payment Method, Date, Paid Amount, Remarks. [src:.../attachment/attachment-listing.component.ts L60-62]
- 2026-09-06 — Document `INTERNAL_PURCHASE_INVOICE`: amount signum −1, quantity signum +1 (the purchase-side stock-in document). [src:blg-akaun-platform-java/.../InternalPurchaseInvoiceDataConsistencyObject.java L16-17]

## How it connects

- **internal-purchase-invoice-applet** — the write side; its lifecycle section is the source for the posting proof repeated on the supplier page.
- **supplier-login-access** — same family-wide filter.
- **printable-format** — third distinct print defect in the family (BPO SA hard-coded GUID, GRN SA back-office endpoint, PI SA non-existent URL).

## Open questions

- Has anyone ever successfully exported a PDF from a supplier-access applet? Three of the four export paths inspected today cannot work as written.

## Wiki impact

- Page rewritten 2026-09-06; the old page's "manage purchase invoices / track payment status (Submitted, Approved, Paid)" framing was invented — there are no such statuses.
