---
description: Comprehensive guide to maintaining your product catalog in BigLedger, including editing, organizing, and managing item details across all business operations.
tags:
- user-guide
- tutorial
- item-management
- catalog-management
title: Item Maintenance & Catalog Management
weight: 30
---

Master the complete lifecycle of item management in BigLedger, from initial creation to ongoing maintenance, ensuring your product catalog remains accurate, organized, and optimized for all business operations.

## Overview

Item maintenance is crucial for effective business operations. This comprehensive guide covers all aspects of managing your product and service catalog, including detailed configurations, categorization, pricing, and integration with various business modules.

{{< callout type="info" >}}
**Scope**: This guide covers post-creation item management. If you need to create new items, start with our [Creating Items Guide](/user-guide/basic-operations/creating-an-item/).
{{< /callout >}}

---

## Item Management Interface

### Accessing Item Maintenance

1. Navigate to **Item Management** from your main menu
2. Browse your item listings using the enhanced AG-Grid interface
3. Use search and filtering options to locate specific items
4. Click on any item to enter the comprehensive editing interface

### Item Listings Overview

The item listings page provides:
- **Advanced Search**: Quick search with fuzzy matching
- **Filter Options**: Filter by category, type, status, and more
- **Bulk Operations**: Multi-select for batch updates
- **Export Capabilities**: Generate reports and data exports
- **Visual Indicators**: Stock status, sync status, and activity indicators

---

## Comprehensive Item Editing

When you select an item for editing, you'll access multiple specialized tabs for different aspects of item management:

### Main Details Tab

**Core Information Management**
- **Item Code**: View system-generated code (read-only)
- **Item Name**: Update product/service names
- **Description**: Detailed product descriptions and specifications
- **Type Configuration**: Modify item type (Product, Service, Bundle, Digital)
- **Status Management**: Active, Inactive, Discontinued options
- **Unit of Measure**: View base UOM (established during creation)

**Business Classifications**
- **Tax Configuration**: Assign appropriate tax codes and rates
- **GL Account Mapping**: Link to accounting chart of accounts
- **Vendor Information**: Primary and secondary supplier details
- **Internal Notes**: Private administrative notes and handling instructions

### Item Categories Tab

**Organizational Structure**
- **Category Assignment**: Place items in logical groupings
- **Sub-category Management**: Detailed classification for better organization  
- **Tag System**: Flexible tagging for cross-functional organization
- **Search Optimization**: Keywords for improved findability

**Category Benefits**
- Streamlined navigation and browsing
- Automated reporting and analytics grouping
- E-commerce website organization
- Pricing scheme application by category

### Dimension Details Tab

**Physical Specifications**
- **Weight**: Item weight for shipping calculations
- **Dimensions**: Length, width, height for packaging and storage
- **Volume**: Cubic measurements for space planning
- **Special Handling**: Fragile, hazardous, temperature-sensitive flags

**Operational Configuration**
- **Storage Requirements**: Temperature, humidity, special conditions
- **Shelf Life**: Expiration tracking for perishable items
- **Batch Tracking**: Enable lot number and expiration date tracking
- **Serial Number**: Individual item tracking requirements

### Manage Image Tab

**Visual Asset Management**
- **Primary Image**: Main product photo for listings and documents
- **Additional Images**: Multiple angles, details, packaging shots
- **Image Optimization**: Automatic resizing for different platforms
- **Alt Text**: Accessibility and SEO descriptions

**E-Commerce Integration**
- **Marketplace Sync**: Automatic image distribution to sales channels
- **Image Standards**: Size and quality requirements for different platforms
- **Version Control**: Track image updates and changes

### Marketplace Tab

**Multi-Channel Configuration**
- **Platform Settings**: Configure for Shopify, Lazada, Shopee, etc.
- **Channel-Specific Pricing**: Different prices for different marketplaces
- **Inventory Allocation**: Reserve stock for specific channels
- **Shipping Options**: Platform-specific shipping configurations

**Sync Management**
- **EcomSync Integration**: Central synchronization hub
- **Real-time Updates**: Automatic stock and price synchronization
- **Conflict Resolution**: Handle discrepancies between platforms
- **Performance Analytics**: Track sales across all channels

---

## Advanced Item Management

### Create Single Tab

**Individual Item Creation**
- **Quick Add**: Streamlined process for single items
- **Template Usage**: Apply predefined item templates
- **Bulk Field Population**: Copy common settings from existing items
- **Validation**: Real-time error checking and required field validation

### Create Group Item Tab

**Bulk Item Management**
- **CSV Import**: Upload multiple items simultaneously  
- **Template Download**: Get properly formatted import templates
- **Data Validation**: Pre-import checking and error reporting
- **Progress Tracking**: Monitor bulk operation status

**Group Operations**
- **Category Assignment**: Apply categories to multiple items
- **Pricing Updates**: Bulk pricing changes across item groups
- **Status Changes**: Mass activation/deactivation of items
- **Export Functions**: Generate item lists and reports

### Update and Delete Operations

**Item Updates**
- **Version Control**: Track all changes with timestamps and user attribution
- **Permission control**: restrict who may change critical item master fields (item changes have no approval workflow)
- **Change Notifications**: Alert relevant team members of modifications
- **Rollback Capability**: Revert to previous versions when needed

**Item Deletion**
- **Safety Checks**: Prevent deletion of items with transaction history
- **Soft Delete**: Archive items instead of permanent removal
- **Cascade Effects**: Understanding impact on related records
- **Data Cleanup**: Proper handling of associated data

---

## Stock and Inventory Management

### Stock Availability Tab

**Real-Time Inventory Tracking**
- **Current Stock**: Live inventory levels across all locations
- **Available to Sell**: Stock minus reserved quantities
- **Reorder Levels**: Minimum stock thresholds and automatic alerts
- **Lead Times**: Supplier delivery schedules and planning

**Multi-Location Management**
- **Warehouse Distribution**: Stock levels by location
- **Transfer Tracking**: Inter-location stock movements
- **Location-Specific**: Different stock policies for different warehouses
- **Centralized Control**: Master view of all inventory locations

### Stock Balance Tab

**Historical Analysis**
- **Stock Movement History**: Complete audit trail of all inventory changes
- **Adjustment Records**: Manual stock corrections and reasons
- **Valuation Methods**: FIFO, LIFO, weighted average cost tracking
- **Variance Analysis**: Identify discrepancies and investigate causes

**Reporting and Analytics**
- **Stock Aging**: Identify slow-moving and obsolete inventory
- **Turn Rate Analysis**: Inventory velocity and efficiency metrics
- **Cost Analysis**: Track inventory investment and carrying costs
- **Forecasting Data**: Historical data for demand planning

### Sales Order Tab

**Order Management Integration**
- **Pending Orders**: Items on backorder and fulfillment queue
- **Reserved Stock**: Quantities allocated to specific orders
- **Commitment Tracking**: Delivery promises and customer expectations
- **Priority Management**: Rush orders and special handling requirements

**Customer Order History**
- **Sales Performance**: Item-specific sales analytics
- **Customer Preferences**: Track which customers buy which items
- **Seasonal Patterns**: Identify seasonal demand fluctuations
- **Profitability Analysis**: Margin analysis by item and customer

---

## Best Practices for Item Maintenance

### Regular Maintenance Schedule

**Daily Tasks**
- Review stock levels and reorder alerts
- Review recent item master changes in the change log
- Monitor marketplace synchronization status
- Address customer inquiries about products

**Weekly Tasks**
- Update item descriptions and images as needed
- Review and clean up inactive items
- Analyze sales performance and adjust categories
- Verify pricing across all channels

**Monthly Tasks**
- Comprehensive category review and optimization
- Bulk update operations for seasonal changes
- Review and update vendor information
- Performance analysis and improvement planning

### Data Quality Management

**Consistency Standards**
- Establish naming conventions and stick to them
- Maintain consistent categorization schemes
- Use standardized descriptions and specifications
- Regular data audits and cleanup procedures

**Integration Maintenance**
- Verify e-commerce platform synchronization
- Check accounting integration accuracy
- Monitor inventory tracking performance
- Test reporting and analytics functionality

---

## Troubleshooting Common Issues

### Synchronization Problems

**EcomSync Issues**
- Verify applet activation and configuration
- Check network connectivity and API limits
- Review error logs for specific failure details
- Contact support for persistent synchronization failures

**Marketplace Integration Issues**
- Confirm platform-specific requirements and limitations
- Verify image and description compliance
- Check pricing and inventory synchronization
- Review platform-specific error messages

### Performance Optimization

**Large Catalog Management**
- Use pagination and filtering for better performance
- Implement efficient search and indexing strategies
- Regular database maintenance and optimization
- Archive inactive items to improve system speed

**User Experience Enhancement**
- Customize views for different user roles
- Create saved searches for frequently accessed items
- Implement keyboard shortcuts for power users
- Provide comprehensive user training and documentation

---

## Integration with Other Modules

### Accounting Integration
- **Chart of Accounts**: Automatic GL account assignment
- **Cost Tracking**: Real-time cost updates and variance reporting
- **Tax Compliance**: Proper tax code assignment and reporting

### Sales Integration
- **CRM Linkage**: Customer preferences and purchase history
- **Quote Generation**: Streamlined quotation creation
- **Order Processing**: Seamless order-to-fulfillment workflow

### Purchasing Integration
- **Vendor Management**: Supplier information and performance tracking
- **Purchase Orders**: Automatic PO generation based on stock levels
- **Receiving**: Streamlined goods receipt and inventory updates

---

## Next Steps

After mastering item maintenance, explore these related areas:

1. **[Pricing Schemes](/user-guide/daily-tasks/pricing-scheme/)** - Advanced pricing strategies
2. **[Inventory Management](/modules/inventory/)** - Complete stock control
3. **[E-Commerce Integration](/modules/ecommerce/)** - Multi-channel selling
4. **[Financial Accounting](/modules/financial-accounting/)** - Cost tracking and reporting

{{< callout type="success" >}}
**Maintenance Success**: A well-maintained item catalog improves operational efficiency by 40-60% and reduces order processing errors by up to 80%.
{{< /callout >}}

---

## Related Resources

- [Creating Items Guide](/user-guide/basic-operations/creating-an-item/) - Start with item creation
- [Editing Items Guide](/user-guide/basic-operations/editing-an-item/) - Quick editing procedures
- [Document Item Types](/user-guide/basic-operations/document-item-types/) - Understanding classifications
- [Price Book Management](/user-guide/daily-tasks/price-book/) - Pricing strategies and implementation