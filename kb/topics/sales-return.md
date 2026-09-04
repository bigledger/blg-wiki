---
topic: sales-return
aliases: []
applets: ["internalSalesReturnApplet", "internalSalesCreditNoteApplet"]
modules: []
related: ["sales-invoice", "e-invoice", "stock-balance", "gl-posting"]
wiki:
  - content/en/guides/sales-guides/returns-exchanges-workflow.md
  - content/en/applets/sales-workflow/internal-sales-return-applet.md
status: seed
updated: 2026-09-05
---

# Sales Return

Returning goods a customer bought: the Sales Return document reverses stock and revenue, and issues a credit note; the return may itself need an e-Invoice credit note.

## Facts

_Seeded from blg-akaun-platform-java commits, last 90 days (2026-06-07 → 2026-09-05). Commit subjects only — each needs reading before it becomes a wiki statement. Customer names replaced with "[a customer]"._

- 2026-09-03 — [a customer]/issues/2 #2 [a customer]: Sales Return applet > search by Sales Invoice > einvoice buyer info does not load from My-Einvoice Applet [src:git:blg-akaun-platform-java@20843ee6e0]
- 2026-08-26 — bigledger/[a customer]/issues/218 #218 SALES REFUND NOTE: Foreign Currency Rate and fix shadow document creation for foreign currency document [src:git:blg-akaun-platform-java@3a9935d33f]
- 2026-08-26 — bigledger/[a customer]/issues/139 #139 [a customer] -> Sales Return: Handle Auto Upsert for Entity and Item in the Helper Processor [src:git:blg-akaun-platform-java@24c5a0c0e8]
- 2026-08-13 — bigledger/blg-int-general-task/issues/6538 --subquery migration for sales return [src:git:blg-akaun-platform-java@0b0ffb52ef]
- 2026-07-27 — blg-int-general-task/issues/6537 --subquery migration sales refund no… [src:git:blg-akaun-platform-java@8a935b22df]
- 2026-06-10 — Fix: Fixed the Skip E-Invoice toggle for internal purchase credit notes in the backend [src:git:blg-akaun-platform-java@c3a2e0f5ac]

## How it connects

- **sales-invoice** — to examine: what in the facts above changes this neighbour?
- **e-invoice** — to examine: what in the facts above changes this neighbour?
- **stock-balance** — to examine: what in the facts above changes this neighbour?
- **gl-posting** — to examine: what in the facts above changes this neighbour?

## Open questions

- Which of these commits changed user-visible behaviour vs internal plumbing? (read the diffs)

## Wiki impact

- Review the pages under `wiki:` against the facts once the diffs are read.
