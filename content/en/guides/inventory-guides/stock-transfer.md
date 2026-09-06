---
description: Manage inventory movements between locations.
tags:
- user-guide
title: Stock Transfer Procedures
weight: 20
---

Manage inventory movements between locations.

## Transfer Types

### Inter-Warehouse Transfer
Moving stock between warehouses:
1. Create transfer order
2. Pick items
3. Ship to destination
4. Receive at target
5. Update inventory

### Inter-Branch Transfer
Between company branches:
- Transfer pricing
- Tax implications
- Documentation
- Permission-controlled finalisation

## Transfer Process

### Initiation
1. Create transfer request
2. Check availability
3. Get sign-off from whoever your policy names
4. Generate transfer order

### Execution
1. Pick items
2. Pack and label
3. Create shipping docs
4. Update in-transit
5. Track shipment

### Completion
1. Receive goods
2. Verify quantities
3. Handle discrepancies
4. Update inventory
5. Close transfer

## Controls

### Sign-off points

Stock transfers have **no approval engine** — BigLedger will not route a transfer to anyone. These
are the four points where your policy should require a named person, enforced by who holds the
relevant permission:

- Raising the request
- Releasing the shipment
- Receiving the goods
- Accepting a variance

If you want a system-managed sign-off on a stock request, use a
[Stock Requisition](/applets/inventory-workflow/internal-stock-requisition-applet/) — it is the one
inventory document the approval engine covers ([Document Approvals](/guides/document-approvals/)).

### Documentation
- Transfer order
- Packing list
- Delivery note
- Receipt confirmation

---

*Transfer support: inventory@bigledger.com*