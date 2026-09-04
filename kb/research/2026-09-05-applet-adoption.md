---
source: akaun_master.bl_applet_hdr ⨝ bl_applet_login_subject_link (read-only, 2026-09-05)
privacy: aggregate counts only; applet product names; no tenant or user identities
purpose: evidence for documentation priority (ADR-0002 backlog, ADR-0003 translation order)
---

# Applet adoption across tenants — what to document first

137 tenants have at least one applet assigned. Ranking by number of tenants that have the
applet in a catalog with at least one login granted (a proxy for "in use"), then by logins.
Customer-specific applets (see `planning/private/applet-exclusions.tsv`) are excluded.

| # | Applet (registry name) | Tenants | Logins | Wiki page found by slug? |
|---|---|---|---|---|
| 1 | Organization | 120 | 926 | **no / slug mismatch** |
| 2 | Doc Item Maintenance | 115 | 1408 | yes |
| 3 | Customer Maintenance | 112 | 1872 | yes |
| 4 | Chart of Account | 108 | 905 | yes |
| 5 | Supplier | 100 | 1126 | yes |
| 6 | Sales Invoice (Internal) | 96 | 2192 | yes |
| 7 | Cashbook | 85 | 939 | yes |
| 8 | Purchase Invoice (Internal) | 83 | 1429 | yes |
| 9 | Employee Maintenance | 83 | 670 | **no / slug mismatch** |
| 10 | Sales Credit Note (Internal) | 79 | 1470 | yes |
| 11 | Sales Order (Internal) | 72 | 2823 | yes |
| 12 | My E-Invoice Admin Applet | 70 | 952 | yes |
| 13 | Sales Return (Internal) | 69 | 1997 | yes |
| 14 | Receipt Voucher (Internal) | 67 | 1755 | yes |
| 15 | Purchase Debit Note (Internal) | 67 | 901 | yes |
| 16 | Sales Debit Note (Internal) | 65 | 1226 | yes |
| 17 | Purchase Credit Note (Internal) | 65 | 864 | yes |
| 18 | Tenant Admin Applet | 65 | 462 | yes |
| 19 | Purchase Order (Internal) | 64 | 1289 | yes |
| 20 | Stock Availability | 63 | 3209 | yes |
| 21 | Purchase Return (Internal) | 63 | 2149 | yes |
| 22 | Payment Voucher (Internal) | 63 | 1126 | yes |
| 23 | Purchase GRN (Internal) | 62 | 2198 | yes |
| 24 | Ledger And Journal | 61 | 655 | yes |
| 25 | Financial Report | 59 | 666 | yes |
| 26 | POS General | 58 | 3013 | yes |
| 27 | Sales Report | 57 | 2395 | yes |
| 28 | Stock Adjustment (Internal) | 57 | 1641 | yes |
| 29 | Membership Admin | 53 | 783 | yes |
| 30 | Bank Reconciliation | 53 | 617 | yes |
| 31 | Stock Transfer | 52 | 1995 | yes |
| 32 | Debtor Report Applet | 51 | 1488 | yes |
| 33 | Creditor Report Applet | 51 | 946 | yes |
| 34 | Stock Report | 49 | 2634 | yes |
| 35 | CP Commerce Admin | 46 | 406 | yes |
| 36 | Purchase Report | 45 | 892 | yes |
| 37 | Inventory Item Maintenance | 43 | 411 | **no / slug mismatch** |
| 38 | Sales Quotation (Internal) | 40 | 1532 | yes |
| 39 | Sales Refund Note Applet (Internal) | 38 | 1143 | yes |
| 40 | Media Library Applet | 32 | 195 | **no / slug mismatch** |

## What this says

- The **master-data quartet** (Organization, Doc Item, Customer, Chart of Account) plus
  Supplier is in 100+ tenants each — the `setup/` section of ADR-0001 is the highest-value
  documentation on the site, and today it is the thinnest.
- **Sales Invoice, Cashbook, Purchase Invoice, Sales Credit Note, Sales Order, Sales Return,
  Receipt Voucher** are the daily-operations core (63–96 tenants): the
  `processes/order-to-cash/` and `procure-to-pay/` guides.
- **My E-Invoice Admin** is in 70 tenants — half the base — so the e-Invoice guides are the
  most-read compliance content on the site.
- **Stock Availability** has the most logins of any applet (3,209): the screen shop-floor
  staff keep open all day. It has a reference page; it needs a how-to.
- Translation order (ADR-0003) should follow this table, not the applet list.

## Next

- "no / slug mismatch" rows feed the ADR-0002 retitle batch; `applet_code:` will make this
  join exact instead of a name guess.
- Re-run monthly; the diff is the adoption trend.
