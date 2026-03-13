---
title: "Manufacturing Operations Applet"
description: "Shop floor execution system for processing job orders, recording work logs, tracking material consumption, and managing production output"
tags:
- manufacturing
- shop-floor
- production-execution
- work-logs
- material-tracking
- mrp
- operator
- supervisor
weight: 175
---

## About the Applet

- **Purpose**: A comprehensive shop floor execution system designed to bridge the gap between production planning and physical inventory movement.
- **Target Users**: Machine Operators, Production Supervisors, and Floor Managers.
- **Key Features**: Work Queue Management, Bin-Level Traceability, Real-time Time Tracking, and Gated Quality Approvals.

## Purpose and Overview

The **Manufacturing Operations Applet** is your shop floor execution hub where production actually happens. It takes the formal Job Orders created in the Production Planning & Monitoring (PPM) Applet and turns them into finished goods through structured work logging, material tracking, and supervisor approval.

{{< callout type="info" >}}
**Core Function**: Execute Job Orders → Record Work Logs → Consume Materials → Create Finished Goods → Transfer to Packing
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Machine Operators:**
- Claim and execute assigned jobs from a prioritized queue
- Record precise machine time, raw materials consumed, and measurements taken
- Report accurate production quantities directly from the floor
- Flag discrepancies instantly rather than at the end of the shift

**Production Supervisors:**
- Set dynamic job priorities to sequence operator work queues
- Review strictly formatted work logs before inventory gets permanently updated
- Intervene and place problematic jobs "On Hold"
- Ensure uncompromised quality compliance before output moves to packing

**Quality Assurance / Floor Managers:**
- Trace the exact origin bin of a raw material used in a finished good
- Audit completed measurements and specifications entered during production
- Identify discrepancies between planned versus actual yield

### What Problems Does This Solve?

**The Manual Execution Problem:**

Traditional shop floors rely on paper travelers, manual stopwatches, and memory to record production. This leads to severe issues:
- Untraceable materials where operators pick whichever bin is closest
- Inaccurate labor hour calculations as timesheets are filled out hours later
- Massive inventory discrepancies found days later when paper logs are manually typed in
- Lack of immediate visibility for supervisors to intercept quality failures

**The Manufacturing Operations Solution:**

- **Work Queue Management** — Operators see exactly what to work on next, prioritized by the supervisor
- **Bin-Level Traceability** — Operators must digitally select the exact physical bin they are drawing raw materials from
- **Live Time Tracking** — Real-time start/stop buttons capture the literal minute production shifts
- **Digital Quality Gates** — Supervisors must digitally approve the work log before the inventory state updates

{{< figure src="/screenshots/manufacturing-ops/manufacturing-ops-workflow.png.png" alt="Streamlining Production: The BigLedger Manufacturing Workflow" caption="Manufacturing Operations Workflow: Supervisors set priorities and grant approvals while operators focus on execution, logging work with start/end times, raw materials, and quantities produced." >}}

### Core Capabilities

{{< cards >}}
  {{< card title="Work Queue Management" subtitle="Dynamic, prioritized job lists for operators" link="#2-operator-pmc-executing-production" >}}

  {{< card title="Bin-Level Traceability" subtitle="Strict linking of raw material bins to finished goods" link="#material-input-bin-selection" >}}

  {{< card title="Quality Measurements" subtitle="Record OD, Heater Temp, and Die specifications" link="#quality-measurements-and-specifications" >}}

  {{< card title="Initial Check SOPs" subtitle="Verification steps before production begins" link="#the-five-tab-interface" >}}

  {{< card title="Gated Approvals" subtitle="The 'FINAL' button safety mechanism" link="#quality-gate-the-final-approval" >}}

  {{< card title="Custom Statuses" subtitle="Configure up to 10 unique process states" link="#custom-status-engines" >}}

  {{< card title="Field Configuration" subtitle="Toggle SST, Project, and Dimension visibility" link="#application-field-settings" >}}

  {{< card title="Status Management" subtitle="Complete process lifecycle control from Claim to Final" link="#process-status-lifecycle" >}}
{{< /cards >}}

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-applet-overview-infographic.png" alt="Manufacturing Operations Applet Overview: Challenges, Solutions, and Benefits" caption="Manufacturing Operations Applet: Solving manual execution challenges with digital traceability, live time tracking, and gated approvals for Operators and Supervisors." >}}

## Key Concepts

| Concept | What It Means | Example |
|---------|---------------|---------|
| **Process Instance** | Individual manufacturing step from Job Order | "Armoring" step for JO-2024-001 |
| **Work Log** | Record of production activity submitted by the operator | Time spent, bins used, quantity produced |
| **Priority Number** | Job sequence ranking set by the supervisor | 1 = highest priority, larger = lower |
| **Discrepancy** | Difference between planned and actual output | Planned 1000, produced 800 = 200 discrepancy |
| **Ready Status** | Supervisor-approved state | Process complete, safe to transfer to inventory/packing |

{{< callout type="warning" >}}
**Prerequisite**: Job Orders must be created and Process Instances fully generated in the **Production Planning & Monitoring (PPM) Applet** first. Without pending instances, there is nothing to execute in this applet.
{{< /callout >}}

## Quick Start Guide

Get up and running quickly with these essential workflows based on your role on the shop floor.

### For Production Supervisors: Managing the Queue

**Goal:** Sequence the floor's work and approve completed operations.

1. **Set Priorities**: Open the **Supervisor PI** menu. Review incoming process instances and enter a **Priority Number** for each (1 is highest priority).
2. **Monitor the Floor**: Watch processes move from "Available" to "In Progress" as operators claim them.
3. **Review Submissions**: Click on jobs marked "Pending Approval". Verify the logged time, the selected material bins, and the submitted measurements.
4. **Approve Output**: If the work log is accurate and the physical inspection passes, change the status to **Ready**. The system will now update inventory.

### For Machine Operators: Executing Work

**Goal:** Claim jobs, log accurate time, and record your actual consumed materials.

1. **Find Your Job**: Open the **Operator PMC** menu. The jobs at the top of your list (lowest priority number) are what you must work on first.
2. **Claim It**: Change the process status from "Available" to **In Progress** to let the supervisor know you've started.
3. **Clock In**: Click the **Start** button inside the Work Log the moment your machine physically begins running to precisely track your labor time.
4. **Log Materials**: Under inputs, select the exact **Bin Code** of the raw materials you loaded into the machine. 
5. **Clock Out & Submit**: Click **End** when finished, enter your **Quantity Produced**, and save the log to send it back to the supervisor for approval.

### For Admins: Initial System Setup

**Goal:** Ensure users have the correct access to their respective menus.

1. **User Permissions**: Navigate to the user profile settings within the platform.
2. **Supervisor Access**: Find the users acting as Floor Supervisors and explicitly grant them the `MRP supervisor` permission. This unlocks the **Supervisor PI** view.
3. **Operator Access**: Standard operators only need default access to see the standard **Operator PMC** execution menus.

---

## Core Workflows and Operations

### 1. Supervisor PI: Managing Production

The **Supervisor PI** (Process Instance) menu is the command center for controlling what gets produced and when, and for ensuring quality through rigid work log approval.

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-supervisor PI.png" alt="Supervisor PI Listing" caption="The Supervisor PI menu listing all production tasks." >}}

**Setting Priorities**

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-supervisor PI-update priority.png" alt="Supervisor PI Update Priority" caption="Set dynamic job priorities to sequence operator work queues." >}}

Operators see jobs ordered strictly by the priority you set here. 
- Use gaps when numbering (e.g., set jobs to 10, 20, 30) so you can easily insert rush orders later (at 15) without having to renumber everything.

#### Quality Gate (The 'FINAL' Approval)

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-supervisor PI-worklog-approval.png" alt="Supervisor PI Worklog Approval" caption="Review and approve work logs submitted by operators." >}}

When an operator finishes, the log enters `Pending Approval`. The Supervisor holds the final authority via the **Supervisor PI** view.

- **The Gated 'FINAL' Button**: The system includes a strict safety mechanism. The **FINAL** button remains disabled until:
  - Every **Input Item** has at least one associated Bin and Actual Quantity.
  - Every **Output Item** has at least one associated Bin and Actual Quantity.

**Reviewing items and verifying bins:**

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-supervisor PI-input items.png" alt="Supervisor PI Input Items" caption="Review the raw materials consumed in the input items tab." >}}

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-supervisor PI-input items-select bin.png" alt="Supervisor PI Input Items Select Bin" caption="Verify that the correct bin was selected for input items." >}}

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-supervisor PI-outout-items-main details.png" alt="Supervisor PI Output Items Main Details" caption="Review the main details of the output items." >}}

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-supervisor PI-outout-items-BIN number.png" alt="Supervisor PI Output Items Bin Number" caption="Ensure the output item is mapped to the correct destination bin." >}}
- **Data Validation**: Review recorded **PIC (Person in Charge)** and **Shift Types** to ensure accountability.
- **Reviewing Logs**: Supervisors can add **Supervisor Remarks** to work logs if corrections or feedback are required.
- **Status Lifecycle**: Once marked `Ready` or `FINAL`, inventory and costing engines update immediately.

### 2. Operator PMC: Executing Production

The **Operator PMC** (Production Management Console) translates physical production into digital records. Your accuracy directly drives inventory levels and company financials.

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-operator-pmc-listing.png" alt="Operator PMC Listing" caption="The Operator PMC work queue listing available jobs." >}}

#### Creating a Work Log

This is the most critical interaction in the applet. 

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-operator-pmc-worklog-creation.png" alt="Operator PMC Worklog Creation" caption="Create a new work log to record time and production details." >}}

**Live Time Tracking:**
Instead of typing times, click **Start** when work begins and **End** when the machine stops. The system automatically calculates Total Time spent. Do not hit Start when you merely *claim* the job; only hit Start when production begins.

#### Quality Measurements and Specifications

Inside the **Worklogs** tab, operators record critical production variables that vary by the process type:

- **OD (Outside Diameter)**: Record measurements in millimeters for the **Start**, **Mid**, and **End** of the production run.
- **Extrusion Specifications**: For relevant processes, you can record **Heater Temperature** (with UOM), **In Die (mm)**, and **Out Die (mm)**.
- **Labor Tracking**: Clock in with **Start** and **End** buttons; select your **Shift Type** and verify the **PIC** (Person in Charge).

#### Input Materials and Bin Selection

Operators must specify the exact bin where raw materials were sourced to maintain strict inventory tracking.

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-operator-pmc-input item-bin selection.png" alt="Operator PMC Input Item Bin Selection" caption="Select the bin code for the raw materials being consumed." >}}

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-operator-pmc-input item-bin number update.png" alt="Operator PMC Input Item Bin Number Update" caption="Update the bin number to log the source of the materials." >}}

#### Handling Bulk Quantities and Discrepancies

When recording the final Quantity Produced, you can enter a single quantity for one container, or utilize **Bulk Add** if the output was scattered across multiple reels, pallets, or bins.

- **Shift Discrepancy**: The system auto-calculates `Planned Quantity - Actual Quantity`. If you experience a surplus (Over Production), that excess will simply remain in safe stock for future orders.

### The Five-Tab Interface

Both Operators and Supervisors have access to a consistent, detailed view organized into five distinct tabs:
1. **Main Details**: High-level process overview and machine status.
2. **Input Items**: Detailed bin-level material consumption.
3. **Output Items**: Recording of produced semi-finished or finished goods.
4. **Initial Check**: Verification step for attachments and SOPs prior to production.
5. **Worklogs**: The primary data entry hub for time and measurements.

---

## Process Status Lifecycle

Understanding the flow of a process instance is key to mastering the shop floor:

1. **Available**: Sent from Planning; ready for an operator to claim.
2. **In Progress**: Operator has claimed the job and is physically working.
3. **Pending Approval**: Operator finished and submitted the Work Log.
4. **Ready**: Supervisor reviewed and approved the log. The item is safe to move to packing.
5. **On Hold**: Supervisor paused the job (e.g., machine broke, missing QA specs).
6. **Cancelled**: Supervisor permanently terminated the run.

---

## Configuration & Settings

### User Access Control

The applet utilizes role-based gated views.

{{< figure src="/images/manufacturing-operation-applet/manufacturing-operation-client-side-permission.png" alt="Client Side Permission" caption="Configure client-side permissions to grant MRP supervisor access." >}}

| Permission Toggle | Resulting Access | Target Role |
|-------------------|------------------|-------------|
| **(Default)** | Grants access to `Operator PMC` | Machine Operators |
| **MRP supervisor** | Unlocks `Supervisor PI` | Floor Supervisors |

*If a supervisor cannot see the approval queues, an admin must enable the `MRP supervisor` permission on their account profile.*

### Application Field Settings

Administrators can toggle the visibility and requirement of specific fields to match the company's accounting and reporting needs:

- **Financial Dimensions**: Toggle visibility for **Segment**, **G/L Dimension**, and **Profit Center**.
- **Project Tracking**: Enable/Disable the **Project** field for job-specific cost allocation.
- **Taxation Support**: Enable visibility for **SST (Sales and Service Tax)** and **WHT (Withholding Tax)**.
- **UI Customization**: Hide specific technical fields such as **Tracking ID**, **Permit No**, or detailed **Costing Details** if they are not required on the floor.

### Custom Status Engines

The system allows for deep customization of the production lifecycle through the **Custom Status** setting.

- **Header Statuses**: Define up to 5 custom statuses for the overall Process Instance header.
- **Line Statuses**: Define up to 5 custom statuses for individual production lines.
- **Status Parameters**: For each custom status, you can define the **Name**, a **Description**, and set a **Default** state.

### Machine Code Configuration

Each Work Log is explicitly tied to a predefined **Machine Code**. 
The system enforces a strict rule: **One Work Log per Machine Code per process instance**. This guarantees that machine-hour utilization reporting and maintenance tracking remain completely mathematically pure.

### Printables

Administrators can configure specific **Printable Templates** for production documents. This allows for the generation of physical labels, job sheets, or transfer notes directly from the applet once a process reaches a specific state.

---

## Frequently Asked Questions (FAQ)

**1. Why can't the operators see any Job Orders in their queue?**

First, verify that the planners actually clicked "Generate Process Instance" inside the Job Order within the PPM Applet. Second, check if the operator has accidentally filtered their view to the wrong Machine Code. Finally, ensure the job has been properly released into the "Available" state.

**2. An operator clicked 'Start' by mistake and let the timer run for 5 hours. How do we fix this?**

As long as the supervisor has not yet marked the log as `Ready`, the supervisor can manually edit the Work Log's timestamp fields inside the Supervisor PI menu to correct the actual duration before approving it.

**3. What happens if an operator selects the wrong Bin for a raw material?**

If the log hits `Ready` status, that specific bin will have its inventory depleted in the system. If this was a mistake, a manual correction via the **Internal Stock Adjustment Applet** is required to fix the physical vs system bin balances.

**4. Can an operator put a job 'On Hold' if their machine breaks down?**

No, only supervisors can place jobs `On Hold` or `Cancelled`. The operator must physically inform the supervisor, who will then update the status in the Supervisor PI menu so the delay is formally noted in management reports.

**5. Why is the Supervisor PI menu completely missing from my sidebar?**

You lack the necessary administrative permission. Your system administrator must go to your user profile and explicitly enable the `MRP supervisor` client-side permission. You will need to log out and log back in for the menu to appear.

**6. I am a supervisor, but the 'FINAL' button is greyed out. Why?**

The system enforces strict data completeness. The **FINAL** button will not enable until **every single line** in both the 'Input Items' and 'Output Items' tabs has an assigned **Bin** and a recorded **Actual Quantity**. Check those tabs for any missing or zero-quantity lines.