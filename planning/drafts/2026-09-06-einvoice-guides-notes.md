---
date: 2026-09-06
unit: e-invoice guides, first pass in the AWS-standard working mode
plan: ../../kb/research/2026-09-06-blg-intranet-einvoice-ingest.md
facts: kb/topics/e-invoice.md + the ten e-invoice-* sibling notes
status: written, not shipped (no commit, no push, no hugo run)
---

# E-invoice guides — what was written, from what, and what was deliberately left out

Seven pages in `content/en/guides/einvoice-guides/` are now a set rather than a folder: a background
page, a setup guide, two routing/troubleshooting guides, the monthly cycle, the correction path, and
the (untouched, still blocked) PEPPOL page. Two of them are new.

---

## `_index.md` — corrected

**Plan items covered (item 1, all of them):**

- The **"Duplicate submission — system prevents duplicates; check submission history"** row is gone.
  Replaced with the truth: two Valid e-invoices for one sale is possible; find it by reconciling, not
  by reading Submission History; inside 72 hours cancel, after that credit note. The row also now
  leads with the *apparent* duplicate (shared numbering) because that is the commoner reading.
  → facts: `e-invoice-cancellation-and-credit-notes` (#5427), `e-invoice-self-billed` (#5588),
  `e-invoice-submission-errors`.
- The **"API timeout — retry after a few minutes"** row is gone. Replaced with "it is queued, not
  retrying — select it and press Submit, raise support if it recurs".
  → facts: `e-invoice-throughput-and-limits` (#5264), `e-invoice-submission-errors` (#5567, #5626).
- The **"Invalid tax code"** row now names the real failure: item classification code and taxable
  type, blank classification defaulting to `022 Others`, `004` always rejected on an individual
  e-invoice. → `e-invoice.md` line-default rules.
- **Deleted** "Compliance Dashboard" and "PEPPOL Transaction Log" from the reports list. The
  Reporting section now describes the three things that exist and how they differ: To IRB E-Invoice
  (live status), Submission History (snapshot — explicitly warned against), Discrepancies Report.
- **Added** the "nothing is submitted when you press Save" sentence under the daily workflow.
  → `e-invoice.md` required processors.
- **Added** cards for the two new guides, and a new "Every month" section for the month-end guide.

**Beyond the plan, on the same page:** three Related-Resources links were broken
(`/applets/e-invoice-admin-applet/`, `/applets/sales-invoice-applet/`,
`/applets/purchase-invoice-applet/`). Fixed to the real paths. The setup bullet list no longer
promises "MyInvois API credentials" and "digital certificate configuration" — see the setup note
below for why that had to move together.

**Softened, not rewritten:** the PEPPOL framing. The old text said PEPPOL "is optional and only
needed for cross-border B2B transactions", which the facts contradict (BigLedger files monthly
statistics on *domestic* Malaysian invoices carried over Peppol). The index now says PEPPOL is a
separate delivery channel set up alongside MyInvois, without making any claim the blocked
participant-ID question would touch.

---

## NEW `einvoice-month-end.md`

The plan's highest-value missing page, written to its six-part shape.

**Covered:** the 1st–7th framing and the per-company schedule a few days before the 7th; clearing the
Individual Pool first and the RM 10,000 escape being refused by the backend with its exact message;
the batch-pool **processed / failed** trap; consolidation as automatic with a manual fallback; the
To IRB E-Invoice vs Submission History distinction; the Invalid-list loop (export → look the tax
number up on the MyInvois portal → fix the *customer record* → Save and Resubmit) with the fact that
**resubmission keeps the original document date**; Bulk TIN Validation as the bulk path; the five
reasons a tally does not balance in support's checking order; and a "What success looks like" that is
four screens.

**Facts used:** `e-invoice-reconciliation` (the tally definition, the five reasons, ghost documents,
the LHDN-side blind spot), `e-invoice-consolidation` (schedule, backdated runs, foreign buyers),
`e-invoice-throughput-and-limits` (serial, one document per call), `e-invoice-submission-errors`
(Submission History snapshot, IN_QUEUE, retry counter), `e-invoice-tin-and-identity-validation`
(the month-end TIN loop).

**Deliberately not published**, per the plan's "do not publish" list: SQL, backoffice endpoints, the
per-tenant consolidation schedule table, and the push-failed-and-invalid-into-the-batch-pool
procedure (it needs a client confirmation step and a queue clean-up; it is support's, not the
customer's). Where a customer would need that procedure, the page says "raise a support request" and
says what to put in it.

**Softened because the number is not confirmed:** throughput. The page says submission is serial, one
document per LHDN call, that a month-end batch is measured in hours, and to "plan on a few hundred
documents an hour and start on the 1st". It does not publish the measured 100-per-2-hours figure from
one tenant, nor the 600–3,000/hour ceiling, because
`kb/questions/2026-09-06-einvoice-submission-batching-status.md` is open and the batching fix may have
landed. **This is the one sentence to revisit when that question is answered.**

---

## `einvoice-validation.md` — extended and restructured

**Plan items covered (item 4, all five):**

- **The identity-format class** is now the first substantive section, with the measured shape
  (426 of 448; 322 / 82 / 20) anonymised to "one large multi-company customer", the reader-facing rule
  (Passport for non-Malaysians, BRN for a company, NRIC as 12 digits with no dashes, type it don't
  paste it), the zero-width-character case, and the two codes `CF324` / `CF358`.
- **Which address BigLedger sends** — new section: first address flagged as the e-invoice address, in
  the order shipping → billing → main; a document-level address is used verbatim; and the "your own
  company address is the supplier on every sales e-invoice" case for all-documents-failing.
- **The alias list** for state names (KL, WPKL, N9, Johore, Malacca, Sgor …) is now published, and the
  page states plainly that there is **no code 17 fallback** — `CV317`.
- **Real vs apparent duplicate** — the duplicate section now leads with the apparent case (two
  independent number sequences, listing does not show direction, "check the document type before
  cancelling anything") including the 129-e-invoices near-miss, anonymised.
- **`DR308` added beside `DR303`**, with the distinction spelled out (the buyer must match, not just
  the reference).
- **The 72-hour sentence corrected**: the clock runs from the validation time recorded on the
  e-invoice, in UTC, and can be earlier than the portal appears to show — compute it from the record.

**Also done, to pass CLAUDE.md's self-check:** the page had no worked example, no screenshot, no
"what success looks like" and no "common mistakes". All four added, plus a GadgetSphere opening and a
"two kinds of failure" concept section (held-before-submission vs submitted-and-Invalid), which is the
distinction the topic notes say readers confuse. Two field tables were converted to prose to stay
under the three-table limit.

**Not claimed:** that BigLedger cleans up hyphens or invisible characters for you. The page tells the
reader to key it clean, because
`kb/questions/2026-09-06-einvoice-identity-normalisation-status.md` is open. If normalisation has
shipped, this section gets shorter and friendlier.

---

## NEW `einvoice-cancel-and-correct.md`

Written to the plan's six-part shape.

**Covered:** Save-and-Resubmit is refused on Valid (and on Submitted) with the actual message; the
72-hour window and where the clock starts; the three-step manual request workflow with the plain
statement that **nothing advances it automatically**; the four processing-logic options in
plain English with the identifier in brackets; the consolidated case; the credit-note path past
72 hours with the accountant caveat; the `DR303`/`DR308` reference problem and its two ways out; and
the fact that a **buyer's rejection on the tax portal does not come back into BigLedger**.

**Facts used:** `e-invoice-cancellation-and-credit-notes` throughout, plus
`e-invoice-submission-errors` (#5415 guard) and `e-invoice-self-billed` (#5588 numbering).

**Written to the blocked branch, deliberately.** The plan says: if cancel-for-edit-and-resubmit is
still missing from the Processing Logic dropdown, the guide must say "raise a support request
immediately, the window is 72 hours".
`kb/questions/2026-09-06-einvoice-consolidated-cancellation-ui.md` is open, so Step 5 is written to be
correct **either way**: it names the option, and says that if it is not available to you, raise a
support request straight away and do not experiment with the others. When the question is answered,
that paragraph is a one-line edit.

**Not published:** the direct bulk-cancellation path with its hard-coded reason, and the
re-consolidate-from-an-explicit-list procedure. Both are support actions; the page says so and says
to ask for them in the same request.

**Screenshots used** (both already published on the applet page, both re-checked before use — TESTING
/ STAGING tenant, generic company and branch names, no personal names, tax numbers, e-mails or
credentials): `cancellation-rejection-requests.png` and `cancellation-queue-details.png`.

---

## `einvoice-pools-and-routing.md` — extended

**Plan items covered (item 6, all four plus the correction):**

- Consolidation is now described as **processor-driven on a per-company schedule**, triggered
  deliberately a few days before the 7th, with the applet buttons as the manual fallback.
- **By document vs by branch** described side by side, in the terms a customer can see (one line per
  receipt vs one line per consecutive number range, the 200-line ceiling).
- **A consolidated e-invoice cannot carry a foreign buyer** — added as a warning, with the Passport +
  individual workaround.
- **The batch-pool trap** added to the FAQ, in the reader's own words ("I fixed a row and resubmitted
  it and it failed — will consolidation still pick it up?").
- **Corrected:** the RM 10,000 callout no longer says "an LHDN rule (in force since January 2026)".
  It now says only that the threshold is inclusive, which is what the internal material supports.

**Left out on purpose:** any recommendation of by-document vs by-branch.
`kb/questions/2026-09-06-consolidation-by-document-vs-by-branch.md` is open, so the page says the
choice is configured for you and tells the reader to ask which one they are on. The one leaning it
gives ("by-branch keeps each branch's month readable as its own block") is descriptive, not a
recommendation.

**Also removed a contradiction the sources contain.** The internal README says by-branch grouping is
what makes separate consolidated e-invoices for local / foreign / government counterparties possible;
the August project note says a consolidated e-invoice cannot contain a foreign buyer. Rather than
publish both, the page publishes only the customer-facing rule (foreign buyer → Passport →
individual). **Worth resolving** — see "Needs a decision" below.

**Also added, for the self-check:** a GadgetSphere framing paragraph, the "nothing is submitted when
you press Save" callout, one screenshot, "What success looks like", "Common mistakes" and a Related
documentation block.

---

## `malaysia-e-invoice-guide.md` — cleaned up and repositioned

**Plan item covered (item 10):**

- **All ~20 `<mcreference …>` tags deleted.**
- The page's job is now decided in favour of the plan's first option: it is *the* "what Malaysia
  requires" background page. Retitled **"What Malaysia Requires: E-Invoicing Explained"**, rewritten
  in our own voice rather than as a paraphrase of third-party summaries, and it keeps the five-phase
  table as the single timeline in the folder.
- The **55 fields / 37 mandatory / 18 optional** claim is kept (corroborated internally) and is now
  stated as such rather than footnoted to a tax blog.
- The **conflicting three-phase table in `myinvois-setup.md` is deleted**, as the plan asked.
- Two corrections while rewriting: the digital-signing certificate is explicitly *not* a customer
  task, and the 72 hours is labelled as the cancellation/rejection window and not a submission
  deadline (the same error the plan flags on the module hub).

**External links:** none. The third-party citations were dropped rather than reproduced — the page now
points readers to LHDN's own guideline by name. This avoids adding four externally-hosted URLs to the
lychee link check for claims we would rather source from LHDN anyway.

---

## `myinvois-setup.md` — rewritten (beyond the listed scope; see below)

**Why it was touched.** It was not on this run's list. But the `_index.md` corrections replace
"obtain your MyInvois API credentials and configure a digital certificate" with "authorise BigLedger
as your intermediary" — and leaving the setup page telling readers to obtain a Client ID, a Client
Secret and to "generate certificates" would have left the section actively contradicting itself on
its own landing page. The intermediary model is well sourced; only the *permission list* is blocked.

**Plan items covered (item 2, everything that is not blocked):**

- Steps 1 and 2 replaced with the intermediary model: authorise on the MyInvois portal, BigLedger
  holds the credentials centrally, no certificate anywhere.
- Both customer-side failure modes added: **not enough permissions granted** (stated as "grant the
  full set", without listing them) and **the authorisation lapsing**, with its symptom
  (*"Access Token not available"*, everything failing at once, no data problem).
- The **enable-before-finalise ordering rule** is now its own step with the strongest warning on the
  page — a document finalised while the company is not enabled is dropped silently.
- Company identity, counterparty identity, item codes, and "the background processors are switched on
  for you during onboarding — the symptom of a missing one is documents stopping at a stage and never
  moving" all added, plus the new-tenant reference-list note.
- **Deleted** the fictitious "Step 4: Validation Rules" configuration block.
- **Deleted** `einvoice@bigledger.com`. The plan asked us to verify it routes; nobody has, and the
  sibling PEPPOL page carries a different address. Better absent than wrong.
- **Deleted** the conflicting three-phase timeline (now only in the compliance page).

**Still blocked:** the exact intermediary permission set
(`kb/questions/2026-09-06-myinvois-intermediary-permission-set.md`). The guide names the failure and
tells the reader to ask before saving the portal form. Publishing the list is the single biggest
remaining improvement to this page.

---

## Not started, as instructed

- **`einvoice-self-billed.md`** — blocked on `kb/questions/2026-09-06-einvoice-self-billed-scope.md`.
  Note that three of the pages written today now reference self-billed e-invoices in the
  shared-numbering warning; when the guide exists, those three sentences should link to it.
- **`peppol-configuration.md`** — untouched, blocked on
  `kb/questions/2026-09-06-peppol-participant-id-scheme.md`. It still carries the
  `0195:MYREGISTRATIONNUMBER` format, the non-existent "PEPPOL Settings" menu, and the unsourced
  seven-year archival claim. The `_index.md` framing was softened but the page itself was not opened.
- **`modules-v2/e-invoice/_index.md`** (plan item 9) and the **applet extensions** (item 11) were not
  in this run's scope. The only applet edit made was adding two links to
  `my-e-invoice-admin-applet.md`'s Related documentation so the new guides are reachable from the
  reference page.

---

## Claims in the plan that the topic notes could not fully support

1. **"A measured few hundred documents an hour"** as a publishable planning figure. The notes hold
   two different numbers (a 600–3,000/hour ceiling traced in June, and ~100 per 2 hours observed at
   one tenant in the August cycle) and an open question about whether batching has since shipped. The
   month-end guide gives shape and direction without a number to plan against. This is a real gap for
   a reader with 20,000 documents a month.
2. **By-branch consolidation producing separate e-invoices for foreign counterparties** vs **a
   consolidated e-invoice not being able to carry a foreign buyer.** Both are in the notes, from
   different sources, and they cannot both be the whole truth. Published only the customer-facing
   rule.
3. **The RM 10,000 threshold's legal status and date.** Treated internally as an LHDN rule but
   implemented as a literal for two document types. The guides state the behaviour, never the date.
4. **The intermediary permission set** — the notes say "the full set is required" and never say what
   it is.

## One deliberate deviation from CLAUDE.md's structure

`malaysia-e-invoice-guide.md` and `_index.md` have no "What success looks like" and no "Common
mistakes" section. Neither is a task guide: one is the section index, the other is background a reader
absorbs rather than performs. Forcing a 30-second success check onto "here is what LHDN requires"
would have been filler. Every page on which the reader actually *does* something — setup, pools,
validation, month-end, cancel-and-correct — has both sections, a worked GadgetSphere example, at least
one screenshot, and three field tables or fewer.

## Links and images

- Every internal link on the seven pages was checked against the file tree; all resolve, including
  the three cross-page anchors (`#mandatory-fields`,
  `#general-tins--when-you-dont-have-the-buyers-tin`, `#backdated-documents`).
- Four screenshots were reused from `static/images/my-e-invoice-admin-applet/`. Each was opened and
  checked before use: all are on a TESTING or STAGING tenant with generic company and branch names,
  and none carries a person's name, a tax number, an e-mail address or a credential.
- **No new images were copied into `static/`.** The plan's publishable list is still uncopied:
  `lhdn-core-workflow.png` (redraw preferred), the drawio source,
  `einvoice-entity-json-priority-chart.jpg` (better as a table) and `forex-error.jpg`. A later unit
  should copy those four. The two credential-exposing intranet screenshots remain a security matter,
  not a documentation one.

## Needs a decision

1. **Throughput** — what figure may we publish? (blocks one sentence in the month-end guide)
2. **Consolidated cancellation UI** — is the fourth processing-logic option in the dropdown?
   (blocks one paragraph in the cancel-and-correct guide)
3. **By-document vs by-branch** — is it a customer choice, and what do we recommend for a
   multi-branch retailer? And does by-branch really produce a foreign-counterparty consolidated
   e-invoice, given the rule that a consolidated e-invoice cannot carry a foreign buyer?
4. **The intermediary permission set** — publish it or not.
5. **Identity normalisation** — has hyphen and zero-width stripping shipped? The advice we publish
   inverts on the answer.
6. **`einvoice@bigledger.com`** was removed from the setup guide. If it routes, it should go back —
   on all the e-invoice pages, consistently.
