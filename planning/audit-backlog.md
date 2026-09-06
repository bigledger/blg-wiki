---
date: 2026-09-06
adr: decisions/0008-verify-or-unpublish.md
method: "risk = actionability + 4 × inbound links; actionability = 3×numbered steps + menu paths + 4×endpoint mentions + system identifiers + 2×concrete numbers"
---

# The audit backlog — 498 pages nobody has checked

ADR-0008 keeps tier-3 pages live and queues them for audit. This is that queue, ordered so the
pages that can actually mislead someone are audited first.

## The numbers

| | pages |
|---|---:|
| `content/en` total | 618 |
| Verified (carry a `sources:` map) | 103 |
| Unpublished (`draft: true`) | 17 |
| **Never checked against anything** | **498** |

Of the 498, sorted by how much a reader could act on:

| | pages | what they are | ADR-0008 tier |
|---|---:|---|---|
| **Highly actionable** | **97** | Numbered procedures, menu paths, settings, amounts. A reader follows these. | Likely tier 2 if unconfirmable |
| Moderately actionable | 118 | Some instruction, mostly description | Judgement per page |
| Orientation only | 283 | What a module is for; no instruction to follow | Tier 3 — keep |

**97 highly actionable, never-verified pages is the real backlog.** The 283 orientation pages are
not urgent and ADR-0008 explicitly protects them.

## What the ranking already tells us

- **`/applets/sales-workflow/external-sales-invoice-applet/` is the single largest unverified
  instruction set on the site** — 3,555 lines and 302 numbered steps, in an applet folder the lanes
  never reached (lane 1 was drained before it got there). Every comparable page the lanes have
  opened so far was substantially invented.
- **The `user-guide/demo/*` family is dense with steps** — food-beverage alone has 246. These are
  the same family as `demo/education/`, which turned out to be a named prospect's tender material.
  **Checked today: no other demo page names a real organisation.** They use fictional businesses.
  That risk is closed; the accuracy risk is not.
- **`user-guide/daily-tasks/*` and `guides/*-guides/*` are procedure pages with real inbound links**
  — the pages a working reader is most likely to land on and follow.
- Several **`modules/` and `modules-v2/` pages are exact duplicates of each other** (the membership
  use-cases appear twice with identical size and step counts). Auditing one audits both, and the
  duplication is itself a finding.

## Programme order

1. **The 97 highly-actionable pages**, in the ranked order below. Each gets the applet-page
   treatment: verify against source, correct or unpublish per ADR-0008, add a `sources:` map.
2. **The duplicate `modules/` ↔ `modules-v2/` pairs** — resolve the duplication first so nothing is
   audited twice.
3. **The moderately-actionable middle**, opportunistically, when a unit is already in that area.
4. **Orientation pages** — only when a section is being restructured anyway.

## Top 40 by risk

| page | risk | inbound | lines | steps |
|---|---:|---:|---:|---:|
| `/applets/sales-workflow/external-sales-invoice-applet/` | 1573 | 0 | 3555 | 302 |
| `/user-guide/demo/food-beverage/` | 1115 | 3 | 1488 | 246 |
| `/guides/purchasing-guides/standard-procurement-workflow/` | 607 | 31 | 1226 | 147 |
| `/user-guide/demo/manufacturing/` | 532 | 4 | 1137 | 154 |
| `/applets/sales-workflow/internal-sales-grn-applet/` | 466 | 0 | 1091 | 122 |
| `/user-guide/daily-tasks/creating-purchase-order/` | 428 | 8 | 647 | 128 |
| `/guides/purchasing-guides/direct-invoice-workflow/` | 425 | 9 | 1106 | 115 |
| `/applets/finance/budget-applet/` | 412 | 4 | 1496 | 79 |
| `/guides/sales-guides/standard-sales-workflow/` | 411 | 10 | 1691 | 109 |
| `/guides/advanced/advanced-inventory-manufacturing/` | 402 | 0 | 1275 | 90 |
| `/applets/master-data/customer-applet/` | 393 | 48 | 338 | 48 |
| `/user-guide/demo/retail/` | 392 | 3 | 978 | 77 |
| `/user-guide/daily-tasks/goods-received-note/` | 359 | 9 | 863 | 107 |
| `/modules/membership/use-cases/fnb-membership/` | 347 | 0 | 701 | 85 |
| `/modules-v2/membership/use-cases/fnb-membership/` | 347 | 0 | 701 | 85 |
| `/user-guide/daily-tasks/purchase-invoice-processing/` | 342 | 10 | 838 | 88 |
| `/applets/membership/ocr-cash-bill-applet/` | 336 | 6 | 741 | 79 |
| `/guides/purchasing-guides/direct-grn-workflow/` | 333 | 13 | 859 | 91 |
| `/modules-v2/membership/use-cases/retail-loyalty-program/` | 330 | 0 | 597 | 83 |
| `/user-guide/demo/services/` | 326 | 4 | 884 | 85 |
| `/modules/membership/use-cases/retail-loyalty-program/` | 325 | 0 | 590 | 83 |
| `/user-guide/daily-tasks/creating-sales-order/` | 321 | 1 | 591 | 99 |
| `/modules-v2/financial-accounting/` | 305 | 44 | 528 | 33 |
| `/applets/sales-workflow/commission-scheme-applet/` | 304 | 7 | 599 | 38 |
| `/user-guide/daily-tasks/sales-payment-collection/` | 290 | 3 | 602 | 91 |
| `/guides/` | 290 | 59 | 170 | 14 |
| `/user-guide/demo/apparel/` | 287 | 3 | 655 | 40 |
| `/applets/sales-workflow/internal-outbound-delivery-order-applet/` | 287 | 22 | 516 | 54 |
| `/user-guide/demo/common-workflows/` | 282 | 4 | 827 | 75 |
| `/guides/advanced/industry-specific-workflows/` | 281 | 0 | 1425 | 51 |
| `/guides/advanced/integration-best-practices/` | 276 | 10 | 1452 | 52 |
| `/guides/purchasing-guides/invoice-first-workflow/` | 275 | 8 | 715 | 66 |
| `/guides/advanced/accounting-workflows/` | 275 | 2 | 1150 | 59 |
| `/user-guide/demo/distributors/` | 270 | 2 | 640 | 40 |
| `/applets/membership/voucher-management-applet/` | 265 | 23 | 494 | 20 |
| `/modules-v2/purchasing/` | 263 | 61 | 102 | 6 |
| `/modules/membership/use-cases/points-redemption/` | 260 | 0 | 633 | 34 |
| `/modules-v2/membership/use-cases/points-redemption/` | 260 | 0 | 633 | 34 |
| `/modules/budgetary/` | 259 | 13 | 1053 | 36 |
| `/guides/document-approvals/` | 257 | 42 | 286 | 13 |

## Highly actionable, remainder (rank 41 onward)

| page | risk | inbound | lines | steps |
|---|---:|---:|---:|---:|
| `/modules/membership/best-practices/program-design/` | 230 | 3 | 698 | 3 |
| `/guides/sales-guides/credit-sales-workflow/` | 227 | 6 | 939 | 59 |
| `/support/beginner-guide/cost-and-roi-questions/` | 225 | 0 | 540 | 5 |
| `/user-guide/demo/role-based/operations-manager/` | 224 | 3 | 548 | 34 |
| `/guides/sales-guides/returns-exchanges-workflow/` | 220 | 5 | 702 | 59 |
| `/modules-v2/membership/best-practices/program-design/` | 218 | 0 | 698 | 3 |
| `/modules/membership/getting-started/first-membership-program/` | 217 | 8 | 1248 | 42 |
| `/applets/applet-catalog/` | 215 | 5 | 429 | 62 |
| `/guides/sales-guides/installation-scheduling-workflow/` | 204 | 6 | 777 | 53 |
| `/applets/sales-workflow/internal-jobsheet-applet/` | 203 | 18 | 719 | 19 |
| `/support/beginner-guide/basic-business-operations/` | 201 | 0 | 564 | 55 |
| `/modules/membership/getting-started/` | 199 | 0 | 378 | 65 |
| `/modules/membership/getting-started/quick-start-guide/` | 195 | 3 | 411 | 58 |
| `/user-guide/demo/role-based/ceo-executive/` | 191 | 3 | 600 | 34 |
| `/guides/sales-guides/instalment-sales-workflow/` | 188 | 2 | 693 | 48 |
| `/modules/membership/use-cases/tiered-membership/` | 186 | 0 | 631 | 0 |
| `/modules-v2/membership/use-cases/tiered-membership/` | 186 | 0 | 631 | 0 |
| `/modules-v2/financial-accounting/opening-balance/` | 184 | 4 | 370 | 36 |
| `/user-guide/demo/role-based/finance-manager/` | 181 | 3 | 520 | 33 |
| `/user-guide/troubleshooting/` | 180 | 7 | 389 | 49 |
| `/modules/membership/use-cases/seasonal-campaigns/` | 176 | 0 | 827 | 0 |
| `/modules-v2/membership/use-cases/seasonal-campaigns/` | 176 | 0 | 827 | 0 |
| `/modules/membership/getting-started/installation-requirements/` | 174 | 8 | 753 | 41 |
| `/modules/membership/core-concepts/reward-types/` | 170 | 0 | 740 | 31 |
| `/modules-v2/membership/core-concepts/reward-types/` | 170 | 0 | 740 | 31 |
| `/guides/advanced/financial-reporting-excellence/` | 170 | 3 | 1279 | 18 |
| `/guides/advanced/compliance-audit/` | 167 | 6 | 1080 | 25 |
| `/applets/sales-workflow/internal-consignment-billing-applet/` | 166 | 9 | 706 | 26 |
| `/guides/content-guidelines/` | 158 | 1 | 808 | 41 |
| `/developers/integration/data-api/` | 154 | 10 | 331 | 0 |
| `/applets/manufacturing/process-maintenance-applet/` | 153 | 13 | 492 | 21 |
| `/developers/api-reference/einvoice-api-reference/einvoice-cancellation-and-rejection/` | 151 | 1 | 648 | 15 |
| `/modules/erp/` | 150 | 1 | 400 | 44 |
| `/developers/webhooks/` | 149 | 7 | 227 | 5 |
| `/support/beginner-guide/day-to-day-usage/` | 146 | 0 | 737 | 47 |
| `/modules/accounting/` | 142 | 1 | 764 | 23 |
| `/guides/sales-guides/partial-delivery-workflow/` | 140 | 7 | 587 | 29 |
| `/user-guide/demo/getting-started-demo/` | 138 | 3 | 474 | 42 |
| `/user-guide/daily-tasks/purchasing-overview/` | 137 | 4 | 436 | 34 |
| `/user-guide/reports-analytics/` | 137 | 7 | 683 | 35 |
| `/applets/inventory-workflow/delivery-installation-applet-V2-applet/` | 137 | 0 | 481 | 40 |
| `/developers/api-reference/ucc/ChannelController/` | 136 | 0 | 161 | 0 |
| `/applets/sales-workflow/internal-sales-inquiry-applet/` | 134 | 3 | 522 | 30 |
| `/applets-workflows/` | 128 | 2 | 639 | 26 |
| `/guides/sales-guides/cash-sales-workflow/` | 126 | 3 | 459 | 30 |
| `/user-guide/basic-operations/document-item-types/` | 119 | 2 | 492 | 32 |
| `/developers/api-reference/ucc/agent-controller/` | 116 | 1 | 225 | 0 |
| `/modules/membership/core-concepts/customer-membership-relationship/` | 114 | 0 | 460 | 27 |
| `/modules-v2/membership/core-concepts/customer-membership-relationship/` | 114 | 0 | 460 | 27 |
| `/user-guide/daily-tasks/trip-listing-management/` | 113 | 1 | 346 | 32 |
| `/applets/e-invoice/website-builder/user-permission-manager/` | 113 | 0 | 329 | 37 |
| `/developers/api-reference/ucc/action-controller/` | 112 | 1 | 223 | 0 |
| `/modules/service-industry/` | 111 | 1 | 366 | 34 |
| `/developers/api-reference/ucc/AgentVirtualContactSquadContactController/` | 108 | 0 | 253 | 0 |
| `/developers/api-reference/ucc/AgentVirtualContactSquadQrController/` | 108 | 0 | 253 | 0 |
| `/support/beginner-guide/malaysian-specific-questions/` | 106 | 0 | 623 | 20 |
| `/modules/journal/` | 101 | 0 | 677 | 24 |

## Notes on the method

`inbound` counts real links only — `](/url)` and `link="/url"` across all four languages. An
earlier pass counted substrings and made every section index look critical; it is fixed here.
Actionability is a proxy, not a judgement: a page with 300 numbered steps might be perfect. The
point is that nobody has ever checked, and the cost of being wrong scales with how much the reader
is told to do.
