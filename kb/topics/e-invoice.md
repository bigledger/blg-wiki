---
topic: e-invoice
aliases: []
applets: ["my-einvoice-admin", "my-einvoice-portal", "my-peppol-admin"]
modules: []
related: ["sales-invoice", "sales-return", "e-invoice-consolidation", "e-invoice-submission-errors", "emp-etl-sync", "e-invoice-ocr-intake", "e-invoice-peppol", "e-invoice-cancellation-and-credit-notes", "e-invoice-self-billed", "e-invoice-tin-and-identity-validation", "e-invoice-address-and-state-codes", "e-invoice-throughput-and-limits", "e-invoice-reconciliation", "tax-codes", "my-e-invoice-admin-applet", "my-e-invoice-portal-applet", "mypeppol-admin-applet", "organisation-applet", "customer-applet"]
wiki:
  - content/en/guides/einvoice-guides/
  - content/en/applets/e-invoice/
status: growing
updated: 2026-09-06
---

# E Invoice

Malaysian LHDN MyInvois e-Invoice: submission of sales and purchase documents to the tax authority (IRB), validation, consolidation by branch, PEPPOL exchange, and printing the validated e-Invoice.

## Facts

_Seeded from blg-akaun-platform-java commits, last 90 days (2026-06-07 → 2026-09-05). Commit subjects only — each needs reading before it becomes a wiki statement. Customer names replaced with "[a customer]"._

- 2026-09-03 — [a customer]/issues/2 #2 [a customer]: Sales Return applet > search by Sales Invoice > einvoice buyer info does not load from My-Einvoice Applet [src:git:blg-akaun-platform-java@20843ee6e0]
- 2026-08-26 — bigledger/[a customer]/issues/229 #229 BE: Header Tax Exemption Fields stream to 300 Characters due to LHDN limit [src:git:blg-akaun-platform-java@9a9ab000a1]
- 2026-08-20 — bigledger/blg-intranet/issues/5427 #5427 E-Invoice bug: no duplicate guard in batch-pool push & consolidation (double LHDN submission) + CANCEL_FOR_EDIT_AND_RES [src:git:blg-akaun-platform-java@e57b5757fd]
- 2026-08-20 — bigledger/blg-intranet/issues/5663 #5663 Einvoice - Consolidated by branch endpoint has timezone issue [src:git:blg-akaun-platform-java@b86abf0543]
- 2026-08-18 — Feat: Added `GET /backoffice-ep/print-jasper-pdf` on `MyEInvoiceToIrbController`, resolving the to-IRB header by `branchCode`+`serverDocType`+`docReference` [src:git:blg-akaun-platform-java@0299a848fd]
- 2026-08-17 — ref bigledger/[a customer]#505, fix einvoice vs B2B matching processor, service and uow [src:git:blg-akaun-platform-java@477005fd5a]
- 2026-07-29 — bigledger/blg-intranet/issues/5556 New API to Remove AR/AP Outstanding Amount from ETL E-Invoice Data from EMP [src:git:blg-akaun-platform-java@44ba677ca5]
- 2026-07-24 — [a customer]/issues/2 #2 Rebecca - Ability to Download Multiple Einvoice PDF Printable in Batch. In a Zip File [src:git:blg-akaun-platform-java@da497c5e22]
- 2026-07-22 — Feat: Add IRB submission, submission-received, and issue datetime fields to e-invoice print model and printable templates for compliance and tracking display [src:git:blg-akaun-platform-java@f9a3e84d81]
- 2026-07-21 — Revert "Add IRB submission, submission-received, and issue datetime fields to e-invoice print model and printable templates for compliance and tracking display. [src:git:blg-akaun-platform-java@f4c1fe07b1]
- 2026-07-21 — Add IRB submission, submission-received, and issue datetime fields to e-invoice print model and printable templates for compliance and tracking display. [src:git:blg-akaun-platform-java@3d6da8a958]
- 2026-07-14 — Feat: Added tax_exemption_details/amount as parameters into both JRXML templates and EInvoicePrintModel.java. [src:git:blg-akaun-platform-java@e8717aceff]
- 2026-07-09 — bigledger/[a customer]/issues/197 #197 Issue 1: Fix Forced Default Mapping for Optional LHDN Prepayment Fields [src:git:blg-akaun-platform-java@0e6b3beae3]
- 2026-07-09 — bigledger/[a customer]/issues/294 #294 TMT : E-Invoice Applet - Create New Report for Transaction that in queue under SUBMITTED status [src:git:blg-akaun-platform-java@9511ab0817]
- 2026-07-07 — ref bigledger/[a customer]#420, update matching logic for B2B vs E-Invoice summary [src:git:blg-akaun-platform-java@518cc0caac]
- 2026-07-04 — bigledger/blg-akaun-platform-java/issues/2070 #2070 E-Invoice: consolidated submission rejected LHDN CV317 — supplier address wrongly sent state code 17 (LHDNSu [src:git:blg-akaun-platform-java@0aae8e86ca]
- 2026-07-04 — Revert "bigledger/blg-akaun-platform-java/issues/2070: new lhdn state code ru… " [src:git:blg-akaun-platform-java@e5748c414c]
- 2026-07-04 — bigledger/blg-akaun-platform-java/issues/2070: new lhdn state code ru… [src:git:blg-akaun-platform-java@c9031493e8]
- 2026-06-10 — Fix: Fixed the Skip E-Invoice toggle for internal purchase credit notes in the backend [src:git:blg-akaun-platform-java@c3a2e0f5ac]
- 2026-06-08 — feat: Added SIC_CODE to the InternalPurchaseInvoiceImportFileColumnNames [src:git:blg-akaun-platform-java@ed43deb9f0]

### Verified facts from the internal e-invoice README, the backend and issues (run 6, 2026-09-05)

_Extracted, not copied. Tenant-specific tables (consolidation schedule per tenant, PICs) deliberately omitted._

- 2026-09-05 — Pipeline = 3 trigger processors at FINAL (`GENERIC_DOCUMENT_E_INVOICE_POSTING_QUEUE_PROCESSOR`, `E_INVOICE_SALES_DOC_MATCHING_QUEUE_PROCESSOR`, `E_INVOICE_PURCHASE_DOC_MATCHING_QUEUE_PROCESSOR`) + 8 cron processors (intermediary token every ~20 min; generic-doc-to-IRB up to 5000 iterations; batch cycle run with 6 h advisory lock; consolidated submission; to-IRB submission ×50; validation status update ×20; e-mail printable ×10 with 5 retries and 15 min lock; individual-pool failure e-mail). [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md "Required Processors"]
- 2026-09-05 — General TINs: `EI00000000010` general public/local buyer, `EI00000000020` foreign buyer, `EI00000000030` foreign supplier, `EI00000000040` government. `EI00000000010` on an individual e-invoice is accepted only with ID type NRIC + valid NRIC; with BRN/passport, or with line classification `004`, LHDN returns Invalid. [src:README.md "General TINs", "Wrong usage of general tin"]
- 2026-09-05 — Routing decision (23 scenarios): submission type × amount (RM 10,000 inclusive, only SINV/SCSH enforced) × TIN present × mandatory fields → to-IRB / batch pool / individual pool / single-general pool. `SINGLE-GENERAL` + <10k + missing fields → single-general pool; `NULL` + <10k + missing → batch pool; any ≥10k + missing → individual pool. [src:README.md "EInvoice Document Movement"] [src:refs/blg-intranet/content/1100-malaysia-einvoice/images/E-inv 10K Simulation - Scenarios.csv]
- 2026-09-05 — Address rules: line 1 (150), city (50), state mandatory; postal 5; state resolved exact → cleaned → contains → alias (KL/WPKL → 14, Penang → 07, NS/N9 → 05, Melacca → 04 …); unresolved → empty, user keys manually; code 17 no longer accepted (CV317). Country default `MYS`; foreign state_code = state text or country code. [src:README.md "EInvoice Address Construction"] [src:gh:bigledger/blg-akaun-platform-java#2070]
- 2026-09-05 — Line defaults: tax null/zero → taxable type `06`; non-zero with blank/`06` → `01`; blank classification → `022 Others`; blank UOM → `H87 piece`; item_desc_no = `item_code;item_name;item_remarks` (or company config), 300 chars, sanitised. Only `txn_type = PNS` lines are sent. [src:README.md "Line Default Rules", "item_desc_no Construction"]
- 2026-09-05 — Forex: `base_doc_ccy` must be MYR (DC511 "Foreign target currency should always be MYR"); company `einvoice_forex_gendoc_posting_logic` decides whether the forex child (`base_doc_guid` = parent) or the MYR parent is submitted; default POST_FOREX_DOC. [src:README.md "Foreign Currency (Forex) Document Handling", "Wrong forex base doc ccy"]
- 2026-09-05 — CN/DN/RN/return reference: `original_einvoice_lhdn_document_guid` must point at the currently Valid original; after the original is resubmitted the reference must be updated or cleared (DR303/DR308). [src:README.md "Reference Einvoice is wrong…"]
- 2026-09-05 — Cancellation: 72 h from `validation_datetime` (UTC) enforced by backend and LHDN; rejection-request workflow is manual (create → approve + logic → submit-to-lhdn); `CANCEL_FOR_EDIT_AND_RESUBMIT` is the only logic valid for consolidated e-invoices; `bulk-cancellation` is a direct path with hard-coded reason "Duplicated EInvoice."; past 72 h → credit-note path with accountant sign-off. [src:README.md "E-Invoice Cancellation & Rejection Requests"] [src:gh:bigledger/blg-intranet#5427]
- 2026-09-05 — Duplicate-submission patterns: double batch-pool push; individual + consolidated of the same doc. Detection SQL exists internally; backend dedupe added 2026-08-20. [src:README.md "Duplicate submission…"] [src:gh:bigledger/blg-intranet#5427]
- 2026-09-05 — Consolidated by branch: gaps-and-islands over `server_doc_3`, split by branch, doc type, month bucket and general TIN; max 200 lines; UOM `XUN`; consolidation fails when `server_doc_1`/`server_doc_3` is NULL on the pool row. [src:README.md "Consolidated By Branch", "Troubleshooting at database-level"]
- 2026-09-05 — Monthly ops checklist (1st–7th): settle previous month's unprocessed batch pool → confirm with client → push failed/invalid (<10k, sales types) to batch pool → consolidate (by doc per type, or by branch after setting buyer_tin to general public) → submit consolidated queues (cron or manual) → soft-delete the old IN_QUEUE to-IRB rows to avoid double submission → tally BLG vs e-invoice totals. [src:README.md "SQL-based documentation", "Tallying E-Invoice"]
- 2026-09-05 — Peppol runs beside LHDN: waiting queue gated on mandatory fields + participant IDs, not on LHDN Valid. [src:akaun-api/.../jobProcessor/peppol/PeppolPostingQueueToWaitingQueueProcessor.java L123–L146]

### From project notes (Drive) and customer/support e-mail, 2026-08-04 → 2026-09-04 (ingest 2026-09-05)

_Anonymised. Operational detail is in `e-invoice-consolidation`, `e-invoice-submission-errors`, `emp-etl-sync`; only the facts that change how the product is described are repeated here._

- 2026-08-04 — Design direction: e-invoice becomes self-service with minimal user intervention; processor configuration moves from database edits into Organization Applet settings, including a per-company e-invoice enable/disable switch. [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-08-04 — Skip logic can exclude a customer or a single document from e-invoicing; documents of RM 10,000 and above without buyer details remain the main manual burden (blocking at entry was discussed, not decided). [src:gdrive:1NaxUJFipY9bbuKPcPIiU59rIQ9MUFG6OJ70w4HUhlo0]
- 2026-08-11 — A consolidated e-invoice cannot contain foreign buyers; a foreign recipient is keyed with ID type Passport and submitted individually. Government-entity buyers pending LHDN guidance review. [src:gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8]
- 2026-08-11 — The individual-pool failure e-mail is to be sent daily (not only at cycle end); an admin dashboard of reconciliation errors filtered by invoice date and Invalid code is planned. [src:gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8]
- 2026-08-26 — Automated consolidated-submission processor went live for a first group of companies for the August cycle after the duplicate-push, timezone and missing-server-doc fixes; pilot widened 2026-09-01, aim is all tenants automated from September 2026. [src:gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA] [src:gdrive:1hMhWYLFK2em4cqdU-P4oNt-jTpklJBEGdtO6V02YlG4]
- 2026-08-26 — SVDP (Special Voluntary Disclosure Programme) documents will be flagged through the existing Submission Type field, sent as payload version 1.3 through a dedicated pool (single-general model), FINAL status required, auto-submitted when complete. Not yet shipped. [src:gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA]
- 2026-08-26 — Maximum lengths for amount and number fields are validated in the Java/TypeScript SDK layers rather than by changing database columns. [src:gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA]
- 2026-09-03 — Submission History export shows the status at the time of submission; the live LHDN status is on the To IRB E-Invoice export. E-Invoice Number (and client_doc_1) blank on exports was a running-number sync timing gap, now fixed in the processing service; one recurrence traced to a processor database-connection timeout. [src:gmail:1a066c168bdcd3cb] [src:gmail:1a0663d23d98e303] [src:gmail:1a06ba1478ffadde]
- 2026-09-02 — Observed submission throughput at one large tenant: ~100 e-invoices per 2 hours; a speed-up enhancement was pending review. [src:gmail:1a05ff766425665d] [src:gmail:1a0609d7143fa9b7]
- 2026-09-03 — Resubmitting an Invalid e-invoice with a corrected TIN keeps the original document date (month-end) — the customer relies on this to stay inside the LHDN month. [src:gmail:1a066f3fb420ca81]
- 2026-09-03 — TIN values are saved without spaces in customer maintenance. [src:gmail:1a0663d23d98e303]
- 2026-09-04 — An OCR e-mail-intake channel (SES receiving) was scheduled for production deployment; scope unknown. [src:gmail:1a069e68f3133a81]
- 2025-03 (doc modified 2025-04-30) — Positioning: BigLedger e-invoice is offered either as the standalone ERP + e-invoice, or as middleware API for third-party ERPs; LHDN's schema has 55 data fields (37 mandatory, 18 optional). [src:gdrive:15mavZbELP3vYuQbSfc75t46qFFrzIvS2AmO-ctTcyC8]

### From the internal e-invoice knowledge repo — full read of the README, the workflow diagram and 561 issues (ingest 2026-09-06)

_Extracted and anonymised. Tenant-specific material (per-tenant consolidation schedules, named staff, real TINs, document numbers and LHDN UUIDs) stays in kb/private. Identity, address, cancellation, self-billed, Peppol, throughput and reconciliation facts now live in their own topic notes; this section keeps what belongs to the pipeline as a whole._

**How a document enters the pipeline**

- 2026-09-01 — The gate is `posting_status = FINAL` **and** the company's e-invoice status is `ENABLED` **and** the document type is e-invoiceable **and** `skip_einvoice` is false **and** no active posting-queue row already exists for the same document number and type. Any one of those failing consumes the event and writes nothing at all — no queue row, no pool row, no error. [src:gh:bigledger/blg-intranet#5618]
- 2026-09-01 — Three trigger processors fire at FINAL: the posting-queue router, a **sales**-document matching queue (for documents finalised with `skip_einvoice = true`, so they can still be matched against an incoming e-invoice) and a **purchase**-document matching queue (for non-self-billed purchase documents whose supplier has a TIN). [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#trigger-processors]
- 2026-09-01 — Eight cron processors run the rest: intermediary token (every ~20 min), generic-document-to-IRB routing (up to 5,000 iterations per run), batch-processing cycle run (6-hour advisory lock), consolidated submission (50 iterations), to-IRB submission (50), validation-status update (20, configurable), e-mail printable (10 per run, 5 retries, 15-minute lock) and the individual-pool failure e-mail. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#cron-processors]
- 2026-09-01 — The internal workflow diagram also shows a `ConsolidatedSubmissionQueueReconstructionProcessor` (payload reconstruction) and a **fourth submission-type branch labelled `multibank`**, neither of which appears in the processor tables or in any wiki page. [src:refs/blg-intranet/content/1100-malaysia-einvoice/flow-chart/lhdn-core-workflow.drawio]
- 2026-08-04 — Enablement is per tenant and hand-configured: the schedule rows are inserted manually, a row whose code is not a recognised processor is **dropped without a log**, the default seed list only runs at tenant creation (so a tenant created before a processor existed never gets it), and there is no completeness check. A tenant's e-invoice processor once stopped submitting for a month before a human noticed. [src:gh:bigledger/blg-intranet#5625]
- 2026-07-16 — The practical consequence for onboarding: activating a tenant means asking someone to switch on a named list of cron and trigger processors. [src:gh:bigledger/blg-intranet#106]
- 2026-08-13 — On a new tenant the LHDN reference tables (industry classification, unit of measure and similar) are **not** auto-populated; an endpoint has to be called by hand. [src:gh:bigledger/blg-intranet#5665]

**Who signs the submission**

- 2026-09-01 — `einvoice_issuer_type` decides where the LHDN token comes from: `INTERMEDIARY` (the default, and what most tenants use) mints a per-company token on behalf of the company's TIN; `ERP` uses a shared token from the master configuration. The issuer company is the supplier for sales documents, the buyer for purchase documents, and whichever is populated for consolidated documents. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#einvoice-issuer-type]
- 2026-09-01 — In the intermediary model the customer must first set BigLedger as their e-invoice intermediary on the MyInvois portal; BigLedger then holds up to three rotating tokens per company per environment, refreshed round-robin every ~20 minutes, and always submits with the newest. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#how-the-intermediary-configuration-is-used]
- 2026-06-22 — **Setup failure customers actually hit:** when granting BigLedger intermediary rights on the MyInvois portal, only one permission is often ticked. The full permission set is required or every submission fails. [src:gh:bigledger/blg-intranet#2048]
- 2026-06-22 — The other recurring setup failure is an **expired intermediary configuration** — the authorisation lapses at LHDN and all submissions stop for that company until it is renewed. Seen repeatedly across tenants. [src:gh:bigledger/blg-intranet#1778] [src:gh:bigledger/blg-intranet#1749] [src:gh:bigledger/blg-intranet#1745]

**What gets built and sent**

- 2026-09-01 — Entity resolution priority for the counterparty: the document's e-invoice buyer/supplier entity JSON, then the general e-invoice entity JSON, then the entity record. When a JSON is used its address block is taken verbatim. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#custom-entity-json-priority]
- 2026-04-02 — Design intent behind that: the e-invoice must be built from the **document snapshot**, not from the live customer master, so editing a customer later cannot change an already-issued document. [src:gh:bigledger/blg-intranet#4361]
- 2026-09-01 — Header defaults on a new individual e-invoice: submission / document / process status `NOT_SUBMITTED`, posting status `FINAL`, e-invoice version `1.1`, `is_consolidated` false, a QR-code digital signature generated from the header, namespace "AUTO CREATED BY PROCESSOR". [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#default-header-values]
- 2026-09-01 — Only lines whose transaction type is the goods/services line type are sent; totals, tax, discounts and payment amounts map one-to-one from the document. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#line-field-mapping]
- 2026-09-01 — Line description sent to LHDN is built as `item_code;item_name;item_remarks` unless the company configures a different pattern, then truncated to 300 characters with URLs and special characters stripped. Customers have asked to have the item code removed from it. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#item_desc_no-construction] [src:gh:bigledger/blg-intranet#1910]
- 2026-09-01 — The e-invoice **running number** is a database sequence optionally suffixed with document-number or client-reference fields from a per-company pattern, truncated to 50 characters. Customers have asked for it to be driven from the document reference instead, and for a **new** running number when a cancelled/invalid/failed e-invoice is resubmitted. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#running-number-construction] [src:gh:bigledger/blg-intranet#4390] [src:gh:bigledger/blg-intranet#4374]
- 2026-09-01 — Billing frequency defaults to "Not Applicable" and the billing period defaults to the first and last day of the current month in Malaysian time when not supplied. Customers ask about these fields often enough that they generate their own support tickets. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#billing-frequency-default] [src:gh:bigledger/blg-intranet#2037] [src:gh:bigledger/blg-intranet#4688]
- 2026-06-22 — Customs and international-trade fields are mapped through to the e-invoice: customs form reference numbers 1 and 2, free-trade-agreement information, certified-exporter authorisation number, other-charges description and amount (header) and product tariff code plus country of origin (line). [src:gh:bigledger/blg-intranet#269] [src:gh:bigledger/blg-intranet#270] [src:gh:bigledger/blg-intranet#271]

**Dates**

- 2026-09-01 — The issue date-time sent to LHDN must be the **current** time at submission; the document's own transaction date is preserved separately. A backdated document is still submitted with "now" as its issue time. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#backdated-individual-einvoice]
- 2026-06-22 — **Future-dated** documents needed their own decision: a company-level setting to either hold them or pass them through, checked in the posting queue before the document is routed to a pool. [src:gh:bigledger/blg-intranet#4376]

**Forex**

- 2026-09-01 — A foreign-currency sale produces two generic documents — the local-currency (MYR) parent and a foreign-currency child pointing at it. The company setting `einvoice_forex_gendoc_posting_logic` decides which one is submitted; the default submits the **foreign-currency child**. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#foreign-currency-forex-document-handling]
- 2026-09-04 — That setting had no user interface: one customer had **both** the foreign-currency and the local-currency version of the same transaction submitted to LHDN, i.e. a genuine double submission. The fix is a configuration on the Organization Applet's e-invoice tab plus a processor change; past double submissions have to be identified by query and reported to LHDN. [src:gh:bigledger/blg-intranet#5803]
- 2026-04-02 — Related open question on the same theme: whether the e-invoice details are copied over to the base (company-currency) document at all. [src:gh:bigledger/blg-intranet#4394]

**Skipping e-invoice**

- 2026-06-22 — `skip_einvoice` can be set on the branch, the entity or the individual document, and is resolved at FINAL. It is used deliberately (the counterparty issues the e-invoice) and set by mistake constantly: a large share of support tickets are "remove documents that should have been skipped" and "push documents where skip was set by mistake". A bulk endpoint exists for both directions. [src:gh:bigledger/blg-intranet#2024] [src:gh:bigledger/blg-intranet#1663] [src:gh:bigledger/blg-intranet#2066] [src:gh:bigledger/blg-intranet#1522]
- 2026-09-01 — A skipped document is excluded from the monthly tally as well as from submission — which is why a **voided document that was not marked skipped** shows up as a tally gap. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#check-5-void-or-draft-documents-not-excluded-from-e-invoice]

**Printing and delivering the validated e-invoice**

- 2026-07-22 — The printable e-invoice carries the IRB submission, submission-received and issue date-times for compliance display. [src:git:blg-akaun-platform-java@f9a3e84d81]
- 2026-06-22 — Customers report a missing QR code on the printed sales invoice, and ask for a larger description font and for tenant-specific printable formats — printable format is a per-company, sometimes per-document-type, choice. [src:gh:bigledger/blg-intranet#3338] [src:gh:bigledger/blg-intranet#4148] [src:gh:bigledger/blg-intranet#4153]
- 2026-07-07 — Automatic e-mailing of the validated PDF is configured per company (mail transport settings on the Organization Applet) and set up per tenant on request. [src:gh:bigledger/blg-intranet#3649] [src:gh:bigledger/blg-intranet#633] [src:gh:bigledger/blg-intranet#46]
- 2026-07-24 — Batch download of e-invoice PDFs as a zip was added for a customer. [src:git:blg-akaun-platform-java@da497c5e22]

**Where the e-invoice touches the document applets**

- 2026-07-07 — The submission history of a document is surfaced on the E-Invoice tab of the sales/purchase invoice, credit note and debit note applets, so a clerk does not have to open the admin applet to see what happened. [src:gh:bigledger/blg-intranet#3706]
- 2026-04-23 — A batch-pool view with update-and-resubmit was requested inside the document applets' E-Invoice tab and inside POS, so the correction can be made where the sale was made. [src:gh:bigledger/blg-intranet#4392] [src:gh:bigledger/blg-intranet#243]
- 2026-01-28 — E-invoice item classification code, tax type and UOM were added to the line grids of both the admin applet and the sales invoice applet, so the values that decide acceptance are visible while keying. [src:gh:bigledger/blg-intranet#1956] [src:gh:bigledger/blg-intranet#1955]

## How it connects

- **sales-invoice** — the e-invoice tab, `einvoice_submission_type` and `skip_einvoice` are set here; nothing is submitted from the document applet.
- **sales-return** — returns/credit/debit/refund notes carry `original_einvoice_lhdn_document_guid`; the buyer info now loads from the admin applet's records (commit 20843ee6e0).
- **e-invoice-consolidation** — batch pool → by-document or by-branch consolidation → consolidated submission queue; buyer General Public; timezone fix 2026-08-20; now processor-driven per company (Aug–Sep 2026 rollout), foreign buyers excluded, SVDP pool planned.
- **e-invoice-submission-errors** — what customers actually hit at month-end: wrong export for status, blank number columns, IN_QUEUE rows, throughput.
- **emp-etl-sync** — tenants fed from the legacy platform fail on sync before LHDN; classification codes are mapped at the source.
- **e-invoice-ocr-intake** — e-mail-in OCR channel being deployed; probably feeds purchase documents into matching.
- **organisation-applet** — per-company e-invoice on/off switch and processor schedule are moving into its settings.
- **customer-applet** — ID type Passport for foreign buyers; TIN saved without spaces; TIN correction is the month-end chore.
- **tax-codes** — line taxable-type codes `01`/`06` are defaulted from the tax amount when blank; tax exemption fields capped at 300 chars (commit 9a9ab000a1).

## Open questions

- Which of these commits changed user-visible behaviour vs internal plumbing? (read the diffs)
- See kb/questions/2026-09-05-einvoice-month-end-report-pack.md, -svdp-submission-type.md, -consolidation-foreign-and-government-buyers.md, -consolidated-sales-returns.md, -ocr-email-intake-scope.md, -emp-etl-sync-on-wiki.md.

## Wiki impact

- Review the pages under `wiki:` against the facts once the diffs are read.
- See kb/research/2026-09-05-einvoice-ingest-wiki-impact.md (13 candidates, F-0119…F-0131).

## How it connects (added 2026-09-06)

- **e-invoice-tin-and-identity-validation** — the buyer/supplier TIN + ID type + ID value group; the largest single cause of Invalid results.
- **e-invoice-address-and-state-codes** — the other half of the same master record; state-code resolution and `default_einvoice_address`.
- **e-invoice-cancellation-and-credit-notes** — what happens after LHDN says Valid and you were wrong.
- **e-invoice-self-billed** — the purchase side of the same pipeline, with the roles swapped.
- **e-invoice-peppol** — the parallel delivery network sharing the same source document and the same mandatory-field check.
- **e-invoice-throughput-and-limits** — why a month-end batch takes hours and why an invoice above ~200 lines has to be split.
- **e-invoice-reconciliation** — how you prove everything arrived once, and the three blind spots in that proof.
- **organisation-applet** — company e-invoice status, issuer type, forex posting logic, running-number and line-description patterns, e-mail transport, and (planned) the forex submission choice and the per-company processor schedule.
- **pos-general-applet** — counter sales are the bulk of consolidated volume; the e-invoice address and the cancel-cash-sale path both live there.

## Open questions (added 2026-09-06)

- What is the `multibank` submission-type branch in the internal workflow diagram? It is in no processor table and no wiki page. → kb/questions/2026-09-06-einvoice-multibank-submission-type.md
- Should the wiki describe the intermediary permission set a customer must grant on the MyInvois portal? It is the commonest hard setup failure and is entirely in the customer's control. → kb/questions/2026-09-06-myinvois-intermediary-permission-set.md
