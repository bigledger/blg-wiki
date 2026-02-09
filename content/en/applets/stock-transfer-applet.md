---
title: "Stock Transfer Applet"
description: "Internal and outbound stock transfers between locations and warehouses with approval workflows"
tags:
- stock-transfer
- inventory-management
- warehouse
- inter-location-transfer
- stock-movement
---

## Purpose and Overview

The **Stock Transfer Applet** enables seamless movement of inventory between locations, warehouses, and bins within your organization. It provides complete visibility and control over internal stock transfers with approval workflows.

{{< callout type="info" >}}
**Core Concept**: Stock transfers move inventory from a **Source Location** to a **Destination Location**, maintaining complete traceability of all stock movements.
{{< /callout >}}

## Key Features Overview

### Who Benefits from This Applet?

**Warehouse Staff:**
- Create and process stock transfers
- Track items being transferred
- Receive incoming transfers
- Manage bin-level movements

**Inventory Managers:**
- Monitor inter-location stock movements
- Approve transfer requests
- Ensure inventory accuracy across locations
- Track transfer performance metrics

**Operations Teams:**
- Coordinate stock balancing between locations
- Manage seasonal inventory distribution
- Handle urgent stock replenishment
- Monitor transfer lead times

**Finance Teams:**
- Track inventory valuation across locations
- Ensure accurate stock costing
- Monitor high-value transfers
- Generate transfer reports

### What Problems Does This Solve?

**Traditional Stock Transfer Challenges:**
- Manual transfer tracking prone to errors
- No visibility into stock in transit
- Difficult to trace movement history
- Delayed receiving and posting
- Inconsistent transfer procedures

**The Stock Transfer Solution:**
- **Digital workflows** - Create and approve transfers electronically
- **Real-time tracking** - See transfer status at every stage
- **Complete traceability** - Full audit trail of all movements
- **Approval controls** - Multi-level approval for transfers
- **Integration ready** - Links to inventory and accounting systems

## Key Features Overview

{{< cards >}}
  {{< card title="Transfer Listing" subtitle="View all stock transfers" link="#stock-transfer-listing" >}}

  {{< card title="Create Transfer" subtitle="Initiate new stock movements" link="#create-stock-transfer" >}}

  {{< card title="Transfer Details" subtitle="View and edit transfer information" link="#transfer-details" >}}

  {{< card title="Approval Workflow" subtitle="Manage transfer approvals" link="#approval-workflow" >}}

  {{< card title="Settings" subtitle="Configure transfer options" link="#configuration--settings" >}}

  {{< card title="Personalization" subtitle="Customize your experience" link="#personalization" >}}
{{< /cards >}}

---

## Key Concepts

### Stock Transfer Types

| Type | Description | Example |
|------|-------------|---------|
| **Internal Transfer** | Between locations within same company | Main Warehouse → Branch Store |
| **Outbound Transfer** | From your location to another | HQ Warehouse → Regional DC |
| **Inbound Transfer** | Receiving from another location | Receiving from HQ |

### Transfer Status Flow

```
Draft → Submitted → In Transit → Received → Completed
                 ↓
              Rejected (if failed approval)
```

**Status Definitions:**
- **Draft**: Transfer created but not yet submitted
- **Submitted**: Awaiting approval or processing
- **In Transit**: Goods have left source location
- **Received**: Destination has acknowledged receipt
- **Completed**: Transfer fully processed and posted
- **Rejected**: Transfer was rejected by approver

---

## Quick Start Guide

### For Warehouse Staff: Create a Stock Transfer

**Goal:** Transfer stock from your location to another in 5 steps.

1. **Navigate**: Go to **Stock Transfer Listing** from the sidebar
2. **Create Header**: Click **"+"** → Enter transfer details:
   - **Source Location**: Your warehouse/location
   - **Destination Location**: Where items are going
   - **Transfer Date**: Date of transfer
   - **Reference**: Transfer reference number
3. **Add Items**:
   - Click **"Add Line"**
   - Select **Item Code** from dropdown
   - Enter **Quantity** to transfer
   - Select **Bin** (if applicable)
   - Repeat for all items
4. **Review**: Verify all items and quantities
5. **Submit**: Click **Submit** → Transfer goes for approval/processing

**What happens next?** Transfer is processed and items move to destination.

---

### For Managers: Approve Transfers

**Goal:** Review and approve pending stock transfers.

1. **Check Pending**: Go to **Pending Approvals** (notification badge shows count)
2. **Review Details**:
   - Source and destination locations
   - Items and quantities being transferred
   - Transfer justification/notes
3. **Decide**:
   - **Approve**: Click ✓ **Approve** → Transfer proceeds
   - **Reject**: Click ✗ **Reject** → Add reason → Transfer cancelled
   - **Query**: Request more information from requestor

---

### For Admins: Configure Transfer Settings

**Goal:** Set up stock transfer options and workflows.

1. **Approval Settings**: Define who can approve transfers
2. **Location Mapping**: Configure allowed transfer routes
3. **Default Settings**: Set up default values for new transfers
4. **Permissions**: Control who can create/edit/delete transfers

---

## Stock Transfer Listing

### Main Transfer Listing

View all stock transfers with filters for:
- **Status** - Draft, Submitted, In Transit, Completed
- **Date Range** - Filter by transfer date
- **Source Location** - Where transfers originate
- **Destination Location** - Where transfers go

### Key Columns

| Column | Description |
|--------|-------------|
| Transfer No | Unique transfer identifier |
| Date | Transfer date |
| Source | Origin location/warehouse |
| Destination | Receiving location/warehouse |
| Status | Current transfer status |
| Items | Number of line items |
| Total Qty | Total quantity being transferred |

---

## Create Stock Transfer

### Transfer Header

Enter the following information when creating a new transfer:

| Field | Description | Required |
|-------|-------------|----------|
| Source Location | Where items are coming from | Yes |
| Destination Location | Where items are going | Yes |
| Transfer Date | Date of the transfer | Yes |
| Reference | External reference number | No |
| Notes | Additional information | No |

### Adding Line Items

For each item to transfer:

1. **Select Item**: Choose from item master
2. **Enter Quantity**: How many units to transfer
3. **Select Bin** (if using bin management): Source bin location
4. **Add Notes**: Item-specific notes if needed

### Serial/Batch Items

For items with tracking:
- **Serial Numbers**: Select specific serial numbers to transfer
- **Batch Numbers**: Select batches and quantities

---

## Transfer Details

### Viewing a Transfer

Open any transfer to see:
- **Header Information**: Source, destination, dates
- **Line Items**: Items being transferred with quantities
- **Status History**: Complete audit trail
- **Attachments**: Supporting documents

### Editing a Transfer

Only **Draft** status transfers can be edited:
- Modify quantities
- Add/remove items
- Update notes
- Change dates

---

## Approval Workflow

### Approval Process

Depending on your organization's settings:

1. **Automatic Approval**: Low-value transfers may proceed without approval
2. **Single Approval**: One approver reviews and decides
3. **Multi-Level Approval**: Multiple approvers based on value or type

### Approval Actions

| Action | Effect |
|--------|--------|
| **Approve** | Transfer proceeds to next stage |
| **Reject** | Transfer cancelled with reason |
| **Query** | Request more information |
| **Delegate** | Assign to another approver |

---

## Configuration & Settings

### Application Settings
Configure applet behavior and default values.

### Default Settings
Set up default source/destination locations and other defaults.

### Field Configuration
Customize visible fields and column order in listings.

### Permissions
Control access to transfer functions:
- **Create** - Who can create new transfers
- **Edit** - Who can modify transfers
- **Delete** - Who can delete transfers
- **Approve** - Who can approve transfers

### Release Notes
View applet version history and updates.

### Applet Log
Audit trail of user actions within the applet.

---

## Personalization

### Personal Default Settings
Save your preferred source location and filters.

### Sidebar Customization
Arrange menu items to match your workflow.

---

## FAQ

**Q: Can I transfer items between different companies?**
A: No, stock transfers are within the same company. For cross-company movements, use Inter-Company Stock Transfer or Sales/Purchase documents.

**Q: What happens if destination rejects the transfer?**
A: The items remain at the source location. Review the rejection reason and create a new transfer if needed.

**Q: Can I track partial receipts?**
A: Yes, destination can receive partial quantities. The transfer shows partial receipt status until fully received.

**Q: How do I cancel a transfer in transit?**
A: Transfers in transit cannot be cancelled. Destination must receive and then create a return transfer.

**Q: Can I transfer items with serial numbers?**
A: Yes, you must select specific serial numbers during transfer creation. They will be moved to the destination.
