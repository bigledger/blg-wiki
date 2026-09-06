---
title: "Concepts"
description: "The three e-invoicing ideas you need before any guide makes sense — what a consolidated e-invoice is, what pools and queues are for, and what LHDN validation actually decides."
weight: 10
module: e-invoice
bookCollapseSection: false
---

Three ideas come up in every e-invoice guide, and a reader who meets them for the first time halfway through a procedure has to stop and infer them. They are explained once, here, so the guides can get on with the task.

Each page answers *what is this and why does it exist*. None of them tells you to click anything — for that, go to the [guides](/guides/einvoice-guides/).

{{< cards >}}
  {{< card link="/modules-v2/e-invoice/concepts/consolidated-e-invoice/" title="Consolidated e-invoices" subtitle="One e-invoice that reports a whole month of counter receipts under a single General Public buyer — and the RM 10,000 line it cannot cross" >}}
  {{< card link="/modules-v2/e-invoice/concepts/pools-and-queues/" title="Pools and queues" subtitle="A pool holds a document that cannot be sent yet; a queue holds one that can. Two of the three pools never empty themselves" >}}
  {{< card link="/modules-v2/e-invoice/concepts/validation-and-clearance/" title="Validation and clearance" subtitle="What LHDN actually decides, what Valid means for a document you can no longer edit, and where the 72-hour clock starts" >}}
{{< /cards >}}

If you are new to the whole subject, read them in that order, then go to [What Malaysia Requires](/guides/einvoice-guides/malaysia-e-invoice-guide/).

For the architecture behind them — the processors, the API calls, the PEPPOL access point — see [Core Concepts](/modules-v2/e-invoice/core-concepts/).
