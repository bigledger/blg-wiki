---
title: "Validation and clearance"
description: "What LHDN decides when you submit an e-invoice, what Valid means for a document you can no longer edit, and where the 72-hour clock actually starts."
page_type: concept
weight: 30
module: e-invoice
related_concepts: [pools-and-queues, consolidated-e-invoice]
guides:
  - /guides/einvoice-guides/einvoice-validation/
  - /guides/einvoice-guides/einvoice-cancel-and-correct/
  - /guides/einvoice-guides/einvoice-month-end/
sources:
  behaviour:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/model/erp/eInvoice/lhdn/MyEInvoiceLHDNDocumentStatus.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/toIrbReSubmission/MyEInvoiceToIrbResubmissionService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/shared/MyEInvoicePoolService.java
  cancellation_window:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/erp/eInvoice/MyEInvoiceGenDocToIrbCancellationQueueService.java
  topics:
    - kb/topics/e-invoice.md
    - kb/topics/e-invoice-cancellation-and-credit-notes.md
    - kb/topics/e-invoice-submission-errors.md
---

Malaysia runs a **clearance** model: an invoice is not a tax record because you printed it, but because LHDN looked at it and said yes. You submit the e-invoice, LHDN checks it and answers **Valid** — returning a unique identifier and a QR code — or **Invalid**, with a reason code. Until that answer arrives, nothing has been reported. Once it says Valid, nothing can be edited.

## Why it exists

The old arrangement was that you invoiced whoever you liked and the tax authority found out later, if it ever audited you. Clearance reverses that: the authority sees the document first, so the record it holds and the record you hold are the same one by construction.

For you that has one large practical consequence. The data has to be right *before* it is sent, because the correction path afterwards is narrow, time-limited, and involves paperwork the buyer can see.

## How it behaves in BigLedger

There are **two checks, not one**, and they fail in ways that look identical from a distance — "my e-invoice isn't at LHDN" — but have completely different fixes.

**BigLedger's own check comes first.** Before anything is sent, it looks for the mandatory fields: both parties' tax number, identity type and value, an address with line 1, city and state, the document's currency and dates, and the line codes. If any are missing, the document is held in a [pool](../pools-and-queues/) with the reason on the record. Nothing reached LHDN, and nothing will until you complete it.

**LHDN's check comes second.** Once a document is complete it is submitted, and it carries one of four answers from LHDN:

- **Submitted** — LHDN has it and is still deciding. Usually minutes.
- **Valid** — accepted. It now has an LHDN identifier and a QR code, and it is a filed tax record.
- **Invalid** — accepted for processing, then rejected on content, with the reason codes attached. Fix the source data and resubmit.
- **Cancelled** — a validated e-invoice that was subsequently cancelled at LHDN.

Valid is a one-way door. BigLedger refuses to resubmit over it — *"already validated with 'Valid' status. Please cancel it first before creating a new invoice."* — and it refuses at Submitted too, because LHDN has not finished. From Valid, the only corrections are a cancellation or a credit note.

{{< callout type="warning" >}}
**The 72 hours start at validation, not at invoicing.** A supplier may cancel a validated e-invoice within 72 hours of the moment LHDN validated it. BigLedger records that moment in universal time (UTC) on the e-invoice, and it can be *earlier* than the MyInvois portal appears to show. Compute the deadline from that field, never from the invoice date and never from memory.
{{< /callout >}}

## What it is not

- **Submitted is not Valid.** A month whose documents are all "Submitted" is not a month that has been reported.
- **72 hours is not a submission deadline.** There is no rule that an invoice must reach LHDN within 72 hours of being raised. It is the cancellation and buyer-rejection window, and nothing else.
- **Validation is not a check of your accounting.** LHDN validates structure, identities and codes. An e-invoice can be perfectly Valid and still be for the wrong customer or the wrong amount — which is what the cancellation and credit-note routes are for.
- **Submission History is not status.** It is a snapshot of what each submission looked like at the moment it was sent, so it will say "Submitted" forever, even for a document LHDN later rejected. The live verdict lives on *Internal Submission → To IRB E-Invoice*. Working an Invalid list from the wrong screen produces a short, reassuring list and leaves real rejections unfixed.
- **Valid does not mean the buyer has it.** Delivery of the validated document with its QR code is a separate step.

## Where you meet it

- [Validation Rules & Troubleshooting](/guides/einvoice-guides/einvoice-validation/) — why LHDN rejects a document and which of your records to fix
- [Cancelling and Correcting a Validated E-Invoice](/guides/einvoice-guides/einvoice-cancel-and-correct/) — what to do once the answer is Valid and the answer is wrong
- [The Month-End E-Invoice Cycle](/guides/einvoice-guides/einvoice-month-end/) — working the Invalid list before the 7th
- [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) — the To IRB E-Invoice, Submission History and Validation Queue screens
