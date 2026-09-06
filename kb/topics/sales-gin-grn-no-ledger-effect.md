---
topic: sales-gin-grn-no-ledger-effect
aliases: [sales GIN, sales GRN, goods issue note, goods return note, INTERNAL_SALES_GOODS_ISSUED_NOTE, INTERNAL_SALES_GOODS_RECEIVED_NOTE, INTERNAL_SALES_GIN_STOCK_OUT, INTERNAL_SALES_GRN_STOCK_IN, zero signum documents]
applets: [internalSalesGINApplet, internalSalesGRNApplet, internalPurchaseGINApplet, internalPurchaseGRNApplet]
modules: [inventory, financial-accounting, sales-crm]
related: [applet-registry, document-approval, internal-sales-invoice-applet, internal-sales-return-applet, stock-movement-document-types, applet-settings-storage]
wiki:
  - content/en/applets/sales-workflow/internal-sales-gin-applet.md
  - content/en/applets/sales-workflow/internal-sales-grn-applet.md
  - content/en/applets/purchase-workflow/internal-purchase-gin-applet.md
status: growing
updated: 2026-09-06
---

# The GIN/GRN family moves nothing — on both sides of the ledger

**The plain goods-issue and goods-return note documents are inert.** All four carry quantity signum 0
and amount signum 0, and none appears in `JournalPostingTypeHandler`. Setting one to FINAL changes
`posting_status` and nothing else: no `bl_inv_txn_line`, no journal.

| Server doc type | Applet | Qty signum | Amt signum | Journal |
|---|---|---:|---:|---|
| `INTERNAL_SALES_GOODS_ISSUED_NOTE` | Sales GIN (Internal), `internalSalesGINApplet` | 0 | 0 | none |
| `INTERNAL_SALES_GOODS_RECEIVED_NOTE` | Sales GRN (Internal), `internalSalesGRNApplet` | 0 | 0 | none |
| `INTERNAL_PURCHASE_GOODS_ISSUED_NOTE` | Purchase GIN (Internal) | 0 | 0 | none |
| `INTERNAL_SALES_GIN_STOCK_OUT` | *unregistered* (`blg-applet-wavelet-internal-sales-gin-stock-out-applet`) | −1 | +1 | — |
| `INTERNAL_SALES_GRN_STOCK_IN` | *unregistered* | +1 | −1 | — |
| `INTERNAL_SALES_INVOICE_NO_STOCK_OUT` | *unregistered* | 0 | +1 | — |
| `INTERNAL_SALES_INVOICE` | Sales Invoice (Internal), `salesInvoiceApplet` | −1 | +1 | yes |

Citations (paths relative to `refs/`):

- `blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalSalesGoodIssuedNoteDataConsistencyObject.java:16-17`
- `.../InternalSalesGoodsReceivedNoteDataConsistencyObject.java:17-18` (and a second, older
  `InternalSalesGoodReceivedNoteDataConsistencyObject.java` on the same doc type, also 0/0)
- `.../InternalSalesGinStockOutDataConsistencyObject.java:16-17`
- `.../InternalSalesGrnStockInDataConsistencyObject.java:16-17`
- `.../InternalSalesInvoiceNoStockOutDataConsistencyObject.java:16-17`
- `.../InternalSalesInvoiceDataConsistencyObject.java:16-17`
- `blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java:30`
- Each applet restates its own pair in `src/app/models/constants/applet-constants.ts` — a cheap
  first check before opening the backend.

## Why this matters more than it looks

The **registered** applets are the inert ones. The document types that actually move stock on the
sales side — `INTERNAL_SALES_GIN_STOCK_OUT` and `INTERNAL_SALES_GRN_STOCK_IN` — are served by
applets with no row in `bl_applet_hdr` (see `applet-registry`, and Q-0093). A customer who installs
"Sales GIN (Internal)" expecting a warehouse issue document gets a record-keeping form.

This is the same shape as the earlier Purchase GIN finding: any page or guide saying "GIN reduces
stock" or "GRN restocks the item" is wrong for the *registered* applets and right only for the
`*_STOCK_OUT` / `*_STOCK_IN` variants.

## Open questions

- Is the registration gap deliberate? (Q-0093)
- Do any live tenants have the stock-out/stock-in applets installed by another route (direct bundle
  URL, tenant-level override)? Not checked — the registry query alone does not answer it.
