# GET Members by Criteria

## Endpoint

**URL:** `https://api.akaun.com/core2/tnt/dm/membership-cards/query`  
**Method:** `GET`  
**Headers:**
- `Authorization: <JWT Token>`  
- `tenantCode: <Tenant Code>`  
- `Content-Type: application/json`

---

## Description

This endpoint gets existing members by query criteria.

---

## Postman / cURL Example

```bash
GET 'https://api.akaun.com/core2/tnt/dm/membership-cards/query?calcTotalRecords=true&guids=a7524e4a-5c1c-49ca-8518-db8664c56ff8' \
  --header 'Authorization: <JWT Token>' \
  --header 'tenantCode: testing'
```

---

## Query Parameters
### **Pagination & Sorting**
- `limit` (default: 100)
- `offset` (default: 0)
- `orderBy`
- `order` (default: `ASC`)
- `calcTotalRecords` (boolean)

### **Filtering Fields**
- `guids`: Set<UUID>
- `entity_hdr_guids`: Set<UUID>
- `card_no`
- `member_id`
- `id_no`
- `id_type`
- `phone`
- `is_phone_encoded`
- `email`
- `ref_1`, `ref_2`, `ref_3`, `ref_4`, `ref_5`
- `login_subject_guid`
- `start_date`
- `end_date`
- `entity_hdr_guid`
- `company_guid`
- `branch_guid`
- `created_from`
- `created_to`
- `contact_key_guid`
- `name`
- `client_key`
- `client_source`
- `membership_class_guid`: UUID
- `membership_class_guids`: Set<UUID>
- `membership_class_code`
- `gender`
- `dob` (ISO datetime)
- `country_code`
- `hdr_created_date_to`
- `hdr_created_date_on`
- `hdr_created_date_from`
- `hdr_updated_date_to`
- `hdr_updated_date_from`
- `hdr_updated_date_on`
- `status_01`
- `card_no_like`
- `name_like`
- `id_no_like`
- `id_type_like`
- `phone_like`
- `email_like`
- `member_id_like`
- `end_date_from`
- `end_date_to`
- `dob_from`
- `dob_to`
- `start_date_from`
- `start_date_to`
- `card_type`
- `card_type_guids`: Set<UUID>
- `client_customer_code`
- `nationality`
- `occupation`
- `marital_status`
- `card_end_date_from`
- `card_end_date_to`
- `card_start_date_from`
- `card_start_date_to`
- `xtn_icno`
- `xtn_hand_phone`
- `xtn_home_phone`
- `xtn_office_phone`
- `xtn_email`
---

## Response

**Content-Type:** `application/json`

## Example Response
```json
{
    "totalRecords": 1,
    "offset": 0,
    "limit": 100,
    "code": "OK_RESPONSE",
    "message": "",
    "data": [
        {
            "bl_crm_membership_hdr": {
                "guid": "a7524e4a-5c1c-49ca-8518-db8664c56ff8",
                "parent_guid": null,
                "company_guid": null,
                "branch_guid": null,
                "login_subject_guid": null,
                "entity_hdr_guid": "43f946be-6054-4a86-99a1-c2fc9d7bb3ec",
                "entity_line_guid": null,
                "contact_key_guid": "88080b90-9b96-48cc-8dd6-c3570dd1e64e",
                "card_type_guid": null,
                "membership_class_guid": null,
                "membership_class_code": null,
                "card_no": "930425035605",
                "card_no_old": null,
                "id_no": null,
                "id_type": null,
                "name": "Tanvir",
                "phone": null,
                "email": null,
                "ref_1": null,
                "ref_2": null,
                "ref_3": null,
                "ref_4": null,
                "ref_5": null,
                "start_date": null,
                "end_date": null,
                "card_start_date": null,
                "card_end_date": null,
                "client_key": null,
                "client_source": null,
                "client_value": null,
                "client_customer_code": null,
                "status_01": null,
                "status_02": null,
                "xtn_icno": null,
                "xtn_hand_phone": null,
                "xtn_home_phone": null,
                "xtn_office_phone": null,
                "xtn_email": null,
                "gender": null,
                "dob": null,
                "country_code": null,
                "remarks": null,
                "obj_status": null,
                "member_id": "1000079",
                "card_type": null,
                "nationality": null,
                "ethnicity": null,
                "language_code": null,
                "title": null,
                "region_code": null,
                "marital_status": null,
                "occupation": null,
                "job_title": null,
                "job_industry": null,
                "job_role": null,
                "country_alpha3_code": null,
                "country_alpha2_code": null,
                "status_logic": null,
                "referral_code": "wuNnvu",
                "addresses_json": {},
                "job_skills": {},
                "property_json": {},
                "module_guid": null,
                "applet_guid": null,
                "namespace": null,
                "created_by_subject_guid": "a982e148-3026-45db-b0e5-075003d5d3a4",
                "updated_by_subject_guid": "a982e148-3026-45db-b0e5-075003d5d3a4",
                "created_date": "2025-11-21T05:40:37.317102Z",
                "updated_date": "2025-11-21T05:42:58.547494Z",
                "status": "ACTIVE",
                "revision": "6cc03cfe-d4d5-4905-a98f-411faba4b1f2",
                "vrsn": null,
                "branch_name": null,
                "branch_code": null,
                "sales_agent_guid": null,
                "sales_agent_name": null,
                "sales_agent_code": null
            },
            "bl_crm_membership_ext": []
        }
    ]
}
```

---

## Notes
- Use `calcTotalRecords=true` only when necessary, as it may add overhead.
