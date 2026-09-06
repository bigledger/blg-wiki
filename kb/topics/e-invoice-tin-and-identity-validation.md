---
topic: e-invoice-tin-and-identity-validation
aliases: [buyer TIN, TIN validation, NRIC validation, general TIN, CF324, CF358, ERR245, ID type, Bulk TIN Validation, TIN auto-search]
applets: [myIEnvoiceAdminApplet, myEInvoicePortalApplet]
modules: [e-invoice]
related: [e-invoice, e-invoice-submission-errors, e-invoice-consolidation, e-invoice-address-and-state-codes, e-invoice-self-billed, customer-maintenance, supplier-maintenance, entity-applet, emp-etl-sync]
wiki:
  - content/en/guides/einvoice-guides/einvoice-validation.md
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
status: growing
updated: 2026-09-06
---

# Buyer and supplier identity on an e-invoice (TIN, ID type, ID value)

Every e-invoice carries a tax identification number (TIN) plus an identity document type and value for
both the supplier and the buyer. Most LHDN rejections in production are this one field group being
wrong — a foreign customer keyed as a Malaysian, a national ID copied in with hyphens, an invisible
character pasted from a browser, or a "general" TIN used where LHDN only allows a real one. This note
holds what the identity rules actually are and what the failures look like at scale.

## Facts

### The general TINs and the rules that govern them

- 2026-09-01 — LHDN publishes four general TINs: `EI00000000010` general public / local buyer, `EI00000000020` foreign buyer, `EI00000000030` foreign supplier, `EI00000000040` government / armed forces. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#general-tins]
- 2026-09-01 — `EI00000000010` is primarily a **consolidated** e-invoice value. On an **individual** e-invoice it is accepted only with `id_type = NRIC` **and** a valid NRIC number; with BRN or passport LHDN returns Invalid. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#wrong-usage-of-general-tin]
- 2026-09-01 — Even with a correct buyer TIN, a line carrying item classification `004` (reserved for "Consolidated e-Invoice") makes an individual e-invoice Invalid. Fix the classification on the to-IRB line, then Save and Resubmit. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#wrong-usage-of-general-tin]
- 2026-09-01 — The error LHDN returns for general-TIN misuse is `ERR245` on property path `document.Invoice.Ac…` with the message "Only General TIN (010) …" (Malay text also returned). It appears in the applet's **Validation Error Table** next to the property name `CustomerTin`. [src:refs/blg-intranet/content/1100-malaysia-einvoice/images/wrong-general-tin-usage.png]
- 2026-09-01 — Fallbacks applied automatically after the header is built (`updateDocWithGeneralTinAndId`): buyer has a TIN but no ID value → ID value set to `000000000000`; buyer has an NRIC ID value but no TIN → TIN set to `EI00000000010`. The mirror rules apply to the supplier on self-billed purchase documents. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#general-tin-and-id-mapping]
- 2026-06-22 — A customer submitted individual e-invoices with the **government** general TIN and had them returned Invalid — the government TIN is not a general-purpose stand-in either. [src:gh:bigledger/blg-intranet#4567]

### What actually fails, measured

- 2026-07-28 — On one large multi-company tenant, 448 submission-queue rows carried a recorded LHDN rejection: `CF324` (identification number is not a valid NRIC — buyer) 426, `CF358` (invalid buyer TIN) 12, `CF343` 9, `CF323` 5, `CF357` 2. [src:gh:bigledger/blg-intranet#5567]
- 2026-07-28 — Those 426 `CF324` rejections decompose into three data shapes: **322** where the NRIC is not 12 digits (foreign customers entered under ID type NRIC instead of PASSPORT), **82** where the NRIC is stored **with hyphens**, and **20** where a **business registration number was typed into the NRIC field**. [src:gh:bigledger/blg-intranet#5567]
- 2026-07-28 — The hyphen is on its own sufficient to cause rejection: on the same tenant 1,803 documents with a clean unhyphenated NRIC passed LHDN validation and **none** of the 19 distinct hyphenated NRICs ever passed. [src:gh:bigledger/blg-intranet#5567]
- 2026-07-28 — The `CF358` "invalid buyer TIN" cases were caused by a **zero-width space (U+200B)** pasted into the TIN field from a browser or PDF: a TIN that renders as 13 characters has a stored length of 14 and its bytes contain `e2808b`. No one inspecting the field on screen can see it. Requested fix: strip hyphens, whitespace and zero-width/format characters (U+200B, U+200C, U+200D, U+FEFF) before the payload is built, and validate "NRIC = exactly 12 digits" **before** the HTTP call so the user gets a readable local reason instead of a bare FAILED. [src:gh:bigledger/blg-intranet#5567]
- 2026-09-03 — TIN values are stripped of spaces on save in customer maintenance (shipped). The hyphen and zero-width-character cases were still open at that date. [src:gmail:1a0663d23d98e303] [src:gh:bigledger/blg-intranet#5567]

### Finding the right TIN

- 2026-09-01 — **TIN auto-search**: when `amount_txn >= 10,000` and the buyer's (or, on a purchase document, the supplier's) ID type is `BRN` with a blank TIN, the processor queries LHDN for the TIN by ID value and, if found, writes it back to the entity record, the document JSON and the to-IRB header. Below RM 10,000 no search happens. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#tin-auto-search]
- 2026-09-01 — LHDN's own integration guidance (carried in the internal workflow diagram) is that the TIN validation API should be called **when the buyer entity is defined in the ERP and the result cached** — not before every submission. Repeated per-document calls are rate-limited per client ID and may be treated as malicious activity. [src:refs/blg-intranet/content/1100-malaysia-einvoice/flow-chart/lhdn-core-workflow.drawio]
- 2026-06-22 — A "retrieve taxpayer data from the MyInvois QR code" endpoint was built, giving a second way to capture a counterparty's verified identity. [src:gh:bigledger/blg-intranet#4598]
- 2026-09-01 — Bulk correction path: **Tools → Bulk TIN Validation** takes a CSV; each row is queued and, on approval, writes `einvoice_tax_id_no` onto the entity and clears the queue row. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#general-tin-and-id-mapping]
- 2026-09-03 — The month-end pattern support and customers actually run: support sends a spreadsheet of Invalid rows, the customer looks each correct TIN up on the MyInvois portal, and the TINs are patched and resubmitted with the original document date preserved. [src:gmail:1a066f3fb420ca81]

### Where the wrong identity comes from

- 2026-04-02 — Design rule: the buyer/supplier information sent to LHDN must come from `bl_fi_generic_doc_hdr` (the snapshot on the document), **not** live from the entity master — a later edit to the customer record must not change an already-issued document. [src:gh:bigledger/blg-intranet#4361]
- 2026-09-01 — Resolution order for the buyer on a sales document: `einvoice_buyer_entity_hdr_json` → `einvoice_entity_hdr_json` → the entity record; for the supplier on a self-billed purchase document: `einvoice_supplier_entity_hdr_json` → `einvoice_entity_hdr_json` → the entity record. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#custom-entity-json-priority] [src:refs/blg-intranet/content/1100-malaysia-einvoice/images/einvoice-entity-json-priority-chart.jpg]
- 2026-06-22 — Gap in that chain: pool rows mapped from a generic document do not always carry `einvoice_buyer/supplier_entity_json`, so a clerk who keys a walk-in customer's details straight into the pool row and presses Save and Resubmit can lose them. Requested fix: always populate the JSON from `doc_entity_guid` when it is null or empty. [src:gh:bigledger/blg-intranet#2032]
- 2026-04-02 — For tenants fed by the legacy platform, a **default customer TIN** is configured at the ETL source; if the master is wrong there, every synced document is wrong. [src:gh:bigledger/blg-intranet#3781]

### Which counterparty record is actually sent (source-verified 2026-09-06)

`MyEInvoiceToIRBProcessorService.handleSalesDoc` / `handlePurchaseDoc` resolve the counterparty in a
three-step ladder, and this is what the internal `einvoice-entity-json-priority-chart` asset encodes:

1. the role-specific block on the document — `einvoice_buyer_entity_hdr_json` on a sales document,
   `einvoice_supplier_entity_hdr_json` on a purchase document — **if it is not empty**;
2. otherwise the document's general block, `einvoice_entity_hdr_json`, if that is not empty;
3. otherwise the linked entity record (`doc_entity_hdr_guid`), read fresh at submission time.

**"Not empty" means any one of eight fields is non-blank** — e-mail, entity ID, ID number, entity name,
ID type, phone, tax number, service-tax number (`isBuyerEntityEmpty` / `isGeneralEntityEmpty` /
`isSupplierEntityEmpty`). So a *partially* typed on-document override wins the whole block and the
master record is never consulted: the other seven fields go to LHDN blank even though they are correct
on the customer record. This is the mechanism behind "the customer record looks right and the document
still fails". [src:git:blg-akaun-platform-java@1ff620ef0e]

A separate gap-filler runs only on TEMP documents built from an e-invoiced source (a Sales Return raised
off a Sales Invoice): `GenericDocumentService.fillMissingEInvoiceBuyerFromToIrb` back-fills blank buyer
fields from the source's to-IRB header, never overwriting a value already present. [src:git:blg-akaun-platform-java@1ff620ef0e]

## How it connects

- **e-invoice-submission-errors** — identity defects are the largest single class of Invalid results, and until the pre-flight validation asked for in #5567 exists they are only visible after LHDN answers.
- **e-invoice-consolidation** — a buyer whose TIN cannot be found is normally sent to consolidation under `EI00000000010`; that escape hatch is closed at RM 10,000 and above, and closed entirely for foreign buyers.
- **e-invoice-address-and-state-codes** — the same master-data record supplies the address; a document usually fails on both or neither.
- **e-invoice-self-billed** — on a self-billed purchase e-invoice the identity rules apply to the **supplier**, and `EI00000000030` is the foreign-supplier stand-in.
- **customer-maintenance / supplier-maintenance** — ID type must be `PASSPORT` for a non-Malaysian individual, `BRN` for a company, `NRIC` only for a 12-digit Malaysian national ID; this is where the fix belongs, not on the e-invoice record.
- **emp-etl-sync** — synced tenants inherit the identity data of the legacy system, including its formatting habits (hyphens).

## Open questions

- Has the hyphen / zero-width-character normalisation asked for in #5567 shipped? If yes the guide should say so; if not, the guide must tell readers to key NRIC as 12 digits with no separators. → kb/questions/2026-09-06-einvoice-identity-normalisation-status.md
- Is there a customer-visible pre-submission identity check anywhere (document applet, pool screen), or is LHDN still the first validator?

## Wiki impact

- `einvoice-validation.md` — add a short "Get the ID type right first" block: PASSPORT for non-Malaysians, BRN for companies, NRIC = 12 digits no dashes; warn about pasted invisible characters.
- `einvoice-validation.md` — name `CF324` and `CF358` explicitly with the three data shapes; today the guide describes general-TIN misuse but not the NRIC-format class, which is far larger.
- `my-e-invoice-admin-applet.md` — Bulk TIN Validation deserves a worked "here is the month-end TIN clean-up loop" sentence.
