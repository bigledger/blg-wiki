---
title: "The Month-End E-Invoice Cycle (1st to 7th)"
description: "How to close a month of e-invoicing: clear the pools before consolidation runs, pull the right export, work the Invalid list, and prove your books agree with LHDN before the 7th"
tags:
- user-guide
- e-invoice
- compliance
- month-end
weight: 35
---

Every month you have seven days to prove that everything you sold last month reached LHDN — once, and only once. Consolidated e-invoices for last month must be validated by the **7th**, and the work that gets you there is a short, repeatable loop you can run yourself. This guide walks that loop end to end. Budget about **two hours on the 1st or 2nd**, then a few short check-ins until the list is clean.

## Meet GadgetSphere

GadgetSphere Sdn Bhd runs 22 consumer-electronics branches across Malaysia, plus an online arm and a distribution company. Last month its counters rang up roughly **38,000 receipts**, almost all walk-in sales under RM 10,000 with no buyer details — those become one consolidated e-invoice per group. Another **112 invoices were RM 10,000 or more**, so each of those has to go to LHDN individually with the buyer's real tax number. Getting all of it reported by the 7th is the job below.

## What you need to know first

**Consolidated e-invoice.** One e-invoice that reports many small receipts together, with the buyer recorded as "General Public". This is how B2C counter sales are reported. Sales of **RM 10,000 or more cannot go inside one** — they need an individual e-invoice with a real buyer identity.

**The pools.** Documents that could not be submitted are parked in one of three holding areas — the Batch Pool (waiting for consolidation), the Individual Pool and the Single General Pool. Only the Batch Pool empties itself. See [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/) for how a document gets to each one.

**Two exports, only one of which tells you the truth.** *Internal Submission → To IRB E-Invoice* carries the **live** LHDN status. *Internal Submission → Submission History* is a snapshot taken at the moment of submission — it will keep saying "Submitted" forever, even for documents LHDN later marked Invalid. Work from the first one.

{{< callout type="warning" >}}
The single most expensive mistake in this whole cycle is filtering your Invalid list out of Submission History. You will get a list that looks fine while real rejections sit unfixed.
{{< /callout >}}

## Before you start

- You can open the **My E-Invoice Admin Applet** and use the Export button on the submission screens.
- **Last month's sales are all finalised.** A document still sitting in draft has never entered the e-invoice pipeline at all, and no amount of pool-clearing will find it.
- You know **which day BigLedger runs consolidation for your company**. It is scheduled per company, usually a few days before the 7th so there is time to fix whatever comes back Invalid. If you don't know your day, ask support before the 1st — not on the 6th.
- Your company's e-invoice authorisation is healthy. If *every* document is failing with an authentication error and none of them has a data problem, the intermediary authorisation you granted BigLedger on the MyInvois portal has lapsed and needs renewing — no amount of month-end work will move anything until it is.

---

## Step 1: Clear the Individual Pool before consolidation runs

**Outcome:** every high-value and named-buyer sale from last month either has a real tax number on it or has been consciously moved somewhere it can still be reported.

*My E-Invoice Admin Applet → Individual Pool*

The Individual Pool is where documents land when they were meant to go to LHDN on their own but something mandatory is missing — usually the buyer's tax number, identity type or address. **Nothing rescues them.** They will sit there for months without an alert, and every one of them is a sale you have not reported.

Work the list in two passes:

1. **Get the buyer details.** Open the row, complete the buyer's tax number, identity type and value, and the address, then use **Save and Resubmit**. GadgetSphere's corporate sales — the RM 24,600 laptop fleet order for an accounting firm — belong in this pass. If the buyer's identity type is a business registration number and the tax number is blank, use **Get TIN / Verify TIN** on the row: for documents of RM 10,000 and above BigLedger looks the number up at LHDN by registration number and fills it in when it finds a match.
2. **Move what you genuinely cannot complete.** For a receipt **under RM 10,000** where the customer has walked away and you will never get their details, use **Move To Batch Pool** so it is consolidated with everything else. This only works **before** your consolidation run — afterwards it is stranded and needs a separate backdated run.

{{< callout type="warning" >}}
Above RM 10,000 that escape route is closed. BigLedger refuses the move with *"Cannot move transaction with amount more than or equal to 10000."* — LHDN does not allow a sale that size inside a consolidated e-invoice. You have to find the buyer's tax number.
{{< /callout >}}

**If you skip this step:** the consolidation runs, everything else reports cleanly, and your Individual Pool documents quietly stay unreported. You will find them the next time somebody reconciles — possibly months later, well past any chance of cancelling or correcting cleanly.

## Step 2: Check the Batch Pool for rows that will not be swept

**Outcome:** you know that every Batch Pool row for last month is genuinely waiting to be consolidated, not stuck.

*My E-Invoice Admin Applet → Batch Pool*

Most Batch Pool rows need nothing from you — they are unprocessed, and the monthly consolidation sweeps them up. But there is one row state that looks harmless and is not:

- **Unprocessed** — will be consolidated. Leave it alone.
- **Processed / Failed** — somebody pressed *Save and Resubmit* on it, the data still wasn't good enough, and the row was marked processed with the reason in **Validation Error**. It is **no longer waiting for anything.** The monthly consolidation will not pick it up. It is stranded, and it is invisible on any "unprocessed" filter.

Open a failed row and read the Validation Error panel — it names exactly which fields are missing.

{{< figure src="/images/my-e-invoice-admin-applet/batch-pool-validation-error.png" alt="Batch Pool listing with a purchase invoice selected and a Validation Error panel listing the supplier fields that are missing" caption="Batch Pool — the Validation Error panel names each missing field. Fix them on the Account tab, then Save and Resubmit." >}}

Fix the underlying customer record, then use **Save and Resubmit** again, or move the row back so it gets consolidated. Either way it has to be dealt with by hand.

**The most common way this goes wrong:** a clerk works the pool on the 2nd, fixes a batch of rows, half of them fail the check again, and nobody looks at the result. Those receipts never reach LHDN and turn up as the gap in Step 5.

## Step 3: Let the consolidation run — or trigger it yourself

**Outcome:** last month's Batch Pool has become consolidated e-invoices sitting in the submission queue, and then at LHDN.

*My E-Invoice Admin Applet → Batch Pool → Consolidate* (or *Consolidate By Branch*), then *Internal Submission → Consolidated Submission → Submit*

For most companies you do not press anything. BigLedger runs consolidation and submission for your company on its scheduled day, deliberately a few days before the 7th so there is room to fix rejections. The manual buttons above are the fallback, and they are what support uses when a run has to be repeated.

Two things worth knowing about the result:

- **Consolidation groups by month.** The standard run only sweeps last month. Batch Pool rows dated *earlier* than that need a separate backdated run — ask support, and give them the months.
- **Foreign buyers never go into a consolidated e-invoice.** If a tourist bought a laptop at the Penang branch and gave you a passport, that sale must be keyed with identity type **Passport** and submitted individually. Consolidation cannot carry a foreign buyer.

## Step 4: Pull the export that shows live status

**Outcome:** you have one spreadsheet of last month's e-invoices with LHDN's current verdict on each.

*My E-Invoice Admin Applet → Internal Submission → To IRB E-Invoice → Export*

This is the screen and the export to work from. Each row is one e-invoice, with a status you can act on:

| Status | What it means | What to do |
|---|---|---|
| **Valid** | LHDN accepted and validated it | Nothing |
| **Invalid** | LHDN accepted the submission and then rejected the content | Fix and resubmit — Step 5 |
| **Submitted** | At LHDN, validation still in progress | Wait; it usually settles within minutes |
| **IN_QUEUE** | Still with BigLedger, not yet sent | Wait, then read Step 6 |

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-to-irb-e-invoice.png" alt="Internal Submission To IRB listing showing e-invoice number, dates, document numbers, branch and company codes and a status column with Invalid and IN_QUEUE values" caption="Internal Submission → To IRB E-Invoice — one row per e-invoice, with the live LHDN status. Sort on that column and your work list writes itself." >}}

Also open *Monthly Report → Discrepancies Report* and create the report for last month. It compares your finalised documents against your e-invoice records per company and period, and it is the only self-service reconciliation tool in the applet. You will use it in Step 5.

## Step 5: Work the Invalid list

**Outcome:** every Invalid row from last month is either Valid or has a known, owned reason for not being.

*My E-Invoice Admin Applet → Internal Submission → To IRB E-Invoice*

The loop is the same for each row, and it is quick once you have the rhythm:

1. Sort the export on status and take the Invalid rows.
2. Read the rejection reason on the row. Most of them will be the buyer's identity — a foreign customer keyed as Malaysian, a national identity number stored with hyphens, or a company registration number typed into the wrong field. [Validation Rules & Troubleshooting](/guides/einvoice-guides/einvoice-validation/) has the full list with fixes.
3. Look the correct tax number up on the MyInvois portal.
4. Correct it **on the customer record** in the [Customer Applet](/applets/master-data/customer-applet/), so the next sale to that customer is right too.
5. Back on the To IRB E-Invoice row, use **Save and Resubmit**.

If a row keeps failing on a field you can see is correct on the customer record, the document is carrying its own copy of the buyer's details and the customer record is never being read — fix it on the document's own e-invoice block instead. [Which record does BigLedger actually send?](/guides/einvoice-guides/einvoice-validation/#which-record-does-bigledger-actually-send) has the rule.

{{< callout type="tip" >}}
**Resubmitting keeps the original document date.** A correction you make on the 3rd of September still belongs to the August month — you are not pushing the sale into the wrong period by fixing it late.
{{< /callout >}}

If you have dozens of tax numbers to correct, *Tools → Bulk TIN Validation* takes a CSV of corrections in one go instead of row by row.

**One trap before you cancel anything.** If two rows in the listing show the same document number, that is very often **not** a duplicate: sales invoices and self-billed purchase invoices draw their numbers from two independent sequences that both start at the same value, and the listing does not show which direction a document went. Check the document type first. Cancelling a genuine e-invoice because a report looked odd is unrecoverable once its 72 hours are up — see [Cancelling and Correcting an E-Invoice](/guides/einvoice-guides/einvoice-cancel-and-correct/).

## Step 6: Chase anything still IN_QUEUE the next morning

**Outcome:** you know whether a queued row is simply waiting its turn or has quietly failed.

*My E-Invoice Admin Applet → Internal Submission → Individual Submission*

Submission is a background queue. BigLedger sends **one document per call to LHDN, serially** — there is no burst mode — so a big month-end batch is measured in hours, not minutes. Plan on a few hundred documents an hour and start on the 1st, not the 6th.

That said, waiting is not the same as retrying:

{{< callout type="warning" >}}
A row that has not moved by the next morning is **not** retrying on its own, whatever a retry count on the screen suggests. Select it and press **Submit**. If the same rows stall again, raise a support request — do not keep waiting.
{{< /callout >}}

## Step 7: Reconcile, and understand the five reasons a tally does not balance

**Outcome:** for each sales document type, what you invoiced last month equals what reached LHDN.

*My E-Invoice Admin Applet → Monthly Report → Discrepancies Report*

Compare, per document type and per month, the sales you finalised against the e-invoices that reached LHDN. Count an e-invoice as "reached LHDN" if it is Valid, Submitted, or sitting in the consolidated queue. When the two sides do not match, work through these five in order — this is the order support checks them, cheapest first:

1. **Documents still in the Individual Pool.** Step 1 missed some, or new ones arrived after you worked the list.
2. **Batch Pool rows marked processed but failed.** The trap from Step 2. They are not waiting for the consolidation; they are stranded.
3. **Documents in the Single General Pool.** Same shape as the Individual Pool, different routing — check it separately, it is easy to forget.
4. **Documents that never entered the pipeline at all.** A document finalised while the company's e-invoice setting was still switched off is dropped silently — no pool row, no queue row, no error. This is why the enable-then-finalise order matters so much during onboarding. If you find these, raise a support request with the document numbers; they have to be pushed in by hand.
5. **Void or draft documents that were never marked skip-e-invoice.** These count on your side of the tally and have no e-invoice, so they look like a gap when nothing is wrong. Mark them skipped and the tally balances.

{{< callout type="info" >}}
**One thing this reconciliation cannot see.** BigLedger compares what you invoiced against what BigLedger sent. It does not currently pull back what LHDN holds — so an invoice somebody typed straight into the MyInvois portal, or one sent by another system, will never appear in a BigLedger report. If your LHDN dashboard shows more documents than BigLedger does, that is the first thing to check.
{{< /callout >}}

---

## What success looks like

Thirty seconds, four screens, on or before the 7th:

1. **Batch Pool**, filtered to last month — no unprocessed rows left, and no processed-but-failed rows either.
2. **Individual Pool** and **Single General Pool** — empty, or every remaining row has a person chasing the buyer's details.
3. **Internal Submission → To IRB E-Invoice**, filtered to last month — no Invalid rows and no IN_QUEUE rows.
4. **Monthly Report → Discrepancies Report** for the month — the document count and totals match per document type.

If all four are clean, the month is closed.

## Common mistakes

| Mistake | What you see | Fix |
|---|---|---|
| Filtering the Invalid list from **Submission History** | A short, reassuring list; rejections you never worked | Always export from *Internal Submission → To IRB E-Invoice* — Submission History is a snapshot from submission time, not the live status |
| Moving Individual Pool rows to the Batch Pool **after** the run | The receipts never appear in any consolidated e-invoice | Do the pool clean-up on the 1st or 2nd; anything later needs a backdated consolidation from support |
| Assuming a **processed / failed** Batch Pool row will be picked up | The tally is short by exactly those receipts | Filter the Batch Pool on failed rows every cycle and re-work them |
| Treating a repeated document number as a duplicate | Two rows, same number, and an urge to cancel one | Check the document type — a sales invoice and a self-billed purchase invoice can share a number legitimately |
| Starting on the 6th | Thousands of rows still IN_QUEUE with hours of submission left and no time to fix rejections | Start on the 1st; the queue sends one document at a time |
| Voiding a sale without marking it skip-e-invoice | A permanent gap in every monthly tally | Set **Skip E-Invoice** on any document you void or abandon |

## Related documentation

{{< cards >}}
  {{< card link="/guides/einvoice-guides/einvoice-pools-and-routing/" title="Pools & Submission Routing" subtitle="Why a document went to the pool it went to, and how to move it" >}}
  {{< card link="/guides/einvoice-guides/einvoice-validation/" title="Validation Rules & Troubleshooting" subtitle="The rejection reasons you will meet in Step 5, and how to fix each one" >}}
  {{< card link="/guides/einvoice-guides/einvoice-cancel-and-correct/" title="Cancelling & Correcting an E-Invoice" subtitle="The 72-hour window, and the credit-note path after it closes" >}}
  {{< card link="/applets/e-invoice/my-e-invoice-admin-applet/" title="My E-Invoice Admin Applet" subtitle="Field-level reference for every screen used in this guide" >}}
{{< /cards >}}
