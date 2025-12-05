---
title: "Asset Management"
description: "Evaluate asset registration, tracking, depreciation, and disposal (Requirements 9.57-9.65)"
weight: 7
---

This section covers the comprehensive Asset Management functionality as specified in UTM Tender Requirements 9.57-9.65. Our system provides complete asset lifecycle management from acquisition to disposal with full integration to the financial system.

## Overview

The Asset Management module addresses:
- **Asset Receipt (9.57)** - Recording incoming assets
- **Asset Registration (9.58)** - Formal asset recording with QR codes
- **Asset Record Update (9.59)** - Maintaining asset information
- **Asset Transfer (9.60)** - Moving assets between locations/custodians
- **Asset Loan (9.61)** - Temporary asset assignments
- **Asset Maintenance (9.62)** - Service and repair tracking
- **Asset Disposal (9.63)** - End-of-life processing
- **Asset Inspection (9.64)** - Physical verification
- **Asset Loss (9.65)** - Lost asset handling

## Test Scenario 1: Asset Receipt

### Objective
Test the asset receipt process when goods arrive (Requirement 9.57).

### Steps to Follow

1. **Login** to the demo system
2. **Navigate** to: `Assets` → `Asset Receipt`
3. **Create** new asset receipt:
   - **Source:** Purchase Order / Direct Receipt
   - **Supplier:** Select vendor
   - **Items:** List of received assets
   - **Quantity:** Number of items
4. **Process** the receipt

### What to Verify

**Integration Capabilities (9.57a-c):**
| Requirement | Feature |
|-------------|---------|
| Module Integration | Links to Purchasing, Inventory |
| System Integration | Ready for external system data |
| Comprehensive System | Full asset management coverage |

### Expected Results
- Receipt recorded with reference
- Assets ready for registration
- Link to purchase documentation
- Audit trail created

---

## Test Scenario 2: Asset Registration

### Objective
Test formal asset registration with QR code generation (Requirement 9.58).

### Steps to Follow

1. **Navigate** to: `Assets` → `Asset Registration` → `New Asset`
2. **Register** a new asset:
   - **Asset Code:** Auto-generated or manual
   - **Description:** Computer Workstation
   - **Category:** Office Equipment
   - **Location:** Block A, Room 101
   - **Custodian:** Finance Department
   - **Acquisition Date:** Purchase date
   - **Acquisition Cost:** RM 5,000
3. **Generate** QR Code
4. **Save** the registration

### What to Verify

**Registration Features (9.58a-i):**
| Requirement | Feature |
|-------------|---------|
| Integration | Links to procurement and receiving |
| Complete Management | Full lifecycle support |
| Asset Classification | Categories and sub-categories |
| Custodian Recording | Who is responsible |
| Asset Documentation | Supporting documents attached |
| Warranty Tracking | Warranty period management |
| Depreciation Config | Automatic calculation setup |
| QR Code | Unique identifier generation |
| Disposal Control | Lifecycle tracking |

### Expected Results
- Asset registered with unique code
- QR code generated for tracking
- Depreciation schedule created
- GL posting for asset value

---

## Test Scenario 3: Asset Record Update

### Objective
Test asset information maintenance capabilities (Requirement 9.59).

### Steps to Follow

1. **Navigate** to: `Assets` → `Asset Register`
2. **Search** for an existing asset
3. **Update** asset details:
   - Change location
   - Update custodian
   - Add maintenance notes
   - Attach documents
4. **Save** changes

### What to Verify

**Update Capabilities (9.59a-e):**
| Feature | Capability |
|---------|------------|
| Location Update | Change physical location |
| Custodian Change | Transfer responsibility |
| Status Update | Active, Inactive, Under repair |
| Document Management | Add/remove attachments |
| Audit Trail | Track all changes |

### Expected Results
- Changes saved with timestamp
- Previous values maintained in history
- Notification to relevant parties
- Complete audit trail

---

## Test Scenario 4: Asset Transfer

### Objective
Test asset transfer between departments/locations (Requirement 9.60).

### Steps to Follow

1. **Navigate** to: `Assets` → `Asset Transfer` → `New Transfer`
2. **Create** transfer request:
   - **Asset:** Select asset(s)
   - **From Location:** Current location
   - **To Location:** Destination
   - **From Custodian:** Current holder
   - **To Custodian:** New holder
   - **Reason:** Transfer justification
3. **Submit** for approval
4. **Approve/Complete** transfer

### What to Verify

**Transfer Features (9.60a-f):**
| Requirement | Feature |
|-------------|---------|
| Module Integration | Updates all linked records |
| System Integration | External system updates |
| Comprehensive System | Complete tracking |
| Notification | Auto-alert to parties |
| Workflow | Approval process |
| Recording | Complete audit trail |

### Expected Results
- Transfer request created
- Approval workflow triggered
- Both parties notified
- Asset record updated upon completion

---

## Test Scenario 5: Asset Loan

### Objective
Test temporary asset assignment functionality (Requirement 9.61).

### Steps to Follow

1. **Navigate** to: `Assets` → `Asset Loan` → `New Loan`
2. **Create** loan request:
   - **Asset:** Select available asset
   - **Borrower:** Person/Department
   - **Loan Date:** Start date
   - **Expected Return:** Due date
   - **Purpose:** Reason for loan
3. **Process** the loan

### What to Verify

**Loan Features (9.61a-g):**
| Requirement | Feature |
|-------------|---------|
| Integration | Module connectivity |
| System Integration | External system support |
| Complete Management | Full loan lifecycle |
| Loan Recording | All details captured |
| Status Tracking | Borrowed, Returned status |
| Overdue Monitoring | Alert for overdue items |
| Mobile Support | Mobile-friendly interface |

### Expected Results
- Loan recorded with due date
- Asset status updated
- Reminder notifications scheduled
- Return processing available

---

## Test Scenario 6: Asset Maintenance

### Objective
Test maintenance and service history tracking (Requirement 9.62).

### Steps to Follow

1. **Navigate** to: `Assets` → `Asset Maintenance` → `New Record`
2. **Record** maintenance:
   - **Asset:** Select asset
   - **Maintenance Type:** Repair/Service/Upgrade
   - **Date:** Service date
   - **Cost:** Maintenance cost
   - **Vendor:** Service provider
   - **Description:** Work performed
3. **Save** the record

### What to Verify

**Maintenance Features (9.62a-e):**
| Requirement | Feature |
|-------------|---------|
| Integration | Links to asset record |
| Complete Management | Full maintenance history |
| Schedule Support | Preventive maintenance |
| Cost Tracking | Maintenance costs recorded |
| Warranty Impact | Warranty consideration |

### Expected Results
- Maintenance logged to asset
- Cost recorded for reporting
- Service history viewable
- Maintenance alerts configurable

---

## Test Scenario 7: Asset Disposal

### Objective
Test asset disposal/write-off process (Requirement 9.63).

### Steps to Follow

1. **Navigate** to: `Assets` → `Asset Disposal` → `New Disposal`
2. **Process** disposal:
   - **Asset:** Select asset(s)
   - **Disposal Type:** Sale/Write-off/Donation
   - **Disposal Date:** Effective date
   - **Proceeds:** Sale amount (if applicable)
   - **Reason:** Justification
3. **Submit** for approval
4. **Complete** disposal

### What to Verify

**Disposal Features (9.63a-e):**
| Requirement | Feature |
|-------------|---------|
| Integration | GL impact posting |
| Complete Management | End-to-end process |
| Approval Workflow | Authorization required |
| Gain/Loss Calculation | Automatic computation |
| Audit Trail | Complete documentation |

### Expected Results
- Disposal request recorded
- Approval obtained
- GL entries posted (gain/loss)
- Asset marked as disposed
- History retained for audit

---

## Test Scenario 8: Asset Inspection

### Objective
Test physical asset verification capabilities (Requirement 9.64).

### Steps to Follow

1. **Navigate** to: `Assets` → `Asset Inspection` → `New Inspection`
2. **Create** inspection:
   - **Location:** Select area to inspect
   - **Inspector:** Assigned person
   - **Date:** Inspection date
3. **Generate** location list
4. **Perform** verification (mark found/not found)
5. **Submit** results

### What to Verify

**Inspection Features (9.64a-e):**
| Requirement | Feature |
|-------------|---------|
| Integration | Updates asset status |
| Complete Management | Full verification process |
| Location List | Generate assets by location |
| Mobile Support | Mobile-friendly verification |
| Variance Reporting | Missing asset identification |

### Expected Results
- Inspection checklist generated
- QR code scanning support
- Discrepancies flagged
- Follow-up actions triggered

---

## Test Scenario 9: Asset Loss Reporting

### Objective
Test lost asset handling process (Requirement 9.65).

### Steps to Follow

1. **Navigate** to: `Assets` → `Asset Loss` → `Report Loss`
2. **Report** lost asset:
   - **Asset:** Identify lost item
   - **Discovery Date:** When noticed
   - **Last Known Location:** Where last seen
   - **Circumstances:** How it was lost
   - **Police Report:** Reference number (if applicable)
3. **Submit** report

### What to Verify

**Loss Handling Features (9.65a-d):**
| Requirement | Feature |
|-------------|---------|
| Integration | Status update across system |
| Complete Management | End-to-end loss process |
| Case Tracking | Investigation workflow |
| Financial Impact | Book value write-off |

### Expected Results
- Loss report created
- Investigation workflow initiated
- Asset status updated
- Financial adjustments processed

---

## Test Scenario 10: Depreciation Calculation

### Objective
Test automatic depreciation processing.

### Steps to Follow

1. **Navigate** to: `Assets` → `Depreciation` → `Run Depreciation`
2. **Configure** depreciation run:
   - **Period:** Month/Year
   - **Asset Category:** All or specific
3. **Preview** depreciation amounts
4. **Post** depreciation entries

### What to Verify

**Depreciation Features:**
| Method | Support |
|--------|---------|
| Straight-Line | Supported |
| Declining Balance | Supported |
| Units of Production | Configurable |
| Sum of Years Digits | Configurable |

### Expected Results
- Depreciation calculated correctly
- GL journal entries created
- Accumulated depreciation updated
- Asset NBV (Net Book Value) updated

---

## Key Features Demonstrated

### Asset Lifecycle Management
- Acquisition → Registration → Use → Maintenance → Disposal
- Complete tracking at every stage
- Audit trail throughout

### QR Code Tracking
- Unique QR per asset
- Mobile scanning support
- Quick asset lookup
- Physical verification aid

### Financial Integration
- Acquisition posting
- Depreciation posting
- Disposal gain/loss
- Budget validation

### Reporting
- Asset register report
- Depreciation schedule
- Location-wise report
- Category analysis

---

## Navigation Tips

| Task | Menu Path |
|------|-----------|
| Asset Receipt | Assets → Asset Receipt |
| Asset Registration | Assets → Asset Registration |
| Asset Register | Assets → Asset Register |
| Asset Transfer | Assets → Asset Transfer |
| Asset Loan | Assets → Asset Loan |
| Asset Maintenance | Assets → Asset Maintenance |
| Asset Disposal | Assets → Asset Disposal |
| Asset Inspection | Assets → Asset Inspection |
| Asset Loss | Assets → Asset Loss |
| Depreciation | Assets → Depreciation |

---

## Related Documentation

For detailed technical documentation:
- [Asset Module Applet](/applets/asset-module-applet/)

---

## Next Steps

After evaluating Asset Management, proceed to:

{{< cards >}}
  {{< card link="../financial-reporting" title="Financial Reporting" subtitle="Test financial statement generation" >}}
  {{< card link="../user-access-control" title="User Access Control" subtitle="Test security and permissions" >}}
{{< /cards >}}
