---
topic: internal-purchase-return-applet
aliases: [purchase return, PURRTN, INTERNAL_PURCHASE_RETURN, return to supplier, supplier return]
applets: [internal_purchase_return_applet]
modules: [purchasing, inventory, financial-accounting, e-invoice]
related: [internal-purchase-debit-note-applet, internal-purchase-invoice-applet, internal-purchase-grn-applet, internal-purchase-refund-note-applet, sales-return, stock-balance, gl-posting, e-invoice, intercompany]
wiki:
  - content/en/applets/purchase-workflow/internal-purchase-return-applet.md
status: growing
updated: 2026-09-05
---

# Purchase Return (Internal)

Goods going back to a supplier. Amount signum +1, quantity signum −1: stock out at the return location, Dr Creditor / Cr Purchase Return, positive ARAP balance closed by contra or settlement.

## Facts

- 2026-09-05 — Registry: `internal_purchase_return_applet`, "Purchase Return (Internal)", ACTIVE; documentation_url points at the wiki page. [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Signums +1 / −1 in both the applet constants and the backend DCO. Journal uses the `PURCHASE` handler with `PNS_RETURN → PURCHASE_RETURN` for return lines. [src:blg-applet-wavelet-internal-purchase-return-applet/…/models/constants/applet-constants.ts] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/validator/FinancialDocDataConsistencyObject/InternalPurchaseReturnDataConsistencyObject.java] [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/JournalPostingService.java]
- 2026-09-05 — Menus: Purchase Return, Line Items, File Export, Intercompany, Audit Trail. Settings: Application Settings, Default Selection, Printable Format Settings, Return Reasons Settings (Reason Code / Reason Name), Branch Settings, Workflow Settings. No File Import menu, no Email Template. [src:…/src/app/models/menu-items.ts]
- 2026-09-05 — Default Selection: `DEFAULT_PURCHASE_RETURN_PRICING_OPTION` (`LAST_PURCHASE_PRICE`, `MA_COST`, `PURCHASE_INVOICE_PRICE`), `PURCHASE_RETURN_PRICE_FILTER_BY_SUPPLIER` (default on), `DATE_TXN_LOGIC` (`USE_FINAL`, `USE_CREATED`, `USE_UPDATED`, `USE_DATE_TXN`; stored default `ADJUSTED`), tab order (14 tabs). [src:…/components/settings-container/default-settings/default-settings.component.ts] [src:blg-shared-utilities/models/return-pricing-constants.model.ts]
- 2026-09-05 — Search tab sub-tabs: Search By Supplier, By Invoice, By GRN (`HIDE_SEARCH_BY_GRN`), By Purchase Invoice No Stock In (`SHOW_SEARCH_BY_PURCHASE_INVOICE_NO_STOCK_IN`), By Serial Number. `WARN_EXCESS_RETURN_QUANTITY` blocks returns above the source line (*Total return quantity is greater that the invoice qty*). `SHOW_INVOICES_FROM` limits how far back invoices are listed. [src:…/purchase-return-create/search-invoices/]
- 2026-09-05 — Create tabs: Search, Main Details, Account, Lines, KO For, Delivery Details, Settlement, Department Hdr, Contra. Edit tabs add E-Invoice, ARAP, Trace Document, Doc Link, Export, Attachments. Listing bulk actions: FINAL, DISCARD, VOID, SINGLE/MULTIPLE PRINT, SELF-BILLED. [src:…/purchase-return-create/*.html] [src:…/purchase-return-listing/*.html]
- 2026-09-05 — Required: branch, location; remarks with `MANDATORY_REMARKS_FIELD`; external-doc mandatory validators wired (10 keys). `WORKFLOW_PROCESS_GUID` attaches a workflow to new (TEMP) documents. [src:…/purchase-return-create/main-details/main-details.component.ts]
- 2026-09-05 — 37 client-side perms seeded (only `SHOW_GENDOC_FINAL_BUTTON` of the button set); code also checks `SHOW_GENDOC_DISCARD/VOID_BUTTON`, `SHOW_FILE_EXPORT_MENU`, `SHOW_SERIAL_NUMBER`, `SHOW_ARAP_*`, `EXCLUDE_ACCOUNT_CODE_ITEM_TYPE_AT_ITEM_SEARCH`. [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Backend FINAL stock validation messages: *There's not enough stock for item …* (also NSTI, bundle, MTO child variants). [src:blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/tenant/GenericDocumentService.java]
- 2026-09-05 — Support pattern 2026 (anonymised): "unable to FINAL — not enough stock" is the dominant ticket; root causes were the return location differing from the receiving location, and batch not present at that location. Others: location reset after supplier selection (fixed), deleted-line link persisting (fixed), Add All rounding shortfall (open), branch-scoped role seeing all branches (permission target), serial-number tab not highlighted (fixed), intercompany mirror at wrong location/qty (fixed). [src:gh:bigledger/blg-int-general-task#8074] [src:gh:bigledger/blg-int-general-task#7153] [src:gh:bigledger/blg-int-general-task#6166] [src:gh:bigledger/blg-int-general-task#6988] [src:gh:bigledger/blg-int-general-task#8198] [src:gh:bigledger/blg-int-general-task#9759] [src:gh:bigledger/blg-applet-wavelet-internal-purchase-return-applet#25] [src:gh:bigledger/blg-int-general-task#9555]
- 2026-09-05 — Backend has a purchase-return file importer with a CCY rate column, but the applet UI exposes no File Import menu. [src:gh:bigledger/blg-akaun-platform-java#46] [src:…/src/app/models/menu-items.ts]

## How it connects

- **internal-purchase-debit-note-applet** — same amount sign, no stock; the two are the "reduce supplier balance" pair.
- **internal-purchase-invoice-applet / internal-purchase-grn-applet** — sources for the Search tab; the GRN page (next in queue) should mention that returns can be built from GRN lines.
- **sales-return** — intercompany mirror (PR → SR, qty −1 → +1 handled by the pair table).
- **stock-balance** — FINAL validates stock at the return location; the most common failure mode.
- **e-invoice** — purchase doc type; SELF-BILLED bulk action.

## Open questions

- `DATE_TXN_LOGIC` default `ADJUSTED` is not one of the four dropdown values — what does the backend do with it? (Treated as "keep keyed date" in the page.)
- Should File Import be exposed in this applet's UI, given the backend importer exists?

## Wiki impact

- Page rewritten. Sales Return (Internal) page (other lane) should add `internal-purchase-return-applet`. GRN page should describe "return from GRN lines".
