---
title: "E-Invoice & PEPPOL Module"
description: "Government tax compliance and global e-invoicing engine managing real-time tax authority validation, QR clearances, and PEPPOL network B2B exchanges."
weight: 36
---

The **E-Invoice & PEPPOL Module** is BigLedger's tax compliance and global electronic invoicing engine. It automates real-time clearance validation with government tax authorities (e.g., LHDN in Malaysia), embeds QR code validation stamps into commercial billing, and exchanges structured e-invoices across the global PEPPOL network.

## Architecture & Data Flow

E-Invoice operates directly on top of commercial sales billing and accounts payable. When a Sales Invoice or Credit Note is generated, BigLedger transforms commercial billing into validated JSON/XML payloads, signs them digitally, and submits them to tax authorities for instant clearance before customer delivery.

![ERP E-Invoice & PEPPOL Integration Architecture](/images/e-invoice/einvoice_architecture.png)

| Architecture Layer | System Component | Primary Role in Compliance Operations |
|-------------------|------------------|---------------------------------------|
| **Validation Engine** | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) | Central management of digital signing certificates, tax classification mapping, and submission queues. |
| **Tax Authority API** | Government Tax Gateway (LHDN API) | Real-time validation checking, cryptographic hashing, and clearance UUID / QR code stamping. |
| **Global PEPPOL Exchange** | [MY PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) | PEPPOL Access Point routing for automated cross-border B2B document exchange. |
| **Commercial Billing** | Sales & Financial Accounting | Commercial invoice trigger, consolidated monthly billing, and audit compliance logging. |

---

## Who Uses This Module

| Role | Primary Responsibilities | Core Applets Used |
|------|--------------------------|-------------------|
| **Tax Compliance Officer** | Manage digital signing certificates, map MSIC codes, monitor LHDN clearance submission queues | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) |
| **Accounts Receivable Clerk** | Issue validated e-invoices, manage rejected tax submissions, monitor buyer clearance status | [MY E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/) |
| **Global Trade Manager** | Configure PEPPOL Participant IDs, manage cross-border B2B electronic document exchanges | [MY PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) |
| **B2B Customer / Supplier** | View validated tax invoices, verify clearance QR codes, submit self-billed e-invoices | [MY E-Invoice for Customer & Supplier Applet](/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet/) |

---

## Four E-Invoice Document Types Every Team Must Differentiate

Confusing e-invoice submission types leads to tax audit penalties and clearance rejections:

| E-Invoice Document | When it is used | Tax Authority Requirement | Financial Accounting Impact |
|--------------------|-----------------|---------------------------|-----------------------------|
| **Standard B2B E-Invoice** | Commercial sales between registered business entities | Individual real-time clearance UUID mandatory within 72 hours | Revenue recognized, Accounts Receivable debited |
| **Consolidated E-Invoice** | High-volume B2C retail POS sales to end-consumers | Aggregated monthly submission within 7 days of month-end | POS Cash revenue posted, summary tax liability cleared |
| **Self-Billed E-Invoice** | Import of foreign services, e-commerce commissions, or agricultural payouts | Buyer issues tax invoice on behalf of supplier | Accounts Payable credited, Input Tax GL debited |
| **E-Credit / Debit Note** | Post-billing commercial adjustments, price corrections, or returns | Must reference original validated E-Invoice UUID | Revenue adjusted, AR / AP ledgers modified |

---

## Applet Map

| Applet | What it does in this module |
|--------|-----------------------------|
| [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) | Central compliance control hub — tax mapping, digital certs, API credentials, and queue monitoring |
| [MY E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/) | Billing clerk portal for manual tax invoice submission, clearance status checks, and PDF QR printing |
| [MY E-Invoice for Customer & Supplier Applet](/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet/) | External portal for trading partners to view validated tax documents and upload self-billed e-invoices |
| [MY PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) | International PEPPOL network access point configuration and global document exchange logs |

---

## ERP Dependency Table

| Connected Module | What E-Invoice needs from it |
|------------------|------------------------------|
| **Core** | Tax Identification Numbers (TIN), Business Registration Numbers (BRN), MSIC codes, UOM mappings |
| **Sales & POS** | Commercial Sales Invoices, POS counter retail sales receipts, Credit Notes, Debit Notes |
| **Purchasing** | Foreign supplier invoices requiring self-billed e-invoices, vendor TIN master profiles |
| **Financial Accounting** | Tax GL ledgers (Output SST / Input SST), General Ledger audit trails |

---

## Go-Live Checklist

- [x] Company Tax Identification Number (TIN) and BRN registered in Core
- [ ] Digital signing certificate uploaded in MY E-Invoice Admin Applet
- [ ] Tax classification codes and MSIC industry codes mapped to item master data
- [ ] LHDN / PEPPOL production API access keys configured and verified
- [ ] Consolidated monthly B2C retail workflow rules established for POS counters
- [ ] Finance and AR staff trained on resolving submission rejection codes

---

## Module Learning Roadmap

Follow the documentation in this sequence to master the E-Invoice & PEPPOL Module:

1. **[Core Concepts](core-concepts/)** *(Next Step)* — Understand real-time API clearance, QR cryptographic stamps, and PEPPOL network routing.
2. **[Configuration](configuration/)** — Step-by-step setup guides for tax registrations, digital certificates, and classification mapping.
3. **[Use Cases](use-cases/)** — Real-world reference architectures for B2B commercial billing, consolidated retail POS, and foreign self-billing.
4. **[API Reference](api-reference/)** — Direct reference link to official developer e-invoice APIs.
5. **[Best Practices](best-practices/)** — Operational recommendations for rejection handling, digital certificate renewals, and audit archival.
6. **[Reports & Analytics](reports/)** — Scenario guide for choosing the best tax clearance and audit submission reports.
7. **[Related Applets](related-applets/)** — Complete guide to native applet dependencies across the BigLedger ecosystem.

---

{{< callout type="info" >}}
**Ready to explore tax compliance architecture?**  
Proceed to **[Core Concepts →](core-concepts/)** to understand e-invoice clearance lifecycles and cryptographic validation.
{{< /callout >}}
