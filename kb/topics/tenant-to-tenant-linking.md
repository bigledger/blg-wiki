---
topic: tenant-to-tenant-linking
aliases: [T2T, tenant to tenant, host tenant, guest tenant, cross-tenant item mapping]
applets: [t2tAdminApplet, InvItemMaintenanceApplet]
modules: [core]
related: [applet-registry, item-master-data, webhooks, team-and-role-permissions]
wiki:
  - content/en/applets/integrations/t2t-admin-applet.md
  - content/en/applets/master-data/doc-item-maintenance-applet.md
status: seed
updated: 2026-09-06
---

# Tenant-to-tenant (T2T) linking

T2T connects two independent BigLedger tenants — two subscriptions with two separate databases —
so one (the **guest**) can reference a controlled slice of the other's (the **host**'s) master
data. It is not multi-company accounting inside one tenant; it is a relationship between two
organisations that each run their own tenant, typically a distributor and a dealer.

## Facts

- 2026-09-06 — The applet's registry row `t2tAdminApplet` is ACTIVE and points at a pre-built
  bundle on the applet CDN, but **no repository for it exists in the GitHub organisation** (455
  repositories enumerated). Its screens and settings cannot be read from source.
  [src:planning/private/registry-applets-2026-09-05.tsv] [src:gh:bigledger org repo list]
- 2026-09-06 — A connection is a pair of `app_tenant_hdr` rows with `obj_type = 'T2T'`, one in
  each tenant's database, with `obj_access` of `HOST` or `GUEST` and `obj_status` of `INVITED`,
  `CONNECTED`, `REJECTED` or `DISCONNECTED`.
  [src:blg-akaun-platform-java/javasdk/.../domain/t2t/TenantInvitationService.java:150-175]
- 2026-09-06 — Almost every T2T write touches **two databases with no cross-database
  transaction**. The second write is a plain DAO insert/update; if it does not affect exactly one
  row the first is undone by a compensating statement and `MULTIPLE_INSERT_OPERATION_FAILED` is
  thrown. A failure of the compensating statement itself leaves the two databases disagreeing and
  there is no repair job.
  [src:blg-akaun-platform-java/javasdk/.../domain/t2t/TenantInvitationService.java:56-63,131-140]
- 2026-09-06 — There is **no delete endpoint** for a connection. `TenantInvitationController`
  exposes only `POST /invite`, `PUT /{code}/invitation-response`, `PUT`, `GET`, `GET /query`. A
  `REJECTED` row is permanent and blocks re-inviting that tenant, because the duplicate check
  matches on code and `obj_access` only, never on status.
  [src:blg-akaun-platform-java/akaun-api/.../t2t/dm/TenantInvitationController.java:55,91,152,190,210]
  [src:blg-akaun-platform-java/javasdk/.../domain/t2t/TenantInvitationService.java:45-47]
- 2026-09-06 — Item sharing is two-step and host-controlled: the host writes
  `bl_t2t_fi_item_to_tenant_link` ("guest X may map to my item Y"), then the guest writes the
  `bl_t2t_item_to_item_link` pair. The guest side is refused with
  `HOST_FI_ITEM_GUID_LINKING_IS_NOT_ALLOWED` without a permission row.
  [src:blg-akaun-platform-java/javasdk/.../domain/t2t/T2TItemToItemLinkService.java:20-30]
- 2026-09-06 — The permission check `T2TItemToTenantLinkUow.checkItemPerm` filters only on
  `status != 'DELETED'` (via `SqlGenerator.generateQueryStatementWithOneCondition`), so an
  `INACTIVE` sharing permission still grants item mapping.
  [src:blg-akaun-platform-java/javasdk/.../dal/uow/T2T/T2TItemToTenantLinkUow.java:228-245]
  [src:blg-akaun-platform-java/javasdk/.../dal/util/SqlGenerator.java:137-139]
- 2026-09-06 — `T2TTenantService.getTenantPerm` in the shared client library builds
  `…&obj_status = CONNECTED` with spaces around the `=`, so the status filter never binds and
  non-connected tenants appear in the guest permission list.
  [src:blg-akaun-ts-lib/.../t2t-services/t2t-tenant.service.ts:53]
- 2026-09-06 — Creating an item-to-tenant sharing permission is one of the few backend writes that
  fires a webhook: `T2T_ITEM_TO_TENANT_LINKING_ADDED` / `_UPDATED`.
  [src:blg-akaun-platform-java/javasdk/.../domain/t2t/T2TItemToTenantLinkService.java:22-28,40-46]
- 2026-09-06 — Outside the `t2t` packages, the only backend consumer of a T2T link is a
  customer-specific electronic-software-delivery ordering service, which resolves the guest's item
  to the host's item before placing an order. No sales, purchase, stock or journal code reads a
  business mapping or an item link.
  [src:grep of blg-akaun-platform-java for T2TItemToItemLinkUow / bl_t2t_* outside t2t packages]
- 2026-09-06 — An external team is an ordinary `app_mst_grp_hdr` row with `group_type = T2T` and
  `t2t_other_tenant_guid` set; the creator is inserted as `OWNER` with title `T2T OWNER`. This is
  the one T2T path wrapped in a real transaction, because both rows are in the same database.
  [src:blg-akaun-platform-java/javasdk/.../domain/t2t/ExternalTeamService.java:60-85,150-165]
- 2026-09-06 — Unauthorised reads do not error: the record is returned with `status` replaced by
  `PERMISSION_DENIED` and every other field stripped.
  [src:blg-akaun-platform-java/akaun-api/.../t2t/dm/TenantInvitationController.java:46-53]

## How it connects

- **item-master-data** — the *T2T Item Mapping* tab in Doc Item Maintenance is the only shipped
  screen that reads or writes T2T item links, and it loads the connected-tenant list first, which
  is why the tab is blank when no connection exists.
- **webhooks** — the item-to-tenant sharing permission is one of the small set of backend events
  that call registered webhooks.
- **team-and-role-permissions** — external teams reuse the ordinary team and role tables, flagged
  by group type; the T2T role endpoints are a parallel role listing scoped to the connection.
- **applet-registry** — T2T is the clearest case of an ACTIVE registry row whose front end has no
  repository in the organisation.

## Open questions

- Where does the `t2t-admin-applet` front end live? It is built and deployed but not in the
  organisation's repositories. (Vincent question Q-0021.)
- Is the two-database, non-transactional write pattern considered acceptable, or is a
  reconciliation job intended?

## Wiki impact

- `content/en/applets/integrations/t2t-admin-applet.md` — rewritten from this topic (run 33).
- `content/en/applets/master-data/doc-item-maintenance-applet.md` — could add that a blank T2T
  Item Mapping tab means "no connected tenant", and that an item can be in only one pair per
  connection per direction.
