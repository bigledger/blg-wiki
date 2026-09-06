---
title: "Standard Procurement Workflow"
description: "Order from a supplier, receive the goods, book the bill and pay it — the full purchase order to payment run in BigLedger, with the one thing everybody gets wrong about when stock actually moves."
tags:
- user-guide
- purchasing
- procurement
weight: 10
sources:
  - /applets/purchase-workflow/internal-purchase-order-applet/
  - /applets/purchase-workflow/internal-purchase-grn-applet/
  - /applets/purchase-workflow/internal-purchase-grn-stock-in-applet/
  - /applets/finance/internal-purchase-invoice-applet/
  - /applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/
  - /applets/finance/internal-payment-voucher-applet/
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
  - kb/topics/document-approval.md
---

You are the person who buys stock for a retail group, or the accounts-payable clerk who pays for it, and you want one order to travel cleanly from "we need 200 more of these" to "the supplier is paid and the ledger balances". By the end of this guide you will have raised a purchase order, received the goods against it, booked the supplier's bill on top of the receipt, and settled it — and you will know exactly which of those four documents moves your stock and posts to your accounts. Set aside about 30 minutes for your first run through; after that each document takes a couple of minutes.

There is one fact in this guide that trips up nearly everyone who comes from another system, so here it is up front: **in the standard BigLedger flow the goods received note does not move your stock.** The purchase invoice does. Everything below is built around that.

## Meet GadgetSphere

GadgetSphere Sdn Bhd sells consumer electronics from 22 branches across Klang Valley, Penang, Johor Bahru, Kota Kinabalu and Kuching. Buying is centralised: head office raises the purchase orders, the branch or the fulfilment centre receives the goods, and accounts payable in head office books the bills. Roughly 2,100 supplier invoices a month come through this flow from authorised distributors and accessory wholesalers.

The order we will follow is a straightforward one: 200 units of a mid-range wireless earbud model at RM 128 each from an accessory wholesaler, delivered to branch `GS-KV-01`, on 30-day terms. RM 25,600 before tax.

## Four documents, and what each one actually does

BigLedger gives each document type a **quantity signum** and an **amount signum** — a plus one, a minus one or a zero that tells the engine whether finalising the document should move stock and whether it should post to the General Ledger. You never see these numbers on screen, but they decide everything, so it is worth knowing them for the four documents you are about to create:

| Document | Moves stock? | Posts to the ledger? | What it is really for |
|---|---|---|---|
| **Purchase Order** | No | No | Your commitment to buy. Finalising it puts its lines into an open queue so later documents can pull them in. |
| **Purchase GRN** | **No** | **No** | The record that goods physically arrived and were counted. It knocks the order down and queues itself for the invoice. |
| **Purchase Invoice** | **Yes, stock in** | **Yes** | The supplier's bill. This is the document that books the stock and creates the money you owe. |
| **Payment Voucher** | No | Yes | The money leaving your bank. |

Three more terms you will meet:

- **Knock off** — pulling a finished document's lines into the next document, so BigLedger knows the 200 units on the invoice are the same 200 units on the order. The tab is literally called *KO For*. Once a source document is fully knocked off it stops appearing in the picker.
- **FINAL** — the button that commits a document. Before FINAL a document is a draft you can edit freely and it has done nothing at all. After FINAL it is locked, and whatever posting it was going to do has happened. There is no un-FINAL; the reverse of FINAL is **VOID**.
- **The open queue** — the list of "still outstanding" lines that FINAL creates. An order that has been half received still has half its quantity sitting in the queue. This is what makes partial deliveries work without any special handling.

{{< callout type="warning" >}}
**Do not mix the two receipt paths.** BigLedger supports two ways to get goods from the loading bay into your stock ledger, and they are not interchangeable:

- **Purchase GRN → Purchase Invoice.** The GRN posts nothing; the invoice books the stock and the liability together. This is the path this guide follows and the one most tenants use.
- **Purchase GRN Stock In → Purchase Invoice No Stock In.** The GRN books the stock the moment goods land (Dr Inventory Not Invoiced / Cr Creditor Not Invoiced), and the invoice later books only the money. Choose this if you need stock available for sale before the bill arrives.

Crossing the streams — a *GRN Stock In* followed by a full *Purchase Invoice*, or a plain *GRN* followed by a *Purchase Invoice No Stock In* — either counts your stock twice or never counts it at all. Pick one pair per company and stay in it.
{{< /callout >}}

## Before you start

- **The supplier exists** as an entity, with the AR/AP type set. Finalising the invoice fails without it — see the last section for the exact error.
- **The items exist** in Doc Item Maintenance, with the unit of measure you buy in.
- **Your company's default GL codes are linked** — at minimum `PURCHASE`, `INPUT_TAX` and the creditor account for your supplier's AR/AP type. This is the single most common reason a first purchase invoice refuses to finalise.
- **Tax codes are configured** if you are SST-registered. GadgetSphere is, at 6%.
- **The fiscal period you are posting into is open.** A locked month rejects the invoice at FINAL.
- **You have create and finalise permission** on `INTERNAL_PURCHASE_ORDER`, `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` and `INTERNAL_PURCHASE_INVOICE`. In a normal setup these are three different people.
- **Optionally, approval settings on the purchase order.** Skip this on your first run; it is covered in Step 2.

## Step 1: Raise the purchase order

*Purchasing > Purchase Order (Internal) > Purchase Order > Create*

Open the Purchase Order (Internal) applet and click Create. The form opens on the **Main Details** tab with the branch and location pre-filled from your defaults; set them if they are blank — `GS-KV-01` for our order, since that branch is taking delivery. Set the transaction date and, if you use it, the reference number your buyers recognise.

Move to the **Account** tab and pick the supplier. If your buyers are allowed to create suppliers on the fly the picker offers an inline create; most GadgetSphere branches have that switched off deliberately, so an unknown supplier means a call to master data first.

On the **Lines** tab, add the item and enter 200 as the quantity. The unit price fills itself from whichever pricing scheme is linked to the branch or to your role; override it to RM 128 if the negotiated price differs from the scheme. Watch the tax column — with a 6% SST code the line shows RM 25,600 net and RM 1,536 tax.

If you are buying against a requisition, a supplier quotation or a blanket order rather than from scratch, use the **KO For** tab instead of typing lines: pick the source document and its lines come across with their quantities and prices intact.

Click **SAVE**. You now have a draft with a document number. Nothing has been committed, nothing has been sent, and you can still change every field.

*Watch out for:* if the item picker shows nothing, the item may be a GL-code item type that your applet settings deliberately exclude from purchase lines, or it may not be linked to the company you selected.

## Step 2: Get the order approved — only if you have set approvals up

*Purchasing > Purchase Order (Internal) > (open the order) > Generic Doc Approval tab*

This step is optional, and on a new tenant it does nothing, because **approvals in BigLedger are off until someone configures them**. There is no approval check anywhere in the document lifecycle: a purchase order saves and finalises exactly the same whether an approval setting exists, does not exist, or exists with a request still sitting unanswered. It is a sign-off trail, not a gate.

If your finance manager has created an Approval Setting for `INTERNAL_PURCHASE_ORDER` under *Settings > Approval Settings*, then open the saved order, go to the **Generic Doc Approval** tab, and click **Submit For Approval**. BigLedger e-mails each approver a link to a page where they Approve or Reject with remarks. When the last required level approves, the order is set to FINAL for you.

Two things worth knowing before you rely on it:

- The number of approval levels a document needs is decided by **its amount**. Each level carries a minimum approval amount, and a document needs every level whose minimum it exceeds. With levels set at RM 0, RM 10,000 and RM 50,000, our RM 25,600 order needs two approvals; a RM 500 order needs one.
- There is no escalation, no reminder e-mail, and no delegation or stand-in approver. If your approver is on leave, the order sits. Chase them directly.

Purchase orders, purchase requisitions and stock requisitions are the only document types with an approval engine at all. There is none for GRNs, purchase invoices, payment vouchers, sales documents, journals or stock adjustments — for those, your control is who holds the finalise permission.

## Step 3: Finalise and send the order

*Purchasing > Purchase Order (Internal) > (open the order) > FINAL*

Click **FINAL**. The order locks — you can no longer change the lines — and its 200 units enter the open queue, ready for the warehouse and for accounts payable to pull from.

Nothing has posted. Your stock balance has not moved and your ledger has not changed, and that is correct: a purchase order is a promise, not a transaction.

Send the order to your supplier from the **Export** tab, using whichever printable format your tenant has set up.

If you need to see what is still outstanding across all your orders, the **Purchase Order Queue** menu lists the open-queue rows — the lines you have committed to but not yet received. (It is not an approval queue, despite the name.) The **PO Line with GRN KO** and **PO Line with PI KO** reports show the same lines matched against what has actually been received and invoiced.

*Watch out for:* **CLOSE** and **VOID** are different things. CLOSE sets every line's open quantity to zero and deletes the queue rows — use it when a supplier tells you the balance of an order is never coming and you want it out of your outstanding list. VOID cancels the document. Neither can be undone.

## Step 4: Receive the goods

*Purchasing > Purchase GRN (Internal) > Internal Purchase GRN > Create*

The delivery arrives at `GS-KV-01`. Count it before you touch BigLedger — the GRN should record what is actually on the floor, not what the delivery note claims.

Open the Purchase GRN (Internal) applet and click Create. Set the branch and location. There are three ways to bring in the order:

- **Search Document** (on a saved draft) → *Search Purchase Order*, which finds the finalised order and lets you add all its lines at once.
- **KO For** tab on a new document → *Purchase Order*, which knocks off the order's lines.
- **Import** tab, which shows a grid of active purchase orders and their lines to pick from.

All three arrive at the same place: the **Lines** tab, showing the ordered quantity from the open queue alongside a received quantity you fill in.

**If everything arrived**, leave the quantities as they came across. **If only 180 of the 200 arrived**, change the received quantity to 180 — the remaining 20 stay in the open queue and a second GRN later will pick them up. **If 10 arrived damaged**, receive 170, not 180, and raise the shortfall with the supplier; goods you do not want to pay for should never enter a GRN.

For serialised items — phones, laptops, anything with an IMEI or a serial — open the line and enter or scan the serial numbers. The count must equal the line quantity. If your applet has serial validation on FINAL switched on, BigLedger re-checks this and refuses to finalise on a duplicate.

Record the supplier's delivery note number in the header reference field so you can find this receipt from their paperwork later, and attach a scan of the delivery note on the **Attachments** tab.

Click **SAVE**, then **FINAL**.

**What FINAL does here — and does not.** It locks the GRN, closes off the ordered quantity against the purchase order, and creates the open-queue rows the purchase invoice will consume. It writes **no inventory transaction and no journal entry**. Your stock balance at `GS-KV-01` is unchanged.

You can see the receipt in Stock Availability, where the finalised-but-not-yet-invoiced quantity is reported separately as *GRN quantity*, and a saved draft appears as *GRN draft quantity*. That is the visibility the GRN gives you: the goods are here, they are counted, they are not yet stock.

*Watch out for:* there is no File Import in this applet and no approval menu — a GRN cannot be approved and cannot be bulk-uploaded. Also, VOID on a GRN does not check whether an invoice has already knocked it off. Open the **Doc Link** tab and look before you void anything.

## Step 5: Book the supplier's invoice

*Finance > Purchase Invoice (Internal) > Internal Purchase Invoice > Create*

This is the step that does the work.

Open the Purchase Invoice (Internal) applet and click Create. Set the branch and location — these two are the only unconditionally required header fields — then the transaction date (the date on the supplier's invoice, not today) and the supplier's own invoice number in the reference field. Your credit terms drive the due date.

On the **Account** tab, pick the supplier. Their AR/AP type decides which creditor account this invoice will credit, so a supplier set up with the wrong type posts to the wrong place silently.

On the **KO For** tab, choose *Purchase GRN* and pick the receipt you finalised in Step 4. Only finalised, not-fully-knocked-off documents are listed. The lines come across with the received quantities. If your supplier billed you for a different quantity or a different price than you received, this is where you find out — and this is the moment to stop and query it, not after FINAL.

For our order, the invoice should show 200 units at RM 128, RM 25,600 net, RM 1,536 SST, RM 27,136 total. If the supplier has billed RM 132 a unit, the invoice line will show it and your total will not match the order. Do not "just post it" — a purchase invoice is far harder to correct than a draft is to abandon.

Check the **Line Items** tab once more, then click **FINAL**.

**What FINAL does here.** BigLedger posts, in one pass:

```
Dr  Purchase (or the item's GL code)   RM 25,600
Dr  Input Tax                          RM  1,536
    Cr  Creditor — the supplier                RM 27,136
```

and books 200 units into stock at `GS-KV-01`, creating the serial number records and updating the item's last purchase cost to RM 128.

Which GL code the purchase line lands in is decided in this order: a GL code on the line, then a GL code on the document header, then the item's own company GL link for purchases, then the company's default `PURCHASE` code. Tax lines always use the company default `INPUT_TAX`.

Open the **Posting** tab to confirm. It shows five statuses — Journal, Inventory, Membership Points, Cashbook, Tax — and the **TraceDocument** tab shows the actual journal and inventory rows that were created. If Journal and Inventory both show as posted, you are done.

*Watch out for the three errors that stop a first invoice:*

- **`MISSING_DEFAULT_GL_CODE: <code>`** — the company has no default GL code linked for the code named in the message, most often `PURCHASE`, `INPUT_TAX`, or the creditor account for this supplier's AR/AP type. Fix it in the company's GL defaults; the invoice will then finalise unchanged.
- **`FISCAL_PERIOD_LOCKED`** — your transaction date falls in a month that has been closed. Change the date or ask your finance manager to reopen the period.
- **"Generic Document has already been posted to FINAL"** — someone finalised it already. Reload the listing before you assume it failed.

## Step 6: Pay the supplier

You have two routes, and which one you use depends on whether you are settling one invoice or several.

**One invoice, paid in full or in part.** Open the invoice, go to its **Payment** tab, and record the settlement there. The methods on offer are the ones assigned to your branch in Branch Settings. If you are offsetting against a deposit you had already paid the supplier, or against a credit note, use the **Contra** tab instead.

**Several invoices in one payment.** Use the Payment Voucher (Internal) applet:

*Finance > Payment Voucher (Internal) > Internal Payment Voucher > Create*

Set the payee to the supplier, add one payment line for the money actually leaving your bank (cheque, transfer, cash, card), and use the voucher's contra to link the purchase invoices you are settling. Click **FINAL**. BigLedger posts the creditor journal and writes **one cashbook transaction per payment line** — and those cashbook lines are exactly what you will later tick off against your bank statement in Bank Reconciliation. One payment line per real bank movement keeps that reconciliation clean; a single line covering three separate transfers will not match anything.

## What success looks like

Thirty seconds, four checks:

1. **Open the purchase order.** Its lines should show no remaining open quantity — the GRN and the invoice have consumed it. If you receive in stages, the balance you have not received yet is what should be left.
2. **Open Stock Availability for the item at `GS-KV-01`.** The 200 units are in the on-hand balance, and the *GRN quantity* figure has dropped back — the receipt is no longer waiting to be invoiced.
3. **Open the invoice's Posting tab.** Journal and Inventory both posted. TraceDocument shows the journal rows.
4. **Open the supplier's account.** If you have paid, the invoice is settled and the outstanding balance is nil. If you have not, it sits in payables with the due date your credit terms produced.

If all four are true, the order is complete and your accounts, your stock and your supplier's ledger agree.

## Common mistakes

**Expecting the GRN to move stock.** It does not, and no setting on the GRN applet makes it. If your stock has to move on receipt, you need the *Purchase GRN Stock In* applet and its partner *Purchase Invoice No Stock In* — a different pair of documents, chosen once for the company. Symptom: goods have been received for days and Stock Availability still shows nothing on hand.

**Mixing the two receipt paths.** A *GRN Stock In* followed by a normal *Purchase Invoice* books the same goods into stock twice. A plain *GRN* followed by a *Purchase Invoice No Stock In* never books them at all. Both are silent — nothing warns you. Symptom: stock balances that drift steadily up or steadily down against physical counts.

**Receiving damaged goods into the GRN "to sort out later".** You will pay for them. Receive only the quantity you are willing to be billed for; leave the rest in the open queue and let the supplier send a replacement or a credit note.

**Finalising the invoice before checking the price.** FINAL posts the ledger and the stock and cannot be undone — the only routes back are VOID (blocked once a purchase return is linked, and blocked entirely once the company is live on e-Invoice) or a purchase credit note. A price query costs five minutes before FINAL and half a day after it.

**Assuming the approval workflow is stopping anything.** It is not. Until someone creates an approval setting, no document in BigLedger requires anyone's sign-off, and even with one configured a purchase order can still be finalised by hand while a request sits pending. If unauthorised purchasing is the risk you are managing, control it with the finalise permission, not with the approval tab.

**Voiding a GRN without checking Doc Link.** The applet does not check whether an invoice has already consumed it. Look first.

## Related documentation

**The applets behind each step (full reference, every field and setting):**

- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/)
- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) and [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/)
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) and [Purchase Invoice No Stock In (Internal)](/applets/purchase-workflow/internal-purchase-invoice-no-stock-in-applet/)
- [Payment Voucher (Internal)](/applets/finance/internal-payment-voucher-applet/)

**Related guides:**

- [Document Approvals](/guides/document-approvals/) — what approval actually means in BigLedger, and where it exists
- [Direct GRN Workflow](/guides/purchasing-guides/direct-grn-workflow/) — receiving without a purchase order
- [Direct Invoice Workflow](/guides/purchasing-guides/direct-invoice-workflow/) — services and expenses with no goods to receive
- [Bank Reconciliation Guide](/guides/accounting-guides/bank-reconciliation-guide/) — matching the payments you made here against your statement
