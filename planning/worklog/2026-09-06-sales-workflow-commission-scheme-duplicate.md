---
date: 2026-09-06
unpublished_from: content/en/applets/sales-workflow/commission-scheme-applet.md
url: /applets/sales-workflow/commission-scheme-applet/
tier: 1
mechanism: moved
reason: "Duplicate page for the same registry applet. Commission_Scheme already has a fully sourced page at /applets/membership/commission-scheme-applet/, which is also the target of the registry's own documentation_url. This copy (598 lines) carries no applet_code, no sources map, and a title that is not the registry name."
evidence:
  - "bl_applet_hdr (akaun_master, 2026-09-06): one row only — code Commission_Scheme, name 'Commission Scheme', status ACTIVE, documentation_url https://wiki.bigledger.com/applets/membership/commission-scheme-applet/, routerLink applet/tnt/wavelet/erp/commission-scheme-applet."
  - "content/en/applets/membership/commission-scheme-applet.md carries applet_code: Commission_Scheme and a per-section sources map covering app.routing.ts, the settings and personalization components, the rules/treatment templates, TntCommissionPermissions.java and CommissionSchemeController.java."
  - "ADR-0002 §2/§3: titles follow the registry name exactly and every applet page carries applet_code. The sales-workflow copy titled it 'Commission Scheme Applet' and had neither."
salvage: >
  Nothing unique. Everything in the archived copy is covered, and covered with citations, by the
  membership page. The 15 images under /images/commission-scheme-applet/ are still referenced by the
  membership page and stay.
to_rewrite: >
  Nothing. The applet has one page and it is the membership one. An alias for this URL has been added
  to that page and the four inbound links (modules-v2/membership/core-concepts, modules-v2/membership/use-cases,
  applets/finance/debtor-report-applet, applets/ecommerce/cp-commerce-admin-applet) were repointed in
  the same change.
---

The archived page is at `planning/archive/2026-09-06-sales-workflow/commission-scheme-applet.md`.
