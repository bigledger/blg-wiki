---
topic: e-invoice-ocr-intake
aliases: [OCR e-mail receiving, SES email receiving, e-mail document intake]
applets: []
modules: [e-invoice, purchasing]
related: [e-invoice, internal-purchase-invoice-applet, my-e-invoice-admin-applet]
wiki: []
status: seed
updated: 2026-09-05
---

# OCR intake of documents by e-mail

An inbound e-mail channel (AWS SES e-mail receiving) is being deployed so that documents e-mailed to a BigLedger address can be read by OCR. Only the deployment request has been seen; which documents, which applet, and how it relates to e-invoice matching are unconfirmed.

## Facts

- 2026-09-04 — Production deployment of an "SES Email Receiving Configuration — OCR Email Receiving" was requested for an evening maintenance window (the body's date reads 5 May, evidently 5 September), subject to sign-off on a deployment request form. [src:gmail:1a069e68f3133a81]

## How it connects

- **internal-purchase-invoice-applet** — the likely consumer: supplier invoices e-mailed in, OCR-read into purchase documents (unconfirmed).
- **my-e-invoice-admin-applet** — if it creates purchase documents, they would then flow into the purchase-document matching queue against supplier e-invoices from LHDN.

## Open questions

- What does the OCR e-mail intake do, for whom, and is it customer-facing? → kb/questions/2026-09-05-ocr-email-intake-scope.md

## Wiki impact

- None until scope is known.
