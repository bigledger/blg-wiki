---
date: 2026-09-06
unit: guides-and-user-guide audit (110 pages)
adr: decisions/0008-verify-or-unpublish.md
backlog: audit-backlog.md
status: pass 1 complete (110 pages triaged); pass 2 partial — 6 pages rebuilt, 7 corrected, nothing unpublished
---

# `guides/` + `user-guide/` — the first audit these 110 pages have ever had

`planning/audit-backlog.md` flagged `guides/` (51 pages) and `user-guide/` (59) as the largest
never-verified block on the site with real inbound links and numbered procedures. This is the
result of opening all 110 against source.

## Pass 1 — the counts

| verdict | pages | share |
|---|---:|---:|
| **Sound** | 13 | 12% |
| **Needs correction** | 34 | 31% |
| **Substantially invented** | **63** | **57%** |
| total | 110 | |

Split by folder:

| | sound | needs correction | substantially invented | total |
|---|---:|---:|---:|---:|
| `guides/` | 11 | 11 | 29 | 51 |
| `user-guide/` | 2 | 23 | 34 | 59 |

**Weighted estimate of invented content across the 110 pages: 65–70%**, concentrated exactly where
the applet audit found it — in prose that explains *why* a document matters and *what the system
does when you save it*. The 13 sound pages are, without exception, pages another unit rebuilt from
source in the last 48 hours (the four accounting guides, eight e-invoice guides, `document-approvals.md`)
plus two video-catalogue pages that make no claims.

## The one error that runs through everything

**Documents are credited with stock and ledger effects they do not have.** The backend's
`ServerDocTypes` enum carries a quantity signum and an amount signum per document type, and both
are **0** for the documents these guides say do the work:

| document | signums | what the guides claim |
|---|---|---|
| `INTERNAL_PURCHASE_GOODS_RECEIVED_NOTE` | (0,0) | "updates inventory quantities", "creates accounting entries", `Dr Inventory / Cr GRN Accrual` |
| `INTERNAL_PURCHASE_ORDER` | (0,0) | statuses *Acknowledged / Sent / Fully Received* that do not exist |
| `INTERNAL_SALES_ORDER` | (0,0) | "a status change deducts inventory" |
| `INTERNAL_OUTBOUND_DELIVERY_ORDER` | (0,0) | "the DO reduces stock", "triggers invoice finalisation" |
| `INTERNAL_SALES_CREDIT_NOTE` | (0,−1) | used as the document that takes a physical return back into stock |
| `INTERNAL_PURCHASE_CONSIGNMENT_GRN` | (1,−1) | *inverted* — described as "a memo entry only, no expense recorded" |

The real posting documents — `INTERNAL_PURCHASE_INVOICE` (+1,−1) and `INTERNAL_SALES_INVOICE`
(−1,+1) — are barely mentioned. Consequence for a reader: goods received days ago and no stock;
stock balances drifting against physical count; returns that never come back into inventory.

Second in frequency: **approval described as a gate**, on document types with no approval engine
at all (sales orders, invoices, GRNs, journals, timesheets, BOMs, stock transfers, expense reports).
A remediation pass on 2026-09-06 (`f25a917f`) corrected roughly a dozen approval passages and
stopped before it reached `roles/`, `demo/`, `advanced/` and the sales guides — so several pages now
carry a correct callout and an incorrect workflow twenty lines apart.

## Pass 1 — per-page verdicts

### `guides/` (51)

| page | lines | steps | verdict | ~% invented |
|---|---:|---:|---|---:|
| `_index.md` | 169 | 14 | needs correction | 10 |
| `accounting-guides/_index.md` | 101 | 4 | needs correction | 5 |
| `accounting-guides/bank-reconciliation-guide.md` | 203 | 10 | **sound** | 0 |
| `accounting-guides/chart-of-accounts-setup.md` | 178 | 9 | **sound** | 0 |
| `accounting-guides/financial-reporting.md` | 173 | 10 | **sound** | 0 |
| `accounting-guides/journal-entries.md` | 164 | 9 | **sound** | 0 |
| `advanced/_index.md` | 163 | 19 | needs correction | 35 |
| `advanced/accounting-workflows.md` | 1149 | 59 | **invented** | 80 |
| `advanced/advanced-inventory-manufacturing.md` | 1274 | 90 | **invented** | 90 |
| `advanced/compliance-audit.md` | 1079 | 25 | **invented** | 85 |
| `advanced/financial-reporting-excellence.md` | 1278 | 18 | **invented** | 95 |
| `advanced/industry-specific-workflows.md` | 1424 | 51 | **invented** | 90 |
| `advanced/integration-best-practices.md` | 1451 | 52 | **invented** | 95 |
| `advanced/performance-optimization.md` | 1487 | 4 | **invented** | 100 |
| `content-guidelines.md` | 807 | 41 | needs correction | 20 |
| `document-approvals.md` | 285 | 13 | **sound** | 0 |
| `einvoice-guides/_index.md` | 139 | 4 | needs correction | 5 |
| `einvoice-guides/einvoice-cancel-and-correct.md` | 170 | 7 | **sound** | 0 |
| `einvoice-guides/einvoice-incoming-supplier.md` | 184 | 6 | **sound** | 0 |
| `einvoice-guides/einvoice-month-end.md` | 198 | 7 | **sound** | 0 |
| `einvoice-guides/einvoice-pools-and-routing.md` | 164 | — | **sound** | 0 |
| `einvoice-guides/einvoice-validation.md` | 249 | — | **sound** | 0 |
| `einvoice-guides/malaysia-e-invoice-guide.md` | 93 | 4 | needs correction | 5 |
| `einvoice-guides/myinvois-setup.md` | 171 | 7 | **sound** | 0 |
| `einvoice-guides/peppol-configuration.md` | 68 | 9 | **invented** | 70 |
| `inventory-guides/_index.md` | 95 | 5 | needs correction | 25 |
| `inventory-guides/stock-management.md` | 61 | 13 | needs correction | 40 |
| `inventory-guides/stock-transfer.md` | 74 | 19 | needs correction | 30 |
| `purchasing-guides/_index.md` | 308 | — | needs correction | 30 |
| `purchasing-guides/consignment-purchasing.md` | 619 | 67 | **invented** | 60 |
| `purchasing-guides/direct-grn-workflow.md` | 858 | 91 | **invented** | 55 |
| `purchasing-guides/direct-invoice-workflow.md` | 1105 | 115 | **invented** | 45 |
| `purchasing-guides/invoice-first-workflow.md` | 714 | 66 | **invented** | 60 |
| `purchasing-guides/standard-procurement-workflow.md` | 1225 | 147 | **invented** → **REBUILT** | 55 |
| `roles/_index.md` | 175 | 9 | **invented** | 60 |
| `roles/branch-manager.md` | 237 | 0 | **invented** | 100 |
| `roles/cashier.md` | 131 | 0 | **invented** | 100 |
| `roles/ecommerce-specialist.md` | 215 | 0 | **invented** | 100 |
| `roles/finance-manager.md` | 192 | 0 | **invented** | 100 |
| `roles/internal-audit.md` | 357 | 0 | **invented** | 100 |
| `roles/merchandising-manager.md` | 259 | 0 | **invented** | 100 |
| `roles/procurement-manager.md` | 323 | 0 | **invented** | 100 |
| `roles/warehouse-manager.md` | 202 | 4 | **invented** | 100 |
| `sales-guides/_index.md` | 304 | 4 | needs correction | 30 |
| `sales-guides/cash-sales-workflow.md` | 458 | 30 | **invented** | 70 |
| `sales-guides/credit-sales-workflow.md` | 938 | 59 | **invented** | 60 |
| `sales-guides/installation-scheduling-workflow.md` | 776 | 53 | **invented** | 85 |
| `sales-guides/instalment-sales-workflow.md` | 692 | 48 | **invented** | 90 |
| `sales-guides/partial-delivery-workflow.md` | 586 | 29 | **invented** | 65 |
| `sales-guides/returns-exchanges-workflow.md` | 701 | 59 | **invented** | 70 |
| `sales-guides/standard-sales-workflow.md` | 1690 | 109 | **invented** | 60 |

### `user-guide/` (59)

| page | lines | steps | verdict | ~% invented |
|---|---:|---:|---|---:|
| `_index.md` | 239 | 17 | needs correction | 15 |
| `administration/_index.md` | 192 | 4 | **invented** | 55 |
| `administration/group-listing.md` | 126 | 4 | **invented** | 70 |
| `administration/member-class.md` | 88 | 3 | needs correction | 35 |
| `administration/member-label-list.md` | 25 | 6 | needs correction | 10 |
| `administration/member-label.md` | 128 | 4 | needs correction | 40 |
| `administration/member-listing.md` | 39 | 6 | needs correction | 20 |
| `administration/team.md` | 200 | 9 | needs correction | 40 |
| `administration-v2/_index.md` | 176 | 0 | needs correction (Hextra HTML) | n/a |
| `basic-operations/_index.md` | 131 | 13 | needs correction | 20 |
| `basic-operations/creating-an-item.md` | 155 | 14 | **invented** | 55 |
| `basic-operations/document-item-maintenance.md` | 709 | 19 | **invented** | 85 |
| `basic-operations/document-item-types.md` | 491 | 37 | **invented** | 70 |
| `basic-operations/editing-an-item.md` | 254 | 8 | **invented** | 65 |
| `basic-operations/item-maintenance.md` | 315 | 8 | **invented** | 70 |
| `basic-operations-v2/_index.md` | 168 | 0 | needs correction (Hextra HTML) | n/a |
| `best-practices/_index.md` | 596 | 9 | **invented** | 90 |
| `daily-tasks/_index.md` | 170 | 3 | needs correction | 35 |
| `daily-tasks-v2/_index.md` | 634 | 0 | **sound** | 2 |
| `daily-tasks/creating-purchase-order.md` | 646 | 128 | **invented** → **REBUILT** | 45 |
| `daily-tasks/creating-sales-order.md` | 590 | 99 | **invented** | 50 |
| `daily-tasks/delivery-order-processing.md` | 196 | 22 | needs correction | 40 |
| `daily-tasks/goods-received-note.md` | 862 | 107 | **invented** → **REBUILT** | 65 |
| `daily-tasks/price-book.md` | 558 | 18 | **invented** | 75 |
| `daily-tasks/price-set.md` | 771 | 12 | **invented** | 85 |
| `daily-tasks/pricing-scheme.md` | 376 | 19 | **invented** | 80 |
| `daily-tasks/purchase-invoice-processing.md` | 837 | 88 | **invented** → **REBUILT** | 40 |
| `daily-tasks/purchasing-overview.md` | 435 | 34 | needs correction | 30 |
| `daily-tasks/sales-overview.md` | 597 | 62 | needs correction | 40 |
| `daily-tasks/sales-payment-collection.md` | 601 | 91 | needs correction | 45 |
| `daily-tasks/trip-listing-management.md` | 345 | 32 | **invented** | 65 |
| `demo/_index.md` | 348 | 9 | **invented** | 70 |
| `demo/apparel/_index.md` | 654 | 40 | **invented** | 90 |
| `demo/common-workflows/_index.md` | 826 | 75 | needs correction | 60 |
| `demo/distributors/_index.md` | 639 | 40 | **invented** | 85 |
| `demo/food-beverage/_index.md` | 1487 | 246 | **invented** | 90 |
| `demo/getting-started-demo/_index.md` | 473 | 42 | **invented** | 75 |
| `demo/manufacturing/_index.md` | 1136 | 154 | **invented** | 90 |
| `demo/retail/_index.md` | 977 | 77 | **invented** | 85 |
| `demo/role-based/_index.md` | 195 | 6 | needs correction | 60 |
| `demo/role-based/ceo-executive/_index.md` | 599 | 34 | **invented** | 90 |
| `demo/role-based/finance-manager/_index.md` | 519 | 33 | **invented** | 80 |
| `demo/role-based/operations-manager/_index.md` | 547 | 34 | **invented** | 85 |
| `demo/services/_index.md` | 883 | 85 | **invented** | 95 |
| `getting-started/_index.md` | 103 | 16 | needs correction | 25 |
| `getting-started/introduction.md` | 70 | 5 | needs correction | 25 |
| `getting-started/navigation.md` | 80 | 5 | **invented** | 90 |
| `getting-started/platform-overview.md` | 395 | 5 | **invented** | 75 |
| `getting-started-v2/_index.md` | 144 | 0 | needs correction (Hextra HTML) | n/a |
| `industry-solutions/_index.md` | 99 | 3 | needs correction | 30 |
| `industry-solutions/automotive-and-workshop.md` | 98 | 4 | **invented** | 60 |
| `industry-solutions/food-and-beverage.md` | 91 | 3 | **invented** | 55 |
| `industry-solutions/manufacturing-and-assembly.md` | 83 | 3 | needs correction | 35 |
| `industry-solutions/professional-services.md` | 83 | 3 | **invented** | 55 |
| `industry-solutions/retail-and-ecommerce.md` | 84 | 0 | needs correction | 30 |
| `industry-solutions/wholesale-and-distribution.md` | 83 | 0 | needs correction | 35 |
| `reports-analytics/_index.md` | 682 | 35 | **invented** | 90 |
| `reports-analytics-v2/_index.md` | 177 | 0 | **sound** | 5 |
| `troubleshooting/_index.md` | 388 | 49 | **invented** | 85 |

## Pass 2 — what was rebuilt

Four pages, all in the purchasing family, rebuilt from the verified `applets/purchase-workflow/*`
and `applets/finance/internal-purchase-invoice-applet` pages (which all carry `sources:` maps) plus
`ServerDocTypes.java` and `kb/topics/document-approval.md`. Each now carries a `sources:` map, the
GadgetSphere running example, outcome-first steps with real menu paths, *What success looks like*
and *Common mistakes*.

| page | was | now |
|---|---|---|
| `guides/purchasing-guides/standard-procurement-workflow.md` | 1,225 lines, 147 steps, USD, 18% tax, invented racking screen, invented payment-run module, GRN posting `Dr Inventory / Cr GRN Accrual` | ~200 lines, six steps, RM/6% SST, the two receipt-to-bill paths stated explicitly, real applet menus and buttons |
| `user-guide/daily-tasks/goods-received-note.md` | 862 lines, 107 steps, premised throughout on the GRN moving stock; 8 fabricated header fields, 4 fabricated GRN types, 5 fabricated statuses, a 6-level racking screen | ~150 lines, six steps, opens with what FINAL does and does not do; real tabs, real buttons, real serial-validation behaviour |
| `user-guide/daily-tasks/creating-purchase-order.md` | 646 lines, 128 steps, fabricated PO statuses, "Send to Supplier"/"Mark as Sent" buttons, three named fictional companies | ~150 lines, seven steps; real KO For / Multi-PO / Replenishment / Queue menus, CLOSE vs VOID explained |
| `user-guide/daily-tasks/purchase-invoice-processing.md` | 837 lines, 88 steps, a three-way-matching engine with variance flags and tolerance bands that does not exist, "Post Invoice" button, 18% tax | ~160 lines, six steps; the real knock-off mechanism, the real journal, the three FINAL errors by name |

Two more rebuilt in the same family, from the same source set:

| page | was | now |
|---|---|---|
| `guides/purchasing-guides/direct-grn-workflow.md` | 858 lines, 91 steps, GRN posting `Dr Inventory / Cr GRN Accrual` in three places, fabricated GRN Type / Receipt Mode / Reason Code fields, a "Convert to Invoice" button, three non-GadgetSphere businesses, a ">90% of spend" claim | ~130 lines, five steps; states plainly that skipping the order removes the only preventive control, and that the remarks field is the entire audit trail |
| `guides/purchasing-guides/direct-invoice-workflow.md` | 1,105 lines, 115 steps, self-contradicting on approvals (a correct callout followed by five invented routing sections), AWS and Salesforce named as customers, 53 USD amounts, 18% tax | ~140 lines, five steps; built on the real mechanism — Service and Account Code item types produce no inventory line, verified in `InventoryTransactionLineProcessorService.createInventoryTxnFromGenericDoc` |

### Corrections short of a rebuild

- `guides/purchasing-guides/_index.md` — replaced six invented report names with the five real ones,
  replaced the "three-way matching engine" section with what knock-off actually is plus a
  signum table, deleted the twelve invented KPIs, fixed the tolerance advice.
- `user-guide/daily-tasks/purchasing-overview.md` — replaced the fabricated navigation table with
  real applets and menus, replaced the hour-by-hour clock routines with who-does-what-in-what-order,
  deleted the KPI target table and the "? icon on every screen" claim.
- `guides/inventory-guides/_index.md` — the two tier-1 signum errors ("Purchase GRN updates stock
  automatically", "Sales DO reduces stock"), the costing-method list, and four broken applet links.
- `guides/inventory-guides/stock-management.md` — costing methods: FIFO / LIFO / moving average, not
  "FIFO / weighted average / standard cost / specific identification".
- `guides/accounting-guides/_index.md` — the one approval line ("Review and approve pending entries"
  for journals, which have no approval engine).
- `guides/einvoice-guides/_index.md` — the only relative internal link in the e-invoice set.
- The broken link `/applets/supplier-maintenance-applet/` → `/applets/master-data/supplier-applet-1/`,
  11 occurrences across 8 pages in scope. Eight more remain outside this unit's scope (in `modules/`,
  `applets/_index.md`, `applets/applet-catalog.md`) — recorded as F-0424. Plus three further broken
  targets on the purchasing landing page (`/applets/inv-item-maintenance-applet/`,
  `/modules/fixed-assets/`, `/modules/project-accounting/`).

Every internal link on every page this unit touched now resolves. `tests/content-lint.sh` passes.

## What I did *not* unpublish, and why

ADR-0008 guard rail 4 caps a single unpublishing at five pages. The honest reading of pass 1 puts
**far more than five** past the tier-1/tier-2 threshold — the `demo/` family alone is 13, `roles/`
is 9, `advanced/` is 7. So nothing was unpublished. The candidates are listed in
`planning/questions/INDEX.md` as Q-0111 … Q-0114 for Vincent's call.

## Method note for whoever picks this up

The four rebuilds took roughly the same effort each, and the reason they were possible at all is
that `applets/purchase-workflow/` had already been rebuilt from source and carries `sources:` maps.
**A guide can only be rebuilt where its applet pages have been.** The sales guides are the next
tranche and `applets/sales-workflow/` was being rebuilt by a concurrent unit on the same day — that
folder should be finished first, then the eight sales guides rebuilt from it in one pass.
`roles/`, `demo/` and `advanced/` have no applet substrate to rebuild from because the features they
describe do not exist; those are decisions, not writing tasks.
