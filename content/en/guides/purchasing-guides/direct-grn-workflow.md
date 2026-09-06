---
title: "Direct GRN Workflow"
description: "Receive goods that arrived without a purchase order — record them, bill them, and keep the audit trail intact when the paperwork came after the pallet."
tags:
- user-guide
- purchasing
- receiving
weight: 20
sources:
  - /applets/purchase-workflow/internal-purchase-grn-applet/
  - /applets/purchase-workflow/internal-purchase-grn-stock-in-applet/
  - /applets/finance/internal-purchase-invoice-applet/
  - /applets/purchase-workflow/internal-purchase-order-applet/
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
---

Sometimes the goods arrive before the paperwork does. A supplier ships an urgent replacement, a branch manager rings a wholesaler directly, a distributor sends a promotional allocation nobody ordered. By the end of this guide you will have recorded a delivery that has no purchase order behind it, billed it, and left an audit trail that survives a question three months later. It takes about the same time as a normal receipt — five minutes — plus whatever it takes to find out who agreed to the purchase.

Everything else on this page rests on the same fact as the standard flow: **a Purchase GRN moves no stock and posts nothing to the ledger.** The purchase invoice does both. Skipping the purchase order changes nothing about that.

## Meet GadgetSphere

GadgetSphere Sdn Bhd runs 22 branches, and about one delivery in twenty arrives without an order behind it. Today it is 30 replacement charging cables sent by an accessory wholesaler to branch `GS-KV-01` after a batch of faulty ones — RM 18 each, RM 540 net, RM 32.40 SST at 6%. Nobody raised an order because the branch manager arranged it over the phone.

## When this is the right workflow, and when it is not

Use a direct GRN when goods have physically arrived and there is no finalised purchase order to receive them against. Typical cases: an emergency replenishment agreed by phone, a warranty replacement, a supplier's own allocation, a sample.

**Do not** use it to work around a purchase order that exists but is still in draft. Finalise the order and receive against it — thirty seconds, and it keeps the commitment, the receipt and the bill on one thread.

**Do not** use it for services or expenses with no goods at all. There is nothing to receive; book those straight on a purchase invoice. See [Direct Invoice Workflow](/guides/purchasing-guides/direct-invoice-workflow/).

{{< callout type="warning" >}}
**A direct GRN removes your only preventive control.** With a purchase order, someone committed to a price and a quantity before the goods moved. Without one, the first time anybody checks the price is when the invoice arrives — and by then you have the goods. That is a business decision, not a system one: BigLedger will not stop you, warn you, or route the receipt to anyone. If direct receipts are more than an occasional exception at your branches, the fix is upstream, in how orders get raised.
{{< /callout >}}

## Before you start

- **The supplier exists** with the right AR/AP type.
- **The items exist** in Doc Item Maintenance.
- **You know who agreed to the purchase**, and at what price. Write it in the remarks — this is the whole difference between a defensible direct receipt and an unexplained one.
- **Your branch and location** are set.
- **You hold create and finalise permission** on the GRN document type.

## Step 1: Create the receipt with no source document

*Purchasing > Purchase GRN (Internal) > Internal Purchase GRN > Create*

Click Create. Fill in the **Main Details** tab exactly as you would for a normal receipt: branch `GS-KV-01`, its receiving location, and the transaction date the goods actually arrived.

Put the supplier's delivery note number in the header reference. With no purchase order to anchor the receipt, their document number is the only external reference this transaction will ever have — do not leave it blank.

On the **Account** tab, pick the supplier.

The one difference from a normal receipt is what you skip: there is no **Search Document**, no **KO For** and no **Import**. You will type the lines.

## Step 2: Enter the lines by hand

*Purchasing > Purchase GRN (Internal) > (your draft) > Lines*

Add each item and the quantity you counted. 30 charging cables.

You will also need a price. On a normal receipt the price comes across from the order; here it comes from wherever you agree it should — the pricing scheme linked to your branch will offer one, and you can override it with the price the branch manager was quoted. It is worth getting close, because it is what the item's last purchase cost becomes when the invoice posts.

If the item is serialised or batch-tracked, capture the serials and batches on the line exactly as you would on a normal receipt. The count must equal the line quantity.

## Step 3: Write down why this receipt has no order

*Purchasing > Purchase GRN (Internal) > (your draft) > Main Details (remarks), Attachments*

This is the step that makes a direct GRN acceptable rather than merely possible.

In the remarks, write a sentence a stranger could read in six months: *"Replacement for faulty batch supplied 3 March. Agreed by phone with the wholesaler by the `GS-KV-01` branch manager, 12 March. No PO raised."* Name the arrangement, the date and the role — not a person's name, a role.

Attach the delivery note, and anything else that evidences the arrangement: an e-mail, a quotation, a photograph of the faulty stock being replaced.

If your tenant uses custom statuses, tag this one so direct receipts can be pulled out as a group later. That is how you find out whether one branch is doing this every week.

## Step 4: Finalise

*Purchasing > Purchase GRN (Internal) > (your draft) > SAVE, then FINAL*

Save, read the lines back against your count, then click **FINAL**.

FINAL validates the serials, bins and fiscal period, locks the document, and creates the open-queue rows the purchase invoice will consume. It writes no inventory transaction and no journal entry. The receipt appears in Stock Availability as *GRN quantity* — goods that are here, counted, and not yet stock.

## Step 5: Bill it

*Finance > Purchase Invoice (Internal) > Internal Purchase Invoice > Create > KO For > Purchase GRN*

When the supplier's invoice arrives, book it exactly as you would any other: create the purchase invoice, pick the supplier, and knock off the GRN from the **KO For** tab. Only finalised, not-yet-invoiced receipts appear there, so your direct GRN will be in the list.

This is the moment the price gets checked, and on a direct receipt it is the *first* moment. Compare the supplier's invoice against the price you entered on the GRN and against whatever was agreed. If they differ, you are negotiating after delivery, which is a weaker position — but it is far better done now than after FINAL.

FINAL on the invoice posts:

```
Dr  Purchase (or the item's GL code)   RM 540.00
Dr  Input Tax                          RM  32.40
    Cr  Creditor — the supplier                RM 572.40
```

and books the 30 cables into stock at `GS-KV-01`, updating the item's last purchase cost.

If your company uses the *GRN Stock In* path instead, the stock was booked at Step 4 and the invoice must be a *Purchase Invoice No Stock In*. Do not mix the pairs — it either double-counts the stock or never counts it, silently.

## What success looks like

Thirty seconds, three checks:

1. **The invoice's Posting tab** shows Journal and Inventory posted.
2. **Stock Availability for the item at `GS-KV-01`** shows 30 more on hand, and the *GRN quantity* figure has dropped back.
3. **Open the GRN and read the remarks.** If you cannot tell from them who agreed to this purchase and when, go back and write it properly. That sentence is the entire audit trail for a transaction with no order behind it.

## Common mistakes

**Leaving the remarks blank.** A GRN with no order and no explanation is indistinguishable from an error or a theft. Nobody can reconstruct it later, including you.

**Waiting for the stock balance to move on FINAL of the GRN.** It will not. The invoice does that. Direct or not, a standard GRN is (0,0).

**Using a direct GRN to bypass a draft purchase order.** The order exists; finalise it and receive against it. A parallel direct receipt leaves the order permanently open in the queue and the same goods can be received twice.

**Entering a placeholder price "to be corrected on the invoice".** The GRN's price is what the knock-off carries into the invoice. A placeholder means someone has to notice and fix it under time pressure — and if they do not, it becomes the item's last purchase cost.

**Treating this as the normal way to buy.** Each direct receipt is a control you did not run. Pull them out periodically — by custom status, or by finding GRNs with no linked purchase order on the Doc Link tab — and ask why they happened. The answer is usually a process problem at one branch, not a supplier problem.

## Related documentation

- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the full applet reference
- [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) — the alternative that books stock on receipt
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/)
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow/) — the controlled path this one deviates from
- [Direct Invoice Workflow](/guides/purchasing-guides/direct-invoice-workflow/) — for services and expenses with nothing to receive
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note/)
- [Supplier](/applets/master-data/supplier-applet-1/)
