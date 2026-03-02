---
description: BigLedger's modular applet architecture enables businesses to build customized
  solutions by combining specialized applets that work seamlessly together through
  our central data hub.
tags:
- user-guide
title: Applets & Workflows
weight: 9
---

BigLedger's modular applet architecture enables businesses to build customized solutions by combining specialized applets that work seamlessly together through our central data hub.

## Understanding Applets

### What are Applets?

Applets are self-contained business modules that:
- Focus on specific business functions
- Share data through the central hub
- Can operate independently or integrated
- Scale based on business needs
- Update without affecting other applets

## Complete Applet Listing by Category

Based on BigLedger's comprehensive applet architecture, our platform offers specialized applets organized into eight core categories:

### 🏢 Master Data Applets

Essential foundational applets for system configuration:

- **Organization** - Company structure and hierarchy management
- **Chart Of Account** - Financial account structure setup
- **Cashbook** - Cash management and tracking
- **Employee** - Employee database and management
- **Doc Item** - Document and item master data
- **Customer** - Customer master data management
- **Supplier** - Vendor/supplier database
- **Pricebook** - Pricing rules and catalogs
- **Entity Maintenance** - Entity relationship management
- **Permission Wizard** - User access and permission control
- **Voucher** - Voucher type configuration

### 🛒 Purchase Workflow Applets

Complete procurement and purchasing management:

- **Internal Blanket Purchase Order** - Long-term purchase agreements
- **Internal Purchase Requisition** - Purchase request management
- **Internal Purchase Order** - PO creation and tracking
- **Internal Purchase GRN** - Goods Receipt Note processing
- **Internal Purchase Invoice** - Supplier invoice management
- **Internal Purchase Return** - Return to vendor processing
- **Internal Purchase Debit Note** - Purchase adjustments
- **Internal Purchase Credit Note** - Vendor credits
- **Internal Purchase Quotation** - RFQ and quotation management
- **Purchase Report** - Comprehensive purchasing analytics
- **Internal Purchase GIN** - Goods Issue Note
- **Internal Purchase Refund Note** - Refund processing

### 📦 Inventory Workflow Applets

Advanced inventory and stock management:

- **Internal Stock Requisition** - Stock request management
- **Stock Transfer** - Inter-location transfers
- **Internal Stock Adjustment** - Inventory adjustments
- **Stock Availability** - Real-time stock visibility
- **Stock Replenishment Applet** - Automatic reordering
- **Stock Allocation** - Reserve and allocate inventory
- **Stock Report** - Inventory analytics and reporting

### 💼 Sales Workflow Applets

End-to-end sales and distribution management:

- **POS General** - Point of Sale operations
- **Internal Sales Quotation** - Quote generation
- **Internal Sales Order** - Order processing
- **Internal Sales Invoice** - Customer invoicing
- **Internal Delivery Order** - Shipping and delivery
- **Internal Sales Debit Note** - Sales adjustments
- **Internal Sales Credit Note** - Customer credits
- **Internal Sales Proforma Invoice** - Pro forma documentation
- **Delivery and Installation Driver** - Service scheduling
- **Sales Report** - Sales analytics
- **Internal Sales Refund Note** - Customer refunds
- **Internal Sales Return** - Return processing

### 💰 Finance Applets

Comprehensive financial management:

- **Internal Receipt Voucher** - Payment receipts
- **Internal Payment Voucher** - Payment processing
- **Debtor Report Applet** - Accounts receivable analytics
- **Creditor Report Applet** - Accounts payable analytics
- **Ledger and Journal** - GL entries and journals
- **Financial Report Applet** - Financial statements
- **Bank Reconciliation** - Automated bank matching

### 📄 E-Invoice Applets

PEPPOL-compliant e-invoicing solutions:

- **My E-Invoice Admin** - E-invoice configuration and management
- **Customer Portal** - Self-service invoice access

### 🏛️ Tax Applets

Malaysian tax compliance:

- **Tax Configuration** - Tax setup and rules
- **Tax Config** - Advanced tax configuration and compliance
- **[SST Applet](/applets/sst-applet/)** - Malaysian SST reporting
- **MY-SST Applet** - Sales and Service Tax management

### 💱 Forex Applets

Foreign exchange management:

- **Forex Applet** - Multi-currency operations and exchange rate management

## 📊 Financial Management Applets

### General Ledger Applet
**Workflow Integration:** Financial Recording → Reporting → Analysis

**Key Workflows:**
- Journal entry processing
- Period-end closing
- Financial consolidation
- Inter-company transactions
- Currency revaluation

**Connected Applets:**
- Accounts Payable
- Accounts Receivable
- Fixed Assets
- Bank Reconciliation

### Accounts Payable Applet
**Workflow Integration:** Purchase → Invoice → Payment → Reconciliation

**Key Workflows:**
- Vendor invoice processing
- Payment run execution
- Expense claim management
- Aging analysis
- Cash flow planning

**Connected Applets:**
- Procurement
- E-Invoice
- Bank Integration
- General Ledger

### Accounts Receivable Applet
**Workflow Integration:** Sales → Invoice → Collection → Reconciliation

**Key Workflows:**
- Customer invoice generation
- Payment collection
- Credit management
- Dunning process
- Customer statements

**Connected Applets:**
- Sales Order
- E-Invoice
- CRM
- General Ledger

### Bank Reconciliation Applet
**Workflow Integration:** Transaction Import → Matching → Adjustment → Posting

**Key Features:**
- AI-powered auto-matching (95% accuracy)
- Bank feed integration
- Exception handling
- Reconciliation reports

## 🛍️ Sales & Commerce Applets

### Point of Sale (POS) Applet
**Workflow Integration:** Product Selection → Checkout → Payment → E-Invoice

**Key Workflows:**
- Sales transaction processing
- Payment handling
- Customer management
- Shift management
- Daily closing

**Connected Applets:**
- Inventory
- E-Invoice
- Customer Loyalty
- Accounting

### E-Commerce Applet
**Workflow Integration:** Browse → Cart → Checkout → Fulfillment

**Key Workflows:**
- Product catalog management
- Shopping cart processing
- Order management
- Payment gateway integration
- Shipping coordination

**Connected Applets:**
- Inventory
- CRM
- Warehouse
- E-Invoice

### Sales Order Management Applet
**Workflow Integration:** Quote → Order → Fulfillment → Invoice

**Key Workflows:**
- Quotation generation
- Order processing
- Availability checking
- Delivery scheduling
- Commission calculation

**Connected Applets:**
- CRM
- Inventory
- Warehouse
- Accounts Receivable

## 📦 Supply Chain Applets

### Inventory Management Applet
**Workflow Integration:** Receipt → Storage → Movement → Issue

**Key Workflows:**
- Stock receiving
- Transfer management
- Cycle counting
- Stock adjustment
- Reorder processing

**Connected Applets:**
- Purchase Order
- Sales Order
- Warehouse
- Manufacturing

### Warehouse Management Applet
**Workflow Integration:** Receive → Putaway → Pick → Pack → Ship

**Key Workflows:**
- Inbound processing
- Location management
- Order picking
- Packing optimization
- Shipping coordination

**Connected Applets:**
- Inventory
- Sales Order
- Purchase Order
- Transportation

### Procurement Applet
**Workflow Integration:** Requisition → RFQ → PO → Receipt → Payment

**Key Workflows:**
- Purchase requisition
- Vendor selection
- Purchase order creation
- Goods receipt
- Three-way matching

**Connected Applets:**
- Inventory
- Accounts Payable
- Vendor Management
- Budget Control

### Manufacturing Applet
**Workflow Integration:** Planning → Production → Quality → Completion

**Key Workflows:**
- Production planning
- Work order management
- Material consumption
- Quality control
- Cost calculation

**Connected Applets:**
- Inventory
- BOM Management
- Quality Control
- Cost Accounting

## 📞 Customer Management Applets

### CRM Applet
**Workflow Integration:** Lead → Opportunity → Customer → Retention

**Key Workflows:**
- Lead capture & qualification
- Opportunity management
- Contact management
- Activity tracking
- Pipeline analysis

**Connected Applets:**
- Sales Order
- Marketing
- Customer Service
- E-Commerce

### Unified Contact Center (UCC) Applet
**Workflow Integration:** Contact → Route → Resolve → Follow-up

**Key Features:**
- Omnichannel support
- AI sentiment analysis
- Ticket management
- Knowledge base
- SLA tracking

**Connected Applets:**
- CRM
- Customer Portal
- AI Intelligence
- Workflow Engine

### Customer Portal Applet
**Workflow Integration:** Login → Self-Service → Transaction → Support

**Key Features:**
- Account management
- Order tracking
- Payment portal
- Support tickets
- Document access

## 📄 Compliance & Regulatory Applets

### E-Invoice & PEPPOL Applet
**Workflow Integration:** Generate → Validate → Submit → Archive

**Key Features:**
- MyInvois integration
- LHDN submission
- PEPPOL compliance
- Tax calculation
- Archive management

**Connected Applets:**
- Sales Order
- POS
- Accounts Receivable
- Tax Management

### Tax Management Applet
**Workflow Integration:** Calculate → Report → File → Pay

**Key Features:**
- SST/GST calculation
- Tax reporting
- Return filing
- Audit support

**Connected Applets:**
- E-Invoice
- Accounting
- Procurement
- Payroll

## 🤖 Intelligence & Analytics Applets

### Business Intelligence Applet
**Workflow Integration:** Extract → Transform → Analyze → Visualize

**Key Features:**
- Real-time dashboards
- Custom reports
- KPI monitoring
- Predictive analytics
- Data mining

**Connected Applets:**
- All operational applets
- Data Hub
- AI Services

### AI Services Applet
**Workflow Integration:** Capture → Process → Learn → Predict

**Key Features:**
- OCR processing
- NLP analysis
- Predictive models
- Anomaly detection
- Process automation

**Integration Points:**
- Document Management
- Customer Service
- Financial Analysis
- Quality Control

## Workflow Orchestration

### Cross-Applet Workflows

#### Order-to-Cash (O2C)
```
CRM → Quote → Sales Order → Inventory Check → Delivery → E-Invoice → Payment → Bank Reconciliation → GL Posting
```

**Applets Involved:**
- CRM
- Sales Order Management
- Inventory
- Warehouse
- E-Invoice
- Accounts Receivable
- Bank Reconciliation
- General Ledger

#### Procure-to-Pay (P2P)
```
Requisition → RFQ → PO → Goods Receipt → Invoice Matching → Payment → Bank Reconciliation → GL Posting
```

**Applets Involved:**
- Procurement
- Vendor Management
- Inventory
- Accounts Payable
- E-Invoice
- Bank Integration
- General Ledger

#### Record-to-Report (R2R)
```
Transaction Entry → Validation → Posting → Reconciliation → Adjustments → Closing → Reporting → Analysis
```

**Applets Involved:**
- General Ledger
- Sub-ledgers
- Bank Reconciliation
- Fixed Assets
- Financial Reporting
- Business Intelligence

## Implementation Patterns

### Common Business Challenges & Solutions

#### Challenge: Manual Data Entry
**Solution Pattern:**
- Deploy OCR Applet for document capture
- Implement E-Invoice for automated invoicing
- Use Bank Integration for transaction import
- Enable API connections for data flow

#### Challenge: Inventory Inaccuracy
**Solution Pattern:**
- Implement Inventory Management Applet
- Deploy Warehouse Management System
- Use Barcode/RFID scanning
- Enable real-time synchronization

#### Challenge: Cash Flow Visibility
**Solution Pattern:**
- Deploy Accounts Receivable with aging
- Implement collection workflows
- Use predictive cash flow analytics
- Enable payment gateway integration

#### Challenge: Regulatory Compliance
**Solution Pattern:**
- Implement E-Invoice & PEPPOL
- Deploy Tax Management
- Use audit trail applets
- Enable compliance reporting

### Industry-Specific Implementations

#### Retail Implementation
**Core Applets:**
1. POS System
2. Inventory Management
3. E-Commerce
4. Customer Loyalty
5. E-Invoice

**Workflow Focus:**
- Multi-channel sales
- Real-time inventory
- Customer experience
- Compliance automation

#### Manufacturing Implementation
**Core Applets:**
1. Manufacturing Execution
2. BOM Management
3. Quality Control
4. Warehouse Management
5. Procurement

**Workflow Focus:**
- Production planning
- Material management
- Quality assurance
- Cost control

#### Distribution Implementation
**Core Applets:**
1. Sales Order Management
2. Warehouse Management
3. Transportation
4. Inventory Control
5. Customer Portal

**Workflow Focus:**
- Order fulfillment
- Logistics optimization
- Multi-location inventory
- Customer service

## Best Practices

### Applet Selection Strategy

1. **Start with Core**
   - Accounting & E-Invoice (compliance)
   - Central data hub setup
   - User management

2. **Add Operational**
   - Industry-specific applets
   - Customer-facing systems
   - Supply chain modules

3. **Enhance with Intelligence**
   - Analytics and reporting
   - AI services
   - Automation tools

### Integration Best Practices

**Data Consistency**
- Use central data hub
- Implement master data management
- Maintain single source of truth
- Regular data validation

**Performance Optimization**
- Asynchronous processing
- Batch operations
- Caching strategies
- Load balancing

**Security Considerations**
- Role-based access
- API authentication
- Data encryption
- Audit logging

## Applet Marketplace

### Available Applets

Browse our growing library of business applets:

**Featured Applets:**
- MyInvois Connector (Free)
- WhatsApp Integration
- Shopee/Lazada Connector
- Google Analytics Integration
- SMS Gateway

**Industry Packs:**
- Retail Suite
- Manufacturing Suite
- F&B Package
- Healthcare Bundle
- Education Kit

### Custom Applet Development

**Development Options:**
- Low-code builder
- API framework
- Professional services
- Partner ecosystem

**Development Process:**
1. Requirements analysis
2. Design & architecture
3. Development & testing
4. Integration & deployment
5. Maintenance & support

## Get Started with Applets

### Discovery Process

1. **Business Assessment**
   - Current processes
   - Pain points
   - Integration needs
   - Compliance requirements

2. **Applet Mapping**
   - Core requirements
   - Workflow design
   - Integration points
   - Phasing plan

3. **Implementation Roadmap**
   - Priority applets
   - Timeline
   - Resource allocation
   - Success metrics

### Request Consultation

Our applet specialists can help you:
- Select the right applets
- Design optimal workflows
- Plan implementation
- Calculate ROI

[Schedule Consultation](/demos-resources/) | [Browse Applets](/applets/applet-store/) | [Download Guide](/applets/)

---

*BigLedger - Modular Business Solutions Through Intelligent Applets*