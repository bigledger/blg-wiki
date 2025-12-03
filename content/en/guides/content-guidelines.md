---
title: "Content Strategy Guidelines"
description: "Content organization principles for BigLedger wiki to ensure appropriate depth, avoid duplication, and serve different user audiences effectively"
weight: 1
tags:
- content-strategy
- documentation
- guidelines
---

This document defines the content strategy for BigLedger's wiki documentation to ensure clarity, avoid duplication, and serve appropriate content to different user audiences.

## The Four Content Layers

BigLedger's documentation is organized into four complementary layers, each serving a distinct purpose:

### 1. Modules (/modules/)

**Purpose**: High-level feature overviews and capabilities documentation

**Target Audience**: Decision makers, implementation planners, system architects

**Content Scope**:
- **What the module does** - Business capabilities and value proposition
- **Key features** - Comprehensive feature lists with brief descriptions
- **Architecture overview** - How the module fits into the broader system
- **Integration points** - What other modules and systems it connects with
- **Business processes** - High-level process flows and diagrams
- **Implementation approach** - Phased rollout strategy and timelines
- **Common use cases** - Industry and business scenarios

**What NOT to include**:
- Step-by-step procedures (belongs in Guides)
- Daily operation instructions (belongs in User Guide)
- Detailed applet configuration (belongs in Applets)
- Specific field-by-field instructions

**Writing Style**: Strategic, conceptual, business-oriented

**Example Structure**:
```
## Overview
[What this module delivers to the business]

## Key Features
[Comprehensive feature list organized by category]

## Core Applets
[Links to applets this module uses]

## Business Processes
[High-level process flows with diagrams]

## Integration Capabilities
[What this module connects to]

## Implementation Approach
[Phases, timeline, prerequisites]

## Common Use Cases
[Industry-specific scenarios]

## Related Documentation
[Links to Guides, User Guide sections]
```

### 2. Guides (/guides/)

**Purpose**: Complete workflow documentation and implementation guides

**Target Audience**: Implementation consultants, power users, administrators during setup

**Content Scope**:
- **End-to-end workflows** - Complete business processes from start to finish
- **Step-by-step procedures** - Detailed instructions for complex multi-step tasks
- **Configuration guides** - How to set up and configure features
- **Best practices** - Proven approaches and optimization strategies
- **Decision frameworks** - When to use different approaches
- **Troubleshooting workflows** - How to diagnose and resolve complex issues
- **Cross-module workflows** - Processes that span multiple modules

**What NOT to include**:
- Feature overviews (belongs in Modules)
- Daily operational quick references (belongs in User Guide)
- Individual applet field definitions (belongs in Applets)

**Writing Style**: Instructional, comprehensive, process-oriented

**Example Structure**:
```
## Overview
[What this guide covers and when to use it]

## Prerequisites
[Required setup, permissions, master data]

## Workflow Steps

### Step 1: [Action Name]
[Detailed instructions with screenshots]

### Step 2: [Action Name]
[Detailed instructions with screenshots]

## Variations and Options
[Alternative approaches and when to use them]

## Validation and Testing
[How to verify the workflow succeeded]

## Common Issues and Solutions
[Troubleshooting for this specific workflow]

## Related Guides
[Links to related workflow documentation]
```

### 3. User Guide (/user-guide/)

**Purpose**: Daily operational reference for routine tasks

**Target Audience**: Daily users, data entry operators, end users

**Content Scope**:
- **Quick task references** - "How do I..." style instructions
- **Getting started guides** - Initial orientation and setup
- **Daily operations** - Routine tasks performed regularly
- **Individual operation instructions** - Single-task focused content
- **Common reports** - Standard reporting and analytics
- **Troubleshooting** - Quick problem resolution for common issues
- **Role-based guides** - Organized by user role (admin, sales, warehouse, etc.)

**What NOT to include**:
- Complete workflow documentation (belongs in Guides)
- Feature capability overviews (belongs in Modules)
- Detailed system architecture (belongs in Modules)

**Writing Style**: Concise, action-oriented, task-focused

**Example Structure**:
```
## Task: [What the user wants to accomplish]

### When to use this
[Brief context about when this task is performed]

### Quick Steps
1. [Action]
2. [Action]
3. [Action]

### Detailed Instructions
[Step-by-step with screenshots, brief and focused]

### Tips
[Keyboard shortcuts, efficiency tips]

### Related Tasks
[Links to related daily operations]
```

### 4. Applets (/applets/)

**Purpose**: Individual component functionality and configuration

**Target Audience**: All users, technical users, administrators

**Content Scope**:
- **Applet purpose** - What this component does
- **Field definitions** - Detailed field-by-field documentation
- **Configuration options** - All available settings and parameters
- **Data validation rules** - Required fields, formats, constraints
- **Usage in modules** - Which modules use this applet
- **Permissions** - Role-based access requirements
- **API reference** - Technical integration details

**What NOT to include**:
- Complete business workflows (belongs in Guides)
- Module-level strategy (belongs in Modules)
- Daily operational context (belongs in User Guide)

**Writing Style**: Technical, reference-oriented, comprehensive

**Important**: Applets are reusable components that can be used by multiple modules. Maintain a single source of truth in /applets/ and have modules link to them.

**Example Structure**:
```
## Applet Overview
[What this applet does]

## Used By
[List of modules that use this applet]

## Core Features
[Key capabilities of this applet]

## Field Reference
[Complete field-by-field documentation]

## Configuration
[Setup and configuration instructions]

## Permissions
[Role-based access requirements]

## Integration
[API and technical details]

## Related Applets
[Links to complementary applets]
```

## Audience-Based Content Organization

### First-Time Users

**Journey**: Getting Started → Basic Operations → Daily Tasks

**Primary Locations**:
- `/user-guide/getting-started/` - Platform orientation
- `/user-guide/basic-operations/` - Fundamental tasks
- `/user-guide/daily-tasks/` - Common operations

**Content Characteristics**:
- Simple language, no jargon
- Guided tours and walkthroughs
- Clear success criteria
- Plenty of screenshots and visuals

### Daily Operators (Data Entry, Sales, Admin)

**Journey**: Daily Tasks → Reports → Troubleshooting

**Primary Locations**:
- `/user-guide/daily-tasks/` - Role-specific operations
- `/user-guide/administration/` - Admin-specific tasks
- `/user-guide/reports-analytics/` - Standard reporting

**Content Characteristics**:
- Task-focused, quick reference
- Keyboard shortcuts and efficiency tips
- Common issue resolution
- Role-based organization

### Technical Users (Warehouse, Drivers, Operators)

**Journey**: Role-Specific Guide → Daily Tasks → Troubleshooting

**Primary Locations**:
- `/user-guide/daily-tasks/` - Technical operations
- `/guides/inventory-guides/` - Warehouse procedures
- `/applets/` - Technical component reference

**Content Characteristics**:
- Process-oriented
- Mobile-friendly (for field operations)
- Barcode scanning and automation
- Error handling and troubleshooting

### Management (Reports, Dashboards, Strategy)

**Journey**: Modules Overview → Analytics → Advanced Features

**Primary Locations**:
- `/modules/` - Business capability overview
- `/user-guide/reports-analytics/` - Business intelligence
- `/guides/` - Strategic implementation

**Content Characteristics**:
- Business value focused
- KPIs and metrics
- Decision support
- Strategic insights

### System Administrators (Configuration, Setup)

**Journey**: Modules → Guides → Applets → Developer Docs

**Primary Locations**:
- `/modules/` - Understanding capabilities
- `/guides/` - Implementation procedures
- `/applets/` - Component configuration
- `/user-guide/administration/` - System management

**Content Characteristics**:
- Technical and detailed
- Configuration reference
- Integration guides
- Security and permissions

## Cross-Reference Guidelines

### How Sections Should Link Together

**Modules should link to**:
- **Applets** - "Core Applets" and "Shared Dependencies" sections
- **Guides** - "Related Documentation" → Setup Guides
- **User Guide** - "Related Documentation" → User Guides
- **Other Modules** - Integration capabilities

**Guides should link to**:
- **Modules** - Context in "Overview" or "Prerequisites"
- **Applets** - Specific components used in the workflow
- **User Guide** - Related daily tasks
- **Other Guides** - Related workflows

**User Guide should link to**:
- **Guides** - "For detailed workflows, see..."
- **Applets** - "Field reference available at..."
- **Modules** - "To understand the full capabilities..."

**Applets should link to**:
- **Modules** - "Used By" section listing all modules
- **Guides** - Configuration and setup guides
- **Other Applets** - Related components

### Avoiding Duplication

**Single Source of Truth Principle**:

1. **Feature Descriptions**: Always in Modules
   - Other sections link to module for capability overview
   - Use brief context only, then link for full details

2. **Workflow Procedures**: Always in Guides
   - User Guide provides quick reference, links to Guide for full workflow
   - Modules link to Guides for implementation details

3. **Field Definitions**: Always in Applets
   - All sections link to Applet documentation for field details
   - Never duplicate field definitions

4. **Daily Tasks**: Always in User Guide
   - Guides may reference daily tasks but link to User Guide
   - Modules link to User Guide for routine operations

### Cross-Reference Format

Use consistent linking patterns:

```markdown
# In Modules - linking to Guides
For detailed implementation procedures, see the
[Purchasing Implementation Guide](/guides/purchasing-guides/).

# In Guides - linking to Applets
Configure the [Supplier Maintenance Applet](/applets/supplier-maintenance-applet/)
following these steps...

# In User Guide - linking to Guides
For complete workflow documentation, see
[Purchase Order Processing Guide](/guides/purchasing-guides/purchase-order-workflow/).

# In Applets - linking to Modules
This applet is used by:
- [Purchasing Module](/modules/purchasing/)
- [Financial Accounting Module](/modules/financial-accounting/)
```

## Content Principles

### 1. Single Source of Truth

**Principle**: Every piece of information should have ONE authoritative location.

**Implementation**:
- Define ownership for each content type
- Use links for references, not duplication
- Update one location when information changes
- Clear hierarchy: Module → Guide → User Guide → Applet

**Example**:
```
❌ Bad: Duplicate supplier field definitions in:
- Modules → Purchasing
- Guides → Supplier Setup
- User Guide → Daily Tasks
- Applets → Supplier Maintenance

✅ Good: Single field definition in:
- Applets → Supplier Maintenance Applet
All other locations link to this source.
```

### 2. Progressive Disclosure

**Principle**: Guide users from simple to complex concepts progressively.

**Implementation**:
- Start with high-level overview (Modules)
- Progress to complete workflows (Guides)
- Provide quick reference (User Guide)
- End with detailed technical specs (Applets)

**User Journey**:
```
1. Module Overview → Understand what's possible
2. Getting Started (User Guide) → Basic orientation
3. Daily Tasks (User Guide) → Learn routine operations
4. Implementation Guides → Master complete workflows
5. Applets → Deep technical understanding
```

**Content Layering**:
```
Level 1: "Purchasing module manages vendor relationships"
Level 2: "Create purchase orders using the PO workflow"
Level 3: "Daily Task: How to create a purchase order"
Level 4: "Purchase Order Applet field reference"
```

### 3. Task-Based Organization

**Principle**: Organize content around user goals and tasks, not system structure.

**Implementation**:
- Use user language, not technical jargon
- Name sections by user intent: "How to create an invoice" not "Invoice Applet Documentation"
- Group by workflow, not by data structure
- Provide role-based pathways

**Task Naming Conventions**:
```
✅ Good:
- "Creating a Purchase Order"
- "Approving Expense Claims"
- "Running Month-End Reports"

❌ Bad:
- "Purchase Order Applet"
- "Claim Module Functions"
- "Report Generator"
```

**Workflow Organization**:
```
Order-to-Cash Process:
1. Create customer quotation
2. Convert quote to sales order
3. Process order fulfillment
4. Generate customer invoice
5. Receive payment
6. Reconcile bank account

[Each step links to appropriate Guide or User Guide section]
```

### 4. Contextual Relevance

**Principle**: Provide information appropriate to the user's context and expertise level.

**Implementation**:
- Technical depth matches audience expertise
- Prerequisites clearly stated
- Assume appropriate baseline knowledge
- Link to foundational concepts when needed

**Audience Context Examples**:

**For First-Time Users**:
```markdown
## Creating Your First Purchase Order

A purchase order (PO) is a document you send to suppliers when buying products.
It's like a formal shopping list that becomes a contract.

Before you start, you'll need:
- A supplier already set up in the system
- Items in your product catalog
- Permission to create purchase orders
```

**For Daily Operators**:
```markdown
## Creating a Purchase Order

### Quick Steps
1. Navigate to Purchasing → New PO
2. Select supplier
3. Add line items
4. Submit for approval

[Concise steps assuming familiarity]
```

**For System Administrators**:
```markdown
## Purchase Order Workflow Configuration

Configure PO approval routing using these parameters:
- Threshold amounts by organizational level
- Multi-tier approval hierarchy
- Escalation rules and timeout policies
- Integration with budget control module

[Technical configuration details]
```

### 5. Maintenance and Currency

**Principle**: Keep documentation accurate and up-to-date as the system evolves.

**Implementation**:
- Date stamp major updates
- Version information for significant changes
- Deprecation notices for retired features
- Clear migration paths for changes

**Update Patterns**:
```markdown
---
title: "Purchase Order Processing"
last_updated: "2024-11-25"
version: "2.5"
---

{{< callout type="info" >}}
**Updated in Version 2.5**: New approval workflow engine provides
multi-level routing. See [migration guide](/guides/purchasing-guides/approval-migration/).
{{< /callout >}}

{{< callout type="warning" >}}
**Deprecated**: Legacy PO approval in version 2.0 is no longer supported.
Please migrate to the new workflow engine.
{{< /callout >}}
```

## Content Quality Standards

### Writing Guidelines

**Clarity**:
- Use simple, direct language
- Avoid jargon; define technical terms
- One idea per paragraph
- Active voice preferred

**Completeness**:
- All prerequisites stated
- Expected outcomes clear
- Success criteria defined
- Related content linked

**Accuracy**:
- Tested procedures
- Current screenshots
- Verified field names
- Correct navigation paths

**Accessibility**:
- Alt text for images
- Descriptive link text
- Keyboard shortcuts included
- Screen reader friendly

### Screenshot Guidelines

**When to Include Screenshots**:
- Complex interfaces
- Visual confirmation needed
- Multiple UI elements involved
- First-time user orientation

**Screenshot Best Practices**:
- Highlight relevant areas with arrows or boxes
- Use consistent styling for annotations
- Keep screenshots current with UI
- Include just enough context
- Annotate in English (primary language)

### Example Quality Standards

**High-Quality Guide Example**:
```markdown
## Creating a Purchase Order

### Overview
This guide walks you through creating a purchase order from initial
requisition to vendor transmission. Estimated time: 10 minutes.

### Prerequisites
- Supplier configured in [Supplier Maintenance](/applets/supplier-maintenance-applet/)
- Items set up in [Inventory Items](/applets/inv-item-maintenance-applet/)
- User role: Purchaser or Administrator
- Required permission: CREATE_PURCHASE_ORDER

### Step 1: Create Purchase Requisition
1. Navigate to **Purchasing** > **Requisitions** > **New**
2. Select **Requisition Date**: [today's date]
3. Choose **Requesting Department** from dropdown
4. Click **Save Draft**

[Screenshot showing requisition form with annotations]

### Step 2: Add Line Items
[Detailed steps...]

### Expected Outcome
✅ Purchase order created with status "Pending Approval"
✅ Notification sent to approver
✅ PO number generated in format: PO-2024-00123

### Troubleshooting
**Issue**: Supplier not available in dropdown
**Solution**: Verify supplier is Active in [Supplier Maintenance](/applets/supplier-maintenance-applet/)

### Related Guides
- [Supplier Setup](/guides/purchasing-guides/supplier-setup/)
- [Approval Workflow](/guides/purchasing-guides/approval-configuration/)
```

## Module-Specific Guidelines

### Purchasing Guides

**Content Structure**:
```
/guides/purchasing-guides/
├── _index.md (Overview and navigation)
├── supplier-setup.md (Vendor onboarding workflow)
├── purchase-requisition-workflow.md (Requisition process)
├── purchase-order-workflow.md (PO creation to receipt)
├── goods-receipt-process.md (Receiving procedures)
├── three-way-matching.md (Invoice matching workflow)
├── supplier-performance.md (Evaluation and scorecarding)
└── procurement-analytics.md (Reporting and insights)
```

**Key Workflows**:
- Supplier onboarding and qualification
- Purchase requisition approval
- Purchase order processing
- Goods receipt and inspection
- Three-way matching
- Supplier performance management

### Sales Guides

**Content Structure**:
```
/guides/sales-guides/
├── _index.md (Overview and navigation)
├── customer-setup.md (Customer onboarding)
├── lead-management-workflow.md (Lead to opportunity)
├── quotation-process.md (Quote generation)
├── sales-order-workflow.md (Order processing)
├── pricing-and-discounts.md (Price management)
├── customer-service.md (Support workflows)
└── sales-analytics.md (Performance reporting)
```

**Key Workflows**:
- Customer onboarding
- Lead to opportunity conversion
- Quotation creation and approval
- Sales order processing
- Pricing and discount management
- Customer service ticketing

### Accounting Guides

**Existing Structure**:
```
/guides/accounting-guides/
├── _index.md
├── chart-of-accounts-setup.md
├── journal-entries.md
├── financial-reporting.md
└── bank-reconciliation-guide.md
```

**Maintain Consistency**: Follow established patterns for new accounting guides.

### Inventory Guides

**Existing Structure**:
```
/guides/inventory-guides/
├── _index.md
├── stock-management.md
└── stock-transfer.md
```

**Expansion Opportunities**: Additional guides for cycle counting, valuation, adjustments.

## Implementation Checklist

When creating new content, verify:

### Module Documentation
- [ ] Clear business value proposition
- [ ] Comprehensive feature list
- [ ] List of core applets used (with links)
- [ ] High-level process flows
- [ ] Integration capabilities defined
- [ ] Implementation approach outlined
- [ ] Links to relevant Guides
- [ ] Links to User Guide sections
- [ ] Common use cases included

### Guide Documentation
- [ ] Clear overview and purpose
- [ ] Prerequisites listed
- [ ] Step-by-step procedures
- [ ] Screenshots for complex steps
- [ ] Expected outcomes defined
- [ ] Troubleshooting section
- [ ] Links to relevant Modules
- [ ] Links to related Guides
- [ ] Links to User Guide tasks

### User Guide Documentation
- [ ] Task-focused title
- [ ] Quick steps section
- [ ] Detailed instructions
- [ ] Efficiency tips
- [ ] Links to full Guides
- [ ] Related tasks linked
- [ ] Role-appropriate content

### Applet Documentation
- [ ] Clear purpose statement
- [ ] "Used By" module list
- [ ] Complete field reference
- [ ] Configuration instructions
- [ ] Permissions documented
- [ ] Integration details
- [ ] Links to related Applets

## Content Governance

### Review Process

**Before Publishing**:
1. Verify content layer appropriateness
2. Check for duplication
3. Validate all links
4. Test all procedures
5. Verify screenshots current
6. Check for broken cross-references

### Maintenance Schedule

**Regular Reviews**:
- **Monthly**: Check for broken links
- **Quarterly**: Update screenshots for UI changes
- **Major Releases**: Review all related content
- **Annually**: Comprehensive content audit

### Deprecation Process

When features change or retire:
1. Add deprecation notice with timeline
2. Provide migration path
3. Update all cross-references
4. Archive old content (don't delete)
5. Redirect to new content when possible

## FAQ

### Q: Should I put this in Modules or Guides?
**A**: If it's describing **what** the system can do and **why** it's valuable → Modules. If it's showing **how** to accomplish a complete workflow → Guides.

### Q: When should I create a new Guide vs adding to User Guide?
**A**: Create a Guide for multi-step workflows taking >15 minutes. Add to User Guide for routine tasks taking <15 minutes.

### Q: How do I avoid duplicating applet information?
**A**: Maintain all applet details in `/applets/`. Link to applet docs from Modules, Guides, and User Guide. Only provide minimal context before linking.

### Q: Can an applet belong to multiple modules?
**A**: Yes! Applets are reusable components. Maintain ONE source of truth in `/applets/` and have multiple modules link to it in their "Core Applets" or "Shared Dependencies" sections.

### Q: Should I include field definitions in my Guide?
**A**: No. Link to the applet documentation for field definitions. Your Guide should focus on the workflow and when to use specific fields, not exhaustively define them.

### Q: How detailed should Module documentation be?
**A**: Strategic overview level. Think "executive summary" - what it does, why it matters, key capabilities. Save procedural details for Guides.

### Q: What if a workflow spans multiple modules?
**A**: Put it in Guides with a clear overview explaining which modules are involved. Link to each module's documentation for feature details.

### Q: How do I organize role-specific content?
**A**: Use User Guide for role-specific daily tasks. Use Guides for complete workflows regardless of role. Modules describe capabilities available to all roles.

## Summary

**Remember the hierarchy**:
1. **Modules** = WHAT (capabilities and features)
2. **Guides** = HOW (complete workflows)
3. **User Guide** = QUICK (daily operations)
4. **Applets** = REFERENCE (detailed specifications)

**Golden Rules**:
- Never duplicate content across layers
- Always link to the single source of truth
- Match content depth to audience expertise
- Organize by user tasks, not system structure
- Keep documentation current and tested

Following these guidelines ensures:
- Users find what they need quickly
- Information is accurate and consistent
- Maintenance burden is minimized
- Different audiences get appropriate content depth

---

*For questions about content strategy, contact the documentation team or refer to the BigLedger Documentation Standards.*
