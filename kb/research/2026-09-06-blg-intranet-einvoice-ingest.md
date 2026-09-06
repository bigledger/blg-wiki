---
source: kb/sources/blg-intranet/ledger.jsonl — 561 e-invoice issues + 22 README sections + 12 assets, ingested 2026-09-06
scope: refs/blg-intranet/content/1100-malaysia-einvoice/ (README ~16,200 words, core-workflow drawio, 10 images, scenario CSV) and every blg-intranet issue matching einvoice/e-invoice/myinvois/lhdn/peppol
privacy: anonymised — no tenant, customer, person, bank or brand names; no tax numbers, document numbers or tax-authority identifiers. Everything identifying stays in kb/private/.
purpose: a writer's brief. Page by page, what to ADD, what to CORRECT (with the wrong sentence quoted), what to DELETE.
inbox: F-0217 … F-0231
---

# The blg-intranet e-invoice deep ingest — what the wiki should say

## What this ingest found, in one paragraph

The **applet pages are in good shape** — `my-e-invoice-admin-applet.md` and `mypeppol-admin-applet.md`
already carry most of the internal README's mechanics accurately. The **guides are not**. Four of the
six e-invoice guides were written before any of this material was read: `myinvois-setup.md` (273
words) describes a credential-entry setup that does not exist in the intermediary model BigLedger
actually uses; `peppol-configuration.md` (180 words) states a participant-ID format that contradicts
our own applet page; `malaysia-e-invoice-guide.md` is a third-party summary carrying broken
`<mcreference>` markup; and the section index's "frequent issues" table contains two statements that
are simply false. Meanwhile the material supports **three guides that do not exist at all** — the
month-end cycle, self-billed e-invoices, and cancelling a validated e-invoice — which together
account for the largest share of the 561 issues read.

Topic notes created: `e-invoice-tin-and-identity-validation`, `e-invoice-address-and-state-codes`,
`e-invoice-cancellation-and-credit-notes`, `e-invoice-self-billed`, `e-invoice-peppol`,
`e-invoice-throughput-and-limits`, `e-invoice-reconciliation`.
Extended: `e-invoice`, `e-invoice-consolidation`, `e-invoice-submission-errors`, `e-invoice-ocr-intake`.

---

## Priority order for the writer

| # | Page | Kind | Effort | Why first |
|---|---|---|---|---|
| 1 | `guides/einvoice-guides/_index.md` | correct | small | Two false statements on the landing page of the section |
| 2 | `guides/einvoice-guides/myinvois-setup.md` | rewrite | medium | Describes a setup that does not happen; the real setup has two failure modes entirely in the customer's hands |
| 3 | **NEW** `guides/einvoice-guides/einvoice-month-end.md` | new | large | The 1st–7th cycle is the single biggest recurring support load and has no page |
| 4 | `guides/einvoice-guides/einvoice-validation.md` | extend | medium | Strong page; missing the largest real failure class (identity formatting) |
| 5 | **NEW** `guides/einvoice-guides/einvoice-cancel-and-correct.md` | new | medium | 72-hour rule + credit-note path; today split across an applet reference table and a callout |
| 6 | `guides/einvoice-guides/einvoice-pools-and-routing.md` | extend | small | Accurate; needs the automation reality and the by-branch/by-document distinction |
| 7 | **NEW** `guides/einvoice-guides/einvoice-self-billed.md` | new (blocked) | medium | Blocked on kb/questions/2026-09-06-einvoice-self-billed-scope.md |
| 8 | `guides/einvoice-guides/peppol-configuration.md` | rewrite (blocked) | medium | Blocked on kb/questions/2026-09-06-peppol-participant-id-scheme.md |
| 9 | `modules-v2/e-invoice/_index.md` | correct | small | Three factual errors in the hub's tables and checklist |
| 10 | `guides/einvoice-guides/malaysia-e-invoice-guide.md` | clean up | small | Broken markup; overlapping scope with the section index |
| 11 | applet pages | extend | small | Targeted additions only; the pages are already strong |

---

## 1. `content/en/guides/einvoice-guides/_index.md`

### CORRECT

**Wrong sentence (frequent-issues table, "Duplicate submission" row):**
> "System prevents duplicates; check submission history"

Both halves are wrong. The duplicate guard was added on 2026-08-20 and covers the batch-pool push and
the consolidation sweep only — it was added *because* a document had already been submitted twice and
validated twice, and there is still no idempotency guard in the submission processor itself. And
Submission History is a snapshot taken at submission time, not the live status.
Replace with: *"Two Valid e-invoices for one sale is possible. Find it by reconciling, not by reading
Submission History. Inside 72 hours you can cancel one; after that it is a credit note."*
→ facts: `[src:gh:bigledger/blg-intranet#5427]` `[src:gh:bigledger/blg-intranet#5588]`
`[src:refs/…/README.md#handling-common-errors]`

**Wrong sentence ("API timeout" row):**
> "Check internet connectivity, retry after a few minutes"

The submission path has **no timeouts and no rate-limit back-off**; a hung call blocks the processor,
and the retry counter shown in the queue is never decremented. Telling a user to retry is wrong advice
today. Replace with: *"A row that has not moved by the next morning is not retrying on its own —
select it and press Submit, and raise a support request if it recurs."*
→ facts: `[src:gh:bigledger/blg-intranet#5264]` `[src:gh:bigledger/blg-intranet#5567]`
`[src:gh:bigledger/blg-intranet#5626]`

**Weak sentence ("Invalid tax code" row):** "Use only LHDN-approved tax codes (6%, 8%, Exempt, etc.)"
— the actual failure is the **item classification code** and the **taxable type code**, not the rate.
Blank classification defaults to `022 Others`; classification `004` on an individual e-invoice is
always rejected. → `[src:refs/…/README.md#line-default-rules]`

### ADD

- A card for the new month-end guide, and one for cancel-and-correct.
- One sentence under "Daily Tasks": *the system does not submit at the moment you save — a finalised
  document is queued, and a background processor sends it. Everything after Save happens in the
  background.* Half the "why isn't my e-invoice there" tickets are this expectation.
  → `[src:refs/…/README.md#required-processors]`

### DELETE

- "**Compliance Dashboard** — Percentage of compliant transactions" and "**PEPPOL Transaction Log**"
  from the Key E-Invoice Reports list: neither exists. The reports that do exist are the Discrepancies
  Report (Monthly Report menu) and the To IRB / Submission History exports.
  → `[src:refs/…/README.md#generating-reports]`

---

## 2. `content/en/guides/einvoice-guides/myinvois-setup.md` — rewrite

This page currently reads as if the customer obtains LHDN API credentials and types them into
BigLedger. That is not what happens for the overwhelming majority of tenants.

### CORRECT — the whole of "Step 1" and "Step 2"

**Wrong:**
> "Obtain credentials: Client ID, Client Secret, TIN Number / Generate certificates"
> "Navigate to E-Invoice → My E-Invoice Admin / Enter LHDN credentials"

What actually happens (issuer type `INTERMEDIARY`, the default and what most tenants use):

1. The customer logs in to the MyInvois portal and **authorises BigLedger as their e-invoice
   intermediary**, granting a specific set of permissions.
2. BigLedger holds the client credentials centrally, per environment — the customer never sees or
   enters them.
3. BigLedger generates an access token *on behalf of* the customer's tax number, keeps up to three
   rotating tokens per company and environment, and refreshes them every ~20 minutes.
4. There is **no certificate for the customer to upload anywhere in BigLedger.**

→ facts: `[src:refs/…/README.md#einvoice-issuer-type]` `[src:refs/…/README.md#how-the-intermediary-configuration-is-used]`

### ADD — the two failure modes that are entirely in the customer's hands

1. **Not enough permissions granted.** The commonest hard setup failure: when authorising BigLedger as
   intermediary, only one permission is ticked and every submission then fails.
   → `[src:gh:bigledger/blg-intranet#2048]` — **blocked on**
   kb/questions/2026-09-06-myinvois-intermediary-permission-set.md for the exact list.
2. **The authorisation lapses.** Seen repeatedly across tenants: an expired intermediary configuration
   stops every submission for that company until it is renewed. Symptom: everything fails at once with
   an authentication error, with no data problem on any document.
   → `[src:gh:bigledger/blg-intranet#1778]` `[src:gh:bigledger/blg-intranet#1749]` `[src:gh:bigledger/blg-intranet#1745]`

### ADD — what has to be complete before the first document is finalised

- **Company e-invoice status must be ENABLED *before* documents are finalised.** A document finalised
  while the company is not enabled is dropped silently — no queue row, no pool row, no error — and is
  lost until someone finds it by query and pushes it. This is the single most consequential ordering
  rule on the whole page. → `[src:gh:bigledger/blg-intranet#5618]`
- Company identity: tax number, ID type and value, registration number, service-tax number, industry
  classification code, business activity description, address (line 1 / city / **state**), phone of
  8–20 characters. These become the *supplier* block of every sales e-invoice, so one bad company
  field fails every document at once. → `[src:refs/…/README.md#individual-mapping]`
- Customer and supplier records: tax number, ID type, ID value, an address flagged as the e-invoice
  address, phone, e-mail. → `[src:refs/…/README.md#address-construction]`
- Item classification codes, e-invoice unit of measure and tax type on items — and, for expense lines,
  see the self-billed guide. → `[src:gh:bigledger/blg-intranet#5627]`
- **Background processors must be switched on for the tenant.** Enablement is a manual per-tenant
  configuration with no completeness check; a tenant created before a processor existed never gets it.
  Frame for the reader as: *this is done for you during onboarding — if documents stop at one stage
  and never move, that is what to report.* → `[src:gh:bigledger/blg-intranet#5625]` `[src:gh:bigledger/blg-intranet#106]`
- Reference data (industry classification, unit-of-measure lists) is **not** populated automatically on
  a new tenant. → `[src:gh:bigledger/blg-intranet#5665]`

### CORRECT — the implementation timeline

The page's three-phase table (Aug 2024 / Jan 2025 / Jul 2025 "all businesses") disagrees with the
five-phase table in `malaysia-e-invoice-guide.md`. Pick one, source it, and delete the other.
The five-phase version is the more recent of the two. → see item 10.

### DELETE

- "*For MyInvois support, contact einvoice@bigledger.com*" — verify the address still routes before
  keeping it; the same page pattern in `peppol-configuration.md` uses a different address.
- The "Step 4: Validation Rules — Set up validation: Mandatory fields, Tax calculations, Format
  requirements, Business rules" block. There is no such configuration step; validation rules are fixed
  in the backend. It reads as a task the reader must perform and it is not one.

---

## 3. NEW — `content/en/guides/einvoice-guides/einvoice-month-end.md`

The highest-value missing page. Roughly a third of the 561 issues read are month-end operations, and
the internal README's largest section is the step-by-step settle-and-resubmit procedure. The guide
should be the customer-facing half of that procedure — never the SQL, never the endpoints.

**Shape**

1. *What happens between the 1st and the 7th, and who does what.* Consolidated e-invoices for last
   month must reach the tax authority by the **7th**. Consolidation and submission now run on a
   per-company schedule set by BigLedger, typically a few days before the 7th so there is time to fix
   whatever comes back Invalid. → `[src:refs/…/README.md#consolidated-by-tenant]`
   `[src:gdrive:1hMhWYLFK2em4cqdU-P4oNt-jTpklJBEGdtO6V02YlG4]`
2. *Before the run: clear the Individual Pool.* Anything with a missing buyer identity is sitting
   there; anything below RM 10,000 you cannot complete can be moved to the Batch Pool to be
   consolidated instead — **but only before the run**. Above RM 10,000 that escape is refused by the
   backend. → `[src:refs/…/README.md#pools]` `[src:gh:bigledger/blg-intranet#5623]`
3. *After the run: work the Invalid list.* The loop is: export the Invalid rows, look each correct tax
   number up on the MyInvois portal, correct the customer record, Save and Resubmit. **Resubmitting
   keeps the original document date**, so a correction on the 3rd still belongs to last month.
   → `[src:gmail:1a066f3fb420ca81]`
4. *Reconcile.* Compare what you invoiced with what reached the tax authority, per document type. The
   five reasons the two sides differ, in the order support checks them: documents in the Individual
   Pool; batch-pool rows that are processed **but failed** (these are *not* swept into the monthly
   consolidation — the trap); documents in the Single General Pool; documents that never entered the
   pipeline at all; and **voided or draft documents that were never marked skip-e-invoice**.
   → `[src:refs/…/README.md#tallying-einvoice]`
5. *What "still in queue" means the next morning.* Submission is a background queue running at a
   measured few hundred documents an hour, one document per call. Plan accordingly and start early.
   → `[src:gh:bigledger/blg-intranet#5264]` `[src:gmail:1a05ff766425665d]` — **soft-blocked** on
   kb/questions/2026-09-06-einvoice-submission-batching-status.md for the number to publish.
6. *What success looks like* — a 30-second check: Batch Pool empty of unprocessed rows for last month;
   Individual Pool empty or actively chased; no Invalid rows left; the Discrepancies Report for the
   month balanced.

**Do not publish**: the SQL, the backoffice endpoints, the per-tenant schedule table, or the
"push failed and invalid into the batch pool and re-consolidate" procedure — that last one requires a
client confirmation step and a queue clean-up afterwards, and belongs to support.
→ `[src:refs/…/README.md#sql-based-documentation]`

---

## 4. `content/en/guides/einvoice-guides/einvoice-validation.md` — extend

Already the strongest guide in the folder. Four additions and one correction.

### ADD — the identity-format class (the largest real failure group)

The guide covers general-TIN misuse well but never mentions the format problems, which on one measured
tenant were **426 of 448 recorded rejections**:

- foreign customers keyed with ID type NRIC instead of PASSPORT (322 documents);
- national ID stored **with hyphens** (82 documents — and on that tenant *no* hyphenated ID ever
  passed, while 1,803 clean ones did);
- a business registration number typed into the national-ID field (20 documents);
- and, invisibly, a **zero-width character pasted into the tax-number field** from a browser or PDF —
  the field looks right on screen and is rejected every time.

Reader-facing rule: *ID type PASSPORT for anyone who is not Malaysian; BRN for a company; national ID
only as 12 digits with no dashes. Type it, don't paste it.*
→ `[src:gh:bigledger/blg-intranet#5567]` — see kb/questions/2026-09-06-einvoice-identity-normalisation-status.md
before promising that BigLedger cleans any of this up.

### ADD — which address BigLedger sends

Nothing on the wiki says this. The address used is the first one flagged as the e-invoice address, in
the order **shipping → billing → main**. A customer with several addresses cannot predict the outcome
without it. Include the alias list too — readers type "KL", "N9", "Johore", "Malacca" and want to know
those resolve. → `[src:refs/…/README.md#address-construction]`

### ADD — a "the same sale is at LHDN twice" section that distinguishes real from apparent

The guide's duplicate section assumes the duplicate is real. Add the apparent case: sales invoices and
self-billed purchase invoices draw numbers from **two independent sequences that both start at the
same value**, so the same number legitimately exists twice, and the submission listing does not show
the document type. *Check the document type before cancelling anything.* On one tenant a customer was
one step away from cancelling 129 valid e-invoices that were still inside their 72-hour window.
→ `[src:gh:bigledger/blg-intranet#5588]`

### ADD — the reference error has two codes, not one

`DR303` (referenced document's status) is covered. Add `DR308` — the note's **buyer must match** the
referenced invoice's buyer, not just the reference identifier. → `[src:refs/…/images/original-einvoice-error.jpg]`

### CORRECT

**Weak sentence:**
> "**Cancellation window:** a Valid e-invoice can be cancelled within **72 hours of validation**."

Add: the clock runs from the validation time recorded on the e-invoice, in UTC, and can be **earlier
than what the portal appears to show** — so compute the deadline from the e-invoice record, not from
memory. → `[src:refs/…/README.md#cancellation-and-rejection]`

---

## 5. NEW — `content/en/guides/einvoice-guides/einvoice-cancel-and-correct.md`

Today this is a table in an applet reference and a callout in the validation guide. It deserves a
guide because the decision tree is short, the stakes are high, and the wrong branch is unrecoverable.

**Shape**

1. *You cannot edit a validated e-invoice.* Save and Resubmit is refused on a Valid or Submitted
   e-invoice, by design. → `[src:gh:bigledger/blg-intranet#5415]`
2. *Inside 72 hours: cancel.* How to raise the request, and the fact that **nothing advances it
   automatically** — a request sits at requested/in-progress forever until a human approves it and
   chooses what happens to the source document. A request that "looks stuck" is almost always waiting
   for step 2. → `[src:refs/…/README.md#cancellation-and-rejection]`
3. *Consolidated e-invoices are different.* Only one of the four options works; the others fail before
   the tax authority is even called, because a consolidated e-invoice has no single source document to
   void. **Blocked** on kb/questions/2026-09-06-einvoice-consolidated-cancellation-ui.md — if the
   option is still missing from the dropdown, the guide must say "raise a support request immediately,
   the window is 72 hours". → `[src:gh:bigledger/blg-intranet#5427]`
4. *Past 72 hours: the credit-note path.* Issue a credit note referencing the wrong e-invoice's
   identifier; for a consolidated one the buyer is General Public. Get your accountant's agreement —
   usually the ledger is right and only the tax reporting is overstated. → `[src:refs/…/README.md#cancellation-and-rejection]`
5. *Getting the reference right.* A credit note pointing at an original that was rejected and then
   resubmitted is itself rejected, because the original now has a new identifier. Two ways out: point
   at the currently valid original, or clear the reference. → `[src:refs/…/README.md#handling-common-errors]` `[src:gh:bigledger/blg-intranet#1221]`
6. *What we cannot see.* If your buyer rejects an e-invoice on the tax portal, that rejection does not
   currently come back into BigLedger. → `[src:gh:bigledger/blg-intranet#4367]`

---

## 6. `content/en/guides/einvoice-guides/einvoice-pools-and-routing.md` — extend

Accurate throughout — the 23-scenario table matches the internal routing table exactly. Four additions.

- **The monthly consolidation is now processor-driven per company** (rolled out Aug–Sep 2026), with
  manual submission as the fallback, and it is triggered a few days before the 7th deliberately.
  → `[src:gdrive:1Ug3wpz2O8VmguwCf6jW9OEX8SMrBHOHAVJ_h0v-xsyA]` `[src:gdrive:1hMhWYLFK2em4cqdU-P4oNt-jTpklJBEGdtO6V02YlG4]`
- **Two consolidation methods exist and they look different to the customer.** By document = one line
  per receipt. By branch = one line per *consecutive range* of branch document numbers, capped at 200
  lines, and it produces separate consolidated e-invoices for local, foreign and government
  counterparties. A multi-branch retailer wants to know which they are on.
  → `[src:refs/…/README.md#consolidated-mapping]` — **blocked** on
  kb/questions/2026-09-06-consolidation-by-document-vs-by-branch.md for the recommendation.
- **A consolidated e-invoice cannot contain a foreign buyer.** Key the buyer with ID type PASSPORT and
  submit individually. → `[src:gdrive:1cO_Vud6CV9sgJLUY5RFbh4uDmhLT_ZD3tlUD3RnwQZ8]`
- **The batch-pool trap**, in the FAQ: a row you tried to fix and that failed the check again is
  marked *processed / failed* and will **not** be swept into the monthly consolidation. It is no
  longer waiting; it is stranded. → `[src:refs/…/README.md#tallying-einvoice]`

**Correct one thing:** the guide says the RM 10,000 threshold is "an LHDN rule (in force since January
2026)". The internal material treats the threshold as an LHDN rule but records the implementation as
an inclusive literal applied to two document types only. Do not date the rule unless the date can be
sourced from LHDN. → `[src:gh:bigledger/blg-intranet#5623]`

---

## 7. NEW (blocked) — `content/en/guides/einvoice-guides/einvoice-self-billed.md`

Self-billed e-invoices appear in the guides only as an item in a list of document formats, yet they are
a full pipeline with their own identity rules, their own consolidation grouping, their own share of the
reconciliation report and a steady support load.

**Blocked** on kb/questions/2026-09-06-einvoice-self-billed-scope.md (which document types, where the
flag is set, whether they can be consolidated, which LHDN scenarios our customers use it for).

Once unblocked, the content is ready: role reversal (your company is the buyer, the supplier is the
issuer of record), the foreign-supplier general tax number, the classification-code problem on expense
lines and where the code has to come from, and the numbering-collision warning.
→ `[src:refs/…/README.md#individual-mapping]` `[src:gh:bigledger/blg-intranet#5627]` `[src:gh:bigledger/blg-intranet#5588]`

---

## 8. `content/en/guides/einvoice-guides/peppol-configuration.md` — rewrite (blocked)

### CORRECT — the page's central instruction may be wrong

**Wrong (or at least contradicted by our own applet page):**
> "Your PEPPOL ID format: `0195:MYREGISTRATIONNUMBER` — 0195 = Malaysia country code"

`mypeppol-admin-applet.md` gives a different scheme, and the registration screen takes a *special
identifier* plus a *business identifier* rather than one concatenated string. Two Malaysian state
identifiers additionally require manual verification taking days.
**Blocked** on kb/questions/2026-09-06-peppol-participant-id-scheme.md. Do not rewrite until answered.
→ `[src:gh:bigledger/blg-intranet#1373]`

**Wrong navigation:** "Go to E-Invoice → PEPPOL Settings". The applet's menus are Posting Queue,
Waiting Queue, Internal Submission, External Reception, Peppol Config, Monthly Report, Settings.
There is no "PEPPOL Settings". → `[src:refs/blg-applet-wavelet-my-peppol-admin-applet]`

**Misleading framing** (also in `_index.md`): *"PEPPOL is optional and only needed for cross-border
B2B transactions."* The monthly statistics BigLedger files as an access point are Malaysian domestic
invoices under the Malaysian Peppol billing profile. Peppol here is a **delivery** channel to a trading
partner, domestic included. → `[src:gh:bigledger/blg-intranet#5693]`

### ADD

- One sentence that saves a support ticket: *a Peppol document waits on exactly the same master data as
  an LHDN e-invoice, and runs beside it — it does not wait for LHDN to validate.* A document stuck in
  the Peppol posting queue is also sitting in an e-invoice pool, for the same reason.
  → `[src:akaun-api/.../PeppolPostingQueueToWaitingQueueProcessor.java]`
- What the customer supplies (their participant ID, the counterparty's — with one marked default — and
  a KYC document) versus what BigLedger supplies (the access point, SMP registration, certificates,
  statistics reporting).
- The order reference: a purchase-order / sales-order number has to be carried onto the Peppol invoice
  or the network validation fails. → `[src:gh:bigledger/blg-intranet#4511]`

### DELETE

- "Archival (7 years)" under Compliance Requirements — unsourced, and a legal claim the wiki should not
  make without a citation.
- "Connect to PEPPOL test network / Exchange test documents" as a customer task. Testbed access is a
  service-provider activity; the route exists in the applet but its menu entries are commented out.

---

## 9. `content/en/modules-v2/e-invoice/_index.md` — correct

Three factual errors:

1. **Wrong:** "Standard B2B E-Invoice … Individual real-time clearance UUID mandatory **within 72
   hours**". 72 hours is the *cancellation / rejection* window after validation, not a submission
   deadline. → `[src:refs/…/README.md#cancellation-and-rejection]`
2. **Wrong (Go-Live Checklist):** "Digital signing certificate uploaded in MY E-Invoice Admin Applet"
   and "LHDN / PEPPOL production API access keys configured and verified". Neither is a customer task
   in the intermediary model: credentials are held centrally and the customer authorises BigLedger on
   the MyInvois portal instead. Replace both with "BigLedger authorised as your e-invoice intermediary
   on the MyInvois portal, with the full permission set". → `[src:refs/…/README.md#einvoice-issuer-type]` `[src:gh:bigledger/blg-intranet#2048]`
3. **Wrong (Validation Engine row):** the admin applet described as "Central management of digital
   signing certificates". It manages queues, pools, consolidation, cancellation and reconciliation —
   there is no certificate management screen in it. → `[src:refs/blg-applet-wavelet-my-invoice-admin-applet]`

**Add** one row to the four-document-types table or a note beneath it: for a self-billed e-invoice the
item classification code has to come from the GL/expense mapping, and today there is nowhere on the
legacy source side to store it. → `[src:gh:bigledger/blg-intranet#5627]`

---

## 10. `content/en/guides/einvoice-guides/malaysia-e-invoice-guide.md` — clean up

- **DELETE all `<mcreference link="…" index="N">N</mcreference>` markup** (≈20 occurrences). It is
  raw HTML from another tool and renders as literal text.
- Decide the page's job. Right now it duplicates the section index's compliance framing and is
  entirely sourced from third-party summaries. Either make it *the* single "what Malaysia requires"
  reference (and move the phase table here, deleting the conflicting one in `myinvois-setup.md`), or
  fold the useful parts into `_index.md` and delete the page.
- Its "55 mandatory data fields" claim is corroborated internally (55 fields, 37 mandatory, 18
  optional) — keep that, cite it properly. → `[src:gdrive:15mavZbELP3vYuQbSfc75t46qFFrzIvS2AmO-ctTcyC8]`

---

## 11. Applet pages — targeted additions only

### `applets/e-invoice/my-e-invoice-admin-applet.md`

- Troubleshooting, **new row**: *"The same document number appears twice in the submission listing"* →
  cause: sales invoices and self-billed purchase invoices use independent number sequences and the
  listing does not show the document type → fix: check the document type before concluding anything;
  do not cancel. → `[src:gh:bigledger/blg-intranet#5588]`
- Troubleshooting, **sharpen the existing "rows stay IN_QUEUE" row**: the displayed retry count is not
  real — nothing decrements it and nothing retries those rows.
  → `[src:gh:bigledger/blg-intranet#5567]`
- Screens table: say why **Validation Queue → Submit** is capped at 20 rows.
  → `[src:gh:bigledger/blg-intranet#5458]`
- Cancellation section: state plainly that **a rejection request never advances on its own**.
  → `[src:refs/…/README.md#cancellation-and-rejection]`
- Monthly Report → Discrepancies Report deserves more than a table row: it is the customer's only
  self-service reconciliation tool. → `[src:gh:bigledger/blg-intranet#3367]`

### `applets/e-invoice/mypeppol-admin-applet.md`

- Add the monthly statistics obligation in one line (it explains the Monthly Report menu).
  → `[src:gh:bigledger/blg-intranet#5693]`
- Add the order-reference requirement to Troubleshooting. → `[src:gh:bigledger/blg-intranet#4511]`

### `applets/e-invoice/my-e-invoice-portal-applet.md`

- The buyer-side rejection a customer raises here reaches the same manual approval queue — and a buyer
  rejection made on the tax portal instead does **not** reach BigLedger at all.
  → `[src:gh:bigledger/blg-intranet#4367]`

### `applets/e-invoice/my-einvoice-for-customer-and-supplier-applet.md`

Still carries a "work in progress" banner. It is the natural home for the self-billed workflow — hold
until kb/questions/2026-09-06-einvoice-self-billed-scope.md is answered, then write the two together.

---

## Image classification (all 10 assets in `content/1100-malaysia-einvoice/images/` + the drawio)

Recorded per-image in the ledger with `publish_verdict`. **Nothing was copied into `static/`.**

| Asset | Verdict | Why |
|---|---|---|
| `lhdn-core-workflow.png` | **Publishable** (redraw preferred) | System and table names only, no customer data. Already mirrored on the admin applet page. Redraw before publishing so the unexplained fourth branch can be resolved or omitted. |
| `flow-chart/lhdn-core-workflow.drawio` | **Publishable source** | Two pages; carries the tax authority's own guidance on caching identity-validation results. No customer data. |
| `einvoice-entity-json-priority-chart.jpg` | **Publishable** (better as a table) | Column names and tick/cross only. |
| `forex-error.jpg` | **Publishable as-is** | Tight crop of a validation error table; no names, numbers or identifiers. |
| `einvoice-date-and-time-documentation.jpg` | **Do not copy** | An excerpt of the tax authority's own SDK documentation. State the rule in our own words instead. |
| `E-inv 10K Simulation - Scenarios.csv` | **Content publishable** | The 23 scenarios are already the routing table in the pools guide. Sample document numbers are from a test tenant — drop the column. |
| `wrong-general-tin-usage.png` | **Do not publish** | Tenant name in the sidebar, real document numbers and amounts. **Worth re-shooting on a demo tenant** — the layout and the validation error table are the best single illustration of a rejected e-invoice we have. |
| `original-einvoice-error.jpg` | **Do not publish** | Real customer names, a registration number, a tax number, an e-mail address and tax-authority document identifiers. Re-shoot. |
| `get-doc-details.jpg` | **Do not publish** | Real company names, tax numbers and document identifiers. Not needed — it is a support/debug view. |
| `postman-environment-variables.jpg` | **DO NOT PUBLISH — LIVE CREDENTIALS** | Client ID, client secret and a bearer token are readable. **Flag for secret rotation.** |
| `postman-login-intermediary-system.jpg` | **DO NOT PUBLISH — LIVE CREDENTIALS** | A full bearer token and a real customer tax number are readable. **Flag for secret rotation.** |

---

## Not for the wiki

- SQL runbooks, backoffice endpoint paths and payloads, and the per-tenant consolidation schedule.
  These are support procedures; publishing them invites customers to attempt them.
- Credential storage and token-rotation internals — the customer-facing fact is "BigLedger submits on
  your behalf once you authorise it".
- Every per-tenant monthly submission record, tally and data-fix ticket (the bulk of the 561): read for
  the *shape* of the recurring work, never for their content.
- Non-e-invoice material caught by the search (inventory costing, voucher open-balance, application
  server hangs, an HR worklog audit, infrastructure logging) — ledgered as ignored or low.

---

## Needs Vincent

1. **Two internal screenshots expose live LHDN client credentials and bearer tokens** in a private but
   widely-readable repo (`postman-environment-variables.jpg`, `postman-login-intermediary-system.jpg`).
   Recommend rotating the secrets and replacing the images. This is the one finding that is not a
   documentation matter.
2. Do we publish the **intermediary permission set** a customer must grant on the MyInvois portal?
   (kb/questions/2026-09-06-myinvois-intermediary-permission-set.md) — biggest single win available to
   the setup guide.
3. **Peppol participant-ID scheme** — the guide and the applet page contradict each other and one of
   them is on the public site. (kb/questions/2026-09-06-peppol-participant-id-scheme.md)
4. **Self-billed scope** — needed before the guide can be written.
   (kb/questions/2026-09-06-einvoice-self-billed-scope.md)
5. How honest should the wiki be about **known limitations**? Three are material to a customer's
   planning: submission throughput, no ageing alert on parked high-value documents, and no pull of
   tax-authority-side documents (so a portal-created invoice never appears in a BigLedger report).
6. **By-document vs by-branch consolidation** — is this a customer choice, and what do we recommend
   for a multi-branch retailer? (kb/questions/2026-09-06-consolidation-by-document-vs-by-branch.md)
