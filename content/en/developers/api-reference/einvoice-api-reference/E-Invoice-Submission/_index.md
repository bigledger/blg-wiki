---
description: End-to-end guide for e-invoice submission — setup, document flow, pool management, and submission APIs.
tags:
- api-reference
- einvoice
- submission
title: E-Invoice Submission
weight: 15
---

This section covers the complete e-invoice submission lifecycle in BigLedger — from company setup, through document finalization, queue processing, pool routing, and final LHDN submission.

**Base URL (Submission APIs):** `https://api.akaun.com/core2/tnt/dm/erp/fi/e-invoice/to-irbs`

**Required Permissions:** `API_TNT_DM_ERP_MY_E_INVOICE_TO_IRB_OWNER` or `API_TNT_DM_ERP_MY_E_INVOICE_TO_IRB_ADMIN`

---

## Pre-Requisites

### Company Setup on LHDN Portal

Before any e-invoice can be submitted, the company must be registered as an intermediary on LHDN MyInvois:

1. **Set BLG ERP as the intermediary** on the LHDN Portal for both the pre-production (sandbox) and production environments.
   Follow this setup guideline: [LHDN Intermediary Setup Guide](https://www.youtube.com/watch?v=L_zI6JEOtjk)

2. **Configure company identity fields** in the `bl_fi_mst_comp` table:

   | Field | Column | Description |
   |-------|--------|-------------|
   | TIN | `einvoice_tax_id_no` | Company TIN issued by LHDN |
   | Identification Number | `einvoice_id_value` | BRN, NRIC, or Passport number |
   | Identification Type | `einvoice_id_type` | `BRN`, `NRIC`, or `PASSPORT` |
   | Address Line 1 | `address_line_1` | Registered business address |
   | City | `city` | City |
   | Postcode | `postal_code` | Postal code |
   | State | `state` | State |
   | Country | `country` | Country code (e.g. `MY`) |
   | Contact Number | `phone` | Company phone number |
   | Email | `email` | Company email address |

3. Click **Save** — the system will then establish the integration link between BigLedger and the LHDN portal.

### Transaction-Level Setup

When creating transactions, the following JSON fields must be filled in on `bl_fi_generic_doc_hdr`:

- **Sales document types**: populate `einvoice_buyer_entity_hdr_json` with the buyer's identity details (TIN, ID type/value, address, contact).
- **Purchase document types**: populate `einvoice_supplier_entity_hdr_json` with the supplier's identity details.

> This is the responsibility of the external API or system creating the transaction.

---

## Document Types That Trigger E-Invoice Processing

When a transaction is **finalized**, the system checks the document type. If it matches any of the following, it enters the e-invoice submission pipeline:

**Sales Documents**

| Document Type | Description |
|---------------|-------------|
| `INTERNAL_SALES_INVOICE` | Sales invoice |
| `INTERNAL_SALES_DEBIT_NOTE` | Sales debit note |
| `INTERNAL_SALES_CREDIT_NOTE` | Sales credit note |
| `INTERNAL_SALES_REFUND_NOTE` | Sales refund note |
| `INTERNAL_SALES_CASHBILL` | Sales cashbill |
| `INTERNAL_SALES_RETURN` | Sales return |

**Purchase Documents**

| Document Type | Description |
|---------------|-------------|
| `INTERNAL_PURCHASE_INVOICE` | Purchase invoice |
| `INTERNAL_PURCHASE_SELF_BILLED_INVOICE` | Purchase self-billed invoice |
| `INTERNAL_PURCHASE_DEBIT_NOTE` | Purchase debit note |
| `INTERNAL_PURCHASE_CREDIT_NOTE` | Purchase credit note |
| `INTERNAL_PURCHASE_REFUND_NOTE` | Purchase refund note |
| `INTERNAL_PURCHASE_RETURN` | Purchase return |

---

## E-Invoice Submission Flow

### Step 1 — Posting Queue

When a matching transaction is finalized, it is pushed into the **Posting Queue** tracked by the `bl_fi_generic_doc_einvoice_posting_queue` table.

- **Processor:** `GENERIC_DOCUMENT_E_INVOICE_POSTING_QUEUE_PROCESSOR`

The system processes this queue automatically and routes each document into one of the pools below.

---

### Step 2 — Pool Routing

The processor (`E_INVOICE_GENERIC_DOCUMENT_TO_IRB_PROCESSOR`) evaluates each document and routes it to one of three pools based on the configured submission type and whether LHDN mandatory fields are satisfied.

#### 2.1 Batch Pool (`bl_fi_my_einvoice_batch_pool_doc_hdr`)

Used for outgoing sales documents (`SINV`, `SCN`, etc.) **without** a specific submission type set, when LHDN mandatory fields (buyer TIN, ID type/value, address) are missing.

| Step | Description |
|------|-------------|
| **Land in batch pool** | Document is placed in `bl_fi_my_einvoice_batch_pool_doc_hdr` |
| **Fix and resubmit** | Use [Save and Resubmit](#api-2--save-and-resubmit-for-failed--invalid-e-invoice) to fill in missing buyer data and convert to an individual e-invoice |
| **Automatic consolidation** | If the batch pool document remains `UNPROCESSED`, the system consolidates it into a **consolidated e-invoice**. The resulting submission record is in `bl_fi_my_einvoice_to_irb_hdr`, tracked by `bl_fi_my_einvoice_consolidated_submission_queue` |
| **Manual consolidation** | Use `POST core2/tnt/dm/erp/e-invoice/batch-pool-doc-hdrs/consolidate-batch-pools/backoffice-ep` to consolidate batch pool records manually by document |

#### 2.2 Individual Pool (`bl_fi_my_einvoice_individual_pool_doc_hdr`)

Used when the `einvoice_submission_type` is set to `INDIVIDUAL` but LHDN mandatory fields are missing.

| Step | Description |
|------|-------------|
| **Land in individual pool** | Document waits with missing mandatory fields |
| **Fix and resubmit** | Use [Save and Resubmit](#api-2--save-and-resubmit-for-failed--invalid-e-invoice) to fill in missing details and generate an individual e-invoice |
| **Move to batch pool** | If customer details (TIN, ID type/value, address) cannot be resolved, the document can be moved to the batch pool for consolidated submission — **only if the transaction amount is less than MYR 10,000** |
| **Force individual** | If `einvoice_submission_type` is `CONSOLIDATED` or `SINGLE-GENERAL` **and** the transaction amount is ≥ MYR 10,000, the document is routed here regardless |

#### 2.3 Single General Pool (`bl_fi_my_einvoice_single_general_pool_doc_hdr`)

Used when the `einvoice_submission_type` is set to `SINGLE-GENERAL` — intended for high-risk cases where the customer is unlikely to have their TIN, ID type/value, or address available, but still wants an e-invoice.

| Step | Description |
|------|-------------|
| **Land in single general pool** | Document awaits mandatory field completion |
| **Fix and resubmit** | Use [Save and Resubmit](#api-2--save-and-resubmit-for-failed--invalid-e-invoice) to correct data and generate an individual e-invoice |
| **Resubmit as new e-invoice** | If the individual e-invoice fails or becomes invalid, use **Resubmit as New E-Invoice** — this re-submits the document as a consolidated e-invoice containing only this single document |

---

### Step 3 — Pending Submission

When all LHDN mandatory fields are satisfied, the transaction is placed in **pending submission**:

- The e-invoice record is stored in `bl_fi_my_einvoice_to_irb_hdr`
- The submission queue is tracked in `bl_fi_my_einvoice_gen_doc_to_irb_submission_queue`
- **Submission errors** (network or LHDN API errors) are stored in the `request_response` and `request_error` columns of `bl_fi_my_einvoice_gen_doc_to_irb_submission_queue`
- **Validation errors** from LHDN (document received but invalid) are stored in the `validation_response` column of `bl_fi_my_einvoice_to_irb_hdr`

---

### Step 4 — Submission History

A complete record of all submission attempts is available in:

- **Table:** `bl_fi_my_einvoice_gen_doc_to_irb_submission_history`

This includes both successful and failed submissions, with full request/response payloads for audit and debugging.

---

## API 1 — Convert Purchase Document to Self-Billed E-Invoice

Marks one or more purchase transaction documents as **self-billed**. In Malaysian e-invoicing, a self-billed invoice is issued by the buyer on behalf of the supplier. Use this API when the supplier is unable to issue an e-invoice and the buyer is required to self-bill under LHDN rules.

### Endpoint

```
POST /doc-self-billed/backoffice-ep
```

**Required Permission:** `_UPDATE`

### Request Body

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `gendocHdrGuids` | UUID[] | Yes | Set of generic document header GUIDs (`bl_fi_generic_doc_hdr.guid`) for the purchase transactions to convert to self-billed |

### Example Request

```json
{
  "gendocHdrGuids": [
    "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "7cb12a31-9843-4c1d-b891-4feac1234567"
  ]
}
```

### Response

Returns the updated `MyEInvoiceToIrbContainer` records reflecting each document's new self-billed status.

### Notes

- Applicable to `INTERNAL_PURCHASE_INVOICE` and related purchase document types.
- Once converted to self-billed, the document will be processed as `INTERNAL_PURCHASE_SELF_BILLED_INVOICE` for LHDN submission.
- The supplier details (`einvoice_supplier_entity_hdr_json`) on `bl_fi_generic_doc_hdr` must be populated before calling this endpoint.

---

## API 2 — Save and Resubmit (for Failed / Invalid E-Invoice)

When an e-invoice is **invalid** or failed at the LHDN Pending Submission stage, this API allows you to correct the buyer or supplier details on the existing `to_irb` record and trigger a fresh resubmission to LHDN.

Use this when:
- A document landed in a pool (batch, individual, or single general) due to missing mandatory fields, and those fields have since been corrected
- LHDN returned a `validation_response` error and the data issue has been fixed

### Endpoint

```
POST /save-and-resubmit/backoffice-ep
```

**Required Permission:** `_UPDATE`

### Request Body

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `toIrbHdrGuid` | UUID | Yes | The GUID of the `bl_fi_my_einvoice_to_irb_hdr` record to fix and resubmit |

### Example Request

```json
{
  "toIrbHdrGuid": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
}
```

### Response

Returns a success message:

```json
"To IRB resubmission processed."
```

### Workflow

```
Document in pool (missing fields)
        │
        ▼
Fix buyer/supplier data on bl_fi_generic_doc_hdr
        │
        ▼
Call /save-and-resubmit/backoffice-ep with toIrbHdrGuid
        │
        ▼
System re-evaluates mandatory fields
        │
   ┌────┴────┐
   │         │
Fields OK   Still missing
   │         │
   ▼         ▼
Pending   Stays in pool
Submission
```

### Notes

- This endpoint delegates to `MyEInvoiceToIrbResubmissionService.fixFromToIRB()`.
- The `toIrbHdrGuid` refers to the `bl_fi_my_einvoice_to_irb_hdr` record (not the `bl_fi_generic_doc_hdr`).
- After calling this API, monitor the document status in `bl_fi_my_einvoice_gen_doc_to_irb_submission_queue` and `bl_fi_my_einvoice_to_irb_hdr.validation_response`.

---

## Get Taxpayer from QR Code

> **Note: This feature is currently in progress and will be implemented in a future release.**

Retrieves taxpayer information by scanning or parsing a QR code from an LHDN MyInvois e-invoice document. This is useful for automatically populating buyer or supplier details without manual data entry.

### Planned Endpoint

```
POST /core2/tnt/dm/erp/e-invoice/lhdn-integrations/retrieve-tax-payer-by-qr-code/etl-ep
```

**Controller:** `MyEInvoiceLHDNIntegrationController`

### Planned Behaviour

- Accepts a QR code string scanned from an LHDN-issued e-invoice
- Queries LHDN MyInvois to resolve the taxpayer's TIN, name, and ID details
- Returns structured taxpayer information that can be used to populate `einvoice_buyer_entity_hdr_json` or `einvoice_supplier_entity_hdr_json`

Documentation will be updated with full request/response schemas and example usage when this feature is released.
