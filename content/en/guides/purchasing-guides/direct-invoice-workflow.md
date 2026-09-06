---
title: "Direct Invoice Workflow"
description: "Book a supplier bill with no purchase order and nothing to receive — rent, utilities, subscriptions, professional fees and other non-stock spend — so it lands in the right expense account and the right SST period."
tags:
- user-guide
- purchasing
- accounts-payable
weight: 30
sources:
  - /applets/finance/internal-purchase-invoice-applet/
  - /applets/master-data/doc-item-maintenance-applet/
  - /applets/finance/internal-payment-voucher-applet/
  - /applets/master-data/supplier-applet-1/
  - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/inventory/InventoryTransactionLineProcessorService.java
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
---

Not everything you buy arrives on a pallet. Rent, electricity, the accountant's fee, the cleaning contract, a software subscription — there is no purchase order, nothing to receive, and no stock to book. By the end of this guide you will have booked one of these bills straight onto a purchase invoice, put the cost in the right expense account, and left the input tax claimable. It takes about three minutes once your expense items exist.

There is one setup decision that makes the difference between this being easy and being a monthly argument with your accountant, and it is covered in Step 1: **what kind of item you use on the line**. Get that right once and every future bill from the same supplier posts itself to the right place.

## Meet GadgetSphere

GadgetSphere Sdn Bhd pays rent on 22 branch premises, electricity on all of them, and a long tail of professional and subscription spend from head office. Today's bill is the March rent for branch `GS-KV-01`: RM 12,000 plus RM 720 SST at 6%, RM 12,720 total, payable on the 7th.

## When to use this workflow

Use it when there is genuinely nothing to receive:

- Rent, utilities, telecommunications, insurance
- Professional fees — audit, legal, tax agent, consultancy
- Software subscriptions and hosting
- Repairs, maintenance and cleaning contracts
- Freight and courier charges billed separately from the goods

**Do not** use it for goods that arrived. Even if nobody raised an order, the goods should be recorded on a GRN first so there is a receipt to point at — see [Direct GRN Workflow](/guides/purchasing-guides/direct-grn-workflow/).

**Do not** use it for stock you did order. Receive against the purchase order and knock the receipt off — see [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow/).

## Step 1: Set up the expense items once

*Master Data > Doc Item Maintenance*

A purchase invoice line needs an item, even when what you are buying is not a thing. BigLedger's item types cover this: alongside the ordinary stock item there are non-stock types, including **Service** items and **Account Code** items — the latter being an item that simply stands for a General Ledger account.

Why this matters: the stock processor only writes an inventory transaction for a line whose item resolves to an inventory item. A Service or Account Code item does not, so **an invoice made entirely of those lines posts to the ledger and moves no stock at all**, even though the purchase invoice document type is quantity-signum +1. There is no special "expense invoice" document — the item type is what makes the difference.

Set up one item per recurring cost you book: *Branch rental*, *Electricity*, *Audit fee*, *Cloud hosting*. Link each to the GL code it should post to. Do this once, and every future bill posts to the right account with nobody having to remember which one it was.

*Watch out for:* some applets are configured to keep Account Code items out of the item picker on purchase orders. That setting is deliberate and does not affect purchase invoices — but if you cannot find your expense item on a line, that is the first thing to check with whoever owns your applet settings.

## Step 2: Create the invoice

*Finance > Purchase Invoice (Internal) > Internal Purchase Invoice > Create*

Click Create. **Branch and location are the only unconditionally required header fields.** For branch rent, set the branch the cost belongs to — `GS-KV-01` — because that is what makes the per-branch profit and loss report right without any further tagging.

Set the **transaction date** to the date on the supplier's invoice. That date decides the accounting period and the SST period the input tax falls into. Put their invoice number in the reference field.

On the **Account** tab, pick the supplier — the landlord, the utility, the firm. If they are not in the supplier master, add them properly rather than booking to a generic "sundry" account; a year later you will want to know what you paid each landlord.

## Step 3: Enter the lines

*Finance > Purchase Invoice (Internal) > (your draft) > Line Items*

Add the expense item you set up in Step 1 — *Branch rental* — with quantity 1 and amount RM 12,000. Set the tax code; RM 720 at 6% SST.

Where the debit lands is decided in this order: a GL code entered on the line, then a GL code on the document header, then the item's own company GL link, then the company's default `PURCHASE` code. If your items are set up as Step 1 describes, the item's GL link does the work and you never touch the line's GL code. If you are booking a one-off cost with no item of its own, override the GL code on the line instead of inventing a new item.

If you report by segment, project or profit centre, tag them on the **Department Hdr** tab. For GadgetSphere's branch rent, the branch on the header is usually enough.

For a bill covering several things — a utility invoice with electricity, water and a late-payment charge — use one line per cost with its own item and its own tax treatment. Lumping them together makes the ledger tidy today and useless in six months.

## Step 4: Attach it and finalise

*Finance > Purchase Invoice (Internal) > (your draft) > Attachment, then FINAL*

Attach the supplier's PDF. For recurring bills this is the only evidence there will ever be that the amount was what they asked for.

There is **no approval step on a purchase invoice** and no approval queue — BigLedger's approval engine covers only purchase orders, purchase requisitions and stock requisitions. Whoever holds the finalise permission is your control. If your policy is that expenses over a certain amount need a second signature, that policy lives in who can click FINAL, not in the system.

Click **FINAL**. For our rent bill:

```
Dr  Rental Expense                     RM 12,000
Dr  Input Tax                          RM    720
    Cr  Creditor — the landlord                RM 12,720
```

No inventory line is written, because no line resolves to an inventory item.

Open the **Posting** tab to check: Journal posted, Inventory showing nothing to post. **TraceDocument** shows the journal rows.

**The two errors that stop a first expense invoice:**

- **`MISSING_DEFAULT_GL_CODE: <code>`** — either the expense item has no GL link and the company has no default `PURCHASE` code, or `INPUT_TAX` is not linked, or the supplier's AR/AP type has no creditor account. The message names which.
- **`FISCAL_PERIOD_LOCKED`** — the supplier's invoice date falls in a closed month. Do not move the date to make the error go away; that puts the input tax in the wrong SST period. Ask for the period to be reopened, or agree with your accountant where it should sit.

## Step 5: Pay it

- **One bill** — record the settlement on the invoice's own **Payment** tab. Methods are the ones assigned to your branch in Branch Settings.
- **A run of bills** — use the [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/) applet: payee, one payment line per real bank movement, contra-linked to the invoices being settled. Each payment line becomes one cashbook transaction, which is what you will match against your bank statement.

For the ones that repeat every month at the same amount — rent, subscriptions — **CLONE** the previous invoice rather than retyping it, and change the date, the reference and the amount. It runs as a background job, so give it a few seconds.

## What success looks like

Thirty seconds, three checks:

1. **The Posting tab shows Journal posted** and no inventory movement.
2. **Open your trial balance or the expense account** — the RM 12,000 is in Rental Expense, against branch `GS-KV-01`, in March.
3. **Open the input tax account** — the RM 720 is there and will appear on the SST return for the period the invoice is dated in.

## Common mistakes

**Using a stock item for a service.** The line resolves to an inventory item, an inventory transaction gets written, and you now have phantom stock of something that does not exist. Symptom: a stock report with an item you cannot find in the warehouse. Use Service or Account Code items.

**Booking everything to one generic expense item.** It posts, it balances, and it tells you nothing. One item per recurring cost, linked to its GL code, costs ten minutes once.

**Dating the invoice today.** The transaction date drives the accounting period and the SST period. A March bill entered in April, dated April, understates March and overstates April, and puts the input tax claim in the wrong return.

**Booking to the wrong branch.** Head office pays the bill, so it gets keyed against head office, and 22 branches show no rent. The branch on the header is what the per-branch report reads.

**Skipping the attachment on a recurring bill.** These are exactly the invoices nobody remembers and everyone queries. The PDF is thirty seconds now and the whole answer later.

**Expecting a routing or approval step.** There is none. If an expense should not be paid without a second look, the second look has to be a person before someone clicks FINAL.

## Related documentation

- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the full applet reference: every tab, setting, GL rule and failure mode
- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — where the Service and Account Code items are set up
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/)
- [Supplier](/applets/master-data/supplier-applet-1/)
- [Direct GRN Workflow](/guides/purchasing-guides/direct-grn-workflow/) — for goods that arrived with no order
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow/)
- [Chart of Accounts Setup](/guides/accounting-guides/chart-of-accounts-setup/) — getting the expense accounts right before you start
