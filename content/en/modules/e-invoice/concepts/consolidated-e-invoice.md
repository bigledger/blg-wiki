---
aliases:
- /modules-v2/e-invoice/concepts/consolidated-e-invoice/
title: "Consolidated e-invoices"
description: "One e-invoice that reports a whole month of counter receipts to LHDN under a single General Public buyer — what it is, why it exists, and the RM 10,000 line it cannot cross."
page_type: concept
weight: 10
module: e-invoice
related_concepts: [pools-and-queues, validation-and-clearance]
guides:
  - /guides/einvoice-guides/malaysia-e-invoice-guide/
  - /guides/einvoice-guides/einvoice-pools-and-routing/
  - /guides/einvoice-guides/einvoice-month-end/
sources:
  behaviour:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/consolidated/ConsolidatedEInvoiceHelperService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/consolidated/ConsolidatedEInvoiceProcessorByBranchService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/lhdn/lineMapping/itemMapping/ItemMappingService.java
  threshold:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/GenericDocEInvoicePostingQueueService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/pools/MyEInvoicePoolConversionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoicePoolService.java
  topics:
    - kb/topics/e-invoice-consolidation.md
    - kb/topics/e-invoice.md
---

A consolidated e-invoice is **one e-invoice that reports many small sales at once**. Rather than sending LHDN a separate e-invoice for every till receipt, you send a single document covering a whole month of them, with the buyer recorded as *General Public* instead of a named person. The individual receipts are still traceable — each one is recorded against the consolidated e-invoice that reported it — but LHDN receives a small number of documents instead of tens of thousands.

## Why it exists

Malaysian e-invoicing asks you to report every sale. It does not ask you to know who every buyer is. A shopper who buys a phone charger and walks out has not given you a tax number, an identity document or an address, and no amount of chasing afterwards will produce them.

Consolidation is LHDN's provision for exactly that gap. Sales where the buyer did not ask for their own e-invoice are reported together, once a month, under a general buyer identity — and that consolidated e-invoice must be validated by LHDN **by the 7th of the following month**.

The scale is the point. GadgetSphere Sdn Bhd's 22 branches ring up roughly 38,000 receipts a month. Reported individually, that is 38,000 e-invoices, 38,000 buyer identities to collect and 38,000 chances to get one wrong. Consolidated, it is a small set of documents that a person can actually check before the 7th.

## How it behaves in BigLedger

Nothing is consolidated at the moment of sale. A finalised receipt that is eligible for consolidation goes into the [Batch Pool](../pools-and-queues/) and waits there. After the month closes, a background job groups the pool rows and builds the consolidated e-invoices, then submits them.

What BigLedger puts on one is fixed, and you cannot type over it:

- The buyer is **General Public**, with the general public tax number `EI00000000010` and every identity and address field set to "NA".
- Every line carries item classification code **`004`**, which LHDN reserves for consolidated e-invoices. The same code on an ordinary individual e-invoice is always rejected.
- Each receipt inside it is linked back to it, so you can always answer "which e-invoice reported this sale?"

Two hard boundaries decide what may *not* go inside one:

- **RM 10,000, inclusive.** A sale of RM 10,000 or more must be reported individually, with the buyer's real identity. A sales invoice or cash bill of that size is diverted away from the Batch Pool automatically, and a manual attempt to move one in is refused with *"Cannot move transaction with amount more than or equal to 10000."*
- **Foreign buyers.** A consolidated e-invoice cannot carry one. A customer paying on a passport is keyed with identity type Passport and their sale goes out on its own.

## What it is not

- **Not a summary or a report.** It is a tax document in its own right, validated by LHDN like any other, and subject to the same rules once it is [Valid](../validation-and-clearance/).
- **Not a way to avoid reporting a big sale.** The RM 10,000 line is a reporting rule, not a target. Splitting a sale to duck under it is not a workaround.
- **Not the same thing as "submitted in a batch".** The Batch Pool is where receipts *wait*; the consolidated e-invoice is what is eventually *built* from them. A receipt sitting in the pool has not reached LHDN.
- **Not final for a buyer who changes their mind.** Up until the consolidation runs, a receipt can be pulled out and reported individually with the buyer's real details. Afterwards it is inside a validated tax document and the only routes are cancellation or a credit note.

## Where you meet it

- [What Malaysia Requires](/guides/einvoice-guides/malaysia-e-invoice-guide/) — where consolidation sits in the LHDN scheme
- [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/) — how a document is sorted into the Batch Pool, and how to get it out again
- [The Month-End E-Invoice Cycle](/guides/einvoice-guides/einvoice-month-end/) — the 1st-to-7th routine that gets last month's consolidated e-invoices validated
- [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) — the Batch Pool, Consolidate and Consolidated Submission screens, field by field
