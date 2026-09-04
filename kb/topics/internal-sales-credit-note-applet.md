---
topic: internal-sales-credit-note-applet
aliases: [sales credit note, credit note, INTERNAL_SALES_CREDIT_NOTE, InternalSalesCreditNote]
applets: [InternalSalesCreditNote]
modules: [financial-accounting, e-invoice]
related: [internal-sales-invoice-applet, internal-sales-return-applet, internal-sales-debit-note-applet, internal-sales-refund-note-applet, internal-receipt-voucher-applet, internal-purchase-credit-note-applet, company-default-gl-codes, contra-settlement, my-e-invoice-portal-applet]
wiki:
  - content/en/applets/sales-workflow/internal-sales-credit-note-applet.md
status: growing
updated: 2026-09-05
---

# Sales Credit Note (Internal)

Reduces a customer's receivable after invoicing. Amount signum −1, quantity signum 0: it reverses the invoice journal (Dr Sales/Output tax, Cr Debtor) and never writes an inventory transaction.

## Facts

- 2026-09-05 — Registry name "Sales Credit Note (Internal)", code `InternalSalesCreditNote` (note: a DELETED row with code `InternalSalesDebitNote` also carries the name "Internal Sales Debit Note"; the ACTIVE credit-note row is unambiguous). [src:planning/private/registry-applets-2026-09-05.tsv]
- 2026-09-05 — Backend validator: server doc type check + amount signum −1; line quantity signum forced to 0. [src:javasdk/…/InternalSalesCreditNoteDataConsistencyObject.java]
- 2026-09-05 — Item search in the Lines tab is NOT filtered to `GL_CODE` items (the filter is commented out); when a `GL_CODE` item is chosen its `glcode_guid` is written to the line and overrides the company `SALES` default. Quantity validators are relaxed for `GL_CODE` items. [src:…/line-search-item-listing.component.ts#L110] [src:…/add-line-item.component.ts#L135-L185] [src:…/main-details.component.ts#L1104]
- 2026-09-05 — Journal: `SALES` handler (DEBTOR, SALES, SALES_DISCOUNT, SALES_RETURN, OUTPUT_TAX, FOREX_GAIN/LOSS); `pnsReturn` (SALES_RETURN) is used only for INTERNAL_SALES_RETURN, so a credit note hits `SALES` unless the line carries its own GL code. [src:javasdk/…/JournalPostingTypeHandler.java#L42-L52] [src:javasdk/…/JournalPostingService.java#L150-L190]
- 2026-09-05 — Menus: Credit Note, Line Items, File Import, Intercompany. Only `HIDE_FILE_IMPORT_MENU` and `HIDE_INTERCOMPANY_MENU` are honoured by app.component; the overriding `SHOW_FILE_IMPORT_MENU` / `SHOW_INTERCOMPANY_MENU` codes are read from client-side permissions but are not defined in `bl_applet_client_side_perm_dfn` for this applet (38 defs, none of them). Same for `SHOW_GENDOC_CLONE_BUTTON` and the `ALLOW_*_ITEM_PRICE_EDIT` family. [src:…/app.component.ts#L39-L108] [src:akaun_master.bl_applet_client_side_perm_dfn]
- 2026-09-05 — Default Selection has only branch, location, `DEFAULT_LANGUAGE_CODE` and tab order (`SALES_CREDIT_NOTE_DETAILS_TAB_ORDER`); 12 tabs: Search Document, Main Details, E-Invoice, Account, Lines, ARAP, Settlement, Department Hdr, TraceDocument, Contra, Attachments, Export. [src:…/default-settings.component.{html,ts}]
- 2026-09-05 — E-Invoice specific setting `ENABLE_ORIGINAL_INVOICE_REF_FIELDS` + `ORIGINAL_INVOICE_REFERENCE_FIELD` (server_doc_1…5 or doc_reference) drives `original_invoice_ref_no` / `original_invoice_ref_no_column_name`. [src:field-configuration.component.html] [src:…/sales-credit-note-edit/]
- 2026-09-05 — Search Document tab searches Sales Invoice, Sales Order, Outbound Delivery Order, Jobsheet. [src:…/search-documents/]
- 2026-09-05 — Settlement types on the credit note: Bank Transfer, Cash, Cheque, Credit Card, Membership Point Currency, Voucher, TT Payment. [src:…/settlement/]
- 2026-09-05 — Intercompany mapping SALES_CREDIT_NOTE → PURCHASE_CREDIT_NOTE. [src:javasdk/…/IntercompanyProcessingService.java#L102]
- 2026-09-05 — Commit-log fixes (anonymised): contra date reset after save; Total Contra now read from header; line-edit form empty (rounding race); PDF date offset (noon UTC); clone button + setting + permission; sales-agent autofill on entity select; duplicate reference check config; CC field in email; full multi-language i18n. [src:git-log:blg-applet-wavelet-internal-sales-credit-note-applet]

## How it connects

- **internal-sales-invoice-applet** — the corrected document; Contra offsets against its open balance.
- **internal-sales-return-applet** — the stock-moving alternative; uses SALES_RETURN GL.
- **internal-sales-refund-note-applet** — pays out a credit balance.
- **internal-purchase-credit-note-applet** — intercompany mirror.
- **company-default-gl-codes** — DEBTOR/SALES/OUTPUT_TAX required.

## Open questions

- Whether the registry gap for `SHOW_FILE_IMPORT_MENU` / `SHOW_INTERCOMPANY_MENU` / `SHOW_GENDOC_CLONE_BUTTON` on this applet is intentional (codes might be seeded per tenant instead) — needs Vincent / backend.

## Wiki impact

- Neighbour pages (return, debit note, refund note, receipt voucher, purchase credit note, e-invoice portal) should list this applet in `related_applets`.
