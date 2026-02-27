# Internal Sales Credit Note Applet

## 1. Overview

The **Internal Sales Credit Note Applet** is used to **correct, adjust, or reverse previously issued sales invoices**. Common use cases include:

- Incorrect pricing or billing amounts  
- Returned goods or service reversals  
- Sales discounts issued after invoicing  
- Marketplace fees or post-sales adjustments (e.g. Shopee, Lazada)

A Sales Credit Note **reduces the customerâ€™s outstanding balance** either by:
- **Contra** against existing or future invoices, or  
- **Settlement** where actual cash movement occurs.

> **Important**: Sales Credit Notes do **not** affect inventory quantities. They are purely accounting adjustments posted to the General Ledger (GL).

---

## 2. Prerequisites â€“ Creating Account Code Items

Before creating a Sales Credit Note, ensure the required **Account Code Type items** exist.

### Why Account Code Type Items?

- Credit Notes post **directly to GL accounts**
- They are **non-inventory items**
- Commonly used for:
  - Sales discounts
  - Administrative charges
  - Marketplace transaction fees
  - Service reversals or adjustments

---

### Option A: Create via Doc Item Maintenance Applet

1. Click the **Plus (+)** button to create a new item.
2. Enter:
   - **Item Code**
   - **Item Name**  
     _(Example: Sales Discount, Marketplace Fee)_
3. **Critical Step**:  
   - Set **Item Type** = **Account Code Type**
4. Go to the **Company Linking** tab:
   - Select the company
   - Assign the **Default GL Code**  
     _(Example: Sales Revenue Adjustment, Discount Given)_
5. Save the item.

---

### Option B: Create via Chart of Account Applet

1. Open the **Chart of Account Applet**
2. Navigate to **GL Code Create Item**
3. Search for the relevant **GL Category**
4. Select the required **GL Code**
5. Click **Create Item**

> The system automatically creates and links the item as an **Account Code Type**.

**Best Practice**: Use this option to ensure accurate GLâ€“Item mapping.

---

## 3. Listing Screen Navigation

The **Listing Screen** allows you to manage and monitor all Sales Credit Notes.

### Search By
- Customer  
- Branch  
- Sales Agent  

### Filter By
- Creation Date  
- Transaction Date Range  
- Posting Status:
  - Draft
  - Final
  - Void
  - Discard

### Common Actions
- View transaction details
- Edit Draft documents
- Track posting, contra, and settlement status
- Audit historical credit adjustments

---

## 4. Step-by-Step Credit Note Creation

Click the **Plus (+)** button to create a new Sales Credit Note.

---

### 4.1 Main Details Tab

Configure the transaction header information:

- Branch  
- Location  
- Sales Agent  
- Transaction Date  
- Reference Number (optional)  
- Remarks / Notes  
- Currency  
  - Forex transactions are supported (subject to configuration)

> Default values may auto-populate based on user personalization.

---

### 4.2 Account Tab

- Select an existing **Customer**, or  
- Click **Plus (+)** to create a new customer on the fly

> The selected customer controls available Contra and Settlement options.

---

### 4.3 Line Tab

1. Select the **Account Code Item**
   - Must be **Account Code Type**
2. Enter:
   - Amount
   - Optional line remarks

**Examples**
- Marketplace commission fee
- Post-invoice discount
- Service or billing adjustment

---

### 4.4 Status Management

Each Sales Credit Note follows a defined lifecycle:

- **Draft**
  - Editable
  - No accounting impact
- **Final**
  - Posted to GL
  - Available for Contra or Settlement
- **Void**
  - Reverses accounting impact
- **Discard**
  - Cancelled before posting

> Only **Final** documents affect financial reports.

---

## 5. Contra vs Settlement Handling

Understanding the difference is essential for correct accounting treatment.

---

### 5.1 Contra

**Purpose**  
Used to offset the credit note against **existing or future invoices**.

**Typical Use Cases**
- Overbilling corrections
- Credit applied to next invoice

**Steps**
1. Go to the **Contra Tab**
2. Click **Plus (+)**
3. System displays open invoices for the **same customer and branch**
4. Enter the contra amount
5. Click **Add**

> Contra does **not** involve cash movement.

---

### 5.2 Settlement

**Purpose**  
Used when **actual money is exchanged**.

**Examples**
- Cash or bank refund
- Credit card refund
- Marketplace payout after deducting fees

**Behavior**
- Integrated with **Cashbook / Bank modules**
- Updates payment and reconciliation records

> Use Settlement **only** when real financial transactions occur.

---

## 6. Advanced Features

### 6.1 Importing Sales Credit Notes

- Download the **Sales Credit Note Import Template**
- Fill in required fields offline
- Upload the completed file to create records in bulk

**Recommended For**
- Marketplace adjustments
- Monthly reconciliations
- High-volume credit processing

---

### 6.2 App Settings

Administrators can configure:
- Field visibility (e.g. Settlement Date)
- User permissions on settlement editing
- Posting and workflow restrictions

---

### 6.3 Personalization

Users can define:
- Default Branch
- Default Location

This reduces manual input and improves efficiency.

---

## 7. Accounting Logic (Debit / Credit)

When a Sales Credit Note is **Finalized**, the system posts:

| Entry | Account |
|-----|--------|
| Debit | GL account linked to the Account Code Item |
| Credit | Trade Debtors (Customer Account) |

### Accounting Impact
- Reduces customer receivables
- Adjusts revenue or expense accounts
- Fully traceable for audit and reporting

---

## 8. Key Notes & Best Practices

- Verify GL mappings before finalizing
- Prefer **Contra** for non-cash adjustments
- Use **Settlement** only when money moves
- Do not use inventory items
- Use Import for bulk or recurring adjustments

---

## 9. Conclusion

The **Internal Sales Credit Note Applet** provides a controlled and auditable way to manage sales corrections and receivable adjustments. Proper usage ensures accurate financial reporting, clean audit trails, and operational flexibility.

