---
title: "Reports & Analytics"
description: "Which e-invoice report answers which question — the live status list, the submission archive, the monthly reconciliation, and the PEPPOL logs."
weight: 45
bookCollapseSection: false
---

There are fewer e-invoice reports than people expect, and the difference between two of them is the single most expensive misunderstanding in the module. This page names the ones that exist and what each is for.

{{< callout type="warning" >}}
**To IRB E-Invoice carries the live LHDN status. Submission History does not.** Submission History is an archive of what each submission looked like *at the moment it was sent*, so it will keep saying "Submitted" for a document LHDN has since marked Invalid. Never build a work list of rejections from Submission History.
{{< /callout >}}

## Which report answers which question

| Your question | Where to look | What you get |
|---|---|---|
| **"Which e-invoices did LHDN reject, and why?"** | *Internal Submission → To IRB E-Invoice* in the [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/), tab **Export** | One row per e-invoice with the **live** status (Valid, Invalid, Submitted, IN_QUEUE), the LHDN error code and message, document number, branch and company. Sort on status and your work list writes itself. |
| **"What exactly did we send LHDN on the 3rd, and what did they say back at the time?"** | *Internal Submission → Submission History*, tab **Export** | The submission archive: request, response and the status as at submission. Use it for evidence, never for current status. |
| **"Did everything we invoiced last month actually reach LHDN?"** | *Monthly Report → Discrepancies Report* | Per company and period: your own documents (ERP Transaction Summary), what reached LHDN split by document type and by cancelled amount (IRB Audit Summary), and the gap in both directions (Document vs E-Invoice Discrepancy), with a drill-down to the documents behind every line. This is the module's reconciliation. |
| **"What is still waiting, and where?"** | *Batch Pool*, *Individual Pool*, *Single General Pool*, and *Internal Submission → Individual / Consolidated / Validation Queue* | Every document that has not reached LHDN yet, and the reason. Two of the three pools never empty themselves. |
| **"Which supplier e-invoices have we received, and do they match our purchase documents?"** | *Reconciliation (Purchase)* | Your purchase documents on one side, and on the other the supplier documents that reached you **over PEPPOL or through the OCR e-mail intake** — never the ones your suppliers filed with LHDN. *External Reception → From IRB E-Invoice* is empty in practice. [Incoming Supplier E-Invoices](/guides/einvoice-guides/einvoice-incoming-supplier/) explains the gap and the manual check that covers it. |
| **"What did we send and receive over PEPPOL?"** | *Internal Submission → To Peppol AP / Queue / History* and *External Reception → From Peppol AP* in the [MY PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) | One row per PEPPOL document with sender and receiver participant IDs, plus the transmission outcome on the queue rows. *Monthly Report → Queue / History* holds the per-company period summaries. |

---

## The monthly rhythm these reports support

1. **Daily** — read *To IRB E-Invoice*, clear anything Invalid.
2. **Weekly** — read the **Individual** and **Single General** pools, and filter the **Batch Pool** for *processed / failed* rows. Nothing here moves on its own and nothing raises an alert.
3. **Monthly, between the 1st and the 7th** — run the **Discrepancies Report** for the closing month and clear it before the consolidation deadline, while cancellation is still possible.

The step-by-step version is [The Month-End E-Invoice Cycle](/guides/einvoice-guides/einvoice-month-end/).

{{< callout type="info" >}}
**What none of these reports can see.** They compare your documents against *BigLedger's* e-invoice records. They do not pull back what LHDN holds — so an invoice keyed straight into the MyInvois portal, or sent by another system, never appears in a BigLedger report. If your LHDN dashboard shows more documents than BigLedger does, that is the first thing to check.
{{< /callout >}}

## Related documentation

{{< cards >}}
  {{< card link="/guides/einvoice-guides/einvoice-month-end/" title="The Month-End E-Invoice Cycle" subtitle="The 1st-to-7th routine these reports exist for" >}}
  {{< card link="/applets/e-invoice/my-e-invoice-admin-applet/" title="MY E-Invoice Admin Applet" subtitle="Every screen named above, field by field" >}}
{{< /cards >}}
