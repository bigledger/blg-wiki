---
date: 2026-09-06
unit: translation-orphan sweep
scope: every page in content/zh, content/ms, content/ar (134 pages)
outcome: 58 pages recommended for unpublish (NOT actioned — over the ADR-0008 five-page guard rail); 16 pairings repaired; 1 lint added
routed_to: [planning/feedback/inbox.md F-0365..F-0372, planning/questions/INDEX.md Q-0070..Q-0073, planning/product/INDEX.md — nothing (no product defects found)]
---

# Translation orphan sweep — the webhook twin was not one page, it was a class

## Why this ran

On 2026-09-06 `content/en/applets/integrations/webhook-applet.md` was unpublished as ADR-0008
tier 1. Its Chinese twin stayed live for hours, still promising 自动重试 (automatic retries),
OAuth, 请求签名 (request signing), 200+ 事件类型 and 99.9%, because the English sits under
`applets/integrations/` and the Chinese under `applets/` — **a different relative path, so every
same-path twin check missed it**. It was caught by hand in the fabricated-API sweep (commit
`9044f00f`) and is `draft: true` today (`content/zh/applets/webhook-applet.md:11-13`).

That is a defect in how we check, not a defect in one page. This sweep paired **every** translated
page to its English counterpart by **basename and title**, not by directory.

## What the numbers are

| | pages | no same-path English twin |
|---|---|---|
| `zh` | 103 | 58 |
| `ms` | 24 | 11 |
| `ar` | 7 | 0 |
| **total** | **134** | **69** |

Path-orphaning turned out to be the smaller half of the problem. The larger half is **drift**: a
translated page that still pairs perfectly by path but was translated in 2025 and never touched
since, while the English underneath it was rebuilt from source.

**58 of 134 translated pages are currently publishing content the English no longer says.**

## The verdicts

| verdict | pages | what it means |
|---|---|---|
| A — already unpublished | 1 | the webhook twin; handled in `9044f00f` |
| B1 — unpublish (zh applets) | 24 | English rebuilt from source 2026-09-05/06; translation is 5–12 months older |
| B2 — unpublish (ms applets) | 10 | same cause |
| B3 — unpublish (zh, English page deleted) | 16 | the English equivalent was deleted or superseded between 2026-02 and 2026-06 |
| B4 — unpublish (zh/ms/ar) | 3 | carries the invented approval matrix the English dropped today |
| B5 — unpublish (zh) | 3 | tier-1 invented claims the English has never made |
| B6 — unpublish (zh guides) | 2 | the e-invoice guide underneath was rewritten |
| C — **repaired** | 16 | path-orphaned but faithful; pairing restored, no content change |
| D — keep, queue for audit | 59 | tier 3: orientation prose, or translation and English still agree |

## The exact unpublish list, with evidence

**Nothing below has been actioned.** ADR-0008 says stop and report past five pages; this is 58.
The mechanism for all of them is `draft: true` in place (the URL survives), except `zh/_index.md`,
which is a language root and cannot be drafted — see B5.

### B5 — three pages that are tier 1 on their own evidence

These are not "stale". They assert things the English has never said and we cannot evidence.

**1. `content/zh/_index.md` — the Chinese home page is a marketing page.**

The English home page was rebuilt on 2026-09-05 as a reader-intent hub (`content/en/_index.md:36-40`,
"What do you want to do?"). The Chinese one was never rebuilt and still claims:

- `content/zh/_index.md:3` — `description: 马来西亚领先的云端ERP平台，受到100万用户信赖` ("trusted by 1,000,000 users")
- `content/zh/_index.md:17` — `**受到100万用户信赖** • 100+ 集成模块`
- `content/zh/_index.md:145` — `**100万+** 马来西亚和东南亚的活跃用户`
- `content/zh/_index.md:146` — `**99.9%** 正常运行时间 SLA 保证` ("99.9% uptime SLA guarantee")
- `content/zh/_index.md:148` — `**24/7** 多语言本地支持`
- `content/zh/_index.md:20` — a "start free trial" button (`开始免费试用`) to `/zh/user-guide/introduction/`, **which does not exist**; Q-0024 records that there is no self-service sign-up that yields a tenant
- `content/zh/_index.md:61-63` — three cards to `/zh/partners/`, `/zh/partners/training/`, `/zh/partners/resources/`; **no `content/zh/partners` exists**

None of it appears in `content/en/_index.md`. Tier 1 (an SLA guarantee is a number a reader plans
against, and a contractual claim). It cannot be drafted without 404-ing `/zh/`. **Recommended
action: replace the body with the honest placeholder that `content/ms/_index.md` and
`content/ar/_index.md` already use** — "the English version is the most current and complete; other
languages are updated periodically" — which is true and costs nothing to maintain.

**2. `content/zh/developers/_index.md` — promises a developer platform that was unpublished today.**

- `content/zh/developers/_index.md:12` — `GraphQL端点` (GraphQL endpoints)
- `:17-20` — `JavaScript SDK`, `Python SDK`, `PHP SDK`
- `:36-37` — `沙盒访问` (sandbox access), `测试数据` (test data)

The English `developers/sdks.md`, `developers/getting-started.md`, `developers/tutorials.md`,
`developers/applet-development.md` and the nine `developers/api-reference/*.md` pages are all
`draft: true` as of 2026-09-06 (`a59fa3e8`, "unpublish 16 fabricated developer pages"). Q-0024
records that there is no sandbox environment. `content/en/developers/_index.md` was rewritten the
same day and now links only to the twelve paths that exist. Tier 1.

**3. `content/zh/user-guide/industry-solutions/_index.md` — a fabricated testimonial and ~31 invented statistics.**

- `content/zh/user-guide/industry-solutions/_index.md:72` — `**成功案例**："BigLedger将我们的维修厂从混乱变为有序。我们现在用同样的团队服务多50%的客户。" - Ahmad，老板` — a named customer testimonial
- `:66-69` — 40% shorter customer wait, 25% higher parts turnover, 60% higher satisfaction, 30% more repeat business
- `:117-120`, `:171-173` — the same shape for F&B and manufacturing

The English page is 101 lines and contains **no** `%` outcome claim and **no** testimonial (the only
`%` matches in `content/en/user-guide/industry-solutions/_index.md:14,28` are CSS gradient stops).
It was cut from 448 lines. CLAUDE.md forbids named customers; `tests/content-lint.sh` already lints
for named prospect organisations. Tier 1.

### B4 — the approval matrix the English removed today, still live in three languages

`f25a917f` ("docs: approvals are optional, and the wiki was documenting the wrong engine") replaced
an invented amount-routing table in `content/en/modules/financial-accounting.md:437-456` with the
measured rule: approvals exist only on Purchase Requisitions, Purchase Orders and Stock
Requisitions, they are off until someone creates an Approval Setting, and **a money figure does not
route a document to a different approver** — each level carries a Min Approval Amount and the
document must clear every level at or below its total.

Still live:

- `content/zh/modules/financial-accounting.md:274-283` — 审批矩阵: 采购订单 < 10,000元 主管 / < 100,000元 经理 / > 100,000元 总监 / 会计分录 任何 会计主管 / 付款 < 50,000元 应付主管
- `content/ms/modules/financial-accounting.md:206-212` — Matriks Kelulusan: Pesanan Pembelian < RM5,000 Penyelia / < RM50,000 Pengurus / Catatan Jurnal Mana-mana Pengawal
- `content/ar/modules/financial-accounting.md:172` — `مصفوفة الموافقة: موافقات مبنية على مبالغ المعاملات` ("Approval matrix: approvals based on transaction amounts")

All three teach amount-based routing on journals and payments, neither of which has any approval
step. Tier 2 — a reader configures a company from this.

### B1 — 24 Chinese applet pages whose English was rebuilt from source

Every one of these has an English counterpart that was rewritten to the applet reference standard
on 2026-09-05 or 2026-09-06 from the applet's own repository. The Chinese was last touched between
2025-09-22 and 2026-04-11. Churn figures are added/deleted lines in the English **since the
translation's last commit**, following renames.

| translated page | English counterpart | churn | tier-1 evidence found in the translation |
|---|---|---|---|
| `content/zh/applets/unified-contact-center-ucc-applet.md` | `applets/crm/unified-contact-center-ucc-applet.md` | 2090/2173 | `:620` ISO 27001 认证 + 银行级加密; `:17` 10× conversations, −75% response time; `:549-558` −75%/−60%/85%+/+40%/+25%/−50%/+200%. English (rebuilt from source today, 873→573 lines) contains **no** `%` claim and no certification claim. |
| `content/zh/applets/tenant-admin-applet.md` | `applets/external-tenant-admin/tenant-admin-applet.md` | 300/348 | `:32` 99.9% 正常运行时间保证 — English has none. |
| `content/zh/applets/t2t-admin-applet.md` | `applets/integrations/t2t-admin-applet.md` | 296/322 | `:77` **安全标准：SOC 2、ISO 27001 合规性就绪** — English (rebuilt from source today) has none. See Q-0006. |
| `content/zh/applets/workflow-design-applet.md` | `applets/master-data/workflow-design-applet.md` | 712/682 | `:169-170` 10%+ 折扣需要经理审批 / 20%+ 折扣需要主管审批 — discount-threshold approvals do not exist; the English page now carries an explicit callout that Workflow Design **is not** the approval engine. |
| `content/zh/applets/customer-maintenance-applet.md` | `applets/master-data/customer-maintenance-applet.md` | 426/453 | `:141`, `:291` GDPR 设置 / GDPR 合规 — the rebuilt English page has no GDPR mention at all. |
| `content/zh/applets/doc-item-maintenance-applet.md` | `applets/master-data/doc-item-maintenance-applet.md` | 1669/1375 | drift only |
| `content/zh/applets/chart-of-account-applet.md` | `applets/master-data/chart-of-account-applet.md` | 1583/1445 | drift only |
| `content/zh/applets/internal-payment-voucher-applet.md` | `applets/finance/internal-payment-voucher-applet.md` | 1276/946 | drift only |
| `content/zh/applets/supplier-applet-1.md` | `applets/master-data/supplier-applet-1.md` | 967/410 | drift only |
| `content/zh/applets/cashbook-applet.md` | `applets/master-data/cashbook-applet.md` | 936/841 | drift only |
| `content/zh/applets/internal-consignment-gin-applet.md` | `applets/inventory-workflow/internal-consignment-gin-applet.md` | 876/562 | drift only |
| `content/zh/applets/internal-sales-order-applet.md` | `applets/sales-workflow/internal-sales-order-applet.md` | 857/473 | drift only |
| `content/zh/applets/customer-consignment-applet.md` | `applets/sales-workflow/customer-consignment-applet.md` | 762/486 | drift only |
| `content/zh/applets/employee-applet.md` | `applets/master-data/employee-applet.md` | 599/257 | drift only |
| `content/zh/applets/stock-balance-applet.md` | `applets/inventory-workflow/stock-balance-applet.md` | 588/371 | drift only |
| `content/zh/applets/pricebook-applet.md` | `applets/master-data/pricebook-applet.md` | 435/119 | drift only |
| `content/zh/applets/driver-delivery-order-applet.md` | `applets/inventory-workflow/driver-delivery-order-applet.md` | 411/149 | drift only |
| `content/zh/applets/inv-item-maintenance-applet.md` | `applets/master-data/inv-item-maintenance-applet.md` | 391/297 | drift only |
| `content/zh/applets/stock-take-applet.md` | `applets/inventory-workflow/stock-take-applet.md` | 378/466 | drift only |
| `content/zh/applets/tax-configuration-applet.md` | `applets/master-data/tax-configuration-applet.md` | 235/305 | 9 `%` figures against 3 in the English |
| `content/zh/applets/sales-report-applet.md` | `applets/sales-workflow/sales-report-applet.md` | 202/483 | drift only |
| `content/zh/applets/related-applets-stock-balance.md` | `applets/inventory-workflow/related-applets-stock-balance.md` | 187/38 | drift only |
| `content/zh/applets/90-ecomsync-related-applets.md` | `applets/integrations/90-ecomsync-related-applets.md` | 144/13 | drift only |
| `content/zh/applets/voucher-management-applet.md` | `applets/membership/voucher-management-applet.md` | 271/77 | drift only (English rewritten 2026-06-27) |

### B2 — 10 Malay applet pages, same cause

| translated page | English counterpart | churn |
|---|---|---|
| `content/ms/applets/internal-payment-voucher-applet.md` | `applets/finance/internal-payment-voucher-applet.md` | 1276/946 |
| `content/ms/applets/supplier-applet-1.md` | `applets/master-data/supplier-applet-1.md` | 967/410 |
| `content/ms/applets/employee-applet.md` | `applets/master-data/employee-applet.md` | 599/257 |
| `content/ms/applets/stock-balance-applet.md` | `applets/inventory-workflow/stock-balance-applet.md` | 588/371 |
| `content/ms/applets/internal-consignment-gin-applet.md` | `applets/inventory-workflow/internal-consignment-gin-applet.md` | 404/562 |
| `content/ms/applets/stock-take-applet.md` | `applets/inventory-workflow/stock-take-applet.md` | 378/466 |
| `content/ms/applets/internal-sales-order-applet.md` | `applets/sales-workflow/internal-sales-order-applet.md` | 315/459 |
| `content/ms/applets/sales-report-applet.md` | `applets/sales-workflow/sales-report-applet.md` | 202/483 |
| `content/ms/applets/driver-delivery-order-applet.md` | `applets/inventory-workflow/driver-delivery-order-applet.md` | 188/148 |
| `content/ms/applets/voucher-management-applet.md` | `applets/membership/voucher-management-applet.md` | 271/77 |

Two of these (`driver-delivery-order-applet`, `internal-sales-order-applet`) show a 2026-09-05
commit date. That was the Indonesian-vocabulary batch (`d5858dbf`, 03:51), not a retranslation; the
English rebuild landed later the same day (`61f1ba51`, 10:25). The text under them is still the
February–April translation.

### B3 — 16 Chinese pages whose English page no longer exists

These have **no** English counterpart at any path. In every case the English page existed and was
deleted; the Chinese translation was never removed with it. They are the mirror image of the
webhook case: the English decided the page should not exist, and the translation kept publishing it.

| translated page | English page it translated | deleted in | superseded by |
|---|---|---|---|
| `content/zh/applets/supplier-maintenance-applet.md` (633 lines) | `applets/master-data/supplier-maintenance-applet.md` | `7e6aaf97` 2026-03-27 | `applets/master-data/supplier-applet-1.md` — and `content/zh/applets/supplier-applet-1.md` already exists, so the Chinese site publishes both |
| `content/zh/applets/einvoice-generation-applet.md` (453 lines) | `applets/e-invoice/einvoice-generation-applet.md` | `979799ad` 2026-04-02 | nothing under `applets/e-invoice/` |
| `content/zh/applets/employee-maintenance-applet.md` (324 lines) | `applets/master-data/employee-maintenance-applet.md` | `bb6eb9c9` 2026-06-19 "remove dup employee userguide" | `applets/master-data/employee-applet.md`; the zh twin of that also exists |
| `content/zh/applets/company-organization-applet.md` (112 lines) | `applets/master-data/company-organization-applet.md` | `d8e63580` 2026-04-13 | `applets/master-data/organisation-applet.md` |
| `content/zh/applets/branch-organization-applet.md` (74 lines) | `applets/master-data/branch-organization-applet.md` | `d8e63580` 2026-04-13 | same |
| `content/zh/applets/organization-applet.md` (74 lines) | `applets/master-data/organization-applet.md` | `d8e63580` 2026-04-13 | same |
| `content/zh/applets/location-organization-applet.md` (13 lines) | `applets/master-data/location-organization-applet.md` | `d8e63580` 2026-04-13 | same |
| `content/zh/applets/settings-of-organization-applet.md` (11 lines) | `applets/master-data/settings-of-organization-applet.md` | `d8e63580` 2026-04-13 | same |
| `content/zh/applets/pos-terminal-applet.md` (54 lines) | `applets/sales-workflow/pos-terminal-applet.md` | `ce301586` 2026-04-06 | `applets/sales-workflow/pos-general-applet.md` |
| `content/zh/applets/membership-admin-console-applet.md` (10 lines) | `applets/membership-admin-console-applet.md` | `f50c8e13` 2026-02-27 | `applets/membership/membership-admin-applet.md` |
| `content/zh/applets/introduction-to-membership-admin-console-applet.md` (12 lines) | `applets/introduction-to-membership-admin-console-applet.md` | `f50c8e13` 2026-02-27 | same |
| `content/zh/applets/process-monitoring-applet.md` (9 lines) | `applets/manufacturing/process-monitoring-applet.md` | `6ba67a61` 2026-03-11 | `applets/manufacturing/production-planning-and-monitoring-applet.md` |
| `content/zh/applets/related-applets-process-monitoring.md` (11 lines) | `applets/manufacturing/related-applets-process-monitoring.md` | `6ba67a61` 2026-03-11 | same |
| `content/zh/applets/related-applets-internal-job-order.md` (11 lines) | `applets/manufacturing/related-applets-internal-job-order.md` | `6ba67a61` 2026-03-11 | same |
| `content/zh/applets/internal-stock-adjustment-applet.md` (10 lines) | `applets/inventory-workflow/internal-stock-adjustment-applet.md` | `0cbb84a8` 2026-06-29 "Remove duplicate stock adjustment stub pages" | `applets/inventory-workflow/stock-adjustment-applet.md` |
| `content/zh/applets/related-applets-internal-stock-adjustment.md` (16 lines) | `applets/inventory-workflow/related-applets-internal-stock-adjustment.md` | `0cbb84a8` 2026-06-29 | same |

None of these is a "translation of a page that never existed in English" — that category came back
empty. All 16 had an English original that was deliberately removed.

The three long ones (`supplier-maintenance-applet` 633 lines, `einvoice-generation-applet` 453,
`employee-maintenance-applet` 324) are the actionable ones: they are full procedure pages for
screens whose English documentation was retired 3–6 months ago, and nobody has read them since.
The thirteen short ones are stubs and could equally be moved to `planning/archive/`.

### B6 — two Chinese e-invoice guides rewritten underneath

| translated page | English counterpart | churn since translation |
|---|---|---|
| `content/zh/guides/einvoice-guides/einvoice-validation.md` | `guides/einvoice-guides/einvoice-validation.md` | 310/132 |
| `content/zh/guides/einvoice-guides/einvoice-pools-and-routing.md` | `guides/einvoice-guides/einvoice-pools-and-routing.md` | 183/19 |

These pair by path, so nothing flagged them. The English pair was rewritten across 2026-09-06
(`docs: e-invoice concepts layer`, `docs: incoming supplier e-invoices — teach what actually
works`); the Chinese is from 2026-07-14. E-invoice guidance is the most actionable material on the
site — a reader files to LHDN from it — and Q-0005 records that by-branch consolidation is still
contested in the English. Tier 2.

## What was repaired (no unpublishes, no content changed)

16 Chinese pages were path-orphaned **and faithful**: the English page moved during the
2026-02/2026-04 applet regrouping and the translation still matches it line for line
(`content/zh/applets/accounts-receivable-applet.md` and
`content/en/applets/finance/accounts-receivable-applet.md` are the same 53-line stub in two
languages). Churn since the translation is 0–5 lines, all of it front-matter and alias edits.

**Repair used: `translationKey`, not `git mv`.** Adding `translationKey: <slug>` to both files makes
Hugo pair them regardless of path, which is what restores the language switcher. The alternative —
moving the Chinese files to mirror the English tree — was rejected for this unit because it would
have (a) changed 16 public `/zh/` URLs, (b) required eight new Chinese section `_index.md` files
(`applets/finance/`, `applets/crm/`, `applets/master-data/`, …), which means authoring translated
content, and this unit does not author translations, and (c) pre-empted a structural question that
belongs in an ADR. See **Q-0060**.

| Chinese page | now paired with |
|---|---|
| `content/zh/applets/accounts-receivable-applet.md` | `content/en/applets/finance/accounts-receivable-applet.md` |
| `content/zh/applets/general-ledger-applet.md` | `content/en/applets/finance/general-ledger-applet.md` |
| `content/zh/applets/ai-customer-analytics-applet.md` | `content/en/applets/crm/ai-customer-analytics-applet.md` |
| `content/zh/applets/team-maintenance-applet.md` | `content/en/applets/crm/team-maintenance-applet.md` |
| `content/zh/applets/introduction-to-team-maintenance-applet.md` | `content/en/applets/crm/introduction-to-team-maintenance-applet.md` |
| `content/zh/applets/installation-of-team-maintenance-applet.md` | `content/en/applets/crm/installation-of-team-maintenance-applet.md` |
| `content/zh/applets/ecommerce-catalog-applet.md` | `content/en/applets/ecommerce/ecommerce-catalog-applet.md` |
| `content/zh/applets/installation-of-pricebook-applet.md` | `content/en/applets/ecommerce/installation-of-pricebook-applet.md` |
| `content/zh/applets/group-maintenance-applet.md` | `content/en/applets/master-data/group-maintenance-applet.md` |
| `content/zh/applets/installation-of-group-maintenance-applet.md` | `content/en/applets/master-data/installation-of-group-maintenance-applet.md` |
| `content/zh/applets/ingram-micro-ms-esd-applet.md` | `content/en/applets/integrations/ingram-micro-ms-esd-applet.md` |
| `content/zh/applets/vstecs-ms-esd-order-applet.md` | `content/en/applets/integrations/vstecs-ms-esd-order-applet.md` |
| `content/zh/applets/introduction-to-stock-take-applet.md` | `content/en/applets/inventory-workflow/introduction-to-stock-take-applet.md` |
| `content/zh/applets/internal-delivery-order-applet.md` | `content/en/applets/sales-workflow/internal-delivery-order-applet.md` |
| `content/zh/applets/membership-points-currency.md` | `content/en/applets/membership/membership-points-currency.md` |
| `content/zh/applets/membership-program.md` | `content/en/applets/membership/membership-program.md` |

Front matter of all 32 files re-parsed as valid YAML after the edit; `tests/content-lint.sh` passes.

## The lint

`tests/content-lint.sh` now carries a check that would have caught the webhook twin mechanically:

> **A published translated page must not share a basename with English pages that are *all* `draft: true`.**

The "all" matters. `content/zh/modules/inventory.md` shares a basename with
`content/en/developers/api-reference/inventory.md` (draft) **and** with
`content/en/modules/inventory.md` (live) — that is a legitimate pairing and is not flagged.
`_index.md` is skipped: the basename carries no identity.

Proven by re-flipping `content/zh/applets/webhook-applet.md` to `draft: false` — the lint fails with
that exact file and exits 1; restored to `draft: true` and it passes. Full run: 16 checks, all ok.

**What the lint still does not catch:** drift (B1/B2/B4/B6) and deleted-English orphans (B3). Both
are decidable mechanically, but a lint for either would fail today on 58 pages, so it is not
addable until the unpublish call is made. Once it is, two more checks belong here:

1. every translated page must have an English counterpart by basename (catches B3);
2. a translated page whose English counterpart has changed by more than *n* lines since the
   translation's last commit is stale (catches B1/B2/B6) — best as a warning with an allowlist,
   since translations are updated periodically by policy.

## Malay pages: Indonesian check

`content/ms` is **clean** against the CLAUDE.md blocklist. Zero hits across all 24 files for
*bisa, fitur, bisnis, inventaris, mengelola, pengiriman, melacak, kantor, uang, unduh, silakan,
karena, pengaturan*, and the `malay` allowlist in `tests/lint-allowlist.tsv` is now empty (0 exempt
files) — F-0002 and F-0003 were fixed and F-0001's page was archived in `d5858dbf`.

**The lint does cover the orphaned files.** `tests/content-lint.sh:19` greps `content/ms`
recursively, not a path-paired list, so all 11 path-orphaned Malay pages are inside its scope.
Confirmed by running it and by an independent per-file scan.

A wider scan for Indonesian markers not on the blocklist (*aktivitas, kualitas, manajemen, nomor,
tombol, berkas, jaringan, otomatis, metode, …*) found nothing either. Two apparent hits are false
positives and should **not** be added to the blocklist:

- *persediaan* (17 files) — used as "preparation" in headings like `Persediaan Awal` ("initial
  setup"), which is correct Bahasa Melayu; it is only Indonesian when it means "inventory".
- *perusahaan* (`content/ms/modules/_index.md:3`) — valid Malay for "enterprise/industry"; the
  Indonesian-only sense is "company", where Malay would use *syarikat*.

One hygiene item: **F-0001 is still open in the inbox** although its file
(`content/ms/applets/customer-consignment-applet.md`) was archived to
`planning/archive/content-ms-applets-customer-consignment-applet.md`. Recorded as F-0359.

## What this sweep did not find

- **No translation of a page that never existed in English.** All 16 no-counterpart pages had an
  English original that was deleted.
- **No fabricated API surface in any translated page.** `grep` for `/api/v1/`, `core1`,
  `*.bigledger.com` API hosts, invented auth headers and signed JWTs across `zh`, `ms`, `ar`:
  zero hits. The 2026-09-06 lints already cover all four languages (`tests/content-lint.sh:37-52`
  grep `content`, not `content/en`).
- **No quarantined screenshot still referenced from a translation.** Every `/images/…` path in
  `zh`, `ms` and `ar` resolves on disk, except 33 placeholder SVGs in
  `content/zh/applets/applet-store.md` — and `content/en/applets/applet-store.md` references the
  same 33 missing files, so that is an English defect the translation faithfully copied (F-0357).
- **No product defects.** Nothing in this sweep is a bug in BigLedger; nothing was filed to
  `planning/product/`.

## If the unpublish is approved

Each page needs a `planning/worklog/` entry per `planning/worklog/README.md`. For B1/B2/B6 the
entries are near-identical and can share a template: tier 2, mechanism `draft`, reason "the English
page underneath was rebuilt from source on <date>; this translation is from <date> and now
contradicts it", evidence the churn figure and the commit, salvage "none — the English page is the
salvage", `to_rewrite` "retranslate from the current English once a translation path exists
(Q-0061)". B3 needs one entry each naming the deletion commit. B5 needs three individual entries
with the claim-level evidence above.

**Retranslation is the open question.** We do not author translations (CLAUDE.md), so an unpublished
translation stays down until someone else produces one. 58 pages down means the Chinese site drops
from 103 to 45 pages and the Malay from 24 to 14. That is a real cost and it is Vincent's call, not
this unit's — hence Q-0061.

## Appendix — full classification, all 134 pages

Churn is added/deleted lines in the English counterpart since the translation's last commit,
following renames. A note on method: `git log --since=<bare date>` is an *approxidate* and silently
fills in the current time of day, which understates same-day churn to zero; every figure here was
computed with an explicit `YYYY-MM-DD HH:MM:SS`.

| lang | translated page | trans. last | English counterpart | en last | churn since trans | verdict |
|---|---|---|---|---|---|---|
| zh | `_index.md` | 2025-09-22 | `_index.md` | 2026-09-05 | 78/154 | B5 — UNPUBLISH: tier-1 invented claims, English says none of it |
| zh | `ai-intelligence.md` | 2025-09-22 | `ai-intelligence.md` | 2026-09-06 | 1/2 | D — keep (tier 3); queue for audit |
| zh | `api-reference/_index.md` | 2025-09-22 | `api-reference/_index.md` | 2026-09-06 | 13/20 | D — keep (tier 3); queue for audit |
| zh | `applets-workflows.md` | 2025-09-22 | `applets-workflows.md` | 2026-04-13 | 24/22 | D — keep (tier 3); queue for audit |
| zh | `applets/90-ecomsync-related-applets.md` | 2025-09-22 | `applets/integrations/90-ecomsync-related-applets.md` | 2026-09-05 | 144/13 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/_index.md` | 2025-09-22 | `applets/_index.md` | 2026-04-15 | 60/5 | D — keep (tier 3); queue for audit |
| zh | `applets/accounts-receivable-applet.md` | 2025-09-22 | `applets/finance/accounts-receivable-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/ai-customer-analytics-applet.md` | 2025-09-22 | `applets/crm/ai-customer-analytics-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/applet-catalog.md` | 2026-09-06 | `applets/applet-catalog.md` | 2026-09-06 | 0/0 | D — keep (tier 3); queue for audit |
| zh | `applets/applet-directory.md` | 2025-09-22 | `applets/applet-directory.md` | 2026-03-06 | 2/2 | D — keep (tier 3); queue for audit |
| zh | `applets/applet-store.md` | 2025-09-22 | `applets/applet-store.md` | 2026-06-22 | 4/4 | D — keep (tier 3); queue for audit |
| zh | `applets/branch-organization-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/cashbook-applet.md` | 2025-09-22 | `applets/master-data/cashbook-applet.md` | 2026-09-05 | 936/841 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/chart-of-account-applet.md` | 2025-09-22 | `applets/master-data/chart-of-account-applet.md` | 2026-09-05 | 1583/1445 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/company-organization-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/customer-consignment-applet.md` | 2026-02-23 | `applets/sales-workflow/customer-consignment-applet.md` | 2026-09-05 | 762/486 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/customer-maintenance-applet.md` | 2025-09-22 | `applets/master-data/customer-maintenance-applet.md` | 2026-09-05 | 426/453 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/delivery-installation-applet-V2-applet.md` | 2026-04-13 | `applets/inventory-workflow/delivery-installation-applet-V2-applet.md` | 2026-09-05 | 9/14 | D — keep (tier 3); queue for audit |
| zh | `applets/doc-item-maintenance-applet.md` | 2025-09-22 | `applets/master-data/doc-item-maintenance-applet.md` | 2026-09-05 | 1669/1375 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/driver-delivery-order-applet.md` | 2026-02-22 | `applets/inventory-workflow/driver-delivery-order-applet.md` | 2026-09-05 | 411/149 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/ecommerce-catalog-applet.md` | 2025-09-22 | `applets/ecommerce/ecommerce-catalog-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/einvoice-generation-applet.md` | 2025-11-18 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/employee-applet.md` | 2026-03-06 | `applets/master-data/employee-applet.md` | 2026-09-05 | 599/257 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/employee-maintenance-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/general-ledger-applet.md` | 2025-09-22 | `applets/finance/general-ledger-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/group-maintenance-applet.md` | 2025-09-22 | `applets/master-data/group-maintenance-applet.md` | 2026-03-06 | 1/1 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/ingram-micro-ms-esd-applet.md` | 2025-09-22 | `applets/integrations/ingram-micro-ms-esd-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/installation-of-group-maintenance-applet.md` | 2025-09-22 | `applets/master-data/installation-of-group-maintenance-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/installation-of-pricebook-applet.md` | 2025-09-22 | `applets/ecommerce/installation-of-pricebook-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/installation-of-team-maintenance-applet.md` | 2025-09-22 | `applets/crm/installation-of-team-maintenance-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/internal-consignment-gin-applet.md` | 2026-02-22 | `applets/inventory-workflow/internal-consignment-gin-applet.md` | 2026-09-05 | 876/562 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/internal-delivery-order-applet.md` | 2025-09-22 | `applets/sales-workflow/internal-delivery-order-applet.md` | 2026-04-13 | 5/5 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/internal-payment-voucher-applet.md` | 2026-03-09 | `applets/finance/internal-payment-voucher-applet.md` | 2026-09-05 | 1276/946 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/internal-sales-order-applet.md` | 2026-03-08 | `applets/sales-workflow/internal-sales-order-applet.md` | 2026-09-05 | 857/473 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/internal-stock-adjustment-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/introduction-to-membership-admin-console-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/introduction-to-stock-take-applet.md` | 2025-09-22 | `applets/inventory-workflow/introduction-to-stock-take-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/introduction-to-team-maintenance-applet.md` | 2025-09-22 | `applets/crm/introduction-to-team-maintenance-applet.md` | 2026-03-06 | 0/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/inv-item-maintenance-applet.md` | 2025-09-22 | `applets/master-data/inv-item-maintenance-applet.md` | 2026-09-05 | 391/297 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/location-organization-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/membership-admin-console-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/membership-points-currency.md` | 2025-09-22 | `applets/membership/membership-points-currency.md` | 2026-02-27 | 4/2 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/membership-program.md` | 2025-09-22 | `applets/membership/membership-program.md` | 2026-02-27 | 4/2 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/organization-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/pos-terminal-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/pricebook-applet.md` | 2025-09-22 | `applets/master-data/pricebook-applet.md` | 2026-09-05 | 435/119 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/process-monitoring-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/related-applets-internal-job-order.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/related-applets-internal-stock-adjustment.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/related-applets-process-monitoring.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/related-applets-stock-balance.md` | 2025-09-22 | `applets/inventory-workflow/related-applets-stock-balance.md` | 2026-09-05 | 187/38 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/sales-report-applet.md` | 2026-02-21 | `applets/sales-workflow/sales-report-applet.md` | 2026-09-05 | 202/483 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/settings-of-organization-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/stock-balance-applet.md` | 2026-03-10 | `applets/inventory-workflow/stock-balance-applet.md` | 2026-09-05 | 588/371 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/stock-take-applet.md` | 2026-04-11 | `applets/inventory-workflow/stock-take-applet.md` | 2026-09-05 | 378/466 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/supplier-applet-1.md` | 2026-03-27 | `applets/master-data/supplier-applet-1.md` | 2026-09-06 | 967/410 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/supplier-maintenance-applet.md` | 2025-09-22 | `—` | - | - | B3 — UNPUBLISH: English page deleted/superseded |
| zh | `applets/t2t-admin-applet.md` | 2025-09-22 | `applets/integrations/t2t-admin-applet.md` | 2026-09-06 | 296/322 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/tax-configuration-applet.md` | 2025-09-22 | `applets/master-data/tax-configuration-applet.md` | 2026-09-06 | 235/305 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/team-maintenance-applet.md` | 2025-09-22 | `applets/crm/team-maintenance-applet.md` | 2026-03-06 | 1/1 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/tenant-admin-applet.md` | 2026-09-06 | `applets/external-tenant-admin/tenant-admin-applet.md` | 2026-09-05 | 0/0 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/unified-contact-center-ucc-applet.md` | 2025-09-22 | `applets/crm/unified-contact-center-ucc-applet.md` | 2026-09-06 | 2090/2173 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/voucher-management-applet.md` | 2026-03-13 | `applets/membership/voucher-management-applet.md` | 2026-06-27 | 271/77 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applets/vstecs-ms-esd-order-applet.md` | 2025-09-22 | `applets/integrations/vstecs-ms-esd-order-applet.md` | 2026-09-05 | 2/0 | C — REPAIRED (pairing restored by translationKey) |
| zh | `applets/webhook-applet.md` | 2026-09-06 | `applets/integrations/webhook-applet.md` | 2026-09-06 | 0/0 | A — already unpublished (tier 1, commit 9044f00f) |
| zh | `applets/workflow-design-applet.md` | 2025-09-22 | `applets/master-data/workflow-design-applet.md` | 2026-09-06 | 712/682 | B1 — UNPUBLISH: English rebuilt from source 09-05/06 |
| zh | `applications/_index.md` | 2025-09-22 | `applications/_index.md` | 2025-09-17 | 0/0 | D — keep (tier 3); queue for audit |
| zh | `business-operations/_index.md` | 2025-09-22 | `business-operations/_index.md` | 2025-09-17 | 0/0 | D — keep (tier 3); queue for audit |
| zh | `demos-resources.md` | 2025-09-22 | `demos-resources.md` | 2025-08-21 | 0/0 | D — keep (tier 3); queue for audit |
| zh | `developers/_index.md` | 2025-09-22 | `developers/_index.md` | 2026-09-06 | 123/345 | B5 — UNPUBLISH: tier-1 invented claims, English says none of it |
| zh | `e-invoice-peppol.md` | 2025-09-22 | `e-invoice-peppol.md` | 2026-09-06 | 2/2 | D — keep (tier 3); queue for audit |
| zh | `guides/_index.md` | 2025-09-22 | `guides/_index.md` | 2026-09-06 | 180/136 | D — keep (tier 3); queue for audit |
| zh | `guides/einvoice-guides/_index.md` | 2026-09-06 | `guides/einvoice-guides/_index.md` | 2026-09-06 | 41/14 | D — keep (tier 3); queue for audit |
| zh | `guides/einvoice-guides/einvoice-pools-and-routing.md` | 2026-07-14 | `guides/einvoice-guides/einvoice-pools-and-routing.md` | 2026-09-06 | 183/19 | B6 — UNPUBLISH: e-invoice guide rewritten under it |
| zh | `guides/einvoice-guides/einvoice-validation.md` | 2026-07-14 | `guides/einvoice-guides/einvoice-validation.md` | 2026-09-06 | 310/132 | B6 — UNPUBLISH: e-invoice guide rewritten under it |
| zh | `modules.md` | 2025-09-22 | `modules.md` | 2026-06-19 | 2/0 | D — keep (tier 3); queue for audit |
| zh | `modules/_index.md` | 2026-09-06 | `modules/_index.md` | 2025-12-22 | 0/0 | D — keep (tier 3); queue for audit |
| zh | `modules/crm.md` | 2025-08-17 | `modules/crm.md` | 2025-08-26 | 252/6 | D — keep (tier 3); queue for audit |
| zh | `modules/financial-accounting.md` | 2025-08-17 | `modules/financial-accounting.md` | 2026-09-06 | 552/27 | B4 — UNPUBLISH: contradicts the 09-06 approvals correction |
| zh | `modules/inventory.md` | 2025-08-17 | `modules/inventory.md` | 2026-09-06 | 373/8 | D — keep (tier 3); queue for audit |
| zh | `modules/pos.md` | 2025-08-17 | `modules/pos.md` | 2026-09-06 | 519/52 | D — keep (tier 3); queue for audit |
| zh | `search.md` | 2025-08-12 | `search.md` | 2025-08-18 | 53/18 | D — keep (tier 3); queue for audit |
| zh | `support/_index.md` | 2025-09-22 | `support/_index.md` | 2025-09-17 | 0/0 | D — keep (tier 3); queue for audit |
| zh | `tutorials/_index.md` | 2025-09-22 | `tutorials/_index.md` | 2026-09-06 | 7/20 | D — keep (tier 3); queue for audit |
| zh | `user-guide/_index.md` | 2025-09-22 | `user-guide/_index.md` | 2026-06-19 | 6/2 | D — keep (tier 3); queue for audit |
| zh | `user-guide/administration/_index.md` | 2025-09-22 | `user-guide/administration/_index.md` | 2026-09-06 | 10/6 | D — keep (tier 3); queue for audit |
| zh | `user-guide/basic-operations/_index.md` | 2025-09-22 | `user-guide/basic-operations/_index.md` | 2026-06-28 | 6/0 | D — keep (tier 3); queue for audit |
| zh | `user-guide/best-practices/_index.md` | 2025-09-22 | `user-guide/best-practices/_index.md` | 2026-06-22 | 1/1 | D — keep (tier 3); queue for audit |
| zh | `user-guide/daily-tasks/_index.md` | 2025-09-22 | `user-guide/daily-tasks/_index.md` | 2026-06-28 | 6/0 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/_index.md` | 2026-09-06 | `user-guide/demo/_index.md` | 2026-09-06 | 12/2 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/distributors/_index.md` | 2025-09-24 | `user-guide/demo/distributors/_index.md` | 2026-09-06 | 652/12 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/food-beverage/_index.md` | 2025-09-24 | `user-guide/demo/food-beverage/_index.md` | 2025-09-17 | 0/0 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/manufacturing/_index.md` | 2025-09-24 | `user-guide/demo/manufacturing/_index.md` | 2025-09-17 | 0/0 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/retail/_index.md` | 2025-09-24 | `user-guide/demo/retail/_index.md` | 2026-09-06 | 450/226 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/role-based/_index.md` | 2025-09-24 | `user-guide/demo/role-based/_index.md` | 2025-09-24 | 196/0 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/role-based/ceo-executive/_index.md` | 2025-09-24 | `user-guide/demo/role-based/ceo-executive/_index.md` | 2025-09-24 | 600/0 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/role-based/finance-manager/_index.md` | 2025-09-24 | `user-guide/demo/role-based/finance-manager/_index.md` | 2026-09-06 | 523/3 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/role-based/operations-manager/_index.md` | 2025-09-24 | `user-guide/demo/role-based/operations-manager/_index.md` | 2026-09-06 | 553/5 | D — keep (tier 3); queue for audit |
| zh | `user-guide/demo/services/_index.md` | 2025-09-24 | `user-guide/demo/services/_index.md` | 2025-09-17 | 0/0 | D — keep (tier 3); queue for audit |
| zh | `user-guide/getting-started/_index.md` | 2025-09-22 | `user-guide/getting-started/_index.md` | 2026-06-28 | 6/0 | D — keep (tier 3); queue for audit |
| zh | `user-guide/industry-solutions/_index.md` | 2025-09-22 | `user-guide/industry-solutions/_index.md` | 2026-06-29 | 80/430 | B5 — UNPUBLISH: tier-1 invented claims, English says none of it |
| zh | `user-guide/reports-analytics/_index.md` | 2025-09-22 | `user-guide/reports-analytics/_index.md` | 2026-06-28 | 6/0 | D — keep (tier 3); queue for audit |
| zh | `user-guide/troubleshooting/_index.md` | 2025-09-22 | `user-guide/troubleshooting/_index.md` | 2026-06-22 | 1/1 | D — keep (tier 3); queue for audit |
| ms | `_index.md` | 2026-09-05 | `_index.md` | 2026-09-05 | 78/154 | D — keep (tier 3); queue for audit |
| ms | `applets/delivery-installation-applet-V2-applet.md` | 2026-04-13 | `applets/inventory-workflow/delivery-installation-applet-V2-applet.md` | 2026-09-05 | 9/14 | D — keep (tier 3); queue for audit |
| ms | `applets/driver-delivery-order-applet.md` | 2026-09-05 | `applets/inventory-workflow/driver-delivery-order-applet.md` | 2026-09-05 | 188/148 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `applets/employee-applet.md` | 2026-03-06 | `applets/master-data/employee-applet.md` | 2026-09-05 | 599/257 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `applets/internal-consignment-gin-applet.md` | 2026-02-22 | `applets/inventory-workflow/internal-consignment-gin-applet.md` | 2026-09-05 | 404/562 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `applets/internal-payment-voucher-applet.md` | 2026-03-09 | `applets/finance/internal-payment-voucher-applet.md` | 2026-09-05 | 1276/946 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `applets/internal-sales-order-applet.md` | 2026-09-05 | `applets/sales-workflow/internal-sales-order-applet.md` | 2026-09-05 | 315/459 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `applets/sales-report-applet.md` | 2026-02-21 | `applets/sales-workflow/sales-report-applet.md` | 2026-09-05 | 202/483 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `applets/stock-balance-applet.md` | 2026-03-10 | `applets/inventory-workflow/stock-balance-applet.md` | 2026-09-05 | 588/371 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `applets/stock-take-applet.md` | 2026-04-11 | `applets/inventory-workflow/stock-take-applet.md` | 2026-09-05 | 378/466 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `applets/supplier-applet-1.md` | 2026-03-27 | `applets/master-data/supplier-applet-1.md` | 2026-09-06 | 967/410 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `applets/voucher-management-applet.md` | 2026-03-13 | `applets/membership/voucher-management-applet.md` | 2026-06-27 | 271/77 | B2 — UNPUBLISH: English rebuilt from source 09-05/06 |
| ms | `modules/_index.md` | 2026-09-06 | `modules/_index.md` | 2025-12-22 | 0/0 | D — keep (tier 3); queue for audit |
| ms | `modules/crm.md` | 2025-08-17 | `modules/crm.md` | 2025-08-26 | 252/6 | D — keep (tier 3); queue for audit |
| ms | `modules/financial-accounting.md` | 2025-08-17 | `modules/financial-accounting.md` | 2026-09-06 | 552/27 | B4 — UNPUBLISH: contradicts the 09-06 approvals correction |
| ms | `modules/inventory.md` | 2025-08-17 | `modules/inventory.md` | 2026-09-06 | 373/8 | D — keep (tier 3); queue for audit |
| ms | `modules/pos.md` | 2025-08-17 | `modules/pos.md` | 2026-09-06 | 519/52 | D — keep (tier 3); queue for audit |
| ms | `search.md` | 2025-08-12 | `search.md` | 2025-08-18 | 53/18 | D — keep (tier 3); queue for audit |
| ms | `user-guide/_index.md` | 2025-09-24 | `user-guide/_index.md` | 2026-06-19 | 6/2 | D — keep (tier 3); queue for audit |
| ms | `user-guide/demo/_index.md` | 2026-09-06 | `user-guide/demo/_index.md` | 2026-09-06 | 12/2 | D — keep (tier 3); queue for audit |
| ms | `user-guide/demo/role-based/_index.md` | 2025-09-24 | `user-guide/demo/role-based/_index.md` | 2025-09-24 | 196/0 | D — keep (tier 3); queue for audit |
| ms | `user-guide/demo/role-based/ceo-executive/_index.md` | 2025-09-24 | `user-guide/demo/role-based/ceo-executive/_index.md` | 2025-09-24 | 600/0 | D — keep (tier 3); queue for audit |
| ms | `user-guide/demo/role-based/finance-manager/_index.md` | 2025-09-24 | `user-guide/demo/role-based/finance-manager/_index.md` | 2026-09-06 | 523/3 | D — keep (tier 3); queue for audit |
| ms | `user-guide/demo/role-based/operations-manager/_index.md` | 2025-09-24 | `user-guide/demo/role-based/operations-manager/_index.md` | 2026-09-06 | 553/5 | D — keep (tier 3); queue for audit |
| ar | `_index.md` | 2026-09-05 | `_index.md` | 2026-09-05 | 78/154 | D — keep (tier 3); queue for audit |
| ar | `modules/_index.md` | 2026-09-06 | `modules/_index.md` | 2025-12-22 | 0/0 | D — keep (tier 3); queue for audit |
| ar | `modules/crm.md` | 2025-08-17 | `modules/crm.md` | 2025-08-26 | 252/6 | D — keep (tier 3); queue for audit |
| ar | `modules/financial-accounting.md` | 2025-08-17 | `modules/financial-accounting.md` | 2026-09-06 | 552/27 | B4 — UNPUBLISH: contradicts the 09-06 approvals correction |
| ar | `modules/inventory.md` | 2025-08-17 | `modules/inventory.md` | 2026-09-06 | 373/8 | D — keep (tier 3); queue for audit |
| ar | `modules/pos.md` | 2025-08-17 | `modules/pos.md` | 2026-09-06 | 519/52 | D — keep (tier 3); queue for audit |
| ar | `search.md` | 2025-08-12 | `search.md` | 2025-08-18 | 53/18 | D — keep (tier 3); queue for audit |
