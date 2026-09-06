---
topic: e-invoice-self-billed
aliases: [self-billed e-invoice, EINVOICE_SELF_BILLED, foreign supplier e-invoice, purchase e-invoice, EI00000000030]
applets: [myIEnvoiceAdminApplet, internalPurchaseInvoiceApplet]
modules: [e-invoice, purchasing]
related: [e-invoice, e-invoice-tin-and-identity-validation, e-invoice-reconciliation, e-invoice-consolidation, internal-purchase-invoice-applet, internal-purchase-credit-note-applet, internal-purchase-debit-note-applet, internal-purchase-return-applet, supplier-maintenance, chart-of-accounts, doc-item-maintenance, emp-etl-sync]
wiki:
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
  - content/en/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet.md
status: growing
updated: 2026-09-06
---

# Self-billed e-invoices (you issue the e-invoice for your supplier)

In some transactions LHDN makes the **buyer** issue the e-invoice — imported services, payments to
suppliers who are not required to e-invoice, commissions, and similar. In BigLedger these are ordinary
purchase documents flagged as self-billed; they enter exactly the same pipeline as sales e-invoices,
with the roles swapped: your company is the buyer and the supplier is the issuer of record. Almost
every recurring problem in this area comes from the purchase side having thinner master data than the
sales side.

## Facts

### How a purchase document becomes an e-invoice

- 2026-09-01 — Supplier/buyer roles by document type: for sales types the **company** is supplier and the **entity** is buyer; for purchase types (`INTERNAL_PURCHASE_INVOICE`, `INTERNAL_PURCHASE_SELF_BILLED_INVOICE`, purchase debit / credit / refund note, purchase return) the **entity** is supplier and the **company** is buyer. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#supplier-and-buyer-determination]
- 2026-09-01 — The entry-gate trigger admits a purchase document only when its self-billed flag is true; a purchase document that is not self-billed goes instead into the **purchase-document matching queue** (for reconciling against the supplier's own e-invoice), provided the supplier has a TIN. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#trigger-processors]
- 2026-09-01 — Identity fallbacks on a self-billed document apply to the **supplier**: supplier has TIN but no ID value → `000000000000`; supplier has an NRIC ID value but no TIN → `EI00000000010`. `EI00000000030` is the foreign-supplier general TIN. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#general-tin-and-id-mapping] [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#general-tins]
- 2026-09-01 — Consolidated by branch splits purchase groups by supplier TIN into general public (`EI00000000010`), foreign supplier (`EI00000000030`) and government (`EI00000000040`) buckets — so self-billed documents can be consolidated too. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#tin-based-grouping]
- 2026-04-02 — The self-billed flag can be supplied through the Purchase Invoice file import: a request to add `EINVOICE_SELF_BILLED` to the import's source fields was raised for a customer importing supplier invoices in bulk. [src:gh:bigledger/blg-intranet#4186]
- 2026-04-02 — Upload-with-retry flows for self-billed purchase invoice, purchase debit note and purchase credit note were specified as separate work items. [src:gh:bigledger/blg-intranet#4250] [src:gh:bigledger/blg-intranet#4249] [src:gh:bigledger/blg-intranet#4248]

### The classification-code gap on expense lines

- 2026-08-05 — A self-billed line usually comes from a **GL/expense mapping**, not a stock item, so it has no item master to inherit the LHDN item-classification code from. The legacy platform's GL Code configuration has **no classification field at all**, and the ETL therefore delivers lines with `einvoice_item_classification_code` empty — which either mis-classifies or fails at submission. Requested: a classification-code column on GL Code maintenance plus ETL population, with a documented precedence (line explicit > GL-code value > item/category default). [src:gh:bigledger/blg-intranet#5627]
- 2026-04-02 — The same gap on the BigLedger side of imports: when a GL code is imported and turned into a selectable item, the import must also carry **item classification description, e-invoice tax type code and e-invoice UOM** "for self-billed e-invoice purposes". [src:gh:bigledger/blg-intranet#4191]
- 2026-03-09 / 2026-06-22 — Two historical data-fix rounds populated `einvoice_item_classification_code` on generic-document lines after the fact, for sales invoice, credit note, order and purchase invoice. [src:gh:bigledger/blg-intranet#108] [src:gh:bigledger/blg-intranet#1656]
- 2026-09-01 — Safety net at submission time: a blank classification defaults to `022 Others` and a blank UOM to `H87 piece`. Wrong non-blank values are sent as-is. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#line-default-rules]

### Document numbering: the "duplicate" that isn't

- 2026-08-01 — Sales invoices and self-billed purchase invoices draw their document numbers from **independent sequences that both start at 1000001**, keyed on `(txn_type, doc_type)` with nothing coordinating the ranges. The same numeric document number therefore legitimately exists twice — once outbound, once self-billed. [src:gh:bigledger/blg-intranet#5588]
- 2026-08-01 — Measured on one tenant: 150 foreign-currency e-invoices over 130 distinct source-document numbers produced **20 colliding numbers**; the local-currency set produced none, because that tenant's self-billed invoices are all for overseas suppliers billed in a foreign currency. The currency is a symptom of the mix, not a cause. [src:gh:bigledger/blg-intranet#5588]
- 2026-08-01 — Because the e-invoice submission listing does **not show the document type or direction**, the collision reads on screen as a duplicate submission — and the customer's instinct is to cancel. A read-only check showed 185 rows, 185 distinct source documents, 185 distinct LHDN document GUIDs: no duplicate existed. Asks: separate the numeric ranges (or prefix by type) and show `server_doc_type` / direction as a column. [src:gh:bigledger/blg-intranet#5588]

### Support reality

- 2026-06-22 — Self-billed e-invoices are a recurring "please explain / please do it for me" support class: customers ask what a self-billed e-invoice is, ask for help issuing one from the batch pool, and need the purchase side processed by support. [src:gh:bigledger/blg-intranet#1869] [src:gh:bigledger/blg-intranet#2060] [src:gh:bigledger/blg-intranet#2028] [src:gh:bigledger/blg-intranet#1222]
- 2026-07-07 — The Discrepancies Report was extended to cover self-billed, cash-bill and consolidated e-invoices, i.e. the purchase side is reconciled in the same report as the sales side. [src:gh:bigledger/blg-intranet#3367]

## How it connects

- **e-invoice-tin-and-identity-validation** — on a self-billed document the failing identity is the supplier's; foreign suppliers use `EI00000000030` and (as individuals) passport ID type.
- **internal-purchase-invoice-applet** — where the self-billed flag lives, including on file import.
- **chart-of-accounts / doc-item-maintenance** — the classification code for an expense line has to come from somewhere; today it usually does not.
- **e-invoice-reconciliation** — non-self-billed purchase documents feed the matching queue instead, and the two paths must be told apart when tallying.
- **emp-etl-sync** — for synced tenants the classification gap and the missing supplier TIN both originate upstream.
- **e-invoice-consolidation** — purchase-side consolidation groups by supplier TIN, including the foreign-supplier general TIN.

## Open questions

- Which purchase document types can be self-billed today, and is the flag a checkbox on the document, a supplier default, or import-only? → kb/questions/2026-09-06-einvoice-self-billed-scope.md
- Has the sales / self-billed numbering collision been separated, and does the submission listing now show the document type?

## Wiki impact

- **New guide** — "Issuing a self-billed e-invoice" is the biggest missing user guide in this area: the guides folder never mentions self-billed except in a list of document formats.
- `my-e-invoice-admin-applet.md` — add the numbering-collision note to Troubleshooting ("the same document number appears twice — this is a sales invoice and a self-billed purchase invoice, not a duplicate; check the document type before cancelling anything").
- `modules/e-invoice/_index.md` — the self-billed row of the four-document-types table is right in principle but says nothing about who supplies the classification code.
