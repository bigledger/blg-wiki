---
title: "UTM Integrated Financial System Evaluation Guide"
description: "Test script and user guide for evaluating BigLedger's SAGA-compliant Integrated Financial System for Universiti Teknologi Malaysia"
weight: 25
bookCollapseSection: false
---

Welcome to the BigLedger Integrated Financial System Evaluation Guide for **Universiti Teknologi Malaysia (UTM)**. This guide serves as a comprehensive "test script" to help evaluators explore and understand the capabilities of our SAGA-compliant financial system.

## Getting Started

### Demo Environment Access

To begin your evaluation, please request login credentials from:

**Contact:** fatimah@bigledger.com

**Available Demo Accounts:**
| Username | Role | Access Level |
|----------|------|--------------|
| demo+utm.finance@bigledger.com | Finance Officer | Full financial operations |
| demo+utm.manager@bigledger.com | Finance Manager | Approval workflows and reporting |

**Demo URL:** [https://demo-v1.bigledger.com](https://demo-v1.bigledger.com)

### Understanding the Platform Architecture

BigLedger is a **cloud-native, multi-tenant platform** built with modern enterprise technologies:

- **Backend:** Java-based microservices architecture
- **Frontend:** Angular (responsive, modern UI/UX)
- **Database:** PostgreSQL (enterprise-grade, ACID-compliant)
- **Infrastructure:** AWS Cloud (serverless, auto-scaling, high availability)

**Multi-Tenant Capability:**
- Single platform supports multiple organizations (tenants)
- Each tenant has isolated, secure database
- Multiple companies (Sdn Bhd) can operate under one tenant
- Complete data segregation with enterprise-grade security

This architecture provides significant advantages over traditional on-premise ERP systems:
- **Zero infrastructure maintenance** for UTM
- **Automatic updates and security patches**
- **99.9% uptime guarantee** with built-in disaster recovery
- **Scalable performance** handling millions of transactions
- **Accessibility** from any device, anywhere

---

## System Modules Overview

Based on UTM's requirements for a SAGA-compliant Integrated Financial System, this evaluation guide covers the following modules:

{{< cards >}}
  {{< card link="general-ledger" title="General Ledger & Chart of Accounts" subtitle="Core accounting structure, GL hierarchy, and financial statement mapping" >}}
  {{< card link="budget-management" title="Budget & Vote Book Management" subtitle="Budget allocation, monitoring, virement, and real-time utilization tracking" >}}
  {{< card link="accounts-payable" title="Accounts Payable (Payment Module)" subtitle="Vendor management, invoice processing, and payment workflows" >}}
  {{< card link="accounts-receivable" title="Accounts Receivable (Receipt Module)" subtitle="Debtor management, billing, collections, and receipt processing" >}}
  {{< card link="journal-module" title="Journal Module" subtitle="Auto and manual journal entries, sub-ledger management" >}}
  {{< card link="cash-management" title="Cash Management & Banking" subtitle="Cashbook, bank reconciliation, and internet banking integration" >}}
  {{< card link="asset-management" title="Asset Management" subtitle="Asset registration, tracking, depreciation, and disposal" >}}
  {{< card link="financial-reporting" title="Financial Reporting" subtitle="Full set of accounts, SAGA compliance reports, and dashboards" >}}
  {{< card link="user-access-control" title="User Access Control" subtitle="Security profiles, audit trails, and role-based permissions" >}}
  {{< card link="tax-management" title="Tax Rate Management" subtitle="Tax configuration and government directive compliance" >}}
{{< /cards >}}

---

## SAGA Compliance Assurance

Our system is designed to fully comply with the **Standard Accounting System for Government Agencies (SAGA)** requirements, including:

### Accounting Standards Compliance
- **MPSAS** (Malaysian Public Sector Accounting Standards)
- **GAAP** (Generally Accepted Accounting Principles)
- **Accrual-Based Accounting** as mandated by government policies
- **JANM Requirements** (Jabatan Akauntan Negara Malaysia)

### Key SAGA Features
- Flexible Chart of Accounts structure supporting UTM's existing codes
- Complete audit trail for all transactions
- Multi-level approval workflows
- Real-time budget control and monitoring
- Full set of financial statements (Balance Sheet, Income Statement, Cash Flow, Changes in Equity)
- Government circular compliance (including Surat Pekeliling Akauntan Negara)

### Regulatory Compliance
- **E-Invoice Integration** with LHDN MyInvois Portal
- **SST/GST** compliance and reporting
- **Bank Negara** reporting capabilities
- **PEPPOL** network ready for cross-border transactions

---

## System Highlights & Competitive Advantages

### Technology Excellence

| Feature | BigLedger Advantage |
|---------|-------------------|
| **Cloud-Native** | No server maintenance, automatic scaling |
| **Real-Time Processing** | Instant transaction posting and balance updates |
| **Mobile Responsive** | Access from any device (PC, tablet, phone) |
| **Multi-Currency** | 150+ currencies with real-time exchange rates |
| **API Integration** | Ready to integrate with UTM HR, RADIS, MyAIMS |
| **Single Sign-On** | Integration with MyUTM portal supported |

### Operational Excellence

| Capability | Specification |
|------------|---------------|
| Account Capacity | Up to 100,000 GL accounts |
| Transaction Volume | Millions of transactions per year |
| Concurrent Users | 500+ simultaneous users |
| Report Generation | < 5 seconds for standard reports |
| Data Retention | 7+ years with full audit trail |
| Backup & Recovery | Automated daily backups with instant recovery |

### Security & Compliance

- **Encryption:** AES-256 for data at rest, TLS 1.3 for data in transit
- **Access Control:** Role-based permissions with maker-checker workflows
- **Audit Trail:** Complete logging of all user activities
- **Session Management:** Configurable auto-logout for inactive users
- **Security Auditing:** Regular vulnerability assessments and penetration testing

---

## Evaluation Approach

This test script is organized to help you systematically evaluate each module:

1. **Navigate** to the specific module section using the cards above
2. **Follow** the step-by-step instructions provided
3. **Test** the scenarios described with sample data
4. **Observe** the system behavior and outputs
5. **Verify** the results match your requirements

Each module section includes:
- Overview of capabilities
- Step-by-step test scenarios
- Expected outcomes
- Tips for advanced features

---

## Quick Navigation by UTM Tender Requirements

### Lampiran IV Requirements Mapping

| Tender Section | System Module | Guide Link |
|----------------|---------------|------------|
| 9.15 User Access Control | Security & ACL | [User Access Control](user-access-control) |
| 9.16 Debtor & Creditor Registration | AR/AP Masters | [Accounts Receivable](accounts-receivable), [Accounts Payable](accounts-payable) |
| 9.17 Tax Rate Management | Tax Configuration | [Tax Management](tax-management) |
| 9.18 Chart of Accounts | GL & COA | [General Ledger](general-ledger) |
| 9.19 Year Opening/Closing | Period Management | [General Ledger](general-ledger) |
| 9.20 Financial Reports | Reporting Module | [Financial Reporting](financial-reporting) |
| 9.21 Auto Journal | Journal Module | [Journal Module](journal-module) |
| 9.22 Manual Journal | Journal Module | [Journal Module](journal-module) |
| 9.23-9.25 Vote Book | Budget Module | [Budget Management](budget-management) |
| 9.26-9.55 Budget Operations | Budget Module | [Budget Management](budget-management) |
| 9.56 Internet Banking | Cash Management | [Cash Management](cash-management) |
| 9.57-9.65 Asset Module | Asset Management | [Asset Management](asset-management) |

---

## Support & Contact

For technical questions during your evaluation:

- **Email:** support@bigledger.com
- **Demo Coordinator:** fatimah@bigledger.com

For business inquiries:
- **Sales:** sales@bigledger.com
- **Reference:** UTM Tender B.30/2024

---

## Continue Your Evaluation

Select a module from the cards above to begin your detailed system evaluation. We recommend starting with the **General Ledger & Chart of Accounts** module as it forms the foundation for all other financial operations.

{{< cards >}}
  {{< card link="general-ledger" title="Start Here: General Ledger" subtitle="Begin with the core accounting foundation" >}}
{{< /cards >}}
