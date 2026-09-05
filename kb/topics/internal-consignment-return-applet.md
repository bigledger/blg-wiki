---
topic: internal-consignment-return-applet
aliases: [consignment return, CSGRTN, INTERNAL_PURCHASE_CONSIGNMENT_RETURN, consignor return]
applets: [internalConsignmentReturnApplet]
modules: [purchasing, inventory, financial-accounting]
related: [internal-consignment-grn-applet, internal-consignment-gin-applet, internal-consignment-purchase-order-applet, internal-purchase-return-applet, internal-purchase-invoice-applet, journal-posting, moving-average-costing, client-side-permissions, chart-of-account-applet]
wiki:
  - content/en/applets/purchase-workflow/internal-consignment-return-applet.md
status: growing
updated: 2026-09-05
---

# Consignment Return (Internal)

The document that sends consigned goods back to the consignor. Financially it is the mirror of the Consignment GRN — it reverses the consignment liability and the consignment stock value — but it does not touch warehouse quantities: the engine forces its quantity signum to 0.

## Facts

- 2026-09-05 — Engine type `INTERNAL_PURCHASE_CONSIGNMENT_RETURN`, amount signum +1, quantity signum **0**. `fillQuantitySignumAndAmountSignumForLine` overwrites the line signums, so the applet's own constant (quantity −1) never reaches the database. Not in `StockBalanceHelper.MA_WA_SERVER_DOC_TYPES` (the consignment GRN and GIN are). [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseConsignmentReturnDataConsistencyObject.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/GenericDocumentDataConsistencyObject.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/stock/StockBalanceHelper.java]
- 2026-09-05 — Journal: no handler of its own; `JournalPostingService` maps `INTERNAL_PURCHASE_CONSIGNMENT_GRN` and `…_RETURN` to the `PURCHASE_CONSIGNMENT` handler (`PNS_ENTITY` → `CONSIGNMENT_LIABILITY`, `PNS` / `PNS_RETURN` → `CONSIGNMENT_STOCK`, `PNS_TAX` → `INPUT_TAX`, `PNS_DISCOUNT` → `PURCHASE_DISCOUNT`) and sets `isConsignmentStockIn`, which (a) skips line GL codes and item-company links and (b) makes `resolveArap` return `CONSIGNMENT_LIABILITY` instead of the creditor mapping. Missing entity mapping throws `MISSING_DEFAULT_GL_CODE`. [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingTypeHandler.java]
- 2026-09-05 — The applet is a fork of the purchase-return applet: the Search tab (By Invoice / By Supplier / By Serial Number) pulls `INTERNAL_PURCHASE_INVOICE` lines and links them as doc 1; KO For offers Purchase GRN, Purchase Invoice, Purchase Order, Purchase Requisition and Supplier Delivery Order — not the Consignment GRN. No other applet in the repository set references the return type. [src:blg-applet-wavelet-internal-consignment-return-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-return-applet/src/app/components/consignment-return-container/consignment-return-create/import-knock-off/import-knock-off.component.html] [src:blg-applet-wavelet-internal-consignment-return-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-return-applet/src/app/components/consignment-return-container/consignment-return-create/search-invoices/search-by-invoice/invoice-line-listing/invoice-line-listing.component.ts]
- 2026-09-05 — Buttons: listing FINAL (`HIDE_FINAL_BUTTON` / `SHOW_FINAL_BUTTON`) and VOID (`HIDE_GENDOC_VOID_BUTTON`); edit RESET / FINAL (ungated) / SAVE; edit VOID commented out; DELETE with `SHOW_DOCUMENT_DELETE_BUTTON`. No DISCARD, no PRINT on listing, no File Import, no Email Template, no Workflow Settings, no tab ordering. [src:blg-applet-wavelet-internal-consignment-return-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-return-applet/src/app/components/consignment-return-container/consignment-return-edit/consignment-return-edit.component.html] [src:blg-applet-wavelet-internal-consignment-return-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-return-applet/src/app/models/menu-items.ts]
- 2026-09-05 — Settings: shared `FieldConfigurationComponent` routed (local component unrouted); 45 shared keys rendered and consumed; `HIDE_TRACKING_ID`, `HIDE_PERMIT_NO`, `HIDE_LAST_PURCHASE_PRICE` rendered but unread; `DISABLE_LINE_ITEM_QUEUE_LISTING` model-only (control gated to the requisition code); the tab-hide section never renders (`internalConsignmentReturnApplet` not in `getTabValue()`); Default Selection = branch + location only. Required header fields: branch, location, purchaser. [src:blg-applet-wavelet-internal-consignment-return-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-return-applet/src/app/models/applet-settings.model.ts] [src:blg-shared-utilities/modules/permission/field-configuration/field-configuration/field-configuration.component.ts]
- 2026-09-05 — 0 client-side permission rows; the applet checks two different display-pricing codes (`PURCHASE_CONSIGNMENT_RETURN_DISPLAY_PRICING` on the document Lines grid, `INTERNAL_PURCHASE_CONSIGNMENT_RETURN_DISPLAY_PRICING` on the Line Items menu); non-admin users see no prices. Settlement lines are typed `INTERNAL_RECEIPT_VOUCHER` except `CASH_BACK`. [src:blg-applet-wavelet-internal-consignment-return-applet/micro-fe/projects/wavelet-erp/applets/internal-consignment-return-applet/src/app/components/line-items-container/line-items-listing/line-items-listing.component.ts] [src:akaun_master.bl_applet_client_side_perm_dfn]

## How it connects

- **internal-consignment-grn-applet** — the GRN (amount −1, quantity +1, in the MA list) is the value and stock source; the return reverses value only and is offset against the GRN on the Contra tab.
- **internal-consignment-gin-applet** — the stock-moving consignment document (quantity −1); the physical side of a return must be recorded there or by adjustment.
- **internal-purchase-return-applet** — same template; the only differences are the document type, the quantity signum (−1 vs 0) and the journal handler.
- **chart-of-account-applet** — company defaults `CONSIGNMENT_LIABILITY`, `CONSIGNMENT_STOCK`, `INPUT_TAX` are the whole GL story for consignment types; line GL codes are ignored.

## Open questions

- Is quantity signum 0 intended for the consignment return (goods leave the warehouse physically), or should it be −1 like the GIN? The applet author assumed −1.
- Should the Search tab search Consignment GRN lines instead of purchase-invoice lines?

## Wiki impact

- `content/en/applets/inventory-workflow/internal-consignment-grn-applet.md`, `internal-consignment-gin-applet.md` (other lane): state which consignment types move stock / feed MA (GRN, GIN) and which do not (return, order).
- `content/en/guides/purchasing-guides/consignment-purchasing.md`: any "return reduces stock" sentence must go.
- `content/en/applets/finance/chart-of-account-applet.md` (other lane): list `CONSIGNMENT_LIABILITY` and `CONSIGNMENT_STOCK` among the company default GL codes.
