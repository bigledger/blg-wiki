# Production Planning & Monitoring (PPM) Applet

## 1. Introduction

### 1.1 Purpose
The **Production Planning & Monitoring (PPM) Applet** acts as the command center for your manufacturing process, bridging **Customer Demand (Sales Orders)** and **Factory Execution (Manufacturing Operations)**.

Its primary goals are:
- Digitize Planning: Convert Sales Orders into Job Orders.
- Manage Resources: Define input materials and output expectations.
- Monitor Progress: Track production status from "Planned" to "Completed."

### 1.2 Target Audience
- Primary Users (Production Planners/Controllers): Create Job Orders, assign templates, release work.
- Secondary Users (Sales Coordinators): Check production status for customer orders.
- Reviewers (Factory Managers): Monitor load, priorities, and outstanding reports.

### 1.3 The Ecosystem
This applet sits in the manufacturing workflow:
1. Process Maintenance Applet (Pre-requisite): Machines and templates setup.
2. PPM Applet (Current): Planning happens here.
3. Manufacturing Operations Applet (Next Step): Operators execute tasks.

---

## 2. Prerequisites and Setup
Ensure the following are configured in the Process Maintenance Applet:
- Machines
- Process Types (Armoring, Bedding, Cabling)
- Process Templates
- Job Templates (Critical for Job Order creation)
- Item Category Groups (For Production Request filtering)

---

## 3. Applet Overview
The applet contains four main menus:

- **Master List**: Central hub for Job Orders.
- **Processes**: Breakdown of all individual manufacturing steps.
- **Sales Orders**: Customer order linkage view.
- **Production Requests**: Incoming demand queue.

---

## 4. Workflow A: Managing Production Requests
Goal: Review requests and decide whether to produce, schedule, or use existing stock.

### 4.1 Viewing Requests
- Navigate to **Production Requests**.
- View items requested by Sales.
- Status indicators:
  - **P** = Production
  - **S** = Schedule
- Filter by Approved/Rejected.

### 4.2 The Decision Process

| Decision | Action | When to Use |
|---------|--------|-------------|
| Approve | Change status to Approved | You plan to manufacture this item. |
| Reject | Change status to Rejected | Invalid or duplicate request. |
| Existing Stock (EX) | Mark as EX | Stock available; no Job Order required. |

### 4.3 Generating Outstanding Reports
Steps:
1. Click **Filter and generate outstanding report**.
2. Select **Location**.
3. Select **Item Category Group**.
4. Click **Generate**.
5. Review CSV containing:
   - Item Code
   - Description
   - Total Outstanding Quantity
   - Net Outstanding

---

## 5. Workflow B: Master List (Job Order Management)
Goal: Create factory floor instructions.

### 5.1 Creating a New Job Order
1. Navigate to **Master List**.
2. Click **+**.
3. Select **Item Code**.
4. Select **Branch** (production + stock deposition location).
5. Job Order Number:
   - Leave blank for auto-numbering.
   - Enter manually if manual mode enabled.
6. Select **Process Instance Group Name** (Job Template).
7. (Optional) Add dates/remarks.
8. Click **Create**.

### 5.2 Generating Process Instances
1. Open Job Order → **Process Instance** tab.
2. Click **Generate Process Instance**.
3. Steps are generated based on template.
4. Click a step to view:
   - Input Summary (materials)
   - Output Summary (yield)

**Inactivating Processes:**  
If semi-finished goods already exist in stock, click **Inactivate** to skip unnecessary re-production.

### 5.3 Defining Quantities (Demand)

#### Option A: Link to Sales Order (Make-to-Order)
- Navigate to **Sales Order Link** tab.
- Select the confirmed SO line.
- Enter quantity (cannot exceed balance).
- Click **Add**.

#### Option B: Ad Hoc Production (Make-to-Stock)
- Enter quantity in **Ad hoc quantity**.
- Click **Save**.
- Total quantity updates automatically.

---

## 6. Monitoring & Execution Views

### 6.1 Processes Menu
- Filter by Process Type.
- Mark steps as High Priority.
- Review Input/Output planning.

### 6.2 Sales Orders Menu
Shows production status of Sales Orders:
- Production Not Started
- In Progress
- Production Complete

Displays which Job Order fulfills which Sales Order.

---

## 7. Next Step: Manufacturing Operations
After Job Orders and Processes are created, planning is complete.

The Manufacturing Operations Applet allows operators to:
- View assigned steps
- Consume inputs
- Record outputs

### Job Order Status Dictionary

| Status | Definition |
|--------|------------|
| Planned | Job Order created; processes generated. |
| In Progress | Operators have started work. |
| On Hold | Production paused. |
| Completed | All processes finished; stock created. |

---

## 8. Application Settings & Troubleshooting

### 8.1 Application Settings
- Toggle manual Job Order numbering in **Master List Main Details**.
- Define Item Category Groups for Production Request filters.

### 8.2 FAQ

**Q: Why can't I see my Sales Order in the Link tab?**  
A: Ensure the Sales Order is confirmed and not already fully linked.

**Q: What does "EX" mean?**  
A: Request will be fulfilled using existing stock; no Job Order needed.

**Q: Why do I get an error when adding SO quantity?**  
A: Quantity entered exceeds remaining balance.

