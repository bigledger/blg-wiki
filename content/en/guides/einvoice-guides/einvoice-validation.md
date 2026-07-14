---
title: "E-Invoice Validation Rules & Troubleshooting"
description: "The fields LHDN requires on every e-invoice, why documents get rejected, and how to fix the most common validation errors — General TIN misuse, currency setup, credit-note references, and duplicates"
tags:
- user-guide
- e-invoice
- compliance
- troubleshooting
weight: 30
---

When you submit an e-invoice, LHDN's MyInvois system validates it before accepting it. If a mandatory field is missing, your document is held back in a pool for correction instead of being submitted (see [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/)). If a field is present but *wrong*, LHDN may accept the submission and then mark the document **Invalid** — and you'll need to fix it and resubmit.

This guide covers both: what must be present, and how to fix the errors we see most often.

## Mandatory Fields

### Document header

Every e-invoice needs, at minimum:

- **Supplier**: name, TIN, ID type + ID value (e.g. BRN), industry classification code, business activity description, address, contact number
- **Buyer**: name, TIN, ID type + ID value, address, contact number
- **Document**: e-invoice type and version, issue date/time, currency code
- **Amounts**: subtotal, total excluding tax, total including tax

{{< callout type="info" >}}
**Contact numbers** must be 8–20 characters. Very short numbers, or numbers padded with text like "N/A", fail validation.
{{< /callout >}}

### Line items

Each line needs:

- Item **classification code** (LHDN's list of ~45 codes; if you leave it blank the system defaults to `022 – Others`)
- Item name
- Unit price
- Tax type code
- Tax amount

If the line has no tax, the tax type is set to `06 – Not Applicable` automatically; if tax is present but no tax type was given, it defaults to `01 – Sales Tax`.

{{< callout type="warning" >}}
Classification code **`004` is reserved for consolidated e-invoices**. Never use it on an individual e-invoice line — LHDN will mark the document Invalid even if everything else (including the buyer's TIN) is correct.
{{< /callout >}}

### Addresses

Both supplier and buyer addresses must contain at least:

| Field | Required | Max length |
|---|---|---|
| Address line 1 | **Yes** | 150 characters |
| City | **Yes** | 50 characters |
| State | **Yes** | — |
| Address lines 2–3 | No | 150 characters |
| Postal code | No | 5 characters |

If address line 1, city, or state is missing, the document will not be submitted — it is routed to a pool for you to complete the data.

### Malaysian state codes

LHDN requires states as numeric codes. The system resolves free-text state names automatically — including common abbreviations like *KL*, *WPKL*, *Penang*, *N9*, *Johore*, *Malacca* — but if it cannot match your text, you'll be asked to correct it.

| Code | State | Code | State |
|---|---|---|---|
| 01 | Johor | 09 | Perlis |
| 02 | Kedah | 10 | Selangor |
| 03 | Kelantan | 11 | Terengganu |
| 04 | Melaka | 12 | Sabah |
| 05 | Negeri Sembilan | 13 | Sarawak |
| 06 | Pahang | 14 | W.P. Kuala Lumpur |
| 07 | Pulau Pinang | 15 | W.P. Labuan |
| 08 | Perak | 16 | W.P. Putrajaya |

For foreign addresses, the state field passes through as text, and the country defaults from your address data (falling back to Malaysia if unspecified).

## General TINs — when you don't have the buyer's TIN

LHDN publishes four **General TINs** for cases where a real TIN is not available:

| General TIN | Use for |
|---|---|
| `EI00000000010` | General public / local buyers (mainly consolidated e-invoices) |
| `EI00000000020` | Foreign buyers |
| `EI00000000030` | Foreign suppliers (self-billed purchases) |
| `EI00000000040` | Government / armed forces |

**Rules that trip people up:**

1. For **individual** e-invoices, always prefer the buyer's real TIN.
2. `EI00000000010` **can** be used on an individual e-invoice for a local buyer without a TIN — but only together with `ID type = NRIC` and a **valid NRIC number**. Any other combination is rejected.
3. If the buyer's ID type is BRN or passport, the General Public TIN is not acceptable — you must obtain the buyer's real TIN.
4. If a buyer has a TIN but no ID value, the system fills the ID value with `000000000000` automatically, which LHDN accepts.

{{< callout type="tip" >}}
For transactions of RM 10,000 or more where the buyer's ID type is BRN and the TIN is missing, the system automatically searches LHDN's registry by registration number and fills the TIN in for you when a match is found.
{{< /callout >}}

## Common Validation Errors and Fixes

### 1. Wrong currency setup on foreign-currency invoices

**Symptom:** A USD (or other foreign-currency) invoice is rejected with a currency error.

**Cause:** For a foreign-currency document, the *document currency* should be the foreign currency (e.g. `USD`) and the *base currency* must be `MYR`. The error appears when both are set to the foreign currency.

**Fix:** Correct the base currency to `MYR` on the source document, then reprocess the e-invoice.

*Example:* GadgetSphere Sdn Bhd invoices a Singapore distributor in USD. The invoice is created with document currency USD and base currency MYR, with the exchange rate recorded — this submits cleanly. When it was keyed with base currency USD by mistake, LHDN rejected it.

### 2. General TIN misuse

**Symptom:** LHDN marks the document **Invalid** with a TIN-related error (e.g. a "general TIN provided where not allowed" message).

**Cause & fix:** one of the four rules in the [General TINs](#general-tins--when-you-dont-have-the-buyers-tin) section above was broken — most commonly `EI00000000010` used with an ID type other than NRIC, or used with an invalid NRIC. Correct the buyer's TIN/ID combination and use **Save and Resubmit**.

### 3. Credit/debit note references an invalid original e-invoice

**Symptom:** A credit note, debit note, refund note, or sales return is rejected even though its own data looks correct.

**Cause:** These documents must reference the LHDN document of the *original* e-invoice. If the original was first rejected (Invalid) and then resubmitted successfully, it received a **new** LHDN document reference — but your credit note may still point at the old, invalid one.

**Fix:** Update the credit note's original-invoice reference to the currently **Valid** LHDN document, then Save and Resubmit. If no valid original exists:

| Option | Action |
|---|---|
| Submit without reference | Clear the original-invoice reference fields and resubmit (where permitted) |
| Fix the original first | Resubmit the original invoice so it becomes Valid, then point the credit note at it |

### 4. Duplicate submission — one sale counted twice at LHDN

**Symptom:** The same source document ends up inside **two** Valid e-invoices (for example, once as an individual e-invoice and again inside a monthly consolidated e-invoice), so LHDN's records overstate your sales.

**Causes:**
- A manual "push to batch pool" action was performed twice (double-click or a retried timeout), creating two pool entries that were swept into different consolidated e-invoices.
- A document was submitted individually while a copy of it was still waiting in the batch pool, and the monthly consolidation picked it up again.

**Fix:**

| Situation | Action |
|---|---|
| Within 72 hours of the wrong e-invoice's validation | Cancel the e-invoice that contains the duplicate, then re-submit the remaining legitimate documents as a new consolidation. Verify the replacement total before submitting. |
| Past 72 hours | Issue a **credit note** for the duplicated amount, referencing the e-invoice that contains the duplicate. Involve your accountant — usually your ledger is correct and only the LHDN reporting is overstated. |

**Prevention:** after any manual push or a timeout, check the pool's document count *before* consolidating — never blindly retry.

### 5. Backdated documents rejected for their issue date

**Symptom:** A document dated in the past is rejected because of its date/time.

**Cause:** LHDN requires the e-invoice's **issue date-time to be the actual submission time** — not the original transaction date. The transaction date is preserved separately on the document.

**Fix:** Nothing to fix manually — the system stamps the submission time automatically. If you see this error on documents from an external integration, make sure the integration is not overriding the issue date-time with the historical transaction date. For consolidating backdated B2C documents from prior months, see [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/#backdated-documents).

## Resolution Workflow

Whatever the error, the recovery loop is the same:

1. Find the document in the relevant pool or submission screen (the LHDN error code and message are shown on the document).
2. Correct the data — buyer details, currency, references, or line classifications.
3. Use **Save and Resubmit**.
4. Monitor until the status becomes **Valid**.

{{< callout type="info" >}}
**Cancellation window:** a Valid e-invoice can be cancelled within **72 hours of validation**. After that, the only remediation is a credit note / debit note referencing the original. See the [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) reference for the cancellation workflow.
{{< /callout >}}
