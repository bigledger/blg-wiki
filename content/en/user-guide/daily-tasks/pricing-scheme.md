---
description: Create and manage flexible pricing schemes for different customer segments, market channels, and business scenarios with BigLedger's comprehensive pricing system.
tags:
- user-guide
- tutorial
- pricing
- financial-management
title: Pricing Schemes & Strategy Management
weight: 50
---

Master BigLedger's flexible pricing system to create sophisticated pricing strategies that adapt to different customers, markets, and business scenarios while maintaining profitability and competitive positioning.

## Overview

Pricing schemes in BigLedger are powerful templates that define pricing structures for your products and services. These schemes can be applied across multiple business modules including POS, sales orders, quotations, and e-commerce platforms, providing consistent pricing while allowing for customer-specific and scenario-based flexibility.

{{< callout type="info" >}}
**Key Concept**: Pricing schemes create the framework, while actual item prices are set in the [Item Maintenance](/user-guide/item-maintenance/) module. This separation allows for flexible pricing strategies across different customer segments and sales channels.
{{< /callout >}}

---

## Understanding Pricing Schemes

### What Are Pricing Schemes?

Pricing schemes are templates that define how different types of prices are calculated and applied:

- **Price Types**: Retail, wholesale, member, promotional, minimum, maximum prices
- **Customer Segments**: Different pricing for different customer categories
- **Channel-Specific**: Unique pricing for POS, e-commerce, B2B portals
- **Time-Sensitive**: Seasonal, promotional, or time-based pricing
- **Volume-Based**: Quantity breaks and bulk pricing structures

### Integration Across Modules

Pricing schemes integrate seamlessly with:
- **POS Systems**: Automatic price selection based on customer type
- **E-Commerce Platforms**: Dynamic pricing for online channels
- **Sales Orders**: Customer-specific pricing application
- **Quotation Systems**: Professional pricing presentation
- **Procurement**: Cost-plus pricing calculations

---

## Accessing Pricing Scheme Management

### Navigation and Interface

1. Navigate to **Pricing Scheme** from your main menu
2. Access the comprehensive listing page with advanced search capabilities
3. Use the AG-Grid interface for efficient scheme management
4. Leverage fuzzy search for quick scheme location

### Listing Page Features

**Search and Filter Capabilities**
- **General Search**: Quick text-based search across all scheme fields
- **Advanced Search**: Detailed filtering by status, type, date ranges
- **Fuzzy Search**: Find schemes even with partial or approximate terms
- **Sort Options**: Organize by name, date created, last modified, usage frequency

**Visual Indicators**
- **Status Icons**: Active, inactive, draft scheme indicators
- **Usage Statistics**: Show which schemes are most frequently used
- **Integration Status**: Indicate which modules are using each scheme
- **Last Modified**: Track recent changes and updates

---

## Creating Pricing Schemes

### Scheme Creation Process

#### 1. Initiate New Scheme Creation

1. Click the **"+" button** on the pricing scheme listing page
2. The creation dialog opens in a secondary container
3. Complete the required and optional information
4. Save to create your new pricing scheme template

#### 2. Essential Scheme Information

**System-Generated Code**
- Automatically created by BigLedger
- Unique identifier for internal tracking
- Used in API calls and data exports
- Cannot be modified after creation

**Scheme Name** *(Required)*
- Descriptive name for easy identification
- Best practices: Include purpose and target market
- Examples: "Retail Standard", "Wholesale Bulk", "Member Discount"
- Keep names consistent and professional

**Description** *(Optional)*
- Detailed explanation of scheme purpose and usage
- Include target customer segments
- Note any special conditions or restrictions
- Helpful for team understanding and training

### Scheme Configuration Examples

**Retail Pricing Scheme**
- Name: "Retail Standard Pricing"
- Description: "Standard retail prices for walk-in customers and online sales"
- Usage: POS systems, e-commerce platforms, general quotations

**Wholesale Pricing Scheme**  
- Name: "Wholesale B2B Pricing"
- Description: "Bulk pricing for business customers with volume discounts"
- Usage: B2B portal, large order processing, distributor sales

**Member Pricing Scheme**
- Name: "VIP Member Exclusive"
- Description: "Special pricing for loyalty program members with additional discounts"
- Usage: Member portal, POS with customer identification, special promotions

---

## Editing and Managing Pricing Schemes

### Accessing Scheme Editing

1. Click on any pricing scheme from the main listing
2. Access the comprehensive editing interface
3. Navigate between different configuration tabs
4. Make changes and save updates

### Main Tab Configuration

**Core Information Management**
- **Pricing Code**: View system code (read-only for reference)
- **Scheme Name**: Update naming for clarity and consistency
- **Description**: Modify detailed explanations and usage notes
- **Status Management**: Control active/inactive status for scheme availability

**Status Control Options**
- **Active**: Scheme available for use in all integrated modules
- **Inactive**: Scheme hidden from selection but existing usage preserved
- **Draft**: Scheme under development, not available for operational use

**Scheme Management Actions**
- **Save Changes**: Update scheme information
- **Duplicate Scheme**: Create copy for similar pricing strategies  
- **Delete Scheme**: Remove unused schemes (with safety checks)
- **Export Settings**: Generate scheme configuration for backup or transfer

### Copy Tab Functionality

**Scheme Duplication and Templates**
- **Source Scheme Selection**: Choose existing scheme as starting point
- **Modification Options**: Adjust pricing percentages, add/remove price types
- **Bulk Updates**: Apply changes across multiple price points
- **Template Creation**: Save as reusable template for future schemes

**Advanced Copy Features**
- **Selective Copying**: Choose specific elements to duplicate
- **Price Adjustments**: Apply percentage increases or decreases during copy
- **Customer Segment Mapping**: Adapt schemes for different market segments
- **Multi-Currency Support**: Convert pricing for international markets

---

## Pricing Scheme Application

### POS Integration

**POS Configuration Setup**
1. Access POS settings from your main navigation
2. Navigate to pricing configuration section
3. Select appropriate pricing schemes for different scenarios:
   - **Minimum Price**: Lowest allowable selling price
   - **Maximum Price**: Highest suggested selling price  
   - **Retail Price**: Standard customer pricing
   - **Member Price**: Special pricing for loyalty members

**Dynamic Price Selection**
- **Customer Type Recognition**: Automatic scheme selection based on customer profile
- **Manual Override**: Staff ability to select appropriate scheme when needed
- **Promotion Integration**: Apply promotional schemes during special events
- **Tax Compliance**: Ensure Malaysian GST/SST compliance in all pricing

### E-Commerce Platform Integration

**Multi-Channel Pricing**
- **Platform-Specific Schemes**: Different pricing for Shopify, Lazada, Shopee
- **Currency Adaptation**: Automatic conversion for international sales
- **Promotional Pricing**: Time-sensitive pricing for marketing campaigns
- **Inventory-Based Pricing**: Price adjustments based on stock levels

### Sales Order and Quotation Integration

**Professional Pricing Presentation**
- **Customer-Specific Pricing**: Automatic application based on customer classification
- **Volume Discounting**: Quantity-based pricing calculations
- **Project Pricing**: Special schemes for large projects or contracts
- **Permission control**: special pricing is limited by who holds the edit permission (there is no pricing approval workflow)

---

## Advanced Pricing Strategies

### Multi-Tier Pricing Systems

**Customer Segmentation**
- **Retail Customers**: Standard pricing with full margins
- **Wholesale Customers**: Volume-based pricing with reduced margins
- **VIP Members**: Special pricing with loyalty discounts
- **Staff/Employee**: Internal pricing for employee purchases

**Geographic Pricing**
- **Local Market**: Standard regional pricing
- **Export Market**: International pricing with currency considerations  
- **Remote Areas**: Adjusted pricing for delivery costs
- **Urban vs Rural**: Market-specific pricing strategies

### Time-Based Pricing

**Seasonal Adjustments**
- **Peak Season**: Higher prices during high-demand periods
- **Off-Season**: Promotional pricing to maintain sales volume
- **Holiday Specials**: Event-specific pricing schemes
- **End-of-Season**: Clearance pricing for inventory management

**Dynamic Pricing**
- **Real-time Adjustments**: Market-responsive pricing changes
- **Competitive Pricing**: Adjust based on market conditions
- **Inventory-Driven**: Price adjustments based on stock levels
- **Demand-Based**: Higher prices for high-demand items

---

## Best Practices for Pricing Scheme Management

### Strategic Planning

**Market Analysis**
- Research competitor pricing strategies
- Understand customer price sensitivity
- Analyze cost structures and margin requirements  
- Consider market positioning and brand image

**Profitability Focus**
- Ensure all schemes maintain acceptable profit margins
- Factor in all costs including overhead, shipping, taxes
- Regular review and adjustment of pricing strategies
- Monitor performance metrics and adjust accordingly

### Implementation Excellence

**Consistent Application**
- Train all staff on proper scheme usage
- Document pricing policies and procedures
- Regular audits to ensure correct implementation
- Customer communication about pricing structures

**System Integration**
- Test pricing schemes across all platforms before deployment
- Verify tax calculations and compliance requirements
- Ensure data synchronization between modules
- Regular backup of pricing scheme configurations

### Monitoring and Optimization

**Performance Tracking**
- Monitor sales performance by pricing scheme
- Analyze customer response to different price points
- Track profitability by customer segment and product
- Review competitive positioning regularly

**Continuous Improvement**
- Regular scheme review and optimization
- Customer feedback integration
- Market trend adaptation
- Technology enhancement adoption

---

## Troubleshooting Common Issues

### Pricing Inconsistencies

**Multi-Platform Synchronization**
- **Issue**: Prices not updating across all platforms
- **Solution**: Check EcomSync configuration and API connections
- **Prevention**: Regular synchronization testing and monitoring

**Tax Calculation Errors**
- **Issue**: Incorrect tax amounts in pricing
- **Solution**: Verify tax code assignments and rate configurations
- **Prevention**: Regular compliance reviews and updates

### Performance Issues

**Large Catalog Management**
- **Issue**: Slow pricing updates with many items
- **Solution**: Implement batch processing and scheduled updates
- **Prevention**: Optimize database indices and regular maintenance

**User Experience Problems**
- **Issue**: Staff confusion about scheme selection
- **Solution**: Provide comprehensive training and clear documentation
- **Prevention**: Simplify scheme names and provide usage guidelines

---

## Integration with Other BigLedger Features

### Financial Accounting Integration

**Revenue Recognition**
- Automatic posting to appropriate revenue accounts
- Margin analysis and profitability reporting
- Cost accounting integration for accurate profit calculations
- Budget planning with pricing scenario modeling

### Inventory Management Integration

**Stock Valuation**
- Cost-plus pricing calculations
- Margin analysis by item and customer
- Slow-moving inventory pricing strategies
- Automated reorder level adjustments based on pricing

### Customer Relationship Management

**Customer Segmentation**
- Automatic pricing based on customer classification
- Purchase history analysis for pricing optimization
- Customer lifetime value calculations
- Loyalty program integration with special pricing

---

## Next Steps and Advanced Features

After mastering basic pricing schemes, explore:

1. **[Price Book Management](/user-guide/price-book/)** - Detailed price lists and management
2. **[Item Maintenance](/user-guide/item-maintenance/)** - Apply pricing to specific items
3. **[POS Configuration](/modules/pos/)** - Implement pricing in retail operations
4. **[E-Commerce Integration](/modules/ecommerce/)** - Multi-channel pricing strategies

{{< callout type="success" >}}
**Pricing Success**: Businesses using structured pricing schemes typically see 15-25% improvement in profit margins and 30% reduction in pricing errors.
{{< /callout >}}

---

## Related Resources

- [Financial Management Overview](/modules/financial-accounting/) - Complete financial integration
- [Sales Operations](/modules/crm/) - Customer relationship and pricing management
- [E-Commerce Platforms](/modules/ecommerce/) - Online pricing and synchronization
- [Business Analytics](/business-operations/dashboard/) - Pricing performance analysis

---

## Getting Help

### Support Resources

For pricing scheme questions and support:
- **Technical Support**: vincent@bigledger.com
- **Business Consulting**: sales@bigledger.com  
- **Documentation**: Complete user guides and video tutorials
- **Training**: Comprehensive pricing strategy training programs

### Professional Services

Consider professional services for:
- Complex pricing strategy development
- Market analysis and competitive positioning
- Custom pricing scheme development
- Advanced integration and automation setup