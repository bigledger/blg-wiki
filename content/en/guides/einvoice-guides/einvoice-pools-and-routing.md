---
title: "E-Invoice Pools & Submission Routing"
description: "How the system decides whether a document becomes an individual or consolidated e-invoice, what the Batch, Individual and Single General pools are for, and how to move documents between them"
tags:
- user-guide
- e-invoice
- compliance
weight: 25
---

Every finalised sales document — invoice, cash bill, credit note — goes through the same decision the moment you finalise it: **submit it to LHDN on its own, or report it inside a consolidated e-invoice?** And if something required is missing, **park it in a pool** so you can fix it. Ten minutes with this page and you will be able to look at any document and say exactly where it went and why.

## Meet GadgetSphere

GadgetSphere Sdn Bhd runs 22 consumer-electronics branches. The overwhelming majority of its sales are walk-in counter receipts of a few hundred ringgit with no buyer details at all, and a small number are corporate orders worth five figures. Those two shapes take completely different routes through e-invoicing, and every rule below exists to keep them apart.

{{< callout type="info" >}}
**Nothing is submitted at the moment you press Save.** Finalising a document puts it in a queue; a background processor picks it up and sends it. Everything on this page happens after you have walked away from the screen.
{{< /callout >}}

This page assumes two ideas rather than explaining them: what a [consolidated e-invoice](/modules-v2/e-invoice/concepts/consolidated-e-invoice/) is, and how a [pool differs from a queue](/modules-v2/e-invoice/concepts/pools-and-queues/).

## Submission types

Each document carries an **e-invoice submission type** that drives the routing:

| Submission type | Meaning |
|---|---|
| **Individual** | Submit this document to LHDN as its own e-invoice |
| **Consolidated** | Include this document in the monthly consolidated e-invoice (typical for B2C retail) |
| **Single General** | Try as an individual e-invoice using general buyer details; fall back to consolidation if it fails |
| *(not set)* | The system decides based on the amount and available data |

You can see and change it on the document itself: open the sales document and go to its **E-Invoice** tab → **Submission Type**. Most companies never touch it, because a sensible default is set per document type during setup — POS cash bills as *Consolidated*, corporate sales invoices as *Individual*. Change it on a single document only when that one sale is genuinely an exception.

## The RM 10,000 rule

Transactions of **RM 10,000 or more must be submitted as individual e-invoices** — they cannot hide inside a consolidation. The system enforces this automatically:

- A document marked *Consolidated* with a total ≥ RM 10,000 is diverted to the **Individual Pool** instead of the batch.
- For documents ≥ RM 10,000 where the buyer's ID type is BRN but the TIN is missing, the system **auto-searches LHDN's registry** by registration number and fills in the TIN when found.

{{< callout type="warning" >}}
The threshold is inclusive — a sale of exactly RM 10,000 is already above it. Do not split a large transaction to stay under the line.
{{< /callout >}}

## Where does a finalised document go?

When a document is finalised, BigLedger checks its submission type, amount, and whether all [mandatory fields](/guides/einvoice-guides/einvoice-validation/#mandatory-fields) are complete:

| Submission type | Amount | Mandatory fields complete? | Outcome |
|---|---|---|---|
| Individual | any | ✅ | Submitted to LHDN as an individual e-invoice |
| Individual | any | ❌ | **Individual Pool** |
| Consolidated | < RM 10,000 | — | **Batch Pool** (awaits monthly consolidation) |
| Consolidated | ≥ RM 10,000 | ❌ | **Individual Pool** (RM 10k rule) |
| Single General | any | ✅ | Submitted as an individual e-invoice |
| Single General | any | ❌ | **Single General Pool** |
| *(not set)* | any | ✅ | Submitted as an individual e-invoice |
| *(not set)* | < RM 10,000 | ❌ | **Batch Pool** |
| *(not set)* | ≥ RM 10,000 | ❌ | **Individual Pool** |

*Example:* GadgetSphere Sdn Bhd's POS cash bills are marked Consolidated — they flow into the Batch Pool and are swept into the monthly consolidated e-invoice. A corporate customer buying RM 18,000 of equipment on the same day is above the threshold, so that invoice must go out individually, with the customer's real TIN.

## What you can do in each pool

The table above says which pool a document lands in; [Pools and queues](/modules-v2/e-invoice/concepts/pools-and-queues/) says why the three behave differently. What follows is what you can actually do once a document is in one.

### Batch Pool

Fix the buyer's data and resubmit the receipt as an individual e-invoice; move it to the Individual or Single General pool; consolidate on demand (by date range, by branch, or by selected documents); or skip e-invoicing for the document. Most rows need none of this — they are waiting for the monthly run and that is correct.

### Individual Pool

Complete the buyer details and resubmit. If you cannot obtain the buyer's details at all, move the document to the Batch Pool so it is consolidated instead — but do this **before** the scheduled monthly consolidation run, or it is stranded in a closed month.

### Single General Pool

Fix and resubmit as individual; if that submission fails or comes back Invalid, resubmit the document as a **single-document consolidated e-invoice**; or move it to another pool. This pool exists for sales where the buyer's data is unlikely ever to arrive but you still want one individual attempt first.

### Pool comparison

| | Batch Pool | Individual Pool | Single General Pool |
|---|---|---|---|
| Default outcome | Auto-consolidated monthly | Waits for you | Waits for you |
| Fix & resubmit as individual | ✅ | ✅ | ✅ |
| Move to another pool | ✅ | ✅ | ✅ |
| Fallback to consolidated | Automatic (scheduled) | Manual (move to batch) | On failed individual attempt |
| Skip e-invoice | ✅ | ✅ | ✅ |

All pool actions are performed in the [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/).

## The monthly consolidation cycle

Unprocessed Batch Pool documents from a month are grouped into **consolidated e-invoices**, which LHDN requires to be validated **by the 7th of the following month**. Every receipt inside one is traceable back to the e-invoice that reported it.

**You do not normally press anything.** Consolidation and submission run automatically on a schedule set per company, deliberately a few days ahead of the 7th so there is time to correct whatever comes back Invalid. The buttons in the Batch Pool and on *Internal Submission → Consolidated Submission* are the manual fallback, used when a run has to be repeated. The full week-by-week routine is in [The Month-End E-Invoice Cycle](/guides/einvoice-guides/einvoice-month-end/).

{{< figure src="/images/my-e-invoice-admin-applet/internal-submission-consolidated.png" alt="Consolidated Submission Queue listing showing consolidated e-invoices with buyer General Public and a Submit button" caption="Internal Submission → Consolidated Submission — consolidated e-invoices waiting to go to LHDN. The buyer on every one of them is General Public." >}}

### By document or by branch — two ways to build one

Which method your company is on is set for you, and the difference is visible on the e-invoice itself, so it is worth knowing which you will be looking at:

- **By document** — one line per receipt. Each line's description is that receipt's document number. Simple to read and simple to trace.
- **By branch** — one line per *consecutive range* of that branch's document numbers, so `1001–1005` is a single line covering five receipts. That keeps a high-volume branch inside the **200-line ceiling** on a consolidated e-invoice, and it groups each branch's month into its own block.

For a 22-branch retailer like GadgetSphere, by-branch is the shape that keeps each branch's month readable as its own block. Ask your BigLedger contact which method your companies are configured for if you are not sure.

{{< callout type="warning" >}}
**A consolidated e-invoice cannot carry a foreign buyer.** If a customer pays with a passport, key their identity type as **Passport** and let that sale go out as an individual e-invoice. It cannot be folded into the monthly consolidation.
{{< /callout >}}

{{< callout type="tip" >}}
Review your Individual Pool **before** the consolidation run: anything you move to the Batch Pool in time is picked up; anything moved afterwards is stranded and needs a backdated run.
{{< /callout >}}

## Backdated documents

Two rules matter when handling documents dated in the past:

1. **Issue time is always "now".** LHDN requires the e-invoice issue date-time to be the actual submission time. The document's original transaction date is preserved separately — you don't lose it.
2. **Prior-month consolidation needs a dedicated run.** The standard monthly consolidation only sweeps the current month. Batch Pool documents from earlier months are consolidated through a separate backdated consolidation step — contact your administrator or support to run it for the affected months, then the consolidated e-invoices are submitted the usual way.

## Frequently asked questions

**A customer wants an individual e-invoice for a receipt that's already in the Batch Pool — what do I do?**
Find the document in the Batch Pool, complete the customer's TIN/ID and address, and use *Save and Resubmit*. It leaves the batch and is submitted individually. This works any time before the receipt has been consolidated.

**What happens if I can't get a buyer's TIN at all?**
For local buyers, an individual e-invoice can still be issued with the General Public TIN plus a valid NRIC (see [General TINs](/guides/einvoice-guides/einvoice-validation/#general-tins--when-you-dont-have-the-buyers-tin)). Otherwise, move the document to the Batch Pool and let it be consolidated.

**A customer is asking us for an e-invoice for a receipt from last week — do we have to key it ourselves?**
Not necessarily. Your buyers can do it themselves through the [My E-Invoice Portal](/applets/e-invoice/my-e-invoice-portal-applet/): the customer finds their own receipt, fills in their tax number, identity and address, and submits. Their details land on your customer record and the pooled receipt is ready for you to complete with *Save and Resubmit*. For a 22-branch retailer this is the difference between chasing details and having them arrive. It does not work for a receipt that is already inside a validated consolidated e-invoice — that needs a cancellation inside 72 hours, or a credit note.

**A document shows "skipped" — is that a problem?**
Skipping is a deliberate action for documents that must not be e-invoiced (for example, when the counterparty issues the e-invoice instead). Skipped sales documents are still tracked for matching against incoming supplier e-invoices, and they are excluded from the monthly tally — which is exactly why a voided sale that was *not* marked skipped shows up as a gap when you reconcile.

**I fixed a Batch Pool row and resubmitted it, and it failed. Will the consolidation still pick it up?**
No — and this is the one that catches people out. A row you tried to fix that failed the check again is marked **processed / failed**. It is no longer waiting for anything: the monthly consolidation sweeps *unprocessed* rows only, so a failed row is stranded, and it disappears from any "unprocessed" filter you might use to check your work. Filter the Batch Pool for failed rows every cycle, read the reason in the **Validation Error** panel, fix the underlying customer record and resubmit.

## What success looks like

Thirty seconds in *My E-Invoice Admin Applet*, at any point in the month:

1. **Individual Pool** — empty, or every row has someone chasing the buyer's details. Nothing here moves on its own.
2. **Single General Pool** — same test, and remember to look; it is the pool people forget.
3. **Batch Pool**, filtered to the current month — rows are unprocessed (fine, they are waiting for the run) and there are no processed-but-failed rows.

## Common mistakes

- **Assuming a pooled document will sort itself out.** Only the Batch Pool empties itself. The Individual and Single General pools wait for you indefinitely, with no ageing alert.
- **Moving a document to the Batch Pool after the consolidation has run.** It is now stranded in a closed month and needs a backdated run.
- **Trying to move a RM 10,000-or-more sale into the Batch Pool.** BigLedger refuses it — *"Cannot move transaction with amount more than or equal to 10000."* Get the buyer's tax number instead.
- **Putting a foreign buyer into consolidation.** Key the identity type as Passport and submit individually.
- **Splitting a large sale to duck under RM 10,000.** The threshold is a reporting rule, not a target.

## Related documentation

{{< cards >}}
  {{< card link="/guides/einvoice-guides/einvoice-month-end/" title="The Month-End E-Invoice Cycle" subtitle="The 1st-to-7th routine that empties these pools" >}}
  {{< card link="/guides/einvoice-guides/einvoice-validation/" title="Validation Rules & Troubleshooting" subtitle="The mandatory fields a pooled document is missing" >}}
  {{< card link="/applets/e-invoice/my-e-invoice-admin-applet/" title="My E-Invoice Admin Applet" subtitle="Field-level reference for every pool screen and button" >}}
{{< /cards >}}
