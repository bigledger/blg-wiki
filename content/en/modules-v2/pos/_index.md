---
title: "Point of Sales (POS) Module"
description: "Retail counter operations, touch-optimized checkout, POS terminal management, and daily cashier reconciliation with offline/online sync."
weight: 30
---

## 1. Module Overview

The **Point of Sales (POS) Module** powers retail store and counter sales operations. Designed with speed, reliability, and modern aesthetics in mind, it provides touch-optimized cashier interfaces, barcode scanning, multi-payment method processing, and offline-first reliability. The module seamlessly integrates with the Inventory module for real-time stock deductions and the Financial Accounting module for daily Z-Report ledger reconciliation.

**Business Value:**
- **Fast, Touch-Optimized Checkout**: Rapid product selection, customizable quick keys, and barcode scanning support (1D/2D).
- **Real-Time Stock Updates**: Automatic inventory deductions on every sale prevent overselling across channels.
- **Flexible Payment Methods**: Split payments across cash, credit/debit cards (EMV, NFC), digital wallets (Apple/Google Pay), QR codes, store credits, layaways, and BNPL.
- **Offline-First Resilience**: Transactions are stored locally when internet is disconnected and auto-synced when connection is restored.
- **Unified Retail Management**: Centralized control of multiple stores, terminals, localized price lists, and promotions.

### Hardware & Gateway Integrations

- **Supported Peripherals**: Receipt printers (Epson, Star Micronics, Bixolon, Bluetooth), USB/Bluetooth barcode scanners, cash drawers (USB or printer-triggered), customer-facing displays, and digital weighing scales.
- **Payment Gateways**: Stripe, Square, PayPal, Adyen, Worldpay, and regional gateways.

---

## 2. Key Concepts & Terminology

| Term | Definition |
|------|-----------|
| **POS Terminal** | A configured checkout station (hardware + software) where sales transactions are processed. |
| **Cash Float** | The opening cash amount placed in the till at the start of a shift. |
| **Z Report** | The end-of-day summary report that locks cashier totals for reconciliation and closes the shift. |
| **Split Payment** | A transaction where the customer pays using multiple payment methods (e.g., cash + card). |
| **Suspended Sale** | Parking a current checkout transaction to process another customer, then retrieving it later. |
| **Layaway / Installment** | Reserving goods for a customer who pays in installments before final collection. |
| **Quick Keys** | Customizable layout shortcuts on the POS screen for fast-selling items without barcodes. |

---

## 3. Included Applets

### Core POS Applets

| Applet | Purpose |
|--------|---------|
| [POS Terminal Applet](/applets/sales-workflow/pos-terminal-applet/) | Main touch-friendly checkout screen for cashiers to scan, apply discounts, and collect payments. |
| [POS General Applet](/applets/sales-workflow/pos-general-applet/) | Central system configuration panel for terminal licenses, sync profiles, and offline settings. |
| [Store Configuration Applet](/applets/sales-workflow/store-configuration-applet/) | Manage store profiles, operating hours, local pricebooks, promotions, and terminal assignments. |
| [POS Offline Sync Applet](/applets/sales-workflow/pos-offline-sync-applet/) | Monitor local caches, review transaction sync queues, and resolve conflict errors. |
| [Receipt Management Applet](/applets/sales-workflow/receipt-management-applet/) | Design custom receipt layouts, configure logo headers/footers, and select printer outputs. |
| [Daily Cashier Report Applet](/applets/sales-workflow/daily-cashier-report-applet/) | Perform end-of-day cashier reconciliations, count cash drawer variances, and generate Z Reports. |
| [POS Reports Applet](/applets/sales-workflow/pos-reports-applet/) | Analytical reports covering daily sales summaries, hourly sales, cashier performance, and payment breakdown. |

---

## 4. Standard Business Workflows

### Workflow 1: Daily Retail Operations

```
Open Shift (Float) ──▶ Process Sales ──▶ Handle Returns ──▶ Z Report ──▶ Cash Reconciliation ──▶ Close Shift
```

**Steps:**
1. Cashier logs into the **POS Terminal Applet** and enters the opening cash float.
2. Throughout the shift, sales are processed by scanning items and collecting payments.
3. Returns are processed against original receipts.
4. At shift end, the cashier generates the **Z Report** via the **Daily Cashier Report Applet**.
5. Physical cash is counted, compared to the Z Report total, and deposited.

### Workflow 2: Suspended (Parked) Sale Processing

```
Scan Items ──▶ Customer Pauses ──▶ Suspend Sale ──▶ Process Next Customer ──▶ Retrieve Sale ──▶ Finalize
```

**Steps:**
1. Cashier scans items for Customer A, but the customer realizes they forgot an item.
2. Cashier clicks **Suspend Sale** to park the transaction; the drawer screen clears.
3. Cashier checks out Customer B normally.
4. When Customer A returns, cashier clicks **Retrieve Sale**, selects Customer A's parked ticket, scans the additional item, and finalizes checkout.

### Workflow 3: Returns & Exchange Workflow

```
Scan Receipt ──▶ Select Return Items ──▶ Input Reason ──▶ Approve Variance ──▶ Refund or Store Credit
```

**Steps:**
1. A customer brings back an item. Cashier scans the barcode on the original receipt to retrieve the transaction.
2. Cashier selects the return items and inputs the return reason (e.g., defective).
3. If price overrides or supervisor approval is needed, the manager inputs their credentials.
4. System updates inventory levels.
5. Refund is processed via cash, card reverse, or issued as a store credit voucher.

### Workflow 4: Offline POS Operations & Re-sync

```
Loss of Connection ──▶ Offline Mode Active ──▶ Local DB Storage ──▶ Connection Restored ──▶ Auto-Sync
```

**Steps:**
1. The terminal detects network disconnection; the **POS Terminal Applet** switches seamlessly to offline mode.
2. Cashiers process sales as usual; data is cached in the local browser/device database.
3. Once the network connection is restored, the **POS Offline Sync Applet** automatically pushes queued transactions to the cloud.
4. Central inventory and accounting modules update automatically.

---

## 5. Roles & Permissions

| Role | Primary Applets | Key Responsibilities |
|------|----------------|---------------------|
| **Cashier** | POS Terminal | Process sales, handle payments, check customer loyalty points, basic returns |
| **Store Supervisor** | POS Terminal, Daily Cashier Report | Override prices, approve refunds/discounts, check drawer cash, close cashier shifts |
| **Store Manager** | Daily Cashier Report, POS General, Store Config | Configure terminal setups, review daily sales performance, manage inventory receipts/transfers |
| **IT Administrator** | POS General, Receipt Management, Sync | Maintain hardware integrations, sync parameters, receipt templates, and error resolution |

---

## 6. Prerequisites / Initial Setup

Before going live with the Point of Sales Module, ensure:

- [x] **Core Module** — Branch and location configured for the retail outlet
- [ ] **Inventory Item Maintenance** — Products configured with barcodes, categories, and tax codes
- [ ] **Chart of Accounts** — Cashbook accounts mapped to POS payment types (cash, credit card, e-wallets)
- [ ] **Store Configuration Applet** — Store profile, operating hours, and terminal IDs registered
- [ ] POS hardware connected (receipt printer, barcode scanner, cash drawer, customer display)
- [ ] Payment gateway integration credentials configured in POS Settings
- [ ] Cashiers and supervisors assigned to their respective permission groups

---

## 7. FAQs & Troubleshooting

**Q: The POS terminal is not deducting stock after a sale.**
A: Check the stock integration settings in the **POS General Applet**. Ensure the terminal is linked to the correct warehouse/location.

**Q: A cashier's Z Report shows a cash shortage. What should I do?**
A: Review individual transactions in the **Daily Cashier Report** to identify voided sales, manual discounts, or unrecorded cash-outs. Follow your organization's cash variance policy.

**Q: Can I use the POS offline without internet?**
A: BigLedger POS supports offline mode for basic transactions. When connectivity is restored, queued transactions sync automatically.

**Q: The receipt printer is printing gibberish or blank paper.**
A: Verify that the correct driver or print template language (e.g., ESC/POS) is selected in the **Receipt Management Applet**. For blank paper, verify the thermal roll is loaded facing the correct direction.

### Common Error Codes

- **POS001**: Network connection lost. Terminal is operating in offline mode.
- **POS002**: Payment gateway timeout. Check gateway credentials and internet connection.
- **POS003**: Insufficient inventory. The item is out of stock in the linked warehouse.
- **POS004**: Invalid barcode. The scanned code is not registered in Item Maintenance.
- **POS005**: Printer error. Verify printer connectivity, paper feed, or buffer clearing.
