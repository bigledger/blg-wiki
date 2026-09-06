---
title: "Cancelling and Correcting a Validated E-Invoice"
description: "What to do when an e-invoice LHDN has already validated turns out to be wrong — the 72-hour cancellation window, how the cancellation request actually gets approved, and the credit-note path once the window closes"
tags:
- user-guide
- e-invoice
- compliance
- troubleshooting
weight: 40
---

You have just noticed that an e-invoice LHDN validated yesterday is wrong — wrong customer, wrong amount, or a sale that should never have been invoiced at all. You cannot simply edit it. What you can do depends almost entirely on one thing: **whether 72 hours have passed since LHDN validated it.** This guide gives you the decision in about five minutes and the fix in about ten.

## Meet GadgetSphere

Yesterday afternoon a GadgetSphere branch invoiced a corporate customer **RM 12,400** for a laptop refresh. This morning the customer calls: the order was for eight machines, not ten, and the invoice should be RM 9,920. The e-invoice went to LHDN last night and came back Valid. Nothing can be typed over it, so the question is which of two routes GadgetSphere is on.

## The one rule that decides everything

Once LHDN marks an e-invoice **Valid** it is a filed tax record — that is [what validation does](/modules/e-invoice/concepts/validation-and-clearance/), and it is why BigLedger refuses **Save and Resubmit** on it: *"already validated with 'Valid' status. Please cancel it first before creating a new invoice."* The refusal is deliberate, not a bug. (You get a similar refusal at **Submitted**, which only means LHDN is still deciding; wait a few minutes and the status settles.)

Everything on this page follows from one date field on that record:

- **Inside 72 hours of validation** — cancel it at LHDN, then issue the corrected document.
- **Past 72 hours** — no cancellation is possible at all. The correction becomes a **credit note** referencing the original.

{{< callout type="warning" >}}
The clock runs from the **validation time recorded on the e-invoice**, held in universal time (UTC) — which can be *earlier* than what the MyInvois portal appears to show you. Read the validation date-time off the e-invoice record and count from that. Do not count from memory, and do not count from when you raised the sale.
{{< /callout >}}

## Before you start

- The e-invoice status is **Valid**. Nothing on this page applies to a document that is still in a pool or still IN_QUEUE — those you can simply fix and resubmit.
- You have the e-invoice open in *My E-Invoice Admin Applet → Internal Submission → To IRB E-Invoice*, so you can read its validation date-time.
- Someone with approval rights is **available today**. A cancellation request does not travel on its own; if the only person who can approve it is on leave, you will run the clock out.
- For anything past the window, your accountant is in the loop. A credit note changes your reported figures.

---

## Step 1: Work out whether you are still inside the window

**Outcome:** you know which of the two routes you are on before you touch anything.

*My E-Invoice Admin Applet → Internal Submission → To IRB E-Invoice*

Find the e-invoice, open it and read its **validation date-time**. Add 72 hours. If that moment is still ahead of you, go to Step 2. If it has passed, skip to Step 6.

GadgetSphere's wrong invoice was validated at 21:40 last night, so the deadline is 21:40 two nights from now — comfortable, but not something to leave until the afternoon of the third day.

**How this goes wrong:** people count 72 hours from the invoice date rather than the validation date, which on a backdated or queued document can be days apart. Read the field.

## Step 2: Raise the cancellation request

**Outcome:** a cancellation request exists against the e-invoice, waiting for approval.

*My E-Invoice Admin Applet → Internal Submission → To IRB E-Invoice → Request for Rejection*

Select the e-invoice and use **Request for Rejection**. The button is only enabled on a Valid e-invoice, which is your confirmation that you are on the right route. The request lands in *Cancellation → Rejection Requests* as requested and in progress.

A buyer can also start this from the [My E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/) — a customer who spots the error before you do can raise the rejection themselves. It arrives in exactly the same list and needs exactly the same approval from you.

## Step 3: Approve the request and choose what happens to the source document

**Outcome:** the request is approved with a decision recorded about the sales document behind it.

*My E-Invoice Admin Applet → Cancellation → Rejection Requests*

This is the step everyone misses.

{{< callout type="warning" >}}
**Nothing advances a cancellation request automatically.** There is no background job. A request you raised and walked away from will sit at *requested / in progress* until the 72 hours expire and the option is gone. If a request "looks stuck", it is almost always waiting for a human to do this step.
{{< /callout >}}

Open the request, set the approval status to **Approved**, and choose a **processing logic** — what BigLedger should do with the underlying sales document once LHDN confirms the cancellation:

| What you want to happen | Choose | Use it when |
|---|---|---|
| Void the original sales document too | Void original document (`VOID_ORIGINAL_DOC`) | The sale is cancelled outright — wrong customer, order withdrawn |
| Cancel and immediately re-issue from the same document | Regenerate new e-invoice (`REGEN_NEW_EINVOICE`) | The document is right and the e-invoice was built wrong |
| Create a reversing document | New reversal document (`NEW_REVERSAL_DOC`) | Your accounting policy is to reverse rather than void |
| Cancel at LHDN only, and fix it yourself afterwards | Cancel for edit and resubmit (`CANCEL_FOR_EDIT_AND_RESUBMIT`, shown as `CANCEL_EINVOICE`) | You want to edit the document before it goes back — **and the only choice that works for a consolidated e-invoice** |

For GadgetSphere's over-invoiced laptop order, the document itself needs editing down to eight machines, so *cancel for edit and resubmit* is right: LHDN cancels, the branch corrects the invoice, and it goes back as a fresh e-invoice.

{{< figure src="/images/my-e-invoice-admin-applet/cancellation-rejection-requests.png" alt="Rejection Requests listing showing requestor status, processing status and approval status columns, with one row still in progress and unapproved" caption="Cancellation → Rejection Requests — the top row is requested and in progress with no approval status. It will stay that way until someone approves it." >}}

## Step 4: Send the cancellation to LHDN

**Outcome:** LHDN has cancelled the e-invoice and the status on your record says so.

*My E-Invoice Admin Applet → Cancellation → Rejection Requests → Process Request*

With the request approved and a processing logic set, use **Process Request**. BigLedger builds a cancellation queue row and calls LHDN there and then. Watch the result in *Cancellation → Cancellation Queue* — the **Request Error** field on the row carries the reason if it did not go through.

{{< figure src="/images/my-e-invoice-admin-applet/cancellation-queue-details.png" alt="Cancellation Queue detail panel showing a failed submission status with the request error Passed 72 hours from validation date time" caption="Cancellation → Cancellation Queue — this request failed for the one reason you cannot argue with: the 72 hours had already gone." >}}

Before it calls LHDN, BigLedger checks three things, and refuses on any of them: the e-invoice must be **Valid**, it must actually have an LHDN document reference, and **fewer than 72 hours** must have passed since validation. If you see *"Passed 72 hours from validation date time"*, the window closed while the request was waiting for approval — go to Step 6.

## Step 5: If it is a consolidated e-invoice, act immediately

**Outcome:** the cancellation is under way despite the extra constraint consolidated e-invoices carry.

A consolidated e-invoice has no single sales document behind it — it reports hundreds of receipts at once. That breaks two of the four options above: voiding and regenerating both fail with *"Can not void the generic document"* **before LHDN is even called**, because there is nothing to void. Only **cancel for edit and resubmit** works.

{{< callout type="warning" >}}
If that option is not available to you on the Rejection Requests screen, **raise a support request straight away and say the e-invoice is consolidated.** Do not experiment with the other options — each failed attempt burns time out of a 72-hour window you cannot extend.
{{< /callout >}}

Afterwards, the receipts that were inside the cancelled consolidated e-invoice still need reporting. They are pushed back to the Batch Pool and consolidated again as a named list of exactly those documents — not by re-running consolidation for the period, which would sweep in everything else as well. This is support's job, not a self-service action; ask for it in the same request.

## Step 6: Past 72 hours — issue a credit note instead

**Outcome:** LHDN's records are corrected by a new document rather than by removing the old one.

*Sales → Internal Sales Credit Note Applet*

There is no cancellation past the window. What you do instead is raise a **credit note** for the difference (or the whole amount), referencing the LHDN identifier of the e-invoice that was wrong. Once it is validated, LHDN's records net out correctly even though the original e-invoice is still there.

For a consolidated e-invoice, the buyer on that credit note is General Public, exactly as it was on the consolidated e-invoice itself.

{{< callout type="info" >}}
**Talk to your accountant first.** In most of these cases your BigLedger ledger is already correct and it is only the tax reporting that is overstated — so the credit note exists to fix LHDN, not to fix your books. Getting that agreed before you raise it stops you correcting the same thing twice.
{{< /callout >}}

## Step 7: Point the credit note at an original that is actually valid

**Outcome:** the credit note is accepted first time instead of being rejected for its reference.

A credit note is rejected if the e-invoice it references is no longer the live one. The classic case: the original was rejected as Invalid, somebody fixed and resubmitted it, and it came back with a **new** LHDN identifier — but the credit note is still pointing at the dead one. You will see one of two errors:

- **Referenced document status** (`DR303`) — the referenced e-invoice is not in a state that can be referenced.
- **Buyer mismatch** (`DR308`) — the buyer on the credit note is not the same buyer as on the referenced e-invoice. Matching the reference number is not enough; the identity has to match too.

Two ways out, both fine:

1. Update the credit note's original-invoice reference to the **currently valid** e-invoice, then Save and Resubmit.
2. Clear the reference fields entirely and submit the credit note without a reference.

## What we cannot see for you

If your **buyer** rejects an e-invoice on the MyInvois portal rather than through BigLedger, **that rejection does not come back into BigLedger today.** Nothing in your queues or reports will change. If a customer tells you they have rejected one of your e-invoices, check the portal yourself and act on it here — do not wait for BigLedger to notice.

---

## What success looks like

Thirty seconds:

1. Open the e-invoice in *Internal Submission → To IRB E-Invoice*. Its status reads **Cancelled** (inside the window) — or it is still Valid and a **validated credit note** now references it (outside the window).
2. *Cancellation → Rejection Requests* shows your request as completed and approved, not still in progress.
3. The sales document behind it is in the state you chose in Step 3 — voided, reversed, re-issued, or open for editing.

## Common mistakes

| Mistake | What you see | Fix |
|---|---|---|
| Raising the request and waiting | The request sits at *requested / in progress* for days, then fails on the 72-hour rule | Approve it and choose a processing logic the same day — nothing advances it for you |
| Counting 72 hours from the invoice date | You believe you have a day left and you do not | Count from the **validation date-time** on the e-invoice record, in UTC |
| Using void or regenerate on a **consolidated** e-invoice | *"Can not void the generic document"*, and LHDN was never called | Use cancel-for-edit-and-resubmit, or raise a support request immediately |
| Cancelling because two rows share a document number | You destroy valid e-invoices that were never duplicates | A sales invoice and a self-billed purchase invoice can hold the same number legitimately — check the document type first |
| Crediting a note against a superseded original | `DR303` or `DR308` on an otherwise clean credit note | Point at the currently valid e-invoice, or clear the reference and submit without one |

## Related documentation

{{< cards >}}
  {{< card link="/guides/einvoice-guides/einvoice-validation/" title="Validation Rules & Troubleshooting" subtitle="Why the e-invoice was wrong in the first place, and how to stop it recurring" >}}
  {{< card link="/guides/einvoice-guides/einvoice-month-end/" title="The Month-End E-Invoice Cycle" subtitle="Where most wrong e-invoices are discovered — the monthly reconciliation" >}}
  {{< card link="/applets/e-invoice/my-e-invoice-admin-applet/" title="My E-Invoice Admin Applet" subtitle="Field-level reference for the Rejection Requests and Cancellation Queue screens" >}}
  {{< card link="/applets/sales-workflow/internal-sales-credit-note-applet/" title="Sales Credit Note Applet" subtitle="Where the corrective document is raised" >}}
{{< /cards >}}
