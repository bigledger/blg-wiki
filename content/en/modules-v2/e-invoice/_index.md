---
title: "E-Invoice & PEPPOL Module"
description: "Statutory electronic invoicing compliance for Malaysian MyInvois and international PEPPOL networks."
weight: 60
---

## 1. Module Overview

The **E-Invoice & PEPPOL Module** automates statutory electronic invoice submission and compliance with digital tax frameworks. In Malaysia, the module integrates directly with the Inland Revenue Board's (LHDN) **MyInvois** platform for mandatory tax validation. Internationally, it supports the **PEPPOL** network for seamless cross-border electronic document exchange.

**Business Value:**
- **Regulatory Penalties Avoided**: Meet national e-invoicing compliance requirements automatically without manual portal uploads.
- **Embedded Validation**: Check validation results, rejection logs, and validation QR codes directly inside standard invoicing workflows.
- **Global Interoperability**: Send and receive B2B/B2G business documents worldwide through the PEPPOL Access Point.
- **Improved Cash Flow**: Instant electronic document delivery accelerates customer invoice approvals and payment cycles.

### Compliance Frameworks

- **LHDN MyInvois (Malaysia)**: Automatic QR code generation, real-time API schema validation (XML/JSON), buyer/supplier database checking, and statutory data field mapping (TIN, MSIC).
- **PEPPOL International Standard**: EN 16931 compliant cross-border messaging, UBL 2.1 document formatting, Access Point routing, and trading partner lookup directory.

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **E-Invoice** | A structured electronic document (XML or JSON) containing required tax data submitted for regulatory validation. |
| **MyInvois** | Malaysia's national e-invoicing platform operated by the Inland Revenue Board (LHDN). |
| **PEPPOL** | Pan-European Public Procurement Online — the international framework defining secure document exchange protocols. |
| **UUID** | Unique Identifier assigned to each validated e-invoice by LHDN upon successful processing. |
| **Access Point (AP)** | A gateway node routing secure business documents over the PEPPOL network between participants. |
| **Digital Certificate** | A cryptographic file verifying the identity of the submitting organization, used to sign e-invoices. |
| **MSIC Code** | Malaysia Standard Industrial Classification code required on e-invoices to define business activity categories. |
| **TIN** | Tax Identification Number assigned by LHDN to individuals and corporate entities. |

---

## 3. Included Applets

### E-Invoice Compliance Console

| Applet | Purpose |
|--------|---------|
| [E-Invoice Generation Applet](/applets/e-invoice/einvoice-generation-applet/) | Process billing invoices, validate schemas, sign documents, submit to MyInvois, and retrieve validated UUIDs. |
| [My E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/) | Search and download validated e-invoices, inspect government verification stamps, and review rejection logs. |
| [My E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) | Central administration panel to enter LHDN credentials, manage digital certificates, and configure submission rules. |

### PEPPOL Access Point Management

| Applet | Purpose |
|--------|---------|
| [MyPEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) | Register participant identifiers, define receiving endpoints, and configure Access Point mappings. |
| [PEPPOL AP Admin Applet](/applets/e-invoice/peppolap-admin-applet/) | Monitor inbound/outbound PEPPOL transmission queues, route received documents, and inspect logs. |

### Specialized Support Applets

| Applet | Purpose |
|--------|---------|
| [E-Invoice Template Designer Applet](/applets/e-invoice/einvoice-template-designer-applet/) | Configure print layouts to render mandatory compliance details, UUIDs, and validation QR codes. |
| [Digital Signature Management Applet](/applets/e-invoice/digital-signature-management-applet/) | Manage PKI certificates, configure signing workflows, and track certificate expiration alerts. |
| [Compliance Validation Engine Applet](/applets/e-invoice/compliance-validation-engine-applet/) | Internal pre-validation engine checking invoices against LHDN rules before API submission. |
| [Tax Authority Reporting Applet](/applets/e-invoice/tax-authority-reporting-applet/) | Compile audit reports, SST reconciliation summaries, and historical tax filings. |
| [E-Invoice Archive Management Applet](/applets/e-invoice/einvoice-archive-management-applet/) | Immutable document archive repository keeping compliant records as required by tax laws. |

---

## 4. Standard Business Workflows

### Workflow 1: Malaysian MyInvois Validation

```
Sales Invoice Created ──▶ Pre-Validation ──▶ Digital Signature ──▶ MyInvois Submission ──▶ UUID & QR Code Mapped ──▶ Archive
```

**Steps:**
1. A billing invoice is finalized in the **Internal Sales Invoice Applet**.
2. **Compliance Validation Engine** runs a check to verify mandatory field compliance (TIN, address, email, MSIC).
3. The invoice is signed cryptographically using the organization's certificate via the **Signature Management Applet**.
4. The signed document is sent to LHDN MyInvois APIs.
5. LHDN returns a **UUID** and validation status; the system updates the invoice status to "Validated" and generates the QR code.
6. The validated PDF is sent to the customer and saved in the **Archive Management Applet**.

### Workflow 2: International PEPPOL Document Exchange

```
Sales Invoice Created ──▶ PEPPOL XML Format ──▶ Directory Lookup ──▶ Access Point Send ──▶ Receiver Acknowledges
```

**Steps:**
1. Invoice is created for an international buyer requiring PEPPOL.
2. System converts the document data to PEPPOL UBL XML format.
3. System queries the PEPPOL directory to find the receiver's Access Point endpoint.
4. The document is routed via the **PEPPOL Access Point Applet** to the buyer's network.
5. The receiving Access Point returns a delivery acknowledgment, and the invoice status updates.

### Workflow 3: Compliance Reporting & Tax Reconciliation

```
Compile Period Sales ──▶ Reconcile UUID list ──▶ Run Reconciliation Check ──▶ Generate SST Report ──▶ Submit
```

**Steps:**
1. Period-end sales data is compiled.
2. The accountant opens the **Tax Authority Reporting Applet** to pull all validated UUIDs.
3. System runs a validation check comparing accounting ledger balances against MyInvois submissions.
4. Discrepancies (unsubmitted or rejected items) are flagged for corrective action.
5. Accountant exports the consolidated e-invoice ledger report for tax submission.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **Finance Officer** | E-Invoice Generation, Portal, Status Tracking | Process daily billing invoices, monitor submission logs, download validated PDFs |
| **Tax Compliance Officer** | My E-Invoice Portal, Tax Authority Reporting | Review validation rejections, correct tax classification mapping errors, reconcile SST reports |
| **IT Security / SysAdmin** | My E-Invoice Admin, PEPPOL Admin, Signature Management | Configure API integrations, install digital certificates, manage Access Point rules |

---

## 6. Prerequisites / Initial Setup

Before going live with the E-Invoice & PEPPOL Module, ensure:

- [x] **Core Module** — Organization registration details are completed, including valid Tax Identification Number (TIN)
- [x] **Financial Accounting** — Sales invoice workflows are operational
- [ ] Registered client credentials (API keys) obtained from LHDN portal
- [ ] Mapped MSIC codes matching your business activities in organization settings
- [ ] Mapped tax codes matched to standard LHDN tax type codes (e.g., SST, Out-of-Scope)
- [ ] Installed digital signature certificates in the **Digital Signature Management Applet**
- [ ] Sandbox testing completed with verified sandbox validation returns

### Implementation Phasing

- **Phase 1: Configuration**: Install PKI certificates, set LHDN/PEPPOL API credentials, and map customer TIN details.
- **Phase 2: Operational Sandbox**: Run test billing runs, trace validation error exceptions, and test cancellation windows.
- **Phase 3: Production Go-Live**: Connect live document generation to real-time e-invoicing pipelines, and set up archival rules.

---

## 7. FAQs & Troubleshooting

**Q: A submission was rejected by MyInvois. How do I trace the error?**
A: Open the **My E-Invoice Portal Applet** and filter by "Rejected." Scroll to the line item details to see LHDN's exact error message (e.g., "Invalid Buyer TIN" or "MSIC code is mandatory"). Correct the source customer or invoice record, then select "Re-submit."

**Q: Can a validated e-invoice be changed?**
A: No. Once validated by LHDN, the e-invoice is legally locked. If you need to make changes, you must cancel the invoice (within the 72-hour regulatory window) or issue a **Credit Note** or **Debit Note** to adjust the balance.

**Q: How does the system handle B2C walk-in customers who do not provide a TIN?**
A: You should configure the system to use LHDN's default general TIN `EI00000000020` for walk-in retail transactions where the customer does not request a personalized e-invoice.

### Troubleshooting Common Issues

- **TIN Verification Failures**: Ensure customer profiles in **Customer Maintenance** are formatted correctly. Double-check individual and corporate registration formats against government databases.
- **API Connection Timeout**: Check the API logs in the **My E-Invoice Admin Applet**. If the LHDN server is down, transactions queue locally; the system will automatically re-submit them when the connection is restored.
- **Certificate Expiration**: Monitor the warnings in the **Digital Signature Management Applet**. Renew certificates before expiration to prevent submission failures.
