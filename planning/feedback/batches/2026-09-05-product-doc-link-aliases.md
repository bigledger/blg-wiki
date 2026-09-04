---
status: done
date: 2026-09-05
decision: ../../decisions/0002-applet-existence-and-naming.md
items: F-0005 (alias portion)
commit: (see git log — "Add aliases so in-product Documentation links resolve")
---

# Batch: aliases for the 33 broken product → wiki "Documentation" links

## Analysis

`bl_applet_hdr.documentation_url` is what the in-product Documentation button opens. 80
rows point at wiki.bigledger.com; 33 of those returned 404 because the target pages had
been moved into `applets/<domain>/` sub-folders without aliases. Mapping old path → current
file by slug resolved 26 directly; 7 needed a manual match:

| Old path | Now |
|---|---|
| `/applets/e-invoice/einvoice-generation-applet/` | `e-invoice/my-e-invoice-admin-applet.md` |
| `/applets/employee-maintenance-applet/` | `master-data/employee-applet.md` |
| `/applets/inventory-workflow/internal-stock-adjustment-applet/` | `inventory-workflow/stock-adjustment-applet.md` |
| `/applets/organization-applet/` | `master-data/organisation-applet.md` |
| `/applets/sst/mysst/` | `finance/sst-applet.md` |
| `/applets/warehouse-management-system-applet/` | `inventory-workflow/warehouse-management-applet.md` |
| `/applets/peppolap-admin-applet/` | **no page** — "Peppol AP Admin" is a separate, undocumented applet (not My Peppol Admin). Left as-is; on the documentation backlog. |

Two registry rows (Purchase GRN Stock In, Purchase GRN Supplier Access) share one URL, and
Stock Take appears twice, so 33 broken URLs → 30 distinct aliases on 30 files.

## Changes

- 30 files under `content/en/applets/**`: one `aliases:` entry each. Front matter only;
  no body text touched. Files with a UTF-8 BOM keep it.
- Verified: `hugo --gc --minify` reports 32 aliases (30 new + 2 pre-existing); every new
  `public/<old-path>/index.html` exists and redirects to the correct current page with
  `rel=canonical` and `noindex` — search engines will not index the stub.

## Found on the way

- F-0007: `inv-item-maintenance-applet.md` exists in both `master-data/` and
  `inventory-workflow/`. Alias placed on the newer `master-data` copy. Dedup pending.

## Not done here

- The 40 registry rows pointing at Atlassian Confluence — a platform-side change.
- The registry's own `documentation_url` values are unchanged; the aliases make them work.
