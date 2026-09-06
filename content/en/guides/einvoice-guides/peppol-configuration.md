---
description: Configure PEPPOL for international e-invoicing.
tags:
- user-guide
title: PEPPOL Configuration Guide
weight: 45
---

Configure PEPPOL for international e-invoicing.

## What is PEPPOL?

Pan-European Public Procurement On-Line (PEPPOL) enables cross-border electronic document exchange.

## PEPPOL ID Setup

### Step 1: Obtain PEPPOL ID

Your PEPPOL ID format:
```
0195:MYREGISTRATIONNUMBER
```
- 0195 = Malaysia country code
- Followed by your business registration

### Step 2: Configure in BigLedger

1. Go to **E-Invoice** → **PEPPOL Settings**
2. Enter PEPPOL ID
3. Select document types:
   - Invoice
   - Credit Note
   - Order
   - Order Response
4. Configure endpoints

### Step 3: Trading Partner Setup

Add trading partners:
- Partner PEPPOL ID
- Document types
- Validation rules
- Routing preferences

## Document Standards

### UBL 2.1 Format
- XML-based standard
- Structured data
- Machine-readable
- Validated format

### Compliance Requirements
- Digital signatures
- Timestamps
- Audit trails
- Archival (7 years)

## Testing Process

1. Connect to PEPPOL test network
2. Exchange test documents
3. Validate receipts
4. Verify delivery
5. Check compliance

---

*PEPPOL support: peppol@bigledger.com*