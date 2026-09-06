---
title: "E-Invoice Validation Rules & Troubleshooting"
description: "Why LHDN rejects an e-invoice and how to fix it — buyer identity formats, which address is sent, General TIN rules, state codes, credit-note references, and telling a real duplicate from a false one"
tags:
- user-guide
- e-invoice
- compliance
- troubleshooting
weight: 30
---

An e-invoice fails in one of two ways, and telling them apart is most of the battle. By the end of this page you will be able to read any rejection, know which of your records to fix, and get the document through. Most rejections come down to a single field group, and most fixes take under two minutes once you know where to look.

## Meet GadgetSphere

GadgetSphere Sdn Bhd sells across 22 branches, so its customer list runs from walk-in shoppers who give nothing but a phone number, through corporate buyers with a registration number, to tourists paying with a passport. Nearly every rejection GadgetSphere sees comes from that mix being keyed inconsistently at the counter — and the examples below are the ones its finance team works every month.

## The two kinds of failure

An e-invoice passes [two checks, not one](/modules/e-invoice/concepts/validation-and-clearance/) — BigLedger's own completeness check first, LHDN's content check second. Both produce the same complaint from a distance, "my e-invoice isn't at LHDN", and they need completely different fixes. So check the status before you touch anything:

- **Held in a [pool](/modules/e-invoice/concepts/pools-and-queues/)** — a mandatory field was missing, so the document was never sent. Nothing reached LHDN and nothing will until you complete it. [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/) says which pool and why.
- **Submitted, then marked Invalid** — everything mandatory was there, LHDN accepted the submission and rejected the content. There is an LHDN error code on the record, and that code is what tells you which of your records to correct.

{{< figure src="/images/my-e-invoice-admin-applet/batch-pool-validation-error.png" alt="A pooled document with a Validation Error panel listing the counterparty fields that are missing" caption="A document held before submission: the Validation Error panel names every field that is missing. Nothing reached LHDN, and nothing will until these are filled in." >}}

---

## Get the buyer's identity right — this is where most rejections come from

Every e-invoice carries, for both parties, a **tax identification number (TIN)** plus an **identity document type** and its **value**. That one field group is the largest single cause of rejections in production, by a wide margin. On one large multi-company customer, **426 of 448 recorded rejections were this field group** and nothing else.

The rule is short:

- **Passport** for anyone who is not Malaysian.
- **Business registration number (BRN)** for a company.
- **National identity number (NRIC)** only for a Malaysian individual, and only as **12 digits with no dashes**.
- **Type it. Don't paste it.**

Those three shapes account for the rejections almost exactly:

- **A foreign customer keyed under NRIC instead of Passport.** The commonest of all — 322 documents on that one customer. A passport number is not 12 digits, so LHDN rejects it as an invalid national identity number. Fix the identity type on the customer record, not on the e-invoice.
- **A national identity number stored with hyphens.** 82 documents. On the same customer, **1,803 documents with a clean unhyphenated number passed** and **not one hyphenated number ever passed**. The hyphens alone are enough.
- **A business registration number typed into the national-identity field.** 20 documents. It is the right number in the wrong box.

{{< callout type="warning" >}}
**The invisible one.** Copying a tax number out of a browser or a PDF can bring a zero-width character along with it. The field looks perfectly correct on screen — the right digits, the right length to the eye — and LHDN rejects it every single time with an invalid-TIN error. If a tax number looks right and keeps failing, delete the field and retype it by hand.
{{< /callout >}}

The two error codes you will see for this class are **`CF324`** (the identification number is not a valid national identity number) and **`CF358`** (invalid buyer TIN). Both are fixed in the [Customer Applet](/applets/master-data/customer-applet/) — correct it there and the customer's next sale is right too.

## Mandatory fields

### Document header

Every e-invoice needs, at minimum:

- **Supplier**: name, TIN, identity type + value, industry classification code, business activity description, address, contact number
- **Buyer**: name, TIN, identity type + value, address, contact number
- **Document**: e-invoice type and version, issue date/time, currency code
- **Amounts**: subtotal, total excluding tax, total including tax

{{< callout type="info" >}}
**Contact numbers** must be 8–20 characters. Very short numbers, or fields padded with text like "N/A", fail validation.
{{< /callout >}}

### Line items

Each line needs an item **classification code** (LHDN's list of around 45 codes — leave it blank and BigLedger defaults it to `022 – Others`), an item name, a unit price, a tax type code and a tax amount.

If the line has no tax, the tax type is set to `06 – Not Applicable` automatically; if tax is present but no tax type was given, it defaults to `01 – Sales Tax`.

{{< callout type="warning" >}}
Classification code **`004` is reserved for consolidated e-invoices**. Never use it on an individual e-invoice line — LHDN marks the document Invalid even when everything else, including the buyer's TIN, is correct.
{{< /callout >}}

### Addresses

Both the supplier and the buyer address must carry an **address line 1** (up to 150 characters), a **city** (up to 50) and a **state**. Address lines 2 and 3 (150 characters each) and a 5-character postal code are optional. Anything longer than the limit is shortened silently rather than rejected.

If address line 1, city or state is missing, the document is not submitted at all — it goes to a pool for you to complete.

## Which record does BigLedger actually send?

Before you go correcting a customer record, make sure it is the record the e-invoice was built from. There are two places the other party's details can live — the **customer or supplier record**, and an **e-invoice block typed directly onto the sales or purchase document** — and the document wins.

| What is on the document | Whose details go on the e-invoice |
|---|---|
| E-invoice buyer details (on a sale) or supplier details (on a purchase) typed onto the document | **Those**, exactly as typed. The customer or supplier record is never read |
| That block empty, but the document's general e-invoice counterparty block filled in | The general block on the document |
| Both blocks empty | The linked **customer or supplier record**, read fresh at submission time |

{{< callout type="warning" >}}
**A half-filled override still wins the whole block.** BigLedger treats the on-document block as "in use" if *any one* of name, identity type, identity number, tax number, service-tax number, e-mail or phone has something in it. Fill in one field and the other seven are sent blank — even though they are perfectly correct on the customer record. So fill the block completely or leave every field of it empty. This is the reason behind the most baffling rejection there is: a document that fails on a field you can see is right on the customer's record.
{{< /callout >}}

### Which address

If your customer has several addresses on file: BigLedger sends the **first address flagged as the e-invoice address**, looking in this order: **shipping, then billing, then main**. Flag exactly one and the guesswork disappears. If the buyer's details were typed straight onto the sales document rather than pulled from the customer record, that typed address is used exactly as entered.

{{< callout type="tip" >}}
**Your own company address is the supplier address on every sales e-invoice.** So one bad field on the company record — a state that will not resolve, a missing city — fails *every* document at once, across every branch. If everything is failing and no single customer looks wrong, check the company record in the [Organisation Applet](/applets/master-data/organisation-applet/) first.
{{< /callout >}}

### Malaysian state codes

LHDN wants the state as a numeric code, not free text. BigLedger resolves what your staff typed automatically: first an exact match on the official state name, then a match after stripping punctuation, then a partial match in either direction (so "Kuala Lumpur" finds "Wilayah Persekutuan Kuala Lumpur"), and finally a list of common abbreviations.

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

The abbreviations that resolve on their own, so you do not need to re-key them: *KL*, *WP Kuala Lumpur*, *WPKL* → 14 · *Labuan*, *WP Labuan* → 15 · *Putrajaya*, *WP Putrajaya* → 16 · *Penang*, *Pinang*, *P. Pinang* → 07 · *NS*, *N9*, *N. Sembilan*, *Seremban* → 05 · *Malacca*, *Melacca* → 04 · *Trengganu*, *Terenganu* → 11 · *Johore* → 01 · *Selangor Darul Ehsan*, *Sel*, *S.Gor*, *Sgor* → 10.

If none of those match, the state code is left **empty** and the document waits for you to key a real state. There is no "not applicable" fallback: LHDN rejects state code `17` outright with error `CV317`, for Malaysian and foreign addresses alike.

For foreign addresses the state passes through as text (or as the country code when the state is blank), and the country defaults to Malaysia if your address data does not say otherwise.

## General TINs — when you don't have the buyer's TIN

LHDN publishes four **General TINs** for cases where a real one is not available:

| General TIN | Use for |
|---|---|
| `EI00000000010` | General public / local buyers (mainly consolidated e-invoices) |
| `EI00000000020` | Foreign buyers |
| `EI00000000030` | Foreign suppliers (self-billed purchases) |
| `EI00000000040` | Government / armed forces |

**Rules that trip people up:**

1. For **individual** e-invoices, always prefer the buyer's real TIN.
2. `EI00000000010` **can** be used on an individual e-invoice for a local buyer without a TIN — but only together with identity type **NRIC** and a **valid 12-digit national identity number**. Any other combination is rejected.
3. If the buyer's identity type is a registration number or a passport, the General Public TIN is not acceptable — you must obtain the buyer's real TIN, or let the sale be consolidated instead.
4. The government TIN is not a general-purpose stand-in either. Using it on an ordinary individual e-invoice gets the document returned Invalid.
5. If a buyer has a TIN but no identity value, BigLedger fills the value with `000000000000` automatically, which LHDN accepts.

{{< callout type="tip" >}}
For transactions of RM 10,000 or more where the buyer's identity type is a business registration number and the TIN is blank, BigLedger searches LHDN's registry by registration number and fills the TIN in for you when it finds a match. Below RM 10,000 no search happens — that is why a small sale with a missing TIN simply goes to a pool.
{{< /callout >}}

---

## Common validation errors and fixes

### 1. Wrong currency setup on foreign-currency invoices

**Symptom:** A US dollar (or other foreign-currency) invoice is rejected with a currency error.

**Cause:** On a foreign-currency document the *document currency* should be the foreign currency and the *base currency* must be `MYR`. The error appears when both are set to the foreign currency.

**Fix:** Correct the base currency to `MYR` on the source document, then reprocess the e-invoice.

*Example:* GadgetSphere invoices a Singapore distributor USD 4,800. Keyed with document currency USD, base currency MYR and the exchange rate recorded, it submits cleanly. Keyed with base currency USD by mistake, LHDN rejects it with error `DC511`.

{{< figure src="/images/e-invoice/forex-validation-error.jpg" alt="Validation Error Table on an e-invoice showing error code DC511 against the target currency property, with the message Foreign target currency should always be MYR" caption="The Validation Error table on the rejected e-invoice. Hover a truncated message to read it in full — here, error DC511, \"Foreign target currency should always be MYR\"." >}}

### 2. General TIN misuse

**Symptom:** LHDN marks the document **Invalid** with a TIN-related message such as "Only General TIN (010)…", shown against the buyer TIN field in the validation error panel.

**Cause and fix:** one of the five rules in [General TINs](#general-tins--when-you-dont-have-the-buyers-tin) above was broken — most often `EI00000000010` used with an identity type other than NRIC, or with an invalid national identity number. Correct the buyer's TIN and identity combination and use **Save and Resubmit**.

Watch for the second half of this one: even with a correct buyer TIN, a **line carrying classification `004`** makes an individual e-invoice Invalid, because `004` means "consolidated". Fix the classification on the line as well.

### 3. Credit or debit note references an original that is no longer valid

**Symptom:** A credit note, debit note, refund note or sales return is rejected even though its own data looks correct.

**Cause:** These documents reference the original e-invoice. If the original was first rejected as Invalid and then resubmitted successfully, it received a **new** LHDN reference — and your note may still be pointing at the dead one.

There are two error codes here, and they mean different things:

- **`DR303`** — the referenced e-invoice's status is not one that can be referenced.
- **`DR308`** — the buyer on your note is not the same buyer as on the referenced e-invoice. Getting the reference number right is not enough; the identity has to match too.

**Fix:** either update the note's reference to the **currently valid** e-invoice and Save and Resubmit, or clear both reference fields and submit the note without a reference. Full walkthrough in [Cancelling and Correcting a Validated E-Invoice](/guides/einvoice-guides/einvoice-cancel-and-correct/).

### 4. The same sale looks like it is at LHDN twice

Before you act on this, work out whether the duplicate is **real** or **apparent**. Acting on an apparent one destroys valid e-invoices.

**Apparent duplicate — the same number, two different documents.** Sales invoices and self-billed purchase invoices draw their document numbers from **two independent sequences that both start at the same value**, so the same number legitimately exists twice: once on a sale, once on a purchase. The submission listing does not show which direction a document went, so the two rows look like one document submitted twice.

{{< callout type="warning" >}}
**Check the document type before cancelling anything.** One customer came within a step of cancelling 129 perfectly valid e-invoices that were still inside their 72-hour window, on the strength of a report that showed repeated numbers. There was no duplicate.
{{< /callout >}}

**Real duplicate — one sale inside two Valid e-invoices.** This does happen: for example, a receipt submitted individually while a copy of it was still waiting in the Batch Pool, so the monthly consolidation reported it a second time; or a manual push to the Batch Pool performed twice. LHDN's records then overstate your sales.

**How you find it:** by reconciling, not by reading Submission History. See [The Month-End E-Invoice Cycle](/guides/einvoice-guides/einvoice-month-end/).

**How you fix it:** inside 72 hours of validation, cancel the e-invoice that carries the duplicate and re-report the legitimate documents. Past 72 hours, issue a credit note for the duplicated amount and involve your accountant — usually your ledger is right and only the LHDN reporting is overstated. Both routes are in [Cancelling and Correcting a Validated E-Invoice](/guides/einvoice-guides/einvoice-cancel-and-correct/).

### 5. Backdated documents rejected for their issue date

**Symptom:** A document dated in the past is rejected because of its date and time.

**Cause:** LHDN requires the e-invoice **issue date-time to be the actual submission time**, not the original transaction date. The transaction date is preserved separately on the document, so you lose nothing.

**Fix:** nothing to do by hand — BigLedger stamps the submission time automatically. If you see this on documents from an external integration, check that the integration is not overriding the issue date-time with the historical transaction date. To consolidate backdated B2C receipts from earlier months, see [Pools & Submission Routing](/guides/einvoice-guides/einvoice-pools-and-routing/#backdated-documents).

---

## The fix loop

Whatever the error, the recovery is the same four moves:

1. **Find the document.** In a pool (never submitted) or in *Internal Submission → To IRB E-Invoice* (submitted and Invalid). The LHDN error code and message are shown on the record.
2. **Fix it at the source.** Buyer identity and address belong on the customer record; currency and lines belong on the sales document. Fixing only the e-invoice leaves the same error waiting for the next sale.
3. **Save and Resubmit.**
4. **Watch it to Valid.** Not to "Submitted" — that only means LHDN is still deciding.

{{< callout type="warning" >}}
**Save and Resubmit stops working once LHDN says Valid.** From that moment the e-invoice is a filed record: you have 72 hours from the **validation time recorded on the e-invoice** (held in UTC, and possibly earlier than the portal appears to show) to cancel it, and after that only a credit note will do. Compute the deadline from the e-invoice record, not from memory. See [Cancelling and Correcting a Validated E-Invoice](/guides/einvoice-guides/einvoice-cancel-and-correct/).
{{< /callout >}}

## What success looks like

Thirty seconds, one screen. Open *My E-Invoice Admin Applet → Internal Submission → To IRB E-Invoice*, filter to the document you just fixed, and check that:

1. Its status reads **Valid** — not Submitted, not IN_QUEUE, not Invalid.
2. The customer record you corrected now shows the right identity type and a clean tax number, so the next sale to that customer submits first time.

## Common mistakes

| Mistake | What you see | Fix |
|---|---|---|
| Fixing the e-invoice but not the customer record | The same rejection returns on that customer's next sale | Correct identity, tax number and address in the Customer Applet, then resubmit |
| Pasting a tax number from a browser or PDF | A field that looks perfect and is rejected every time | Delete the field and retype the digits by hand |
| Keying a foreign customer as NRIC | `CF324` — invalid national identity number | Identity type **Passport** for anyone not Malaysian |
| Storing a national identity number with dashes | `CF324` again, on a number that looks correct | 12 digits, no separators |
| Cancelling on the strength of repeated document numbers | Valid e-invoices destroyed for no reason | Check the document type first — sales and self-billed purchase numbers can collide |

## Related documentation

{{< cards >}}
  {{< card link="/guides/einvoice-guides/einvoice-pools-and-routing/" title="Pools & Submission Routing" subtitle="Why a document was held instead of submitted" >}}
  {{< card link="/guides/einvoice-guides/einvoice-month-end/" title="The Month-End E-Invoice Cycle" subtitle="Working the Invalid list and reconciling before the 7th" >}}
  {{< card link="/guides/einvoice-guides/einvoice-cancel-and-correct/" title="Cancelling & Correcting an E-Invoice" subtitle="What to do once LHDN has already said Valid" >}}
  {{< card link="/applets/e-invoice/my-e-invoice-admin-applet/" title="My E-Invoice Admin Applet" subtitle="Field-level reference for every screen named above" >}}
{{< /cards >}}
