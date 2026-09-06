---
title: "Manufacturing Industry Demo"
description: "Comprehensive manufacturing workflows including BOM management, production planning, quality control, and cost analysis"
weight: 20
bookCollapseSection: false
draft: true  # unpublished 2026-09-06 (Vincent): see planning/reviews/ guides audit — substantially invented, or unreachable from navigation
---

Experience BigLedger's manufacturing capabilities through realistic production scenarios. This demo covers the complete manufacturing lifecycle from BOM setup to finished goods delivery.

{{< hextra/hero-badge >}}
  🏭 Manufacturing-Focused Scenarios
{{< /hextra/hero-badge >}}

{{< hextra/hero-headline >}}
  Master Production Operations with BigLedger
{{< /hextra/hero-headline >}}

{{< hextra/hero-subtitle >}}
  Production planning, BOM management, quality control, and cost optimization workflows
{{< /hextra/hero-subtitle >}}

## 🎯 Manufacturing Demo Overview

This comprehensive demo guides you through key manufacturing processes using realistic scenarios from **AcmeMfg Industries**, a mid-sized manufacturer producing electronic components and assemblies.

### Demo Company Profile: AcmeMfg Industries

- **Products**: Electronic components, circuit boards, and automotive sensors
- **Production Types**: Make-to-order and make-to-stock
- **Locations**: Main factory, sub-assembly plant, and warehouse
- **Key Challenges**: Lead time optimization, quality compliance, cost control

{{< hextra/hero-button text="Launch Manufacturing Demo" link="https://demo-v1.bigledger.com" >}}

---

## 🔧 Manufacturing Workflows Covered

{{< cards >}}
  {{< card link="#bom-setup" title="BOM Management" subtitle="Multi-level BOMs, version control, and material planning" >}}
  {{< card link="#production-planning" title="Production Planning" subtitle="MRP runs, capacity planning, and order scheduling" >}}
  {{< card link="#work-orders" title="Work Order Management" subtitle="Job creation, tracking, and completion workflows" >}}
  {{< card link="#quality-control" title="Quality Control" subtitle="Inspection procedures, testing protocols, and compliance" >}}
  {{< card link="#inventory-valuation" title="Inventory & Costing" subtitle="FIFO/LIFO valuation, standard costing, and variance analysis" >}}
  {{< card link="#subcontracting" title="Subcontracting" subtitle="Outsourced operations and vendor management" >}}
{{< /cards >}}

---

## 📋 Prerequisites and Setup

### Demo Account Access

{{< tabs items="Login Details,Test Data,Sample Products" >}}
  {{< tab >}}
  **Access the Demo Environment**

  - **URL**: demo-v1.bigledger.com
  - **Username**: demo-mfg (Manufacturing Manager)
  - **Password**: Demo2025!
  - **Company**: AcmeMfg Industries

  This account has full access to manufacturing modules and pre-configured sample data.
  {{< /tab >}}

  {{< tab >}}
  **Pre-loaded Test Data**

  - **Raw Materials**: 50+ components (resistors, capacitors, chips)
  - **Work Centers**: Assembly line, SMT line, Testing station
  - **BOMs**: Multi-level structures for 5 main products
  - **Vendors**: 15 suppliers with lead times and pricing
  - **Customers**: 20 customers with production orders
  {{< /tab >}}

  {{< tab >}}
  **Sample Products**

  - **AC-SENSOR-001**: Automotive temperature sensor
  - **PC-BOARD-LCD**: LCD display circuit board
  - **SW-MODULE-RF**: RF communication module
  - **CABLE-HARNESS**: Wire harness assembly
  - **HOUSING-ALU**: Aluminum housing unit
  {{< /tab >}}
{{< /tabs >}}

### Navigation Quick Reference

{{< callout type="info" >}}
**Manufacturing Menu Locations**:
- **Production** → Manufacturing → Production Orders
- **BOM** → Manufacturing → Bill of Materials
- **MRP** → Planning → Material Requirements Planning
- **Quality** → Manufacturing → Quality Control
- **Costing** → Accounting → Product Costing
{{< /callout >}}

---

## 🔨 Workflow 1: BOM Management {#bom-setup}

Learn to create and manage multi-level Bills of Materials with version control and engineering change management.

### Scenario: Creating BOM for AC-SENSOR-001

**Objective**: Set up a complete BOM structure for the automotive temperature sensor including sub-assemblies and routing operations.

**Expected Outcome**: A validated multi-level BOM ready for production planning and costing.

### Step-by-Step Instructions

{{< tabs items="Setup,Components,Routing,Validation" >}}
  {{< tab >}}
  **1. Access BOM Management**

  1. Login to demo environment
  2. Navigate to **Manufacturing** → **Bill of Materials**
  3. Click **+ New BOM**
  4. Select **Product**: AC-SENSOR-001
  5. Set **BOM Type**: Manufacturing
  6. Enter **Version**: V1.0
  7. Set **Effective Date**: Current date

  **Expected Result**: New BOM header created with product details loaded.
  {{< /tab >}}

  {{< tab >}}
  **2. Add BOM Components**

  **Main Assembly Components**:
  1. Click **Add Component**
  2. Add these items with quantities:
     - Sensor chip (IC-TEMP-DS18): 1 EA
     - PCB board (PCB-SENSOR-01): 1 EA
     - Resistor 10K (R-10K-0805): 2 EA
     - Capacitor 100nF (C-100N-0805): 1 EA
     - Connector 3-pin (CON-3PIN-JST): 1 EA
     - Housing plastic (HSG-PLAST-01): 1 EA

  3. Set **Unit of Measure** for each component
  4. Define **Scrap %** (typically 2-5% for electronics)
  5. Set **Lead Time** for each component

  **Expected Result**: Complete component list with quantities and specifications.
  {{< /tab >}}

  {{< tab >}}
  **3. Define Routing Operations**

  1. Click **Routing** tab
  2. Add these operations in sequence:
     - **Op 10**: SMT Assembly (Work Center: SMT-LINE-01)
     - **Op 20**: Through-hole insertion (Work Center: ASSEMBLY-01)
     - **Op 30**: Soldering (Work Center: SOLDER-01)
     - **Op 40**: Testing (Work Center: TEST-STATION-01)
     - **Op 50**: Housing assembly (Work Center: ASSEMBLY-02)
     - **Op 60**: Final inspection (Work Center: QC-STATION-01)

  3. Set **Setup Time** and **Run Time** for each operation
  4. Define **Labor Cost** and **Machine Cost** rates

  **Expected Result**: Complete routing with time standards and cost information.
  {{< /tab >}}

  {{< tab >}}
  **4. BOM Validation**

  1. Click **Validate BOM**
  2. System checks:
     - Component availability
     - Vendor sources
     - Cost completeness
     - Routing consistency

  3. Review validation results
  4. Fix any warnings or errors
  5. Click **Approve BOM**
  6. Set status to **Active**

  **Expected Result**: Validated and approved BOM ready for production use.
  {{< /tab >}}
{{< /tabs >}}

### Tips and Best Practices

{{< callout type="tip" >}}
**BOM Management Tips**:
- Use descriptive component descriptions including specifications
- Maintain component substitution lists for flexibility
- Set up engineering change control for BOM revisions
- Include scrap factors based on historical data
- Regular review and update of lead times
{{< /callout >}}

### Common Issues and Solutions

| Issue | Cause | Solution |
|-------|-------|----------|
| Component not found | Missing item master | Create item master first in Inventory module |
| Circular BOM reference | Component references parent | Check BOM structure for loops |
| Costing incomplete | Missing cost data | Update standard costs in item master |
| Routing validation fails | Work center not defined | Set up work centers in Manufacturing setup |

---

## 📊 Workflow 2: Production Planning and MRP {#production-planning}

Master Materials Requirements Planning (MRP) to optimize production schedules and inventory levels.

### Scenario: Planning Production for Monthly Orders

**Objective**: Run MRP to generate purchase recommendations and production orders for upcoming month's demand.

**Expected Outcome**: Optimized production schedule with material procurement plan.

### Step-by-Step Instructions

{{< tabs items="Demand Setup,MRP Run,Analysis,Actions" >}}
  {{< tab >}}
  **1. Set Up Demand Sources**

  1. Navigate to **Planning** → **Demand Management**
  2. Review **Sales Orders** requiring production:
     - SO-2025-001: 100 units AC-SENSOR-001 (Due: Week 2)
     - SO-2025-002: 50 units PC-BOARD-LCD (Due: Week 3)
     - SO-2025-003: 200 units SW-MODULE-RF (Due: Week 4)

  3. Check **Forecast Demand**:
     - Click **Demand Forecast**
     - Review forecasted quantities by product
     - Adjust forecast if needed

  4. Verify **Safety Stock Levels**:
     - Go to **Inventory** → **Item Master**
     - Check safety stock settings for finished goods

  **Expected Result**: Complete demand picture including firm orders and forecasts.
  {{< /tab >}}

  {{< tab >}}
  **2. Execute MRP Run**

  1. Navigate to **Planning** → **MRP Planning**
  2. Click **New MRP Run**
  3. Set **Planning Parameters**:
     - Planning Horizon: 12 weeks
     - Bucket Size: Weekly
     - Include Safety Stock: Yes
     - Consider Work Calendar: Yes

  4. Select **Products to Plan**:
     - All finished goods
     - Key sub-assemblies
     - Critical raw materials

  5. Click **Run MRP**
  6. Monitor progress in **MRP Run Status**

  **Expected Result**: Completed MRP run with supply recommendations generated.
  {{< /tab >}}

  {{< tab >}}
  **3. Analyze MRP Results**

  1. Open **MRP Results Dashboard**
  2. Review **Exception Messages**:
     - Late orders
     - Capacity constraints
     - Material shortages
     - Policy violations

  3. Check **Planned Orders**:
     - Production orders to be created
     - Purchase orders needed
     - Timing and quantities

  4. Review **Capacity Analysis**:
     - Work center loading
     - Bottleneck identification
     - Overtime requirements

  **Expected Result**: Clear understanding of production requirements and constraints.
  {{< /tab >}}

  {{< tab >}}
  **4. Take Planning Actions**

  **Create Production Orders**:
  1. Select planned production orders
  2. Click **Create Production Orders**
  3. Review and confirm order details
  4. Set priority levels

  **Generate Purchase Requisitions**:
  1. Select material requirements
  2. Click **Create Purchase Requisitions**
  3. Assign to appropriate buyers
  4. Set required delivery dates

  **Handle Exceptions**:
  1. Review capacity overloads
  2. Reschedule non-critical orders
  3. Consider subcontracting options
  4. Adjust safety stock if needed

  **Expected Result**: Actionable production and procurement plan ready for execution.
  {{< /tab >}}
{{< /tabs >}}

### Advanced MRP Features

{{< callout type="info" >}}
**MRP Planning Options**:
- **Net Change MRP**: Only recalculate changed items
- **Regenerative MRP**: Full recalculation of all items
- **Finite Capacity Planning**: Consider work center constraints
- **Multi-site Planning**: Plan across multiple locations
{{< /callout >}}

---

## 🏗️ Workflow 3: Work Order Management {#work-orders}

Learn to create, track, and complete production work orders with material and labor tracking.

### Scenario: Processing Production Order for AC-SENSOR-001

**Objective**: Execute complete work order lifecycle from creation to goods receipt.

**Expected Outcome**: Finished goods produced and moved to inventory with accurate cost tracking.

### Step-by-Step Instructions

{{< tabs items="Creation,Material Issue,Production,Completion" >}}
  {{< tab >}}
  **1. Create Work Order**

  1. Navigate to **Manufacturing** → **Production Orders**
  2. Click **+ New Production Order**
  3. Enter order details:
     - **Product**: AC-SENSOR-001
     - **Quantity**: 100 units
     - **Due Date**: Next Friday
     - **Priority**: Normal

  4. System auto-populates:
     - BOM components
     - Routing operations
     - Standard costs

  5. Review and confirm order
  6. Click **Release Order**
  7. Order status changes to **Released**

  **Expected Result**: Work order created and ready for material planning.
  {{< /tab >}}

  {{< tab >}}
  **2. Material Issue Process**

  **Issue Materials to Production**:
  1. Click **Issue Materials** from work order
  2. Review material requirements:
     - Quantity needed vs available
     - Batch/serial requirements
     - Expiry date checks

  3. For each component:
     - Select stock location
     - Choose specific batches if required
     - Confirm quantities

  4. Click **Issue All Materials**
  5. System updates:
     - Inventory balances
     - Work order status
     - Material costs

  **Expected Result**: All materials allocated to production order.
  {{< /tab >}}

  {{< tab >}}
  **3. Production Tracking**

  **Operation Reporting**:
  1. Go to **Shop Floor** → **Operation Reporting**
  2. Select work order and operation
  3. Report production progress:
     - **Quantity completed**: Enter actual production
     - **Labor hours**: Record actual time spent
     - **Machine hours**: Log equipment usage
     - **Defects**: Record any quality issues

  4. For each operation (Op 10-60):
     - Start operation
     - Record completion
     - Move to next operation

  5. System tracks:
     - Real-time progress
     - Actual vs standard costs
     - Efficiency calculations

  **Expected Result**: Complete production tracking with cost accumulation.
  {{< /tab >}}

  {{< tab >}}
  **4. Order Completion**

  **Final Steps**:
  1. Complete final operation (Op 60)
  2. Record final inspection results
  3. Click **Complete Order**
  4. Choose completion type:
     - **Full completion**: All quantities produced
     - **Partial completion**: Some quantity variance

  5. **Goods Receipt**:
     - Specify storage location
     - Generate batch/serial numbers
     - Update inventory balances
     - Calculate final product cost

  6. **Order Closing**:
     - Review cost variances
     - Close remaining material issues
     - Update production statistics
     - Archive order documents

  **Expected Result**: Finished goods in inventory with accurate standard cost.
  {{< /tab >}}
{{< /tabs >}}

### Production Monitoring Dashboard

{{< callout type="tip" >}}
**Real-time Production Metrics**:
- Work order completion percentage
- Current operation status
- Labor efficiency by work center
- Material consumption vs planned
- Quality reject rates
- On-time delivery performance
{{< /callout >}}

---

## 🔍 Workflow 4: Quality Control Management {#quality-control}

Implement comprehensive quality management including incoming inspection, in-process testing, and final inspection.

### Scenario: Quality Control for Electronic Components

**Objective**: Execute complete quality workflow from incoming material inspection to final product certification.

**Expected Outcome**: Quality records maintained with full traceability and compliance documentation.

### Step-by-Step Instructions

{{< tabs items="Incoming QC,In-Process,Final Inspection,Certificates" >}}
  {{< tab >}}
  **1. Incoming Material Inspection**

  **Setup Inspection Plans**:
  1. Navigate to **Quality** → **Inspection Plans**
  2. Create plan for **IC-TEMP-DS18** (Temperature sensor chip)
  3. Define inspection criteria:
     - **Visual inspection**: Packaging integrity
     - **Electrical test**: Resistance measurement
     - **Functional test**: Temperature accuracy
     - **Documentation**: Certificate of compliance

  **Execute Incoming Inspection**:
  1. Go to **Quality** → **Inspection Orders**
  2. Select incoming shipment
  3. Create inspection order
  4. Record test results:
     - Sample size: 10 pieces from batch
     - Pass/fail criteria for each test
     - Measurement data entry

  **Expected Result**: Approved materials ready for production use.
  {{< /tab >}}

  {{< tab >}}
  **2. In-Process Quality Control**

  **Setup Process Checkpoints**:
  1. Define quality checkpoints in routing:
     - **After SMT**: Solder joint inspection
     - **After Assembly**: Dimensional checks
     - **After Testing**: Functional verification

  **Execute In-Process Inspection**:
  1. At each checkpoint:
     - Record operator performing inspection
     - Document measurement results
     - Note any defects found
     - Apply corrective actions

  2. **Statistical Process Control**:
     - Monitor control charts
     - Track process capability
     - Identify trends and patterns
     - Trigger alerts for out-of-control conditions

  **Expected Result**: Process quality monitored and controlled throughout production.
  {{< /tab >}}

  {{< tab >}}
  **3. Final Product Inspection**

  **Comprehensive Final Testing**:
  1. Navigate to **Quality** → **Final Inspection**
  2. Select completed work order
  3. Execute test sequence:
     - **Functional test**: Full operational check
     - **Calibration**: Sensor accuracy verification
     - **Environmental test**: Temperature cycling
     - **Durability test**: Vibration resistance

  **Quality Data Collection**:
  1. Record detailed measurements
  2. Capture test equipment used
  3. Document environmental conditions
  4. Note inspector certification
  5. Generate quality metrics

  **Disposition Decision**:
  - **Accept**: Move to finished goods
  - **Reject**: Return to rework
  - **Hold**: Pending further evaluation

  **Expected Result**: Quality-assured products ready for shipment.
  {{< /tab >}}

  {{< tab >}}
  **4. Quality Certificates and Traceability**

  **Generate Certificates**:
  1. Go to **Quality** → **Certificates**
  2. Select products for certification
  3. Generate **Certificate of Compliance**:
     - Product specifications met
     - Test results summary
     - Quality system compliance
     - Authorized signatures

  **Traceability Documentation**:
  1. **Material Traceability**:
     - Component batch numbers
     - Supplier information
     - Receipt dates

  2. **Process Traceability**:
     - Production order details
     - Operator records
     - Equipment used
     - Process parameters

  **Compliance Reporting**:
  - Monthly quality metrics
  - Customer quality reports
  - Regulatory compliance documentation
  - Corrective action tracking

  **Expected Result**: Complete quality documentation package for customer delivery.
  {{< /tab >}}
{{< /tabs >}}

### Quality Control Best Practices

{{< callout type="warning" >}}
**Critical Quality Points**:
- Never skip incoming inspection for critical components
- Maintain calibration records for all test equipment
- Document all quality decisions with justification
- Implement statistical sampling plans for efficiency
- Regular review and update of inspection plans
{{< /callout >}}

---

## 💰 Workflow 5: Inventory Valuation and Cost Analysis {#inventory-valuation}

Master inventory costing methods and production cost analysis for accurate financial reporting.

### Scenario: Month-End Cost Analysis and Valuation

**Objective**: Execute month-end costing procedures including inventory valuation, variance analysis, and cost reporting.

**Expected Outcome**: Accurate product costs and inventory valuation for financial statements.

### Step-by-Step Instructions

{{< tabs items="Costing Methods,Variance Analysis,Inventory Valuation,Cost Reports" >}}
  {{< tab >}}
  **1. Configure Costing Methods**

  **Standard Costing Setup**:
  1. Navigate to **Accounting** → **Product Costing**
  2. Select product **AC-SENSOR-001**
  3. Set up **Standard Cost Elements**:
     - **Material Cost**: $12.50 (from BOM)
     - **Labor Cost**: $3.20 (from routing)
     - **Overhead Cost**: $2.80 (allocated)
     - **Total Standard**: $18.50

  **FIFO/LIFO Configuration**:
  1. Go to **Inventory** → **Valuation Methods**
  2. Set raw materials to **FIFO**
  3. Set finished goods to **Standard Cost**
  4. Configure work-in-process to **Actual Cost**

  **Cost Roll-up Process**:
  1. Run **Cost Roll-up** calculation
  2. Update standard costs quarterly
  3. Review and approve cost changes

  **Expected Result**: Consistent costing methodology across all products.
  {{< /tab >}}

  {{< tab >}}
  **2. Production Variance Analysis**

  **Collect Actual Costs**:
  1. Navigate to **Manufacturing** → **Cost Analysis**
  2. Select completed work orders
  3. Review actual costs vs standard:
     - **Material Usage**: Actual vs BOM quantities
     - **Labor Efficiency**: Actual vs standard hours
     - **Overhead Absorption**: Applied vs actual

  **Calculate Variances**:
  1. **Material Variances**:
     - Price variance: (Actual price - Standard price) × Actual quantity
     - Usage variance: (Actual quantity - Standard quantity) × Standard price

  2. **Labor Variances**:
     - Rate variance: (Actual rate - Standard rate) × Actual hours
     - Efficiency variance: (Actual hours - Standard hours) × Standard rate

  3. **Overhead Variances**:
     - Spending variance: Actual overhead - Budgeted overhead
     - Volume variance: Applied overhead - Budgeted overhead

  **Expected Result**: Detailed variance analysis with root cause identification.
  {{< /tab >}}

  {{< tab >}}
  **3. Inventory Valuation Process**

  **Physical Inventory Count**:
  1. Go to **Inventory** → **Physical Count**
  2. Generate count sheets by location
  3. Execute physical counting
  4. Enter count results
  5. Process count adjustments

  **Inventory Valuation**:
  1. **Raw Materials** (FIFO method):
     - Calculate weighted average cost
     - Apply FIFO cost layers
     - Adjust for obsolescence

  2. **Work in Process**:
     - Material costs issued
     - Labor costs applied
     - Overhead allocation

  3. **Finished Goods** (Standard cost):
     - Standard cost per unit
     - Quantity on hand
     - Obsolescence reserves

  **Valuation Reports**:
  - Inventory aging analysis
  - Slow-moving inventory report
  - Obsolescence assessment
  - Cost trend analysis

  **Expected Result**: Accurate inventory valuation for financial reporting.
  {{< /tab >}}

  {{< tab >}}
  **4. Cost Reporting and Analysis**

  **Product Profitability Analysis**:
  1. Navigate to **Reports** → **Cost Analysis**
  2. Generate **Product Profitability Report**:
     - Sales revenue by product
     - Standard cost of goods sold
     - Gross margin analysis
     - Volume impact analysis

  **Manufacturing Cost Reports**:
  1. **Cost of Production Report**:
     - Total costs by period
     - Cost per unit trends
     - Efficiency metrics

  2. **Variance Summary Report**:
     - Material, labor, overhead variances
     - Variance trends over time
     - Exception analysis

  **Management Dashboards**:
  - Real-time cost metrics
  - Key performance indicators
  - Budget vs actual comparison
  - Profitability by product line

  **Cost Optimization Recommendations**:
  - Identify cost reduction opportunities
  - Process improvement suggestions
  - Supplier cost negotiations
  - Design for manufacturability feedback

  **Expected Result**: Comprehensive cost insights for management decision-making.
  {{< /tab >}}
{{< /tabs >}}

### Advanced Costing Features

{{< callout type="info" >}}
**Cost Management Tools**:
- **Activity-Based Costing**: Allocate overhead based on activities
- **Target Costing**: Set cost targets for new products
- **Life Cycle Costing**: Track costs throughout product lifecycle
- **Cost Simulation**: Model cost impacts of changes
{{< /callout >}}

---

## 🤝 Workflow 6: Subcontracting Operations {#subcontracting}

Manage outsourced manufacturing operations including material supply and service procurement.

### Scenario: Subcontracting SMT Assembly Operations

**Objective**: Outsource SMT (Surface Mount Technology) operations to external vendor while maintaining quality and cost control.

**Expected Outcome**: Efficient subcontracting process with complete visibility and control.

### Step-by-Step Instructions

{{< tabs items="Setup,Purchase Order,Material Transfer,Receiving" >}}
  {{< tab >}}
  **1. Subcontracting Setup**

  **Vendor Configuration**:
  1. Navigate to **Purchasing** → **Vendor Master**
  2. Create/update vendor **SMT-Services-Ltd**
  3. Set vendor type to **Subcontractor**
  4. Configure capabilities:
     - SMT assembly services
     - Testing capabilities
     - Quality certifications
     - Capacity information

  **Service Item Setup**:
  1. Go to **Inventory** → **Item Master**
  2. Create service item **SMT-ASSEMBLY-SERVICE**
  3. Set item type to **Service**
  4. Define cost center allocation
  5. Set standard service rate

  **BOM Configuration**:
  1. Update BOM for **AC-SENSOR-001**
  2. Modify **Operation 10** (SMT Assembly):
     - Set operation type to **Subcontracted**
     - Assign subcontractor vendor
     - Define material consumption at vendor

  **Expected Result**: Complete subcontracting framework configured.
  {{< /tab >}}

  {{< tab >}}
  **2. Create Subcontracting Purchase Order**

  **Generate Subcontracting PO**:
  1. Navigate to **Manufacturing** → **Subcontract Orders**
  2. Click **Create from Work Order**
  3. Select work order for **AC-SENSOR-001**
  4. System generates PO with:
     - Service line: SMT assembly service
     - Material lines: Components to be supplied
     - Delivery schedule
     - Quality requirements

  **PO Details Configuration**:
  1. **Service Line**:
     - Quantity: 100 units
     - Rate: $2.50 per unit
     - Delivery date: Next Wednesday

  2. **Material Lines** (to be supplied):
     - PCB boards: 100 pieces
     - SMT components: Per BOM requirements
     - Delivery location: Vendor facility

  3. **Terms and Conditions**:
     - Quality specifications
     - Inspection requirements
     - Payment terms
     - Return material procedures

  **Expected Result**: Comprehensive subcontracting purchase order ready for approval.
  {{< /tab >}}

  {{< tab >}}
  **3. Material Transfer to Subcontractor**

  **Prepare Material Shipment**:
  1. Navigate to **Inventory** → **Material Transfer**
  2. Create transfer order to vendor location
  3. Include all materials per PO:
     - Verify quantities match requirements
     - Check quality status of materials
     - Generate packing lists

  **Execute Material Issue**:
  1. **Pick Materials**:
     - Generate pick list
     - Reserve inventory
     - Process physical pick

  2. **Quality Check**:
     - Inspect materials before shipment
     - Verify part numbers and quantities
     - Check for damage

  3. **Ship to Vendor**:
     - Create shipping documents
     - Track shipment status
     - Confirm vendor receipt

  **Inventory Impact**:
  - Materials moved to "Consignment at Vendor" location
  - Maintain ownership until consumed
  - Track inventory at vendor facility

  **Expected Result**: Materials delivered to subcontractor with full traceability.
  {{< /tab >}}

  {{< tab >}}
  **4. Receiving and Quality Control**

  **Receive Subcontracted Goods**:
  1. Navigate to **Purchasing** → **Goods Receipt**
  2. Select subcontracting PO
  3. Record receipt details:
     - Quantity received
     - Delivery date and time
     - Vendor delivery note reference
     - Initial visual inspection

  **Quality Inspection**:
  1. **Incoming Inspection**:
     - Create inspection order
     - Execute quality tests per plan
     - Record inspection results
     - Make accept/reject decision

  2. **Service Verification**:
     - Verify work performed per specifications
     - Check assembly quality
     - Validate test results from vendor
     - Document any discrepancies

  **Process Completion**:
  1. **Accept Goods**:
     - Move to appropriate inventory location
     - Update work order progress
     - Trigger next operation

  2. **Invoice Processing**:
     - Match invoice to PO and receipt
     - Verify service charges
     - Process payment

  3. **Cost Allocation**:
     - Allocate service costs to work order
     - Update product standard costs
     - Record actual vs budget variance

  **Expected Result**: Quality subcontracted parts received and ready for next operation.
  {{< /tab >}}
{{< /tabs >}}

### Subcontracting Best Practices

{{< callout type="tip" >}}
**Subcontracting Success Factors**:
- Clear specifications and quality requirements
- Regular vendor performance reviews
- Adequate material planning and delivery
- Strong quality agreements and inspections
- Effective communication and coordination
- Proper cost allocation and variance analysis
{{< /callout >}}

---

## 📈 Manufacturing KPIs and Analytics

Monitor key performance indicators to optimize manufacturing operations.

### Essential Manufacturing Metrics

{{< tabs items="Production KPIs,Quality Metrics,Cost Analysis,Efficiency" >}}
  {{< tab >}}
  **Production Performance**

  **Key Metrics to Track**:
  - **Overall Equipment Effectiveness (OEE)**
    - Availability × Performance × Quality
    - Target: >85% for critical equipment

  - **On-Time Delivery (OTD)**
    - Orders delivered on promised date
    - Target: >95% for customer satisfaction

  - **Production Throughput**
    - Units produced per hour/day
    - Track trends and improvements

  - **Capacity Utilization**
    - Actual production vs planned capacity
    - Identify bottlenecks and constraints

  **Dashboard Access**: Manufacturing → Analytics → Production Dashboard
  {{< /tab >}}

  {{< tab >}}
  **Quality Performance**

  **Quality Metrics**:
  - **First Pass Yield (FPY)**
    - Units passing first time / Total units
    - Target: >98% for manufacturing excellence

  - **Defect Rate**
    - Defects per million opportunities
    - Track by product and process

  - **Customer Returns**
    - Return rate and root causes
    - Cost of quality analysis

  - **Supplier Quality**
    - Incoming inspection results
    - Supplier performance scorecards

  **Access**: Quality → Analytics → Quality Dashboard
  {{< /tab >}}

  {{< tab >}}
  **Cost Analytics**

  **Cost Performance**:
  - **Cost Variance Analysis**
    - Material, labor, overhead variances
    - Monthly trending and analysis

  - **Product Profitability**
    - Gross margin by product
    - Product mix optimization

  - **Inventory Turns**
    - Inventory turnover ratio
    - Working capital efficiency

  - **Cost per Unit Trends**
    - Unit cost changes over time
    - Cost reduction initiatives tracking

  **Access**: Accounting → Analytics → Cost Dashboard
  {{< /tab >}}

  {{< tab >}}
  **Operational Efficiency**

  **Efficiency Metrics**:
  - **Labor Efficiency**
    - Standard hours vs actual hours
    - Productivity improvements

  - **Machine Utilization**
    - Equipment uptime and usage
    - Maintenance effectiveness

  - **Material Utilization**
    - Material yield percentages
    - Waste reduction tracking

  - **Lead Time Performance**
    - Manufacturing lead times
    - Order fulfillment speed

  **Access**: Manufacturing → Analytics → Efficiency Dashboard
  {{< /tab >}}
{{< /tabs >}}

---

## 🎓 Advanced Manufacturing Features

### Continuous Improvement Tools

{{< callout type="info" >}}
**Advanced Capabilities**:
- **Lean Manufacturing**: Waste identification and elimination
- **Six Sigma Tools**: Statistical process control and analysis
- **Kaizen Events**: Continuous improvement tracking
- **Value Stream Mapping**: Process flow optimization
- **Total Productive Maintenance**: Equipment effectiveness
{{< /callout >}}

### Integration Capabilities

**Connect Manufacturing with**:
- **Sales & CRM**: Customer demand integration
- **Financial Accounting**: Cost accounting and reporting
- **Purchasing**: Supplier integration and procurement
- **Warehouse Management**: Inventory optimization
- **HR & Payroll**: Labor tracking and costing

---

## 🚀 Next Steps and Implementation

### Manufacturing Module Rollout Plan

{{< tabs items="Phase 1,Phase 2,Phase 3,Ongoing" >}}
  {{< tab >}}
  **Phase 1: Foundation (Weeks 1-4)**

  **Core Setup**:
  - Item master data creation
  - BOM development and validation
  - Work center configuration
  - Basic routing setup
  - Initial user training

  **Expected Outcomes**:
  - Production orders can be created
  - Basic material planning functional
  - Shop floor tracking operational
  {{< /tab >}}

  {{< tab >}}
  **Phase 2: Enhancement (Weeks 5-8)**

  **Advanced Features**:
  - MRP implementation
  - Quality control procedures
  - Cost accounting setup
  - Subcontracting workflows
  - Advanced reporting

  **Expected Outcomes**:
  - Automated planning operational
  - Quality processes integrated
  - Complete cost visibility
  {{< /tab >}}

  {{< tab >}}
  **Phase 3: Optimization (Weeks 9-12)**

  **Performance Improvement**:
  - KPI dashboard deployment
  - Process optimization
  - Automation implementation
  - Integration with other modules
  - Advanced analytics

  **Expected Outcomes**:
  - Optimized manufacturing operations
  - Real-time visibility and control
  - Continuous improvement process
  {{< /tab >}}

  {{< tab >}}
  **Ongoing Operations**

  **Continuous Improvement**:
  - Regular performance reviews
  - Process optimization initiatives
  - Technology upgrades
  - User training and development
  - Best practice sharing

  **Success Metrics**:
  - Improved operational efficiency
  - Reduced manufacturing costs
  - Enhanced product quality
  - Better customer satisfaction
  {{< /tab >}}
{{< /tabs >}}

### Training and Support Resources

{{< callout type="success" >}}
**Available Resources**:
- **Video Tutorials**: Step-by-step manufacturing workflows
- **User Manuals**: Comprehensive documentation
- **Training Sessions**: Live and recorded training
- **Support Portal**: 24/7 technical support
- **Community Forum**: User community and best practices
{{< /callout >}}

---

## 📞 Get Expert Manufacturing Guidance

Ready to implement BigLedger for your manufacturing operations?

{{< hextra/hero-button text="Schedule Manufacturing Consultation" link="mailto:sales@bigledger.com?subject=Manufacturing Demo Follow-up" >}}

### Manufacturing Implementation Support

- **Manufacturing Specialists**: Industry experts available
- **Custom Configuration**: Tailored to your production processes
- **Implementation Timeline**: Typical 8-12 week deployment
- **Training Programs**: Comprehensive user training included
- **Ongoing Support**: Dedicated customer success team

**Contact Information**:
- **Sales**: sales@bigledger.com
- **Technical**: vincent@bigledger.com
- **Manufacturing Expert**: manufacturing@bigledger.com
- **Demo Environment**: demo-v1.bigledger.com

{{< callout type="info" >}}
**Next Steps**: After completing this demo, schedule a personalized consultation to discuss your specific manufacturing requirements and implementation timeline.
{{< /callout >}}