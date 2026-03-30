---
description: APIs for interacting directly with LHDN MyInvois — TIN validation, TIN search, submission details, and document queries.
tags:
- api-reference
- einvoice
- lhdn
title: LHDN Integration APIs
weight: 20
---

APIs for integrating with the LHDN MyInvois platform directly. These endpoints proxy or wrap the official LHDN MyInvois APIs and require a valid company with an active LHDN intermediary token configured.

**Base URL:** `https://api.akaun.com/core2/tnt/dm/erp/e-invoice/lhdn-integrations`

**Required Permissions:** `API_TNT_DM_ERP_MY_E_INVOICE_LHDN_INTEGRATION_OWNER` or `API_TNT_DM_ERP_MY_E_INVOICE_LHDN_INTEGRATION_ADMIN`

---

## API 1 — Validate Taxpayer's TIN

Validates whether a given TIN and ID combination is registered and active on the LHDN MyInvois system. Use this before invoicing a buyer to confirm their tax identity.

### Endpoint

```
POST /tin-validation/backoffice-ep
```

**Required Permission:** `_READ`

### Request Body

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `tin` | String | Yes | The taxpayer's TIN (Tax Identification Number) issued by LHDN |
| `idType` | String | Yes | Type of identification. Allowed values: `NRIC`, `PASSPORT`, `BRN`, `ARMY` |
| `idValue` | String | Yes | The actual identification document number corresponding to `idType` |
| `envType` | String | No | LHDN environment to validate against. Allowed values: `SANDBOX`, `PRODUCTION`. Default: `SANDBOX` |

**ID Type Reference**

| `idType` | Description |
|----------|-------------|
| `NRIC` | Malaysian National Registration Identity Card |
| `PASSPORT` | Passport (for non-Malaysian individuals) |
| `BRN` | Business Registration Number (for companies) |
| `ARMY` | Malaysian Army ID |

### Example Request

```json
{
  "tin": "C12345678900",
  "idType": "BRN",
  "idValue": "202301012345",
  "envType": "PRODUCTION"
}
```

### Response Body

| Field | Type | Description |
|-------|------|-------------|
| `tin` | String | The TIN that was validated |
| `idType` | String | The ID type used in the validation |
| `idValue` | String | The ID value used in the validation |
| `isValid` | Boolean | `true` if the TIN and ID combination is valid on LHDN |
| `validationMsg` | String | Human-readable result or error message from LHDN |
| `envType` | String | The environment used for validation (`SANDBOX` or `PRODUCTION`) |

### Example Response

```json
{
  "tin": "C12345678900",
  "idType": "BRN",
  "idValue": "202301012345",
  "isValid": true,
  "validationMsg": "TIN is valid.",
  "envType": "PRODUCTION"
}
```

### Notes

- This endpoint connects to the **master database** (`app_cfg_main`) to retrieve LHDN credentials, not the tenant database.
- Always validate against `PRODUCTION` when going live. `SANDBOX` is for testing only.
- A result of `isValid: false` does not necessarily mean the TIN does not exist — LHDN may return a mismatch between TIN and ID.

---

## API 2 — Search Taxpayer's TIN

Searches for a taxpayer's TIN on LHDN MyInvois using their name, ID type/value, or both. Use this when you know partial identity information and need to discover the TIN.

### Endpoint

```
POST /tin-search/backoffice-ep
```

**Required Permission:** `_READ`

### Request Body

At least one of `taxpayerName` or the `idType` + `idValue` pair must be provided.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `taxpayerName` | String | Conditional | Full or partial taxpayer name. **Required** if `idType` and `idValue` are not provided |
| `idType` | String | Conditional | Type of identification: `NRIC`, `PASSPORT`, `BRN`, `ARMY`. **Required** if `idValue` is provided |
| `idValue` | String | Conditional | The identification document number. **Required** if `idType` is provided |
| `fileType` | String | No | Differentiates individual vs non-individual taxpayers. `1` = individual (IG TIN), `2` = non-individual (non-IG TIN) |
| `envType` | String | No | LHDN environment to search. Allowed values: `SANDBOX`, `PRODUCTION`. Default: `SANDBOX` |

**Supported Search Combinations**

| Combination | Fields Required |
|-------------|-----------------|
| By name only | `taxpayerName` |
| By name + ID | `taxpayerName`, `idType`, `idValue` |
| By ID only | `idType`, `idValue` |
| By ID + file type | `idType`, `idValue`, `fileType` |
| All fields | `taxpayerName`, `idType`, `idValue`, `fileType` |

### Example Request

```json
{
  "taxpayerName": "Acme Sdn Bhd",
  "idType": "BRN",
  "idValue": "202301012345",
  "envType": "PRODUCTION"
}
```

### Response Body

| Field | Type | Description |
|-------|------|-------------|
| `tin` | String | The TIN found for the given search criteria. Empty if not found |
| `success` | Boolean | `true` if a TIN was found successfully |
| `errorMessage` | String | Error description if `success` is `false` |
| `statusCode` | Integer | HTTP status code from the LHDN API (e.g. `200`, `400`, `404`) |

### Example Response (Success)

```json
{
  "tin": "C12345678900",
  "success": true,
  "errorMessage": null,
  "statusCode": 200
}
```

### Example Response (Not Found)

```json
{
  "tin": null,
  "success": false,
  "errorMessage": "No taxpayer found matching the given criteria.",
  "statusCode": 404
}
```

### Notes

- This endpoint also uses master database credentials, not tenant-specific credentials.
- When `fileType` is omitted, LHDN searches across both individual and non-individual taxpayers.
- All search combinations use AND logic — additional fields narrow the results.

---

## API 3 — Get Submission / Document Details

Retrieves the detailed status and validation results of a previously submitted e-invoice document from LHDN. Useful for checking why a document failed validation or confirming its final LHDN status.

### Endpoint

```
POST /submission-document-details/backoffice-ep
```

**Required Permission:** `_READ`

### Request Body

Provide either `documentUId` or `toIrbHdrGuid` (or both). At least one is required to identify the document.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `documentUId` | String | Conditional | The LHDN document UUID (also called `longId`) assigned at submission |
| `toIrbHdrGuid` | UUID | Conditional | Internal BigLedger `to_irb` header record GUID for the submitted document |

### Example Request

```json
{
  "documentUId": "F9D425P6DS7D8IU",
  "toIrbHdrGuid": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
}
```

### Response Body

The response wraps either a `detailsResponse` (on success) or an `error` (on failure).

#### `detailsResponse` Object

| Field | Type | Description |
|-------|------|-------------|
| `uuid` | String | LHDN UUID of the document |
| `submissionUid` | String | Submission batch UID |
| `longId` | String | LHDN long ID (used in QR code / MyInvois portal link) |
| `typeName` | String | E-invoice type name (e.g. `Invoice`, `Credit Note`) |
| `typeVersionName` | String | E-invoice format version |
| `issuerTin` | String | TIN of the supplier/issuer |
| `issuerName` | String | Name of the issuer |
| `receiverId` | String | Buyer/receiver identification number |
| `receiverName` | String | Buyer/receiver company name |
| `dateTimeIssued` | String | ISO 8601 date/time when the invoice was issued |
| `dateTimeReceived` | String | ISO 8601 date/time when LHDN received the document |
| `dateTimeValidated` | String | ISO 8601 date/time when LHDN validated the document |
| `totalExcludingTax` | Decimal | Total amount before tax |
| `totalDiscount` | Decimal | Total discount amount |
| `totalNetAmount` | Decimal | Net total after discount |
| `totalPayableAmount` | Decimal | Final payable amount including tax |
| `status` | String | Current LHDN document status (e.g. `Valid`, `Invalid`, `Cancelled`) |
| `documentStatusReason` | String | Reason for status (e.g. rejection or cancellation reason) |
| `cancelDateTime` | String | ISO 8601 cancellation datetime, if applicable |
| `rejectRequestDateTime` | String | ISO 8601 rejection request datetime, if applicable |
| `validationResults` | Object | Detailed validation result object from LHDN (includes error codes and messages) |
| `internalId` | String | Supplier's internal document reference number |
| `createdByUserId` | String | LHDN user ID that submitted the document |

#### `error` Object

| Field | Type | Description |
|-------|------|-------------|
| `error` | Object | Present when LHDN returned an error. Contains error description and LHDN status code |

### Example Response (Success)

```json
{
  "detailsResponse": {
    "uuid": "F9D425P6DS7D8IU",
    "submissionUid": "SUBM-0001",
    "longId": "XXXXXXXXXXXXXXXXXXXX",
    "typeName": "Invoice",
    "typeVersionName": "1.0",
    "issuerTin": "C12345678900",
    "issuerName": "My Company Sdn Bhd",
    "receiverId": "202301012345",
    "receiverName": "Acme Buyer Sdn Bhd",
    "dateTimeIssued": "2024-01-15T08:00:00Z",
    "dateTimeReceived": "2024-01-15T08:01:00Z",
    "dateTimeValidated": "2024-01-15T08:02:00Z",
    "totalExcludingTax": 1000.00,
    "totalDiscount": 50.00,
    "totalNetAmount": 950.00,
    "totalPayableAmount": 1008.00,
    "status": "Valid",
    "documentStatusReason": null,
    "cancelDateTime": null,
    "rejectRequestDateTime": null,
    "internalId": "INV-2024-001",
    "validationResults": null
  },
  "error": null,
  "envType": "PRODUCTION"
}
```

---

## API 4 — Search Documents on LHDN

Queries e-invoice documents directly from LHDN MyInvois for the specified company. Returns a paginated list of documents matching the filter criteria.

### Endpoint

```
POST /documents/{companyGuid}/backoffice-ep/query
```

**Required Permission:** `_READ`

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `companyGuid` | UUID | Yes | The GUID of the company (`bl_fi_mst_comp`) whose LHDN intermediary token will be used to query documents |

### Request Body

All fields are optional. Omitting all fields returns recent documents up to the default page size.

| Field | Type | Description |
|-------|------|-------------|
| `uuid` | String | Filter by a specific LHDN document UUID |
| `submissionDateFrom` | String (ISO 8601) | Start of submission date range. Format: `yyyy-MM-dd'T'HH:mm:ssZ` |
| `submissionDateTo` | String (ISO 8601) | End of submission date range. Format: `yyyy-MM-dd'T'HH:mm:ssZ` |
| `issueDateFrom` | String (ISO 8601) | Start of issue date range. Format: `yyyy-MM-dd'T'HH:mm:ssZ` |
| `issueDateTo` | String (ISO 8601) | End of issue date range. Format: `yyyy-MM-dd'T'HH:mm:ssZ` |
| `invoiceDirection` | String | Filter by direction: `Sent` (outgoing) or `Received` (incoming) |
| `status` | String | Filter by LHDN document status (e.g. `Valid`, `Invalid`, `Cancelled`, `Submitted`) |
| `documentType` | String | Filter by document type (e.g. `01` for Invoice, `02` for Credit Note) |
| `searchQuery` | String | Free-text search against the document |
| `pageNo` | Integer | Page number (1-based). Default: `1` |
| `pageSize` | Integer | Number of results per page. Default: `25` |

### Example Request

```json
{
  "submissionDateFrom": "2024-01-01T00:00:00Z",
  "submissionDateTo": "2024-01-31T23:59:59Z",
  "invoiceDirection": "Sent",
  "status": "Valid",
  "pageNo": 1,
  "pageSize": 25
}
```

### Response Body

| Field | Type | Description |
|-------|------|-------------|
| `result` | Array | List of document objects (see fields below) |
| `metadata.totalPages` | Integer | Total number of pages available |
| `metadata.totalCount` | Integer | Total number of matching documents |
| `error` | Object | Present if LHDN returned an error |

#### Each item in `result`

| Field | Type | Description |
|-------|------|-------------|
| `uuid` | String | LHDN document UUID |
| `submissionUid` | String | Batch submission UID |
| `longId` | String | LHDN long ID |
| `internalId` | String | Supplier's internal reference number |
| `typeName` | String | Document type name (e.g. `Invoice`) |
| `typeVersionName` | String | Format version |
| `supplierTIN` | String | Supplier TIN |
| `supplierName` | String | Supplier company name |
| `buyerTIN` | String | Buyer TIN |
| `buyerName` | String | Buyer company name |
| `issuerTIN` | String | Issuer TIN |
| `issuerID` | String | Issuer identification number |
| `issuerIDType` | String | Issuer ID type |
| `receiverTIN` | String | Receiver TIN |
| `receiverID` | String | Receiver identification number |
| `receiverName` | String | Receiver name |
| `receiverIDType` | String | Receiver ID type |
| `dateTimeIssued` | String | ISO 8601 issue datetime |
| `dateTimeReceived` | String | ISO 8601 received by LHDN datetime |
| `dateTimeValidated` | String | ISO 8601 validated datetime |
| `status` | String | Current LHDN status |
| `documentStatusReason` | String | Reason for status change |
| `cancelDateTime` | String | Cancellation datetime (if applicable) |
| `rejectRequestDateTime` | String | Rejection request datetime (if applicable) |
| `submissionChannel` | String | How the document was submitted (e.g. `API`) |
| `intermediaryName` | String | Intermediary company name |
| `intermediaryTIN` | String | Intermediary TIN |
| `intermediaryROB` | String | Intermediary registration number |
| `createdByUserId` | String | LHDN user ID that submitted the document |
| `documentCurrency` | String | Currency code (e.g. `MYR`) |
| `totalExcludingTax` | Decimal | Total before tax |
| `totalDiscount` | Decimal | Total discounts |
| `totalNetAmount` | Decimal | Net total |
| `totalPayableAmount` | Decimal | Final payable amount |

### Example Response

```json
{
  "result": [
    {
      "uuid": "F9D425P6DS7D8IU",
      "submissionUid": "SUBM-0001",
      "longId": "XXXXXXXXXXXXXXXXXXXX",
      "internalId": "INV-2024-001",
      "typeName": "Invoice",
      "typeVersionName": "1.0",
      "supplierTIN": "C12345678900",
      "supplierName": "My Company Sdn Bhd",
      "buyerTIN": "C98765432100",
      "buyerName": "Acme Buyer Sdn Bhd",
      "dateTimeIssued": "2024-01-15T08:00:00Z",
      "dateTimeReceived": "2024-01-15T08:01:00Z",
      "dateTimeValidated": "2024-01-15T08:02:00Z",
      "status": "Valid",
      "documentCurrency": "MYR",
      "totalExcludingTax": 1000.00,
      "totalDiscount": 50.00,
      "totalNetAmount": 950.00,
      "totalPayableAmount": 1008.00
    }
  ],
  "metadata": {
    "totalPages": 5,
    "totalCount": 112
  },
  "error": null
}
```

### Notes

- The `companyGuid` in the path determines which LHDN intermediary token is used for authentication.
- Documents returned are those associated with the company's LHDN account (either as supplier or receiver, depending on `invoiceDirection`).
- Date format must follow ISO 8601 with timezone, e.g. `2024-01-01T00:00:00Z`.
