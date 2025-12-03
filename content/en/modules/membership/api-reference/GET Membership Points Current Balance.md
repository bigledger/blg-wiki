# GET Membership Points Current Balance

## Endpoint

**URL:** `https://api.akaun.com/core2/tnt/dm/crm/membership-points-txn/current-balance/query`  
**Method:** `GET`  
**Headers:**
- `Authorization: <JWT Token>`  
- `tenantCode: <Tenant Code>`  
- `Content-Type: application/json`

---

## Description

This endpoint retrieves the current point balance for members based on filtering and pagination criteria.

---

## Postman / cURL Example

```bash
postman request 'https://api.akaun.com/core2/tnt/dm/crm/membership-points-txn/current-balance/query?calcTotalRecords=true&membership_hdr_guid=912f340d-159f-4830-b102-4b4452eef834' \
  --header 'Authorization: eyJhbGciOiJSUzI1NiJ9.eyJzdWJqZWN0R3VpZCI6ImE5ODJlMTQ4LTMwMjYtNDVkYi1iMGU1LTA3NTAwM2Q1ZDNhNCIsImFwcENvZGUiOiIiLCJ0ZW5hbnRDb2RlIjoiIiwic3lzQWRtaW5HdWlkIjoiMWRkNDU1NmMtNDY2NC00MWViLTlmZmItZTM4MWJlNDdlOTc1Iiwic3lzQWRtaW5SYW5rIjoiQURNSU4iLCJhcHBsZXRMb2dpblN1YmplY3RMaW5rR3VpZCI6IiIsImFwcGxldEd1aWQiOiIiLCJ0ZW5hbnRHdWlkIjoiIiwiYXBwbGV0TG9naW5TdWJqZWN0UmFuayI6IiIsInJlZ2lzdHJhdGlvblRva2VuU3RhcnREYXRlVGltZSI6IiIsImV4cCI6MTc2NTcwMTI3NH0.dBH6v8txxDhatE2iNzGFy5v0xs9qwhot0N7BFae2U9SVAZpHSBOwVyHsIH4PhyRUzXpxhFdZomT_jjMGLvsP4EfGHGbPm6kFmxgPwhyIr2M_T9szxjTFC3sALgeoBjp1IK4a3Acj8wGY9OJjJNmmIdAA_4703BXviFR5GbD_cQg' \
  --header 'tenantCode: testing'
```

---

## Query Parameters

### **Pagination & Sorting**
- `limit` (default: 100)
- `offset` (default: 0)
- `orderBy`
- `order` (`ASC` or `DESC`)
- `calcTotalRecords` (boolean)

### **Filtering Fields**
- `membership_hdr_guid` (UUID)
- `card_no`
- `point_currency`
- `point_balance` (BigDecimal)
- `namespace`
- `applet_guid` (UUID)
- `module_guid` (UUID)
- `created_date_to`
- `created_date_from`
- `updated_date_to`
- `updated_date_from`
---

## Response

**Content-Type:** `application/json`

### Example Response
```json
{
    "totalRecords": 1,
    "offset": 0,
    "limit": 100,
    "code": "OK_RESPONSE",
    "message": "",
    "data": [
        {
            "bl_crm_membership_points_current_balance": {
                "guid": "354c6c34-59b3-424c-bb06-f3efabd09f24",
                "membership_hdr_guid": "912f340d-159f-4830-b102-4b4452eef834",
                "card_no": "930425035569",
                "point_currency": "DEF",
                "point_balance": 10340.0000000000000000000000,
                "namespace": null,
                "applet_guid": null,
                "module_guid": null,
                "created_date": "2022-12-09T04:12:48.885498Z",
                "updated_date": "2025-11-26T03:49:19.925594Z",
                "status": "ACTIVE",
                "revision": "afb316a8-76ff-4603-9bd8-0f0eb1955971",
                "vrsn": null
            }
        }
    ]
}
```

---

## Notes
- `calcTotalRecords=true` adds overhead; enable only when the UI needs record count.
