---
title: "Internal Packing Order Applet"
description: "Comprehensive manufacturing and production control applet for managing job orders, packing workflows, output tracking, and scrap management."
tags:
- manufacturing
- production
- job-order
- scrap-management
- operator-queue
- packing
weight: 150
---

{{< callout type="warning" >}}
**Work in Progress:** This document is actively being updated. Sections may be incomplete or subject to change as new versions of the applet are documented.
{{< /callout >}}

## Purpose and Overview

The **Internal Packing Order Applet** is a specialized capability within the manufacturing suite designed to manage the production floor, specifically the coiling, packing, and output tracking workflows. It provides distinct views tailored for factory floor operators and production supervisors.

{{< callout type="info" >}}
**Core Concept:** This applet handles the conversion of raw materials into finished, packed goods. It tracks production requests (Job Orders), handles machine and operator queues, logs input components, records output items, and properly accounts for production scrap.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Machine Operators:**
- Simplified **Operator Queue** interface to see assigned tasks.
- Dedicated **Operator Coiling** interface for straightforward production logging.
- Clear step-by-step UI to record outputs without navigating complex ERP screens.

**Production Supervisors:**
- Comprehensive **Supervisor Coiling** and **Internal Packing Order** control panels.
- Ability to override, adjust, and approve operator production logs.
- Full visibility into input consumption versus output yield.

**Inventory & Production Managers:**
- Automated real-time stock deduction for consumed raw materials (Inputs).
- Automated stock increment for finished goods (Outputs).
- Visibility into **Scrap** metrics and material loss.

### What Problems Does This Solve?

**The Disconnected Shop Floor Problem:**
Traditional ERP systems are often too complex for use on the factory floor. Operators use paper logs, resulting in delayed inventory updates, lost data, and a lack of real-time visibility for supervisors.

**The Internal Packing Order Solution:**
- **Role-Based Interfaces**: Simple touch-friendly screens for Operators; data-rich screens for Supervisors.
- **Real-Time Data**: As soon as an operator completes a task in the queue, inventory is updated. 
- **Centralized Work Queues**: Supervisors assign jobs digitally; operators pick tasks from their screen.

## Key Features Overview

{{< cards >}}
  {{< card title="Operator Queue" subtitle="Task list for machine operators" link="#operator-queue" >}}
  {{< card title="Supervisor Control" subtitle="Override and review production logs" link="#supervisor-coiling--packing-order" >}}
  {{< card title="Job Orders" subtitle="Manage production requests" link="#job-orders--packing-requests" >}}
  {{< card title="Scrap Management" subtitle="Account for material waste" link="#scrap" >}}
  {{< card title="Coiling Workflows" subtitle="Specialized manufacturing processes" link="#coiling-workflows" >}}
  {{< card title="Delivery Details" subtitle="Track routing for finished goods" link="#feature-sections--tabs" >}}
  {{< card title="Contra Tracking" subtitle="Trace documents linked to production" link="#feature-sections--tabs" >}}
  {{< card title="Role Permissions" subtitle="Strict operator/supervisor separation" link="#configuration--settings" >}}
{{< /cards >}}

## Key Concepts

### Understanding the Production Hierarchy

The Internal Packing Order module relies on a structured flow from request to output:

1. **Job Order / Packing Request**: The initial trigger stating *what* needs to be made and *when*.
2. **Operator Queue**: The assigned tasks sitting on a specific machine or operator's workstation.
3. **Execution**: The operator uses the "Operator Coiling" module to log work.
4. **Input Items**: The raw materials consumed (deducted from inventory).
5. **Output Items**: The final packed product generated (added to inventory).
6. **Supervisor Review**: Supervisors use the Packing Order or Supervisor Coiling view to finalize and adjust the raw data.

### Input vs. Output vs. Scrap

| Component | Definition | Inventory Impact |
|-----------|------------|------------------|
| **Input Item** | The raw material used to manufacture the product. | Negative (Decreased stock) |
| **Output Item** | The finished, packed good ready for sale or transfer. | Positive (Increased stock) |
| **Scrap** | Waste material generated during the production process. | Tracked as yield loss |

---

## Quick Start Guide

### For Supervisors: Creating a Packing Order

1. Navigate to **Internal Packing Order** from the sidebar.
2. Click the **"+" (Create)** button.
3. **Main Details Tab**: Enter document title, select branch, and assign operators/machines.
4. **Lines Tab**: Add the expected **Output Items** (what you want the operator to produce).
5. **Operator Queue Tab**: Assign the tasks to specific queues.
6. Click **Save**. The task is now visible to the operators on the floor.

### For Operators: Executing a Task

1. Navigate to the **Operator Queue** on your terminal.
2. Select your currently assigned task from the list.
3. The system directs you to the execution screen (e.g., Operator Coiling).
4. Enter the actual quantities you produced.
5. Log any scrap generated during the process.
6. **Submit**. The system updates the Job Order status.

---

## Feature Sections & Tabs

Depending on your access level (`SHOW_SUPERVISOR_VIEW`), different tabs and modules are exposed.

### Sidebar Modules
- **Operator Queue**: The default landing page for operators to see pending tasks.
- **Operator Coiling**: Specialized interface for logging cable/wire coiling production.
- **Supervisor Coiling**: Advanced interface for managers to review coiling logs.
- **Packing Request & Job Order**: Modules for generating initial production demand.
- **Internal Packing Order**: The master control document for the entire process.
- **Urgent Sales Order**: Fast-track queue for customer orders requiring immediate assembly.
- **Scrap**: Listing view of all accumulated production waste.

### Packing Order Editor Tabs

When editing an Internal Packing Order, the following tabs are available:

1. **Search**: Find active or historical Job Orders and Packing Requests to link.
2. **Main Details**: Document metadata, date, branch assignment, and reference numbers.
3. **Account**: Link the packing order to a specific customer account (for custom manufacturing).
4. **Lines**: The core table mapping Input Items against Output Items.
5. **Operator Queue**: Assign specific schedule blocks to individual machines or operators.
6. **Delivery Details**: Specify warehouse routing for the completed outputs.
7. **Contra**: View related downstream documents (like Delivery Orders based on this production).
8. **Doc Link**: Link this internal order to external reference files.
9. **Attachments**: Upload production schematics, QC photos, or reference manuals.
10. **Export**: Export the final production docket to PDF/CSV. *(Note: Hidden while the document is in TEMP/Draft mode)*.

---

## Configuration & Settings

To access the configuration panel, click **Settings** at the bottom of the sidebar. These settings dictate how the packing process behaves globally.

### 1. Default Selection
Configure fallback behaviors:
- **Default Branch**: The warehouse assigned if the user doesn't pick one.
- **Default Document Status**: Will new Packing Orders start as Draft or Active?

### 2. Field Settings
Control UI visibility across the applet. Ensure that shop floor displays are kept simple by hiding unnecessary financial fields from Operators.

### 3. Return Reasons Settings
Define standard scrap and return reasons (e.g., "Machine Jam", "Material Defect", "Operator Error"). Having clean categories helps with yield reporting later.

### 4. Printable Format Settings
Customize the layout of the physical "Job Ticket" or "Production Docket" that might be printed and attached to the material cages on the floor.

### 5. Feature Visibility & Permissions
- Define who is an Operator vs. a Supervisor.
- Assign the `SHOW_SUPERVISOR_VIEW` permission flag to management roles.

---

## FAQ

**Q: Can an Operator finalize (post) a Packing Order?**
A: Typically, no. Operators log execution data into the Operator Queue. A Supervisor reviews the variances (Input vs Output) and clicks **Final** on the master Internal Packing Order document to solidify the inventory movement.

**Q: Where does Scrap go?**
A: Scrap is tracked against the specific Job Order. It explains the variance between the expected Input consumption and actual Output yield. It can optionally be routed to a designated "Scrap Bin" in inventory for later recycling or write-off, depending on your warehouse settings.

**Q: What is "Operator Coiling"?**
A: Coiling is a specific manufacturing sub-module tailored to industries dealing in lengths (cables, wires, pipes). It has specialized calculators for length, cut-loss, and spool tracking that differ from standard unit-based assembly.
