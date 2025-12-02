---
title: "Peppol AP Admin Applet"
description: "Internal administration tool for managing Peppol network documents, routing, and tenant distribution"
tags:
- peppol
- access-point
- document-routing
- internal-tools
- administration
---

# **Peppol AP Admin Applet**

## **Document Information**

**Applet Name:** Peppol AP Admin Applet  
**Version:** 1.0  
**Last Updated:** November 2025  
**Access Level:** Internal Use Only  
**Target Users:** BigLedger internal staff, system administrators, support teams

---

## **1. Overview and Target Audience**

### **1.1 Purpose of the Applet**

The **Peppol AP Admin Applet** is an internal administration tool used to manage **all documents received via the Peppol network** before they are distributed to their respective company tenants.

When documents are submitted through Peppol, they do **not** immediately arrive at the intended company tenant. Instead, all incoming Peppol documents are routed to a **centralized tenant called the Peppol AP Tenant**, which acts as a secure buffer, inspector, and distributor.

**This ensures:**
- Proper routing to the correct internal tenant  
- Filtering/screening of invalid or suspicious documents  
- Consistent handling across multiple tenants  
- Centralized control and logging
- Complete audit trail for compliance

### **1.2 Who Will Benefit from This Applet?**

This applet serves critical functions for multiple internal teams:

| User Role | Primary Benefits | Key Use Cases |
|-----------|------------------|---------------|
| **System Administrators** | Monitor document flow, ensure routing accuracy | Daily health checks, routing verification, system maintenance |
| **Support Team** | Troubleshoot customer issues, verify document delivery | Customer support tickets, delivery confirmation, issue resolution |
| **Technical Team** | Debug integration issues, analyze failures | Error investigation, system diagnostics, performance tuning |
| **Operations Team** | Oversee multi-tenant operations, ensure SLA compliance | Performance monitoring, capacity planning, uptime tracking |
| **Developers** | Test Peppol integrations, validate configurations | Development testing, integration validation, debugging |
| **Compliance Officers** | Audit document trails, verify regulatory compliance | Audit preparation, compliance reporting, record keeping |


### **1.3 What You'll Achieve After Reading This Documentation**

By the end of this guide, you will be able to:

**✓ Operational Skills:**
- Navigate the Peppol AP Admin Applet confidently
- Monitor incoming Peppol documents in real-time
- Verify correct document routing to tenants
- Identify and troubleshoot routing issues
- Access historical document records for auditing
- Validate Peppol ID registrations and mappings

**✓ Technical Understanding:**
- Understand the complete Peppol document flow from network to tenant
- Know how documents move through the centralized AP Tenant
- Comprehend the role of filtering and validation
- Recognize the relationship between Peppol IDs, companies, and tenants
- Understand the logging and audit trail mechanisms

**✓ Problem-Solving Abilities:**
- Diagnose why documents aren't reaching intended tenants
- Verify Peppol ID registrations and mappings
- Support customer inquiries about document delivery
- Identify system bottlenecks or processing delays
- Troubleshoot routing configuration issues
- Analyze document processing failures

**✓ Administrative Capabilities:**
- Manage registered company Peppol IDs
- Cross-reference tenant configurations
- Generate audit trails for compliance
- Coordinate with development teams on issues
- Monitor system health and performance
- Ensure SLA compliance for document delivery

**✓ Support Excellence:**
- Quickly respond to customer delivery inquiries
- Provide accurate status updates on document processing
- Identify root causes of delivery failures
- Escalate technical issues with complete context
- Document issues for knowledge base

### **1.4 Target Audience and Access Restrictions**

This applet is **strictly for internal use only**.  
It is NOT meant for customers or external users.

**Authorized Users:**

| Role | Access Level | Typical Tasks |
|------|--------------|---------------|
| **BigLedger Internal Staff** | Full access | Daily operations, monitoring, configuration |
| **Support Team** | Read + Export | Customer support, verification, status checks |
| **System Administrators** | Full access | Configuration, troubleshooting, maintenance |
| **Developers** | Read + Debug | Integration testing, debugging, development |
| **Operations Managers** | Read + Reports | Performance oversight, SLA monitoring, reporting |
| **Compliance Officers** | Read + Audit | Compliance verification, audit trail review |

**Access Restrictions:**
- Intentionally restricted to prevent accidental misrouting
- Prevents unauthorized modification of Peppol data
- Protects sensitive routing configurations
- Ensures audit trail integrity
- Maintains security of multi-tenant architecture

**Why Access is Restricted:**
- Documents contain sensitive business information
- Incorrect routing could cause data breaches
- Configuration changes affect all tenants
- Audit trails must remain tamper-proof
- Compliance requirements mandate access control

### **1.5 Applet Location**

The Peppol AP Admin Applet exists **inside the Peppol AP Tenant**.

**Access Steps:**
1. Log in to **account.cloud**  
2. Search for **"Peppol"** in the tenant selector
3. Select the applet under the **Peppol AP tenant**
4. Verify you have appropriate permissions

**Navigation Path:**
```
account.cloud → Peppol AP Tenant → Peppol AP Admin Applet
```

**First-Time Access:**
- Contact your system administrator for access
- Ensure you have the appropriate role assigned
- Complete any required training before access is granted

---

## **2. Core Functionality & Document Flow**

The Peppol AP Admin Applet manages the complete lifecycle of **incoming Peppol documents** before distributing them to the appropriate destination tenant.

### **2.1 High-Level Data Flow**

**Step 1: Document Received**  
A document is sent via Peppol to a registered Peppol ID belonging to one of the internal tenants.

**Step 2: Arrival at Peppol AP Tenant**  
All documents arrive first at the Peppol AP Tenant (central repository).

**Step 3: Filtering / Pre-Processing**  
The system performs:
- Basic validation  
- Format inspection  
- Structural and business-rule checks  
- Matching receiver Peppol ID → tenant-linking logic  

**Step 4: Sorting Mechanism**  
The applet determines:
- Which tenant the document belongs to  
- Which company it is linked to  
- Whether the document structure is valid  

**Step 5: Distribution to Final Tenant**  
Documents are routed to the correct tenant such as:
- Demo staging tenant  
- Living staging tenant  
- Production staging tenant  
- Any other internal environment  

**Step 6: Logging**  
Every action is logged in:
- Inbox Queue  
- Inbox History  
- Routing tables  

This creates a complete trace for audit and debugging.

### **2.2 Document Flow Diagram**

```
┌─────────────────────────────────────────────────────────────┐
│                    PEPPOL NETWORK                           │
│              (External Sender submits document)             │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              PEPPOL AP TENANT (Central Hub)                 │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │           INBOX QUEUE (Temporary Hold)               │  │
│  │  - Document arrives                                  │  │
│  │  - Awaits processing                                 │  │
│  └────────────────────┬─────────────────────────────────┘  │
│                       │                                     │
│                       ▼                                     │
│  ┌──────────────────────────────────────────────────────┐  │
│  │        FILTERING & VALIDATION ENGINE                 │  │
│  │  - Format validation                                 │  │
│  │  - Structure check                                   │  │
│  │  - Peppol ID lookup                                  │  │
│  │  - Tenant mapping                                    │  │
│  └────────────────────┬─────────────────────────────────┘  │
│                       │                                     │
│                       ▼                                     │
│  ┌──────────────────────────────────────────────────────┐  │
│  │           ROUTING DECISION                           │  │
│  │  - Determine target tenant                           │  │
│  │  - Verify company mapping                            │  │
│  │  - Check permissions                                 │  │
│  └────────────────────┬─────────────────────────────────┘  │
│                       │                                     │
│                       ▼                                     │
│  ┌──────────────────────────────────────────────────────┐  │
│  │           INBOX HISTORY (Permanent Log)              │  │
│  │  - All processed documents                           │  │
│  │  - Complete audit trail                              │  │
│  └──────────────────────────────────────────────────────┘  │
└────────────────────────┬────────────────────────────────────┘
                         │
         ┌───────────────┼───────────────┐
         │               │               │
         ▼               ▼               ▼
┌─────────────┐  ┌─────────────┐  ┌─────────────┐
│   Demo      │  │   Living    │  │ Production  │
│  Staging    │  │  Staging    │  │  Staging    │
│  Tenant     │  │  Tenant     │  │  Tenant     │
└─────────────┘  └─────────────┘  └─────────────┘
```

### **2.3 Why This Architecture Matters**

**Benefits of Centralized Processing:**

1. **Security**
   - Single point of validation
   - Consistent security checks
   - Prevents malicious documents from reaching tenants

2. **Reliability**
   - Guaranteed delivery tracking
   - Automatic retry mechanisms
   - Complete audit trail

3. **Scalability**
   - Handles multiple tenants efficiently
   - Load balancing across environments
   - Easy to add new tenants

4. **Compliance**
   - Centralized logging for audits
   - Regulatory requirement tracking
   - Complete document history

5. **Troubleshooting**
   - Single location to diagnose issues
   - Clear visibility into document flow
   - Easy to identify routing problems

---

## **3. Menu Descriptions**

The Peppol AP Admin Applet contains four primary menus:

1. **Inbox Queue**  
2. **Inbox History**  
3. **Registered Companies**  
4. **Test Bed (Inactive)**

---

### **3.1 Inbox Q (Inbox Queue)**

This is the first menu visible upon opening the applet.

#### **Purpose**
- Displays documents that have just arrived from Peppol
- Acts as the *temporary holding area* before routing occurs
- Provides real-time visibility into incoming traffic

#### **Key Behaviors**
- Queue is typically **empty** because documents are processed rapidly (usually within seconds)
- Documents appear briefly during:
  - System load spikes  
  - When manual debugging is performed  
  - When there is a routing issue  
  - During high-volume periods

#### **Document Movement**
Once processed, documents:
- Are **removed automatically** from the Queue  
- Move to **Inbox History** for permanent logging  
- Are routed to their destination tenant

#### **What to Monitor**

| Indicator | Normal State | Action Required |
|-----------|--------------|-----------------|
| **Queue Empty** | ✓ Normal | No action needed |
| **1-5 Documents** | ✓ Normal | Documents processing |
| **5-20 Documents** | ⚠️ Monitor | Check processing speed |
| **20+ Documents** | ❌ Alert | Investigate delay |

#### **Common Scenarios**

**Scenario 1: Empty Queue**
- **Status:** Normal operation
- **Meaning:** All documents processed successfully
- **Action:** No action required

**Scenario 2: Documents Stuck in Queue**
- **Status:** Potential issue
- **Meaning:** Processing delay or routing failure
- **Action:** 
  1. Check document details
  2. Verify Peppol ID mapping
  3. Review system logs
  4. Contact technical team if persists

**Scenario 3: High Volume**
- **Status:** System under load
- **Meaning:** Many documents arriving simultaneously
- **Action:** Monitor processing time, ensure system resources adequate

#### **Troubleshooting Tips**

If documents remain in queue longer than expected:
1. Check if Peppol ID is registered in "Registered Companies"
2. Verify tenant is active and accessible
3. Review system logs for errors
4. Check network connectivity to destination tenant
5. Escalate to technical team if unresolved

---

### **3.2 Inbox History**

This menu contains a historical list of **all documents processed and distributed** from the Peppol AP Tenant.

#### **Purpose**
- Permanent archive of all processed documents
- Audit trail for compliance
- Troubleshooting and verification tool
- Performance monitoring

#### **Information Displayed**

Each record includes:

| Field | Description | Example |
|-------|-------------|---------|
| **Sender ID** | Peppol ID of the sender | 0195:987654321 |
| **Receiver ID** | Peppol ID mapped to internal tenant | 0195:123456789 |
| **Document Date** | Creation timestamp | 2025-11-18 14:30:00 |
| **Process ID** | Unique universal identifier | UUID-1234-5678-90AB |
| **Document Type** | Type of Peppol document | Invoice, Credit Note, Order |
| **Status** | Processing result | Delivered, Failed, Pending |
| **Destination Tenant** | Where document was routed | Production Staging |

#### **Process ID Importance**

The **Process ID** is critical because:
- Same ID used across both sending and receiving Peppol flows
- Enables end-to-end tracking
- Links documents across systems
- Essential for debugging
- Required for support tickets

#### **Export Button**

⚠️ **Note:** An **Export** button is displayed, but **it is currently non-functional**.
- It is scheduled for removal to avoid confusion
- Use alternative export methods if needed
- Contact development team for bulk export requirements

#### **Usage Scenarios**

**Scenario 1: Customer Support**
- Customer: "I sent an invoice but you haven't received it"
- Action:
  1. Get Peppol ID from customer
  2. Search Inbox History by Sender ID
  3. Verify if document arrived
  4. Check routing status
  5. Provide feedback to customer

**Scenario 2: Audit Preparation**
- Need: Compliance audit requires document trail
- Action:
  1. Filter by date range
  2. Review all processed documents
  3. Verify routing accuracy
  4. Generate report (manual or via API)
  5. Provide to auditors

**Scenario 3: Performance Monitoring**
- Need: Track document processing volume
- Action:
  1. Review daily/weekly/monthly volumes
  2. Identify peak periods
  3. Monitor processing times
  4. Plan capacity accordingly

**Scenario 4: Troubleshooting**
- Issue: Document not appearing in tenant
- Action:
  1. Search by Receiver ID or Process ID
  2. Verify document arrived at AP Tenant
  3. Check routing decision
  4. Identify failure point
  5. Resolve and re-route if needed

#### **Search and Filter Tips**

**By Sender ID:**
- Use when tracking documents from specific supplier
- Format: 0195:XXXXXXXXX

**By Receiver ID:**
- Use when checking documents for specific company
- Verify correct Peppol ID mapping

**By Date Range:**
- Use for periodic reviews
- Audit trail generation
- Performance analysis

**By Process ID:**
- Use for specific document tracking
- End-to-end tracing
- Support ticket resolution

---

### **3.3 Registered Companies**

This menu displays all tenant-company Peppol ID mappings.

#### **Purpose**
- Central registry of all Peppol ID registrations
- Verification tool for routing configuration
- Troubleshooting resource for delivery issues
- Audit tool for compliance

#### **Context**
- The system supports multiple internal tenants
- Each tenant contains **multiple companies**
- Each company can have **multiple registered Peppol IDs**
- This creates a complex many-to-many relationship

#### **Functionality**

**Filter by Tenant:**
- Users can filter by **tenant name** (e.g., "Demo Staging", "Living Staging", "Production Staging")
- Narrows results to specific environment
- Helps isolate configuration issues

**Information Displayed:**

| Column | Description | Example |
|--------|-------------|---------|
| **Registered Peppol ID** | The Peppol identifier | 0195:123456789 |
| **Company Name** | Legal company name | ABC Corporation Sdn Bhd |
| **Company Code** | Internal company identifier | ABC-001 |
| **Tenant** | Which environment | Production Staging |
| **Status** | Active/Inactive | Active |

#### **Data Consistency**

The Peppol IDs shown here reflect the same list found in:

```
Organization Applet → Peppol Config tab → Company registration
```

**Why This Matters:**
- Ensures single source of truth
- Prevents configuration drift
- Enables cross-verification
- Simplifies troubleshooting

#### **Common Use Cases**

**Use Case 1: Verify Registration**
- **Scenario:** Customer reports not receiving documents
- **Action:**
  1. Search for company in Registered Companies
  2. Verify Peppol ID is registered
  3. Check if ID matches what sender is using
  4. Confirm tenant mapping is correct
  5. Update if necessary

**Use Case 2: Troubleshoot Routing**
- **Scenario:** Document arriving at wrong tenant
- **Action:**
  1. Find Peppol ID in Registered Companies
  2. Verify tenant assignment
  3. Check for duplicate registrations
  4. Correct mapping if needed
  5. Test with new document

**Use Case 3: Onboard New Company**
- **Scenario:** New company needs Peppol connectivity
- **Action:**
  1. Register Peppol ID in Organization Applet
  2. Verify appears in Registered Companies
  3. Confirm correct tenant mapping
  4. Test document delivery
  5. Document configuration

**Use Case 4: Audit Compliance**
- **Scenario:** Compliance audit requires registration proof
- **Action:**
  1. Export list of all registered companies
  2. Verify all active companies are registered
  3. Check for unauthorized registrations
  4. Document any discrepancies
  5. Provide report to auditors

#### **Troubleshooting with Registered Companies**

**Problem: Document Not Arriving**

Check:
- [ ] Is Peppol ID registered?
- [ ] Is registration active?
- [ ] Is tenant mapping correct?
- [ ] Is company code valid?
- [ ] Are there duplicate registrations?

**Problem: Wrong Tenant Delivery**

Check:
- [ ] Which tenant is Peppol ID mapped to?
- [ ] Is there a conflicting registration?
- [ ] Is the mapping recent or outdated?
- [ ] Has company moved between tenants?

**Problem: Multiple Companies Receiving Same Document**

Check:
- [ ] Are there duplicate Peppol ID registrations?
- [ ] Is the same ID registered in multiple tenants?
- [ ] Is this intentional (e.g., test vs production)?
- [ ] Should one registration be removed?

#### **Best Practices**

1. **Regular Audits**
   - Review registrations monthly
   - Remove inactive companies
   - Verify tenant mappings
   - Document changes

2. **Naming Conventions**
   - Use consistent company codes
   - Clear tenant naming
   - Standardized Peppol ID format

3. **Change Management**
   - Document all registration changes
   - Test after modifications
   - Notify affected teams
   - Update documentation

4. **Security**
   - Limit who can modify registrations
   - Audit trail for changes
   - Verify authorization before changes
   - Regular access reviews

---

### **3.4 Test Bed (Inactive)**

This tab was originally planned as an internal testing tool but is currently **inactive**.

#### **Original Concept**

To replicate the **Peppol Test Bed** functionality for internal Peppol testing without using external services.

#### **Proposed Sub-Menus**

**1. Sending Test**
- Select document type (Invoice, Credit Note, Order)
- Paste XML based on the selected Peppol format
- Provide target Peppol IDs
- System would simulate sending and generate routing logs
- Verify document structure and routing logic

**2. Validation Test**
- Create multiple validation test cases
- Validate XML structures against Peppol schemas
- Troubleshoot schema-based errors
- Test business rules
- Verify compliance with Peppol specifications

#### **Intended Benefits**

- **Faster Development:** Test without external dependencies
- **Cost Savings:** Reduce reliance on external test beds
- **Flexibility:** Test edge cases and error scenarios
- **Privacy:** Test with real data in isolated environment
- **Speed:** Immediate feedback without network delays

#### **Reason for Inactivity**

**MDC (Malaysia Digital Economy Corporation) Requirement:**
- All PRS/SP testing must be performed directly using the official **MDC Test Bed**
- Regulatory compliance mandates use of official testing environment
- Internal test bed would not provide official certification
- External validation required for production approval

#### **Current Status**

- Tab remains in interface but is non-functional
- Scheduled for removal in future release
- All testing redirected to official MDC Test Bed
- Internal testing limited to development environments

#### **Alternative Testing Approach**

For internal testing needs:
1. Use MDC Test Bed for official validation
2. Use development tenants for integration testing
3. Use staging environments for end-to-end testing
4. Document test results in project management tools

---

## **4. Functional Analogy (Simplified Explanation)**

The Peppol AP Admin Applet operates like an **air traffic control center** for Peppol documents.

### **The Airport Analogy**

**Peppol AP Tenant = International Airport**
- All "flights" (documents) land first at the **Peppol AP Airport**
- This is the single entry point for all incoming traffic
- Ensures security and proper handling

**Inbox Queue = Arrival Gate**
- Planes (documents) arrive at the gate
- Brief holding area while passengers (data) are processed
- Quick turnaround - planes don't stay long

**Filtering/Validation = Immigration & Customs**
- Check passports (Peppol IDs)
- Verify documents are valid
- Screen for security issues
- Ensure compliance with regulations

**Routing Decision = Terminal Assignment**
- Airport staff determine which "terminal" (tenant) the passenger belongs to
- Based on destination (Peppol ID mapping)
- Ensures passengers reach correct terminal

**Distribution = Baggage Claim & Exit**
- Passengers collect belongings
- Exit to correct terminal
- Continue to final destination

**Inbox History = Flight Records**
- Complete log of all arrivals
- Security and auditing purposes
- Track every flight that landed
- Permanent record keeping

**Registered Companies = Passenger Manifest**
- List of all authorized passengers (companies)
- Which terminal they belong to
- Verification database

### **Why This Analogy Helps**

Understanding the applet as an airport control system helps clarify:
- **Centralized Control:** Single point of entry ensures security
- **Systematic Processing:** Every document follows same path
- **Quality Assurance:** Validation happens before distribution
- **Audit Trail:** Complete records for compliance
- **Efficiency:** Automated routing reduces manual work

---

## **5. Real-World Usage Scenarios**

### **Scenario 1: Daily Operations Check**

**User:** System Administrator  
**Time:** 9:00 AM Daily

**Workflow:**
1. Log into Peppol AP Admin Applet
2. Check Inbox Queue - should be empty or near-empty
3. Review Inbox History for overnight documents
4. Verify all documents routed successfully
5. Check for any stuck or failed documents
6. Generate daily summary report
7. Escalate any issues to technical team

**Expected Outcome:**
- Confirmation all systems operating normally
- Early detection of any issues
- Proactive problem resolution

### **Scenario 2: Customer Support Ticket**

**User:** Support Team Member  
**Issue:** Customer reports missing invoice

**Workflow:**
1. Receive ticket: "We sent invoice INV-2024-001 yesterday but customer says not received"
2. Log into Peppol AP Admin Applet
3. Navigate to Inbox History
4. Search by:
   - Sender Peppol ID (customer's ID)
   - Date range (yesterday)
   - Document reference (INV-2024-001)
5. Findings:
   - **If found:** Document arrived, check routing to correct tenant
   - **If not found:** Document never arrived at AP, check sender's system
6. Verify in Registered Companies that receiver Peppol ID is correct
7. Check destination tenant for document
8. Provide feedback to customer with specific details

**Expected Outcome:**
- Quick resolution of customer issue
- Clear explanation of document status
- Improved customer satisfaction

### **Scenario 3: New Company Onboarding**

**User:** Operations Team  
**Task:** Set up Peppol connectivity for new company

**Workflow:**
1. Receive new company details:
   - Company Name: XYZ Sdn Bhd
   - Peppol ID: 0195:999888777
   - Tenant: Production Staging
2. Register in Organization Applet → Peppol Config
3. Verify registration appears in Peppol AP Admin → Registered Companies
4. Send test document from MDC Test Bed
5. Monitor Inbox Queue for arrival
6. Verify routing to correct tenant
7. Check Inbox History for successful delivery
8. Confirm with company they received test document
9. Document configuration in knowledge base

**Expected Outcome:**
- Successful Peppol connectivity
- Verified document delivery
- Company ready for production use

### **Scenario 4: Troubleshooting Routing Issue**

**User:** Technical Team  
**Issue:** Documents routing to wrong tenant

**Workflow:**
1. Receive report: "Company ABC documents going to Demo instead of Production"
2. Log into Peppol AP Admin Applet
3. Check Registered Companies:
   - Search for Company ABC
   - Find Peppol ID: 0195:111222333
   - Current mapping: Demo Staging ❌
   - Should be: Production Staging ✓
4. Check Inbox History:
   - Confirm recent documents went to Demo
   - Note Process IDs for tracking
5. Correct mapping in Organization Applet
6. Verify change reflected in Registered Companies
7. Send test document
8. Monitor routing to Production Staging
9. Confirm successful delivery
10. Document issue and resolution

**Expected Outcome:**
- Routing corrected
- Documents now reaching correct tenant
- Issue documented for future reference

### **Scenario 5: Compliance Audit**

**User:** Compliance Officer  
**Task:** Prepare for regulatory audit

**Workflow:**
1. Receive audit request for Q3 2024 Peppol documents
2. Log into Peppol AP Admin Applet
3. Navigate to Inbox History
4. Filter by date range: July 1 - September 30, 2024
5. Review all processed documents:
   - Total documents received: 15,847
   - Successfully routed: 15,842
   - Failed routing: 5 (investigate)
6. Export data (manual process due to non-functional export button)
7. Cross-reference with Registered Companies
8. Verify all active companies have valid registrations
9. Document any discrepancies
10. Prepare summary report for auditors
11. Provide Process IDs for sample verification

**Expected Outcome:**
- Complete audit trail provided
- Compliance verified
- Any issues identified and documented

---

## **6. Best Practices**

### **6.1 Daily Operations**

**Morning Checks (Recommended: 9:00 AM)**
- [ ] Review Inbox Queue - should be empty or minimal
- [ ] Check Inbox History for overnight documents
- [ ] Verify no stuck or failed documents
- [ ] Review any alerts or notifications
- [ ] Document any anomalies

**Throughout the Day**
- [ ] Monitor for support tickets related to document delivery
- [ ] Respond promptly to routing issues
- [ ] Keep Registered Companies list updated
- [ ] Document any configuration changes

**End of Day (Recommended: 5:00 PM)**
- [ ] Final check of Inbox Queue
- [ ] Review day's document volume
- [ ] Ensure all issues resolved or escalated
- [ ] Prepare handover notes if needed

### **6.2 Weekly Tasks**

**Every Monday**
- [ ] Review previous week's document volume
- [ ] Analyze any recurring issues
- [ ] Update documentation as needed
- [ ] Plan capacity for upcoming week

**Every Friday**
- [ ] Generate weekly summary report
- [ ] Review Registered Companies for accuracy
- [ ] Archive resolved support tickets
- [ ] Update knowledge base with new learnings

### **6.3 Monthly Tasks**

**First Week of Month**
- [ ] Comprehensive audit of Registered Companies
- [ ] Remove inactive or duplicate registrations
- [ ] Verify all tenant mappings
- [ ] Generate monthly compliance report

**Mid-Month**
- [ ] Review system performance metrics
- [ ] Analyze document processing times
- [ ] Identify optimization opportunities
- [ ] Plan any necessary upgrades

**End of Month**
- [ ] Prepare monthly summary for management
- [ ] Document all configuration changes
- [ ] Review and update procedures
- [ ] Archive historical data if needed

### **6.4 Troubleshooting Best Practices**

**When Documents Don't Arrive:**
1. Check Inbox History - did it reach AP Tenant?
2. Verify Peppol ID in Registered Companies
3. Confirm sender used correct Peppol ID
4. Check sender's system logs
5. Verify network connectivity
6. Escalate to technical team if unresolved

**When Documents Route to Wrong Tenant:**
1. Check Registered Companies for correct mapping
2. Look for duplicate registrations
3. Verify recent configuration changes
4. Correct mapping in Organization Applet
5. Test with new document
6. Document issue and resolution

**When Queue Has Many Documents:**
1. Check system resources (CPU, memory)
2. Verify destination tenants are accessible
3. Review for any error patterns
4. Check network connectivity
5. Escalate to technical team if persistent
6. Monitor until queue clears

### **6.5 Security Best Practices**

**Access Control**
- Limit access to authorized personnel only
- Regular review of user permissions
- Immediate revocation when staff leaves
- Use strong authentication methods
- Log all access and changes

**Data Protection**
- Never share Process IDs publicly
- Protect Peppol ID information
- Secure export of data
- Follow data retention policies
- Comply with privacy regulations

**Change Management**
- Document all configuration changes
- Test changes in non-production first
- Have rollback plan ready
- Notify affected teams
- Update documentation

### **6.6 Documentation Best Practices**

**What to Document:**
- All configuration changes
- Routing issues and resolutions
- New company onboarding
- System anomalies
- Performance metrics
- Support ticket resolutions

**Where to Document:**
- Internal knowledge base
- Support ticket system
- Change management system
- Team communication channels
- Compliance audit files

**How to Document:**
- Use clear, concise language
- Include dates and times
- Reference Process IDs
- Note who made changes
- Explain why changes were made
- Include before/after states

---

## **7. Additional Notes & Recommended Enhancements**

### **7.1 Current Limitations**

**Known Issues:**
- Export button in Inbox History is non-functional
- No direct view of XML content inside the applet
- No re-routing or error recovery tools
- Test Bed is disabled and inactive
- Limited filtering options in Inbox History
- No real-time alerts for stuck documents

**Workarounds:**
- Manual data extraction for exports
- Use external XML viewers for content review
- Contact technical team for re-routing needs
- Use MDC Test Bed for official testing
- Use date range filters for targeted searches
- Regular manual queue checks

### **7.2 Future Improvement Suggestions**

**High Priority:**
1. **Enable XML Preview**
   - View document content directly in applet
   - Syntax highlighting for readability
   - Validation against Peppol schemas
   - Download XML for offline analysis

2. **Functional Export**
   - Export Inbox History to Excel/CSV
   - Customizable export fields
   - Date range selection
   - Automated scheduled exports

3. **Real-Time Monitoring**
   - Dashboard with live statistics
   - Alert system for stuck documents
   - Performance metrics visualization
   - Capacity planning tools

4. **Manual Re-Routing**
   - Ability to manually re-route failed documents
   - Bulk re-routing for multiple documents
   - Routing simulation before execution
   - Audit trail for manual interventions

**Medium Priority:**
5. **Enhanced Search**
   - Advanced filtering options
   - Full-text search in document content
   - Saved search templates
   - Search history

6. **Error Recovery Tools**
   - Automatic retry mechanisms
   - Error pattern detection
   - Suggested resolutions
   - Bulk error handling

7. **Integration Improvements**
   - Direct link to My Invoice Admin Applet
   - Unified Peppol tracking across applets
   - API access for external tools
   - Webhook notifications

**Low Priority:**
8. **Reporting Enhancements**
   - Automated compliance reports
   - Performance analytics
   - Trend analysis
   - Customizable dashboards

9. **User Experience**
   - Improved UI/UX design
   - Mobile-responsive interface
   - Keyboard shortcuts
   - Customizable views

10. **Documentation**
    - In-app help system
    - Interactive tutorials
    - Video guides
    - Contextual tooltips

### **7.3 Integration Opportunities**

**With My Invoice Admin Applet:**
- Unified view of sent and received documents
- End-to-end Peppol tracking
- Consolidated reporting
- Single dashboard for all Peppol operations

**With Organization Applet:**
- Real-time sync of Peppol ID registrations
- Automatic validation of configurations
- Streamlined onboarding process
- Reduced configuration errors

**With Support Ticketing System:**
- Automatic ticket creation for failures
- Direct links from tickets to documents
- Status updates in tickets
- Faster issue resolution

---

## **8. Frequently Asked Questions**

**Q1: Why is the Inbox Queue usually empty?**  
A: Documents are processed very quickly (usually within seconds), so they move immediately to Inbox History. An empty queue indicates normal, healthy operation.

**Q2: How long are documents kept in Inbox History?**  
A: Documents are retained permanently for audit and compliance purposes. Retention policies may vary by regulatory requirements.

**Q3: Can I manually re-route a document that went to the wrong tenant?**  
A: Currently, manual re-routing is not available in the applet. Contact the technical team for assistance with re-routing needs.

**Q4: Why can't I export data from Inbox History?**  
A: The export button is currently non-functional and scheduled for removal. Contact your system administrator for alternative export methods.

**Q5: What should I do if documents are stuck in the Inbox Queue?**  
A: First, verify the Peppol ID is registered in Registered Companies. Check that the destination tenant is accessible. If issues persist, escalate to the technical team.

**Q6: How do I know which tenant a document was routed to?**  
A: Check the Inbox History for the document. The destination tenant information is included in the record details.

**Q7: Can customers access this applet?**  
A: No. This applet is strictly for internal use only. Customers should use their own tenant-specific applets.

**Q8: What is a Process ID and why is it important?**  
A: The Process ID is a unique identifier that tracks a document through the entire Peppol flow, from sender to receiver. It's essential for troubleshooting and end-to-end tracking.

**Q9: How often should I check the Registered Companies list?**  
A: Review monthly for accuracy, and immediately when onboarding new companies or troubleshooting routing issues.

**Q10: What happens if a document arrives for an unregistered Peppol ID?**  
A: The document will fail routing and remain in the queue or be logged as failed. You'll need to register the Peppol ID and potentially re-route the document.

---



