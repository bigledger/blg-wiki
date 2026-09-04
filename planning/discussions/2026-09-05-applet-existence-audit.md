---
status: decided
started: 2026-09-05
participants: Vincent, Claude
trigger: feedback F-0004 / F-0005
decision: ../decisions/0002-applet-existence-and-naming.md
related:
  - ../feedback/inbox.md
  - 2026-09-05-content-folder-restructure.md  (aliases discipline — see §4)
---

# Does every documented applet exist? Wiki ↔ applet registry audit

Vincent (2026-09-05): *"we actually DO NOT HAVE this applet 'MY E-Invoice for Customer &
Supplier Applet' … i am not sure how many other similar mistakes you made, I would need you
to ensure the consistency of the entire wiki website."*

## Method

Source of truth used: `bl_applet_hdr` in `akaun_master` (236 rows; 209 ACTIVE), joined to
`bl_applet_to_catalog_link` and `bl_applet_login_subject_link` for deployment signals.
Compared against the 168 applet pages under `content/en/applets/` by normalised title, then
by keyword for anything unmatched. Raw match output lives in the session scratchpad only —
registry names include real customer names and must not enter this repo.

**Limits.** (a) `last_accessed` is null for every applet, so "has anyone opened it" cannot be
measured. (b) The micro-frontend shell resolves applet routes at runtime from the registry,
so source code cannot confirm a UI exists. (c) Only 28 applet repos are cloned in
`refs/`; the e-invoice ones are not among them.

## 1. The applet Vincent flagged — the registry disagrees, and I cannot break the tie

`myEInvoiceForCustomerAndSupplierApplet` — "MY E-Invoice For Customer And Supplier Applet":

| Signal | Value | For comparison: My E-Invoice Admin |
|---|---|---|
| status | ACTIVE, TNT-USER | ACTIVE |
| created / last updated | 2024-10-19 / 2026-04-20 | — |
| catalog links | 44 | 208 |
| tenants with it in a catalog | 12 | 70 |
| logins granted access | 205 | 952 |
| routerLink in `property_json` | `applets/tnt/wavelet/erp/my-einvoice-for-customer-and-supplier` | present |
| images in `bl_applet_image_hdr` | 5 | — |

By every registry signal it is a deployed applet in 12 tenants. Vincent says it does not
exist. Both can be true if the registry row is a stub, a superseded entry (e.g. replaced by
My E-Invoice Portal, which has 14 tenants / 139 logins), or a shell that redirects. **Only
Vincent can say which.** This matters beyond one page: if ACTIVE registry rows can be
"non-existent", the registry alone cannot be the source of truth for this audit.

The wiki page itself (`applets/e-invoice/my-einvoice-for-customer-and-supplier-applet.md`)
was written without ever seeing the applet: it embeds **one generated infographic and zero
screenshots** (the Admin page has 22 real screenshots), carries the WIP banner, and its
TL;DR positions it as "the workhorse" vs Admin as "the control tower" — a narrative, not an
observation. It is linked from 4 pages under `modules-v2/e-invoice/`.

## 2. Wiki applet pages with NO registry row under any name (12 + 2 to verify)

Searched by title, slug, and keyword. Nothing in the registry resembles these:

| Wiki page | Notes |
|---|---|
| `finance/accounts-receivable-applet.md` | no "receivable" anywhere in registry |
| `finance/revenue-management-applet.md` | |
| `finance/vote-book-applet.md` | |
| `finance/investment-applet.md` + `finance/investment-guide.md` | WIP banner |
| `finance/e-mandate-applet.md` | |
| `integrations/webhook-applet.md` | |
| `human-resources/admin-time-attendance-applet.md` | WIP banner |
| `crm/ai-customer-analytics-applet.md` | |
| `master-data/group-maintenance-applet.md` + `group-maintenance-V2-applet.md` + `installation-of-group-maintenance-applet.md` | 3 pages, no registry row; WIP on V2 |
| `inventory-workflow/internal-goods-dispatch-note-applet.md` | WIP banner. Registry has "Goods Delivery Note (Internal)" — different thing? |
| `ecommerce/ecommerce-catalog-applet.md` | |
| `sales-workflow/external-sales-invoice-applet.md` | |

Verify (a registry row exists with a similar-but-different name):
- `finance/mm-deposit-applet.md` "Money Market Deposit" — registry has "Deposit Applet" (customer deposits?). Likely different.
- `finance/txn-recon-applet.md` "Transaction Reconciliation" — registry has "Bank Reconciliation". Likely different.

## 3. Wiki pages documenting a DELETED applet (3)

`crm/team-maintenance-applet.md`, `crm/introduction-to-team-maintenance-applet.md`,
`crm/installation-of-team-maintenance-applet.md` → registry `newTeamMaintenanceApplet` is
**DELETED**. Either the applet was retired or replaced; the docs were not.

## 4. The product links to wiki pages that do not exist (33) — customer-visible

`bl_applet_hdr.documentation_url` is what the in-product "Documentation" button opens.
120 applets have one: 80 → wiki.bigledger.com, 40 → the old Atlassian Confluence.
**33 of the 80 wiki URLs return 404.** Most are the old flat paths
(`/applets/cashbook-applet/`) that were moved into sub-domains
(`/applets/finance/cashbook-applet/`) without aliases — the same failure mode the folder
restructure must not repeat. A few point at paths that never existed (`/applets/sst/mysst/`).

Broken (registry name → URL path):
Blanket Purchase Order → `/applets/blanket-purchase-order-applet/`; Cashbook →
`/applets/cashbook-applet/`; Chart of Account → `/applets/chart-of-account-applet/`; Claim →
`/applets/claim-applet/`; Creditor Report → `/applets/debtor-and-creditor-report-applet/`;
Customer Consignment → `/applets/customer-consignment-applet/`; Customer Maintenance →
`/applets/customer-maintenance-applet/`; Deposit → `/applets/mm-deposit-applet/`; Employee
Maintenance → `/applets/employee-maintenance-applet/`; Financial Report →
`/applets/financial-report-applet/`; Inventory Item Maintenance →
`/applets/inv-item-maintenance-applet/`; Membership Admin → `/applets/membership-admin-applet/`;
My E-Invoice Admin → `/applets/e-invoice/einvoice-generation-applet/`; MY-SST →
`/applets/sst/mysst/`; Organization → `/applets/organization-applet/`; Peppol AP Admin →
`/applets/peppolap-admin-applet/`; Pricebook → `/applets/pricebook-applet/`; Production
Planning → `/applets/production-planning-and-monitoring-applet/`; Purchase GRN Stock In and
Purchase GRN Supplier Access → `/applets/internal-purchase-grn-supplier-access-applet/`;
Receipt Voucher → `/applets/internal-receipt-voucher-applet/`; Sales Invoice →
`/applets/internal-sales-invoice-applet/`; Shopping Cart → `/applets/shopping-cart-applet/`;
Stock Adjustment → `/applets/inventory-workflow/internal-stock-adjustment-applet/`; Stock
Balance → `/applets/stock-balance-applet/`; Stock Take (×2) → `/applets/stock-take-applet/`;
T2T Admin → `/applets/t2t-admin-applet/`; Tax Configuration → `/applets/tax-config-applet/`;
Tenant Admin → `/applets/tenant-admin-applet/`; VSTECS ESD Order →
`/applets/vstecs-ms-esd-order-applet/`; Warehouse Management System →
`/applets/warehouse-management-system-applet/`; Warranty Admin → `/applets/warranty-admin-applet/`.

Fix is cheap: an `aliases:` line on each moved page. No registry change needed.

## 5. Naming mismatches to reconcile (wiki title ≠ registry name; same applet) (~12)

Organisation ↔ Organization; Customer Applet ↔ Customer Maintenance; General Ledger ↔ Ledger
And Journal; Budget ↔ Budgetary; Jobsheet (Internal) ↔ Job Sheet (Internal); Events
Management ↔ Event Management; Daily Cashier Report ↔ Daily Cashier Reports; Seller Admin ↔
Seller; Merchant ↔ Merchant Admin / Merchant Access; Warehouse Management ↔ Warehouse
Management System; Unified Contact Center (UCC) ↔ Unified Contact Center; Stock Adjustment
↔ Stock Adjustment (Internal). Decision needed: does the wiki title follow the registry
name exactly? (Recommended: yes — it is what the user sees in the applet store.)

## 6. ACTIVE registry applets with no wiki page (80)

Roughly half are **customer-specific integrations** named after the customer (per-customer
ESD order applets, marketplace connectors, a beauty-retail POS, a telco's HQ PO / RMA set) —
these should probably never be on the public wiki, or only as a generic "custom integration"
note. The other half are general-purpose and undocumented:

AP Automation (+ Supplier Access) · Barcode Generator · Contact Maintenance · Content
Management System · Customer Profile · Dynamic Report · E-Coupon Maintenance · Exchange /
Return / Refund Policy · Goods Delivery Note (Internal) · Inquiry / Inquiry Management ·
Issue Tracker · Media Library · Multi PO · Newsletter Management · Payment Channel · Peppol
AP Admin · POS Customer Display · Reimbursement Payment Voucher (Internal) · RMA HQ / Staff /
Supplier · Sales Force Automation · Scheduler · SO Consolidation · Stock Level Monitoring ·
Stock Take HQ / Staff · Transporter Outbound Delivery Order · the Buyer-/Supplier- portal
set (Orders, Invoices, Goods Receipt, Delivery Order, Payment Match) · accounting connectors
(two Malaysian desktop accounting packages).

## Lateral findings from the first GitHub-issues ingest (2026-09-05)

- **`inventory-workflow/internal-goods-dispatch-note-applet.md`** (listed in §2 as no registry row)
  is almost certainly a misnaming of the registry's ACTIVE, undocumented **"Goods Delivery Note
  (Internal)"** — open wiki issue #69 asks for `[internal-goods-delivery-note-applet]` docs.
  Treat as a rename + retitle, not a phantom. → remove from the archive list.
- **`finance/accounts-receivable-applet.md`** (§2) exists because wiki issue #20 asked for an
  "accounts-receivable-applet User Guide" — but there is still no registry row under any name.
  The issue may itself be mistaken (a report or a module, not an applet). Ask Vincent before archiving.
- Wiki issue #200 asks for `internal-sales-order-applet-v2`; the registry code is
  `blg-applet-wavelet-internal-sales-order-applet-v2` (repo) / Sales Order (Internal). The
  existing page is `sales-workflow/internal-sales-order-applet.md` — one page, not two.

## Decisions for Vincent

1. **The flagged applet.** What is the registry row — stub, superseded by Portal, or a
   rename? Should the registry row be cleaned up on the platform side as well?
2. **Source of truth for "exists".** The registry (`bl_applet_hdr` ACTIVE), the applet
   store's published list, or a curated list from you? The audit method depends on this.
3. **The 12 no-registry pages** (§2): delete, or are any of them real applets under a name
   I could not find?
4. **Wiki titles follow registry names exactly?** (§5)
5. **Customer-specific applets** (§6): excluded from the public wiki by policy?
6. Approve fixing the 33 broken product→wiki links via aliases as the first batch — it is
   independent of everything else and customer-visible today.

## Proposed guard so this cannot recur

`tests/applet-registry-parity.sh` (needs the DB tunnel, so runs on this box, not in CI):
every `content/en/applets/**` page must map to an ACTIVE registry code (front matter
`applet_code:`), and every registry `documentation_url` on wiki.bigledger.com must resolve
to a content file. Adding `applet_code:` to front matter is also the fix for §5 permanently.

## Next steps

- [ ] Vincent decides 1–6
- [ ] Batch: aliases for the 33 broken product→wiki URLs
- [ ] Batch: remove/quarantine the confirmed phantoms (move to `planning/archive/`, not delete, in case any turn out real)
- [ ] Batch: retitle §5 to registry names; add `applet_code:` front matter across `applets/`
- [ ] `tests/applet-registry-parity.sh`
- [ ] Separate discussion: documentation backlog for the ~40 general-purpose undocumented applets
