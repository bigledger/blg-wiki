---
topic: e-invoice
aliases: []
applets: ["my-einvoice-admin", "my-einvoice-portal", "my-peppol-admin"]
modules: []
related: ["sales-invoice", "sales-return", "consolidated-e-invoice", "tax-codes", "my-e-invoice-admin-applet", "my-e-invoice-portal-applet", "mypeppol-admin-applet", "organisation-applet", "customer-applet"]
wiki:
  - content/en/guides/einvoice-guides/
  - content/en/applets/e-invoice/
status: growing
updated: 2026-09-05
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

## How it connects

- **sales-invoice** — the e-invoice tab, `einvoice_submission_type` and `skip_einvoice` are set here; nothing is submitted from the document applet.
- **sales-return** — returns/credit/debit/refund notes carry `original_einvoice_lhdn_document_guid`; the buyer info now loads from the admin applet's records (commit 20843ee6e0).
- **consolidated-e-invoice** — batch pool → by-document or by-branch consolidation → consolidated submission queue; buyer General Public; timezone fix 2026-08-20.
- **tax-codes** — line taxable-type codes `01`/`06` are defaulted from the tax amount when blank; tax exemption fields capped at 300 chars (commit 9a9ab000a1).

## Open questions

- Which of these commits changed user-visible behaviour vs internal plumbing? (read the diffs)

## Wiki impact

- Review the pages under `wiki:` against the facts once the diffs are read.
