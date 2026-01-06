---
title: Manufacturing
description: Production planning, shop floor execution, and quality management for discrete and process manufacturing
tags:
- manufacturing
- production
- mrp
- job-orders
- shop-floor
weight: 60
---

## Overview

The BigLedger Manufacturing module provides end-to-end production management—from customer demand through factory floor execution to finished goods. Built around a connected applet ecosystem, it delivers complete traceability, real-time visibility, and accurate costing for discrete, process, and mixed-mode manufacturing environments.

{{< callout type="info" >}}
**Core Philosophy**: BigLedger Manufacturing uses a three-stage approach: **Configure** (Process Maintenance) → **Plan** (Production Planning & Monitoring) → **Execute** (Manufacturing Operations). Each stage has dedicated applets that work together seamlessly.
{{< /callout >}}

## Manufacturing Applet Ecosystem

The Manufacturing module is powered by three interconnected applets:

{{< cards >}}
  {{< card link="/applets/process-maintenance-applet/" title="Process Maintenance Applet" subtitle="Configure machines, processes, and production recipes" >}}
  {{< card link="/applets/production-planning-and-monitoring-applet/" title="Production Planning & Monitoring Applet" subtitle="Create job orders and manage production demand" >}}
  {{< card link="/applets/manufacturing-operation-applet/" title="Manufacturing Operations Applet" subtitle="Execute production and record shop floor activities" >}}
{{< /cards >}}

### How They Work Together

```
Process Maintenance (Configuration)
    │
    ├── Machines: Define production equipment
    ├── Process Types: Categorize operations with sequence
    ├── Process Templates: Individual steps with inputs/outputs
    └── Job Templates: Complete production sequences
            │
            ▼
Production Planning & Monitoring (Planning)
    │
    ├── Production Requests: Auto-generated from Sales Orders
    ├── Job Orders: Formal manufacturing instructions
    ├── Process Instances: Generated from Job Templates
    └── Sales Order Linking: Make-to-Order traceability
            │
            ▼
Manufacturing Operations (Execution)
    │
    ├── Work Queue: Prioritized operator task lists
    ├── Work Logs: Time, materials, measurements
    ├── Material Consumption: Bin-level traceability
    └── Output Recording: Finished goods creation
            │
            ▼
Internal Packing → Inventory → Sales Fulfillment
```

## Key Capabilities

### Production Planning

**Demand-Driven Manufacturing**
- Production Requests auto-generated from confirmed Sales Orders
- Outstanding Production Reports for capacity planning
- Net demand calculation (requested minus available stock)
- Make-to-Order and Make-to-Stock support in the same Job Order

**Job Order Management**
- Formal manufacturing instructions with complete specifications
- Job Templates define standard production sequences
- Process Instance generation expands templates into executable steps
- Sales Order linking for complete customer traceability

**Priority and Scheduling**
- High Priority flags for urgent work
- Supervisor-controlled priority ranking
- Real-time status visibility across all Job Orders
- Delivery date tracking for customer commitments

### Bill of Materials (Process Templates)

**Input/Output Definitions**
- Define materials consumed (inputs) and products created (outputs)
- Ratio-based quantity relationships (e.g., 4 legs → 1 table)
- Multi-level production sequences through Job Templates
- Waste and scrap factors built into material ratios

**Production Routing**
- Process Types define operation categories with sequence numbers
- Machine assignments with default equipment selection
- Multiple Options for production variations (standard vs. premium)
- Process Groups combine templates into complete recipes

**Version Control**
- Job Templates can have multiple Options for different production routes
- Process Templates updated independently without affecting active Job Orders
- Historical Job Orders retain original specifications

### Shop Floor Control

**Work Queue Management**
- Operators see prioritized task lists
- Claim jobs to begin work
- Status progression: Claim → In Progress → Pending Approval → Ready

**Work Log Recording**
- Start/End time tracking for labor costing
- Bin-level material selection for traceability
- Measurement recording (dimensions, specifications)
- Quantity produced with automatic discrepancy calculation

**Supervisor Oversight**
- Review and approve completed work
- Status management (Complete, On Hold, Cancelled)
- Quality gate before transfer to packing
- Real-time production monitoring

### Quality Management

**Built-in Quality Gates**
- Supervisor approval required before process completion
- Measurement recording at each production step
- Discrepancy tracking (planned vs. actual output)
- On Hold status for quality issues

**Traceability**
- Bin-level material tracking from raw materials to finished goods
- Complete genealogy: which materials went into which products
- Work Log history for audit and compliance
- Operator and supervisor accountability

### Costing and Analysis

**Accurate Product Costing**
- Material consumption based on actual bin usage
- Labor time captured through Work Logs
- Machine utilization tracking
- Variance analysis (planned vs. actual)

**Production Analytics**
- Outstanding Production Reports for demand visibility
- Completion rates and efficiency metrics
- Yield tracking (actual vs. expected output)
- Bottleneck identification by process type or machine

## Manufacturing Types Supported

### Discrete Manufacturing
- Assembly-based production with defined BOMs
- Job Order per production run
- Component tracking and assembly sequences
- Ideal for: furniture, electronics, machinery

### Process Manufacturing
- Formula and recipe-based production
- Batch processing with yield variations
- Input/output ratio management
- Ideal for: cables, chemicals, food processing

### Make-to-Order
- Production linked directly to customer Sales Orders
- Complete traceability from order to delivery
- Delivery date tracking and customer communication
- Split large orders across multiple Job Orders

### Make-to-Stock
- Forecast-based production for inventory
- Ad Hoc quantities in Job Orders
- Safety stock building during production runs
- Combine with Make-to-Order in same Job Order

### Mixed Mode
- Hybrid approach combining multiple strategies
- Same Job Order can serve customer orders and build stock
- Flexible production planning for varying demand patterns

## User Roles and Responsibilities

| Role | Primary Applet | Key Responsibilities |
|------|----------------|---------------------|
| **System Administrator** | Process Maintenance | Machine setup, Process Type configuration |
| **Production Engineer** | Process Maintenance | Process Templates, Job Templates, material ratios |
| **Production Planner** | Production Planning & Monitoring | Job Order creation, demand management, scheduling |
| **Sales Coordinator** | Production Planning & Monitoring | Customer order status, delivery estimates |
| **Production Supervisor** | Manufacturing Operations | Priority setting, work approval, quality gates |
| **Machine Operator** | Manufacturing Operations | Job execution, Work Log recording, material consumption |

## Integration Points

### Sales Module
- Sales Orders generate Production Requests automatically
- Make-to-Order linking provides customer traceability
- Production status visible to Sales team
- Delivery date tracking and communication

### Inventory Module
- Material availability checked during Job Order creation
- Real-time inventory updates during production
- Bin-level consumption tracking
- Finished goods creation updates stock

### Procurement Module
- Outstanding Production Reports inform material purchasing
- Input Summary shows material requirements before release
- Coordinate procurement with production schedules

### Financial Accounting
- Material consumption drives cost of goods
- Labor time feeds into product costing
- Variance analysis for cost control
- Work-in-progress tracking

## Getting Started

### Phase 1: Configuration (Process Maintenance)

1. **Define Machines**
   - Create entries for all production equipment
   - Use consistent naming conventions
   - Categorize as Production or Packing machines

2. **Create Process Types**
   - Define operation categories (Cutting, Assembly, Testing, etc.)
   - Assign sequence numbers with gaps (10, 20, 30)
   - Mark independent processes if needed

3. **Build Process Templates**
   - Create templates for each manufacturing step
   - Define input items with consumption ratios
   - Define output items with production ratios
   - Assign capable machines with defaults

4. **Assemble Job Templates**
   - Select finished product as output item
   - Choose Process Templates for production sequence
   - Create Process Groups for use in planning

### Phase 2: Planning (Production Planning & Monitoring)

1. **Review Production Requests**
   - Check incoming demand from Sales Orders
   - Approve, Reject, or Mark as Existing Stock
   - Generate Outstanding Reports for capacity planning

2. **Create Job Orders**
   - Select item and Job Template
   - Generate Process Instances
   - Link to Sales Orders (Make-to-Order) or enter Ad Hoc quantities
   - Set priorities and release to factory floor

### Phase 3: Execution (Manufacturing Operations)

1. **Supervisor Setup**
   - Set job priorities in Supervisor PI
   - Assign work to operators

2. **Operator Execution**
   - Claim jobs from Work Queue
   - Create Work Logs with time, materials, measurements
   - Record output quantities

3. **Supervisor Approval**
   - Review completed Work Logs
   - Approve and mark as Ready
   - Transfer to Internal Packing

## Best Practices

### Configuration Excellence
- Verify input/output ratios with production team before going live
- Use consistent naming conventions across all elements
- Document machine specifications with attachments
- Test with small batches before full production

### Planning Efficiency
- Generate Outstanding Reports daily for high-volume operations
- Check material availability before releasing Job Orders
- Use hybrid Make-to-Order/Make-to-Stock for batch efficiency
- Communicate realistic delivery dates to Sales

### Execution Accuracy
- Always select correct bins for material traceability
- Record accurate start/end times for labor costing
- Enter measurements at required checkpoints
- Report discrepancies immediately

### Quality Assurance
- Supervisors must review all Work Logs before approval
- Use On Hold status for quality issues
- Maintain complete documentation for audit trails
- Regular ratio verification against actual consumption

## Related Documentation

### Applet Guides
- **[Process Maintenance Applet](/applets/process-maintenance-applet/)** - Complete configuration guide
- **[Production Planning & Monitoring Applet](/applets/production-planning-and-monitoring-applet/)** - Planning and Job Order management
- **[Manufacturing Operations Applet](/applets/manufacturing-operation-applet/)** - Shop floor execution guide

### Supporting Applets
- **[Inventory Item Maintenance](/applets/inv-item-maintenance-applet/)** - Product master data
- **[Stock Balance Applet](/applets/stock-balance-applet/)** - Real-time inventory tracking
- **[Internal Stock Adjustment](/applets/internal-stock-adjustment-applet/)** - Inventory corrections

### Module Integration
- **[Inventory Module](/modules/inventory/)** - Stock management and warehouse operations
- **[Sales Module](/modules/sales/)** - Order management and customer fulfillment
- **[Procurement Module](/modules/procurement/)** - Purchasing and supplier management

{{< callout type="info" >}}
**Need Help?** For implementation assistance or questions about the Manufacturing module, visit our [Support Center](/support/) or contact our technical team.
{{< /callout >}}