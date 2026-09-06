---
topic: e-invoice-address-and-state-codes
aliases: [e-invoice address, state code, LHDN state code, CV317, default_einvoice_address, address construction]
applets: [myIEnvoiceAdminApplet]
modules: [e-invoice]
related: [e-invoice, e-invoice-tin-and-identity-validation, e-invoice-submission-errors, customer-maintenance, supplier-maintenance, entity-applet, organisation-applet, pos-general-applet, emp-etl-sync]
wiki:
  - content/en/guides/einvoice-guides/einvoice-validation.md
  - content/en/applets/e-invoice/my-e-invoice-admin-applet.md
status: growing
updated: 2026-09-06
---

# E-invoice addresses and Malaysian state codes

LHDN wants a structured address for both parties, with the state as a numeric code rather than free
text. BigLedger builds that address from whichever master-data address is flagged as the e-invoice
address, truncates each part to LHDN's limits, and tries four increasingly forgiving ways to turn
whatever your staff typed into a state code. When all four fail, the document waits in a pool.

## Facts

### What must be there

- 2026-09-01 — Mandatory address parts (checked by `doesAddressExist`): **address line 1** (max 150 chars), **city** (max 50), **state**. Optional: address lines 2 and 3 (150 each), postal code (5). `state_code` and `country` are derived, not keyed. If any of the three mandatory parts is blank the document is routed to a pool rather than submitted. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#mandatory-address-fields]
- 2026-09-01 — Which address is used: when the buyer/supplier comes from an entity record, the first address with `default_einvoice_address = true` in the order **shipping → billing → main**. When the party comes from a temporary entity JSON on the document, that JSON's `addresses_json` is used verbatim. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#einvoice-address-construction]
- 2026-03-03 — Customers with several address types asked for a configurable "custom address type" on the supplier applet so that a *Billing Address (E-Invoice)* can be distinguished from the ordinary company address, with the shipping address carrying `default_einvoice_address = true`. [src:gh:bigledger/blg-intranet#1818]

### The state-code ladder

- 2026-09-01 — Country is resolved from `einvoice_country`, then `country`, then defaults to `MYS`; the raw value is uppercased and stripped of non-alphanumerics, then matched as an ISO-3 code, an exact country name, or a partial name match, falling back to `MYS`. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#country-code-extraction]
- 2026-09-01 — For a **foreign** address the state code is the state text itself, or the country code when the state is blank. For a **Malaysian** address a blank state leaves the state code empty and the user must key it. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#state-code-validation-and-construction]
- 2026-09-01 — Four-step matching for Malaysian states: (1) exact match on the LHDN state name; (2) cleaned match after stripping non-letters and collapsing whitespace; (3) contains-match in either direction (so "Kuala Lumpur" matches "Wilayah Persekutuan Kuala Lumpur"); (4) alias resolution. If all four fail the state code is left empty. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#state-matching-strategy]
- 2026-09-01 — Recognised aliases: KL / KUALA LUMPUR / WP KUALA LUMPUR / W.P. KUALA LUMPUR / WP KL / WPKL → 14; LABUAN / WP LABUAN / W.P. LABUAN → 15; PUTRAJAYA / WP PUTRAJAYA / W.P. PUTRAJAYA → 16; PENANG / PINANG / P PINANG / P. PINANG → 07; NS / N SEMBILAN / N. SEMBILAN / NEGERI SEMBILAN / SEREMBAN / N9 → 05; MALACCA / MELACCA → 04; TRENGGANU / TERENGANU → 11; JOHORE → 01; SELANGOR DARUL EHSAN / SEL / S.GOR / SGOR / S GOR → 10. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#state-alias-map]
- 2026-06-22 — Historical behaviour worth knowing when reading old data: the original state-code enhancement defaulted an unmatched or missing state to code **17 (Not Applicable)**. [src:gh:bigledger/blg-intranet#1925]
- 2026-07-04 — That default is no longer usable: LHDN rejects state code `17` for Malaysian and foreign transactions with `CV317`, and a consolidated submission failed on it because the *supplier* (company) address was sending 17. The system now always attempts to resolve a real code and leaves it blank rather than sending 17. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#lhdn-state-codes] [src:gh:bigledger/blg-akaun-platform-java#2070]

### How addresses go wrong in practice

- 2026-09-01 — After construction, `validateEInvoiceAddressJson` truncates every field to its maximum length and derives country and state code — so an over-long address line is silently shortened rather than rejected. [src:refs/blg-intranet/content/1100-malaysia-einvoice/README.md#address-validation-and-sanitization]
- 2026-06-22 — Repeated live pattern: a customer record with **no address at all** blocks the document ("client cannot do e-invoice because buyer address was not set"). [src:gh:bigledger/blg-intranet#1748]
- 2026-04-02 — After a mass address clean-up in a source system there was no way to re-run the check on documents already parked in the batch pool — a "trigger previous batch-pool transactions to re-validate the address" endpoint was requested, because asking a customer to open and resubmit each row individually is not workable. [src:gh:bigledger/blg-intranet#4378]
- 2026-04-02 — Related request: a bulk "update e-invoice address for all documents" action in the admin applet. [src:gh:bigledger/blg-intranet#4391]
- 2026-06-10 — POS: a retailer asked to be able to change the e-invoice address on a cash sale at the counter, because the address the customer gives for the e-invoice is not the one on file. [src:gh:bigledger/blg-intranet#1317]
- 2026-07-16 — For legacy-platform tenants, the address mapping is an ETL concern: one tenant's customer addresses were wrong in BigLedger until every synced customer's main address was remapped to both billing and shipping. [src:gh:bigledger/blg-intranet#127] [src:gh:bigledger/blg-intranet#111]

## How it connects

- **e-invoice-tin-and-identity-validation** — same master record, same fix screen; a pool row usually lists missing TIN *and* missing address together.
- **e-invoice-submission-errors** — an empty state code is a pool reason (nothing submitted); `CV317` is an Invalid result (submitted and rejected). Readers confuse the two.
- **organisation-applet** — the *supplier* address on every sales e-invoice is the company address; a bad company state code fails every document at once, which is what `CV317` on a consolidated submission looked like.
- **customer-maintenance / supplier-maintenance** — `default_einvoice_address` is the switch that decides which of several addresses is sent.
- **pos-general-applet** — counter staff capture the address that ends up on a B2C individual e-invoice.
- **emp-etl-sync** — synced addresses arrive in the legacy system's shape, including missing state.

## Open questions

- Is there now a supported way for a customer (not support) to re-validate parked pool documents after a master-data address fix? #4378 and #4391 were both still open.

## Wiki impact

- `einvoice-validation.md` — the state table is already there; add the alias list (readers type "KL" and "N9" and want to know it works) and correct any implication that code 17 is available.
- `einvoice-validation.md` — add "which address does BigLedger send?" (`default_einvoice_address`, shipping → billing → main). This is not stated anywhere in the guides today and it is the first question a multi-address customer asks.
- `my-e-invoice-admin-applet.md` — troubleshooting already covers the empty state code; add "the company's own address is the supplier address" for the all-documents-failing case.
