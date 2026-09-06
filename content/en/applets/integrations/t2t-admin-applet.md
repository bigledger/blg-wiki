---
title: "T2T Admin"
description: "Connects two separate BigLedger tenants so they can map companies, branches and items to each other, and share teams and roles across the connection."
applet_code: "t2tAdminApplet"
page_type: applet
applet_repo: null
modules: [core]
related_applets: [doc-item-maintenance-applet, tenant-admin-applet, organisation-applet, employee-applet]
guides: []
sources:
  where-it-fits:
    - blg-akaun-platform-java/akaun-api/src/main/java/app/api/core2/controller/t2t/dm/TenantInvitationController.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/Core2Config.java
  screens:
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/t2t-services/
    - blg-applet-wavelet-doc-item-maintenance-applet/micro-fe/projects/wavelet-erp/applets/doc-item-maintenance-applet/src/app/components/basic-item-container/basic-item-edit/t2t-item-mapping/
  configuration:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/permissions/T2TPermissions.java
  fields:
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_t2t_comp_branch_entity_link.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_t2t_item_to_item_link.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_t2t_fi_item_to_tenant_link.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/dal/table/bl_t2t_audit_trail_event.java
  lifecycle:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/t2t/TenantInvitationService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/t2t/BusinessMappingService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/t2t/T2TItemToItemLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/t2t/T2TItemToTenantLinkService.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/domain/t2t/ExternalTeamService.java
    - blg-akaun-platform-java/client-sdk/src/main/java/com/bigledger/core2/common/api/constants/T2TAuditTrialConstants.java
  troubleshooting:
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/common/api/constants/T2TErrorCodes.java
    - blg-akaun-platform-java/javasdk/src/main/java/com/bigledger/core2/dal/uow/T2T/T2TItemToTenantLinkUow.java
    - blg-akaun-ts-lib/projects/blg-akaun-ts-lib/src/lib/services/com-akaun-api/core2/api-services/t2t-services/t2t-tenant.service.ts
tags:
- core-module
- tenant-management
- multi-tenant
- t2t
weight: 112
aliases:
- /applets/t2t-admin-applet/
---

## Overview

T2T ("tenant to tenant") connects **two separate BigLedger tenants** — two independent
subscriptions, each with its own database — so that one can see and reference a controlled slice
of the other. One tenant is the **host** (it owns the data being shared) and the other is the
**guest** (it consumes the shared data). The connection is created by an invitation that the guest
has to accept.

Once two tenants are connected, four things can be linked across the connection: **companies and
branches** (business mapping), **inventory/financial items** (item-to-tenant permission, then
item-to-item mapping), **teams and roles**, and an **audit trail** of everything that was done to
the connection.

T2T is *not* multi-company accounting. Several companies inside one tenant are handled by the
[Organization applet](/applets/master-data/organisation-applet/); T2T is for a relationship
between two organisations that each run their own BigLedger tenant — typically a
distributor and a dealer, or a principal and a franchisee.

{{< callout type="warning" >}}
**No front-end source is available for this applet.** The registry row `t2tAdminApplet` points at
a pre-built bundle (`t2t-admin-applet-elements.js`) on the platform's applet CDN, and no
corresponding repository exists in the BigLedger GitHub organisation (455 repositories listed,
none matching `t2t`). Everything on this page is therefore derived from the backend API, the
shared TypeScript client library (`blg-akaun-ts-lib`), and the T2T screens that live in the
[Doc Item Maintenance applet](/applets/master-data/doc-item-maintenance-applet/). **The applet's
own screens, menus and settings cannot be documented from source and are not described here.**
{{< /callout >}}

## Where it fits

| Direction | What | Why |
|---|---|---|
| Prerequisite | A second BigLedger tenant, registered in `app_tenant_hdr` | You invite it by **tenant code**; an unknown code returns `TENANT_CODE_DOES_NOT_EXIST` |
| Prerequisite | [Organization](/applets/master-data/organisation-applet/) — companies and branches on both sides | Business mapping maps a company/branch pair on one side to a company/branch pair on the other |
| Prerequisite | [Employee](/applets/master-data/employee-applet/) / user accounts, teams and roles | External teams are ordinary teams (`app_mst_grp_hdr`) flagged with a group type of `T2T` |
| Downstream | [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — *T2T Item Mapping* tab | The only shipped screen that reads and writes T2T item links |
| Downstream | Backend distributor ordering integration | One customer-specific electronic-software-delivery ordering service resolves a guest item to the host's item through `bl_t2t_item_to_item_link` before placing an order |

Apart from the two consumers above, **nothing else in the platform reads the T2T tables.** A
search of the Java backend outside the `t2t` packages finds only the table definitions themselves
and that one ordering service; no sales, purchase, stock or journal code consults a business
mapping or an item link.

## Screens and menus

No screenshots of this applet exist in the wiki's image library, and the applet's own front end
cannot be read (see the note above). What *can* be stated from the API and the client library is
the set of functional areas the applet is built on. Each is a separate REST resource under
`core2/t2t/dm/`:

| Area | Resource | What it holds |
|---|---|---|
| Tenant linking | `core2/t2t/dm/config/tenants-linking` | The invitation and its status; the list of connected host and guest tenants |
| Business mapping | `core2/t2t/dm/config/erp/business-mapping` | Company + branch + entity pairs, both sides of the link |
| Companies / branches of the other tenant | `core2/t2t/dm/config/erp/companies`, `…/branches` | Read-only pickers that read the *other* tenant's master data |
| Item permission (host side) | `core2/t2t/dm/fi-item-perm/host/backoffice-ep` | Which of the host's items a given guest tenant may map to |
| Item permission (guest side) | `core2/t2t/dm/fi-item-perm/guest/login-guest-ep` | Read-only: what the guest has been permitted |
| Item-to-item mapping | `core2/t2t/dm/fi-item-linking/login-guest-ep`, `…/login-host-ep` | The guest's item ↔ the host's item |
| Item labels | `core2/t2t/dm/config/erp/item-label` | Labels applied across the connection |
| External teams | `core2/t2t/dm/teams/backoffice-ep`, `…/teams/guest-ep` | Teams of the other tenant's users |
| Roles and role links | `core2/t2t/dm/config/erp/roles`, `…/link-team-to-role`, `…/link-perm-to-role` | Roles scoped to the connection |
| Audit trail | `core2/t2t/dm/config/erp/audit-trail-event` | Every invitation, team and mapping action |

The **T2T Item Mapping** tab inside
[Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) is the one T2T surface
whose source is readable. It has three sub-tabs — *Host Tenant*, *Guest Tenant Item Mapping* and
*Guest Tenant Permission Listing* — and it fetches the tenant list from `tenants-linking` before
anything else, which is why an item's T2T tab is empty until a connection exists.

## Configuration

### Before you can use it

- **A second tenant that already exists.** Invitations are addressed by tenant code, and
  `TenantInvitationController.sendInvitation` looks the code up in `app_tenant_hdr` in
  `akaun_master` before doing anything. Inviting your own tenant code is refused with
  `CLIENT_INVITATION_TENANT_CODE_MUST_BE_DIFFERENT_FROM_OWN_TENANT_CODE`.
- **A registered database connection for that tenant.** T2T writes into *both* tenants'
  databases in one call, and it obtains the second connection from the master registry
  (`app_generic_resources_hdr.connection_json`). If that row is missing the call fails with
  `FAILED_TO_OBTAIN_DB_PARAMETERS_FOR_SECONDARY_TENANT`.
- **Companies and branches on both sides**, before business mapping will validate
  (`T2T_BUSINESS_MAPPING_SELF_COMP_GUID_DOES_NOT_EXIST`,
  `T2T_BUSINESS_MAPPING_SELF_BRANCH_GUID_DOES_NOT_EXIST`).
- **Items in both tenants**, before item mapping can pair them.

### Applet settings

**None can be documented.** The applet's settings, if it has any, are inside the pre-built bundle;
there is no repository, no settings component and no `app.routing.ts` to read (repository search
over all 455 organisation repositories, 2026-09-06). No `bl_applet_ext` key is read for
`t2tAdminApplet` anywhere in the Java backend either — a grep for the applet code in
`blg-akaun-platform-java` returns nothing.

### Feature visibility / permissions

T2T has its own permission family, `T2TPermissions`, and it is unusually complete: every resource
carries `OWNER`, `ADMIN`, `MEMBER`, `CREATE`, `UPDATE`, `DELETE` and `READ` codes.

| Permission group | Governs |
|---|---|
| `T2T_TENANT_INVITATION_*` | Sending, answering and updating invitations |
| `T2T_TENANT_DM_ERP_BUSINESS_MAPPING_*` | Creating, updating and deleting company/branch mappings |
| `T2T_TENANT_DM_ERP_BUSINESS_MAPPING_COMPANY_READ`, `…_BRANCH_READ` | Reading the other tenant's companies and branches — these two are *target-scoped* permissions (`bl_fi_mst_comp`, `bl_fi_mst_branch`), so they can be granted company by company |
| `T2T_DM_FI_ITEM_TO_TENANT_LINK_*` | The host granting a guest permission to map an item |
| `T2T_GUEST_DM_FI_ITEM_TO_TENANT_LINK_*` | The guest's read of those permissions |
| `T2T_DM_FI_ITEM_TO_ITEM_LINK_*`, `T2T_DM_HOST_FI_ITEM_TO_ITEM_LINK_*` | Item-to-item mapping, guest side and host side |
| `T2T_EXTERNAL_TEAM_HOST_*`, `T2T_EXTERNAL_TEAM_GUEST_*` | External teams and their members |
| `T2T_ROLE_LISTING_*` | Roles used across the connection |
| `T2T_AUDIT_TRAIL_EVENT_*` | The audit trail |

Every T2T endpoint applies the same rule: the caller passes if they are the tenant **owner or
admin** (`UserPermissionService.isUserOwnerOrAdmin`) **or** hold any one of that endpoint's
required permission codes. A read the caller is not entitled to does not error — it returns the
record with its `status` replaced by `PERMISSION_DENIED` and every other field stripped
(`TenantInvitationController.replaceTenantWithoutPermission`,
`T2TAuditTrailEventController.replaceEventsWithoutPermission`). Expect blank rows rather than an
error message.

## Fields

The applet's form fields cannot be read. These are the persisted columns, which is what the API
accepts and returns.

### Tenant link (`app_tenant_hdr`, rows with `obj_type = 'T2T'`)

| Field | Meaning | Notes |
|---|---|---|
| `code` | The **other** tenant's code | Must differ from your own; must exist in `akaun_master` |
| `obj_access` | `HOST` or `GUEST` | Which side of the connection this row represents |
| `obj_status` | `INVITED`, `CONNECTED`, `REJECTED`, `DISCONNECTED` | The only four states |
| `name`, `description` | Free text for the connection | Both sides are written with the same values at invitation time |
| `host_approved` | Whether the host permits the guest to reconnect | Set to `true` when the invitation is created |

### Business mapping (`bl_t2t_comp_branch_entity_link`)

| Field | Meaning | Notes |
|---|---|---|
| `self_comp_guid`, `self_branch_guid` | Your company and branch | Validated to exist in your tenant |
| `self_entity_hdr_guid`, `self_entity_line_guid` | Your customer/supplier record for the other party | Header and the specific address/contact line |
| `other_tenant_guid` | The tenant on the other side | Required |
| `other_comp_guid`, `other_branch_guid`, `other_entity_hdr_guid`, `other_entity_line_guid` | The mirror-image values in the other tenant | Written by the server, not by you — see Lifecycle |
| `status` | Standard status column | `INACTIVE` is rejected on update (`T2T_BUSINESS_MAPPING_STATUS_IS_INACTIVE`) |

### Item permission (`bl_t2t_fi_item_to_tenant_link`)

| Field | Meaning | Notes |
|---|---|---|
| `host_fi_item_guid` | The host's item being opened up | Required, must exist |
| `other_tenant_guid` | The guest tenant allowed to map to it | Required |
| `status` | Standard status column | See the note in Troubleshooting — it is **not** consulted when the permission is checked |

### Item mapping (`bl_t2t_item_to_item_link`)

| Field | Meaning | Notes |
|---|---|---|
| `fi_item_guid` | The item in *this* tenant | Required |
| `other_fi_item_guid` | The item in the other tenant | Required |
| `other_tenant_guid` | The other tenant | Required |
| `other_tenant_type` | `HOST` or `GUEST` | Determines which endpoint may write the row |

### Audit trail event (`bl_t2t_audit_trail_event`)

| Field | Meaning | Notes |
|---|---|---|
| `guest_tenant_guid` | The tenant the event concerns | Required |
| `action` | One of thirteen action types, e.g. `CREATE_NEW_GUEST_TENANT`, `INVITATION_ACCEPTED`, `CREATED_NEW_MAPPING` | Written by the server |
| `event_code` | `CREATE`, `MAIN_DETAILS`, `DELETE`, `INVITE`, `MAPPING` | Written by the server |
| `txn_type` | `HOST` or `GUEST` | Which side the event was logged from |
| `message_json` | Currently always `{ "tenantCode": … }` | |
| `login_subject_guid`, `date_created` | Who and when | Required by the validator |

## Lifecycle and effects

T2T writes no journal and moves no stock. It maintains link tables, and its defining property is
that **almost every write touches two databases**.

### Connecting two tenants

1. **Invite.** The host posts the guest's tenant code to `tenants-linking/invite`. The server
   inserts one `app_tenant_hdr` row in the *host's* database with `obj_access = GUEST` and one in
   the *guest's* database with `obj_access = HOST`, both `INVITED`, both `host_approved = true`.
2. **Answer.** The guest calls `tenants-linking/{hostCode}/invitation-response?response=…` with
   `ACCEPT`, `REJECT`, `DISCONNECT` or `CONNECT`. Both rows move to `CONNECTED`, `REJECTED` or
   `DISCONNECTED` together. `CONNECT` (reconnecting after a disconnect) is refused unless the
   host's row still has `host_approved = true`
   (`GUEST_ARE_NOT_ALLOWED_TO_CONNECT_BACK_IF_HOST_NOT_APPROVED`).
3. **Audit.** Each step writes a `bl_t2t_audit_trail_event` row.

There is **no cross-database transaction.** Each of these operations writes the first row, then
writes the second with a plain DAO insert or update, and if that second write does not affect
exactly one row it deletes or restores the first and throws `MULTIPLE_INSERT_OPERATION_FAILED` /
`MULTIPLE_UPDATE_OPERATION_FAILED`. A failure *after* the compensating write itself fails leaves
the two databases disagreeing, with no repair job to reconcile them.

There is also **no delete endpoint** on `tenants-linking` — the controller exposes `POST /invite`,
`PUT /{code}/invitation-response`, `PUT`, `GET` and `GET /query` and nothing else. A connection
row, including a `REJECTED` one, is permanent.

### Mapping companies and branches

`BusinessMappingService.createMapping` builds the mirror record itself: it copies the client's
`other_comp_guid` / `other_branch_guid` into the guest row's `self_*` columns and the client's
`self_entity_*` into the guest row's `other_entity_*`, then validates and writes both rows in
their respective databases. Update and delete follow the same two-sided pattern, locating the
guest's row by `other_entity_line_guid` or `other_branch_guid`.

The two "custom" read endpoints behave differently and the difference matters:
`business-mapping/custom/getAll` returns every company/branch of every connected tenant, with a
`null` mapping where none exists; `business-mapping/custom/getMappedOnly` returns only the pairs
that are actually mapped. Both open a database connection **per connected tenant** and iterate the
other tenant's companies and branches in memory.

### Sharing items

Item sharing is deliberately two-step and host-controlled:

1. The **host** creates a `bl_t2t_fi_item_to_tenant_link` row: "guest tenant X may map to my item
   Y". This is the only T2T write that fires a webhook — `T2T_ITEM_TO_TENANT_LINKING_ADDED` on
   create and `T2T_ITEM_TO_TENANT_LINKING_UPDATED` on update.
2. The **guest** creates the `bl_t2t_item_to_item_link` pair. The server refuses if no permission
   row exists (`HOST_FI_ITEM_GUID_LINKING_IS_NOT_ALLOWED`) and refuses if the guest tries to
   describe the other side as a guest rather than a host
   (`OTHER_TENANT_TYPE_GUEST_IS_NOT_ALLOWED`). As with business mapping, the server composes the
   mirror row for the host's database and writes both.

An item can only be in one pair per connection in each direction — a second attempt raises
`T2T_ITEM_TO_ITEM_LINK_HOST_TENANT_ITEM_IS_ALREADY_LINKED_WITH_ANOTHER_ITEM_OF_GUEST_TENANT` or
its guest-side twin.

### External teams

An external team is an ordinary team row (`app_mst_grp_hdr`) with `group_type = T2T` and
`t2t_other_tenant_guid` set to the other tenant. Creating one also inserts the creating user as
`OWNER` with the title `T2T OWNER`, and — unlike the tenant and mapping paths — this pair of
writes **is** wrapped in a real database transaction, because both rows are in the same database.
Adding and removing members writes ordinary team-membership rows.

## Related applets

- [Doc Item Maintenance](/applets/master-data/doc-item-maintenance-applet/) — hosts the *T2T Item
  Mapping* tab, the only shipped screen that reads and writes T2T item links.
- [Organization](/applets/master-data/organisation-applet/) — supplies the companies, branches and
  customer/supplier entities that a business mapping pairs up.
- [Tenant Admin](/applets/tenant-admin-applet/) — administers a single tenant; T2T administers the
  relationship *between* two tenants.
- [Employee](/applets/master-data/employee-applet/) — the users who end up in an external team.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| `TENANT_INVITATION_OR_CONNECTION_ALREADY_EXISTS` when re-inviting a tenant that rejected you | The rejected row is still in your database and the duplicate check does not look at status, only at code and `obj_access = GUEST`. There is no delete endpoint for connection rows. | Use `PUT /tenants-linking` to move the existing row's status rather than sending a new invitation |
| The guest tenant list shows tenants that never accepted | `T2TTenantService.getTenantPerm` builds its query as `…&obj_status = CONNECTED` — with spaces around the `=` (`blg-akaun-ts-lib` `t2t-tenant.service.ts:53`). The parameter name arrives as `obj_status ` and does not bind, so the status filter is silently dropped and `INVITED`, `REJECTED` and `DISCONNECTED` rows are returned too. | Confirm the connection's status before mapping to it. Reported as a product defect. |
| An item can still be mapped after you set its sharing permission to `INACTIVE` | `T2TItemToTenantLinkUow.checkItemPerm` runs `select * from bl_t2t_fi_item_to_tenant_link where host_fi_item_guid = :guid and status != 'DELETED'` — it does not test for `ACTIVE`. | Delete the permission row rather than deactivating it |
| `FAILED_TO_OBTAIN_DB_PARAMETERS_FOR_SECONDARY_TENANT` | The other tenant has no connection record in the master registry | Platform-side fix; the tenant cannot participate in T2T until it has one |
| `MULTIPLE_INSERT_OPERATION_FAILED` / `MULTIPLE_UPDATE_OPERATION_FAILED` | The second of the two database writes did not affect exactly one row; the first was rolled back by a compensating statement | Retry. If the symptom repeats, the two databases may already disagree — compare the `app_tenant_hdr` T2T rows on both sides |
| `T2T_BUSINESS_MAPPING_ENTITY_LINE_OR_BRANCH_GUID_DOES_NOT_EXISTS` on update | The mirror row could not be found in the other tenant, because the update looks it up by `other_entity_line_guid` when no branch is supplied and by `other_branch_guid` when one is | Supply the same combination of branch / entity line that was used when the mapping was created |
| The item's T2T Item Mapping tab is blank | No connected tenant, so the tenant drop-down that the tab loads first is empty | Complete the invitation and acceptance before opening the item |
| Reads come back with `status: PERMISSION_DENIED` and no other data | The caller holds none of the endpoint's permissions and is not an owner or admin | Grant one of the `T2T_*` permission codes listed above |

## Related documentation

- [Doc Item Maintenance applet](/applets/master-data/doc-item-maintenance-applet/)
- [Organization applet](/applets/master-data/organisation-applet/)
- [Core module](/modules/core/)
