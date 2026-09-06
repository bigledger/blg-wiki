---
status: answered
raised_by: Lane 4 (customer-maintenance-applet), 2026-09-05
topics: [customer-maintenance, sales-invoice, credit-limit]
who_can_answer: product owner / backend lead
---

# Does a customer credit limit hard-stop a sales document, or only warn?

The old Customer Maintenance page claimed a credit limit "hard-stops a sale". Lane 4 searched
`refs/blg-akaun-platform-java/javasdk` domain code and found **no enforcement** that blocks a
Sales Order / Sales Invoice on credit limit. Candidates not yet checked: the applet UI
(`internal-sales-invoice` / `internal-sales-order` components — a client-side warning?),
`akaun-api` controllers, and any `posting_final_json` or workflow rule. Until answered, the wiki
must not claim a hard stop. This is exactly the sales-invoice → credit-limit edge Vincent used as
the lateral-thinking example; it needs a definitive answer.

Checked so far: javasdk domain services (no match). To check: applet UI validators; akaun-api;
blg-intranet issues mentioning "credit limit".

## Answer (2026-09-06, from the Supplier applet rewrite — lane 4 run 26)

**Supplier side: no enforcement at all.** Supplier credit terms and limits exist on three table
tiers, are importable and reportable, and are read by nothing at posting time — no server-side
due-date derivation, no limit check.

**Customer side: there IS a block, but it is not a live check at save.** The one blocking
mechanism is customer-scoped: a nightly `is_customer` job plus four sales document types. So a
credit limit does not "hard-stop a sale" the way the old Customer Maintenance page claimed; the
block depends on a batch job having run, and only for those document types.

Wiki impact: the customer-maintenance page must describe the nightly-job mechanism and name the
four document types rather than implying a real-time hard stop; the sales guides must not promise
an at-save credit check. → new inbox item.

