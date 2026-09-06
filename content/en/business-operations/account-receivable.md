---
description: Account Receivable 3153822231 2021-06-05T09:04:43.
tags:
- business
- operations
title: Account Receivable
weight: 10
---

## Comprehensive AR Automation Platform

BigLedger's Account Receivable module revolutionizes cash flow management through intelligent automation, predictive analytics, and seamless integration with Malaysia's banking ecosystem. Our unified entity architecture (`bl_fi_mst_entity_hdr`) provides a 360-degree view of customer relationships, credit history, and payment patterns.

## Core Capabilities

### Customer Credit Management

#### Credit Limit Configuration
- **Dynamic Credit Scoring**: AI-powered credit assessment based on payment history
- **Multi-Tier Credit Limits**: Different limits for different transaction types
- **Credit Insurance Integration**: Automated CTOS and CCRIS checking
- **Parent-Child Credit Pooling**: Group companies share credit facilities
- **Real-Time Credit Monitoring**: Instant alerts when approaching limits

#### Credit Application Workflow
1. **Application Submission**: Online form with document upload
2. **Automated Verification**: IC/SSM validation, bank reference checks
3. **Risk Assessment**: AI scoring with manual override option
4. **Sign-off**: whoever your policy names for the credit limit being granted — credit applications have no approval engine in BigLedger, so control this with permissions
5. **Terms Assignment**: Payment terms, credit limit, security requirements

### Invoice Management

#### Invoice Generation
- **Multi-Format Support**: Tax invoice, proforma, debit/credit notes
- **Batch Processing**: Generate thousands of invoices simultaneously
- **Template Designer**: Custom invoice layouts per customer
- **Multi-Language**: Malay, English, Chinese, Tamil templates
- **E-Invoice Ready**: LHDN MyInvois and PEPPOL compliant

#### Invoice Delivery
- **Omni-Channel Delivery**
  - Email with PDF attachment
  - WhatsApp Business API
  - Customer portal access
  - Printed via postal service
  - API push to customer systems

#### Invoice Tracking
- **Delivery Confirmation**: Read receipts and acknowledgments
- **View Analytics**: Track when customers open invoices
- **Payment Promise Tracking**: Record and follow up on commitments
- **Dispute Management**: Flag and resolve invoice disputes

### Payment Collection

#### Payment Methods
- **Bank Transfers**: FPX, IBG, GIRO integration
- **Credit/Debit Cards**: Visa, Mastercard, AMEX
- **E-Wallets**: GrabPay, Touch 'n Go, Boost
- **Cheque Management**: PDC tracking and presentation
- **Cash Collection**: Mobile POS for field collections
- **Cryptocurrency**: Bitcoin, Ethereum (selected merchants)

#### Automated Collection
- **Direct Debit Setup**: Automated monthly collections
- **Standing Instructions**: Recurring payment scheduling
- **Payment Plans**: Installment arrangements with interest
- **Auto-Reconciliation**: Match payments to invoices using AI

### Aging Analysis

#### Real-Time Aging Reports
- **Bucket Analysis**: 0-30, 31-60, 61-90, 90+ days
- **Customer Segmentation**: By industry, region, sales rep
- **Trend Analysis**: Historical aging patterns
- **Predictive Aging**: AI forecast of future aging
- **Exception Reporting**: Highlight unusual patterns

#### Collection Priority Matrix
- **Risk-Based Prioritization**: Focus on high-risk accounts
- **Value-Based Approach**: Prioritize large outstanding amounts
- **Relationship Scoring**: Consider customer lifetime value
- **Collection Capacity**: Optimize collector workload

### Collection Management

#### Automated Reminders
- **Reminder Sequences**
  - 7 days before due: Friendly reminder
  - Due date: Payment due notification
  - 3 days overdue: First reminder
  - 7 days overdue: Second reminder with late charges
  - 14 days overdue: Final notice
  - 30 days overdue: Legal action warning

- **Communication Channels**
  - Email templates with personalization
  - SMS with payment links
  - WhatsApp messages with invoice attachments
  - Automated voice calls
  - Physical letters via postal service

#### Collection Team Tools
- **Collector Dashboard**: Prioritized action list
- **Call Scripts**: Dynamic scripts based on customer profile
- **Payment Negotiation**: Settlement terms agreed offline and recorded on the document
- **Promise to Pay**: Track and follow up on commitments
- **Skip Tracing**: Updated contact information sourcing

### Statement of Account

#### Statement Generation
- **Automated Scheduling**: Monthly, quarterly, on-demand
- **Multiple Formats**: Summary, detailed, with aging
- **Multi-Company**: Consolidated statements for groups
- **Interactive Statements**: Click to pay functionality
- **Audit Trail**: Track statement delivery and views

### Finance Charges & Penalties

#### Late Payment Charges
- **Flexible Configuration**
  - Fixed amount per invoice
  - Percentage of outstanding
  - Tiered rates based on days overdue
  - Compound interest calculation

- **Waiver Management**
  - Waiver authority limited by permission (there is no charge-waiver approval workflow)
  - Waiver reason tracking
  - Impact analysis on profitability

### Legal & Recovery

#### Legal Action Workflow
1. **Letter of Demand**: Automated generation and tracking
2. **Legal Firm Integration**: Case handover to panel lawyers
3. **Court Filing**: Document preparation assistance
4. **Judgment Tracking**: Monitor legal proceedings
5. **Asset Recovery**: Coordination with bailiffs/auctioneers

#### Debt Recovery Agencies
- **Agency Portal**: Secure access for collection agencies
- **Performance Tracking**: Recovery rates by agency
- **Commission Management**: Automated calculation and payment
- **Compliance Monitoring**: Ensure ethical collection practices

### Cash Application

#### Intelligent Matching
- **Auto-Match Algorithms**
  - Invoice number reference
  - Amount matching with tolerance
  - Customer name fuzzy matching
  - Payment pattern recognition
  - Machine learning improvement

- **Exception Handling**
  - Overpayment processing
  - Underpayment allocation
  - Unidentified receipts queue
  - Partial payment distribution

### Reporting & Analytics

#### Standard Reports
- **Operational Reports**
  - Daily collection report
  - Outstanding by customer
  - Aging summary and detail
  - Collection effectiveness
  - DSO trending

- **Management Reports**
  - Bad debt provision calculation
  - Cash flow forecasting
  - Customer risk assessment
  - Collector performance
  - Credit limit utilization

#### Advanced Analytics
- **Predictive Analytics**
  - Payment probability scoring
  - Default risk prediction
  - Optimal collection timing
  - Cash flow forecasting

- **Prescriptive Analytics**
  - Collection strategy optimization
  - Credit limit recommendations
  - Payment term suggestions
  - Write-off predictions

### Integration Points

#### Banking Integration
- **Malaysian Banks**: Maybank, CIMB, Public Bank, RHB
- **Payment Gateways**: iPay88, MOLPay, Billplz
- **Bank Statement Import**: Auto-reconciliation
- **Virtual Account Numbers**: Unique account per customer

#### Accounting Integration
- **General Ledger**: Automatic posting of AR transactions
- **Tax Module**: GST/SST calculation and reporting
- **Fixed Assets**: Finance lease AR tracking
- **Cost Centers**: Department-wise AR allocation

### Customer Portal

#### Self-Service Features
- **Account Access**: View statements and invoices
- **Online Payment**: Multiple payment options
- **Dispute Submission**: Raise and track disputes
- **Payment History**: Complete transaction history
- **Document Download**: Statements, receipts, invoices

### Mobile Application

#### AR Mobile for Collections
- **Field Collection**: Accept payments on-site
- **Customer Visit Log**: GPS-tracked visit records
- **Document Capture**: Scan and upload documents
- **Offline Mode**: Sync when connected
- **Digital Signatures**: Acknowledgment receipts

## Unique BigLedger Features

### Unified Entity Architecture
Leveraging our `bl_fi_mst_entity_hdr` table:
- Single view of customer as buyer and supplier
- Automatic contra/offset capabilities
- Relationship mapping for group companies
- Credit exposure across all entities

### Malaysian Compliance
- **LHDN Integration**: E-Invoice submission via MyInvois
- **SSM Validation**: Automatic company verification
- **Bank Negara Reporting**: RENTAS integration
- **PEPPOL Network**: Cross-border invoicing

## Implementation Best Practices

### Configuration Steps
1. **Customer Setup**: Import customer master data
2. **Credit Policy**: Define credit limits and terms
3. **Aging Buckets**: Configure aging periods
4. **Reminder Templates**: Customize communication templates
5. **Authority**: decide who may grant which credit limits, and give the permissions accordingly
6. **Integration**: Connect banking and payment gateways
7. **Training**: Train credit control team
8. **Go-Live**: Phased rollout by customer segment

### Success Metrics
- **DSO Reduction**: Typically 20-30% improvement
- **Collection Efficiency**: 15-25% increase
- **Bad Debt Reduction**: 30-40% decrease
- **Cash Flow Improvement**: 25-35% acceleration
- **Customer Satisfaction**: Maintained or improved despite collection efforts