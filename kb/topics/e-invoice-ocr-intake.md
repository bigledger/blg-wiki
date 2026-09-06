---
topic: e-invoice-ocr-intake
aliases: [OCR e-mail receiving, SES email receiving, e-mail document intake]
applets: []
modules: [e-invoice, purchasing]
related: [e-invoice, e-invoice-reconciliation, e-invoice-self-billed, e-invoice-cancellation-and-credit-notes, internal-purchase-invoice-applet, my-e-invoice-admin-applet, supplier-maintenance]
wiki: []
status: growing
updated: 2026-09-06
---

# OCR intake of documents by e-mail

An inbound e-mail channel (AWS SES e-mail receiving) is being deployed so that documents e-mailed to a BigLedger address can be read by OCR. Only the deployment request has been seen; which documents, which applet, and how it relates to e-invoice matching are unconfirmed.

## Facts

- 2026-09-04 — Production deployment of an "SES Email Receiving Configuration — OCR Email Receiving" was requested for an evening maintenance window (the body's date reads 5 May, evidently 5 September), subject to sign-off on a deployment request form. [src:gmail:1a069e68f3133a81]

### What the OCR pipeline already is (ingest 2026-09-06)

- 2026-07-19 — An OCR **receipt / supplier-invoice pipeline already exists in production** and is separate from the e-mail channel: an uploaded document becomes a scanned-document record with a verification status and a process status, and then an OCR generic document that can be turned into a purchase document. It is used by real customers. [src:gh:bigledger/blg-intranet#5497]
- 2026-07-19 — Its duplicate check is **application-level and scoped to the company the OCR resolved**, with no unique constraint in the database. If OCR resolves the same physical receipt to two different company records, the two uploads are never compared and both are created. The check also **exits without comparing anything** when the transaction date or the resolved company is missing. Draft-versus-finalised status is not a factor. [src:gh:bigledger/blg-intranet#5497]
- 2026-04-30 — Separate reliability gap on the same family: an OCR processor failed and **the error message was never stored** on the task record, so the failure could not be diagnosed after the fact. [src:gh:bigledger/blg-intranet#4617]
- 2026-04-02 — OCR is also the proposed mechanism for a different e-invoice problem: reading LHDN's **rejection notification e-mails** so that a buyer-side rejection reaches BigLedger in near real time, through a dedicated notification queue and history table. Specified, not built. [src:gh:bigledger/blg-intranet#4367]

## How it connects

- **internal-purchase-invoice-applet** — the likely consumer: supplier invoices e-mailed in, OCR-read into purchase documents (unconfirmed).
- **my-e-invoice-admin-applet** — if it creates purchase documents, they would then flow into the purchase-document matching queue against supplier e-invoices from LHDN.

## Open questions

- What does the OCR e-mail intake do, for whom, and is it customer-facing? → kb/questions/2026-09-05-ocr-email-intake-scope.md

## Wiki impact

- None until scope is known.

## How it connects (added 2026-09-06)

- **e-invoice-self-billed** — a supplier invoice captured by OCR is the natural input to a self-billed e-invoice, and inherits the same missing-classification-code problem as any expense line.
- **e-invoice-reconciliation** — an OCR-created purchase document joins the purchase-document matching queue and therefore the reconciliation against supplier e-invoices from LHDN.
- **e-invoice-cancellation-and-credit-notes** — the proposed rejection-notification queue would use OCR to close the loop on buyer-initiated rejections, which BigLedger cannot see today.

## Wiki impact (added 2026-09-06)

- If OCR intake is customer-facing, the duplicate-detection limits are a documentation obligation, not a footnote: two uploads of the same receipt can both be created.
