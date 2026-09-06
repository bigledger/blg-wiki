---
title: "Frequently Asked Questions"
description: "Common questions and answers about BigLedger ERP features and functionality"
weight: 10
---

Find answers to commonly asked questions about BigLedger ERP.

## E-Commerce & EcomSync

### How many marketplaces does the EcomSync system support?

Currently, EcomSync supports:
- **Lazada** - Full integration with inventory and order management
- **Shopee** - Complete marketplace synchronization
- **Shopify** - E-commerce website integration
- **WooCommerce** - WordPress e-commerce platform
- More marketplaces coming soon!

### How do I update promotions like 11.11 or 12.12?

In the Sales Order Applet:
1. Navigate to the item listing
2. Go to the marketplace tab
3. Set special promotional prices for specific periods
4. The system will automatically sync these prices to all connected marketplaces

### How do I maintain stock availability across marketplaces?

Stock availability is controlled centrally:
1. Go to the Marketplace Stock Availability tab
2. Set available quantities for each marketplace
3. Configure buffer stock levels
4. Enable automatic stock synchronization

### How is the order status updated in the applet?

Order statuses are synchronized in real-time:
- The system follows the marketplace status automatically
- Updates are reflected across all platforms instantly
- Status changes trigger appropriate workflows in BigLedger

### What happens if a seller cancels an order?

Order cancellations are handled seamlessly:
- Cancellations through any marketplace (Lazada, Shopee, etc.) reflect everywhere
- Cancellations through EcomSync platform update all connected channels
- Inventory is automatically adjusted
- Customer notifications are sent automatically

### Can I control how many orders I receive through EcomSync?

Yes, you can configure order processing limits:
- Set maximum orders per time period
- Configure processing queues
- Use schedulers to manage order intake
- Implement rate limiting for high-traffic periods

### Can the platform handle high-order traffic periods?

Absolutely! The system is designed for peak performance:
- Orders are processed in optimized queues
- Configurable order processing rates
- Automatic scaling during peak periods
- Built-in scheduler for load distribution

### Can product attributes be customized?

Yes, attributes are fully customizable:
- Create custom attributes per user requirements
- Map marketplace-specific attributes
- Bulk update capabilities
- Template-based attribute management

## General BigLedger Questions

### What industries does BigLedger support?

BigLedger supports various industries including:
- Retail & F&B
- Wholesale & Distribution
- Manufacturing
- Automotive & Workshop
- Professional Services
- Healthcare

### Does BigLedger support Malaysian tax and e-invoicing requirements?

Yes:
- SST (and the earlier GST) tax codes, tax handling and returns
- LHDN MyInvois e-invoice submission
- Peppol — BigLedger operates as an accredited Peppol Access Point on the Malaysian network
- Charts of accounts and financial statements in the shapes Malaysian accountants expect

Supporting a requirement is not the same as certifying you against it. Your own filings remain
your responsibility.

### What are the system requirements?

BigLedger is cloud-based and requires:
- Modern web browser (Chrome, Firefox, Safari, Edge)
- Stable internet connection
- No special hardware requirements
- Mobile apps available for iOS and Android

### How secure is my data?

BigLedger is a cloud service with:
- TLS encryption on all traffic between your browser and the platform
- Role-based access control, down to applet and document level
- Two-factor authentication

We do not publish a security certification here. If you need an ISO 27001 or SOC 2 statement, a
completed vendor security questionnaire, or a data-processing agreement under Malaysia's Personal
Data Protection Act 2010 (PDPA), ask your BigLedger contact.

### Can I integrate BigLedger with other systems?

Yes, BigLedger offers:
- REST API for custom integrations
- Pre-built connectors for popular services
- Webhook support for real-time events
- Data import/export capabilities

### What training is available?

We offer comprehensive training:
- Online video tutorials
- Live webinars
- On-site training for enterprises
- Certification programs
- User documentation and guides

### How is pricing structured?

BigLedger offers flexible pricing:
- Monthly or annual subscriptions
- User-based pricing tiers
- Module-based pricing options
- Volume discounts available
- Free trial period

### What support options are available?

Multiple support channels:
- Email support
- Phone support
- WhatsApp support
- Live chat
- Knowledge base
- Community forum

## Technical Questions

### Can I access BigLedger offline?

BigLedger requires internet connectivity for:
- Real-time synchronization
- Multi-user collaboration
- Cloud backup
However, limited offline functionality is available in mobile apps.

### How often is data backed up?

- Automatic daily backups
- Point-in-time recovery available
- Geo-redundant backup storage
- User-initiated backup downloads

### Can I export my data?

Yes, you can export data in multiple formats:
- Excel (XLSX)
- CSV
- PDF reports
- API access for bulk exports

### Is there an API available?

Yes, BigLedger provides:
- RESTful API
- Comprehensive documentation
- SDKs for popular languages
- Webhook notifications

## Getting Started

### How do I sign up for BigLedger?

1. Visit [bigledger.com](https://bigledger.com)
2. Click "Start Free Trial"
3. Complete the registration form
4. Verify your email
5. Begin your 30-day free trial

### How long does implementation take?

Implementation timeline varies:
- **Small businesses**: 1-2 weeks
- **Medium businesses**: 2-4 weeks
- **Enterprises**: 4-8 weeks
- Professional services available for faster deployment

### Can I migrate data from my current system?

Yes, we support data migration from:
- Popular accounting software
- Excel spreadsheets
- CSV files
- Custom migration services available

## Need More Help?

Can't find what you're looking for? 

{{< cards >}}
  {{< card link="/support/contact/" title="Contact Support" subtitle="Get personalized help from our team" >}}
  {{< card link="https://support.bigledger.com" title="Knowledge Base" subtitle="Search our comprehensive help articles" >}}
  {{< card link="/user-guide/" title="User Guide" subtitle="Detailed documentation and tutorials" >}}
{{< /cards >}}