---
title: "Goods Received Note Processing"
description: "Receive a delivery against a purchase order, count it honestly, capture serial and batch details, and finalise the GRN — including what finalising does and does not do to your stock."
tags:
- user-guide
- purchasing
- receiving
weight: 12
sources:
  - /applets/purchase-workflow/internal-purchase-grn-applet/
  - /applets/purchase-workflow/internal-purchase-grn-stock-in-applet/
  - /applets/purchase-workflow/internal-purchase-order-applet/
  - /applets/finance/internal-purchase-invoice-applet/
  - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/ServerDocTypes.java
---

You are on the receiving bay when a supplier's van pulls in, and by the end of this page you will have turned that delivery into a finalised Goods Received Note that closes off the right quantity on the purchase order and queues itself for accounts payable. A straightforward receipt takes about five minutes in BigLedger once the counting is done; a delivery of serialised goods takes as long as it takes to scan them.

Before anything else, one fact that decides how you read the rest of this page: **finalising a standard GRN does not add anything to your stock balance.** It records that goods arrived and were counted. The purchase invoice is what books them into stock and creates the money you owe. This surprises people who have come from other systems, and it is the single most common cause of "the goods are here, why does BigLedger say we have none?".

## Meet GadgetSphere

GadgetSphere Sdn Bhd runs 22 consumer-electronics branches. Head office raises the purchase orders; the branches and the fulfilment centre receive against them. Today's delivery at branch `GS-KV-01` is against a purchase order for 200 units of a mid-range wireless earbud at RM 128, and a second line of 40 flagship smartphones which are serialised. The van has brought all 200 earbuds and 38 of the 40 phones.

## What the GRN is for

If it does not move stock, what is it doing? Three things:

- **It records the count.** What actually came off the van, at which branch and location, on which date, against whose delivery note — with serial, batch and bin detail where the item needs it.
- **It knocks the purchase order down.** The 200 earbuds stop being outstanding. The 2 undelivered phones stay in the open queue for a later delivery.
- **It queues itself for the invoice.** Accounts payable will pull this GRN into a purchase invoice rather than retyping it, which is what makes the quantities on the bill match the quantities on the bay.

Between finalising the GRN and finalising the invoice, the received quantity is visible in Stock Availability as *GRN quantity* — goods that are here but not yet stock and not yet a liability. That gap is the point of the document.

{{< callout type="info" >}}
**If your business needs stock available the moment goods land**, you want the separate **Purchase GRN Stock In (Internal)** applet, not this one. That document does book stock on receipt (Dr Inventory Not Invoiced / Cr Creditor Not Invoiced) and is paired with *Purchase Invoice No Stock In* for the money. Your company uses one pair or the other — never a document from each, which double-counts or never counts. Check with your finance manager which pair your tenant is set up for before you start receiving.
{{< /callout >}}

## Before you start

- **The purchase order is finalised.** A draft order has no open queue, so its lines will not appear when you search for it. If the order you expect is missing from the picker, that is almost always why.
- **You know your branch and location codes** — `GS-KV-01` and the receiving location within it.
- **You have counted the delivery.** Count before you open BigLedger, not while typing.
- **You have the supplier's delivery note** with its number, and a scan or photo of it to attach.
- **A scanner, if the delivery is serialised.** Manual typing works, but 38 IMEIs is a long afternoon.
- **You hold create and finalise permission** on the GRN document type.

## Step 1: Open the applet and start the receipt

*Purchasing > Purchase GRN (Internal) > Internal Purchase GRN > Create*

The listing you land on is filtered to a default posting status and a default transaction-date window, which is why a GRN someone raised last month may not appear until you widen the filter or use **Advanced Search**. The quick search box looks at the document number.

Click Create. On the **Main Details** tab set the branch and location — `GS-KV-01` and its receiving location — and the transaction date. Use the date the goods actually arrived, not the date you are typing; that date is what the purchase order, the invoice matching and every report will use.

Put the supplier's delivery note number in the header reference field. In six weeks, when the supplier queries an invoice, this is how you will find the receipt from their paperwork.

On the **Account** tab, pick the supplier. If you bring the purchase order in first (next step), this fills itself.

## Step 2: Pull in the purchase order

*Purchasing > Purchase GRN (Internal) > (your draft) > Search Document > Search Purchase Order*

Never type the lines by hand when a purchase order exists. Bringing the order in is what links the two documents, and without that link the order stays open forever and accounts payable has nothing to match against.

There are three ways in, and they all end in the same place:

- **Search Document → Search Purchase Order** on a saved draft. Finds the finalised order and offers *add all to purchase GRN*.
- **KO For** tab on a new document → *Purchase Order*. Knocks the order's lines off directly.
- **Import** tab. Shows a grid of active purchase orders and their lines to pick from.

Use whichever your applet has enabled — some tenants hide the KO For tab, some hide the search button. If one is missing, another will be there.

The lines arrive on the **Lines** tab, carrying the ordered quantity from the open queue alongside the quantity you are about to receive.

*Watch out for:* if the order is not in the list, check three things in order — is it finalised, is it for this supplier, and has it already been fully received by someone else? A fully knocked-off order disappears from the picker by design.

## Step 3: Enter what actually arrived

*Purchasing > Purchase GRN (Internal) > (your draft) > Lines*

This is the step that matters. Change the received quantity on each line to the number you counted on the bay.

**Everything arrived.** Leave the quantities as they came across. Earbuds: 200 ordered, 200 received.

**Short delivery.** Enter what came. Phones: 200 ordered on the order, 38 received. The remaining 2 stay in the purchase order's open queue and a later GRN will pick them up — you do not need to do anything special, and you must not "fix" the order.

**Damaged goods.** Receive only the good ones. If 5 of the earbuds are crushed, receive 195, not 200. Anything you enter here is a quantity you are telling accounts payable to expect a bill for. Photograph the damage, note it, and take it up with the supplier — a replacement delivery becomes another GRN against the same order, and a credit is a purchase credit note.

**More arrived than you ordered.** BigLedger will let you receive the excess. Whether you should is a business decision, not a system one — there is no over-delivery block and no approval routing to catch it. If you accept it, expect the invoice to bill for it.

**Wrong item entirely.** Do not receive it. Leave it off the GRN, keep it separate from your stock, and get it back on the van.

The **Standard View** grid is the default; some tenants enable a **Spreadsheet View** for faster keying on large deliveries. If your applet shows a stock-balance column, that is the current on-hand figure for the item — a useful sanity check, and a reminder that it will not change when you finalise.

## Step 4: Capture serial numbers

*Purchasing > Purchase GRN (Internal) > (your draft) > Lines > (open the line)*

For serialised items — phones, laptops, anything with an IMEI or a serial plate — open the line and enter one serial per unit. **The count must equal the line quantity**: 38 phones means 38 serials.

Scan them if you can. Place the cursor in the serial field and let the scanner do the typing; it is faster and it does not transpose digits. Where you have no scanner, type them, and check the first few characters of each against the label rather than trusting your fingers at unit 30.

If your applet has serial validation on FINAL switched on, BigLedger re-checks the serial and batch quantities when you finalise and refuses any line it flags as a duplicate serial number. That check catches the two classic errors — the same unit scanned twice, and a unit that is already recorded elsewhere in the company.

Batch-tracked items work the same way on the same line, with batch number and the dates the item type requires.

If your warehouse uses bins, assign the bin quantities on the line too. The backend validates that the bin quantities add up to the line quantity when you finalise.

## Step 5: Attach the paperwork

*Purchasing > Purchase GRN (Internal) > (your draft) > Attachments*

Attach a scan or photo of the supplier's delivery note, the packing list if it is separate, and photographs of any damage. Do it now, on the bay, while the evidence exists. A GRN with the delivery note attached settles a supplier dispute in one click; one without it costs an afternoon.

If your tenant uses custom statuses, the **Status** tab is where you set them — those are your own workflow labels (for example "awaiting QC"), and they stay editable even after the document is finalised.

## Step 6: Save, check, and finalise

*Purchasing > Purchase GRN (Internal) > (your draft) > SAVE, then FINAL*

Click **SAVE** first and read the lines back once. Compare the received quantities against your count sheet. A draft can be edited freely or **DISCARD**ed; a finalised GRN can only be voided.

Then click **FINAL**.

**What FINAL does.** It validates the serial numbers, the bin quantities and the fiscal period, stamps the transaction date, locks the document, and creates one open-queue row per line so the purchase invoice can knock it off.

**What FINAL does not do.** It writes no inventory transaction and no journal entry. Your stock balance is unchanged and your ledger is untouched. The receipt shows up in Stock Availability as *GRN quantity* until the invoice consumes it.

If your applet is set to pop the PDF open after FINAL, the printable copy appears automatically; otherwise print from the **Export** tab.

*Watch out for:* FINAL needs at least one line. A zero-**amount** GRN is fine — receiving goods you have not been priced for is normal — but a GRN with no lines is not a document.

## What success looks like

Thirty seconds, three checks:

1. **Open the purchase order.** The received quantity has come off its open balance. For our delivery, the earbud line is closed and the phone line still shows 2 outstanding.
2. **Open Stock Availability for the item.** On-hand is unchanged — correct. The *GRN quantity* figure has gone up by what you received. That is the receipt sitting between the bay and the ledger, waiting for the invoice.
3. **Open the GRN's Doc Link tab.** The purchase order is linked. If it is not, the invoice will not find this receipt and someone in accounts payable will retype it.

## Common mistakes

**Waiting for the stock balance to move.** It will not, on this document. If your company needs stock on receipt, you are in the wrong applet — you want *Purchase GRN Stock In (Internal)*. Symptom: goods received days ago, Stock Availability still showing nothing on hand, and a growing suspicion that something is broken. Nothing is broken.

**Typing the lines instead of pulling in the order.** The GRN saves happily either way, and looks identical. But with no link the purchase order stays open forever, the invoice cannot knock the receipt off, and the same goods can be received twice. Always come in through Search Document, KO For or Import.

**Receiving damaged or wrong goods "to sort out later".** You have just told accounts payable to expect a bill for them. Receive only what you are willing to pay for.

**Serial counts that do not match the quantity.** Finalising will refuse, or worse, will let a mismatch through if validation is off — and then the units are untraceable for warranty. Count the serials against the line quantity before you finalise, every time.

**Backdating a GRN into a closed period.** The fiscal period check runs at FINAL, not at SAVE, so you find out at the last moment. If the month has been locked, either date the receipt into an open period or ask your finance manager to reopen it — do not invent a date that makes the error go away.

**Voiding a GRN without checking Doc Link.** The applet does not check whether an invoice has already consumed the receipt before it lets you void. Open Doc Link, look, then decide.

## Related documentation

- [Purchase GRN (Internal)](/applets/purchase-workflow/internal-purchase-grn-applet/) — the full applet reference: every menu, setting, field and failure mode
- [Purchase GRN Stock In (Internal)](/applets/purchase-workflow/internal-purchase-grn-stock-in-applet/) — the alternative that does book stock on receipt
- [Purchase Order (Internal)](/applets/purchase-workflow/internal-purchase-order-applet/) — the document you are receiving against
- [Purchase Invoice (Internal)](/applets/finance/internal-purchase-invoice-applet/) — the document that turns your receipt into stock and a liability
- [Standard Procurement Workflow](/guides/purchasing-guides/standard-procurement-workflow/) — the whole order-to-payment run this page sits inside
- [Creating a Purchase Order](/user-guide/daily-tasks/creating-purchase-order/)
- [Purchase Invoice Processing](/user-guide/daily-tasks/purchase-invoice-processing/)
