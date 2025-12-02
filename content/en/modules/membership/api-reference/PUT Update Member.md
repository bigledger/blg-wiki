# PUT Update Member

## Endpoint

**URL:** `https://api.akaun.com/core2/tnt/dm/membership-cards`  
**Method:** `PUT`  
**Headers:**
- `Authorization: <JWT Token>`  
- `tenantCode: <Tenant Code>`  
- `Content-Type: application/json`

---

## Description

This endpoint updates an existing membership row for a member. It requires a JSON payload containing the membership header. The API responds with the updated membership data and any related extended information.

---

## Postman / cURL Example

```bash
PUT 'https://api.akaun.com/core2/tnt/dm/membership-cards' \
  --header 'Authorization: <JWT Token>' \
  --header 'tenantCode: testing' \
  --header 'Content-Type: application/json' \
  --body '{
    "bl_crm_membership_hdr": {
            "guid": "a7524e4a-5c1c-49ca-8518-db8664c56ff8",
            "parent_guid": null,
            "company_guid": null,
            "branch_guid": null,
            "login_subject_guid": null,
            "entity_hdr_guid": "43f946be-6054-4a86-99a1-c2fc9d7bb3ec",
            "entity_line_guid": null,
            "contact_key_guid": null,
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
            "created_date": "2025-11-21T05:40:37.317101867Z",
            "updated_date": "2025-11-21T05:40:37.317102542Z",
            "status": "ACTIVE",
            "revision": "965a55e3-398a-41ce-8549-035065866520",
            "vrsn": null,
            "branch_name": null,
            "branch_code": null,
            "sales_agent_guid": null,
            "sales_agent_name": null,
            "sales_agent_code": null
        }
}'
```

---

## Request Body

**Content-Type:** `application/json`  

- `bl_crm_membership_hdr` (object, required): Contains the full membership details.

**All Fields:**
- `guid`
- `parent_guid`
- `company_guid`
- `branch_guid`
- `login_subject_guid`
- `entity_hdr_guid`
- `entity_line_guid`
- `contact_key_guid`
- `card_type_guid`
- `membership_class_guid`
- `membership_class_code`
- `card_no`
- `card_no_old`
- `id_no`
- `id_type`
- `name`
- `phone`
- `email`
- `ref_1`
- `ref_2`
- `ref_3`
- `ref_4`
- `ref_5`
- `start_date`
- `end_date`
- `card_start_date`
- `card_end_date`
- `client_key`
- `client_source`
- `client_value`
- `client_customer_code`
- `status_01`
- `status_02`
- `xtn_icno`
- `xtn_hand_phone`
- `xtn_home_phone`
- `xtn_office_phone`
- `xtn_email`
- `gender`
- `dob`
- `country_code`
- `remarks`
- `obj_status`
- `member_id`
- `card_type`
- `nationality`
- `ethnicity`
- `language_code`
- `title`
- `region_code`
- `marital_status`
- `occupation`
- `job_title`
- `job_industry`
- `job_role`
- `country_alpha3_code`
- `country_alpha2_code`
- `status_logic`
- `referral_code`
- `addresses_json`
- `job_skills`
- `property_json`
- `module_guid`
- `applet_guid`
- `namespace`
- `created_by_subject_guid`
- `updated_by_subject_guid`
- `created_date`
- `updated_date`
- `status`
- `revision`
- `vrsn`
- `branch_name`
- `branch_code`
- `sales_agent_guid`
- `sales_agent_name`
- `sales_agent_code`

---

## Response

**Content-Type:** `application/json`

### Sample Response

```json
{
    "code": "OK_RESPONSE",
    "data": {
        "bl_crm_membership_hdr": {
            "guid": "03eac7fe-0258-402b-8d3b-da1f3658b8c6",
            "parent_guid": null,
            "company_guid": null,
            "branch_guid": null,
            "login_subject_guid": null,
            "entity_hdr_guid": "866c1e94-99af-442a-8291-d149279fa7dd",
            "entity_line_guid": null,
            "contact_key_guid": null,
            "card_type_guid": null,
            "membership_class_guid": null,
            "membership_class_code": null,
            "card_no": "930425035604",
            "card_no_old": null,
            "id_no": null,
            "id_type": null,
            "name": null,
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
            "member_id": "1000078",
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
            "referral_code": "HHtCyp",
            "addresses_json": {},
            "job_skills": {},
            "property_json": {},
            "module_guid": null,
            "applet_guid": null,
            "namespace": null,
            "created_by_subject_guid": "a982e148-3026-45db-b0e5-075003d5d3a4",
            "updated_by_subject_guid": "a982e148-3026-45db-b0e5-075003d5d3a4",
            "created_date": "2025-11-20T08:40:41.36272441Z",
            "updated_date": "2025-11-20T08:40:41.362725185Z",
            "status": "ACTIVE",
            "revision": "4fdbf06d-76dc-406b-8f21-bb934b63edbb",
            "vrsn": null,
            "branch_name": null,
            "branch_code": null,
            "sales_agent_guid": null,
            "sales_agent_name": null,
            "sales_agent_code": null
        },
        "bl_crm_membership_ext": []
    },
    "message": ""
}
```

---

## Notes

- Ensure JWT token is valid and tenant code is correct.  
- `guid` value must match the row that you are updating.
- `revision` should match the value of the existing member row, otherwise it would throw a race condition
-  To get latest revision, guid value it is recommended to GET latest version of member data and update that
