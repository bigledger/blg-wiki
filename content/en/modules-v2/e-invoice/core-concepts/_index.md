---
title: "Core Concepts"
description: "Fundamental architectural concepts of BigLedger's E-Invoice & PEPPOL Module — real-time clearance, digital signing, and PEPPOL routing."
weight: 20
bookCollapseSection: false
---

Understanding core e-invoicing concepts is essential before connecting government tax authority APIs or establishing PEPPOL access points. These concepts explain **how commercial billing data is validated by tax authorities in real-time** and how digital signatures protect compliance integrity.

## The E-Invoice Validation & Clearance Lifecycle

Tax compliance submission follows a structured 5-step lifecycle. Each step represents an automated cryptographic transformation and validation milestone.

![E-Invoice Validation & Clearance Lifecycle](/images/e-invoice/einvoice_lifecycle.png)

| Step | Milestone | Business Purpose | Applet Used |
|------|-----------|------------------|-------------|
| **1** | **Commercial Invoice Generation** | Sales order billing or POS checkout creates commercial invoice in ERP | [Sales Invoice Applet](/applets/sales-workflow/internal-sales-invoice-applet/) |
| **2** | **Data Transformation & Sign** | Data formatted into LHDN's schema and digitally signed by BigLedger as your intermediary — no certificate of yours is involved | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) |
| **3** | **Tax Authority API Submission** | Real-time REST API transmission to tax gateway (e.g., LHDN) | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) |
| **4** | **QR Code & UUID Clearance** | Tax authority validates schema, issues unique UUID and clearance QR stamp | Government Tax API |
| **5** | **Recipient Dispatch** | Validated e-invoice, with its QR code, e-mailed to the buyer and viewable by them | [MY E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/) |

---

## PEPPOL Global Network Routing

While government tax APIs handle local country tax compliance, the **PEPPOL (Pan-European Public Procurement On-Line)** network provides standard international B2B electronic document delivery:
- **PEPPOL Participant ID:** Unique global business identifier (e.g., scheme ID + registration number) used for routing.
- **Access Point (AP):** BigLedger acts as a certified PEPPOL Access Point, automatically converting commercial invoices into UBL XML standards for instant cross-border delivery.

---

## What to Read Next

- **[Configuration](/modules-v2/e-invoice/configuration/)** — Set up tax registrations, intermediary authorisation and classification codes.
- **[MyInvois Setup](/guides/einvoice-guides/myinvois-setup/)** — the same ground as a step-by-step guide, if you are the one doing it.
- **[Use Cases](/modules-v2/e-invoice/use-cases/)** — Review reference architectures for commercial B2B billing, consolidated retail POS, and foreign self-billing.
