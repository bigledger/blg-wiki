---
title: "Pools and queues"
description: "A pool holds a document that cannot be sent to LHDN yet; a queue holds one that can and is waiting its turn. Knowing which is which tells you whether to wait or to act."
page_type: concept
weight: 20
module: e-invoice
related_concepts: [consolidated-e-invoice, validation-and-clearance]
guides:
  - /guides/einvoice-guides/einvoice-pools-and-routing/
  - /guides/einvoice-guides/einvoice-month-end/
  - /guides/einvoice-guides/einvoice-validation/
sources:
  behaviour:
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/eInvoice/enums/BatchPoolToIRBEnum.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoicePoolService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/GenericDocEInvoicePostingQueueService.java
  retries:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/EInvoiceToIRBSubmissionQueueProcessorService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/toIrbReSubmission/MyEInvoiceToIrbResubmissionService.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/erp/eInvoice/bl_fi_my_einvoice_gen_doc_to_irb_submission_queue.java
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/jobProcessor/eInvoice/EInvoiceFailedSubmissionProcessor.java
  topics:
    - kb/topics/e-invoice.md
    - kb/topics/e-invoice-submission-errors.md
---

Between finalising a sales document and LHDN accepting it, that document sits in one of two very different kinds of waiting room. A **queue** holds a document that is complete and on its way — it will be sent, you only have to wait. A **pool** holds a document that is *not* complete and cannot be sent at all — it will sit there until a person does something about it. Telling the two apart is the difference between waiting patiently and losing a month of sales.

## Why it exists

LHDN rejects an incomplete e-invoice. If a receipt has no buyer tax number, no identity type or no usable address, sending it achieves nothing except a rejection.

BigLedger could have refused to finalise the sale, or thrown the e-invoice away and hoped somebody noticed. Instead it parks the document: the sale completes, the accounting is correct, and the unreported e-invoice is put somewhere with the reason attached. Pools are that somewhere. They are not an error state — for the bulk of retail they are the *normal* state, because a walk-in shopper genuinely has no tax number to record.

## How it behaves in BigLedger

There are exactly **three pools**, and what separates them is what happens if you never touch them:

| Pool | Holds | If you do nothing |
|---|---|---|
| **Batch Pool** | Receipts that will be reported inside a [consolidated e-invoice](../consolidated-e-invoice/) | Swept into next month's consolidation. Nothing to do |
| **Individual Pool** | Documents meant to go to LHDN on their own, with something mandatory missing | **Nothing.** It waits for you, indefinitely |
| **Single General Pool** | Documents given one individual attempt before falling back to consolidation | **Nothing.** Same as above |

Only the Batch Pool empties itself. The other two are lists of sales you have not reported, and they grow quietly: there is no ageing alert anywhere in e-invoicing, so nothing tells you a document has been sitting there since March.

The queues behind them are ordinary background plumbing: a posting queue that makes the routing decision, a submission queue that sends documents to LHDN one at a time, a consolidated submission queue for the monthly documents, and a validation queue that polls LHDN for the verdict. A row in a queue is genuinely in transit — a large month-end batch takes hours, not minutes, because submission is serial.

{{< callout type="warning" >}}
**Nothing retries itself.** A submission that failed shows a "retries remaining" figure, and that figure never moves: it is written once when the row is created and nothing in the system reads it or counts it down. A row that has not moved since yesterday is not being retried — it is waiting for a human.
{{< /callout >}}

## What it is not

- **A pool is not a queue.** A queued document is on its way; a pooled document is not going anywhere.
- **`IN_QUEUE` is not "in a pool", and it is not an error.** It means BigLedger has the document and has not sent it yet. The right response is usually to wait, then look again the next morning.
- **"Processed" on a Batch Pool row does not mean "submitted".** It means the row is no longer waiting for the consolidation — which, if it was also marked failed, means it is stranded rather than finished. This is the single most expensive misreading in e-invoicing.
- **A pool is not a list of mistakes.** A Batch Pool full of receipts is a healthy retailer. An Individual Pool full of receipts is unreported revenue.

## Where you meet it

- [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/) — which pool a document lands in and why, and every action you can take on it
- [The Month-End E-Invoice Cycle](/guides/einvoice-guides/einvoice-month-end/) — clearing the pools before the consolidation runs
- [Validation Rules & Troubleshooting](/guides/einvoice-guides/einvoice-validation/) — reading the Validation Error panel on a pooled document
- [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) — every pool and queue screen, field by field
