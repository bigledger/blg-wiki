**Audit Trail:**
- 7-year retention for all documents
- Immutable transaction logs
- Proof of delivery storage
- Compliance reporting tools

---

## 6. Step-by-Step Demo Scenarios

### Overview of Demo Scenarios

{{< cards >}}
  {{< card title="🔧 Scenario 1: Initial AP Setup" subtitle="Complete Access Point configuration from scratch including certificate installation and SMP registration." >}}
  {{< card title="📤 Scenario 2: High-Volume Document Exchange" subtitle="Process 5,000 invoices in a batch with automatic routing and delivery confirmation." >}}
  {{< card title="⚠️ Scenario 3: Certificate Renewal" subtitle="Seamless certificate renewal without service interruption using automated procedures." >}}
  {{< card title="🔍 Scenario 4: Troubleshooting Failed Transmission" subtitle="Diagnose and resolve AS4 transmission failures with detailed error analysis." >}}
{{< /cards >}}

---

### 📼 Demo Scenario 1: Initial Access Point Setup and Configuration

#### Business Context

{{< callout type="example" >}}
**Scenario Profile:**
- **Business Type**: Manufacturing company expanding to EU markets
- **Objective**: Set up Peppol Access Point for cross-border invoicing
- **Prerequisites**: Company registration complete, Peppol ID obtained
- **Estimated Total Time**: 45-60 minutes (one-time setup)
{{< /callout >}}

#### Step-by-Step Walkthrough

{{< steps >}}

### Step 1: Access Point Registration (10 minutes)

**Navigate to Configuration:**

```
Peppol AP Admin → Configuration → Access Point Setup

┌────────────────────────────────────────────────────────┐
│  ACCESS POINT REGISTRATION                             │
├────────────────────────────────────────────────────────┤
│  Company Name:      [Your Manufacturing Ltd_______]    │
│  Peppol ID:         [9915:YOURCOMPANYID___________]    │
│  Country:           [Malaysia ▼]                       │
│  AP Provider:       [Bigledger Peppol AP]              │
│  Environment:       ○ Sandbox  ◉ Production            │
│                                                        │
│  AS4 Endpoint URL:                                     │
│  [https://peppol-ap.bigledger.com/as4___________]      │
│                                                        │
│  [Validate Configuration]                              │
└────────────────────────────────────────────────────────┘
```

**Validation Results:**
```
✅ Peppol ID format valid
✅ Company registered with Peppol Authority
✅ AS4 endpoint reachable
✅ Network connectivity confirmed
```

### Step 2: Certificate Upload and Validation (15 minutes)

**Upload X.509 Certificate:**

```
Certificate Management → Upload New Certificate

┌────────────────────────────────────────────────────────┐
│  CERTIFICATE UPLOAD                                    │
├────────────────────────────────────────────────────────┤
│  Certificate File:  [📄 your-company-cert.p12]        │
│  Password:          [••••••••••]                      │
│                                                        │
│  Certificate Details:                                  │
│  Issuer:            DigiCert Peppol CA                 │
│  Valid From:        2025-01-15                         │
│  Valid Until:       2027-01-15 (725 days remaining)    │
│  Subject:           CN=9915:YOURCOMPANYID              │
│  Key Algorithm:     RSA 2048-bit                       │
│  Signature:         SHA256withRSA                      │
│                                                        │
│  ✅ Certificate chain validated                        │
│  ✅ Trusted by Peppol network                          │
│  ✅ Private key accessible                             │
│                                                        │
│  [Upload and Activate]                                 │
└────────────────────────────────────────────────────────┘
```

{{< callout type="warning" >}}
**Pro Tip**: Set up automatic renewal alerts 90 days before expiry to prevent service disruption.
{{< /callout >}}

### Step 3: SMP Registration (10 minutes)

**Configure Service Metadata Publisher:**

```
SMP Configuration → Register Participant

Registering participant capabilities with SML...

[██████████] 100%

[14:30:01] Participant ID verified ✅
[14:30:03] SMP endpoint configured ✅
[14:30:05] Document types registered:
           - Invoice (UBL 2.1) ✅
           - Credit Note (UBL 2.1) ✅
           - Purchase Order (UBL 2.1) ✅
           - Order Response (UBL 2.1) ✅
[14:30:08] SML registration complete ✅
[14:30:10] DNS propagation initiated ✅

Status: ACTIVE
Your Access Point is now discoverable on the Peppol network!
```

### Step 4: Connectivity Testing (10 minutes)

**Run Network Diagnostic:**

```
Diagnostics → Run Full System Test

┌────────────────────────────────────────────────────────┐
│  SYSTEM CONNECTIVITY TEST                              │
├────────────────────────────────────────────────────────┤
│                                                        │
│  Test 1: AS4 Endpoint Accessibility                    │
│  Result: ✅ PASS (Response time: 245ms)                │
│                                                        │
│  Test 2: Certificate Validation                        │
│  Result: ✅ PASS (Trusted chain verified)              │
│                                                        │
│  Test 3: SML Lookup                                    │
│  Result: ✅ PASS (Participant found in 1.2s)           │
│                                                        │
│  Test 4: SMP Query                                     │
│  Result: ✅ PASS (Metadata retrieved)                  │
│                                                        │
│  Test 5: Send Test Document                            │
│  Result: ✅ PASS (Delivery confirmed in 4.3s)          │
│                                                        │
│  Overall Status: 🎉 ALL TESTS PASSED                   │
└────────────────────────────────────────────────────────┘
```

{{< /steps >}}

#### Expected Results

✅ Access Point fully configured and operational  
✅ Certificate installed and validated by Peppol network  
✅ Participant registered in SML with all document types  
✅ Network connectivity confirmed with sub-5-second delivery  
✅ System ready for production document exchange  

#### Business Outcomes

**Time Investment vs. Long-term Benefit:**
- Initial Setup: 45-60 minutes (one-time)
- Ongoing Maintenance: < 5 hours per year
- Documents Per Year: Unlimited capacity
- Cost Savings: 60-80% vs traditional EDI

---

### 📼 Demo Scenario 2: High-Volume Document Exchange Processing

#### Business Context

{{< callout type="example" >}}
**Scenario Profile:**
- **Business Type**: Wholesale distributor with EU suppliers
- **Objective**: Process end-of-month invoice batch (5,000 documents)
- **Document Types**: Invoices, Credit Notes, Despatch Advice
- **Estimated Total Time**: 45 minutes (automated processing)
{{< /callout >}}

#### Processing Timeline

```
[00:00]  🟢 Batch submission initiated (5,000 documents)
           ↓
[00:05]  🟡 Pre-validation complete (4,985 valid, 15 errors)
           ↓
[00:10]  🔄 Error corrections applied automatically
           ↓
[00:15]  📤 AS4 transmission started (200 docs/minute)
           ↓
[00:35]  ✅ 4,500 documents delivered (90%)
           ↓
[00:42]  🔄 Retry queue processing (487 pending)
           ↓
[00:45]  ✅ Batch complete (4,998 delivered, 2 permanent failures)
```

#### Step-by-Step Walkthrough

{{< steps >}}

### Step 1: Batch Upload (5 minutes)

**Bulk Document Import:**

```
Document Management → Bulk Operations → Import Batch

┌────────────────────────────────────────────────────────┐
│  BATCH IMPORT WIZARD                                   │
├────────────────────────────────────────────────────────┤
│  Source:            [📁 Select Folder]                 │
│  Format:            [UBL 2.1 XML ▼]                    │
│  Document Type:     [Mixed - Auto-detect ▼]            │
│                                                        │
│  Scan Results:                                         │
│  ┌──────────────────────────────────────────────────┐  │
│  │ Files Found:          5,000                      │  │
│  │ - Invoices:           4,250                      │  │
│  │ - Credit Notes:       450                        │  │
│  │ - Despatch Advice:    300                        │  │
│  │                                                  │  │
│  │ Total Size:           247 MB                     │  │
│  │ Estimated Time:       40-50 minutes              │  │
│  └──────────────────────────────────────────────────┘  │
│                                                        │
│  Processing Options:                                   │
│  ☑ Automatic error correction                         │
│  ☑ Parallel processing (10 threads)                   │
│  ☑ Auto-retry on failure (3 attempts)                 │
│  ☐ Pause on error (continue processing)               │
│                                                        │
│  [Start Batch Import]                                  │
└────────────────────────────────────────────────────────┘
```

### Step 2: Real-Time Monitoring (40 minutes)

**Live Processing Dashboard:**

```
┌────────────────────────────────────────────────────────┐
│  BATCH PROCESSING MONITOR                              │
├────────────────────────────────────────────────────────┤
│  Batch ID: BATCH-2025-10-29-001                        │
│  Started:  14:00:00                                    │
│  Elapsed:  35:42                                       │
│                                                        │
│  Progress:  [█████████████████████████████  ] 90%      │
│                                                        │
│  ┌──────────────────────────────────────────────────┐  │
│  │ Status            Count      Percentage         │  │
│  ├──────────────────────────────────────────────────┤  │
│  │ ✅ Delivered       4,500      90.0%              │  │
│  │ 🔄 In Progress     487        9.7%               │  │
│  │ 🟡 Queued          11         0.2%               │  │
│  │ ⚠️ Failed          2          0.04%              │  │
│  └──────────────────────────────────────────────────┘  │
│                                                        │
│  Performance Metrics:                                  │
│  - Processing Rate:    142 docs/minute                 │
│  - Avg Delivery Time:  3.8 seconds                     │
│  - Success Rate:       99.96%                          │
│  - Est. Completion:    10 minutes                      │
│                                                        │
│  Recent Activity:                                      │
│  [14:35:42] INV-45892 → ABC GmbH ✅ Delivered (2.1s)   │
│  [14:35:43] INV-45893 → XYZ Ltd ✅ Delivered (3.4s)     │
│  [14:35:44] CN-08234 → DEF AG ✅ Delivered (2.8s)       │
└────────────────────────────────────────────────────────┘
```

### Step 3: Error Resolution (5 minutes)

**Failed Document Analysis:**

```
Error Report → View Failed Documents

┌────────────────────────────────────────────────────────┐
│  FAILED DOCUMENTS (2 total)                            │
├────────────────────────────────────────────────────────┤
│  Document ID:  INV-47892                               │
│  Recipient:    9988:INVALIDID                          │
│  Error:        Recipient not found in SML              │
│  Resolution:   Verify Peppol ID with recipient         │
│                                                        │
│  Document ID:  INV-48123                               │
│  Recipient:    9944:INACTIVEPART                       │
│  Error:        Recipient AP not responding             │
│  Resolution:   Partner's AP temporarily offline        │
│                Retry scheduled for tomorrow            │
└────────────────────────────────────────────────────────┘
```

{{< /steps >}}

#### Expected Results

✅ 99.96% success rate (4,998 of 5,000 documents delivered)  
✅ Average delivery time: 3.8 seconds per document  
✅ Processing rate: 142 documents per minute  
✅ Failed documents queued for manual review  
✅ Complete audit trail for all transactions  

#### Business Outcomes

**Efficiency Gains:**
- **Traditional Method**: 5,000 docs × 5 min = 417 hours (52 business days)
- **Peppol AP Method**: 45 minutes automated processing
- **Time Saved**: 99.8% reduction in processing time
- **Cost Savings**: €12,500 (at €2.50 per traditional EDI transaction vs €0 Peppol transaction fees)

---

## 7. Comprehensive Test Cases

### Test Case 1: Basic Access Point Configuration

```
Test ID: TC-PA-001
Objective: Verify successful Access Point setup and certificate installation

Preconditions:
- Valid Peppol Participant ID obtained
- X.509 certificate from approved CA available
- Network access to Peppol infrastructure

Test Steps:
1. Navigate to Configuration → Access Point Setup
2. Enter Peppol ID and company details
3. Upload certificate file with password
4. Configure AS4 endpoint URL
5. Validate configuration
6. Complete SMP registration

Expected Results:
✅ Configuration validates without errors
✅ Certificate accepted and trusted
✅ Participant registered in SML
✅ All document types registered
✅ Test message delivery successful

Pass Criteria: All expected results achieved within 60 minutes
```

### Test Case 2: Document Transmission - Single Invoice

```
Test ID: TC-PA-002
Objective: Verify end-to-end document transmission for single invoice

Preconditions:
- Access Point configured and active
- Test recipient Peppol ID available
- Valid UBL 2.1 invoice XML prepared

Test Steps:
1. Navigate to Document Management → Send Document
2. Upload invoice XML file
3. Select test recipient from network
4. Submit document for transmission
5. Monitor transmission status
6. Verify delivery confirmation received

Expected Results:
✅ Document validates against UBL schema
✅ Recipient endpoint discovered via SML/SMP
✅ AS4 message created and encrypted
✅ Document delivered within 10 seconds
✅ Delivery confirmation (MDN) received
✅ Audit trail entry created

Pass Criteria: Delivery confirmed with status "DELIVERED" in < 10 seconds
```

### Test Case 3: Certificate Expiry Handling

```
Test ID: TC-PA-003
Objective: Verify automatic alerts for expiring certificates

Preconditions:
- Access Point configured with active certificate
- Certificate validity period known
- Notification settings configured

Test Steps:
1. Set system date to 91 days before certificate expiry
2. Trigger daily maintenance job
3. Check for expiry warning notifications
4. Set system date to 30 days before expiry
5. Verify escalated warnings
6. Upload new certificate before expiry
7. Verify seamless transition

Expected Results:
✅ 90-day warning email sent to administrators
✅ Dashboard shows expiry notification
✅ 30-day warning marked as critical
✅ Daily reminders sent in final week
✅ New certificate upload successful
✅ No service interruption during transition

Pass Criteria: All alerts triggered on schedule, zero downtime
```

### Test Case 4: High-Volume Batch Processing

```
Test ID: TC-PA-004
Objective: Verify system handles 5,000 documents without degradation

Preconditions:
- Access Point configured and tested
- 5,000 valid UBL documents prepared
- Network connectivity stable
- Multiple recipient participants registered

Test Steps:
1. Navigate to Bulk Operations → Import Batch
2. Select folder containing 5,000 documents
3. Configure batch processing options
4. Start batch import
5. Monitor processing dashboard
6. Review completion report

Expected Results:
✅ All documents loaded successfully
✅ Parallel processing utilizes 10 threads
✅ Average processing rate > 100 docs/minute
✅ Success rate > 99%
✅ Failed documents queued for retry
✅ Complete processing in < 60 minutes

Pass Criteria: > 99% success rate, < 60 min total time
```

### Test Case 5: Network Failure Recovery

```
Test ID: TC-PA-005
Objective: Verify automatic retry mechanism during network disruption

Preconditions:
- Active document transmission in progress
- Network connectivity can be simulated

Test Steps:
1. Start sending batch of 100 documents
2. Simulate network disruption after 50 documents sent
3. Observe system response
4. Restore network connectivity after 5 minutes
5. Verify automatic retry mechanism activates
6. Confirm all documents eventually delivered

Expected Results:
✅ System detects network failure
✅ Pending documents queued for retry
✅ Successfully sent documents not re-transmitted
✅ Automatic retry begins upon connectivity restore
✅ Exponential backoff applied (1min, 2min, 4min)
✅ All 100 documents delivered successfully

Pass Criteria: Zero documents lost, all eventually delivered
```

### Test Case 6: SMP Lookup Performance

```
Test ID: TC-PA-006
Objective: Verify SMP/SML endpoint discovery performance

Preconditions:
- Access Point configured
- List of 100 test Peppol IDs from various countries

Test Steps:
1. Navigate to Diagnostics → SMP Lookup Tool
2. Enter first Peppol ID
3. Record lookup time
4. Repeat for all 100 Peppol IDs
5. Calculate average lookup time
6. Identify any failed lookups

Expected Results:
✅ All valid Peppol IDs found in SML
✅ Average lookup time < 2 seconds
✅ 95th percentile < 3 seconds
✅ Lookup results cached for 24 hours
✅ Invalid IDs return clear error messages
✅ No timeouts or system errors

Pass Criteria: Avg < 2 sec, 95% < 3 sec, 100% success rate for valid IDs
```

---

## 8. Best Practices and Recommendations

### 8.1 Daily Operations Checklist

**Morning Routine (10 minutes):**
```
☐ Check dashboard for overnight transmissions
☐ Review any failed documents from previous day
☐ Verify certificate validity (< 90 days to expiry)
☐ Check system health indicators
☐ Review pending retry queue
```

**End of Day (5 minutes):**
```
☐ Verify all day's documents delivered
☐ Export daily transaction summary
☐ Check for system notifications
☐ Backup important configurations
```

### 8.2 Monthly Maintenance Tasks

**First Week of Month:**
```
☐ Review monthly exchange volume statistics
☐ Generate compliance reports
☐ Audit partner directory for inactive participants
☐ Review and update notification preferences
☐ Test disaster recovery procedures
```

**Certificate Management:**
```
☐ Check certificate expiry dates
☐ Renew certificates 60 days before expiry
☐ Test new certificates in sandbox first
☐ Document certificate transitions
```

### 8.3 Performance Optimization

**Network Optimization:**
- Enable parallel processing for batches > 100 documents
- Use connection pooling for high-volume periods
- Schedule large batches during off-peak hours
- Monitor bandwidth utilization

**Storage Management:**
- Archive documents older than 2 years
- Enable compression for stored XML files
- Implement tiered storage (hot/warm/cold)
- Regular cleanup of temporary files

---

## 9. Troubleshooting

**Common Issues:**

{{< callout type="warning" >}}
**Recipient Not Found**
- Verify Peppol ID format
- Check if recipient registered on network
- Use SMP Lookup tool to test

**Validation Errors**
- Review detailed error report
- Check UBL structure against specifications
- Verify all mandatory fields present

**Certificate Issues**
- Check expiry date
- Renew from approved CA
- Update SMP registration
{{< /callout >}}

---

## 10. FAQ

**Q1: How long does initial AP setup take?**
A: Typically 45-60 minutes including certificate installation and testing.

**Q2: What happens if my certificate expires?**
A: Document transmission will fail. You'll receive alerts 90, 60, and 30 days before expiry. Renew promptly.

**Q3: Can I send to partners in any country?**
A: Yes, if they're registered on the Peppol network. Currently covers 50+ countries.

**Q4: What's the maximum document size?**
A: 15 MB per document. Most business documents are < 1 MB.

**Q5: How long are documents stored?**
A: 7 years for compliance. You can export for offline archival anytime.

**Q6: What if a partner's AP is offline?**
A: System will retry automatically 3 times with exponential backoff, then queue for next day.

---

## 11. Summary

The Peppol AP Admin Applet enables:

✅ Seamless integration with global Peppol network  
✅ Automated B2B document exchange  
✅ Real-time delivery confirmation  
✅ Complete compliance and audit trail  
✅ 60-80% cost reduction vs traditional EDI  
✅ Support for 400,000+ trading partners globally  

**Next Steps:**
1. Complete Access Point registration
2. Configure participants and document types
3. Test with sample documents in sandbox
4. Go live and start exchanging documents
5. Monitor dashboard and maintain compliance

---

**Document Version**: 2.0  
**Last Updated**: October 2025  
**Next Review**: January 2026

For support: [support@bigledger.com](mailto:support@bigledger.com)