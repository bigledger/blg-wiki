---
description: Order 3132819258 2021-06-18T06:29:50.
tags:
- business
- operations
title: Order
weight: 10
---

## Unified Order Orchestration Platform

BigLedger's Order Management System (OMS) provides end-to-end visibility and control over your entire order lifecycle across all sales channels. Our intelligent order routing engine ensures optimal fulfillment while maintaining real-time inventory accuracy and customer satisfaction.

## Multi-Channel Order Processing

### Channel Integration

#### E-Commerce Platforms
- **Shopify**: Real-time order sync with inventory updates
- **WooCommerce**: WordPress integration with custom fields
- **Magento**: Enterprise B2B and B2C capabilities
- **OpenCart**: Multi-store order consolidation
- **Custom Stores**: REST API integration

#### Marketplaces
- **Local Marketplaces**
  - Shopee: Order sync with SLS integration
  - Lazada: Fulfillment by Lazada (FBL) support
  - PGMall: Direct API connection
  - Lelong: Legacy system bridge
  - Mudah: Classified ads order capture

- **International Marketplaces**
  - Amazon: FBA and FBM order processing
  - eBay: Global shipping program integration
  - Alibaba: B2B bulk order handling
  - Qoo10: Singapore/Malaysia cross-border

#### Direct Channels
- **B2B Portal**: Corporate customer self-service
- **Sales App**: Field sales order capture
- **Call Center**: Telephone order entry
- **WhatsApp Business**: Conversational commerce
- **Social Commerce**: Facebook, Instagram shops

### Order Types

#### Standard Orders
- **Retail Orders**: Single customer, immediate fulfillment
- **Wholesale Orders**: Bulk quantities with volume pricing
- **Subscription Orders**: Recurring deliveries
- **Pre-Orders**: Future dated fulfillment
- **Backorders**: Partial shipment management

#### Special Orders
- **Drop Shipping**: Direct from supplier to customer
- **Cross-Docking**: No inventory holding
- **Made-to-Order**: Production triggered by order
- **Consignment Orders**: Stock at customer location
- **Transfer Orders**: Inter-branch movements

## Order Lifecycle Management

### Order Creation

#### Order Capture Methods
1. **Automated Import**: API/EDI from channels
2. **Manual Entry**: CSR order input
3. **Bulk Upload**: Excel/CSV import
4. **Mobile App**: Field sales entry
5. **Voice Orders**: AI transcription (beta)

#### Order Validation
- **Customer Verification**: Credit check, blacklist screening
- **Product Availability**: Real-time inventory checking
- **Pricing Validation**: Contract pricing, promotions
- **Address Verification**: Google Maps API validation
- **Fraud Detection**: AI-powered risk scoring

### Order Processing

#### Order Routing Engine
- **Intelligent Allocation**
  - Nearest warehouse selection
  - Inventory optimization
  - Shipping cost minimization
  - Delivery time optimization
  - Load balancing across fulfillment centers

#### Order Prioritization
- **Priority Levels**
  - VIP customers
  - Express shipping
  - Perishable goods
  - High-value orders
  - Service level agreements

#### Order Modifications
- **Allowed Changes**
  - Quantity adjustments
  - Product substitutions
  - Delivery address updates
  - Delivery date changes
  - Payment method switching

- **Change Control**
  - Cut-off time enforcement
  - Permission-controlled amendment (sales orders have no approval workflow)
  - Customer notification
  - Audit trail maintenance

### Order Fulfillment

#### Picking Process
- **Picking Methods**
  - Wave picking: Batch similar orders
  - Zone picking: Warehouse zone assignment
  - Batch picking: Multiple orders simultaneously
  - Pick-and-pack: Direct to shipping
  - Voice picking: Hands-free operation

#### Packing Optimization
- **Carton Selection**: AI-optimized box sizing
- **Packing Materials**: Eco-friendly options
- **Documentation**: Packing slips, invoices
- **Quality Check**: Barcode verification
- **Gift Wrapping**: Special handling options

#### Shipping Integration
- **Local Couriers**
  - Pos Laju: Track and trace integration
  - GDex: Same-day delivery options
  - J&T Express: COD reconciliation
  - Ninja Van: API integration
  - DHL eCommerce: International shipping

- **Shipping Features**
  - Rate shopping: Best rate selection
  - Label printing: Bulk generation
  - Tracking updates: Real-time status
  - Proof of delivery: Digital signatures
  - Insurance: Automated coverage

### Order Status Management

#### Status Workflow
1. **Pending**: Awaiting payment/verification
2. **Confirmed**: Payment received, processing
3. **Picking**: Items being collected
4. **Packing**: Order being prepared
5. **Shipped**: Handed to courier
6. **In Transit**: En route to customer
7. **Out for Delivery**: Last mile
8. **Delivered**: Successfully completed
9. **Failed Delivery**: Attempted but unsuccessful
10. **Returned**: Customer initiated return

#### Status Notifications
- **Customer Communications**
  - Order confirmation email
  - SMS shipping updates
  - WhatsApp delivery notifications
  - Mobile app push notifications
  - Delivery day reminders

### Returns Management

#### Return Initiation
- **Return Channels**
  - Customer portal self-service
  - Call center assistance
  - Retail store returns
  - Courier pickup scheduling

#### Return Processing
- **Return Reasons**
  - Defective product
  - Wrong item shipped
  - Damaged in transit
  - Change of mind
  - Size/fit issues

- **Return Actions**
  - Refund processing
  - Exchange initiation
  - Store credit issuance
  - Repair and return
  - Disposal authorization

## Advanced Features

### Order Intelligence

#### Predictive Analytics
- **Demand Forecasting**: Predict order volumes
- **Delivery Time Estimation**: AI-based ETAs
- **Fraud Prevention**: Pattern recognition
- **Customer Behavior**: Purchase prediction
- **Inventory Planning**: Reorder point optimization

#### Order Optimization
- **Bundling Suggestions**: Increase order value
- **Upsell Opportunities**: Related products
- **Shipping Consolidation**: Combine orders
- **Route Optimization**: Delivery planning
- **Warehouse Selection**: Minimize costs

### Split Order Management

#### Split Scenarios
- **Multiple Warehouses**: Items from different locations
- **Partial Availability**: Some items out of stock
- **Different Delivery Dates**: Staggered fulfillment
- **Drop Ship Items**: Direct from supplier
- **Special Handling**: Hazmat separate shipping

#### Split Order Handling
- Maintain single order reference
- Consolidated tracking
- Combined invoice option
- Shipping cost optimization
- Customer communication

### Allocation & Reservation

#### Inventory Allocation
- **Soft Allocation**: Temporary reservation
- **Hard Allocation**: Committed inventory
- **ATP (Available to Promise)**: Future availability
- **CTP (Capable to Promise)**: Production capacity

#### Allocation Rules
- **Priority Rules**
  - First come, first served
  - Customer tier priority
  - Channel priority
  - Geographic priority
  - Profitability-based

### Order Documents

#### Document Generation
- **Sales Documents**
  - Quotations
  - Order confirmations
  - Proforma invoices
  - Tax invoices
  - Delivery orders
  - Packing lists

#### Document Delivery
- Email with PDF attachments
- Customer portal download
- WhatsApp document sharing
- API push to customer ERP
- Physical printing and mailing

## Performance Monitoring

### Order Metrics

#### Operational KPIs
- **Order Processing Time**: Order to shipment
- **Perfect Order Rate**: Complete, on-time, undamaged
- **Order Accuracy**: Correct items shipped
- **Fill Rate**: Orders fulfilled completely
- **Backorder Rate**: Items unavailable

#### Financial Metrics
- **Average Order Value (AOV)**: Revenue per order
- **Order Profitability**: Margin analysis
- **Shipping Cost Ratio**: Shipping vs. order value
- **Return Rate**: Returns as % of orders
- **Customer Lifetime Value**: Long-term revenue

### Real-Time Dashboards

#### Operations Dashboard
- Orders pending processing
- Current day shipments
- Delayed orders alert
- Warehouse capacity
- Courier performance

#### Management Dashboard
- Channel performance
- Geographic distribution
- Product velocity
- Customer segments
- Trend analysis

## Integration Ecosystem

### ERP Integration
- **Financial Systems**: Order to cash flow
- **Inventory Management**: Real-time stock updates
- **CRM**: Customer history and preferences
- **WMS**: Warehouse operations sync
- **Production**: Manufacturing triggers

### Third-Party Services
- **Payment Gateways**: Multiple payment methods
- **Tax Calculation**: Automated tax determination
- **Address Validation**: Delivery accuracy
- **Fraud Prevention**: Risk assessment
- **Insurance**: Shipment protection

## Mobile Capabilities

### Order Management App
- **For Operations Team**
  - Order review on-the-go
  - Status updates
  - Exception handling
  - Performance monitoring

- **For Delivery Team**
  - Route optimization
  - Proof of delivery
  - Cash collection
  - Failed delivery reporting

## Compliance & Security

### Data Protection
- TLS encryption for data in transit
- Role-based access control
- Audit trail for all changes

### Malaysian Requirements
- SST tax codes and returns
- LHDN e-Invoice (MyInvois) submission

## Best Practices

### Implementation Guide
1. **Channel Setup**: Configure all sales channels
2. **Inventory Sync**: Establish real-time updates
3. **Workflow Design**: Map order processes
4. **Integration Testing**: Verify all connections
5. **Team Training**: Comprehensive user training
6. **Pilot Launch**: Start with one channel
7. **Gradual Rollout**: Add channels progressively
8. **Optimization**: Continuous improvement

### Success Factors
- Clear order policies and procedures
- Regular system performance reviews
- Proactive customer communication
- Efficient exception handling
- Data-driven decision making