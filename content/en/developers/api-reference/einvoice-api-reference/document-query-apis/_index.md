---
description: APIs for querying and retrieving internal e-invoice records (to_irb records) stored in BigLedger.
tags:
- api-reference
- einvoice
- to-irb
title: E-Invoice Document Query APIs
weight: 30
---

APIs for searching and retrieving internal e-invoice records (`to_irb` records) stored in BigLedger. These represent e-invoices that have been generated and submitted (or are pending submission) to the LHDN MyInvois system.

**Base URL:** `https://api.akaun.com/core2/tnt/dm/erp/fi/e-invoice/to-irbs`

**Required Permissions:** `API_TNT_DM_ERP_MY_E_INVOICE_TO_IRB_OWNER` or `API_TNT_DM_ERP_MY_E_INVOICE_TO_IRB_ADMIN`

---

## API 1 — Search Documents

Search and filter internal e-invoice (`to_irb`) records. Supports extensive filtering across header fields, party information, dates, amounts, and statuses. Returns a paginated list of matching documents.

### Endpoint

```
GET /backoffice-ep/query
```

**Required Permission:** `_READ`

### Query Parameters

All parameters are optional. Parameters accepting sets/arrays can be provided multiple times (repeated query params) or as comma-separated values.

#### Identity & Reference Filters

| Parameter | Type | Description |
|-----------|------|-------------|
| `hdr_guids` | UUID[] | Filter by one or more internal to_irb header GUIDs |
| `hdr_irb_doc_unique_ref_nos` | String[] | LHDN unique reference numbers assigned to the document |
| `hdr_einvoice_code_nos` | String[] | E-invoice code numbers |
| `hdr_original_einvoice_ref_nos` | String[] | Original e-invoice reference numbers (for credit/debit notes) |
| `to_irb_running_nos` | String[] | Internal running numbers |
| `doc_references` | String[] | Generic document references |
| `generic_doc_pin_codes` | String[] | PIN codes associated with the document |

#### Party Filters — Supplier

| Parameter | Type | Description |
|-----------|------|-------------|
| `hdr_supplier_names` | String[] | Supplier company names |
| `hdr_supplier_tax_ids` | String[] | Supplier TIN numbers |
| `hdr_supplier_id_nos` | String[] | Supplier identification numbers |
| `hdr_supplier_sales_service_tax_ids` | String[] | Supplier SST registration numbers |
| `hdr_supplier_tourism_tax_ids` | String[] | Supplier tourism tax registration numbers |
| `hdr_supplier_standard_indu_class_codes` | String[] | Supplier MSIC (industry classification) codes |
| `hdr_supplier_business_activity_descs` | String[] | Supplier business activity descriptions |
| `hdr_supplier_emails` | String[] | Supplier email addresses |
| `hdr_supplier_addresses` | String[] | Supplier addresses |
| `hdr_supplier_contact_nos` | String[] | Supplier contact numbers |
| `hdr_supplier_digital_signatures` | String[] | Supplier digital signatures |

#### Party Filters — Buyer

| Parameter | Type | Description |
|-----------|------|-------------|
| `hdr_buyer_names` | String[] | Buyer company names |
| `hdr_buyer_tax_ids` | String[] | Buyer TIN numbers |
| `hdr_buyer_id_nos` | String[] | Buyer identification numbers |
| `hdr_buyer_sales_service_tax_ids` | String[] | Buyer SST registration numbers |
| `hdr_buyer_emails` | String[] | Buyer email addresses |
| `hdr_buyer_addresses` | String[] | Buyer addresses |
| `hdr_buyer_contact_nos` | String[] | Buyer contact numbers |

#### Document Type & Status Filters

| Parameter | Type | Description |
|-----------|------|-------------|
| `hdr_einvoice_types` | String[] | E-invoice type codes (e.g. `01` = Invoice, `02` = Credit Note, `03` = Debit Note, `04` = Refund) |
| `hdr_einvoice_vers` | String[] | E-invoice format version (e.g. `1.0`) |
| `hdr_submission_statuses` | String[] | LHDN submission status (e.g. `Valid`, `Invalid`, `Submitted`, `Pending`) |
| `hdr_einvoice_document_statuses` | String[] | Internal document status |
| `hdr_posting_status` | String[] | Accounting posting status |
| `hdr_einvoice_submission_types` | String[] | Submission type (e.g. individual, bulk) |
| `hdr_invoice_currency_codes` | String[] | Currency codes (e.g. `MYR`) |
| `hdr_billing_frequencies` | String[] | Billing frequency (for consolidated invoices) |

#### Company & Branch Filters

| Parameter | Type | Description |
|-----------|------|-------------|
| `code_companies` | String[] | Company codes |
| `hdr_branch_guids` | UUID[] | Branch GUIDs |
| `hdr_branch_codes` | String[] | Branch codes |

#### Related Record Filters

| Parameter | Type | Description |
|-----------|------|-------------|
| `hdr_generic_doc_hdr_guids` | UUID[] | Source generic document header GUIDs |
| `hdr_generic_doc_hdr_server_doc_types` | String[] | Source document server types |
| `hdr_generic_doc_hdr_server_doc_1s` | String[] | Source document reference field 1 |
| `hdr_generic_doc_hdr_server_doc_2s` | String[] | Source document reference field 2 |
| `hdr_generic_doc_hdr_server_doc_3s` | String[] | Source document reference field 3 |
| `hdr_einvoice_buyer_entity_hdr_guids` | UUID[] | Buyer entity header GUIDs |
| `hdr_einvoice_delivery_entity_hdr_guids` | UUID[] | Delivery entity header GUIDs |
| `line_irb_hdr_guids` | UUID[] | Line-level to_irb header GUIDs |

#### Custom Client Reference Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `client_doc_1s` | String[] | Client-defined reference field 1 |
| `client_doc_2s` | String[] | Client-defined reference field 2 |
| `client_doc_3s` | String[] | Client-defined reference field 3 |
| `client_doc_4s` | String[] | Client-defined reference field 4 |
| `client_doc_5s` | String[] | Client-defined reference field 5 |

#### Date Range Filters

All date fields accept ISO 8601 format with timezone (e.g. `2024-01-01T00:00:00+08:00`).

| Parameter | Type | Description |
|-----------|------|-------------|
| `hdr_einvoice_datetime_from` | DateTime | E-invoice issue date start |
| `hdr_einvoice_datetime_to` | DateTime | E-invoice issue date end |
| `hdr_validation_datetime_from` | DateTime | LHDN validation date start |
| `hdr_validation_datetime_to` | DateTime | LHDN validation date end |
| `hdr_actual_submission_date_from` | DateTime | Actual LHDN submission date start |
| `hdr_actual_submission_date_to` | DateTime | Actual LHDN submission date end |
| `hdr_created_date_from` | DateTime | Record creation date start |
| `hdr_created_date_to` | DateTime | Record creation date end |
| `hdr_updated_date_from` | DateTime | Record last updated date start |
| `hdr_updated_date_to` | DateTime | Record last updated date end |
| `hdr_einvoice_billing_period_start_from` | DateTime | Billing period start lower bound |
| `hdr_einvoice_billing_period_start_to` | DateTime | Billing period start upper bound |
| `hdr_einvoice_billing_period_end_from` | DateTime | Billing period end lower bound |
| `hdr_einvoice_billing_period_end_to` | DateTime | Billing period end upper bound |
| `date_txn_from` | DateTime | Transaction date start |
| `date_txn_to` | DateTime | Transaction date end |

#### Amount Filters

| Parameter | Type | Description |
|-----------|------|-------------|
| `hdr_currency_rate` | Decimal | Filter by exchange rate |
| `hdr_tax_exemption_amount` | Decimal | Filter by header-level tax exemption amount |
| `hdr_sub_total` | Decimal | Filter by subtotal |
| `hdr_total_exclude_tax` | Decimal | Filter by total excluding tax |
| `hdr_total_include_tax` | Decimal | Filter by total including tax |
| `hdr_txn_amount` | Decimal | Filter by transaction amount |

#### Line-Level Filters

| Parameter | Type | Description |
|-----------|------|-------------|
| `line_classifications` | String[] | Line item classification codes |
| `line_item_names` | String[] | Line item descriptions |
| `line_tax_types` | String[] | Tax type codes |
| `line_tax_exemption_details` | String[] | Tax exemption detail descriptions |
| `line_uoms` | String[] | Unit of measure codes |
| `line_settlement_methods` | String[] | Settlement method (e.g. cash, credit) |
| `line_settlement_types` | String[] | Settlement type |
| `line_payment_terms` | String[] | Payment terms |
| `line_payment_reference_numbers` | String[] | Payment reference numbers |
| `line_bill_reference_numbers` | String[] | Bill reference numbers |
| `line_unit_price` | Decimal | Unit price filter |
| `line_tax_rate` | Decimal | Tax rate filter |
| `line_tax_amount` | Decimal | Tax amount filter |
| `line_qty` | Decimal | Quantity filter |
| `line_discount_rate` | Decimal | Discount rate filter |
| `line_discount_amount` | Decimal | Discount amount per line |
| `line_payment_amount` | Decimal | Payment amount per line |
| `line_payment_date_from` | DateTime | Line payment date start |
| `line_payment_date_to` | DateTime | Line payment date end |

#### Pagination & Logic

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `pageNo` | Integer | `1` | Page number (1-based) |
| `pageSize` | Integer | system default | Number of results per page |
| `applyOrLogicToQueryEntity` | Boolean | `false` | When `true`, applies OR logic across entity filter conditions |

### Example Request

```
GET /backoffice-ep/query?hdr_submission_statuses=Valid&hdr_einvoice_datetime_from=2024-01-01T00:00:00%2B08:00&hdr_einvoice_datetime_to=2024-01-31T23:59:59%2B08:00&pageNo=1&pageSize=20
```

### Response Body

The response returns a paginated list of to_irb header records. Each record includes complete e-invoice header data, LHDN submission status, party information, and linked document references.

> The full response schema mirrors the `bl_fi_my_einvoice_to_irb_hdr` internal table. Key fields include: `guid`, `hdr_irb_doc_unique_ref_no`, `hdr_supplier_name`, `hdr_buyer_name`, `hdr_submission_status`, `hdr_einvoice_code_no`, `hdr_total_payable_amount`, `hdr_einvoice_datetime`, `hdr_validation_datetime`.

---

## API 2 — Get Document Details

Retrieves the full details of a single internal e-invoice record by its unique GUID.

### Endpoint

```
GET /backoffice-ep/{guid}
```

**Required Permission:** `_READ`

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `guid` | UUID | Yes | The GUID of the to_irb header record (`bl_fi_my_einvoice_to_irb_hdr.guid`) |

### Example Request

```
GET /backoffice-ep/3fa85f64-5717-4562-b3fc-2c963f66afa6
```

### Response Body

Returns the full to_irb header record including:

- Complete supplier and buyer party information (name, TIN, ID, address, contact)
- E-invoice type, version, and status
- LHDN submission status and validation datetime
- LHDN unique reference number (`hdr_irb_doc_unique_ref_no`) and long ID
- Financial summary (subtotal, tax, total payable amount)
- Original document references (linked generic document GUIDs)
- Line-level items with classification codes, amounts, tax details
- Audit fields: created date, updated date, created by user

### Common Response Fields

| Field | Description |
|-------|-------------|
| `guid` | Internal record GUID |
| `hdr_irb_doc_unique_ref_no` | LHDN unique reference number |
| `hdr_einvoice_code_no` | E-invoice code number |
| `hdr_submission_status` | LHDN submission status (`Valid`, `Invalid`, `Submitted`, `Pending`, etc.) |
| `hdr_einvoice_datetime` | ISO 8601 e-invoice issue datetime |
| `hdr_validation_datetime` | ISO 8601 LHDN validation datetime |
| `hdr_supplier_name` | Supplier name |
| `hdr_supplier_tin` | Supplier TIN |
| `hdr_buyer_name` | Buyer name |
| `hdr_buyer_tin` | Buyer TIN |
| `hdr_total_excluding_tax` | Total before tax |
| `hdr_total_include_tax` | Total including tax |
| `hdr_total_payable_amount` | Final payable amount |
| `hdr_invoice_currency_code` | Currency code |
| `hdr_einvoice_type` | E-invoice type code |

### Error Responses

| HTTP Status | Description |
|-------------|-------------|
| `400` | Invalid GUID format |
| `403` | Insufficient permissions |
| `404` | No record found for the given GUID |
