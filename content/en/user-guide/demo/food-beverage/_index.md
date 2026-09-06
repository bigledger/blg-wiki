---
title: "Food & Beverage Industry Demo"
description: "Complete restaurant operations demo - table management, kitchen workflows, recipe costing, and multi-outlet management"
weight: 40
bookCollapseSection: false
draft: true  # unpublished 2026-09-06 (Vincent): see planning/reviews/ guides audit — substantially invented, or unreachable from navigation
---

Experience BigLedger's comprehensive Food & Beverage management capabilities through real restaurant scenarios. This demo covers everything from table reservations to kitchen operations, recipe costing, and multi-outlet management.

{{< hextra/hero-badge >}}
  🍽️ Restaurant Operations Demo
{{< /hextra/hero-badge >}}

{{< hextra/hero-headline >}}
  Master Restaurant Management
{{< /hextra/hero-headline >}}

{{< hextra/hero-subtitle >}}
  Complete F&B workflows from front-of-house to back-of-house operations
{{< /hextra/hero-subtitle >}}

---

## 🎯 Demo Overview

This comprehensive demo simulates "Bella Vista Restaurant" - a mid-size restaurant with café operations, delivery services, and plans for a second outlet. You'll experience how BigLedger handles the complexity of modern F&B operations.

### Demo Restaurant Profile
- **Main Restaurant**: 60 seats, full-service dining
- **Café Section**: 20 seats, quick service
- **Delivery**: Third-party and own delivery
- **Planned Expansion**: Second outlet opening soon

{{< callout type="info" >}}
**Demo Access**: Use account `demo-fnb` with password `Demo2025!` at [demo-v1.bigledger.com](https://demo-v1.bigledger.com) to follow along.
{{< /callout >}}

---

## 🍽️ Core F&B Workflows

Master the essential operations that keep your restaurant running smoothly:

{{< cards >}}
  {{< card link="#table-management" title="🪑 Table Management" subtitle="Reservations, seating, table turnover optimization" >}}
  {{< card link="#kitchen-operations" title="👨‍🍳 Kitchen Operations" subtitle="Order flow, kitchen display, prep management" >}}
  {{< card link="#recipe-costing" title="📊 Recipe & Costing" subtitle="Menu engineering, food cost control, profit analysis" >}}
  {{< card link="#inventory-control" title="📦 Inventory Control" subtitle="Ingredient tracking, wastage, automated reordering" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="#multi-outlet" title="🏪 Multi-Outlet Management" subtitle="Central kitchen, outlet transfers, consolidated reporting" >}}
  {{< card link="#pos-operations" title="💰 POS & Payments" subtitle="Order taking, bill splitting, multiple payment methods" >}}
  {{< card link="#delivery-takeaway" title="🚗 Delivery & Takeaway" subtitle="Online orders, delivery tracking, third-party integration" >}}
  {{< card link="#loyalty-programs" title="🎁 Customer Loyalty" subtitle="Membership programs, rewards, customer analytics" >}}
{{< /cards >}}

---

## 🪑 Table Management Workflow {#table-management}

Learn how to manage reservations, optimize seating, and track table turnover effectively.

### Scenario: Managing Evening Rush

**Objective**: Handle reservation surge during Friday evening peak hours
**Prerequisites**: Access to Reservation Management module
**Estimated Time**: 15 minutes

{{< tabs items="Setup,Reservations,Seating,Turnover" >}}

{{< tab >}}
### Restaurant Setup

**Step 1: Configure Restaurant Layout**
1. Navigate to **Settings > Restaurant > Floor Plan**
2. Click **"Bella Vista Main Floor"**
3. Verify table configuration:
   - Tables 1-15: 4-seater tables
   - Tables 16-20: 2-seater tables
   - Tables 21-25: 6-seater tables
   - VIP Section: Tables 26-30

**Step 2: Set Operating Hours**
1. Go to **Settings > Restaurant > Operating Hours**
2. Configure Friday schedule:
   - Lunch: 11:30 AM - 3:00 PM
   - Dinner: 6:00 PM - 11:00 PM
   - Last Order: 10:30 PM

**Expected Result**: Floor plan shows 60 seats across 30 tables with clear sections.
{{< /tab >}}

{{< tab >}}
### Taking Reservations

**Step 3: Handle Phone Reservations**
1. Click **Reservations > New Booking**
2. Enter customer details:
   - **Name**: "Johnson Family"
   - **Phone**: "+60123456789"
   - **Party Size**: 6 people
   - **Date**: Today's date
   - **Time**: 8:00 PM
   - **Special Requests**: "Birthday celebration"

**Step 4: Check Availability**
1. System shows available 6-seater tables
2. Select **Table 23** (window view)
3. Add note: "Birthday - prepare dessert surprise"
4. Click **"Confirm Reservation"**

**Step 5: Online Reservation Integration**
1. Navigate to **Reservations > Online Bookings**
2. Review incoming reservations from website
3. Approve booking for "Chen Wei - 4 pax at 7:30 PM"
4. Assign to **Table 8**

**Expected Result**: Reservation dashboard shows all bookings with status indicators.
{{< /tab >}}

{{< tab >}}
### Smart Seating Management

**Step 6: Handle Walk-in Customers**
1. Click **POS > Table Management**
2. Walk-in party of 3 arrives
3. Check **"Available Tables"** filter
4. System suggests Tables 12, 14 (optimal for 3 pax)
5. Select **Table 12**, click **"Seat Customers"**

**Step 7: Manage Table Status**
1. Table status automatically changes to **"Occupied"**
2. Monitor table timeline:
   - Seated: 7:15 PM
   - Ordered: 7:25 PM
   - Food served: 7:45 PM
3. Set reminder for table check after 1 hour

**Step 8: Handle Special Situations**
1. Table 15 requests to extend stay (large group)
2. Check impact on 9:00 PM reservations
3. Offer alternative seating for affected reservation
4. Update reservation with new table assignment

**Expected Result**: All tables efficiently utilized with minimal waiting time.
{{< /tab >}}

{{< tab >}}
### Optimizing Table Turnover

**Step 9: Monitor Table Performance**
1. Open **Analytics > Table Turnover Report**
2. View real-time metrics:
   - Average dining time: 75 minutes
   - Turnover rate: 1.8x per evening
   - Peak waiting time: 12 minutes

**Step 10: Identify Bottlenecks**
1. Table 23 (Johnson party) - 95 minutes occupied
2. Kitchen delay affecting Table 8 - food not served
3. Table 12 - finished eating, waiting for bill

**Step 11: Take Action**
1. Alert kitchen about Table 8 order priority
2. Send waiter to Table 12 for bill processing
3. Prepare welcome drinks for waiting customers
4. Update estimated wait time display

**Expected Result**: Improved customer satisfaction and optimized revenue per table.
{{< /tab >}}

{{< /tabs >}}

### Tips & Best Practices

{{< callout type="tip" >}}
**Pro Tips**:
- Use color-coded table status for quick visual management
- Set up automatic SMS reminders for reservations
- Monitor average dining time by meal type to optimize bookings
- Create VIP customer profiles for personalized service
{{< /callout >}}

---

## 👨‍🍳 Kitchen Operations Workflow {#kitchen-operations}

Experience seamless kitchen management from order receipt to food service.

### Scenario: Coordinating Kitchen During Peak Hours

**Objective**: Manage kitchen operations during busy Friday night service
**Prerequisites**: Access to Kitchen Display System
**Estimated Time**: 20 minutes

{{< tabs items="Order Flow,Kitchen Display,Prep Management,Quality Control" >}}

{{< tab >}}
### Order Flow Management

**Step 1: Receive Orders from POS**
1. Navigate to **Kitchen > Order Display**
2. New order appears for **Table 12**:
   - 1x Caesar Salad (starter)
   - 2x Grilled Salmon (main)
   - 1x Beef Wellington (main)
   - 1x Chocolate Lava Cake (dessert)

**Step 2: Order Prioritization**
1. System automatically assigns priority:
   - **RED**: VIP customers, special occasions
   - **ORANGE**: Orders over 20 minutes
   - **GREEN**: Normal priority
2. Table 12 shows **GREEN** priority
3. Johnson Family (Table 23) shows **RED** (birthday)

**Step 3: Station Assignment**
1. Order automatically routes to stations:
   - **Cold Station**: Caesar Salad
   - **Grill Station**: Grilled Salmon
   - **Hot Station**: Beef Wellington
   - **Pastry Station**: Chocolate Lava Cake (timed for later)

**Expected Result**: Kitchen staff see orders on their respective station displays.
{{< /tab >}}

{{< tab >}}
### Kitchen Display System

**Step 4: Station-Level Operations**
1. **Cold Station View**:
   - Caesar Salad for Table 12
   - Preparation time: 8 minutes
   - Chef clicks **"Start"** to begin timer
   - Ingredients auto-deducted from inventory

**Step 5: Cooking Coordination**
1. **Grill Station** starts salmon (12 minutes)
2. **Hot Station** begins beef wellington (25 minutes)
3. System coordinates timing:
   - All mains ready together
   - Salad serves first
   - Dessert timed for end of meal

**Step 6: Real-Time Updates**
1. Grill chef marks salmon **"Ready"**
2. System alerts expeditor
3. Hot station still cooking - estimated 3 minutes
4. Expeditor can see complete order status

**Expected Result**: Perfect coordination between stations with precise timing.
{{< /tab >}}

{{< tab >}}
### Prep Management

**Step 7: Daily Prep Tracking**
1. Navigate to **Kitchen > Prep Management**
2. View today's prep requirements:
   - 50 portions Caesar Salad mix
   - 30 salmon portions
   - 15 beef wellington portions
   - 40 chocolate lava cakes

**Step 8: Ingredient Usage Monitoring**
1. Track real-time ingredient consumption:
   - Romaine lettuce: 80% used
   - Salmon fillets: 60% used
   - Beef tenderloin: 45% used
2. System flags low stock items
3. Automatic reorder suggestions appear

**Step 9: Prep Schedule Optimization**
1. Review **Prep Schedule** for tomorrow:
   - Based on historical sales data
   - Weather forecast consideration
   - Special events (Saturday wedding party)
2. Adjust quantities as needed
3. Generate prep list for morning shift

**Expected Result**: Optimal prep quantities with minimal waste and stockouts.
{{< /tab >}}

{{< tab >}}
### Quality Control

**Step 10: Temperature Monitoring**
1. Check **Kitchen > Temperature Logs**:
   - Freezer: -18°C ✓
   - Refrigerator: 4°C ✓
   - Hot holding: 65°C ✓
2. All temperatures within HACCP requirements

**Step 11: Food Safety Compliance**
1. Review **FIFO (First In, First Out)** status:
   - Salmon batch expiring tomorrow flagged
   - Use before fresher stock
2. Check allergen alerts:
   - Table 15 has nut allergy
   - Special preparation protocols activated

**Step 12: Quality Standards**
1. Random quality check on completed dishes
2. Photo documentation for training
3. Customer feedback integration:
   - Table 8 loved the salmon presentation
   - Use as training example

**Expected Result**: Consistent food quality and full compliance with safety standards.
{{< /tab >}}

{{< /tabs >}}

### Kitchen Performance Metrics

{{< callout type="info" >}}
**Key Metrics to Monitor**:
- Average ticket time: Target < 20 minutes
- Order accuracy: Target > 98%
- Food cost percentage: Target < 32%
- Waste percentage: Target < 5%
{{< /callout >}}

---

## 📊 Recipe & Costing Workflow {#recipe-costing}

Master menu engineering and food cost control for maximum profitability.

### Scenario: Analyzing Menu Profitability

**Objective**: Analyze current menu performance and optimize pricing
**Prerequisites**: Access to Recipe Management and Cost Analysis
**Estimated Time**: 25 minutes

{{< tabs items="Recipe Creation,Cost Analysis,Menu Engineering,Profit Optimization" >}}

{{< tab >}}
### Recipe Creation & Management

**Step 1: Create Detailed Recipe**
1. Navigate to **Inventory > Recipe Management**
2. Click **"New Recipe"** for "Grilled Salmon with Herbs"
3. Enter basic information:
   - **Recipe Name**: Grilled Salmon with Herbs
   - **Category**: Main Course
   - **Portion Size**: 1 serving
   - **Preparation Time**: 15 minutes
   - **Cooking Time**: 12 minutes

**Step 2: Add Ingredients with Precise Quantities**
1. Click **"Add Ingredient"** for each item:
   - Salmon fillet: 180g @ RM 0.85/100g = RM 1.53
   - Olive oil: 15ml @ RM 0.12/100ml = RM 0.02
   - Fresh herbs: 10g @ RM 2.50/100g = RM 0.25
   - Lemon: 0.25 piece @ RM 0.60/piece = RM 0.15
   - Seasoning blend: 5g @ RM 1.20/100g = RM 0.06

**Step 3: Include Labor Costs**
1. Add **"Labor Cost"** calculation:
   - Chef time: 8 minutes @ RM 25/hour = RM 3.33
   - Kitchen assistant: 3 minutes @ RM 15/hour = RM 0.75
2. **Total Direct Labor**: RM 4.08

**Expected Result**: Complete recipe with total cost of RM 6.09 per portion.
{{< /tab >}}

{{< tab >}}
### Comprehensive Cost Analysis

**Step 4: Calculate True Food Cost**
1. Review **Cost Breakdown** for Grilled Salmon:
   - **Direct Ingredients**: RM 2.01 (33%)
   - **Direct Labor**: RM 4.08 (67%)
   - **Total Direct Cost**: RM 6.09

**Step 5: Add Overhead Allocation**
1. Navigate to **Settings > Cost Allocation**
2. Apply overhead rates:
   - Kitchen overhead: 15% of direct cost = RM 0.91
   - Utilities: 8% of direct cost = RM 0.49
   - Equipment depreciation: 5% of direct cost = RM 0.30
3. **Total Overhead**: RM 1.70

**Step 6: Final Cost Calculation**
1. **Complete Cost Structure**:
   - Direct ingredients: RM 2.01
   - Direct labor: RM 4.08
   - Overhead allocation: RM 1.70
   - **Total Cost**: RM 7.79 per portion

**Expected Result**: True cost understanding including all overhead factors.
{{< /tab >}}

{{< tab >}}
### Menu Engineering Analysis

**Step 7: Analyze Menu Performance**
1. Open **Analytics > Menu Engineering Report**
2. View current menu items with metrics:

| Dish | Cost | Price | GP% | Sales Volume | Classification |
|------|------|-------|-----|--------------|----------------|
| Grilled Salmon | RM 7.79 | RM 28.00 | 72% | High | **STAR** |
| Beef Wellington | RM 15.20 | RM 45.00 | 66% | Low | **PLOW HORSE** |
| Caesar Salad | RM 3.50 | RM 18.00 | 81% | High | **STAR** |
| Pasta Carbonara | RM 4.80 | RM 22.00 | 78% | Medium | **STAR** |

**Step 8: Identify Problem Items**
1. **Dogs** (Low profit, Low sales):
   - Mushroom Risotto: 45% GP, Low volume
   - Action: Remove or redesign

2. **Plow Horses** (Low profit, High sales):
   - Fish & Chips: 35% GP, High volume
   - Action: Reduce cost or increase price

**Step 9: Strategic Recommendations**
1. **Promote Stars**: Feature prominently on menu
2. **Fix Plow Horses**: Cost reduction strategies
3. **Eliminate Dogs**: Free up kitchen capacity
4. **Test New Items**: Fill gaps in portfolio

**Expected Result**: Clear action plan for menu optimization.
{{< /tab >}}

{{< tab >}}
### Profit Optimization Strategies

**Step 10: Price Optimization Testing**
1. **Scenario Analysis** for Grilled Salmon:
   - Current: RM 28.00 (72% GP)
   - Test 1: RM 30.00 (74% GP) - Impact on volume?
   - Test 2: RM 26.00 (70% GP) - Volume increase needed?

**Step 11: Cost Reduction Opportunities**
1. **Supplier Analysis**:
   - Current salmon supplier: RM 0.85/100g
   - Alternative supplier: RM 0.78/100g (8% savings)
   - Minimum order quantity: 50kg/month

2. **Portion Size Analysis**:
   - Current: 180g salmon fillet
   - Test: 170g with enhanced presentation
   - Cost savings: RM 0.09 per portion

**Step 12: Implementation Plan**
1. **Week 1**: Test new salmon supplier
2. **Week 2**: A/B test portion sizes
3. **Week 3**: Monitor customer feedback
4. **Week 4**: Implement best combination

**Expected Result**: Systematic approach to improving profitability while maintaining quality.
{{< /tab >}}

{{< /tabs >}}

### Profitability Analysis Tools

{{< callout type="success" >}}
**Key Performance Indicators**:
- **Food Cost %**: Target 28-32% of revenue
- **Labor Cost %**: Target 25-30% of revenue
- **Gross Profit Margin**: Target 65-70%
- **Menu Item Velocity**: Track sales frequency
{{< /callout >}}

---

## 📦 Inventory Control Workflow {#inventory-control}

Master ingredient tracking, wastage control, and automated reordering for optimal inventory management.

### Scenario: Daily Inventory Operations

**Objective**: Manage inventory from receiving to waste tracking
**Prerequisites**: Access to Inventory Management module
**Estimated Time**: 20 minutes

{{< tabs items="Receiving,Stock Management,Wastage Control,Reordering" >}}

{{< tab >}}
### Goods Receiving Process

**Step 1: Process Delivery**
1. Navigate to **Inventory > Goods Receiving**
2. Scan delivery note for **"Fresh Seafood Supplier"**
3. Compare with Purchase Order #PO-2024-1156:
   - Salmon fillets: Ordered 25kg, Received 25kg ✓
   - Sea bass: Ordered 15kg, Received 14.5kg ⚠️
   - Prawns: Ordered 10kg, Received 10kg ✓

**Step 2: Quality Inspection**
1. Check **Quality Parameters**:
   - Salmon: Temperature 2°C ✓, Fresh smell ✓, Firm texture ✓
   - Sea bass: Temperature 3°C ✓, Fresh smell ✓, Some bruising ⚠️
   - Prawns: Temperature 1°C ✓, Clear shells ✓, Good condition ✓

**Step 3: Record Discrepancies**
1. **Quantity Variance**: Sea bass short by 0.5kg
2. **Quality Issue**: Minor bruising on 2 sea bass fillets
3. Create **Supplier Note** documenting issues
4. Adjust received quantities in system
5. Update inventory values accordingly

**Expected Result**: Accurate inventory records with quality issues documented.
{{< /tab >}}

{{< tab >}}
### Real-Time Stock Management

**Step 4: Monitor Stock Levels**
1. Open **Inventory > Stock Overview**
2. Check current levels with alerts:

| Item | Current Stock | Reorder Level | Status |
|------|---------------|---------------|--------|
| Salmon Fillet | 28.5kg | 15kg | ✅ OK |
| Chicken Breast | 8kg | 12kg | ⚠️ LOW |
| Beef Tenderloin | 3kg | 8kg | 🔴 CRITICAL |
| Rice | 45kg | 20kg | ✅ OK |

**Step 5: Track Usage Patterns**
1. Review **Usage Analytics**:
   - Salmon: Average 4.2kg/day
   - Chicken: Average 6.8kg/day
   - Beef: Average 2.1kg/day
2. Current stock covers:
   - Salmon: 6.8 days
   - Chicken: 1.2 days ⚠️
   - Beef: 1.4 days 🔴

**Step 6: Immediate Actions**
1. **Emergency Order** for chicken breast (20kg)
2. **Rush Order** for beef tenderloin (15kg)
3. Check **Alternative Suppliers** for faster delivery
4. Update **Menu Availability** if needed

**Expected Result**: Proactive stock management preventing stockouts.
{{< /tab >}}

{{< tab >}}
### Wastage Control & FIFO

**Step 7: Daily Wastage Assessment**
1. Navigate to **Inventory > Waste Management**
2. Record morning inspection findings:
   - 0.8kg lettuce - wilted (expired)
   - 1.2kg bread - stale (day old)
   - 0.3kg cheese - moldy (storage issue)

**Step 8: Categorize Waste Reasons**
1. **Natural Spoilage**: Lettuce (normal aging)
2. **Storage Issues**: Cheese (temperature fluctuation)
3. **Over-Ordering**: Bread (too much for weekday)
4. Calculate **Waste Cost**: RM 28.50 today

**Step 9: FIFO Implementation**
1. Check **Expiry Date Report**:
   - Salmon batch expires tomorrow: Use first
   - Vegetables expire in 2 days: Priority prep
   - Dairy products: Rotate to front
2. Update **Kitchen Instructions** for tomorrow's prep
3. Create **Staff Reminder** about FIFO procedures

**Expected Result**: Systematic waste reduction and proper stock rotation.
{{< /tab >}}

{{< tab >}}
### Automated Reordering

**Step 10: Review Reorder Suggestions**
1. Open **Inventory > Reorder Management**
2. System suggests based on:
   - Historical consumption patterns
   - Current stock levels
   - Lead times from suppliers
   - Upcoming events (Saturday wedding)

**Step 11: Optimize Order Quantities**
1. **Suggested Orders**:
   - Chicken breast: 25kg (system suggestion)
   - Adjust to 30kg (Saturday event consideration)
   - Vegetables: 15kg mixed (system suggestion)
   - Reduce to 12kg (waste pattern analysis)

**Step 12: Supplier Selection**
1. **Compare Options**:
   - Primary supplier: RM 850, delivery tomorrow
   - Secondary supplier: RM 820, delivery in 2 days
   - Emergency supplier: RM 950, delivery today
2. Choose **Primary supplier** for chicken (urgent)
3. Choose **Secondary supplier** for vegetables (can wait)

**Expected Result**: Optimized ordering with cost and timing considerations.
{{< /tab >}}

{{< /tabs >}}

### Inventory Best Practices

{{< callout type="warning" >}}
**Critical Success Factors**:
- Maintain accurate receiving procedures
- Implement strict FIFO rotation
- Monitor waste patterns weekly
- Use data-driven reordering
- Regular supplier performance reviews
{{< /callout >}}

---

## 🏪 Multi-Outlet Management {#multi-outlet}

Experience centralized management of multiple restaurant locations with central kitchen operations.

### Scenario: Central Kitchen & Multi-Outlet Operations

**Objective**: Manage central kitchen distribution and outlet coordination
**Prerequisites**: Access to Multi-Location module
**Estimated Time**: 25 minutes

{{< tabs items="Central Kitchen,Distribution,Outlet Operations,Consolidated Reporting" >}}

{{< tab >}}
### Central Kitchen Operations

**Step 1: Setup Central Kitchen**
1. Navigate to **Multi-Location > Central Kitchen**
2. Configure production facility:
   - **Location**: Bella Vista Central Kitchen
   - **Capacity**: 500 portions/day
   - **Outlets Served**: Main Restaurant, Café, New Outlet (planned)
   - **Operating Hours**: 5:00 AM - 2:00 PM

**Step 2: Production Planning**
1. Review **Daily Production Requirements**:
   - Main Restaurant: 200 portions
   - Café: 150 portions
   - Delivery orders: 100 portions
   - Buffer stock: 50 portions
2. **Total Daily Target**: 500 portions

**Step 3: Recipe Standardization**
1. **Standardized Recipes** for multi-outlet consistency:
   - Sauce bases: Prepare in 10L batches
   - Marinades: 5L batches for 50 portions
   - Prep items: Standardized portion sizes
2. **Quality Control**: Same standards across all outlets

**Expected Result**: Central kitchen ready for efficient multi-outlet production.
{{< /tab >}}

{{< tab >}}
### Distribution Management

**Step 4: Plan Daily Distribution**
1. Open **Distribution > Delivery Schedule**
2. Plan delivery routes:
   - **Route 1**: Main Restaurant (8:00 AM)
   - **Route 2**: Café (9:00 AM)
   - **Route 3**: Delivery hub (10:00 AM)

**Step 5: Prepare Transfer Orders**
1. Create **Inter-Branch Transfer** for Main Restaurant:
   - Pasta sauce: 5L
   - Marinated chicken: 15kg
   - Prep vegetables: 20kg
   - Dessert bases: 30 portions

**Step 6: Temperature-Controlled Transport**
1. **Cold Chain Management**:
   - Refrigerated items: 0-4°C
   - Frozen items: -18°C
   - Hot items: >65°C (if applicable)
2. **Documentation**: Temperature logs for food safety
3. **Tracking**: GPS monitoring of delivery vehicles

**Expected Result**: Systematic distribution ensuring food safety and quality.
{{< /tab >}}

{{< tab >}}
### Individual Outlet Operations

**Step 7: Main Restaurant Receiving**
1. **Receive Transfer** at Main Restaurant:
   - Scan transfer document
   - Check temperatures upon arrival
   - Verify quantities and quality
   - Update local inventory automatically

**Step 8: Café Operations**
1. **Café-Specific Items**:
   - Coffee beans: Local supplier direct
   - Pastries: Central kitchen + local bakery
   - Quick-serve items: Central kitchen prep
2. **Local Inventory Management**: Separate from main restaurant
3. **Staff Scheduling**: Café-specific shifts and skills

**Step 9: Outlet-Specific Customization**
1. **Menu Variations**:
   - Main Restaurant: Full menu
   - Café: Limited menu, café specialties
   - Delivery: Delivery-optimized items
2. **Pricing Flexibility**: Location-based pricing if needed
3. **Local Promotions**: Outlet-specific offers

**Expected Result**: Each outlet operates efficiently with central support.
{{< /tab >}}

{{< tab >}}
### Consolidated Reporting

**Step 10: Performance Comparison**
1. Open **Analytics > Multi-Location Dashboard**
2. **Daily Performance Metrics**:

| Outlet | Revenue | Food Cost % | Labor Cost % | Profit Margin |
|--------|---------|-------------|--------------|---------------|
| Main Restaurant | RM 8,500 | 31% | 28% | 41% |
| Café | RM 3,200 | 29% | 25% | 46% |
| Delivery | RM 2,100 | 33% | 15% | 52% |

**Step 11: Cost Analysis**
1. **Central Kitchen Allocation**:
   - Fixed costs: Distribute by volume
   - Variable costs: Direct allocation
   - Shared services: Equal distribution
2. **True Profitability** by outlet including allocations

**Step 12: Strategic Insights**
1. **Best Practices Sharing**:
   - Café's low labor cost model
   - Main restaurant's customer retention
   - Delivery efficiency optimization
2. **Expansion Planning**: Data for new outlet decisions
3. **Resource Optimization**: Staff and inventory allocation

**Expected Result**: Data-driven decisions for multi-outlet optimization.
{{< /tab >}}

{{< /tabs >}}

### Multi-Outlet Success Metrics

{{< callout type="info" >}}
**Key Performance Indicators**:
- **Consistency Score**: Quality/taste consistency across outlets
- **Distribution Efficiency**: On-time delivery rate >95%
- **Cost Allocation Accuracy**: Fair cost distribution
- **Cross-Outlet Learning**: Best practice adoption rate
{{< /callout >}}

---

## 💰 POS & Payment Operations {#pos-operations}

Master point-of-sale operations including order taking, bill splitting, and multiple payment processing.

### Scenario: Complex POS Transactions

**Objective**: Handle various POS scenarios from simple orders to complex bill splitting
**Prerequisites**: Access to POS module
**Estimated Time**: 20 minutes

{{< tabs items="Order Taking,Bill Management,Payment Processing,Returns & Voids" >}}

{{< tab >}}
### Advanced Order Taking

**Step 1: Start New Order**
1. Open **POS > New Order**
2. Select **Table 15** (party of 6)
3. Customer requests:
   - 2x Caesar Salad (1 no croutons, 1 extra parmesan)
   - 3x Grilled Salmon (1 well-done, 2 medium)
   - 1x Vegetarian Pasta (gluten-free)
   - 2x House Wine (white)
   - 4x Soft drinks (assorted)

**Step 2: Handle Special Requests**
1. **Modify Caesar Salad #1**:
   - Click item, select **"Modify"**
   - Uncheck **"Croutons"**
   - Add note: "No croutons - allergies"

2. **Modify Caesar Salad #2**:
   - Click **"Add Extra"**
   - Select **"Parmesan Cheese"** (+RM 3.00)

**Step 3: Cooking Instructions**
1. **Salmon Modifications**:
   - Salmon #1: Set cooking level **"Well Done"**
   - Salmon #2 & #3: Set cooking level **"Medium"**
2. **Special Dietary Requirements**:
   - Pasta: Check **"Gluten Free"** option
   - System alerts kitchen to use GF pasta
   - Additional charge: +RM 2.00

**Expected Result**: Detailed order with all modifications properly recorded.
{{< /tab >}}

{{< tab >}}
### Bill Splitting & Management

**Step 4: Group Ordering**
1. **Separate Bills Requested**:
   - Couple 1: 1 Caesar Salad, 2 Salmon, 1 Wine
   - Couple 2: 1 Caesar Salad, 1 Salmon, 1 Wine
   - Couple 3: 1 Vegetarian Pasta, 2 Soft drinks
   - Plus shared appetizer to split 3 ways

**Step 5: Configure Bill Splitting**
1. Click **"Split Bill"** button
2. **Create Sub-Bills**:
   - Bill A: Items for Couple 1
   - Bill B: Items for Couple 2
   - Bill C: Items for Couple 3
3. **Shared Items**: Appetizer RM 24 ÷ 3 = RM 8 each

**Step 6: Apply Discounts & Promotions**
1. **Happy Hour Discount**: 20% off wine (until 8 PM)
2. **Member Discount**: Couple 1 has membership (10% total)
3. **Birthday Special**: Couple 3 celebrating anniversary (free dessert)
4. System automatically calculates best discount combination

**Expected Result**: Three separate bills with appropriate discounts applied.
{{< /tab >}}

{{< tab >}}
### Multiple Payment Processing

**Step 7: Process Bill A (Couple 1)**
1. **Bill Total**: RM 89.50 after discounts
2. **Payment Method**: Split payment
   - Credit Card: RM 50.00
   - Cash: RM 39.50
3. **Credit Card Processing**:
   - Insert card, enter PIN
   - System processes payment
   - Print credit card receipt

**Step 8: Process Bill B (Couple 2)**
1. **Bill Total**: RM 76.80
2. **Payment Method**: E-wallet (GrabPay)
3. **E-Wallet Processing**:
   - Generate QR code
   - Customer scans with phone
   - Payment confirmed instantly
   - Digital receipt sent to phone

**Step 9: Process Bill C (Couple 3)**
1. **Bill Total**: RM 42.00 (with free dessert)
2. **Payment Method**: Debit card
3. **Contactless Payment**:
   - Tap card on terminal
   - Payment approved
   - No signature required (<RM 250)

**Expected Result**: All payments processed successfully with proper documentation.
{{< /tab >}}

{{< tab >}}
### Returns & Void Management

**Step 10: Handle Customer Complaint**
1. **Issue**: Salmon at Table 12 overcooked
2. **Customer**: Requests replacement
3. **Action**:
   - Click order item
   - Select **"Return Item"**
   - Reason: **"Quality Issue - Overcooked"**
   - Generate new kitchen order

**Step 11: Process Void Transaction**
1. **Manager Authorization**: Required for voids
2. **Void Procedure**:
   - Enter manager PIN
   - Document reason: "Food quality issue"
   - System reverses charges
   - Updates inventory (adds back ingredients)

**Step 12: Customer Service Recovery**
1. **Replacement Meal**: Priority preparation in kitchen
2. **Goodwill Gesture**: Complimentary dessert
3. **Follow-up**: Manager visit to table
4. **Documentation**: Customer service log for analysis

**Expected Result**: Professional handling of complaint with proper documentation.
{{< /tab >}}

{{< /tabs >}}

### POS Performance Metrics

{{< callout type="success" >}}
**Daily POS Targets**:
- **Transaction Speed**: Average < 3 minutes per order
- **Payment Success Rate**: > 99.5%
- **Void/Return Rate**: < 2% of transactions
- **Customer Satisfaction**: > 4.5/5 rating
{{< /callout >}}

---

## 🚗 Delivery & Takeaway Operations {#delivery-takeaway}

Manage online orders, delivery coordination, and third-party platform integration.

### Scenario: Multi-Channel Order Management

**Objective**: Coordinate orders from multiple channels including third-party platforms
**Prerequisites**: Access to Delivery Management module
**Estimated Time**: 20 minutes

{{< tabs items="Online Orders,Delivery Coordination,Third-Party Integration,Performance Tracking" >}}

{{< tab >}}
### Online Order Processing

**Step 1: Website Orders**
1. Navigate to **Delivery > Order Management**
2. **New Order Alert** from restaurant website:
   - Customer: Sarah Lee
   - Address: Mont Kiara, 15 minutes away
   - Order: 2x Beef Rendang, 1x Nasi Lemak, 2x Drinks
   - Special Instructions: "Extra spicy, no cucumber"
   - Payment: Online (already processed)

**Step 2: Order Validation**
1. **Address Verification**:
   - Check delivery zone: Mont Kiara ✓ (within 10km)
   - Estimated delivery time: 35-45 minutes
   - Delivery fee: RM 8.00
2. **Inventory Check**:
   - Beef Rendang: Available ✓
   - Nasi Lemak: Available ✓
   - Kitchen capacity: Can accommodate ✓

**Step 3: Kitchen Integration**
1. **Auto-Print** kitchen order ticket
2. **Special Instructions** highlighted in red
3. **Delivery Timeline** calculated:
   - Kitchen prep: 20 minutes
   - Packaging: 5 minutes
   - Delivery window: 35-45 minutes

**Expected Result**: Order seamlessly integrated into kitchen workflow.
{{< /tab >}}

{{< tab >}}
### Delivery Coordination

**Step 4: Driver Assignment**
1. **Available Drivers**:
   - Ahmad: Currently delivering (back in 15 mins)
   - Siti: Available now
   - Rahman: On standby
2. **Assign to Siti**: Mont Kiara area specialist
3. **Route Optimization**: Check for nearby orders to combine

**Step 5: Order Preparation Tracking**
1. **Kitchen Status Updates**:
   - Order started: 7:15 PM
   - Beef Rendang ready: 7:25 PM
   - Nasi Lemak ready: 7:30 PM
   - Packaging started: 7:32 PM
2. **Real-time Updates** sent to customer via SMS

**Step 6: Quality Control for Delivery**
1. **Packaging Standards**:
   - Insulated bags for hot items
   - Separate containers for rice and curry
   - Leak-proof packaging for sauces
   - Temperature maintenance tags
2. **Final Check**: Photo documentation of packaged order

**Expected Result**: Order prepared according to delivery standards.
{{< /tab >}}

{{< tab >}}
### Third-Party Platform Integration

**Step 7: Grab Food Order**
1. **Order Notification** via API:
   - Platform: Grab Food
   - Order #GF-789123
   - Customer: Michael Tan
   - Items: 1x Fish & Chips, 1x Caesar Salad
   - Grab commission: 30%

**Step 8: Platform-Specific Handling**
1. **Grab Requirements**:
   - Order confirmation within 5 minutes
   - Preparation time: Must update every 5 minutes
   - Special packaging: Grab-branded bags
2. **Auto-Confirm** order in system
3. **Update Prep Time**: 25 minutes estimated

**Step 9: foodpanda Integration**
1. **Simultaneous Order** from foodpanda:
   - Customer: Lisa Wong
   - Similar items: Fish & Chips, Salad
   - Bundle preparation to optimize kitchen time
2. **Cross-Platform Coordination**:
   - Prepare similar items together
   - Separate packaging per platform
   - Track commissions separately

**Expected Result**: Efficient multi-platform order management.
{{< /tab >}}

{{< tab >}}
### Performance Tracking & Analytics

**Step 10: Delivery Performance Monitoring**
1. **Real-Time Dashboard**:
   - Orders in progress: 8
   - Average prep time: 22 minutes
   - Driver utilization: 80%
   - Customer rating: 4.7/5

**Step 11: Platform Performance Analysis**
1. **Commission Comparison**:
   - Grab Food: 30% commission, high volume
   - foodpanda: 25% commission, medium volume
   - Own website: 0% commission, growing
2. **Profitability Analysis**:
   - Direct orders: 45% profit margin
   - Grab orders: 15% profit margin
   - foodpanda orders: 20% profit margin

**Step 12: Optimization Strategies**
1. **Customer Migration**:
   - Promote direct ordering via loyalty program
   - Offer 15% discount on direct orders
   - SMS marketing to repeat customers
2. **Menu Optimization**:
   - High-margin items for third-party platforms
   - Platform-exclusive items
   - Dynamic pricing during peak hours

**Expected Result**: Data-driven approach to delivery profitability.
{{< /tab >}}

{{< /tabs >}}

### Delivery Success Metrics

{{< callout type="warning" >}}
**Critical KPIs**:
- **On-Time Delivery Rate**: Target >90%
- **Order Accuracy**: Target >95%
- **Customer Rating**: Target >4.5/5
- **Platform Compliance**: 100% adherence to platform requirements
{{< /callout >}}

---

## 🎁 Customer Loyalty Programs {#loyalty-programs}

Implement and manage comprehensive customer loyalty and membership programs.

### Scenario: Building Customer Retention

**Objective**: Set up and manage loyalty programs to increase customer retention
**Prerequisites**: Access to CRM and Loyalty modules
**Estimated Time**: 25 minutes

{{< tabs items="Program Setup,Member Management,Rewards & Redemption,Analytics & Insights" >}}

{{< tab >}}
### Loyalty Program Configuration

**Step 1: Create Membership Tiers**
1. Navigate to **CRM > Loyalty Programs**
2. **Configure Tier Structure**:
   - **Bronze**: 0-999 points (5% discount)
   - **Silver**: 1000-2999 points (8% discount, birthday treat)
   - **Gold**: 3000-4999 points (12% discount, priority booking)
   - **Platinum**: 5000+ points (15% discount, exclusive events)

**Step 2: Points Earning Structure**
1. **Standard Earning**:
   - RM 1 spent = 1 point
   - Bonus points: Weekday lunch 2x points
   - Referral bonus: 500 points per successful referral
   - Birthday month: 3x points
   - Special events: Custom multipliers

**Step 3: Redemption Options**
1. **Points Redemption**:
   - 100 points = RM 5 discount
   - 500 points = Free appetizer
   - 1000 points = Free main course
   - 2000 points = Free dinner for 2
   - 5000 points = Exclusive chef's table experience

**Expected Result**: Comprehensive loyalty program structure established.
{{< /tab >}}

{{< tab >}}
### Member Registration & Management

**Step 4: New Member Registration**
1. **Customer Sign-Up**: Walk-in customer interested in membership
2. **Registration Process**:
   - Name: Jennifer Chan
   - Phone: +60123456789
   - Email: jennifer.chan@email.com
   - Birthday: March 15
   - Preferences: Vegetarian options, white wine
   - Communication: SMS + Email

**Step 5: Member Profile Enhancement**
1. **Dining Preferences**:
   - Allergies: None
   - Dietary restrictions: Vegetarian
   - Favorite dishes: Caesar Salad, Pasta Arrabiata
   - Preferred seating: Window table
   - Special occasions: Tracks anniversaries

**Step 6: Family/Corporate Accounts**
1. **Corporate Membership**: Local company wants group membership
2. **Setup Process**:
   - Primary contact: HR Manager
   - 50 employee cards
   - Consolidated billing available
   - Corporate discount: Additional 5%
   - Monthly spending target: RM 5,000

**Expected Result**: Diverse membership base with detailed customer profiles.
{{< /tab >}}

{{< tab >}}
### Rewards Processing & Redemption

**Step 7: Points Earning Transaction**
1. **Member Visit**: Jennifer Chan dines with friends
2. **Bill Details**:
   - Total: RM 120
   - Member discount: 5% (Bronze tier) = RM 6
   - Final amount: RM 114
   - Points earned: 120 points (base rate)
   - Special promotion: Weekday dinner 1.5x = 180 points total

**Step 8: Redemption Request**
1. **Member Wants to Redeem**: 500 points for free appetizer
2. **Redemption Process**:
   - Check point balance: 680 points available
   - Apply redemption: -500 points
   - Free appetizer: Bruschetta (value RM 18)
   - Remaining balance: 180 points

**Step 9: Special Tier Benefits**
1. **Silver Member Visit**: Regular customer reaches Silver tier
2. **Automatic Benefits**:
   - Upgrade to 8% discount
   - Birthday treat activated (free dessert in birthday month)
   - Priority booking privileges enabled
   - Welcome gift: Bottle of house wine

**Expected Result**: Seamless points earning and redemption experience.
{{< /tab >}}

{{< tab >}}
### Loyalty Analytics & Insights

**Step 10: Member Behavior Analysis**
1. **Open Analytics Dashboard**:
   - Total members: 1,247
   - Active members (30 days): 892 (71.5%)
   - Average visit frequency: 2.3x per month
   - Average spend per visit: RM 67

**Step 11: Tier Performance Analysis**
1. **Membership Distribution**:
   - Bronze: 876 members (70.2%)
   - Silver: 251 members (20.1%)
   - Gold: 98 members (7.9%)
   - Platinum: 22 members (1.8%)

2. **Revenue Impact**:
   - Member transactions: 78% of total revenue
   - Average member spend: 40% higher than non-members
   - Redemption rate: 65% of earned points

**Step 12: Retention & Engagement Strategies**
1. **Identify At-Risk Members**:
   - No visit in 60 days: 156 members
   - Declining frequency: 89 members
   - Low engagement: 234 members

2. **Re-engagement Campaigns**:
   - "We miss you" offer: 20% discount + 2x points
   - Seasonal menu preview for Gold/Platinum
   - Exclusive wine tasting event
   - Referral incentive: Extra 500 points

**Expected Result**: Data-driven loyalty program optimization.
{{< /tab >}}

{{< /tabs >}}

### Loyalty Program ROI

{{< callout type="success" >}}
**Program Performance Metrics**:
- **Member Retention Rate**: Target >80% annual retention
- **Average Order Value**: 40% higher for members
- **Visit Frequency**: 2.5x higher than non-members
- **Program ROI**: Target 300% return on investment
{{< /callout >}}

---

## 📈 Food Cost Analysis & Control

Master comprehensive food cost management and profit optimization techniques.

### Scenario: Monthly Food Cost Review

**Objective**: Analyze food costs and implement control measures
**Prerequisites**: Access to Cost Control and Analytics modules
**Estimated Time**: 20 minutes

{{< tabs items="Cost Analysis,Variance Investigation,Trend Analysis,Action Planning" >}}

{{< tab >}}
### Comprehensive Cost Analysis

**Step 1: Monthly Food Cost Review**
1. Navigate to **Analytics > Food Cost Analysis**
2. **Current Month Performance**:
   - Total Food Sales: RM 125,000
   - Total Food Cost: RM 39,000
   - **Food Cost %**: 31.2%
   - Target: 30.0%
   - Variance: +1.2% (RM 1,500 over budget)

**Step 2: Category Breakdown**
1. **Cost Analysis by Category**:
   - Proteins: RM 18,500 (47.4% of food cost)
   - Vegetables: RM 7,800 (20.0% of food cost)
   - Dairy: RM 4,200 (10.8% of food cost)
   - Dry goods: RM 5,100 (13.1% of food cost)
   - Beverages: RM 3,400 (8.7% of food cost)

**Step 3: Item-Level Analysis**
1. **Top Cost Contributors**:
   - Salmon: RM 4,200 (10.8% of total food cost)
   - Beef tenderloin: RM 3,800 (9.7% of total food cost)
   - Imported cheese: RM 2,100 (5.4% of total food cost)
   - Premium vegetables: RM 1,900 (4.9% of total food cost)

**Expected Result**: Clear understanding of cost structure and problem areas.
{{< /tab >}}

{{< tab >}}
### Variance Investigation

**Step 4: Identify Cost Variances**
1. **Compare to Last Month**:
   - Salmon cost: +15% (supplier price increase)
   - Beef cost: +8% (higher grade purchased)
   - Vegetable cost: +22% (seasonal price fluctuation)
   - Waste cost: +35% (spoilage during heat wave)

**Step 5: Root Cause Analysis**
1. **Salmon Price Increase**:
   - Supplier explanation: Seasonal shortage
   - Alternative suppliers: 8% cheaper available
   - Quality comparison needed
   - Customer impact assessment required

2. **Beef Grade Change**:
   - Kitchen upgraded to prime grade
   - No corresponding menu price increase
   - Customer satisfaction improved
   - Margin impact: -3.2%

**Step 6: Waste Analysis Deep Dive**
1. **Waste Patterns**:
   - Heat wave week: Vegetable waste +45%
   - Cooling system inadequate during peak temperatures
   - Staff procedures need review
   - Storage upgrade required

**Expected Result**: Root causes identified with actionable insights.
{{< /tab >}}

{{< tab >}}
### Trend Analysis & Forecasting

**Step 7: Historical Trend Review**
1. **6-Month Cost Trend**:
   - January: 29.8%
   - February: 30.1%
   - March: 30.5%
   - April: 31.0%
   - May: 31.2%
   - Trend: Gradual increase of +1.4% over 6 months

**Step 8: Seasonal Pattern Analysis**
1. **Identify Seasonal Factors**:
   - Seafood costs peak in March-May (monsoon season)
   - Vegetable costs spike during Chinese New Year
   - Beef costs stable year-round
   - Import costs affected by currency fluctuation

**Step 9: Predictive Modeling**
1. **Forecast Next Quarter**:
   - Expected salmon cost: +5% (continued shortage)
   - Vegetable costs: -10% (post-season normalization)
   - New supplier opportunities: -3% overall cost reduction
   - **Projected Food Cost %**: 29.8% (with actions implemented)

**Expected Result**: Forward-looking cost management strategy.
{{< /tab >}}

{{< tab >}}
### Action Planning & Implementation

**Step 10: Immediate Actions (Week 1)**
1. **Supplier Diversification**:
   - Test alternative salmon supplier
   - Negotiate better terms with vegetable supplier
   - Implement 2-supplier minimum for critical items

2. **Operational Improvements**:
   - Upgrade refrigeration system
   - Retrain staff on proper storage procedures
   - Implement daily waste tracking

**Step 11: Medium-term Strategies (Month 1-3)**
1. **Menu Engineering**:
   - Reduce salmon portion size by 10g (save RM 0.85/dish)
   - Promote higher-margin items
   - Introduce new dishes with better cost ratios
   - Consider price adjustments for premium items

**Step 12: Long-term Optimization (Quarter 1-2)**
1. **Strategic Initiatives**:
   - Direct farmer partnerships for vegetables
   - Bulk purchasing agreements for stable pricing
   - Investment in better storage infrastructure
   - Staff incentive program for waste reduction

2. **Performance Targets**:
   - Month 1: Reduce food cost to 30.5%
   - Month 2: Achieve 30.0% target
   - Month 3: Maintain 29.5% consistently

**Expected Result**: Comprehensive action plan with clear timelines and targets.
{{< /tab >}}

{{< /tabs >}}

### Cost Control Success Factors

{{< callout type="info" >}}
**Critical Control Points**:
- **Daily Cost Monitoring**: Track costs in real-time
- **Supplier Relationship Management**: Maintain competitive sourcing
- **Waste Minimization**: Target <3% total waste
- **Menu Optimization**: Regular profitability analysis
- **Staff Training**: Consistent cost-conscious procedures
{{< /callout >}}

---

## 🎯 Demo Completion & Next Steps

Congratulations! You've completed the comprehensive Food & Beverage industry demo for BigLedger. You've experienced how our integrated Business Operating System handles the complexity of modern restaurant operations.

### What You've Learned

{{< tabs items="Operational Excellence,Financial Control,Growth Management,Technology Integration" >}}

{{< tab >}}
**Front & Back of House Operations**
- Seamless table management and reservation optimization
- Kitchen workflow coordination and timing control
- Quality management and food safety compliance
- Staff efficiency and customer service excellence

**Key Takeaways:**
- Integrated operations eliminate manual coordination
- Real-time visibility improves decision making
- Automated processes reduce human error
- Consistent quality standards across all touchpoints
{{< /tab >}}

{{< tab >}}
**Comprehensive Cost Management**
- Recipe costing and menu engineering
- Real-time food cost tracking and analysis
- Waste reduction and inventory optimization
- Profitability analysis by dish and category

**Key Takeaways:**
- Data-driven pricing decisions improve margins
- Automated cost tracking identifies issues quickly
- Inventory optimization reduces waste and stockouts
- Predictive analytics enable proactive management
{{< /tab >}}

{{< tab >}}
**Multi-Location & Scalability**
- Central kitchen operations and distribution
- Standardized processes across outlets
- Consolidated reporting and performance comparison
- Efficient resource allocation and optimization

**Key Takeaways:**
- Centralized control with local flexibility
- Consistent quality and standards across locations
- Economies of scale in purchasing and preparation
- Data-driven expansion and optimization decisions
{{< /tab >}}

{{< tab >}}
**Modern Technology Integration**
- Multi-channel order management (dine-in, delivery, takeaway)
- Third-party platform integration (Grab, foodpanda)
- Customer loyalty and retention programs
- Advanced analytics and business intelligence

**Key Takeaways:**
- Omnichannel approach maximizes revenue opportunities
- Technology integration eliminates manual processes
- Customer data drives personalized experiences
- Analytics provide competitive advantages
{{< /tab >}}

{{< /tabs >}}

---

### Ready to Transform Your F&B Business?

{{< callout type="success" >}}
**Special F&B Package Available**: Contact our team and mention "F&B-DEMO-2025" for exclusive restaurant industry pricing and implementation support!
{{< /callout >}}

### Next Steps

1. **Schedule Your Personalized Demo**
   - Focus on your specific restaurant type and challenges
   - See your actual menu and operations in BigLedger
   - Discuss implementation timeline and training

2. **Start Your Free Trial**
   - 30-day full-feature trial
   - Import your existing data
   - Test with your team and processes

3. **Explore Implementation Options**
   - Phased rollout strategies
   - Staff training programs
   - Data migration services
   - Ongoing support packages

### Contact Our F&B Specialists

{{< hextra/hero-button text="Schedule F&B Consultation" link="mailto:sales@bigledger.com?subject=F&B Demo Follow-up" >}}

**Direct Contacts:**
- **F&B Solutions Specialist**: fnb@bigledger.com
- **Implementation Consultant**: implementation@bigledger.com
- **Technical Support**: support@bigledger.com
- **Sales Team**: +60 3-2856 0888

---

### Additional Resources

- 📚 [F&B Best Practices Guide](/user-guide/industries/food-beverage/)
- 🎓 [Training Materials](/user-guide/training/)
- 📞 [Support Documentation](/support/)
- 💡 [F&B Case Studies](/success-stories/food-beverage/)

{{< callout type="info" >}}
**Remember**: This demo environment resets daily. Save any configurations or notes you want to reference for your implementation planning.
{{< /callout >}}

Thank you for exploring BigLedger's Food & Beverage solutions. We look forward to helping you transform your restaurant operations and achieve greater success!