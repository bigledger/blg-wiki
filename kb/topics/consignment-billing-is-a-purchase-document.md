---
topic: consignment-billing-is-a-purchase-document
aliases: [consignment billing, CSGINV, INTERNAL_PURCHASE_CONSIGNMENT_INVOICE, consignment liability, consignment stock, internalConsignmentBillingApplet]
applets: [internalConsignmentBillingApplet, internalconsignmentGRNApplet, internalConsignmentReturnApplet, InternalConsignorPurchaseBillingApplet]
modules: [purchasing, financial-accounting, inventory]
related: [internal-consignment-grn-applet, internal-consignment-return-applet, internal-consignor-purchase-billing-applet, internal-consignment-gin-applet, customer-consignment, applet-registry, stock-movement-document-types, applet-settings-storage]
wiki:
  - content/en/applets/sales-workflow/internal-consignment-billing-applet.md
  - content/en/applets/inventory-workflow/internal-consignment-grn-applet.md
  - content/en/applets/purchase-workflow/internal-consignment-return-applet.md
status: growing
updated: 2026-09-06
---

# Consignment Billing is the consignor's bill to you — not your bill to a consignee

`INTERNAL_PURCHASE_CONSIGNMENT_INVOICE` (short code `CSGINV`) is a **purchase** document. The
applet that serves it, `internalConsignmentBillingApplet`, sits under `applets/sales-workflow/` in
the wiki (Q-0125) and is named in a way that reads as a sales document, but everything in the code
points the other way:

- the internal route is `internal-purchase-invoice`
- the Account tab's entity picker is titled **Select Supplier**
- File Import posts to `…/erp/internal-purchase-invoice/import-file-hdr/backoffice-ep`
- the amount signum is **−1** (the purchase direction), validated on create and update

## The consignment cycle in signums

| Server doc type | Applet | Qty | Amt | Journal |
|---|---|---:|---:|---|
| `INTERNAL_PURCHASE_CONSIGNMENT_GRN` | Consignment GRN (Internal) | +1 | −1 | Cr `CONSIGNMENT_LIABILITY` / Dr `CONSIGNMENT_STOCK` |
| `INTERNAL_PURCHASE_CONSIGNMENT_GIN` | Consignment GIN (Internal) | −1 | +1 | falls back to the ordinary purchase/creditor accounts |
| `INTERNAL_PURCHASE_CONSIGNMENT_RETURN` | Consignment Return (Internal) | — | — | consignment accounts |
| `INTERNAL_PURCHASE_CONSIGNMENT_INVOICE` | **Consignment Billing (Internal)** | **0** | **−1** | Dr Purchase / Dr Input Tax, Cr Creditor, **plus** Dr `CONSIGNMENT_LIABILITY` / Cr `CONSIGNMENT_STOCK` |

Stock arrives on the GRN and is held as consignment stock against a consignment liability. When it
sells, the consignor invoices you; this document reverses that holding pair and creates a real
payable. It **moves no stock** — the GRN already brought the quantity in.

## Two things the code does that the shape does not predict

1. **The type has no entry of its own in `JournalPostingTypeHandler`.** The fallback in
   `JournalPostingService` keys on the name containing `PURCHASE`, so the plain `PURCHASE` handler
   applies (entity → `CREDITOR`, lines → `PURCHASE`, tax → `INPUT_TAX`). The consignment pair is
   added afterwards by a doc-type-specific block.
2. **`CONSIGNMENT_LIABILITY` and `CONSIGNMENT_STOCK` are read only from the company default GL code
   links** — no line, header or item-company fallback — and each **throws**
   `MISSING_DEFAULT_GL_CODE: <code>` when unmapped. The same two codes are what a Consignment GRN
   needs, so a company missing them fails at both ends of the cycle with the same message.

## The applet sends a quantity signum the server throws away

`applet-constants.ts` declares `quantity_signum = 1` and `line-item-add.component.ts:183` sends it.
`InternalPurchaseConsignmentInvoiceDataConsistencyObject:16` declares **0**, and
`fillQuantitySignumAndAmountSignumForLine` (`GenericDocumentDataConsistencyObject:1215-1219`) sets
the line's signums **unconditionally** on every create and update. The server wins: quantity 0, no
inventory transaction line.

This is the first counterexample to the shortcut recorded in METHOD §32 ("every applet restates its
own signums, and it agreed with the backend in every case checked"). Use the applet constant as a
first check only; the DCO is the answer. See also `INTERNAL_SALES_REFUND_NOTE`, where the
disagreement runs the other way — `ServerDocTypes.java:82` says quantity 0 and the DCO says +1, and
there the DCO also wins (P-0135).

## Knock-off

The create screen's **KO For → Consignment Purchase GRN** grid reads the line open queue where
`server_doc_type_1 = INTERNAL_PURCHASE_CONSIGNMENT_GRN` and
`server_doc_type_2 = INTERNAL_PURCHASE_CONSIGNMENT_INVOICE`. As always, the queue rows only exist if
the company has an **enabled** row in `bl_fi_comp_gendoc_flow_config` for that source→target pair
(METHOD §11). The per-line KO tabs are a different set — Purchase GRN, Purchase Order, Purchase
Requisition and Outbound Delivery Order — each gated on its own flow row.

The advanced search on that grid filters on `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` instead, so
searching empties the grid (P-0131).

Citations (paths relative to `refs/`):

- `blg-akaun-platform-java/javasdk/.../FinancialDocDataConsistencyObject/InternalPurchaseConsignmentInvoiceDataConsistencyObject.java:15-17`
- `blg-akaun-platform-java/javasdk/.../FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java:1215-1219`
- `blg-akaun-platform-java/client-sdk/.../GenericDocServerDocTypeEnum.java:60`
- `blg-akaun-platform-java/javasdk/.../tenant/JournalPostingService.java:68-82, 322-361, 397-471`
- `blg-akaun-platform-java/javasdk/.../tenant/JournalPostingTypeHandler.java:53-63`
- `blg-applet-wavelet-internal-consignment-billing-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-billing-applet/src/app/models/constants/applet-constants.ts`
- `…/components/consignment-billing-container/consignment-billing-create/import-knock-off/knock-off-grn/knock-off-grn.component.ts:288-296, 555`

## Open questions

- Should the wiki page move to `applets/purchase-workflow/`? (Q-0125)
- `INTERNAL_PURCHASE_CONSIGNMENT_INVOICE` is absent from `ServerDocTypes` altogether. How many other
  live document types are missing from that enum, and what reads it? (P-0135 covers the related
  drift on the sales refund note.)
