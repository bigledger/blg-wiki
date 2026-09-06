---
title: "E-Invoice & PEPPOL Guides"
description: "Set up MyInvois and PEPPOL, run the monthly e-invoice cycle, fix validation rejections, and cancel or correct an e-invoice LHDN has already validated"
tags:
- user-guide
- e-invoice
- peppol
- compliance
weight: 31
bookCollapseSection: false
---

Everything you need to report your sales to LHDN through MyInvois and to deliver documents over the PEPPOL network — from first-time setup, through the monthly cycle you will run for the rest of your working life, to what happens when something goes wrong.

---

## Get started

New to e-invoicing? Start here.

{{< cards >}}
  {{< card link="myinvois-setup" title="MyInvois Setup" subtitle="Authorise BigLedger to submit on your behalf and get your company and master data ready" >}}
  {{< card link="peppol-configuration" title="PEPPOL Configuration" subtitle="Set up PEPPOL delivery to trading partners" >}}
  {{< card link="malaysia-e-invoice-guide" title="What Malaysia Requires" subtitle="The phased timeline, the data LHDN wants, and how validation works" >}}
{{< /cards >}}

**What setup covers:**

- Authorising BigLedger as your e-invoice intermediary on the MyInvois portal
- Turning e-invoicing on for each company, **before** you finalise any documents
- Your company's own identity block — tax number, registration number, industry code, address, phone
- Customer and supplier identity: tax number, identity type and value, and an address flagged for e-invoicing
- Item classification codes, units of measure and tax types on your items

{{< callout type="tip" >}}
**Do MyInvois first** — it is what Malaysian tax compliance requires. PEPPOL is a separate delivery channel to a trading partner, set up alongside it rather than instead of it.
{{< /callout >}}

---

## Every day

Once you are set up, e-invoicing sits inside your normal sales and purchasing work:

1. Create sales invoices and credit notes as usual.
2. Finalise them. **BigLedger does not submit at the moment you press Save** — a finalised document is queued, and a background processor sends it. Everything after Save happens in the background, which is why an e-invoice is not at LHDN the second you look for it.
3. Check the status of yesterday's documents on *Internal Submission → To IRB E-Invoice*.
4. Fix anything marked Invalid and resubmit.
5. Match incoming supplier e-invoices against your purchase documents.

---

## Every month

The 1st to the 7th is the busiest week in e-invoicing: last month's consolidated e-invoices have to reach LHDN by the 7th, and everything that failed has to be found and fixed before then.

{{< cards >}}
  {{< card link="einvoice-month-end" title="The Month-End Cycle (1st–7th)" subtitle="Clear the pools, pull the right export, work the Invalid list, and prove your books agree with LHDN" >}}
{{< /cards >}}

---

## When something goes wrong

{{< cards >}}
  {{< card link="einvoice-pools-and-routing" title="Pools & Submission Routing" subtitle="Individual vs consolidated, the RM 10,000 rule, and the Batch / Individual / Single General pools" >}}
  {{< card link="einvoice-validation" title="Validation Rules & Troubleshooting" subtitle="Buyer identity formats, addresses, General TINs, and the rejections you will actually meet" >}}
  {{< card link="einvoice-cancel-and-correct" title="Cancelling & Correcting an E-Invoice" subtitle="The 72-hour window, and the credit-note path once it closes" >}}
{{< /cards >}}

The issues that come up most often, and what to do about each:

| Scenario | What is actually happening | How to handle it |
|---|---|---|
| **Buyer identity rejected** | A foreign customer keyed as Malaysian, a national identity number stored with dashes, or a registration number in the wrong field | Passport for anyone not Malaysian, registration number for a company, national identity number as 12 digits with no dashes — fix it on the customer record, not on the e-invoice |
| **Line rejected on its codes** | Not the tax *rate* — it is the item classification code or the taxable type. A blank classification defaults to `022 Others`, and classification `004` on an individual e-invoice is always rejected | Set a real classification code on the item; never use `004` outside a consolidated e-invoice |
| **Missing mandatory fields** | The document was never submitted; it is sitting in a pool | Complete the buyer's tax number, identity and address, then Save and Resubmit |
| **A row that has not moved since yesterday** | It is queued, not retrying — nothing picks a stalled row back up on its own | Select it and press **Submit**. If the same rows stall again, raise a support request |
| **The same sale at LHDN twice** | Possible, and it does happen — but repeated document numbers are more often a sales invoice and a self-billed purchase invoice sharing a number | Find real duplicates by reconciling, not by reading Submission History. Inside 72 hours you can cancel one; after that it is a credit note |
| **Cross-border format** | The PEPPOL document format does not match what the recipient accepts | Check the recipient's PEPPOL requirements before sending |

{{< callout type="warning" >}}
**Deadlines are real.** Consolidated e-invoices for a month must be validated by the **7th** of the following month, and a validated e-invoice can only be cancelled within **72 hours** of validation. Both clocks run whether or not anyone is watching them.
{{< /callout >}}

---

## Reporting

Three places tell you where you stand, and they do not say the same thing:

- **Internal Submission → To IRB E-Invoice** — one row per e-invoice with the **live** LHDN status (Valid, Invalid, Submitted, IN_QUEUE). Export this one when you need a work list.
- **Internal Submission → Submission History** — an archive of what each submission looked like **at the moment it was sent**. It is not the current status, so never filter your Invalid list from here.
- **Monthly Report → Discrepancies Report** — compares the documents you finalised against the e-invoices on record, per company and period. This is your self-service reconciliation.

**Compliance habits worth building:**

- Watch rejection rates daily during your first months.
- Keep customer and supplier tax numbers and identity types clean — that one field group causes most rejections.
- Clear the Individual Pool before your consolidation runs, every month.
- Reconcile before the 7th, not after it.

---

## Related resources

- **[My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/)** — field-level reference for every e-invoice screen
- **[My E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/)** — what your buyers can see and request
- **[My PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/)** — PEPPOL queues and configuration
- **[Sales Invoice Applet](/applets/sales-workflow/internal-sales-invoice-applet/)** — where a sales e-invoice starts
- **[Purchase Invoice Applet](/applets/finance/internal-purchase-invoice-applet/)** — the purchase side of the same pipeline
- **[Compliance & Audit Guide](/guides/advanced/compliance-audit/)** — regulatory compliance overview
