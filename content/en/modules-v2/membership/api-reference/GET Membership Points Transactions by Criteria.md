# GET Membership Points Transactions by Criteria

## Endpoint

**URL:** `https://api.akaun.com/core2/tnt/dm/crm/membership-points-txn/backoffice-ep/lines/query`  
**Method:** `GET`  
**Headers:**
- `Authorization: <JWT Token>`  
- `tenantCode: <Tenant Code>`  
- `Content-Type: application/json`

---

## Description

This endpoint retrieves membership points transaction based on filtering and pagination criteria.

---

## Postman / cURL Example

```bash
GET 'https://api.akaun.com/core2/tnt/dm/crm/membership-points-txn/backoffice-ep/lines/query?limit=100&offset=0&calcTotalRecords=true&guid_pricing_scheme_hdr=22087fa8-d884-4f16-9dcc-42b2f700c4a2'   --header 'Authorization: <JWT Token>'   --header 'tenantCode: testing'
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
- date_valid_from
- date_valid_to
- date_txn
- date_txn_from
- date_txn_to
- txn_type
- item_code
- entity_hdr_guid (UUID)
- membership_hdr_guid (UUID)
- item_hdr_guid
- company_guid (UUID)
- branch_guid (UUID)
- doc_hdr_guid
- points_type
- card_no
- client_key
- client_source
- client_value
- point_currency
- point_currency_guid (UUID)
- line_created_date_from
- line_created_date_to
- line_updated_date_from
- line_updated_date_to
- txn_count
- positive_points_values
- source
- display_type
- client_doc_1
- client_doc_2
- client_doc_3
- client_doc_4
- client_doc_5
- client_doc_amount_1
- client_doc_amount_2
- client_doc_amount_3
- client_doc_type_1
- client_doc_type_2
- client_doc_type_3
- client_doc_type_4
- client_doc_type_5


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
            "bl_crm_membership_points_txn_line": {
                "guid": "ec082003-88aa-44ea-bf7f-73fc9ec2d58d",
                "txn_type": "REDEEM",
                "branch_guid": null,
                "company_guid": null,
                "entity_hdr_guid": null,
                "membership_hdr_guid": "e8c90909-d94c-4b05-969c-200bf2c1e187",
                "txn_hdr_guid": null,
                "card_no": "8888880100655908",
                "doc_hdr_guid": null,
                "doc_line_guid": null,
                "item_hdr_guid": null,
                "item_code": null,
                "date_txn": "2025-04-29T16:00:00Z",
                "date_valid_from": "2025-04-29T16:00:00Z",
                "date_valid_to": "2025-04-29T16:00:00Z",
                "points_type": "S-Coin                                            ",
                "points_value": 0,
                "points_balance": 0,
                "remarks": "REF_NO_MV=JUR_SC_PTS*SC_EXP202504 || AMOUNT_MV=0.00 || INV_AMOUNT_MV=0.00",
                "description": null,
                "client_key": "EDA_SHCT_TRX1.ID",
                "client_source": "senheng_mbs",
                "status": "ACTIVE",
                "revision": "edeecb7b-8e1c-4bfd-9047-d061f7fd1c20",
                "vrsn": null,
                "point_currency_guid": "8e6bfd94-9d13-44a6-8ffb-b23343926f65",
                "property_json": null,
                "client_value": "5687331",
                "point_currency": "S-Coin",
                "created_date": "2025-06-04T00:47:38.086Z",
                "updated_date": "2025-06-04T00:47:38.086Z",
                "created_by_subject_guid": "0c51fdb0-a897-4d9b-99a7-a68a5688b308",
                "updated_by_subject_guid": "0c51fdb0-a897-4d9b-99a7-a68a5688b308",
                "source": null,
                "txn_count": 15,
                "ocr_doc_hdr_guid": null,
                "ocr_doc_line_guid": null,
                "ctrl_acc_guid": null,
                "client_doc_1": "JUR_SC_PTS*SC_EXP202504",
                "client_doc_2": "JUR_SC_PTS*SC_EXP202504",
                "client_doc_3": null,
                "client_doc_4": null,
                "client_doc_5": null,
                "client_txn_line_primary_key": null,
                "client_txn_type": null,
                "display_type": "DISPLAY",
                "client_doc_amount_1": 0E-22,
                "client_doc_amount_2": 0E-22,
                "client_doc_amount_3": null,
                "client_doc_type_1": "BURN",
                "client_doc_type_2": "DEDUCT",
                "client_doc_type_3": null,
                "client_doc_type_4": null,
                "client_doc_type_5": null
            }
        }
    ]
}
```

---

## Notes
- `calcTotalRecords=true` adds overhead; enable only when the UI needs record count.


