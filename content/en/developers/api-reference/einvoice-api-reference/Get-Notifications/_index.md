---
description: Receiving e-invoice events via webhook and tracking automated email notifications sent to buyers and suppliers.
tags:
- api-reference
- einvoice
- notifications
title: Get Notifications
weight: 25
---

This section covers how to receive e-invoice events (such as invoice rejection or validation updates) and how to monitor the automated email notifications sent to buyers and suppliers after successful e-invoice processing.

---

## Event Notifications (Webhook — Recommended)

Webhook integration is the preferred approach for receiving real-time e-invoice events from BigLedger. Instead of polling for status changes, your system registers a webhook URL and receives push notifications when key e-invoice events occur.

**Common events delivered via webhook:**

| Event | Description |
|-------|-------------|
| Invoice validated | LHDN has accepted and validated the e-invoice |
| Invoice rejected | Buyer has submitted a rejection request for the e-invoice |
| Invoice cancelled | E-invoice has been successfully cancelled on LHDN |
| Invoice invalid | LHDN returned a validation failure for the submitted document |
| Email sent | E-invoice PDF email has been delivered to the buyer |
| Email failed | Email delivery failed; retry exhausted |

> Webhook configuration is managed through the BigLedger scheduler and notification settings. Contact your BigLedger integration team for webhook endpoint registration.

---

## Automated Email Notifications

After a transaction is validated by LHDN and an e-invoice is successfully created, the system automatically sends an email with the e-invoice PDF attached to the buyer (for sales documents) or supplier (for purchase/self-billed documents).

### Processor: `E_INVOICE_EMAIL_PRINTABLE_QUEUE_PROCESSOR`

Emails are dispatched by a background processor that runs on a scheduled cron. It processes pending records from the `bl_fi_my_einvoice_email_printable_queue` table.

**Processor details:**

| Property | Value |
|----------|-------|
| Processor code | `E_INVOICE_EMAIL_PRINTABLE_QUEUE_PROCESSOR` |
| Default cron schedule | `*/10 * * * *` (every 10 minutes) |
| Queue table | `bl_fi_my_einvoice_email_printable_queue` |
| History table | `bl_fi_my_einvoice_email_printable_queue_history` |
| Lock expiry | 15 minutes (prevents concurrent runs) |

### Processor Configuration

The processor accepts two optional configuration properties that control how many records it processes and how many retries it allows per record:

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `limit` | Integer | `10` | Maximum number of queue records to process per run |
| `retry` | Integer | `5` | Maximum number of send attempts before a record is marked as permanently failed |

These properties are set in the scheduler crontab configuration (`bl_job_crontab_hdr`) for the `E_INVOICE_EMAIL_PRINTABLE_QUEUE_PROCESSOR` entry.

**Example processor properties JSON:**
```json
{
  "limit": 10,
  "retry": 5
}
```

### Pre-Requisite: Enable Email Sending on Company

Email sending is **opt-in** per company. The processor checks the `einvoice_send_email` flag on the company (`bl_fi_mst_comp`) record before sending. If this flag is `false`, emails are skipped even if a queue record exists.

**To enable automatic email sending:**
- Set `einvoice_send_email = true` on the company's `bl_fi_mst_comp` record.

### How the Processor Works

```
bl_fi_my_einvoice_email_printable_queue  (process_status = IN_QUEUE, retry < max)
        │
        ▼
Processor picks up records (ordered by created_date ASC)
        │
        ▼
Looks up linked to_irb record → generic doc → company
        │
        ▼
Checks company.einvoice_send_email == true
        │
   ┌────┴─────────────┐
   │                  │
  Yes                 No
   │                  │
   ▼                  ▼
Send email         Skip (no email sent)
with PDF
   │
   ├─ Success → update queue_process_status, email_status = SENT
   │            write record to bl_fi_my_einvoice_email_printable_queue_history
   │
   └─ Failure → increment retry count, set email_status = FAILED
                 (retried on next processor run until retry limit reached)
```

---

## API 1 — Email Queue Dashboard (Pending / In-Queue)

Retrieves the current state of the email sending queue — documents that are pending dispatch, in progress, or have failed and are awaiting retry. Use this to monitor which e-invoices have not yet had their notification emails sent.

### Endpoint

```
POST /core2/tnt/dm/erp/e-invoice/email-printable-queues/dashboard/backoffice-ep
```

**Full URL:** `https://api.akaun.com/core2/tnt/dm/erp/e-invoice/email-printable-queues/dashboard/backoffice-ep`

**Required Permission:** `API_TNT_DM_EINVOICE_EMAIL_PRINTABLE_QUEUE_READ`
(Roles: `API_TNT_DM_EINVOICE_EMAIL_PRINTABLE_QUEUE_OWNER` or `API_TNT_DM_EINVOICE_EMAIL_PRINTABLE_QUEUE_ADMIN`)

### Request Body

All fields are optional. Omitting all fields returns recent queue records up to the default page size.

| Field | Type | Description |
|-------|------|-------------|
| `search` | String | Free-text search across queue records (e.g. by email address or document reference) |
| `createdDateFrom` | String | Filter records created on or after this date. Format: `yyyy-MM-dd` or ISO 8601 |
| `createdDateTo` | String | Filter records created on or before this date. Format: `yyyy-MM-dd` or ISO 8601 |
| `eInvoiceRunningNo` | String | Filter by the e-invoice running number |
| `pageNo` | Integer | Page number (1-based). Default: `1` |
| `pageSize` | Integer | Results per page |
| `calcTotalRecords` | Boolean | If `true`, includes total record count for pagination. Default: `false` |
| `orderBy` | String | Field to sort by (e.g. `created_date`) |
| `order` | String | Sort direction: `ASC` or `DESC` |

### Example Request

```json
{
  "createdDateFrom": "2024-01-01",
  "createdDateTo": "2024-01-31",
  "calcTotalRecords": true,
  "pageNo": 1,
  "pageSize": 20,
  "orderBy": "created_date",
  "order": "DESC"
}
```

### Response Body

Returns a paginated response. Each item in the `data` array represents one queue entry enriched with the linked e-invoice and email content details.

#### Pagination Envelope

| Field | Type | Description |
|-------|------|-------------|
| `totalRecords` | Integer | Total matching records (only populated when `calcTotalRecords: true`) |
| `offset` | Integer | Current page offset |
| `limit` | Integer | Page size used |
| `responseCode` | String | `OK` on success |
| `data` | Array | List of dashboard items (see below) |

#### Each item in `data`

**Queue Status Fields**

| Field | Type | Description |
|-------|------|-------------|
| `queue_guid` | UUID | Unique identifier of the queue record |
| `queue_process_status` | String | Processing state of this queue entry. Values: `IN_QUEUE`, `PROCESSING`, `DONE`, `FAILED` |
| `queue_email_status` | String | Email delivery status. Values: `PENDING`, `SENT`, `FAILED` |
| `queue_email_error_code` | String | Error code from the email provider if delivery failed (e.g. SMTP error code) |
| `queue_email_error_msg` | String | Human-readable error message explaining the delivery failure |
| `queue_retry` | Integer | Number of send attempts made so far |

**Linked E-Invoice Fields**

| Field | Type | Description |
|-------|------|-------------|
| `to_irb_hdr_guid` | UUID | GUID of the linked `bl_fi_my_einvoice_to_irb_hdr` record |
| `to_irb_hdr` | Object | Snapshot of the full `to_irb` header record including supplier name, buyer name, invoice amount, LHDN status, e-invoice code number, etc. |

**Email Content Fields**

| Field | Type | Description |
|-------|------|-------------|
| `thread_title` | String | Email subject line used for this notification |
| `content_email_participants` | String | JSON string listing the email recipients (To, CC, BCC) |
| `html_body` | String | Full HTML body of the email sent or to be sent |
| `attachments` | String | JSON array describing attached files (typically the e-invoice PDF) |

### Example Response

```json
{
  "responseCode": "OK",
  "totalRecords": 42,
  "offset": 0,
  "limit": 20,
  "data": [
    {
      "queue_guid": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "queue_process_status": "FAILED",
      "queue_email_status": "FAILED",
      "queue_email_error_code": "550",
      "queue_email_error_msg": "Recipient address rejected: User unknown",
      "queue_retry": 3,
      "to_irb_hdr_guid": "7cb12a31-9843-4c1d-b891-4feac1234567",
      "to_irb_hdr": {
        "hdr_einvoice_code_no": "INV-2024-001",
        "hdr_supplier_name": "My Company Sdn Bhd",
        "hdr_buyer_name": "Acme Buyer Sdn Bhd",
        "hdr_submission_status": "Valid",
        "hdr_total_payable_amount": 1008.00
      },
      "thread_title": "E-Invoice INV-2024-001 from My Company Sdn Bhd",
      "content_email_participants": "{\"to\":[\"buyer@example.com\"],\"cc\":[],\"bcc\":[]}",
      "html_body": "<html>...</html>",
      "attachments": "[{\"filename\":\"INV-2024-001.pdf\",\"contentType\":\"application/pdf\"}]"
    }
  ]
}
```

### Notes

- Records with `queue_process_status = IN_QUEUE` and `queue_retry < max_retry` will be retried on the next processor run.
- A record with `queue_process_status = FAILED` and `queue_retry >= max_retry` will **not** be retried automatically. Manually requeue or fix the underlying issue (e.g. invalid email address) and reset the record.
- The `to_irb_hdr` nested object contains the full e-invoice header snapshot — use it to identify which document this notification is for without a separate API call.

---

## API 2 — Email Queue History Dashboard (Sent / Completed)

Retrieves the historical record of all email dispatch attempts — both successful and failed. Each record in the history represents a **completed processing attempt** (pass or fail) for a queue entry. Use this for auditing which emails were actually sent, when, and to whom.

### Endpoint

```
POST /core2/tnt/dm/erp/e-invoice/email-printable-queue-histories/dashboard/backoffice-ep
```

**Full URL:** `https://api.akaun.com/core2/tnt/dm/erp/e-invoice/email-printable-queue-histories/dashboard/backoffice-ep`

**Required Permission:** `API_TNT_DM_EINVOICE_EMAIL_PRINTABLE_QUEUE_HISTORY_READ`
(Roles: `API_TNT_DM_EINVOICE_EMAIL_PRINTABLE_QUEUE_HISTORY_OWNER` or `API_TNT_DM_EINVOICE_EMAIL_PRINTABLE_QUEUE_HISTORY_ADMIN`)

### Request Body

Identical structure to the queue dashboard request.

| Field | Type | Description |
|-------|------|-------------|
| `search` | String | Free-text search across history records |
| `createdDateFrom` | String | Filter history records created on or after this date |
| `createdDateTo` | String | Filter history records created on or before this date |
| `eInvoiceRunningNo` | String | Filter by the e-invoice running number |
| `pageNo` | Integer | Page number (1-based). Default: `1` |
| `pageSize` | Integer | Results per page |
| `calcTotalRecords` | Boolean | If `true`, includes total record count. Default: `false` |
| `orderBy` | String | Field to sort by |
| `order` | String | Sort direction: `ASC` or `DESC` |

### Example Request

```json
{
  "eInvoiceRunningNo": "INV-2024-001",
  "calcTotalRecords": true,
  "pageNo": 1,
  "pageSize": 10
}
```

### Response Body

Same envelope structure as the queue dashboard. Each item in `data` represents one history entry.

#### Each item in `data`

**History Record Fields**

| Field | Type | Description |
|-------|------|-------------|
| `queue_guid` | UUID | GUID of the original queue record that generated this history entry |
| `queue_process_status` | String | The `process_status` value of the queue record at the time this history entry was written |
| `queue_email_status` | String | Email delivery status at the time of this attempt: `SENT` or `FAILED` |
| `queue_email_error_code` | String | Error code if delivery failed |
| `queue_email_error_msg` | String | Error message if delivery failed |
| `queue_retry` | Integer | Retry count at the time this history entry was created |
| `to_irb_hdr_guid` | UUID | GUID of the linked `bl_fi_my_einvoice_to_irb_hdr` record |
| `to_irb_hdr` | Object | Snapshot of the e-invoice header at the time the history entry was written |
| `thread_title` | String | Email subject line used |
| `content_email_participants` | String | JSON string of recipients (To, CC, BCC) |
| `html_body` | String | HTML body of the email |
| `attachments` | String | JSON array of file attachments |

**History-Specific Timestamps**

| Field | Type | Description |
|-------|------|-------------|
| `queue_created_date` | DateTime | When the original queue record was created (i.e. when the e-invoice was first ready to email) |
| `created_date` | DateTime | When this history entry was created (i.e. when the send attempt was made) |

### Example Response

```json
{
  "responseCode": "OK",
  "totalRecords": 15,
  "offset": 0,
  "limit": 10,
  "data": [
    {
      "queue_guid": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "queue_process_status": "DONE",
      "queue_email_status": "SENT",
      "queue_email_error_code": null,
      "queue_email_error_msg": null,
      "queue_retry": 1,
      "to_irb_hdr_guid": "7cb12a31-9843-4c1d-b891-4feac1234567",
      "to_irb_hdr": {
        "hdr_einvoice_code_no": "INV-2024-001",
        "hdr_supplier_name": "My Company Sdn Bhd",
        "hdr_buyer_name": "Acme Buyer Sdn Bhd",
        "hdr_submission_status": "Valid",
        "hdr_total_payable_amount": 1008.00
      },
      "thread_title": "E-Invoice INV-2024-001 from My Company Sdn Bhd",
      "content_email_participants": "{\"to\":[\"buyer@example.com\"],\"cc\":[],\"bcc\":[]}",
      "html_body": "<html>...</html>",
      "attachments": "[{\"filename\":\"INV-2024-001.pdf\",\"contentType\":\"application/pdf\"}]",
      "queue_created_date": "2024-01-15T08:05:00+08:00",
      "created_date": "2024-01-15T08:10:32+08:00"
    }
  ]
}
```

### Notes

- A single queue record can produce multiple history entries (one per attempt).
- Use `queue_email_status = SENT` to confirm successful delivery.
- The `created_date` field (history entry creation time) reflects when the processor actually attempted the send — compare against `queue_created_date` to see how long a document waited before the email was dispatched.
- History records are immutable — they are written once per attempt and never updated.

---

## Queue vs History — Quick Reference

| | Email Queue Dashboard | Email Queue History Dashboard |
|-|----------------------|-------------------------------|
| **Table** | `bl_fi_my_einvoice_email_printable_queue` | `bl_fi_my_einvoice_email_printable_queue_history` |
| **Purpose** | Shows current state of pending/failed emails | Shows audit trail of all send attempts |
| **When to use** | Identify stuck or failed queue entries | Confirm delivery, view timestamps, audit sends |
| **Mutability** | Records updated as processor runs | Records are append-only (immutable) |
| **Status: IN_QUEUE** | Awaiting next processor run | N/A (not yet attempted) |
| **Status: DONE** | Successfully sent; no longer retried | History entry with `email_status = SENT` |
| **Status: FAILED** | Failed; will retry if retry count < max | History entry with `email_status = FAILED` |
