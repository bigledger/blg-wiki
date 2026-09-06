---
title: "Incoming Supplier E-Invoices"
description: "What BigLedger does and does not do with the e-invoices your suppliers issue to you: where incoming documents arrive, how matching against your purchase documents works, and the check to run for everything it cannot see"
tags:
- user-guide
- e-invoice
- purchasing
- compliance
weight: 33
---

Your suppliers are e-invoicing too, and sooner or later somebody will ask you to prove that every purchase in your books has a validated supplier e-invoice behind it. This guide shows you the screens where incoming documents arrive, how to pair one with your own purchase document, and — just as important — which supplier e-invoices BigLedger will never show you, so you can put a manual check in place instead. Budget about **twenty minutes** to read it and **fifteen minutes a month** to run the routine at the end.

{{< callout type="warning" >}}
**Set your expectations before you open anything. BigLedger does not show you the e-invoices your suppliers filed with LHDN.** Incoming matching works only for documents that reach BigLedger through a delivery channel — PEPPOL, or the OCR e-mail intake. Documents your supplier submitted to MyInvois and nothing else do not appear, cannot be matched, and never will be until that changes. Most of your suppliers are in that second group.
{{< /callout >}}

## Meet GadgetSphere

GadgetSphere Sdn Bhd buys from around **1,200 suppliers** — authorised distributors for the major smartphone and computing brands, accessory wholesalers, a few regional distributors in Singapore and Hong Kong billing in US dollars, plus the rental, utility and marketing suppliers every business has. Around 20 authorised distributors account for the overwhelming majority of the spend, which is what makes the routine below workable: you check the big suppliers properly and spot-check the rest.

## What you need to know first

One idea from elsewhere in this section carries over: **[validation and clearance](/modules-v2/e-invoice/concepts/validation-and-clearance/)** — what it means for a document to be *Valid* at LHDN, and why a validated e-invoice carries an LHDN identifier and a QR code. That is the thing you are looking for on your supplier's document.

Two words are used here in ways that will mislead you if you carry over their meaning from elsewhere:

- **A matching queue is not a [submission queue](/modules-v2/e-invoice/concepts/pools-and-queues/).** A submission queue holds a document that is on its way to LHDN and will move on its own. A matching queue holds a row that waits for a counterpart to turn up, and if none ever does, it waits forever. That is normal, not a fault.
- **Matching here is not three-way matching.** Comparing a purchase order, a goods received note and a supplier invoice is a purchasing job and lives in the [purchasing guides](/guides/purchasing-guides/). Matching in e-invoicing means pairing *your* purchase document with the *supplier's* e-invoice as a tax document.

## Before you start

- You can open the **My E-Invoice Admin Applet**, and its left menu shows both **External Reception** and **Reconciliation (Purchase)**. If either group is missing, an applet setting is hiding it — ask whoever administers the applet.
- Last month's purchase invoices are **finalised**. A purchase document still in draft has not entered any part of the e-invoice pipeline.
- Your **supplier records carry a tax number** wherever the supplier has one. This decides more than it looks like it should — see Step 1.

---

## Step 1: See which purchases BigLedger expects a supplier e-invoice for

**Outcome:** you have an exportable list of the purchases that ought to have a validated supplier e-invoice behind them.

*My E-Invoice Admin Applet → Reconciliation (Purchase) → PD Matching Q.*

When you finalise a purchase document, BigLedger records a row here — but only when **all** of the following are true. It is worth reading these slowly, because each one is a silent exclusion:

- The company has e-invoicing switched on.
- The document is a purchase invoice, purchase credit note, debit note, refund note or purchase return.
- The document is **not** flagged self-billed. (If it is, *you* are issuing the e-invoice — see Step 5.)
- The **supplier has a tax number** on their record.

{{< figure src="/images/my-e-invoice-admin-applet/reconciliation-purchase-matching.png" alt="Purchase Doc Matching Queue listing with Auto Match, Export and Push to Unmatched History buttons above a grid whose Status column reads UNPROCESSED on every row" caption="Reconciliation (Purchase) → PD Matching Q. — one row per purchase document that should have a supplier e-invoice behind it." >}}

Each row carries the document number, a short code telling you what kind of document it is (`PURINV` for a purchase invoice), the company, the supplier, the document date and the amount. Press **Export** and you have your worklist for the month.

{{< callout type="tip" >}}
**If a regular distributor is missing from this list, check the supplier record before you chase the supplier.** A supplier with no tax number on file never generates a row at all, and nothing tells you so. Fix it in the [Supplier Applet](/applets/master-data/supplier-applet-1/) and future purchases start appearing.
{{< /callout >}}

## Step 2: See what has actually arrived

**Outcome:** you know what BigLedger has received from your suppliers, and — more usefully — what it never will.

There are two screens on the receiving side, and they answer different questions.

*My E-Invoice Admin Applet → Reconciliation (Purchase) → Inc. E-Invoice Match Q.*

This is the list of **supplier documents BigLedger has actually received and can pair with your purchases**. Its **Match Source** column tells you how each one arrived:

- **PEPPOL** — the supplier sent it over the PEPPOL network, and it landed through your access point.
- **EMAIL** — the supplier e-mailed it, and the OCR intake read it into a document.

Those are the only two sources. There is no third.

*My E-Invoice Admin Applet → External Reception → From IRB E-Invoice*

This screen is meant to show the e-invoices LHDN holds with your company as the buyer. **It is empty, and no setup on your side will fill it.** BigLedger can ask MyInvois for those documents, but what comes back stops in an internal staging area and never reaches this screen or the matching queue. Open it once so you have seen it, then stop going back.

{{< callout type="warning" >}}
**This is the gap that matters.** For the overwhelming majority of your suppliers — everyone who files with LHDN and sends you an ordinary PDF or a paper invoice — BigLedger has no record of their e-invoice at all. Your only check for those is the manual one in Step 4. Do not treat an empty *From IRB E-Invoice* screen as evidence that a supplier failed to e-invoice.
{{< /callout >}}

## Step 3: Pair a supplier document with your purchase document

**Outcome:** a supplier document that did arrive is recorded as matched to the purchase you booked for it.

Only worth doing if Step 2 showed rows in *Inc. E-Invoice Match Q.* If that screen is empty, skip to Step 4.

**The fast way.** Press **Auto Match** on either matching-queue screen. BigLedger walks the incoming documents and looks for a purchase document where **four values agree exactly**: the supplier's identity number, the reference number, the amount, and the document date. All four, exactly — there is no tolerance and no partial match. A pair that agrees is written to *Matched History* and both rows disappear from their queues.

That exactness is why Auto Match usually finds nothing. A purchase invoice keyed from a supplier's paperwork rarely carries the supplier's own reference number character-for-character, and one sen of rounding or one day of date difference is enough to miss.

**The reliable way.** Match the pair yourself:

1. Open the row in *Reconciliation (Purchase) → PD Matching Q.*
2. Go to the **Match Incoming Doc** tab.
3. Press the **+** button. The **Match Incoming E-Invoice** screen opens with the incoming documents listed.
4. Select the supplier's document and press **Match**.

The pair moves to *Reconciliation (Purchase) → Matched History*. If you get it wrong, **Pushback to Queues** on that screen puts both rows back where they came from — nothing is destroyed.

{{< callout type="info" >}}
**Matching changes nothing about the purchase document.** It does not post anything, does not alter the document's status, does not touch tax or the general ledger, and does not create a journal. It is a record that you checked, and it is fully reversible. Your accounting is unaffected either way — which also means matching is not a substitute for approving and posting the purchase invoice properly.
{{< /callout >}}

## Step 4: Check the rest by hand — and clear them off the list

**Outcome:** every purchase above your review threshold has a validated supplier e-invoice on file, and your worklist shrinks as you go.

This is the step that does the real work, because Step 3 covers only the small fraction of suppliers who deliver electronically.

Your supplier's validated e-invoice reaches you the way any invoice does — by e-mail, from their own portal, or with the goods. What makes it a *validated* e-invoice rather than an ordinary invoice is that it carries an **LHDN identifier and a QR code**. If those are not on the document, LHDN has not cleared it, whatever the covering note says.

Take the export from Step 1 and, for each purchase you review, check four things against the supplier's document:

1. **The buyer is you** — your company's name and tax number, not a sister company's. GadgetSphere buys through three legal entities (`GS`, `GSO` and `GSD`), and a distributor billing the retail company while e-invoicing the distribution company is a common and expensive mistake.
2. **The amount agrees** with the purchase invoice you booked.
3. **The document date falls in the period you are closing.** A supplier who e-invoices late puts their document in a different month from your purchase.
4. **The supplier's tax number is on it** and matches your supplier record. Where they differ, yours is usually the stale one.

File the supplier's validated e-invoice with the purchase document, the way you file a delivery order. Nothing in BigLedger stores it for you.

Then clear the row: select it in *PD Matching Q.* and press **Push to Unmatched History**. That is what the button is for — "I have dealt with this one, it is not waiting for an electronic counterpart." It parks the row in *Unmatched PD Hist.*, and **Pushback to PD Matching Queue** on that screen brings it back if you clear something by mistake. Used this way, the queue becomes a genuine month-by-month worklist instead of a list that only grows.

**The most common thing that stops you here** is a supplier who will not produce an e-invoice at all — either because they are not yet inside their LHDN compliance phase, or because the obligation is not theirs. That is Step 5.

## Step 5: When the supplier will not issue one

**Outcome:** the purchase is still reported to LHDN — by you.

For certain transactions LHDN puts the obligation on the **buyer** instead of the seller. In BigLedger those are ordinary purchase documents flagged as **self-billed**. They go through exactly the same submission pipeline as your sales e-invoices, with the roles swapped: your company is the buyer, and your supplier is the issuer of record.

Three things to know before you flag anything:

- A self-billed purchase document **never appears in the PD Matching Queue**, by design. You are issuing the e-invoice, so there is nothing incoming to pair it with.
- You watch its progress on the purchase document itself, on the **E-Invoice** tab: *Submission* holds the submission type and the supplier's identity block, and *Progress* shows it moving through the four stages — pending in the posting queue, in the batch pool, in the submission queue, submitted to LHDN.
- A self-billed line usually comes from an expense account rather than a stock item, so it has no item classification code to inherit. A blank classification is sent as `022 Others`, which may not be what you want on the document.

{{< callout type="warning" >}}
**Which transactions you must self-bill is LHDN's rule, not BigLedger's.** Confirm your own cases against the current LHDN e-Invoice guideline before you flag any supplier's purchases as self-billed. Guessing reports a transaction twice, or not at all.
{{< /callout >}}

## Step 6: Know what month-end can and cannot prove

**Outcome:** you read the Discrepancies Report correctly instead of chasing a zero that is supposed to be zero.

*My E-Invoice Admin Applet → Monthly Report → Discrepancies Report*

Its **IRB Audit Summary** tab splits each document type three ways: **Internal Submission**, **From E-commerce (self billed)** and **From Supplier (Matched)**.

That last figure counts the pairs you made in Step 3, so unless you receive supplier documents over PEPPOL or by OCR e-mail, it reads **zero**. That is not a reconciliation failure and there is nothing to chase. The rest of the report is sound: it compares the documents you finalised against the e-invoices BigLedger raised for them, in both directions, and it is what the [month-end cycle](/guides/einvoice-guides/einvoice-month-end/) is built on.

{{< callout type="info" >}}
**You cannot reject a supplier's e-invoice from BigLedger.** LHDN gives a buyer 72 hours from validation to reject a document, but there is no screen and no button for it anywhere in BigLedger — the *Request for Rejection* button you may have seen belongs to the other side of the relationship, where **your** buyers reject **your** e-invoices. If you need to reject a supplier's e-invoice, it happens on the MyInvois portal or on your supplier's own buyer portal, and BigLedger will not know it happened. The mirror image of the same blind spot is described in [Cancelling & Correcting an E-Invoice](/guides/einvoice-guides/einvoice-cancel-and-correct/).
{{< /callout >}}

---

## What success looks like

Thirty seconds, at the end of a month:

1. *Reconciliation (Purchase) → PD Matching Q.* holds only the purchases you have not yet reviewed — everything you have checked has been pushed to *Unmatched PD Hist.* or matched.
2. Every supplier you expected to see is on that list, and any that is missing turned out to be missing a tax number rather than missing an e-invoice.
3. For every purchase above your own review threshold, the supplier's validated e-invoice — the one with the LHDN identifier and QR code — is filed with the purchase document.

## Common mistakes

| Mistake | What you see | What to do instead |
|---|---|---|
| Waiting for *From IRB E-Invoice* to fill up | An empty screen, month after month | It does not fill. Supplier e-invoices filed with LHDN never reach BigLedger; check those by hand (Step 4) |
| Pressing **Auto Match** repeatedly and expecting a different result | Nothing matches, however many times you try | All four values — supplier ID, reference number, amount, date — must agree exactly. Match the pair yourself from the **Match Incoming Doc** tab instead |
| Treating `UNPROCESSED` as a backlog you caused | A list that only grows | It is the normal state of a row waiting for a counterpart. Work the list and clear each row with **Push to Unmatched History** |
| Assuming a missing supplier is not e-invoicing | A regular distributor never appears in *PD Matching Q.* | Check the **tax number on the supplier record** first — without one, no row is ever created |
| Chasing the zero in **From Supplier (Matched)** | RM 0 against every document type in that column of the Discrepancies Report | It is supposed to be zero unless you receive supplier documents over PEPPOL or by e-mail. Reconcile from the other two columns and the Document vs E-Invoice Discrepancy tab |

## Related documentation

- **[The Month-End E-Invoice Cycle](/guides/einvoice-guides/einvoice-month-end/)** — the reconciliation Step 6 feeds into
- **[Cancelling & Correcting an E-Invoice](/guides/einvoice-guides/einvoice-cancel-and-correct/)** — the outgoing side of the same rejection blind spot
- **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)** — every screen named above, field by field
- **[Purchase Invoice Applet](/applets/finance/internal-purchase-invoice-applet/)** — where a purchase document, self-billed or not, is created
- **[Supplier Applet](/applets/master-data/supplier-applet-1/)** — the tax number and identity fields that decide whether a purchase reaches the matching queue
- **[Purchasing guides](/guides/purchasing-guides/)** — three-way matching of orders, goods received notes and invoices, which is a different job entirely
