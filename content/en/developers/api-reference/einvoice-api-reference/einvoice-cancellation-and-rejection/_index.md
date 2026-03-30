---
description: API documentation for e-Invoice cancellation and rejection workflows in BigLedger (Malaysia MyInvois).
tags:
- api-reference
- einvoice
- cancellation
- rejection
title: E-Invoice Cancellation & Rejection
weight: 10
---

> **Two cancellation approaches are available:**
> - **[Rejection Request Flow](#rejection-request-flow)** — A structured multi-step process where a buyer raises a rejection request, an admin reviews and approves it, and then the admin submits it to LHDN. Useful when internal approval tracking is required.
> - **[Direct Cancellation Flow](#direct-cancellation-flow)** — Bypasses the rejection request record entirely. An admin directly sends the cancellation to LHDN using the e-invoice's LHDN document UID. Useful for quick/bulk administrative cancellations.

This section documents the APIs for managing e-invoice rejection requests and submitting cancellations to the LHDN MyInvois portal.

---

## Rejection Request Flow

### Overview

In Malaysia's MyInvois system, a validated e-invoice can only be cancelled within **72 hours** of its validation datetime. BigLedger models this workflow through a structured **rejection request** process:

1. **Buyer (customer) raises a rejection request** — providing the reason and linking it to the validated e-invoice.
2. **Admin reviews and approves/rejects the request** — setting the `system_approval_status` and the `processing_logic` (what action to take after cancellation).
3. **Admin triggers the LHDN submission** — approved rejection requests are processed and submitted to LHDN MyInvois to cancel the e-invoice(s).

---

### Base URL

All endpoints are relative to the tenant-scoped base path:

```
https://api.akaun.com/core2/tnt/dm/erp/e-invoice/request-rejections
```

> **Note:** All API calls require a valid bearer authentication token in the `Authorization` header. The tenant code is resolved from the token.

---

### Authentication & Permissions

These APIs use **back-office endpoints** (`/backoffice-ep`). The caller must have the appropriate role permission granted on their account.

| Permission Code | Required By |
|---|---|
| `API_TNT_DM_ERP_MY_E_INVOICE_REQUEST_REJECTION_INTERNAL_DOC_HDR_CREATE` | Create endpoint |
| `API_TNT_DM_ERP_MY_E_INVOICE_REQUEST_REJECTION_INTERNAL_DOC_HDR_UPDATE` | Update/Approve endpoint |
| `API_TNT_DM_ERP_MY_E_INVOICE_REQUEST_REJECTION_INTERNAL_DOC_HDR_READ` | Submit-to-LHDN endpoint |

---

### Workflow Summary

```
Buyer                  Admin                    System
 │                      │                          │
 │ POST /backoffice-ep   │                          │
 │──────────────────►   │                          │
 │  (Submits rejection   │                          │
 │   request with        │                          │
 │   reason + doc refs)  │                          │
 │                       │                          │
 │                       │  Reviews request         │
 │                       │  Sets processing_logic   │
 │                       │  Sets system_approval_status
 │                       │                          │
 │                       │ PUT /backoffice-ep        │
 │                       │──────────────────────►   │
 │                       │  (Approves or rejects)   │
 │                       │                          │
 │                       │ POST /submit-to-lhdn/    │
 │                       │       backoffice-ep      │
 │                       │──────────────────────►   │
 │                       │  (Triggers LHDN          │
 │                       │   cancellation API)      │
```

---

### API 1: Create Rejection Request

**Buyer / Customer raises a rejection request for a validated e-invoice.**

### Endpoint

```
POST /core2/tnt/dm/erp/e-invoice/request-rejections/backoffice-ep
Content-Type: application/json
Authorization: Bearer <token>
```

### Request Body

The request body wraps a single `bl_fi_my_einvoice_request_rejection_internal_doc_hdr` object:

```json
{
  "bl_fi_my_einvoice_request_rejection_internal_doc_hdr": {
    "guid": "550e8400-e29b-41d4-a716-446655440000",
    "to_irb_doc_hdr_guid": "7b9e2c1a-3f4d-4e8b-a0c2-112233445566",
    "generic_doc_hdr_guid": "a1b2c3d4-e5f6-7890-abcd-ef0123456789",
    "einvoice_supplier_entity_hdr_guid": "c0ffee00-dead-beef-cafe-000000000001",
    "einvoice_buyer_entity_hdr_guid": "c0ffee00-dead-beef-cafe-000000000002",
    "server_doc_type": "INVOICE",
    "reason": "Incorrect tax amount applied to line item 3",
    "request_submitted_datetime": "2026-03-30T10:00:00+08:00",
    "doc_ccy": "MYR",
    "amount_txn": 1500.00,
    "txn_date": "2026-03-28T00:00:00+08:00",
    "document_ref_no": "INV-2026-0042",
    "status": "ACTIVE",
    "revision": "11223344-5566-7788-99aa-bbccddeeff00",
    "created_date": "2026-03-30T10:00:00+08:00",
    "updated_date": "2026-03-30T10:00:00+08:00"
  }
}
```

### Required Fields

| Field | Type | Description |
|---|---|---|
| `to_irb_doc_hdr_guid` | UUID | **Required.** The GUID of the e-invoice to-IRB document being rejected. Must reference an existing record. |
| `einvoice_supplier_entity_hdr_guid` | UUID | **Required.** GUID of the supplier entity. |
| `einvoice_buyer_entity_hdr_guid` | UUID | **Required.** GUID of the buyer entity requesting the rejection. |
| `server_doc_type` | String | **Required.** The type of the source document (e.g., `INVOICE`, `CREDIT_NOTE`). |
| `reason` | String | **Required.** A clear explanation of why the rejection is being requested. |
| `status` | String | **Required.** Record status. Use `ACTIVE`. |
| `revision` | UUID | **Required.** A unique UUID for optimistic concurrency control. |
| `created_date` | ZonedDateTime (ISO 8601) | **Required.** Record creation timestamp. |
| `updated_date` | ZonedDateTime (ISO 8601) | **Required.** Record last-update timestamp. |

### Optional Fields

| Field | Type | Description |
|---|---|---|
| `guid` | UUID | If omitted, the system auto-generates a UUID. |
| `generic_doc_hdr_guid` | UUID | GUID of the linked generic financial document. |
| `request_submitted_datetime` | ZonedDateTime (ISO 8601) | When the buyer formally submitted this rejection request. |
| `doc_ccy` | String | Document currency code (e.g., `MYR`). |
| `amount_txn` | BigDecimal | Transaction amount on the original e-invoice. |
| `txn_date` | ZonedDateTime (ISO 8601) | Transaction date of the original document. |
| `document_ref_no` | String | Reference number of the source document. |
| `server_doc_1` / `server_doc_2` / `server_doc_3` | String | Additional server document reference numbers. |
| `wf_process_hdr_guid` | UUID | Workflow process header GUID (if using a workflow engine). |
| `wf_process_status_guid` | UUID | Workflow process status GUID. |
| `wf_resolution_guid` | UUID | Workflow resolution GUID. |

### System-Populated Fields (do not set manually)

| Field | Auto-set Value | Description |
|---|---|---|
| `company_hdr_guid` | — | Auto-populated by the system from the authenticated tenant's company record. |
| `created_by_subject_guid` | From auth token | The authenticated user's subject GUID. |
| `updated_by_subject_guid` | From auth token | The authenticated user's subject GUID. |
| `system_requestor_status` | `REQUESTED` | Set automatically on creation. |
| `system_processing_status` | `IN-PROGRESS` | Set automatically on creation. |

### Success Response

```json
{
  "code": "OK",
  "data": {
    "bl_fi_my_einvoice_request_rejection_internal_doc_hdr": {
      "guid": "550e8400-e29b-41d4-a716-446655440000",
      "system_requestor_status": "REQUESTED",
      "system_processing_status": "IN-PROGRESS",
      ...
    }
  }
}
```

### Side Effects

After successful creation, the system automatically updates the linked `to_irb` document's `blg_reject_request_datetime` timestamp to the current time.

---

### API 2: Update / Admin Approve Rejection Request

**Admin reviews a rejection request and sets the approval decision and processing logic.**

### Endpoint

```
PUT /core2/tnt/dm/erp/e-invoice/request-rejections/backoffice-ep
Content-Type: application/json
Authorization: Bearer <token>
```

### Request Body

```json
{
  "bl_fi_my_einvoice_request_rejection_internal_doc_hdr": {
    "guid": "550e8400-e29b-41d4-a716-446655440000",
    "system_approval_status": "APPROVED",
    "processing_logic": "VOID_ORIGINAL_DOC",
    "revision": "aabbccdd-eeff-0011-2233-445566778899",
    "updated_date": "2026-03-30T11:00:00+08:00"
  }
}
```

### Required Fields

| Field | Type | Description |
|---|---|---|
| `guid` | UUID | **Required.** The GUID of the rejection request record to update. Must already exist. |
| `system_approval_status` | String | **Required.** The admin's decision. See [Status Values](#status-reference) below. |
| `processing_logic` | String | **Required when approving.** Specifies the action to take if cancellation is approved. See [Processing Logic Options](#processing-logic-options) below. |

### Processing Logic Options

The `processing_logic` field controls what the system does after the LHDN cancellation is confirmed:

| Value | Description |
|---|---|
| `VOID_ORIGINAL_DOC` | Voids the original financial document (e.g., the invoice) in BigLedger. Use this when the transaction should be reversed with no replacement. |
| `REGEN_NEW_EINVOICE` | Regenerates and submits a corrected e-invoice after cancellation. Use this when the invoice needs to be corrected and reissued. |
| `NEW_REVERSAL_DOC` | Creates a new reversal generic document (e.g., a credit note) linked to the original. |
| `CANCEL_FOR_EDIT_AND_RESUBMIT` | Marks the original document for editing and resubmission. The document is cancelled on LHDN but retained in an editable state. |

### Status Reference

#### `system_approval_status`

| Value | Description |
|---|---|
| `APPROVED` | Admin has approved the rejection/cancellation request. The record becomes eligible for LHDN submission. |
| `REJECTED` | Admin has rejected (declined) the cancellation request. No LHDN submission will occur. |
| `PENDING` | Request is awaiting admin review (initial state before admin action). |

#### `system_requestor_status` (read-only, set on creation)

| Value | Description |
|---|---|
| `REQUESTED` | Automatically set when the buyer creates a rejection request. Indicates the request has been formally submitted. |

#### `system_processing_status`

| Value | Description |
|---|---|
| `IN-PROGRESS` | Set on creation. The request is active and eligible to be submitted to LHDN. |
| `COMPLETED` | Set after LHDN cancellation processing is complete (either successfully cancelled or failed). |

#### `lhdn_cancellation_status` (set after LHDN processing)

| Value | Description |
|---|---|
| `Cancelled` | LHDN successfully cancelled the e-invoice. |
| `FAILED` | LHDN cancellation attempt failed. |

### Side Effects

When `system_approval_status` is set to `APPROVED` **and** `processing_logic` is `VOID_ORIGINAL_DOC` or `REGEN_NEW_EINVOICE`, the system updates the linked `to_irb` document's `blg_cancellation_datetime` to the current time (first approval only).

If approval is later **reversed** (set to something other than `APPROVED`), the `blg_cancellation_datetime` is cleared back to `null`.

### Success Response

```json
{
  "code": "OK",
  "data": {
    "bl_fi_my_einvoice_request_rejection_internal_doc_hdr": {
      "guid": "550e8400-e29b-41d4-a716-446655440000",
      "system_approval_status": "APPROVED",
      "processing_logic": "VOID_ORIGINAL_DOC",
      ...
    }
  }
}
```

---

### API 3: Submit Approved Rejections to LHDN

**Triggers the actual cancellation request(s) to the LHDN MyInvois API for all approved rejection records in the given list.**

### Endpoint

```
POST /core2/tnt/dm/erp/e-invoice/request-rejections/submit-to-lhdn/backoffice-ep
Content-Type: application/json
Authorization: Bearer <token>
```

### Request Body

```json
{
  "requestRejectionHdrGuids": [
    "550e8400-e29b-41d4-a716-446655440000",
    "660f9511-f30c-52e5-b827-557766551111"
  ]
}
```

### Fields

| Field | Type | Description |
|---|---|---|
| `requestRejectionHdrGuids` | Set\<UUID\> | **Required.** A set of rejection request header GUIDs to process. Records that do not meet the eligibility criteria are silently skipped. |

### Eligibility Criteria

Only rejection requests matching **all** of the following conditions are processed:

| Field | Required Value |
|---|---|
| `system_approval_status` | `APPROVED` |
| `system_processing_status` | `IN-PROGRESS` |
| `processing_logic` | Must be set (not null) |

Records that are not yet approved, already completed, or missing `processing_logic` are ignored.

### Processing Flow

1. **Creates cancellation queue entries** — Each eligible rejection record is enqueued as a `MyEInvoiceGenDocToIrbCancellationQueueContainer`.
2. **Validates the cancellation window** — The e-invoice must be in `Valid` status on LHDN and within **72 hours** of its validation datetime.
3. **Calls LHDN MyInvois API** — Sends the cancellation request to LHDN for each eligible queue entry.
4. **Executes processing logic** — Based on the `processing_logic` set by the admin, executes the corresponding post-cancellation action (void document, regenerate e-invoice, create reversal doc, etc.).
5. **Updates statuses** — Sets `system_processing_status` to `COMPLETED` and `lhdn_cancellation_status` to either `Cancelled` or `FAILED`.

### Success Response

Returns the updated list of rejection request containers after processing:

```json
{
  "code": "OK",
  "data": [
    {
      "bl_fi_my_einvoice_request_rejection_internal_doc_hdr": {
        "guid": "550e8400-e29b-41d4-a716-446655440000",
        "system_processing_status": "COMPLETED",
        "lhdn_cancellation_status": "Cancelled",
        ...
      }
    }
  ]
}
```

### Important Notes

- The LHDN cancellation window is **72 hours from the e-invoice's validation datetime**. Requests submitted after this window are rejected by LHDN.
- The e-invoice must have `einvoice_document_status = Valid` on LHDN to be eligible for cancellation.
- If a cancellation queue entry already exists in a `SUBMISSION_FAILED` state, it can be retried by calling this endpoint again with the same GUID.
- Email notifications are automatically sent on completion (success or failure) based on the notification configuration.

---

### Complete Field Reference

Full list of all fields on `bl_fi_my_einvoice_request_rejection_internal_doc_hdr`:

| Field | Type | Set on Create | Set on Update | Description |
|---|---|---|---|---|
| `guid` | UUID | Auto / caller | — | Primary key |
| `company_hdr_guid` | UUID | System | — | Linked company (auto-populated) |
| `branch_hdr_guid` | UUID | Caller (optional) | Caller | Linked branch |
| `to_irb_doc_hdr_guid` | UUID | Caller (**required**) | — | The e-invoice to-IRB document being rejected |
| `generic_doc_hdr_guid` | UUID | Caller (optional) | Caller | The linked generic financial document |
| `einvoice_supplier_entity_hdr_guid` | UUID | Caller (**required**) | Caller | Supplier entity |
| `einvoice_buyer_entity_hdr_guid` | UUID | Caller (**required**) | Caller | Buyer entity |
| `server_doc_type` | String | Caller (**required**) | Caller | Source document type (e.g., `INVOICE`) |
| `server_doc_1` / `_2` / `_3` | String | Caller (optional) | Caller | Additional server document references |
| `client_doc_type` | String | Caller (optional) | Caller | Client document type |
| `client_doc_1` / `_2` / `_3` | String | Caller (optional) | Caller | Client document references |
| `einvoice_doc_type` | String | Caller (optional) | Caller | e-Invoice document type code |
| `original_einvoice_validated_datetime` | ZonedDateTime | Caller (optional) | Caller | When the original e-invoice was validated |
| `original_einvoice_txn_date` | ZonedDateTime | Caller (optional) | Caller | Transaction date of the original e-invoice |
| `amount_txn` | BigDecimal | Caller (optional) | Caller | Transaction amount |
| `txn_date` | ZonedDateTime | Caller (optional) | Caller | Transaction date |
| `document_ref_no` | String | Caller (optional) | Caller | Source document reference number |
| `doc_ccy` | String | Caller (optional) | Caller | Currency code (e.g., `MYR`) |
| `reason` | String | Caller (**required**) | Caller | Rejection reason text |
| `request_submitted_datetime` | ZonedDateTime | Caller (optional) | Caller | Formal submission timestamp |
| `processing_logic` | String (enum) | — | Caller (**required if approving**) | Post-cancellation action. See [above](#processing-logic-options). |
| `system_requestor_status` | String | System → `REQUESTED` | System | Always `REQUESTED` after creation |
| `system_checking_status` | String | — | Caller (optional) | Optional intermediate checking status |
| `system_approval_status` | String | — | Caller (**required**) | Admin decision: `APPROVED`, `REJECTED`, `PENDING` |
| `system_processing_status` | String | System → `IN-PROGRESS` | System | `IN-PROGRESS` → `COMPLETED` after LHDN submission |
| `system_notification_status` | String | — | System | Tracks email notification outcome |
| `lhdn_cancellation_status` | String | — | System | `Cancelled` or `FAILED` after LHDN processing |
| `wf_process_hdr_guid` | UUID | Caller (optional) | Caller | Workflow process GUID |
| `wf_process_status_guid` | UUID | Caller (optional) | Caller | Workflow status GUID |
| `wf_process_status_code` | String | Caller (optional) | Caller | Workflow status code |
| `wf_resolution_guid` | UUID | Caller (optional) | Caller | Workflow resolution GUID |
| `wf_resolution_code` | String | Caller (optional) | Caller | Workflow resolution code |
| `property_json` | Map | Caller (optional) | Caller | Arbitrary key-value properties |
| `acl_config` | Map | Caller (optional) | Caller | ACL configuration |
| `acl_policy` | Map | Caller (optional) | Caller | ACL policy |
| `status` | String | Caller (`ACTIVE`) | Caller | Record status: `ACTIVE` or `INACTIVE` |
| `revision` | UUID | Caller (**required**) | — | Concurrency revision token |
| `vrsn` | String | — | — | Version string |
| `created_date` | ZonedDateTime | Caller (**required**) | — | Creation timestamp |
| `updated_date` | ZonedDateTime | Auto | Auto | Last update timestamp (auto-refreshed) |
| `created_by_subject_guid` | UUID | Auth token | — | Creator's user GUID |
| `updated_by_subject_guid` | UUID | Auth token | Auth token | Last updater's user GUID |
| `created_by_name` | String | — | — | Creator display name |
| `updated_by_name` | String | — | — | Updater display name |

---

### Error Handling

The API returns standard BigLedger error responses. Common errors:

| Scenario | Cause |
|---|---|
| `403 Forbidden` | Caller does not have the required permission code. |
| Validation error on `guid` | GUID is null or already exists (on create), or does not exist (on update). |
| Validation error on FK fields | Referenced entity (e.g., `to_irb_doc_hdr_guid`, `generic_doc_hdr_guid`) does not exist in the database. |
| LHDN 72-hour window exceeded | The e-invoice's validation datetime is more than 72 hours in the past. |
| LHDN `Not Validated` status | The e-invoice is not in `Valid` status on LHDN (e.g., still pending or already cancelled). |

---

## Direct Cancellation Flow

This flow bypasses the rejection request record entirely. An admin issues the cancellation command directly to LHDN using the e-invoice's LHDN document UID and the internal `to_irb` header GUID. No rejection tracking record is created or required.

**Use this flow when:**
- You need to cancel an e-invoice immediately without an internal approval process.
- You are performing bulk cancellations across a date range.

### Base URL

All endpoints are relative to:

```
/core2/tnt/dm/erp/e-invoice/direct-cancellation
```

### Authentication & Permissions

| Permission Code | Required By |
|---|---|
| `API_TNT_DM_ERP_MY_E_INVOICE_LHDN_INTEGRATION_CREATE` | Both endpoints |

The caller must also hold the `OWNER` or `ADMIN` role for:
- `API_TNT_DM_ERP_MY_E_INVOICE_LHDN_INTEGRATION_OWNER`
- `API_TNT_DM_ERP_MY_E_INVOICE_LHDN_INTEGRATION_ADMIN`

---

### API 4: Direct Single Cancellation

**Directly cancels a single e-invoice on LHDN by its document UID, bypassing any rejection request workflow.**

#### Endpoint

```
POST /core2/tnt/dm/erp/e-invoice/direct-cancellation/submit-to-lhdn/backoffice-ep
Content-Type: application/json
Authorization: Bearer <token>
```

#### Request Body

```json
{
  "toIrbHdrGuid": "550e8400-e29b-41d4-a716-446655440000",
  "documentUId": "ABC123XYZ",
  "reason": "Incorrect invoice amount — needs correction before reissuance"
}
```

#### Fields

| Field | Type | Required | Description |
|---|---|---|---|
| `toIrbHdrGuid` | UUID | **Yes** | The internal BigLedger GUID of the `to_irb` document record linked to the e-invoice. Used to refresh document status after a successful cancellation. |
| `documentUId` | String | **Yes** | The LHDN-assigned document UID (UUID string) of the e-invoice to cancel. This is the identifier recognised by the LHDN MyInvois API. |
| `reason` | String | **Yes** | A plain-text reason for the cancellation. Sent to LHDN as part of the cancellation request payload. |

#### Processing Flow

1. Calls the LHDN MyInvois cancellation API directly with the supplied `documentUId` and `reason`.
2. If the cancellation succeeds (`cancellationSuccess = true`), the internal `to_irb` document is refreshed to pull the latest e-invoice status from LHDN.
3. Returns the full LHDN cancellation result regardless of success or failure.

#### Success Response

```json
{
  "code": "OK",
  "data": {
    "cancellationResp": {
      "uuid": "ABC123XYZ",
      "status": "Cancelled"
    },
    "request_url": "https://myinvois.hasil.gov.my/api/v1.0/documents/...",
    "request_body": "{...}",
    "request_response": "{...}",
    "request_error": null,
    "cancellationSuccess": true,
    "cancellationRequestValidationDto": {
      "isRequestValid": true,
      "reason": null
    }
  }
}
```

#### Failure Response (LHDN rejected the request)

```json
{
  "code": "OK",
  "data": {
    "cancellationResp": null,
    "request_url": "https://myinvois.hasil.gov.my/api/v1.0/documents/...",
    "request_body": "{...}",
    "request_response": "{...}",
    "request_error": "Document is not eligible for cancellation",
    "cancellationSuccess": false,
    "cancellationRequestValidationDto": {
      "isRequestValid": false,
      "reason": "Passed 72 hours from validation date time"
    }
  }
}
```

> **Note:** The HTTP status is always `200 OK`. Check `cancellationSuccess` in the response body to determine whether the LHDN cancellation actually succeeded.

#### Response Fields

| Field | Type | Description |
|---|---|---|
| `cancellationResp.uuid` | String | The LHDN document UID of the cancelled document. Present on success. |
| `cancellationResp.status` | String | Status returned by LHDN (e.g., `"Cancelled"`). |
| `request_url` | String | The URL called on the LHDN API. |
| `request_body` | String | The JSON body sent to LHDN. |
| `request_response` | String | The raw response body from LHDN. |
| `request_error` | String | Error message if the cancellation failed. `null` on success. |
| `cancellationSuccess` | Boolean | `true` if LHDN confirmed cancellation. `false` otherwise. |
| `cancellationRequestValidationDto.isRequestValid` | Boolean | Whether the pre-submission validation passed (e.g., within 72-hour window). |
| `cancellationRequestValidationDto.reason` | String | Reason if pre-validation failed (e.g., `"Passed 72 hours from validation date time"`, `"Not Validated"`, `"e-invoice is not generated yet"`). |

---

### API 5: Bulk Direct Cancellation by Filter

**Fetches all eligible e-invoices matching a date range filter and bulk-cancels them on LHDN in a single call.**

#### Endpoint

```
POST /core2/tnt/dm/erp/e-invoice/direct-cancellation/submit-to-lhdn/by-filter/backoffice-ep
Content-Type: application/json
Authorization: Bearer <token>
```

#### Request Body

```json
{
  "einvoiceDateFrom": "2026-03-01T00:00:00+08:00",
  "einvoiceDateTo": "2026-03-28T23:59:59+08:00",
  "validationDateFrom": "2026-03-01T00:00:00+08:00",
  "validationDateTo": "2026-03-28T23:59:59+08:00"
}
```

#### Fields

| Field | Type | Required | Description |
|---|---|---|---|
| `einvoiceDateFrom` | ZonedDateTime (ISO 8601) | **Yes** | Start of the e-invoice transaction date range to query. |
| `einvoiceDateTo` | ZonedDateTime (ISO 8601) | **Yes** | End of the e-invoice transaction date range to query. |
| `validationDateFrom` | ZonedDateTime (ISO 8601) | **Yes** | Start of the LHDN validation date range to query. |
| `validationDateTo` | ZonedDateTime (ISO 8601) | **Yes** | End of the LHDN validation date range to query. |

All four date fields are **required**. The API returns a `400` / error if any are missing.

#### Processing Flow

1. Queries all `to_irb` records whose e-invoice date and LHDN validation date fall within the specified ranges.
2. If no eligible documents are found, returns a `200 OK` with an informational message.
3. For each eligible document, calls the LHDN MyInvois cancellation API.
4. Returns the aggregated list of `LHDNCancellationDto` results — one entry per processed e-invoice.

#### Success Response — Documents Found and Processed

```json
{
  "code": "OK",
  "data": [
    {
      "cancellationResp": {
        "uuid": "DOC-UID-001",
        "status": "Cancelled"
      },
      "cancellationSuccess": true,
      "request_error": null,
      ...
    },
    {
      "cancellationResp": null,
      "cancellationSuccess": false,
      "request_error": "Document is not eligible for cancellation",
      ...
    }
  ]
}
```

#### Success Response — No Documents Found

```json
{
  "code": "OK",
  "data": "No valid invoices found for the given criteria."
}
```

#### Important Notes

- Individual documents within the batch may succeed or fail independently. Always inspect the `cancellationSuccess` flag on each item in the returned array.
- The response array order corresponds to the order in which documents were fetched and processed.
- The same 72-hour validation window rule applies to each document in the batch.

---

### Comparison: Rejection Request Flow vs Direct Cancellation Flow

| Aspect | Rejection Request Flow | Direct Cancellation Flow |
|---|---|---|
| **Requires buyer submission** | Yes — buyer must POST a rejection request first | No |
| **Requires admin approval** | Yes — admin sets `system_approval_status = APPROVED` | No |
| **Post-cancellation actions** | Configurable via `processing_logic` (void doc, regen invoice, etc.) | Auto-refreshes `to_irb` status only |
| **Audit trail** | Full rejection request record in `bl_fi_my_einvoice_request_rejection_internal_doc_hdr` | No rejection record created |
| **Bulk support** | No (GUIDs must be pre-approved individually) | Yes — by date range filter |
| **Permission required** | `MY_E_INVOICE_REQUEST_REJECTION_INTERNAL_DOC_HDR_*` | `MY_E_INVOICE_LHDN_INTEGRATION_*` |

