---
title: "Creating a Purchase Order"
description: "Raise a purchase order in BigLedger — header, supplier, lines, tax and delivery — finalise it, send it, and keep track of what is still outstanding."
tags:
- user-guide
- purchasing
- purchase-order
weight: 10
sources:
  - /applets/purchase-workflow/internal-purchase-order-applet/
  - /applets/purchase-workflow/internal-purchase-requisition-applet/
  - /applets/purchase-workflow/blanket-purchase-order-applet/
  - /applets/master-data/supplier-applet-1/
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
  - kb/topics/document-approval.md
---

You are the buyer, and you need to commit to a supplier in writing. By the end of this page you will have raised a purchase order, finalised it, sent it, and know where to look to see what is still outstanding on it. Your first one takes about ten minutes; after that, two or three.

A purchase order in BigLedger is a commitment, not a transaction. Finalising it posts **nothing** to your ledger and moves **no stock** — it locks the document and puts its lines into an open queue so the warehouse's goods received note and accounts payable's invoice can pull from them. That queue is the whole point: it is what lets a delivery of 180 against an order of 200 leave 20 still outstanding without anyone doing anything clever.

## Meet GadgetSphere

GadgetSphere Sdn Bhd sells consumer electronics from 22 branches. Buying is centralised in head office, and today's order is a routine replenishment for branch `GS-KV-01`: 200 units of a mid-range wireless earbud at RM 128 from an accessory wholesaler, on 30-day terms, delivered to the branch. RM 25,600 net, RM 1,536 SST at 6%, RM 27,136 gross.

## Before you start

- **The supplier exists** in the [Supplier](/applets/master-data/supplier-applet-1/) applet with credit terms and an AR/AP type set. Some tenants let buyers create suppliers from the picker; many deliberately do not.
- **The items exist** in Doc Item Maintenance with the unit of measure you buy in.
- **Your branch and location** are known — `GS-KV-01` here.
- **A pricing scheme is linked** to your branch or your role if you want prices to fill themselves in. Without one you type every price by hand, which works but invites typos.
- **A forex rate exists** if you are buying in a currency other than MYR. GadgetSphere buys some stock in USD from regional distributors, and those orders need a rate on the day.
- **You hold create and finalise permission** on `INTERNAL_PURCHASE_ORDER`.

## Step 1: Open the applet and create the order

*Purchasing > Purchase Order (Internal) > Purchase Order > Create*

The listing opens filtered to a default posting status and date window. If an order you expect is not there, widen the date filter or use **Advanced Search** before concluding it does not exist.

Click Create. The form opens on **Main Details**. Set:

- **Branch and location** — `GS-KV-01`. If your defaults are configured these are already filled; if they are blank, set them, because almost everything downstream keys off the branch.
- **Transaction date** — normally today.
- **Reference** — whatever your buyers recognise. A pattern like `PO-2026-03-KV01-014` costs nothing and saves an afternoon later.

## Step 2: Choose the supplier

*Purchasing > Purchase Order (Internal) > (your draft) > Account*

On the **Account** tab, pick the supplier. The credit terms on their profile drive the payment terms on this order.

If your applet has inline supplier creation enabled you can add a new supplier from the picker; if it is switched off — the safer setup, and the one most GadgetSphere branches use — an unknown supplier means a call to whoever owns master data. If your tenant filters the picker by branch, only suppliers linked to `GS-KV-01` appear.

Bill-to and ship-to addresses default from the supplier and from your branch. Change the ship-to if the goods are going somewhere other than the ordering branch — a common case when head office orders for a branch, or when everything routes through the fulfilment centre first.

## Step 3: Add the lines

*Purchasing > Purchase Order (Internal) > (your draft) > Lines*

Add the item, then the quantity: 200. The unit price fills itself from the pricing scheme linked to your branch or your role; override it if the price you negotiated differs. Set the tax code — 6% SST for GadgetSphere — and the line shows RM 25,600 net and RM 1,536 tax.

If your applet shows a stock-balance column, that is the current on-hand figure for the item. Use it. Ordering 200 of something you already have 400 of is the kind of mistake nobody catches until the stock ages.

**Ordering against something you already have?** Use the **KO For** tab instead of typing lines. It has sub-tabs for Blanket Purchase Order, Purchase Quotation and Purchase Requisition — pick the source document and its lines come across with quantities and prices intact, and BigLedger records the link. If your tenant allows multiple knock-off, one order line can draw from several source lines.

**Ordering the same thing for several branches?** The **Multi-PO** menu creates several orders in one pass rather than making you repeat this form.

**Ordering because stock is low?** The **PO Replenishment** menus generate orders from stock balances rather than from your memory. A replenishment run shows, per item, the company and location balances, what is reserved, what is in transit, what is already on open orders, what is in the sales-order queue, and the last 30 days of sales, then proposes a reorder quantity you approve or change. If GadgetSphere's buyers are re-keying the same accessory orders every week, this is the thing to set up.

*Watch out for:* if an item you expect is missing from the picker, it may be a GL-code item type that your applet settings deliberately keep out of purchase lines, or it may not be linked to the company on the header.

## Step 4: Set delivery and payment details

*Purchasing > Purchase Order (Internal) > (your draft) > Delivery Details, Payment*

The **Delivery Details** tab carries the delivery branch, location and the date you need the goods. Fill in the required date honestly — it is what the warehouse plans against and what you will chase the supplier on.

The **Payment** tab carries the payment terms. These default from the supplier's profile; change them here only if this order genuinely differs from your standing arrangement.

If GadgetSphere reports by segment, project or profit centre, the **Department Hdr** tab is where you tag them. These tags do not change the accounting; they change how the numbers slice in reports.

Click **SAVE**. You now have a draft with a document number. Nothing has been committed and you can still change every field.

## Step 5: Approval, if your tenant uses it

*Purchasing > Purchase Order (Internal) > (your draft) > Generic Doc Approval*

**Approvals in BigLedger are off until someone configures them, and they never block anything.** There is no approval check in the document lifecycle: an order saves and finalises identically whether an approval setting exists, does not exist, or exists with a request still pending. It is a sign-off trail you can show an auditor, not a gate that stops a purchase.

If your finance manager has created an Approval Setting for `INTERNAL_PURCHASE_ORDER` under *Settings > Approval Settings*, open the saved order, go to the **Generic Doc Approval** tab and click **Submit For Approval**. BigLedger e-mails each approver a link to a page where they Approve or Reject with remarks. When the last required level approves, the order is set to FINAL for you.

How many levels a document needs depends on **its amount**. Each level carries a minimum approval amount, and the order needs every level whose minimum it exceeds. With levels at RM 0, RM 10,000 and RM 50,000, our RM 25,600 order needs two.

There is no escalation, no reminder e-mail, and no stand-in approver. If your approver is on leave, the order waits until you call them.

Purchase orders, purchase requisitions and stock requisitions are the only document types with an approval engine at all. If you need control over other documents, control it with the finalise permission instead.

## Step 6: Finalise and send

*Purchasing > Purchase Order (Internal) > (your draft) > FINAL, then Export*

Read the lines back once, then click **FINAL**.

The order locks. Its 200 units enter the open queue. Nothing posts to the ledger and nothing moves in stock, which is correct — you have promised to buy, not bought.

Send it from the **Export** tab using whichever printable format your tenant has set up. If you need several orders at once, the listing supports bulk print with a format picker.

*Watch out for:* **CLONE** copies the whole order into a new draft — genuinely useful for repeat orders, and it runs as a background job so the new document may take a few seconds to appear.

## Step 7: Track what is outstanding

Three places tell you what is still open, and they answer different questions:

- **Purchase Order Queue** — the open-queue rows themselves: lines you have committed to and not yet received or invoiced. This is your outstanding-orders list. (It is not an approval queue, despite the name.)
- **PO Line with GRN KO** — your ordered lines matched against what has actually been received. This is where you see that 180 of the 200 arrived.
- **PO Line with PI KO** — your ordered lines matched against what has been invoiced.

When a supplier tells you the balance of an order is never coming, use **CLOSE** on the order. It sets every line's open quantity to zero and deletes the queue rows, so the order stops appearing as outstanding. CLOSE is not VOID — VOID cancels the document; CLOSE says "we are done here". Neither can be undone.

## What success looks like

Thirty seconds, three checks:

1. **The order shows as FINAL** in the listing and you cannot edit its lines.
2. **It appears in Purchase Order Queue** with 200 units outstanding. When the goods arrive, that number will fall on its own.
3. **Your stock balance has not changed.** If it has, something other than this order did it — a purchase order moves no stock, ever.

## Common mistakes

**Leaving the order in draft and telling the supplier it is placed.** A draft has no open queue. The warehouse's search for it when the goods arrive will find nothing, and the receipt will be typed in by hand with no link back to the order. Always FINAL before you send.

**Typing lines when a requisition or quotation exists.** Use KO For. It carries the link, and the link is what lets anyone later see what was asked for, what was ordered, and what arrived.

**Using VOID when you meant CLOSE.** VOID cancels an order that should never have existed. CLOSE tidies away the tail of an order that was mostly delivered. Voiding a partly received order leaves the receipt hanging.

**Expecting approval to stop anything.** Until an approval setting exists, no document requires anyone's sign-off — and even with one configured a purchase order can still be finalised by hand while a request sits pending. If unauthorised buying is the risk you are managing, take the finalise permission away from the people you do not want finalising.

**Forgetting the forex rate on a foreign-currency order.** A USD order without a rate on the day will not price correctly, and if your tenant locks the rate field you cannot fix it yourself.

## Related documentation

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — the full applet reference: every menu, setting, field, CSV column and failure mode
- [Purchase Requisition (Internal)](/applets/purchase-workflow/internal-purchase-requisition-applet/) — the document that asks for the purchase before you commit to it
- [Blanket Purchase Order](/applets/purchase-workflow/blanket-purchase-order-applet/) — the standing agreement you draw orders from
- [Supplier](/applets/master-data/supplier-applet-1/) — the supplier master this order reads from
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow/) — the whole order-to-payment run
- [Goods Received Note Processing](/user-guide/daily-tasks/goods-received-note/)
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing/)
- [Document Approvals](/guides/document-approvals/)
