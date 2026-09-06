---
title: "Purchase Invoice Processing"
description: "Book a supplier's bill against the order and the receipt, check it before you commit, and finalise it — the document that actually posts your stock and your payables."
tags:
- user-guide
- purchasing
- accounts-payable
weight: 14
sources:
  - /applets/finance/internal-purchase-invoice-applet/
  - /applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/
  - /applets/purchase-workflow/internal-purchase-grn-applet/
  - /applets/purchase-workflow/internal-purchase-order-applet/
  - /applets/finance/internal-payment-voucher-applet/
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
  - kb/topics/document-approval.md
---

You are in accounts payable with a supplier's invoice in front of you, and by the end of this page you will have booked it against the order and the receipt, checked it, and finalised it — which is the moment your stock goes up, your input tax is claimable and you owe the supplier money. A clean invoice takes about three minutes. Budget longer for the first one on a new tenant, because that is when missing GL defaults surface.

Of the four documents in a normal purchase, **this is the one that does the accounting.** The purchase order committed you to nothing; the goods received note counted the boxes and posted nothing. The invoice books the stock in, posts the purchase and the input tax, and creates the creditor balance. Which means a mistake here is a mistake in your accounts, and FINAL cannot be undone.

## Meet GadgetSphere

GadgetSphere Sdn Bhd processes roughly 2,100 supplier invoices a month from authorised distributors and accessory wholesalers across its 22 branches. Today's invoice is for the earbud delivery at `GS-KV-01`: 200 units at RM 128, RM 25,600 net, RM 1,536 SST at 6%, RM 27,136 total, 30-day terms.

## Before you start

- **The GRN is finalised.** A draft receipt has no open queue and will not appear when you look for it.
- **The supplier exists** with the right AR/AP type on their profile. That type decides which creditor account this invoice credits — get it wrong and the money lands in the wrong place with no error.
- **Your company's default GL codes are linked** — `PURCHASE`, `INPUT_TAX`, and the creditor account for the supplier's AR/AP type. This is the number one cause of a first invoice refusing to finalise.
- **The period you are posting into is open.**
- **You know which receipt path your company uses.** If your goods came in on a *Purchase GRN Stock In*, you must bill them with a *Purchase Invoice No Stock In*, not this document — see the warning below.

{{< callout type="warning" >}}
**Two paths, and you must stay in one.**

- **Purchase GRN → Purchase Invoice** (this page). The GRN posts nothing; the invoice books stock and the liability together.
- **Purchase GRN Stock In → Purchase Invoice No Stock In.** The GRN books the stock on receipt; the invoice books only the money.

A *GRN Stock In* followed by a full *Purchase Invoice* counts the same goods into stock twice. A plain *GRN* followed by a *Purchase Invoice No Stock In* never counts them at all. Neither produces an error. If you are not certain which pair your company uses, ask before you finalise.
{{< /callout >}}

## Step 1: Create the invoice and enter the header

*Finance > Purchase Invoice (Internal) > Internal Purchase Invoice > Create*

Click Create. **Branch and location are the only unconditionally required header fields** — set them to `GS-KV-01` and its location.

Set the **transaction date** to the date on the supplier's invoice, not today. That date drives the accounting period, the input-tax claim period and the due date. Put the supplier's own invoice number in the reference field so you can find this document from their paperwork and so a duplicate stands out.

Credit terms come across from the supplier and produce the due date. For our 30-day terms on a March invoice, expect an April due date.

## Step 2: Choose the supplier

*Finance > Purchase Invoice (Internal) > (your draft) > Account*

On the **Account** tab, pick the supplier. The sub-tabs cover the entity details, bill-to and ship-to addresses, and the intercompany link if this is a transaction between two companies of your group.

The supplier's AR/AP type is what decides the creditor account. If your tenant has more than one creditor account — trade, non-trade, related-party — this is where that distinction is made, silently, by the master data. It is worth a glance when you are booking a supplier for the first time.

## Step 3: Pull in the receipt

*Finance > Purchase Invoice (Internal) > (your draft) > KO For > Purchase GRN*

**Never key the lines by hand when a GRN exists.** Go to the **KO For** tab, choose *Purchase GRN*, and pick the finalised receipt. Only finalised, not-fully-knocked-off documents appear in the list; a receipt that has already been invoiced has gone.

The lines come across with the received quantities. This is where matching actually happens in BigLedger: it is a knock-off, not a scoring engine. There is no variance report and no tolerance check — the mismatch shows up as a difference between what is on your screen and what is on the supplier's paper, and it is your job to notice.

If your company's flow is order-to-invoice with no receipt document, choose *Purchase Order* on the same tab instead. If you need to look something up rather than knock it off, the **Search Document** panel on a saved draft searches purchase orders, GRNs and previous purchase invoices.

*Watch out for:* if the receipt is not in the list, check in order — is it finalised, is it for this supplier, and has someone already invoiced it? All three are common and all three look identical from here.

## Step 4: Check the invoice against the paper

*Finance > Purchase Invoice (Internal) > (your draft) > Line Items*

This is the step people skip, and it is the only real control on the whole flow. Compare three things:

**Quantity.** The lines came from the receipt, so they show what you actually received. If the supplier has billed 200 and you received 195, your screen says 195 and their paper says 200. Do not adjust the line to match their paper. Query it.

**Price.** The receipt carries the order's price. If the supplier has billed RM 132 against an ordered RM 128, you will see RM 128 on screen and RM 132 on paper. A price increase may well be legitimate — but it should be agreed before it is posted, not after.

**Tax.** Check the tax code on each line and the tax total. A 6% SST line on RM 25,600 is RM 1,536. If the supplier's invoice is not a valid tax invoice, you cannot claim the input tax, and finalising it anyway just moves the problem into your SST return.

For each line you can open **Item Details**, **Pricing Details**, **Costing Details** and **Issue Link** for the detail behind the numbers.

Anything that does not match: stop here. A draft invoice can be edited freely or discarded. A finalised one can only be voided — and voiding is blocked once a purchase return is linked to it, and blocked entirely once your company is live on e-Invoice, at which point your only route is a purchase credit note. Five minutes now against half a day later.

## Step 5: Attach the invoice and finalise

*Finance > Purchase Invoice (Internal) > (your draft) > Attachment, then FINAL*

Attach the supplier's PDF or scan on the **Attachment** tab. Check the image is readable and that every page is there.

There is **no approval step on a purchase invoice.** There is no Submit for Approval button and no approval queue, because BigLedger's approval engine covers only purchase orders, purchase requisitions and stock requisitions. Your control here is who holds the finalise permission. If your policy is that anything with a variance needs a second pair of eyes, build that into who can click FINAL — the system will not route it for you.

Then click **FINAL**.

**What FINAL posts.** For our invoice:

```
Dr  Purchase (or the item's GL code)   RM 25,600
Dr  Input Tax                          RM  1,536
    Cr  Creditor — the supplier                RM 27,136
```

and 200 units into stock at `GS-KV-01`, with the serial number records created and the item's last purchase cost updated to RM 128.

Which GL code the purchase line lands in is decided in this order: a GL code on the line, then a GL code on the document header, then the item's own company GL link for purchases, then the company's default `PURCHASE`. Tax lines always use the company default `INPUT_TAX`. Discounts post to the purchase discount account; settlement forex differences post to forex gain or loss.

If your company is live on e-Invoice, a finalised invoice with the self-billed flag is picked up by the My E-Invoice Portal automatically. The **E-Invoice** tab shows its MyInvois processing status and any failures.

**Three errors that stop a FINAL:**

- **`MISSING_DEFAULT_GL_CODE: <code>`** — the company has no default GL code linked for the code named in the message. Fix the link; the invoice finalises unchanged.
- **`FISCAL_PERIOD_LOCKED`** — the transaction date falls in a closed month.
- **"Generic Document has already been posted to FINAL"** — someone beat you to it. Reload the listing.

## Step 6: Confirm it posted, then settle it

*Finance > Purchase Invoice (Internal) > (the invoice) > Posting, TraceDocument*

The **Posting** tab shows five statuses: Journal, Inventory, Membership Points, Cashbook and Tax. Journal and Inventory both posted means you are done. **TraceDocument** shows the actual journal and inventory rows that were created, which is what you show an auditor.

When you come to pay:

- **One invoice** — record the settlement on the invoice's own **Payment** tab. The methods offered are the ones assigned to your branch in Branch Settings. To offset against a supplier deposit or a credit document, use the **Contra** tab instead.
- **Several invoices in one payment** — use the [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) applet. One payment line per real bank movement, contra-linked to the invoices being settled. Each payment line becomes one cashbook transaction, and those are what you will tick off in bank reconciliation later.

## What success looks like

Thirty seconds, four checks:

1. **The Posting tab shows Journal and Inventory posted.**
2. **Stock Availability for the item at `GS-KV-01`** shows the 200 units on hand, and the *GRN quantity* figure has dropped — the receipt is no longer waiting to be invoiced.
3. **The GRN's Doc Link tab** shows this invoice. If it does not, you keyed the lines instead of knocking off, and the receipt is still sitting open.
4. **The supplier's account** shows the RM 27,136 outstanding with the right due date.

## Common mistakes

**Keying the lines instead of using KO For.** The invoice looks identical and posts identically — but the GRN stays open forever, the same goods can be invoiced twice, and nothing ties the bill to the receipt. Always come in through KO For or Search Document.

**Adjusting the line to match the supplier's paper.** If they billed for more than you received, changing the quantity on the invoice makes the discrepancy disappear from your screen and appear in your stock count six weeks later. Query the invoice instead.

**Finalising with a price you have not agreed.** FINAL posts the ledger and the stock. Voiding is blocked once a purchase return is linked and blocked entirely under e-Invoice; the remaining route is a purchase credit note plus an explanation.

**Using the wrong invoice document for your receipt path.** *Purchase Invoice* after a *GRN Stock In* double-counts the stock; *Purchase Invoice No Stock In* after a plain *GRN* never counts it. Both are silent.

**Dating the invoice today instead of on the supplier's date.** It changes the period, the input-tax claim and the due date, and it makes the supplier's statement impossible to reconcile against yours.

**Expecting a variance report.** There is no three-way matching engine, no tolerance band and no variance flag anywhere in BigLedger. The knock-off brings the received quantities across and that is the whole mechanism. The check is you, reading the screen against the paper.

## Related documentation

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the full applet reference: every tab, setting, GL rule and failure mode
- [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/) — the money-only variant for the GRN Stock In path
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the receipt this invoice knocks off
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) — paying several invoices in one go
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow/)
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note/)
- [Bank Reconciliation Guide](/guides/accounting-guides/bank-reconciliation-guide/)
