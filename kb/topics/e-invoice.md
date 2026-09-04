---
topic: e-invoice
aliases: []
applets: ["my-einvoice-admin", "my-einvoice-portal", "my-peppol-admin"]
modules: []
related: ["sales-invoice", "sales-return", "consolidated-e-invoice", "tax-codes"]
wiki:
  - content/en/guides/einvoice-guides/
  - content/en/applets/e-invoice/
status: seed
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

## How it connects

- **sales-invoice** — to examine: what in the facts above changes this neighbour?
- **sales-return** — to examine: what in the facts above changes this neighbour?
- **consolidated-e-invoice** — to examine: what in the facts above changes this neighbour?
- **tax-codes** — to examine: what in the facts above changes this neighbour?

## Open questions

- Which of these commits changed user-visible behaviour vs internal plumbing? (read the diffs)

## Wiki impact

- Review the pages under `wiki:` against the facts once the diffs are read.
