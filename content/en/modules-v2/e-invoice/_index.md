---
title: "E-Invoice & PEPPOL Module"
description: "Government tax compliance and global e-invoicing engine managing real-time tax authority validation, QR clearances, and PEPPOL network B2B exchanges."
weight: 36
---

The **E-Invoice & PEPPOL Module** is BigLedger's tax compliance and global electronic invoicing engine. It automates real-time clearance validation with government tax authorities (e.g., LHDN in Malaysia), embeds QR code validation stamps into commercial billing, and exchanges structured e-invoices across the global PEPPOL network.

## Start here

If you are here to *do* something rather than to understand the architecture, go straight to the guide that matches the job:

{{< cards >}}
  {{< card link="/guides/einvoice-guides/malaysia-e-invoice-guide/" title="What Malaysia Requires" subtitle="The background — phased rollout, what LHDN puts on an e-invoice, and how validation works" >}}
  {{< card link="/guides/einvoice-guides/myinvois-setup/" title="MyInvois Setup" subtitle="Authorise BigLedger as your intermediary and get your master data ready" >}}
  {{< card link="/guides/einvoice-guides/einvoice-pools-and-routing/" title="Pools & Submission Routing" subtitle="Individual vs consolidated, the RM 10,000 rule, and the three pools" >}}
  {{< card link="/guides/einvoice-guides/einvoice-month-end/" title="The Month-End Cycle (1st–7th)" subtitle="Clear the pools, work the Invalid list, reconcile before the 7th" >}}
  {{< card link="/guides/einvoice-guides/einvoice-validation/" title="Validation Rules & Troubleshooting" subtitle="Why LHDN rejects a document, and which record to fix" >}}
  {{< card link="/guides/einvoice-guides/einvoice-cancel-and-correct/" title="Cancelling & Correcting an E-Invoice" subtitle="The 72-hour window, and the credit-note path once it closes" >}}
{{< /cards >}}

The pages below are the module's architecture reference: who does what, which applets are involved, and what has to be true before go-live.

---

## Architecture & Data Flow

E-Invoice operates directly on top of commercial sales billing and accounts payable. When a Sales Invoice or Credit Note is generated, BigLedger transforms commercial billing into validated JSON/XML payloads, signs them digitally, and submits them to tax authorities for instant clearance before customer delivery.

![ERP E-Invoice & PEPPOL Integration Architecture](/images/e-invoice/einvoice_architecture.png)

| Architecture Layer | System Component | Primary Role in Compliance Operations |
|-------------------|------------------|---------------------------------------|
| **Submission Engine** | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) | Posting queue, the three holding pools, monthly consolidation, cancellation requests and the monthly reconciliation report. |
| **Tax Authority API** | Government Tax Gateway (LHDN API) | Real-time validation checking, cryptographic hashing, and clearance UUID / QR code stamping. |
| **Global PEPPOL Exchange** | [MY PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) | PEPPOL Access Point routing for automated cross-border B2B document exchange. |
| **Commercial Billing** | Sales & Financial Accounting | Commercial invoice trigger, consolidated monthly billing, and audit compliance logging. |

{{< callout type="info" >}}
**There is no signing certificate for you to obtain, upload or renew.** BigLedger is configured as your **e-invoice intermediary**: you authorise it once on the MyInvois portal, and from then on BigLedger holds the credentials centrally and submits on behalf of your company's tax number. Any checklist that asks you to upload a certificate or paste a client ID and secret is out of date. See [MyInvois Setup](/guides/einvoice-guides/myinvois-setup/).
{{< /callout >}}

---

## Who Uses This Module

| Role | Primary Responsibilities | Core Applets Used |
|------|--------------------------|-------------------|
| **Tax Compliance Officer** | Work the e-invoice pools, map MSIC and item classification codes, run the monthly consolidation and reconcile before the 7th | [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) |
| **Accounts Receivable Clerk** | Issue validated e-invoices, manage rejected tax submissions, monitor buyer clearance status | [MY E-Invoice Portal Applet](/applets/e-invoice/my-e-invoice-portal-applet/) |
| **Global Trade Manager** | Configure PEPPOL Participant IDs, manage cross-border B2B electronic document exchanges | [MY PEPPOL Admin Applet](/applets/e-invoice/mypeppol-admin-applet/) |
| **B2B Customer / Supplier** | View validated tax invoices, verify clearance QR codes, submit self-billed e-invoices | [MY E-Invoice for Customer & Supplier Applet](/applets/e-invoice/my-einvoice-for-customer-and-supplier-applet/) |

---

## Four E-Invoice Document Types Every Team Must Differentiate

Confusing e-invoice submission types leads to tax audit penalties and clearance rejections:

| E-Invoice Document | When it is used | Tax Authority Requirement | Financial Accounting Impact |
|--------------------|-----------------|---------------------------|-----------------------------|
| **Standard B2B E-Invoice** | Commercial sales between registered business entities | Submitted individually; LHDN returns a clearance UUID | Revenue recognized, Accounts Receivable debited |
| **Consolidated E-Invoice** | High-volume B2C retail POS sales to end-consumers | Aggregated monthly submission within 7 days of month-end | POS Cash revenue posted, summary tax liability cleared |
| **Self-Billed E-Invoice** | Import of foreign services, e-commerce commissions, or agricultural payouts | Buyer issues tax invoice on behalf of supplier | Accounts Payable credited, Input Tax GL debited |
| **E-Credit / Debit Note** | Post-billing commercial adjustments, price corrections, or returns | Must reference original validated E-Invoice UUID | Revenue adjusted, AR / AP ledgers modified |

{{< callout type="warning" >}}
**Self-billed lines need a classification code that has nowhere obvious to come from.** An expense line has no item master behind it, so the LHDN item classification code has to be derived from your GL or expense mapping. Plan where that code will come from before your first self-billed submission, and expect to set it by hand until you have.
{{< /callout >}}

---

## Applet Map

| Applet | What it does in this module |
|--------|-----------------------------|
| [MY E-Invoice Admin Applet](/applets/e-invoice/my-e-invoice-admin-applet/) | Central compliance control hub — pools, submission and cancellation queues, consolidation, and the Discrepancies Report |
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
- [ ] BigLedger authorised as your e-invoice intermediary on the MyInvois portal, with the full permission set
- [ ] E-invoicing switched **on** for each company **before** any document is finalised
- [ ] Tax classification codes and MSIC industry codes mapped to item master data
- [ ] Consolidated monthly B2C retail workflow rules established for POS counters
- [ ] Finance and AR staff trained on resolving submission rejection codes

---

## Module Learning Roadmap

Follow the documentation in this sequence to master the E-Invoice & PEPPOL Module:

1. **[Core Concepts](core-concepts/)** *(Next Step)* — Understand real-time API clearance, QR cryptographic stamps, and PEPPOL network routing.
2. **[Configuration](configuration/)** — Step-by-step setup for tax registrations, intermediary authorisation and classification mapping.
3. **[Use Cases](use-cases/)** — Real-world reference architectures for B2B commercial billing, consolidated retail POS, and foreign self-billing.
4. **[API Reference](api-reference/)** — Direct reference link to official developer e-invoice APIs.
5. **[Best Practices](best-practices/)** — Operational recommendations for rejection handling, master-data hygiene and monthly reconciliation.
6. **[Reports & Analytics](reports/)** — Scenario guide for choosing the best tax clearance and audit submission reports.
7. **[Related Applets](related-applets/)** — Complete guide to native applet dependencies across the BigLedger ecosystem.

---

{{< callout type="info" >}}
**Ready to explore tax compliance architecture?**  
Proceed to **[Core Concepts →](core-concepts/)** to understand e-invoice clearance lifecycles and cryptographic validation.
{{< /callout >}}
