---
description: PEPPOL and MyInvois compliance with automated invoice validation, formatting,
  and submission to government portals.
tags:
- user-guide
title: E-Invoice APIs
weight: 20
draft: true  # unpublished 2026-09-06: documents endpoints that do not exist; rewrite from the real /core2/ mappings (F-0283)
---

PEPPOL and MyInvois compliance with automated invoice validation, formatting, and submission to government portals. Ensure compliance with Malaysian LHDN requirements and international PEPPOL standards.

## Base URL

```
https://api.bigledger.com/v1
```

## Authentication

All requests require authentication:

```http
Authorization: Bearer YOUR_API_KEY
X-Company-Id: YOUR_COMPANY_ID
```

## E-Invoice Overview

BigLedger's E-Invoice APIs handle:

- **PEPPOL UBL 2.1** format compliance
- **MyInvois** (Malaysia LHDN) integration
- **Real-time validation** against government schemas
- **Automated submission** to tax authorities
- **Status tracking** and audit trails
- **Digital signatures** and security compliance

## E-Invoice Object

```json
{
  "id": "einv_123456789",
  "invoiceId": "inv_888999000",
  "format": "PEPPOL_UBL",
  "status": "accepted",
  "submissionType": "original",
  "uuid": "01234567-89ab-cdef-0123-456789abcdef",
  "submissionId": "SUB-2024-0001",
  "validationHash": "sha256:abc123...",
  "qrCode": "data:image/png;base64,iVBOR...",
  "digitalSignature": {
    "algorithm": "SHA256withRSA",
    "certificate": "-----BEGIN CERTIFICATE-----...",
    "timestamp": "2024-01-15T10:30:00Z"
  },
  "government": {
    "portal": "myinvois",
    "taxpayerId": "C12345678901234567890",
    "submissionId": "MY-INV-2024-000001",
    "longId": "EI20240115103000001234567890",
    "validationTime": "2024-01-15T10:32:00Z",
    "acceptanceTime": "2024-01-15T10:33:00Z"
  },
  "validation": {
    "isValid": true,
    "validatedAt": "2024-01-15T10:30:00Z",
    "errors": [],
    "warnings": [
      {
        "code": "W001",
        "message": "Buyer tax ID not provided",
        "field": "AccountingCustomerParty.Party.PartyTaxScheme.CompanyID"
      }
    ]
  },
  "document": {
    "xml": "<?xml version='1.0' encoding='UTF-8'?>...",
    "pdf": "https://files.bigledger.com/einvoice/einv_123456789.pdf",
    "json": "https://files.bigledger.com/einvoice/einv_123456789.json"
  },
  "compliance": {
    "standard": "UBL-2.1",
    "profile": "MY-PEPPOL-BIS-3.0",
    "customization": "urn:peppol:bis:billing:3.0"
  },
  "timeline": [
    {
      "status": "created",
      "timestamp": "2024-01-15T10:30:00Z",
      "notes": "E-invoice document generated"
    },
    {
      "status": "validated",
      "timestamp": "2024-01-15T10:30:30Z",
      "notes": "Document passed validation"
    },
    {
      "status": "submitted",
      "timestamp": "2024-01-15T10:31:00Z",
      "notes": "Submitted to MyInvois portal"
    },
    {
      "status": "accepted",
      "timestamp": "2024-01-15T10:33:00Z",
      "notes": "Accepted by tax authority"
    }
  ],
  "createdAt": "2024-01-15T10:30:00Z",
  "updatedAt": "2024-01-15T10:33:00Z"
}
```

## Create E-Invoice

Create an e-invoice from an existing sales invoice.

```http
POST /api/v1/einvoice/create
```

**Request Body:**

```json
{
  "invoiceId": "inv_888999000",
  "format": "PEPPOL_UBL",
  "submissionType": "original",
  "options": {
    "autoSubmit": true,
    "validateOnly": false,
    "includeAttachments": true,
    "language": "en"
  },
  "buyer": {
    "taxId": "987654321098",
    "registrationName": "Acme Corporation Sdn Bhd",
    "businessRegistrationNumber": "123456-A",
    "sectorClassification": "46900",
    "businessActivityDescription": "Other specialized wholesale"
  },
  "delivery": {
    "actualDeliveryDate": "2024-01-14",
    "deliveryParty": {
      "name": "Acme Corporation",
      "address": {
        "street": "456 Warehouse Road",
        "city": "Shah Alam",
        "state": "Selangor",
        "postalCode": "40000",
        "country": "MY"
      }
    }
  },
  "payment": {
    "paymentMeans": "bank_transfer",
    "paymentTerms": "Net 30 days",
    "bankAccount": {
      "bankName": "Maybank",
      "accountNumber": "1234567890",
      "swiftCode": "MBBEMYKL"
    }
  }
}
```

**Required Fields:**
- `invoiceId`: Valid BigLedger invoice ID
- `format`: E-invoice format (PEPPOL_UBL, UBL21, etc.)

**Example Request:**

```bash
curl -X POST "https://api.bigledger.com/v1/einvoice/create" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "invoiceId": "inv_888999000",
    "format": "PEPPOL_UBL",
    "autoSubmit": true
  }'
```

**Response:**

```json
{
  "success": true,
  "data": {
    "id": "einv_123456789",
    "uuid": "01234567-89ab-cdef-0123-456789abcdef",
    "status": "submitted",
    "format": "PEPPOL_UBL",
    "validationHash": "sha256:abc123def456...",
    "qrCode": "data:image/png;base64,iVBOR...",
    "document": {
      "xml": "<?xml version='1.0'?>...",
      "pdf": "https://files.bigledger.com/einvoice/einv_123456789.pdf"
    },
    "government": {
      "submissionId": "MY-INV-2024-000001",
      "longId": "EI20240115103000001234567890"
    }
  }
}
```

## Validate E-Invoice

Validate invoice data before creating an e-invoice.

```http
POST /api/v1/einvoice/validate
```

**Request Body:**

```json
{
  "invoiceId": "inv_888999000",
  "format": "PEPPOL_UBL",
  "strictValidation": true,
  "checkTaxCompliance": true
}
```

**Example Request:**

```bash
curl -X POST "https://api.bigledger.com/v1/einvoice/validate" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "invoiceId": "inv_888999000",
    "format": "PEPPOL_UBL"
  }'
```

**Response:**

```json
{
  "success": true,
  "data": {
    "isValid": true,
    "format": "PEPPOL_UBL",
    "compliance": {
      "standard": "UBL-2.1",
      "profile": "MY-PEPPOL-BIS-3.0"
    },
    "errors": [],
    "warnings": [
      {
        "code": "W001",
        "message": "Buyer tax ID not provided",
        "field": "AccountingCustomerParty.Party.PartyTaxScheme.CompanyID",
        "severity": "warning",
        "suggestion": "Include buyer's tax identification number for better compliance"
      }
    ],
    "summary": {
      "totalErrors": 0,
      "totalWarnings": 1,
      "canSubmit": true
    }
  }
}
```

## Submit E-Invoice

Submit a validated e-invoice to the government portal.

```http
POST /api/v1/einvoice/submit
```

**Request Body:**

```json
{
  "einvoiceId": "einv_123456789",
  "portal": "myinvois",
  "submissionType": "original",
  "options": {
    "waitForResponse": true,
    "timeout": 60,
    "notifyOnCompletion": true
  }
}
```

**Example Request:**

```bash
curl -X POST "https://api.bigledger.com/v1/einvoice/submit" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "einvoiceId": "einv_123456789",
    "portal": "myinvois"
  }'
```

**Response:**

```json
{
  "success": true,
  "data": {
    "submissionId": "SUB-2024-0001",
    "status": "submitted",
    "government": {
      "portal": "myinvois",
      "submissionId": "MY-INV-2024-000001",
      "longId": "EI20240115103000001234567890",
      "submittedAt": "2024-01-15T10:31:00Z"
    },
    "tracking": {
      "estimatedProcessingTime": "2-5 minutes",
      "statusCheckUrl": "/api/v1/einvoice/einv_123456789/status"
    }
  }
}
```

## Get E-Invoice Status

Check the current status of an e-invoice submission.

```http
GET /api/v1/einvoice/{einvoiceId}/status
```

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/einvoice/einv_123456789/status" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

**Response:**

```json
{
  "success": true,
  "data": {
    "id": "einv_123456789",
    "status": "accepted",
    "government": {
      "portal": "myinvois",
      "submissionId": "MY-INV-2024-000001",
      "longId": "EI20240115103000001234567890",
      "status": "valid",
      "validationTime": "2024-01-15T10:32:00Z",
      "acceptanceTime": "2024-01-15T10:33:00Z"
    },
    "timeline": [
      {
        "status": "submitted",
        "timestamp": "2024-01-15T10:31:00Z"
      },
      {
        "status": "validated",
        "timestamp": "2024-01-15T10:32:00Z"
      },
      {
        "status": "accepted",
        "timestamp": "2024-01-15T10:33:00Z"
      }
    ],
    "nextActions": [
      "download_pdf",
      "send_to_customer"
    ]
  }
}
```

## Cancel E-Invoice

Cancel a submitted e-invoice (where permitted by regulations).

```http
POST /api/v1/einvoice/{einvoiceId}/cancel
```

**Request Body:**

```json
{
  "reason": "duplicate_invoice",
  "reasonCode": "01",
  "notes": "Duplicate invoice created in error",
  "cancellationDate": "2024-01-15"
}
```

**Cancellation Reasons:**

| Code | Reason | Description |
|------|--------|-------------|
| 01 | duplicate_invoice | Duplicate invoice |
| 02 | data_error | Error in invoice data |
| 03 | system_error | System processing error |
| 04 | buyer_rejection | Rejected by buyer |
| 05 | other | Other reason (specify in notes) |

## List E-Invoices

Retrieve e-invoices with filtering and pagination.

```http
GET /api/v1/einvoice
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `status` | string | Filter by status (`created`, `validated`, `submitted`, `accepted`, `rejected`, `cancelled`) |
| `format` | string | Filter by format (`PEPPOL_UBL`, `UBL21`) |
| `portal` | string | Filter by government portal (`myinvois`, `peppol`) |
| `dateFrom` | string | Created from date (YYYY-MM-DD) |
| `dateTo` | string | Created to date (YYYY-MM-DD) |
| `customerId` | string | Filter by customer |
| `invoiceId` | string | Filter by invoice |
| `uuid` | string | Search by UUID |
| `submissionId` | string | Search by government submission ID |
| `limit` | integer | Number of records per page |
| `cursor` | string | Pagination cursor |

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/einvoice?status=accepted&dateFrom=2024-01-01&limit=20" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID"
```

## Download E-Invoice Documents

### Get XML Document

```http
GET /api/v1/einvoice/{einvoiceId}/document/xml
```

### Get PDF Document

```http
GET /api/v1/einvoice/{einvoiceId}/document/pdf
```

### Get JSON Representation

```http
GET /api/v1/einvoice/{einvoiceId}/document/json
```

**Example Request:**

```bash
curl -X GET "https://api.bigledger.com/v1/einvoice/einv_123456789/document/pdf" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "X-Company-Id: YOUR_COMPANY_ID" \
  -o "einvoice.pdf"
```

## E-Invoice Formats

### PEPPOL UBL 2.1

Standard PEPPOL format for international B2B transactions:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Invoice xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
         xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
         xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2">
  <cbc:CustomizationID>urn:peppol:bis:billing:3.0</cbc:CustomizationID>
  <cbc:ProfileID>urn:peppol:bis:billing:3.0</cbc:ProfileID>
  <cbc:ID>INV-2024-0001</cbc:ID>
  <cbc:IssueDate>2024-01-15</cbc:IssueDate>
  <cbc:DueDate>2024-02-14</cbc:DueDate>
  <cbc:InvoiceTypeCode>380</cbc:InvoiceTypeCode>
  <cbc:DocumentCurrencyCode>MYR</cbc:DocumentCurrencyCode>
  <!-- Additional UBL elements... -->
</Invoice>
```

### MyInvois JSON Format

Malaysia-specific JSON format for MyInvois:

```json
{
  "_D": "urn:oasis:names:specification:ubl:schema:xsd:Invoice-2",
  "_A": "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2",
  "_B": "urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2",
  "Invoice": [
    {
      "ID": [{"_": "INV-2024-0001"}],
      "IssueDate": [{"_": "2024-01-15"}],
      "InvoiceTypeCode": [{"_": "01", "listVersionID": "1.0"}],
      "DocumentCurrencyCode": [{"_": "MYR"}]
    }
  ]
}
```

## Compliance Requirements

### Malaysian MyInvois Requirements

For Malaysia LHDN compliance:

1. **Mandatory Fields:**
   - Supplier TIN (Tax Identification Number)
   - Buyer information (name, address, TIN if available)
   - Invoice number and date
   - Line items with description, quantity, unit price
   - Tax calculation (SST/GST)

2. **Business Rules:**
   - Invoice number must be unique per supplier
   - Total amount must equal sum of line items plus taxes
   - Tax rates must match LHDN approved rates
   - Currency must be MYR for domestic transactions

3. **Validation Rules:**
   - XML must validate against MyInvois XSD schema
   - Business validation rules as per LHDN guidelines
   - Digital signature requirements for certain transaction types

### PEPPOL Requirements

For international PEPPOL compliance:

1. **Profile Requirements:**
   - Must use PEPPOL BIS Billing 3.0 profile
   - UBL 2.1 format compliance
   - PEPPOL participant identification

2. **Technical Requirements:**
   - Valid PEPPOL participant ID
   - Digital certificates for secure transmission
   - AS4 protocol compliance for transmission

## Webhooks for E-Invoice Events

Subscribe to e-invoice status changes:

```http
POST /api/v1/webhooks/subscribe
```

**Request Body:**

```json
{
  "url": "https://your-app.com/webhooks/einvoice",
  "events": [
    "einvoice.created",
    "einvoice.validated",
    "einvoice.submitted",
    "einvoice.accepted",
    "einvoice.rejected",
    "einvoice.cancelled"
  ],
  "secret": "your-webhook-secret"
}
```

**Webhook Payload Example:**

```json
{
  "event": "einvoice.accepted",
  "timestamp": "2024-01-15T10:33:00Z",
  "data": {
    "einvoiceId": "einv_123456789",
    "invoiceId": "inv_888999000",
    "uuid": "01234567-89ab-cdef-0123-456789abcdef",
    "status": "accepted",
    "government": {
      "portal": "myinvois",
      "submissionId": "MY-INV-2024-000001",
      "longId": "EI20240115103000001234567890"
    }
  }
}
```

## Error Handling

### 400 Bad Request - Invalid Invoice Data

```json
{
  "success": false,
  "error": {
    "code": "INVALID_INVOICE_DATA",
    "message": "Invoice data does not meet e-invoice requirements",
    "details": [
      {
        "field": "supplier.taxId",
        "message": "Supplier tax ID is required for e-invoice generation"
      },
      {
        "field": "items[0].taxCode",
        "message": "Tax code is required for all line items"
      }
    ]
  }
}
```

### 422 Unprocessable Entity - Validation Failed

```json
{
  "success": false,
  "error": {
    "code": "EINVOICE_VALIDATION_FAILED",
    "message": "E-invoice failed government portal validation",
    "details": [
      {
        "code": "E001",
        "message": "Invalid buyer tax identification number format",
        "field": "AccountingCustomerParty.Party.PartyTaxScheme.CompanyID"
      }
    ],
    "governmentResponse": {
      "portal": "myinvois",
      "errorCode": "BR-MY-01",
      "errorMessage": "Buyer TIN format is invalid"
    }
  }
}
```

### 409 Conflict - Already Submitted

```json
{
  "success": false,
  "error": {
    "code": "EINVOICE_ALREADY_SUBMITTED",
    "message": "E-invoice has already been submitted and accepted",
    "details": [
      {
        "einvoiceId": "einv_123456789",
        "status": "accepted",
        "submissionId": "MY-INV-2024-000001",
        "submittedAt": "2024-01-15T10:31:00Z"
      }
    ]
  }
}
```

## Code Examples

### Complete E-Invoice Workflow

```javascript
// Complete e-invoice workflow from creation to acceptance
async function processEInvoice(invoiceId) {
  const client = new BigLedgerClient({ /* config */ });
  
  try {
    // Step 1: Validate invoice data
    const validation = await client.einvoice.validate({
      invoiceId: invoiceId,
      format: 'PEPPOL_UBL',
      strictValidation: true
    });
    
    if (!validation.isValid) {
      console.error('Validation failed:', validation.errors);
      return null;
    }
    
    // Step 2: Create e-invoice
    const einvoice = await client.einvoice.create({
      invoiceId: invoiceId,
      format: 'PEPPOL_UBL',
      autoSubmit: false, // Manual submission for better control
      buyer: {
        taxId: '987654321098',
        registrationName: 'Buyer Corporation Sdn Bhd'
      }
    });
    
    console.log('E-invoice created:', einvoice.id);
    
    // Step 3: Submit to government portal
    const submission = await client.einvoice.submit({
      einvoiceId: einvoice.id,
      portal: 'myinvois',
      waitForResponse: true,
      timeout: 60
    });
    
    console.log('Submitted to portal:', submission.government.submissionId);
    
    // Step 4: Poll for status until accepted
    let status = 'submitted';
    let attempts = 0;
    const maxAttempts = 20;
    
    while (status !== 'accepted' && status !== 'rejected' && attempts < maxAttempts) {
      await new Promise(resolve => setTimeout(resolve, 10000)); // Wait 10 seconds
      
      const statusResponse = await client.einvoice.getStatus(einvoice.id);
      status = statusResponse.status;
      attempts++;
      
      console.log(`Status check ${attempts}: ${status}`);
    }
    
    if (status === 'accepted') {
      console.log('E-invoice accepted by government portal');
      
      // Step 5: Download final PDF
      const pdfUrl = await client.einvoice.getDocumentUrl(einvoice.id, 'pdf');
      console.log('E-invoice PDF available at:', pdfUrl);
      
      return {
        einvoiceId: einvoice.id,
        status: 'accepted',
        governmentId: submission.government.longId,
        pdfUrl: pdfUrl
      };
    } else {
      console.error('E-invoice was rejected or timed out');
      return null;
    }
    
  } catch (error) {
    console.error('E-invoice processing failed:', error);
    return null;
  }
}
```

### Bulk E-Invoice Processing

```python
# Process multiple invoices for e-invoice submission
async def bulk_process_einvoices(invoice_ids, format='PEPPOL_UBL'):
    client = BigLedgerClient(api_key="...", company_id="...")
    results = []
    
    for invoice_id in invoice_ids:
        try:
            # Validate first
            validation = await client.post('/einvoice/validate', {
                'invoiceId': invoice_id,
                'format': format
            })
            
            if not validation['data']['isValid']:
                results.append({
                    'invoiceId': invoice_id,
                    'status': 'validation_failed',
                    'errors': validation['data']['errors']
                })
                continue
            
            # Create and submit
            einvoice = await client.post('/einvoice/create', {
                'invoiceId': invoice_id,
                'format': format,
                'autoSubmit': True
            })
            
            results.append({
                'invoiceId': invoice_id,
                'einvoiceId': einvoice['data']['id'],
                'status': 'submitted',
                'governmentId': einvoice['data'].get('government', {}).get('submissionId')
            })
            
        except Exception as e:
            results.append({
                'invoiceId': invoice_id,
                'status': 'error',
                'error': str(e)
            })
    
    return results
```

### E-Invoice Status Monitoring

```python
# Monitor e-invoice status with webhook handling
from flask import Flask, request, jsonify
import hmac
import hashlib

app = Flask(__name__)

@app.route('/webhooks/einvoice', methods=['POST'])
def handle_einvoice_webhook():
    # Verify webhook signature
    signature = request.headers.get('X-Signature')
    payload = request.get_data()
    
    expected_signature = hmac.new(
        WEBHOOK_SECRET.encode(),
        payload,
        hashlib.sha256
    ).hexdigest()
    
    if not hmac.compare_digest(signature, f'sha256={expected_signature}'):
        return jsonify({'error': 'Invalid signature'}), 401
    
    event_data = request.get_json()
    event_type = event_data['event']
    einvoice_data = event_data['data']
    
    if event_type == 'einvoice.accepted':
        # Update internal records
        update_invoice_status(
            einvoice_data['invoiceId'],
            'einvoice_accepted',
            {
                'einvoice_id': einvoice_data['einvoiceId'],
                'government_id': einvoice_data['government']['longId']
            }
        )
        
        # Send notification to customer
        send_einvoice_notification(
            einvoice_data['invoiceId'],
            einvoice_data['government']['longId']
        )
        
    elif event_type == 'einvoice.rejected':
        # Handle rejection
        handle_einvoice_rejection(
            einvoice_data['einvoiceId'],
            einvoice_data.get('errors', [])
        )
    
    return jsonify({'status': 'processed'}), 200
```

The E-Invoice APIs provide comprehensive support for Malaysian MyInvois and international PEPPOL compliance, ensuring your invoices meet all regulatory requirements and are successfully submitted to government portals.