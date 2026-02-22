---
title: "Internal Job Order Applet"
description: "Production planning and monitoring system for managing job orders, processes, and sales integrations"
tags:
  - production-planning
  - job-order
  - sales-order-integration
  - factory-monitoring
  - process-tracking
weight: 70
---

## Purpose and Overview

The **Internal Job Order Applet** is a comprehensive solution for production planning and monitoring. It serves as the bridge between sales requests and factory execution, allowing teams to transform sales orders into actionable production requests while tracking every stage of the manufacturing process.

{{< callout type="info" >}}
**Core Concept**: The system translates **customer demand** (Sales Orders) into **production tasks** (Job Orders) through predefined **workflows** (Processes).
{{< /callout >}}

### Who Benefits from This Applet?

**Sales Team:**

- Convert sales orders to production requests instantly
- Real-time visibility into production status for client updates
- Accurate lead time estimation based on current load
- Automatic notification of production completion

**Production Managers & HODs:**

- Efficient allocation of resources and work centers
- Identification of bottlenecks in the production line
- Complete oversight of outstanding job orders
- Data-driven capacity planning

**Factory & Floor Staff:**

- Clear instruction on processes and sequences
- Simplified status reporting for each production stage
- Access to detailed master specifications
- Reduced manual paperwork and communication errors

### What Problems Does This Solve?

**The Communication Gap Problem:**

Traditional production tracking relies on whiteboards and spreadsheets. Common issues include:

- Sales orders lost in translation to production
- Unclear status of urgent customer orders
- Overloaded work centers due to lack of visibility
- Manual tracking leading to data errors
- Difficulty in identifying the root cause of production delays

**The Internal Job Order Solution:**

- **Seamless Integration** - Directly link production to sales orders
- **Predefined Processes** - Ensure quality by following standardized factory steps
- **Real-Time Monitoring** - Instant status updates from the factory floor
- **Deadlines & Priorities** - Clear visibility into what needs to be done first
- **Detailed Reporting** - Comprehensive outstanding reports to prevent order backlog

## Key Features Overview

{{< cards >}}
{{< card title="Master List" subtitle="Manage work centers and resources" link="#master-list" >}}

{{< card title="Processes" subtitle="Define production stages and workflows" link="#processes" >}}

{{< card title="Sales Order" subtitle="Monitor integrated sales demand" link="#sales-order" >}}

{{< card title="Production Request" subtitle="Initiate and track manufacturing jobs" link="#production-request" >}}

{{< card title="Outstanding Report" subtitle="Identify pending and delayed orders" link="#outstanding-report" >}}
{{< /cards >}}

{{< figure src="/images/internal-job-order-applet/internal-job-order-overview-infographic.png" alt="Internal Job Order Applet Overview Infographic" caption="Visual overview of the Internal Job Order Applet's challenges, solutions, and user benefits." >}}

---

## Key Concepts

### Understanding the Production Framework

Every production system must address three fundamental aspects. The Internal Job Order Applet provides structured handling:

| Aspect                   | Component                   | Practical Example                    |
| ------------------------ | --------------------------- | ------------------------------------ |
| **Who** is demanding?    | Sales Order / Customer      | Retail Client, Wholesale Distributor |
| **What** is being made?  | Masters (SKU) & Work Center | Steel Part A, Milling Center 1       |
| **How** is it processed? | Processes & Job Order       | 3-stage assembly, Custom fabrication |

{{< callout type="tip" >}}
**Technical Note**: The system tracks active production through `JobOrderMain` data structures, ensuring fields like `jobOrderNo`, `itemCode`, and `completionDate` are maintained throughout the lifecycle.
{{< /callout >}}

### Production Hierarchy Structure

Think of the production process as a structured flow:

```
Manufacturing Plant
│
├── Resources (Master List) ──→ WHAT is being used?
│   │
│   └── Processes ──→ HOW is it being made?
│       │
│       └── Job Orders ──→ SPECIFIC production tasks
│           │
│           └── Status Updates ──→ CURRENT progress tracking
│
└── Sales Integration ──→ WHY is it being produced?
```

### The "Production Trinity"

To effectively manage the system, it is crucial to understand how **Masters**, **Processes**, and **Job Orders** work together.

| Component     | Analogy           | Definition                                                  | Example                  |
| ------------- | ----------------- | ----------------------------------------------------------- | ------------------------ |
| **Master**    | The "Blueprint"   | The technical specification of the item or resource.        | **CNC Machine 01**       |
| **Process**   | The "Recipe"      | The sequence of steps required to complete the work.        | **Drilling → Polishing** |
| **Job Order** | The "Active Task" | The actual instance of production requested for a customer. | **Job #882 - 500 units** |

**How they link:**

1. You define the **Master List** (machines, centers, and tools).
2. You create a **Process** template using those masters.
3. You generate a **Job Order** (via Production Request) that follows that Process.
4. The system tracks the Job Order against the Process stages to report real-time progress.

---

## Quick Start Guide

Get up and running with the essential production workflows.

### For Sales Team: Requesting Production

**Goal:** Turn a customer order into a production task in 4 steps.

1. **Locate Demand**: Go to **Sales Order** from the sidebar
2. **Select Order**: Find the approved sales order line (filtered for items needing production)
3. **Define Details**: Select the required quantity and set the `completionDate`
4. **Submit**: Click **Generate Job Order** → The production team is notified immediately

{{< figure src="/images/internal-job-order-applet/job-order-form.png" alt="Job Order Create/Edit Form" caption="Job Order Form: Define production quantities, completion dates, and QC requirements." >}}

---

### For Production Team: Monitoring Progress

**Goal:** Update and track the status of active jobs in 3 steps.

1. **View Jobs**: Go to **Production Request** dashboard
2. **Update Process**: As physical work completes, update the **Process Status** (e.g., "In Progress" → "QC Output")
3. **Complete Job**: Once all stages are done, mark the job as finished to notify Sales

{{< figure src="/images/internal-job-order-applet/production-request-listing.png" alt="Production Requests Dashboard" caption="Production Request Listing: Use advanced search and column toggles to track active job orders." >}}

---

### For Admins: Initial System Setup

**Goal:** Configure the production environment in 4 steps.

1. **Setup Masters**: Define your factory floor resources in **Master List**
2. **Build Processes**: Create production workflows (Step IDs, sequences, and durations) in **Processes**
3. **Configure Settings**: Set up global parameters, custom statuses, and field visibility in `Settings`
4. **Test Flow**: Create a dummy sales order and verify the production request triggers correctly

{{< figure src="/images/internal-job-order-applet/settings-page.png" alt="Production Configuration Settings" caption="Configuration & Settings: Define process dependencies, custom statuses, and printables." >}}

---

## Feature Sections

### Master List

The foundation of your production system. Here you define the "infrastructure" of your factory, including **Work Centers**, **Resource Types**, and **Machine Options**. It serves as the master registry for all production assets.

{{< figure src="/images/internal-job-order-applet/master-list.png" alt="Master List Management" caption="Master List: Manage work centers, resources, and production infrastructure." >}}

### Processes

Define the step-by-step sequences for your manufacturing. You can create different process templates (e.g., "Standard Fabrication" vs "Rapid Assembly") and link them to specific machine options for automated scheduling.

{{< figure src="/images/internal-job-order-applet/processes-page.png" alt="Production Processes Page" caption="Processes: Standardize production stages, time durations, and resource sequences." >}}

### Sales Order

An integrated view of all sales demand. This module filters sales order lines that require manufacturing, allowing you to trace any job order back to a specific customer agreement.

{{< figure src="/images/internal-job-order-applet/sales-order-list.png" alt="Sales Orders Integrated View" caption="Sales Order List: Monitor customer demand and initiate production requests." >}}

### Outstanding Report

Your primary tool for bottleneck detection. It lists all orders that are past their `completionDate` or are stuck in a particular `process_status` for too long, enabling proactive management of factory delays.

{{< figure src="/images/internal-job-order-applet/outstanding-report.png" alt="Outstanding Production Report" caption="Outstanding Report: Identify delays and monitor pending job orders by department or branch." >}}

### Audit Trail & Logs

#### Applet Log (`Settings > Applet Log`)

The Audit Trail is your system's "black box"—a comprehensive log of every action taken.

| Action     | Description                        | Example                                  |
| ---------- | ---------------------------------- | ---------------------------------------- |
| **CREATE** | New production request initiated   | User A created Job #JO-2024-001          |
| **UPDATE** | Process status or quantity changed | Completion date moved to 2024-12-15      |
| **DELETE** | Master or Process removed          | Resource "Center 01" removed from system |

---

## FAQ

**Q: Can I cancel a Job Order once it has started?**
A: Yes, provided it hasn't reached the "Final QC" stage. Canceling will trigger an automated notification to the associated Sales Representative.

**Q: What happens if production quantity exceeds the sales order?**
A: The system allows for "Over-production" if enabled in field settings. The surplus `adHocQty` is typically tracked separately or moved to buffer stock.

**Q: Can one Sales Order result in multiple Job Orders?**
A: Yes. You can split a single large sales order into multiple smaller job orders to distribute work across different work centers or machines.

**Q: How do I prioritize an urgent order?**
A: Use the "Priority" flag during Job Order creation. This highlights the task in the Production Request dashboard for immediate attention.

**Q: Where can I see history of modified job statuses?**
A: Check the **Applet Log** in Settings for a full historical record of all state transitions and user actions.

**Q: Why can't I see a specific Machine in the process list?**
A: Ensure the machine is defined in the **Master List** and its status is set to "Active".
