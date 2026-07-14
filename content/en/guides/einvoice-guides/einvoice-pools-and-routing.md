---
title: "E-Invoice Pools & Submission Routing"
description: "How the system decides whether a document becomes an individual or consolidated e-invoice, what the Batch, Individual and Single General pools are for, and how to move documents between them"
tags:
- user-guide
- e-invoice
- compliance
weight: 25
---

Every finalized sales document (invoice, cash bill, credit note, …) with e-invoicing enabled goes through the same decision: **submit it to LHDN individually, or include it in a consolidated e-invoice?** And if required information is missing, **park it in a pool** so you can fix it. This guide explains that routing so you always know where a document went and why.

## Submission types

Each document carries an **e-invoice submission type** that drives the routing:

| Submission type | Meaning |
|---|---|
| **Individual** | Submit this document to LHDN as its own e-invoice |
| **Consolidated** | Include this document in the monthly consolidated e-invoice (typical for B2C retail) |
| **Single General** | Try as an individual e-invoice using general buyer details; fall back to consolidation if it fails |
| *(not set)* | The system decides based on the amount and available data |

## The RM 10,000 rule

Transactions of **RM 10,000 or more must be submitted as individual e-invoices** — they cannot hide inside a consolidation. The system enforces this automatically:

- A document marked *Consolidated* with a total ≥ RM 10,000 is diverted to the **Individual Pool** instead of the batch.
- For documents ≥ RM 10,000 where the buyer's ID type is BRN but the TIN is missing, the system **auto-searches LHDN's registry** by registration number and fills in the TIN when found.

{{< callout type="warning" >}}
This threshold is an LHDN rule (in force since January 2026). Do not try to split large transactions to stay under it.
{{< /callout >}}

## Where does a finalized document go?

When a document is finalized, the system checks its submission type, amount, and whether all [mandatory fields](/guides/einvoice-guides/einvoice-validation/#mandatory-fields) are complete:

| Submission type | Amount | Mandatory fields complete? | Outcome |
|---|---|---|---|
| Individual | any | ✅ | Submitted to LHDN as an individual e-invoice |
| Individual | any | ❌ | **Individual Pool** |
| Consolidated | < RM 10,000 | — | **Batch Pool** (awaits monthly consolidation) |
| Consolidated | ≥ RM 10,000 | ❌ | **Individual Pool** (RM 10k rule) |
| Single General | any | ✅ | Submitted as an individual e-invoice |
| Single General | any | ❌ | **Single General Pool** |
| *(not set)* | any | ✅ | Submitted as an individual e-invoice |
| *(not set)* | < RM 10,000 | ❌ | **Batch Pool** |
| *(not set)* | ≥ RM 10,000 | ❌ | **Individual Pool** |

*Example:* GadgetSphere Sdn Bhd's POS cash bills are marked Consolidated — they flow into the Batch Pool and are swept into the monthly consolidated e-invoice. A corporate customer buying RM 18,000 of equipment on the same day is above the threshold, so that invoice must go out individually, with the customer's real TIN.

## The three pools

A **pool** is a holding area for documents that could not be submitted yet. Each behaves differently:

### Batch Pool

- **Who lands here:** Consolidated documents (and unset-type documents with incomplete data) under RM 10,000.
- **Default outcome:** if you do nothing, the document is included in the next **consolidated e-invoice** run — no action needed for normal B2C sales.
- **Available actions:** fix buyer data and resubmit as an individual e-invoice; move to the Individual or Single General pool; consolidate on demand (by date range, by branch, or by selected documents); or skip e-invoicing for the document.

### Individual Pool

- **Who lands here:** documents meant for individual submission that are missing required information (and any ≥ RM 10,000 document with incomplete data).
- **Default outcome:** **stays here until fixed** — these documents need your attention.
- **Available actions:** complete the buyer details and resubmit; or, if you cannot obtain the buyer's details, move the document to the Batch Pool so it is consolidated instead — but do this **before** the scheduled monthly consolidation run.

### Single General Pool

- **Who lands here:** documents marked Single General with incomplete data.
- **Purpose:** for cases where buyer data is unlikely to be obtainable but you still want one individual submission attempt first.
- **Available actions:** fix and resubmit as individual; if that submission fails or is invalid, resubmit the document as a **single-document consolidated e-invoice**; or move it to another pool.

### Pool comparison

| | Batch Pool | Individual Pool | Single General Pool |
|---|---|---|---|
| Default outcome | Auto-consolidated monthly | Waits for you | Waits for you |
| Fix & resubmit as individual | ✅ | ✅ | ✅ |
| Move to another pool | ✅ | ✅ | ✅ |
| Fallback to consolidated | Automatic (scheduled) | Manual (move to batch) | On failed individual attempt |
| Skip e-invoice | ✅ | ✅ | ✅ |

All pool actions are performed in the [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/).

## The monthly consolidation cycle

Unprocessed Batch Pool documents from a month are grouped into **consolidated e-invoices** — LHDN requires these to be submitted **by the 7th of the following month**. The consolidation groups documents into ranges of consecutive document numbers per store/branch, skipping any that were already submitted individually, so every receipt is traceable to exactly one e-invoice.

{{< callout type="tip" >}}
Review your Individual Pool **before** month-end: anything you move to the Batch Pool in time is picked up by the scheduled consolidation; anything left stranded after the run needs manual handling.
{{< /callout >}}

## Backdated documents

Two rules matter when handling documents dated in the past:

1. **Issue time is always "now".** LHDN requires the e-invoice issue date-time to be the actual submission time. The document's original transaction date is preserved separately — you don't lose it.
2. **Prior-month consolidation needs a dedicated run.** The standard monthly consolidation only sweeps the current month. Batch Pool documents from earlier months are consolidated through a separate backdated consolidation step — contact your administrator or support to run it for the affected months, then the consolidated e-invoices are submitted the usual way.

## Frequently asked questions

**A customer wants an individual e-invoice for a receipt that's already in the Batch Pool — what do I do?**
Find the document in the Batch Pool, complete the customer's TIN/ID and address, and use *Save and Resubmit*. It leaves the batch and is submitted individually. This works any time before the receipt has been consolidated.

**What happens if I can't get a buyer's TIN at all?**
For local buyers, an individual e-invoice can still be issued with the General Public TIN plus a valid NRIC (see [General TINs](/guides/einvoice-guides/einvoice-validation/#general-tins--when-you-dont-have-the-buyers-tin)). Otherwise, move the document to the Batch Pool and let it be consolidated.

**A document shows "skipped" — is that a problem?**
Skipping is a deliberate action for documents that must not be e-invoiced (for example, when the counterparty issues the e-invoice instead). Skipped sales documents are still tracked for matching against incoming supplier e-invoices.
