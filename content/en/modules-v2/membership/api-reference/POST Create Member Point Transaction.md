# POST Create Member Point Transaction

## Endpoint

**URL:** `https://api.akaun.com/core2/tnt/dm/crm/membership-points-txn/txn-line/backoffice-ep`  
**Method:** `POST`  
**Headers:**
- `Authorization: <JWT Token>`  
- `tenantCode: <Tenant Code>`  
- `Content-Type: application/json`

---

## Description

This endpoint creates a new point transaction for a member. It requires a JSON payload containing the point transaction. The API responds with the created point transaction and any related information.

---

## Postman / cURL Example

```bash
postman request POST 'https://api.akaun.com/core2/tnt/dm/crm/membership-points-txn/txn-line/backoffice-ep' \
  --header 'Authorization: eyJhbGciOiJSUzI1NiJ9.eyJzdWJqZWN0R3VpZCI6ImE5ODJlMTQ4LTMwMjYtNDVkYi1iMGU1LTA3NTAwM2Q1ZDNhNCIsImFwcENvZGUiOiIiLCJ0ZW5hbnRDb2RlIjoiIiwic3lzQWRtaW5HdWlkIjoiMWRkNDU1NmMtNDY2NC00MWViLTlmZmItZTM4MWJlNDdlOTc1Iiwic3lzQWRtaW5SYW5rIjoiQURNSU4iLCJhcHBsZXRMb2dpblN1YmplY3RMaW5rR3VpZCI6IiIsImFwcGxldEd1aWQiOiIiLCJ0ZW5hbnRHdWlkIjoiIiwiYXBwbGV0TG9naW5TdWJqZWN0UmFuayI6IiIsInJlZ2lzdHJhdGlvblRva2VuU3RhcnREYXRlVGltZSI6IiIsImV4cCI6MTc2NTcwMTI3NH0.dBH6v8txxDhatE2iNzGFy5v0xs9qwhot0N7BFae2U9SVAZpHSBOwVyHsIH4PhyRUzXpxhFdZomT_jjMGLvsP4EfGHGbPm6kFmxgPwhyIr2M_T9szxjTFC3sALgeoBjp1IK4a3Acj8wGY9OJjJNmmIdAA_4703BXviFR5GbD_cQg' \
  --header 'tenantCode: testing' \
  --header 'Content-Type: application/json' \
  --body '{
    "bl_crm_membership_points_txn_line" : {
        "points_value": "100",
        "card_no": "930425035569",
        "membership_hdr_guid": "912f340d-159f-4830-b102-4b4452eef834",
        "txn_type": "REWARD"
    }
}'
```

---

## Request Body

**Content-Type:** `application/json`  

- `bl_crm_membership_points_txn_line` (object, required): Contains the full point transaction details.

**All Fields:**
- `guid` (UUID)
- `txn_type`
- `branch_guid` (UUID)
- `company_guid` (UUID)
- `entity_hdr_guid` (UUID)
- `membership_hdr_guid` (UUID)
- `txn_hdr_guid` (UUID)
- `card_no`
- `doc_hdr_guid`
- `doc_line_guid`
- `item_hdr_guid`
- `item_code`
- `date_txn` (ZonedDateTime)
- `date_valid_from` (ZonedDateTime)
- `date_valid_to` (ZonedDateTime)
- `points_type`
- `points_value` (BigDecimal)
- `points_balance` (BigDecimal)
- `remarks`
- `description`
- `client_key`
- `client_source`
- `status` (StatusColumn)
- `revision`
- `vrsn`
- `point_currency_guid` (UUID)
- `property_json` (Map<String, Object>)
- `client_value`
- `point_currency`
- `created_date` (ZonedDateTime)
- `updated_date` (ZonedDateTime)
- `created_by_subject_guid` (UUID)
- `updated_by_subject_guid` (UUID)
- `source`
- `txn_count` (Integer)
- `ocr_doc_hdr_guid` (UUID)
- `ocr_doc_line_guid` (UUID)
- `ctrl_acc_guid` (UUID)
- `client_doc_1`
- `client_doc_2`
- `client_doc_3`
- `client_doc_4`
- `client_doc_5`
- `client_txn_line_primary_key`
- `client_txn_type`
- `display_type`
- `client_doc_amount_1` (BigDecimal)
- `client_doc_amount_2` (BigDecimal)
- `client_doc_amount_3` (BigDecimal)
- `client_doc_type_1`
- `client_doc_type_2`
- `client_doc_type_3`
- `client_doc_type_4`
- `client_doc_type_5`


---

## Response

**Content-Type:** `application/json`

### Sample Response

```json
{
    "code": "OK_RESPONSE",
    "data": {
        "bl_crm_membership_points_txn_line": {
            "guid": "e8d28e13-881a-466d-b77d-6393c76cdc6d",
            "txn_type": "REWARD",
            "branch_guid": null,
            "company_guid": null,
            "entity_hdr_guid": null,
            "membership_hdr_guid": "912f340d-159f-4830-b102-4b4452eef834",
            "txn_hdr_guid": null,
            "card_no": "930425035569",
            "doc_hdr_guid": null,
            "doc_line_guid": null,
            "item_hdr_guid": null,
            "item_code": null,
            "date_txn": "2025-11-26T03:49:19.78686673Z",
            "date_valid_from": "1900-01-01T00:00:00Z",
            "date_valid_to": "9000-12-31T23:59:59Z",
            "points_type": null,
            "points_value": 100,
            "points_balance": 0,
            "remarks": null,
            "description": null,
            "client_key": null,
            "client_source": null,
            "status": "ACTIVE",
            "revision": "1af82880-6c3d-4f18-b9d0-1356254b8340",
            "vrsn": null,
            "point_currency_guid": null,
            "property_json": null,
            "client_value": null,
            "point_currency": "DEF",
            "created_date": "2025-11-26T03:49:19.786869119Z",
            "updated_date": "2025-11-26T03:49:19.786869739Z",
            "created_by_subject_guid": "a982e148-3026-45db-b0e5-075003d5d3a4",
            "updated_by_subject_guid": "a982e148-3026-45db-b0e5-075003d5d3a4",
            "source": null,
            "txn_count": null,
            "ocr_doc_hdr_guid": null,
            "ocr_doc_line_guid": null,
            "ctrl_acc_guid": null,
            "client_doc_1": null,
            "client_doc_2": null,
            "client_doc_3": null,
            "client_doc_4": null,
            "client_doc_5": null,
            "client_txn_line_primary_key": null,
            "client_txn_type": null,
            "display_type": "DISPLAY",
            "client_doc_amount_1": null,
            "client_doc_amount_2": null,
            "client_doc_amount_3": null,
            "client_doc_type_1": null,
            "client_doc_type_2": null,
            "client_doc_type_3": null,
            "client_doc_type_4": null,
            "client_doc_type_5": null
        }
    },
    "message": ""
}
```

---

## Notes

- Ensure JWT token is valid and tenant code is correct.  
- `guid` values must be unique UUIDs, but can be set to null if you want the system to auto generate a UUID for you.
- `membership_hdr_guid` links to the bl_crm_membership_hdr, is needed for points calculation for member
