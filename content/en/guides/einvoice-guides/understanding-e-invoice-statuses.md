---
title: Understanding E-Invoice Statuses
description: Read every e-invoice status with confidence, match BigLedger's wording to the MyInvois portal, handle a rejection calmly, and know exactly when to call for help.
tags:
- user-guide
- e-invoice
- compliance
- troubleshooting
weight: 20
---

You have just submitted a batch of invoices to LHDN (Lembaga Hasil Dalam Negeri, the Inland Revenue Board) and the status column is showing a mix of words — some of which do not match what you see when you log in to the MyInvois portal. By the end of this guide you will be able to read every status BigLedger shows, translate it to the MyInvois portal's wording, recognise the normal rhythm of a rejection and resubmission, and spot the small number of situations that genuinely need support's attention. Reading it takes about 10 minutes; it will save you hours of second-guessing.

## Meet GadgetSphere

GadgetSphere Sdn Bhd runs 22 consumer-electronics branches and issues thousands of sales invoices a month. Since e-invoicing went live, every finalised invoice also travels to LHDN for validation. On a typical morning the accounts team sees hundreds of documents flow through the My E-Invoice Admin Applet — most validate within minutes, a handful bounce back with a validation error, and once in a while one seems to sit still. This guide is the map the team uses to tell the three situations apart.

## Concepts you will use

- **Validation** — LHDN checks each e-invoice against its rules (TIN present, mandatory fields filled, formats correct) and answers with an outcome. Only a validated e-invoice is compliant.
- **Submission attempt** — each time an invoice is sent to LHDN, that attempt is recorded separately in the submission history. One invoice can have more than one attempt (for example, a rejected first attempt followed by a successful resubmission). The history keeps *all* of them — that is a feature, not a fault.
- **Asynchronous processing** — BigLedger sends your document to LHDN and LHDN answers a little later. BigLedger checks for the answer in the background, so a short wait in "Pending" is completely normal.

## The statuses BigLedger shows you

You will see these in the My E-Invoice Admin Applet (Master List and Internal Submission tabs):

| Status in BigLedger | What it means | What you should do |
|---|---|---|
| **Pending** | Sent to LHDN, waiting for the validation outcome | Nothing — most documents resolve within minutes |
| **Submitted / Validated** | LHDN has validated the e-invoice. It is compliant, and a QR code and validation link are attached | Nothing — this is the goal state |
| **Rejected** | LHDN's validation failed. The error reason is recorded on the document | Read the error, correct the document, resubmit (see below) |
| **Cancelled** | The e-invoice was cancelled with LHDN (allowed within 72 hours of validation) | Reissue a corrected invoice if needed |
| **Error** | The submission failed before it reached LHDN | Retry; if it repeats across many documents, contact support |

## Step 1: Translate between BigLedger and the MyInvois portal

The single most common source of alarm is vocabulary: **BigLedger and the MyInvois portal use different words for the same states.** Neither screen is wrong — they are two dialects. Keep this table next to you when you compare the two:

| You see in BigLedger | MyInvois portal shows | Same state? |
|---|---|---|
| Pending | Submitted | Yes — LHDN has it and is still validating |
| Submitted / Validated | **Valid** | Yes — the invoice is legally validated |
| Rejected | **Invalid** | Yes — validation failed |
| Cancelled | Cancelled | Yes |
| Error | (nothing — it never arrived) | The document has not reached LHDN yet |

So when your finance manager says *"the portal shows Valid but BigLedger says Submitted"* — that is the **same, healthy state**. And "Invalid" on the portal is what BigLedger calls "Rejected", not a system fault.

{{< callout type="info" >}}
For the legal question "is this invoice validated?", the MyInvois portal is the authority. BigLedger mirrors the portal's answer; on the rare occasion the two disagree for more than a day, treat the portal as correct and raise it with support (Step 4).
{{< /callout >}}

## Step 2: Know what a normal life cycle looks like

For GadgetSphere's invoice `GS-INV-88012` (RM 2,499, one smartphone, Klang Valley branch 03), a normal run looks like this:

1. The accounts clerk finalises the sales invoice. It enters the e-invoice queue automatically.
2. Within minutes it is sent to LHDN — the status shows **Pending**.
3. A few minutes later LHDN answers. The status flips to **Submitted / Validated**, and the document now carries its QR code and a validation link.

Total elapsed time: usually minutes. During busy periods (month-end, or an LHDN slow day) validation can take longer — a document sitting in Pending for an hour or two is not yet a problem.

## Step 3: Handle a rejection — the reject-and-resubmit rhythm

Say invoice `GS-INV-88027` comes back **Rejected** because the buyer's TIN was mistyped. This is routine, not an incident:

1. Open the document and read the rejection reason recorded on it.
2. Correct the underlying detail (in this example, fix the customer's TIN in the customer record).
3. Resubmit. The resubmission is sent to LHDN as a **new submission attempt**.
4. A few minutes later the new attempt validates, and the invoice is compliant.

{{< callout type="warning" >}}
**Seeing both a "Rejected" and a "Validated" entry for the same invoice number is normal.** The submission history keeps every attempt on purpose, as your audit trail. The invoice's real state is the outcome of the **latest** attempt. Do not panic about the old Rejected row, and do not resubmit again "to clear it" — an invoice whose latest attempt is Validated must not be sent to LHDN a second time, or you risk creating a duplicate e-invoice.
{{< /callout >}}

This is also why a count of rows in the submission history can be higher than your invoice count for the month: history counts **attempts**, your invoice register counts **documents**. A small difference between the two is expected whenever there have been rejections and resubmissions.

## Step 4: Know when to worry (and what to tell support)

Most statuses resolve themselves. These four situations do not, and each has a clear action:

| What you observe | What it means | What to do |
|---|---|---|
| **Pending for more than 3 days** | BigLedger stops checking with LHDN automatically after about 3 days, so this document will no longer update on its own | Check the invoice on the MyInvois portal. Then contact support with the invoice number — do **not** resubmit it yourself if the portal already shows it as Valid |
| **Many documents queued or in Error for hours** | Submissions from your company may have stopped flowing (for example, an expired connection to LHDN) | Contact support straight away and mention how many documents are affected and since when |
| **Portal says Valid, BigLedger still shows Pending or Rejected after a day** | The validation result did not make it back into BigLedger | The invoice **is** legally valid. Contact support to have the status refreshed — do not resubmit |
| **You need to cancel a validated e-invoice** | LHDN allows cancellation only within **72 hours** of validation | Cancel within the window via the applet's Cancellation tab. After 72 hours, issue a credit note instead |

When you contact support, include: the invoice number, the status BigLedger shows, the status the MyInvois portal shows, and how long it has been that way. Those four facts let the team resolve most status questions in one pass.

## What success looks like

Open the My E-Invoice Admin Applet and filter the Master List to the last 7 days. A healthy picture is: almost everything in **Submitted / Validated**, a small number in **Pending** (all less than a day old), the occasional **Rejected** with a resubmitted, validated successor — and nothing in Pending older than 3 days. If that is what you see, your e-invoicing is running exactly as designed.

## Common mistakes

| Symptom | Cause | Fix |
|---------|-------|-----|
| Panic that "LHDN rejected our invoice and the system still shows the rejection". | The old rejected attempt stays in the history after a successful resubmission — by design. | Check the **latest** attempt for that invoice; if it is Validated, you are done. |
| The same invoice validated twice at LHDN. | Resubmitting an invoice that was already validated (often to "clear" an old rejected row). | Never resubmit a document whose latest attempt is Validated; if the status in BigLedger looks wrong, ask support to refresh it. |
| An invoice quietly stuck in Pending for a week that nobody noticed. | Automatic status checking stops after about 3 days; the document will not update itself after that. | Review anything Pending older than 3 days weekly and report it to support with the portal status. |
| "The portal says Valid but BigLedger says Submitted — which is broken?" | Different words, same state: portal *Valid* = BigLedger *Submitted / Validated*. | Use the translation table in Step 1 before raising an issue. |
| A cancellation attempted four days after validation fails. | LHDN's cancellation window is 72 hours from validation. | Issue a credit note to reverse the invoice instead. |

## Related documentation

{{< cards >}}
  {{< card link="/applets/e-invoice/my-e-invoice-admin-applet/" title="My E-Invoice Admin Applet" subtitle="Field-by-field reference for the Master List, Posting Queue, and submission tabs" >}}
  {{< card link="/guides/einvoice-guides/einvoice-validation/" title="E-Invoice Validation Rules" subtitle="The mandatory fields and formats LHDN checks" >}}
  {{< card link="/guides/einvoice-guides/myinvois-setup/" title="MyInvois Setup" subtitle="Connect your company to LHDN the first time" >}}
  {{< card link="/guides/einvoice-guides/malaysia-e-invoice-guide/" title="Comprehensive Guide to E-Invoicing in Malaysia" subtitle="Timelines, requirements, and background" >}}
{{< /cards >}}
