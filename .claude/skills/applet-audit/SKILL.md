---
name: applet-audit
description: Check the wiki's applet pages against the product's applet registry (bl_applet_hdr in akaun_master) — pages for applets that do not exist, ACTIVE applets with no page, title mismatches, and broken documentation_url links from the product into the wiki. Use when Vincent questions whether an applet exists, asks for consistency across the wiki, or before/after any batch touching content/en/applets/.
argument-hint: "[applet name or code, or 'all']"
---

Source of truth (ADR-0002): `bl_applet_hdr` rows with `status = ACTIVE`, minus `planning/private/applet-exclusions.tsv`. Titles follow the registry name exactly; every applet page should carry `applet_code:`.

## Steps

1. Pull the registry (read-only, tab-separated, into the scratchpad — never into the repo):
   `sudo -u vincent /home/vincent/projects/sysadmin/bin/psql-akaun-master -At -F "$(printf '\t')" -c "SELECT code, name, applet_type, status, coalesce(documentation_url,''), created_date::date FROM bl_applet_hdr ORDER BY name"`
   (Put `-F` on the command line directly; a tab inside a shell variable gets word-split.)
2. Deployment signals when a single applet is in question — catalogs, tenants, logins:
   join `bl_applet_to_catalog_link` (applet_hdr_guid) and `bl_applet_login_subject_link` (applet_hdr_guid, tenant_guid, app_login_guid). `last_accessed` is always null — not a usable signal. The MF shell resolves routes at runtime, so source code cannot prove a UI exists; only Vincent can settle a disputed row.
3. Match: normalise titles (lowercase, drop "applet", "(internal)"→"internal", punctuation), compare wiki `title:` and slug against registry `name` and camel-split `code`; then keyword-search anything unmatched before calling it a phantom.
4. Also check every registry `documentation_url` on wiki.bigledger.com resolves to a content file (`content/en<path>.md` or `/_index.md`) — the in-product Documentation button depends on it. Fix by adding `aliases:` on the page, not by changing the registry.
5. Report four lists: no registry row (phantom candidates), DELETED in registry, title mismatches, ACTIVE-but-undocumented. Split the last into general-purpose vs customer-specific — customer-specific ones are described generically and added to the exclusion list, never named in the repo.
6. Record findings in the relevant discussion and as inbox items; act only through batches.

## Privacy

Registry names and codes can contain customer names. They may appear in the scratchpad and `planning/private/` only. Anything committed says "a telco's HQ PO applet", never the name.
