---
topic: bank-reconciliation
aliases: []
applets: ["bankReconApplet", "cashbookApplet"]
modules: []
related: ["cashbook", "receipt-voucher", "payment-voucher", "gl-posting"]
wiki:
  - content/en/guides/accounting-guides/bank-reconciliation-guide.md
  - content/en/applets/finance/bank-reconciliation-applet.md
status: seed
updated: 2026-09-05
---

# Bank Reconciliation

Matching bank statement lines to cashbook transactions, confirming or undoing links, and closing a reconciliation period.

## Facts

_Seeded from blg-akaun-platform-java commits, last 90 days (2026-06-07 → 2026-09-05). Commit subjects only — each needs reading before it becomes a wiki statement. Customer names replaced with "[a customer]"._

- 2026-08-31 — bigledger/blg-int-general-task/issues/9625: fix bank recon auto-matching full rerun [src:git:blg-akaun-platform-java@b20de6d373]
- 2026-08-29 — Refs [a customer]#4: snap full-reconcile amount_contra and round forex cashbook open_amount. [src:git:blg-akaun-platform-java@a9ea16f510]
- 2026-08-28 — Refs [a customer]#132: Add cashbook_guid filter to settlement-methods query [src:git:blg-akaun-platform-java@6dc44e4b0a]
- 2026-08-28 — Refs [a customer]#2: block amount sync on bank-reconciled cashbook lines. [src:git:blg-akaun-platform-java@8c0c75f2c2]
- 2026-08-20 — Refs bigledger/blg-int-general-task/issues/8839: bank statement PDF upload for OCBC, HLBB, Alliance, CIMB, Public Bank [src:git:blg-akaun-platform-java@8c8d327e73]
- 2026-08-16 — bigledger/blg-int-general-task#6467: add missing bank-recon query criteria [src:git:blg-akaun-platform-java@68f1d5f216]
- 2026-08-14 — bigledger/[a customer]/issues/2299: FINAL cash transfer edit sync + recon guard [src:git:blg-akaun-platform-java@4525a01632]
- 2026-08-01 — bigledger/[a customer]#531: only FINAL cash transfers post journal and cashbook lines [src:git:blg-akaun-platform-java@f3f1154ef5]
- 2026-07-29 — bigledger/blg-intranet#5529: sync cashbook txn lines when cash transfer and gen-doc fields are updated [src:git:blg-akaun-platform-java@68f66cb1fa]
- 2026-07-16 — (bigledger/blg-applet-wavelet-bank-recon-applet/issues/7:- Add Mayban… [src:git:blg-akaun-platform-java@de4a81863c]
- 2026-07-08 — bigledger/[a customer]#513: add inventory-vs-financial item scan_code reconciliation endpoints [src:git:blg-akaun-platform-java@27c251d35f]
- 2026-06-10 — ref bigledger/[a customer]#498, added duplication check before creating new cashbook line [src:git:blg-akaun-platform-java@e73271cba2]
- 2026-06-08 — bigledger/[a customer]/issues/295:- correct balance sync trigger for cashbook txn changes [src:git:blg-akaun-platform-java@5fe5b3ff99]

## How it connects

- **cashbook** — to examine: what in the facts above changes this neighbour?
- **receipt-voucher** — to examine: what in the facts above changes this neighbour?
- **payment-voucher** — to examine: what in the facts above changes this neighbour?
- **gl-posting** — to examine: what in the facts above changes this neighbour?

## Open questions

- Which of these commits changed user-visible behaviour vs internal plumbing? (read the diffs)

## Wiki impact

- Review the pages under `wiki:` against the facts once the diffs are read.
