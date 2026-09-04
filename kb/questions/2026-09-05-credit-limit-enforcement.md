---
status: open
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
