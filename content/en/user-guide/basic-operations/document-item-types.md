---
description: Master BigLedger's document item types including Basic Items, Kits, Grouped Items, Packages, and Bundles for comprehensive inventory and sales management.
tags:
- user-guide
- tutorial
- inventory-management
- item-types
- business-operations
title: Document Item Types & Classifications
weight: 10
---

Understanding BigLedger's document item types is fundamental to effective inventory management, sales processing, and business operations. Each item type serves specific business scenarios and offers unique functionality for managing complex inventory relationships.

## Overview

BigLedger supports five distinct document item types, each designed for specific business scenarios and inventory relationships. These types determine how items behave in transactions, inventory tracking, and financial reporting.

{{< callout type="info" >}}
**Foundation Concept**: Document items in BigLedger represent business entities that can be sold, purchased, or managed. The item type determines the relationship between the document item (FI-item) and physical inventory items (INV items).
{{< /callout >}}

---

## The Five Document Item Types

### 1. Basic Item (FI-Item)

**Definition**: A basic item maintains a one-to-one relationship with a physical inventory item (INV item), representing the simplest and most common item type in BigLedger.

#### Key Characteristics

- **Direct Mapping**: One FI-item equals one INV item
- **Inventory Tracking**: Real-time stock level updates
- **Simple Processing**: Straightforward sales and purchase transactions
- **Financial Integration**: Direct cost and revenue posting
- **Barcode Support**: Standard barcode scanning and identification

#### Business Use Cases

{{< cards >}}
  {{< card title="Retail Products" subtitle="Individual products sold as single units" >}}
  {{< card title="Raw Materials" subtitle="Manufacturing inputs tracked individually" >}}
  {{< card title="Office Supplies" subtitle="Standard business supplies and consumables" >}}
  {{< card title="Equipment Items" subtitle="Tools, machinery, and capital equipment" >}}
{{< /cards >}}

#### Inventory Behavior

- **Stock Deduction**: Immediate inventory reduction upon sale
- **Receiving**: Direct stock increase upon purchase or receipt
- **Valuation**: Single item cost and selling price
- **Reporting**: Individual item tracking and analysis

---

### 2. Kit Item

**Definition**: A kit combines multiple basic items into a single sellable unit while maintaining inventory tracking for individual components through automated kitting and reverse kitting processes.

#### Key Characteristics

- **Component Structure**: Parent kit with multiple child components
- **Automatic Processing**: System-managed kitting and reverse kitting
- **Dual Inventory Impact**: Components reduce, assembled kit increases
- **Manufacturing Integration**: Production and assembly workflows
- **Quality Control**: Component verification and validation

#### Component Management

**Kitting Process**:
1. Select kit components from inventory
2. System validates component availability
3. Component stock levels decrease
4. Assembled kit stock increases by one unit
5. Cost calculation includes all component costs

**Reverse Kitting Process**:
1. Kit is disassembled back to components
2. Kit stock level decreases
3. Individual component stock levels increase
4. Cost accounting reverses to component values

#### Business Applications

{{< cards >}}
  {{< card title="Computer Systems" subtitle="CPU, memory, storage assembled into complete computers" >}}
  {{< card title="Gift Sets" subtitle="Multiple products packaged together for promotions" >}}
  {{< card title="Tool Kits" subtitle="Complete sets of tools for specific applications" >}}
  {{< card title="Meal Packages" subtitle="Restaurant combo meals with multiple components" >}}
{{< /cards >}}

#### Example: Computer Kit

**Kit Components**:
- **A1**: Intel i7 Processor ($300)
- **A2**: 16GB DDR4 Memory ($120)
- **A3**: 512GB SSD Storage ($100)
- **A4**: Gaming Graphics Card ($400)

**Kit Assembly**:
- **Kit-A**: Complete Gaming Computer ($920 + assembly cost)
- When one Kit-A is assembled, components A1, A2, A3, A4 each reduce by 1
- Kit-A inventory increases by 1

---

### 3. Grouped Item

**Definition**: Grouped items manage products with dimensions or variations (size, color, style) while maintaining a single product identity with multiple selection options for customers.

#### Key Characteristics

- **Dimension Management**: Size, color, style, and other attribute variations
- **Customer Selection**: Interactive choice presentation
- **Ratio Constraint**: Only one basic item selected per transaction
- **Unified Presentation**: Single product with multiple options
- **Inventory Tracking**: Individual tracking for each variation

#### Grouping Structure

**Parent Group**: T-Shirt Product Line
- **Color Variations**: Yellow, Blue, Red
- **Size Variations**: Small (3), Medium (4), Large (5)
- **Customer Selection**: One color + one size = one basic FI-item

#### Customer Experience Flow

1. **Product Selection**: Customer chooses "T-Shirt" from catalog
2. **Option Presentation**: System displays color and size options
3. **Customer Choice**: Select "Blue" color and "Medium" size
4. **Item Resolution**: System identifies specific basic FI-item
5. **Transaction Processing**: Sale processes for selected variation

#### Business Applications

{{< cards >}}
  {{< card title="Apparel & Fashion" subtitle="Clothing with size, color, and style variations" >}}
  {{< card title="Electronics" subtitle="Products with capacity, color, or feature variations" >}}
  {{< card title="Automotive Parts" subtitle="Parts with compatibility variations" >}}
  {{< card title="Food Products" subtitle="Items with size, flavor, or packaging variations" >}}
{{< /cards >}}

#### Inventory Management Benefits

- **Unified Catalog**: Single product listing with multiple variations
- **Individual Tracking**: Separate stock levels for each variation
- **Customer Simplicity**: Easy selection process
- **Reporting Flexibility**: Analysis by product line or individual variation

---

### 4. Package Item

**Definition**: Package items establish one-to-many relationships where a single FI-item maps to multiple INV items, enabling complex product bundling with flexible inventory management.

#### Key Characteristics

- **Multiple Mapping**: One FI-item contains multiple INV items
- **Deferred Deduction**: Inventory reduces only upon package sale
- **Flexible Composition**: Different quantities of various items
- **Package Pricing**: Single price for entire package
- **Promotional Use**: Special offers and bundle deals

#### Package Behavior

**Pre-Sale Inventory**:
- Component items remain in individual inventory pools
- No inventory movement during package creation
- Components available for individual sale until package is sold

**Upon Package Sale**:
- All component INV items reduce according to package specifications
- Single transaction processes multiple inventory movements
- Financial posting reflects package price allocation

#### Package Composition Examples

**Office Starter Package**:
- 5x Pens (INV-001)
- 3x Notebooks (INV-002)
- 1x Stapler (INV-003)
- 1x Tape Dispenser (INV-004)
- **Package Price**: $25.00 (vs $32.00 individual total)

**Software Bundle Package**:
- 1x Operating System License (INV-501)
- 1x Office Suite License (INV-502)
- 1x Antivirus License (INV-503)
- **Package Price**: $199.00 (vs $300.00 individual total)

#### Business Applications

{{< cards >}}
  {{< card title="Promotional Bundles" subtitle="Marketing packages with special pricing" >}}
  {{< card title="Starter Kits" subtitle="Complete solutions for new customers" >}}
  {{< card title="Seasonal Packages" subtitle="Holiday and seasonal product combinations" >}}
  {{< card title="Service Packages" subtitle="Combined products and services offerings" >}}
{{< /cards >}}

---

### 5. Bundle Item

**Definition**: Bundle items represent the most complex item type, capable of containing any combination of basic items, kits, grouped items, or packages in a hierarchical structure supporting up to two levels of complexity.

#### Key Characteristics

- **Universal Container**: Can include any other item type
- **Multiple GenDocLines**: Complex transaction line generation
- **Two-Level Support**: Primary bundle with sub-bundle capability
- **Flexible Pricing**: Individual or bundle pricing strategies
- **Advanced Scenarios**: Enterprise-level product combinations

#### Bundle Complexity Levels

**Level 1 Bundle**: Direct combination of various item types
- Basic items + Kits + Grouped items + Packages
- Single-level structure with straightforward processing
- Suitable for most business scenarios

**Level 2 Bundle**: Nested bundle structures
- Primary bundle containing sub-bundles
- Complex hierarchy with multiple processing layers
- Advanced enterprise scenarios

#### Bundle Composition Examples

**Enterprise IT Solution Bundle**:

**Primary Bundle**: Complete Office Setup
- **Hardware Kit**: Computers, monitors, keyboards (Kit item)
- **Software Package**: Operating systems and applications (Package item)
- **Basic Items**: Cables, adapters, surge protectors (Basic items)
- **Service Group**: Installation options (Grouped item - onsite/remote/standard/premium)

**Nested Sub-Bundle**: Network Infrastructure
- **Network Kit**: Routers, switches, cables (Kit item)
- **Security Package**: Firewall software and licenses (Package item)
- **Basic Items**: Network accessories (Basic items)

#### Transaction Processing Complexity

**Multiple GenDocLines Generation**:
- Each bundle component generates separate document lines
- Complex cost allocation and pricing calculations
- Individual component tracking within bundle context
- Detailed reporting for bundle analysis

#### Business Applications

{{< cards >}}
  {{< card title="Enterprise Solutions" subtitle="Complete business system implementations" >}}
  {{< card title="Project-Based Sales" subtitle="Large projects with multiple component types" >}}
  {{< card title="Subscription Services" subtitle="Complex service offerings with multiple elements" >}}
  {{< card title="Custom Configurations" subtitle="Tailored solutions for specific customer needs" >}}
{{< /cards >}}

---

## Choosing the Right Item Type

### Decision Framework

Use this framework to determine the appropriate item type for your business scenarios:

#### Start with Basic Questions

1. **Single or Multiple Items?**
   - Single → Consider Basic Item
   - Multiple → Evaluate other types

2. **Inventory Relationship?**
   - One-to-one → Basic Item
   - One-to-many → Package, Kit, or Bundle
   - Many-to-one → Grouped Item

3. **Component Processing?**
   - No processing → Package
   - Assembly required → Kit
   - Complex combinations → Bundle

4. **Customer Experience?**
   - Simple selection → Basic Item
   - Option selection → Grouped Item
   - Bundle choice → Package or Bundle

### Business Scenario Mapping

{{< cards >}}
  {{< card title="Simple Retail" subtitle="Use Basic Items for straightforward product sales" >}}
  {{< card title="Manufacturing" subtitle="Use Kits for assembled products with component tracking" >}}
  {{< card title="Variations" subtitle="Use Grouped Items for products with size/color options" >}}
  {{< card title="Promotions" subtitle="Use Packages for marketing bundles and special offers" >}}
  {{< card title="Enterprise" subtitle="Use Bundles for complex, multi-component solutions" >}}
{{< /cards >}}

---

## Implementation Best Practices

### Planning Your Item Structure

**Inventory Assessment**:
1. Catalog all products and their relationships
2. Identify assembly or bundling requirements
3. Determine customer selection needs
4. Evaluate pricing and promotional strategies

**System Configuration**:
1. Start with Basic Items for simple products
2. Implement Grouped Items for variation management
3. Add Kits for assembly operations
4. Deploy Packages for promotional strategies
5. Reserve Bundles for complex enterprise scenarios

### Data Management

**Consistent Naming**:
- Use clear, descriptive item names
- Implement standardized naming conventions
- Include relevant identifiers and codes
- Maintain consistency across item types

**Accurate Relationships**:
- Verify component mappings in Kits
- Validate grouping structures for Grouped Items
- Confirm package compositions
- Test bundle hierarchies thoroughly

### Performance Optimization

**Database Efficiency**:
- Regular maintenance of item relationships
- Cleanup of unused or obsolete items
- Optimization of complex bundle structures
- Monitoring of transaction processing times

**User Experience**:
- Train staff on item type differences
- Provide clear customer selection interfaces
- Implement efficient search and filtering
- Regular review of item type effectiveness

---

## Integration with Other Modules

### Financial Accounting Integration

**Cost Accounting**:
- Basic Items: Direct cost assignment
- Kits: Component cost accumulation
- Grouped Items: Variation-specific costing
- Packages: Allocated cost distribution
- Bundles: Complex cost hierarchy management

**Revenue Recognition**:
- Item type determines revenue posting methods
- Bundle components may require separate revenue streams
- Package sales use consolidated revenue approach
- Kit sales include assembly value-add recognition

### Inventory Management Integration

**Stock Tracking**:
- Real-time updates for all item types
- Component-level tracking for Kits and Bundles
- Variation-specific levels for Grouped Items
- Package component reservations

**Procurement Integration**:
- Automatic reordering based on item type requirements
- Component availability checking for Kits
- Package component procurement planning
- Bundle-level purchase order generation

### Sales and CRM Integration

**Customer Experience**:
- Product catalog presentation based on item types
- Dynamic option selection for Grouped Items
- Bundle configuration tools for complex sales
- Package promotion and marketing integration

**Pricing Management**:
- Item type-specific pricing strategies
- Component and bundle pricing relationships
- Promotional pricing for Packages
- Customer-specific pricing for all types

---

## Troubleshooting Common Issues

### Item Type Conversion

**Changing Item Types**:
{{< callout type="warning" >}}
**Important**: Converting between item types may affect existing transactions and inventory balances. Always backup data and test in a development environment before making changes.
{{< /callout >}}

**Safe Conversion Practices**:
1. Complete all pending transactions
2. Reconcile inventory balances
3. Backup relevant data
4. Test conversion in development environment
5. Plan for transaction history preservation

### Performance Issues

**Complex Bundle Performance**:
- Limit bundle nesting to two levels
- Regular cleanup of unused components
- Monitor transaction processing times
- Optimize database indices for item relationships

**Inventory Synchronization**:
- Regular reconciliation of component relationships
- Automated validation of Kit and Package compositions
- Monitoring of Grouped Item variation integrity
- Performance testing with large catalogs

### Data Integrity

**Relationship Validation**:
- Regular audits of component mappings
- Verification of inventory level calculations
- Validation of pricing relationship consistency
- Monitoring of financial posting accuracy

---

## Advanced Features and Future Enhancements

### Automation Capabilities

**Smart Item Classification**:
- AI-powered item type recommendations
- Automated component relationship detection
- Dynamic grouping based on product attributes
- Intelligent bundle composition suggestions

**Integration Enhancements**:
- Enhanced e-commerce platform synchronization
- Advanced manufacturing integration
- Improved supplier relationship management
- Expanded financial reporting capabilities

### Scalability Considerations

**Enterprise Scaling**:
- High-volume transaction processing
- Multi-location inventory management
- Complex hierarchy support expansion
- Advanced reporting and analytics

---

## Related Resources

Expand your understanding of BigLedger's item management:

- [Item Maintenance Procedures](/user-guide/basic-operations/item-maintenance/) - Creating and managing individual items
- [Inventory Management](/modules/inventory/) - Complete inventory control system
- [Pricing Schemes](/user-guide/daily-tasks/pricing-scheme/) - Advanced pricing strategies
- [Digital CRM Module](/modules/crm-digital/) - Customer relationship and sales management
- [Manufacturing Integration](/modules/manufacturing/) - Production and assembly workflows

---

## Getting Help and Support

### Technical Support

For assistance with document item types:
- **Technical Support**: vincent@bigledger.com
- **Implementation Consulting**: sales@bigledger.com
- **Training Resources**: Comprehensive video tutorials and documentation
- **Community Support**: User forums and knowledge base

### Professional Services

Consider professional services for:
- Complex item type implementation planning
- Custom business scenario configuration
- Advanced integration setup
- Performance optimization and scalability planning

{{< callout type="success" >}}
**Implementation Success**: Businesses that properly implement BigLedger's item type system see 40% improvement in inventory accuracy and 25% reduction in transaction processing time.
{{< /callout >}}