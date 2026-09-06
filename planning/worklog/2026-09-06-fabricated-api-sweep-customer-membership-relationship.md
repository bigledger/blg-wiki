---
date: 2026-09-06
unit: fabricated-api-sweep (planning/reviews/2026-09-06-fabricated-api-sweep.md)
unpublished_from:
  - content/en/modules/membership/core-concepts/customer-membership-relationship.md
  - content/en/modules-v2/membership/core-concepts/customer-membership-relationship.md
url:
  - /modules/membership/core-concepts/customer-membership-relationship/
  - /modules-v2/membership/core-concepts/customer-membership-relationship/
tier: 1
mechanism: draft
reason: "The 'Technical Implementation' section documents a database schema and four REST endpoints that do not exist. The two files are byte-identical."
evidence:
  - "Page L439-446 documents GET /api/customers/{customer_id}/memberships, POST /api/memberships/{membership_id}/earn-points, POST /api/memberships/{membership_id}/redeem-points, POST /api/transactions. The backend resolves 18,630 request mappings over 12,050 unique paths; 11,999 of those paths are under /core2/ and none of the four exist at any depth. Prefixes: javasdk/src/main/java/com/bigledger/core2/common/api/constants/Core2Config.java:19-90."
  - "Real membership endpoints, verified exact: /core2/tnt/dm/membership-cards, /core2/tnt/dm/membership-cards/query, /core2/tnt/dm/crm/membership-points-txn/current-balance/query, /core2/tnt/dm/crm/membership-points-txn/backoffice-ep/lines/query, /core2/tnt/dm/crm/membership-points-txn/txn-line/backoffice-ep. They are documented correctly two folders away in modules/membership/api-reference/."
  - "Page L404-437 presents a schema of CUSTOMER / MEMBERSHIP / POINTS_BALANCE tables with columns membership_id, program_id, member_class_id, enrollment_date, lifetime_earned, lifetime_redeemed. The real tables are bl_crm_membership_hdr (PK guid; no membership_id, no program_id, no member_class_id, no enrollment_date - tenant-schemas/pcimage/tables/bl_crm/bl_crm_membership_hdr.sql) and bl_crm_membership_points_current_balance (guid, membership_hdr_guid, card_no, point_currency, point_balance - no lifetime columns; same directory). There is no PROGRAM table; the class table is bl_crm_membership_class_hdr."
salvage: >
  Everything above '## Technical Implementation' is orientation prose about the one-to-many
  customer-to-membership model, and the central claim is true: bl_crm_membership_hdr has
  entity_hdr_guid as an ordinary nullable column with no unique constraint, so one customer can
  hold many membership rows. The comparison of one-to-one and one-to-many loyalty designs, the
  use cases and the operational cautions are all worth keeping.
to_rewrite: >
  Keep the concept prose unchanged. Replace '## Technical Implementation' with two things drawn
  from source: the real table shape (bl_crm_membership_hdr.entity_hdr_guid pointing at the
  customer entity, bl_crm_membership_points_current_balance keyed on membership_hdr_guid +
  point_currency), and a pointer to modules/membership/api-reference/, whose six pages are
  verified real. Do not reintroduce an invented ER diagram.
inbound_links_repaired:
  - "content/en/modules/membership/core-concepts/_index.md:235 - the only inbound link; removed in the same commit."
