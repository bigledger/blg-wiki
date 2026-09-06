---
title: "What Malaysia Requires: E-Invoicing Explained"
description: "The background to Malaysian e-invoicing — the phased rollout by turnover, what LHDN puts on an e-invoice, how validation and the 72-hour window work, and where BigLedger fits"
tags:
- user-guide
- e-invoice
- compliance
weight: 1
---

Before you configure anything, it helps to know what LHDN is actually asking for and why. This page is the background: who has to comply and from when, what an e-invoice contains, what happens after you send one, and which parts of it BigLedger does for you. Ten minutes, and no screens to open.

## What e-invoicing is

Malaysian e-invoicing is an Inland Revenue Board (LHDN) programme that replaces the paper or PDF invoice as the *tax record* with a structured digital document, submitted to LHDN and validated by them before it counts. Your customer may still receive a PDF that looks much as it always did — but the version LHDN holds is the one that matters, and it only exists once LHDN has validated it.

Three consequences follow, and they shape everything else in these guides:

- **An invoice is not finished when you print it.** It is finished when LHDN says Valid.
- **The data has to be right before it is sent**, because the correction path after validation is narrow and time-limited.
- **Someone has to check, every month, that everything got there** — which is why [the month-end cycle](/guides/einvoice-guides/einvoice-month-end/) exists.

## Who has to comply, and from when

The rollout is phased by annual turnover, so businesses came into scope in waves:

| Phase | In force from | Annual turnover |
|---|---|---|
| 1 | 1 August 2024 | Above RM 100 million |
| 2 | 1 January 2025 | RM 25 million to RM 100 million |
| 3 | 1 July 2025 | RM 5 million to RM 25 million |
| 4 | 1 January 2026 | RM 1 million to RM 5 million |
| 5 | 1 July 2026 | Up to RM 1 million |

{{< callout type="info" >}}
Phase dates and thresholds are set by LHDN and have been adjusted more than once during the rollout. Confirm your own date against LHDN's current e-Invoice guideline on the Inland Revenue Board website before you plan around it.
{{< /callout >}}

## What goes on an e-invoice

LHDN's schema defines **55 data fields**, of which **37 are mandatory** and 18 optional. In practice they group into five blocks:

- **Who is selling** — your company's name, tax number, registration number, industry classification, address and contact number. BigLedger takes these from your company record, so one bad field here fails every document at once.
- **Who is buying** — name, tax number, identity document type and value, address and contact number. This block causes most rejections; see [Validation Rules & Troubleshooting](/guides/einvoice-guides/einvoice-validation/).
- **The document** — type, version, issue date and time, currency.
- **The lines** — item classification code, description, quantity, unit of measure, unit price, tax type and tax amount.
- **The money** — subtotal, total excluding tax, total including tax, and any discounts or charges.

Four document types cover almost everything you will send: the invoice, the credit note, the debit note and the refund note. A **self-billed** e-invoice reverses the roles — you issue it as the buyer, typically when your supplier cannot.

## How a document gets to LHDN

There are two routes, and which one you are on changes what you have to do:

**The MyInvois portal.** You type each invoice into LHDN's own web portal. Workable at low volume; unworkable for a retailer ringing up thousands of receipts a month. Note that an invoice created this way exists at LHDN but not in BigLedger, so it will not appear in any BigLedger report.

**API integration — what BigLedger does.** Your documents are submitted straight from BigLedger. You authorise BigLedger as your **e-invoice intermediary** on the MyInvois portal once, and from then on BigLedger submits on your behalf.

{{< callout type="tip" >}}
**You do not obtain, upload or manage a signing certificate.** E-invoices are digitally signed, but in the intermediary model that is handled for you — there is no certificate screen in BigLedger, and any instruction to upload one is out of date.
{{< /callout >}}

## What happens after you submit

1. **Submission.** BigLedger sends the e-invoice to LHDN. Your document status becomes *Submitted*.
2. **[Validation](/modules/e-invoice/concepts/validation-and-clearance/).** LHDN checks it and returns *Valid* or *Invalid*, along with a unique identifier for the validated document.
3. **Sharing.** The validated e-invoice — with its QR code — is what you give the buyer. BigLedger can e-mail it automatically.
4. **The 72-hour window.** From validation, the supplier has 72 hours to cancel the e-invoice, and the buyer has 72 hours to reject it. After that neither is possible, and the only correction is a credit note. See [Cancelling and Correcting a Validated E-Invoice](/guides/einvoice-guides/einvoice-cancel-and-correct/).

{{< callout type="warning" >}}
72 hours is the **cancellation and rejection** window. It is not a submission deadline — there is no rule saying an invoice must reach LHDN within 72 hours of being raised.
{{< /callout >}}

## Consolidated e-invoices, and why retailers care

You do not issue an individual e-invoice for every walk-in sale. Receipts where the buyer did not give their details are reported together in a [consolidated e-invoice](/modules/e-invoice/concepts/consolidated-e-invoice/) — one document, the buyer recorded as General Public, due at LHDN **by the 7th of the following month**.

For a 22-branch electronics retailer like GadgetSphere Sdn Bhd that is the difference between a small set of documents somebody can actually check before the 7th and roughly 38,000 that nobody can.

The one line to plan around: a sale of **RM 10,000 or more can never be consolidated**. It needs an individual e-invoice with the buyer's real identity — which in practice means asking for it at the counter, because chasing it a week later rarely works. [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/) explains how BigLedger sorts the two apart automatically.

## Where to go next

{{< cards >}}
  {{< card link="/guides/einvoice-guides/myinvois-setup/" title="MyInvois Setup" subtitle="Get your company and master data ready before your first document" >}}
  {{< card link="/guides/einvoice-guides/einvoice-pools-and-routing/" title="Pools & Submission Routing" subtitle="Individual vs consolidated, and the RM 10,000 rule" >}}
  {{< card link="/guides/einvoice-guides/einvoice-month-end/" title="The Month-End Cycle" subtitle="The routine that keeps you compliant every month" >}}
  {{< card link="/guides/einvoice-guides/einvoice-validation/" title="Validation Rules & Troubleshooting" subtitle="Why LHDN rejects a document, and how to fix it" >}}
{{< /cards >}}

{{< callout type="info" >}}
LHDN's own e-Invoice guideline and its software development kit documentation, published on the Inland Revenue Board website, are the authority on everything on this page. Where this wiki and LHDN disagree, LHDN is right — tell us and we will correct it.
{{< /callout >}}
