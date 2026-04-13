---
title: "Peppol AP Admin Applet"
description: "Internal administration tool for managing Peppol network documents, routing, and tenant distribution"
tags:
- peppol
- access-point
- document-routing
- internal-tools
- administration
weight: 180
---

## Purpose and Overview

The Peppol AP Admin Applet is your control center for managing incoming Peppol documents before they reach their destination tenants. All documents arriving via the Peppol network land here first—in the centralized Peppol AP Tenant—where they're validated, routed, and logged before distribution.

{{< callout type="warning" >}}
**Internal Use Only**: This applet is restricted to BigLedger staff. It's not accessible to customers and contains sensitive routing configurations affecting all tenants.
{{< /callout >}}

### Who Uses This Applet

**System Administrators:**
- Monitor document flow and routing accuracy
- Configure tenant mappings
- Troubleshoot delivery issues

**Support Team:**
- Verify document delivery for customer inquiries
- Track document status
- Resolve routing problems

**Technical Team:**
- Debug integration issues
- Analyze processing failures
- Optimize system performance

**Operations Team:**
- Monitor SLA compliance
- Track document volumes
- Plan capacity

## Key Features Overview

{{< cards >}}
  {{< card title="Inbox Queue" subtitle="Real-time incoming document monitoring" >}}

  {{< card title="Inbox History" subtitle="Complete audit trail of processed documents" >}}

  {{< card title="Registered Companies" subtitle="Peppol ID to tenant mapping registry" >}}

  {{< card title="Document Routing" subtitle="Automated distribution to correct tenants" >}}
{{< /cards >}}

## Key Concepts

### How It Works: Document Flow

```
Peppol Network (External sender)
    ↓
Peppol AP Tenant (Central hub)
    ↓
Inbox Queue (Temporary hold)
    ↓
Validation & Routing (Peppol ID lookup)
    ↓
Inbox History (Permanent log)
    ↓
Destination Tenant (Demo/Living/Production)
```

### Why Centralized Processing

**Single Entry Point:**
- Consistent validation for all documents
- Unified security screening
- Complete audit trail
- Simplified troubleshooting

**Routing Intelligence:**
- Peppol ID to tenant mapping
- Automatic distribution
- Error detection and logging
- Retry mechanisms

**Compliance:**
- Permanent document history
- Regulatory audit trail
- Access control
- Data integrity

---

## Quick Start Guide

Get up and running quickly with these essential workflows.

### For Support Teams: Verify Document Delivery

**Goal:** Confirm if a customer's document was successfully received and routed.

1. **Gather details**: Get the Process ID, Sender Peppol ID, or Receiver Peppol ID.
2. **Navigate**: Go to **Inbox History** from the sidebar.
3. **Search**: Enter the ID in the search bar.
4. **Check Outcome**: Look at the **Status** (Delivered/Failed) and **Destination Tenant**.
5. **Report**: Provide the exact delivery status and Process ID to the original requester.

### For Administrators: Troubleshoot Failed Routing

**Goal:** Identify why a document failed to reach its target destination.

1. **Check the Queue**: Go to **Inbox Queue** to see if the document is stuck.
2. **Check History**: Go to **Inbox History** and find the failed document.
3. **Verify Registration**: Go to **Registered Companies** and search for the Receiver Peppol ID.
4. **Fix Mapping**: Ensure the Peppol ID is active and mapped to the correct Destination Tenant. If it's missing or wrong, update it in the Organization Applet's Peppol Config tab.

---

## 1. Inbox Queue

The Inbox Queue shows documents as they arrive from the Peppol network. It's a temporary holding area—documents typically process within seconds and move to Inbox History.

### Normal Operation

**Empty or Near-Empty Queue:**
- This is normal and expected
- Documents process rapidly
- Indicates healthy system operation

**When Documents Appear:**
- During high-volume periods
- Brief processing delays
- System under load
- Manual debugging in progress

### Monitoring Guidelines

| Queue Size | Status | Action |
|------------|--------|--------|
| 0-5 docs | ✓ Normal | No action needed |
| 5-20 docs | ⚠️ Monitor | Check processing speed |
| 20+ docs | ❌ Alert | Investigate delay |

### Troubleshooting Stuck Documents

If documents remain in queue longer than expected:

1. **Check Peppol ID Registration**
   - Navigate to Registered Companies
   - Verify receiver Peppol ID exists
   - Confirm tenant mapping is correct

2. **Verify Destination Tenant**
   - Ensure tenant is active
   - Check network connectivity
   - Verify permissions

3. **Review System Logs**
   - Look for error messages
   - Check processing timestamps
   - Identify failure patterns

4. **Escalate if Needed**
   - Contact technical team
   - Provide Process ID
   - Include error details

---

## 2. Inbox History

Permanent archive of all processed documents. This is your audit trail and troubleshooting tool.

### Information Available

Each record includes:

| Field | Purpose | Example |
|-------|---------|---------|
| **Sender ID** | Who sent the document | 0195:987654321 |
| **Receiver ID** | Intended recipient Peppol ID | 0195:123456789 |
| **Document Date** | When created | 2025-11-18 14:30:00 |
| **Process ID** | Unique tracking identifier | UUID-1234-5678-90AB |
| **Document Type** | Invoice, Credit Note, Order, etc. | Invoice |
| **Status** | Processing result | Delivered, Failed, Pending |
| **Destination Tenant** | Where routed | Production Staging |

### Process ID Importance

The Process ID is your end-to-end tracking key:
- Same ID used across sending and receiving systems
- Essential for debugging
- Required for support tickets
- Links documents across platforms

### Common Use Cases

**Customer Support:**
```
Customer: "I sent invoice INV-001 but you haven't received it"

Your workflow:
1. Get customer's Peppol ID
2. Search Inbox History by Sender ID
3. Check if document arrived
4. Verify routing status
5. Provide specific feedback
```

**Troubleshooting:**
```
Issue: Document not appearing in tenant

Your workflow:
1. Search by Receiver ID or Process ID
2. Verify document reached AP Tenant
3. Check routing decision
4. Identify failure point
5. Resolve and re-route if needed
```

**Audit Preparation:**
```
Need: Q3 2024 document trail

Your workflow:
1. Filter by date range
2. Review all processed documents
3. Verify routing accuracy
4. Document any discrepancies
5. Generate compliance report
```

### Search Tips

**By Sender ID:** Track documents from specific supplier
**By Receiver ID:** Check documents for specific company
**By Date Range:** Periodic reviews and audits
**By Process ID:** Specific document tracking

{{< callout type="info" >}}
**Export Button**: Currently non-functional and scheduled for removal. Contact your administrator for bulk export needs.
{{< /callout >}}

---

## 3. Registered Companies

Central registry of all Peppol ID to tenant mappings. This determines where documents are routed.

### What You See

| Column | Information | Use |
|--------|-------------|-----|
| **Registered Peppol ID** | The Peppol identifier | 0195:123456789 |
| **Company Name** | Legal company name | ABC Corporation Sdn Bhd |
| **Company Code** | Internal identifier | ABC-001 |
| **Tenant** | Destination environment | Production Staging |
| **Status** | Active/Inactive | Active |

### Filtering

Filter by tenant name to narrow results:
- Demo Staging
- Living Staging
- Production Staging
- Other environments

### Data Consistency

These Peppol IDs match what's in:
```
Organization Applet → Peppol Config tab → Company registration
```

This ensures single source of truth and prevents configuration drift.

### Common Scenarios

**Verify Registration:**
- Customer reports not receiving documents
- Search for company in registry
- Verify Peppol ID matches sender's target
- Confirm tenant mapping is correct

**Troubleshoot Routing:**
- Document arriving at wrong tenant
- Find Peppol ID in registry
- Check tenant assignment
- Look for duplicate registrations
- Correct mapping if needed

**Onboard New Company:**
- Register Peppol ID in Organization Applet
- Verify appears in Registered Companies
- Confirm correct tenant mapping
- Test document delivery

**Audit Compliance:**
- Export list of registered companies
- Verify all active companies registered
- Check for unauthorized registrations
- Document discrepancies

### Troubleshooting Checklist

**Document Not Arriving:**
- [ ] Is Peppol ID registered?
- [ ] Is registration active?
- [ ] Is tenant mapping correct?
- [ ] Is company code valid?
- [ ] Are there duplicate registrations?

**Wrong Tenant Delivery:**
- [ ] Which tenant is Peppol ID mapped to?
- [ ] Is there a conflicting registration?
- [ ] Is the mapping recent or outdated?
- [ ] Has company moved between tenants?

---

## 4. Test Bed (Inactive)

This tab is currently inactive and scheduled for removal.

**Original Purpose:** Internal Peppol testing without external services

**Why Inactive:** MDC (Malaysia Digital Economy Corporation) requires all testing be performed using the official MDC Test Bed for regulatory compliance.

**Current Testing Approach:**
- Use MDC Test Bed for official validation
- Use development tenants for integration testing
- Use staging environments for end-to-end testing

---

## 5. Daily Operations

### Morning Routine (9:00 AM)

- [ ] Check Inbox Queue (should be empty or minimal)
- [ ] Review Inbox History for overnight documents
- [ ] Verify no stuck or failed documents
- [ ] Document any anomalies

### Throughout the Day

- [ ] Monitor support tickets for delivery issues
- [ ] Respond to routing problems
- [ ] Keep Registered Companies updated
- [ ] Document configuration changes

### End of Day (5:00 PM)

- [ ] Final queue check
- [ ] Review day's document volume
- [ ] Ensure issues resolved or escalated
- [ ] Prepare handover notes

### Weekly Tasks

**Monday:**
- Review previous week's volume
- Analyze recurring issues
- Update documentation

**Friday:**
- Generate weekly summary
- Review Registered Companies accuracy
- Archive resolved tickets

### Monthly Tasks

**First Week:**
- Audit Registered Companies
- Remove inactive registrations
- Verify tenant mappings
- Generate compliance report

**Mid-Month:**
- Review performance metrics
- Analyze processing times
- Identify optimization opportunities

**End of Month:**
- Prepare management summary
- Document configuration changes
- Archive historical data

---

## 6. Troubleshooting Guide

### Documents Not Arriving

**Check Sequence:**
1. Search Inbox History - did it reach AP Tenant?
2. Verify Peppol ID in Registered Companies
3. Confirm sender used correct Peppol ID
4. Check sender's system logs
5. Verify network connectivity
6. Escalate to technical team

### Documents Route to Wrong Tenant

**Resolution Steps:**
1. Check Registered Companies for mapping
2. Look for duplicate registrations
3. Verify recent configuration changes
4. Correct mapping in Organization Applet
5. Test with new document
6. Document issue and resolution

### Queue Has Many Documents

**Investigation:**
1. Check system resources (CPU, memory)
2. Verify destination tenants accessible
3. Review for error patterns
4. Check network connectivity
5. Escalate if persistent
6. Monitor until queue clears

---

## 7. Best Practices

### Access Control

- Limit access to authorized personnel
- Regular permission reviews
- Immediate revocation when staff leaves
- Strong authentication required
- Log all access and changes

### Data Protection

- Never share Process IDs publicly
- Protect Peppol ID information
- Secure data exports
- Follow retention policies
- Comply with privacy regulations

### Change Management

- Document all configuration changes
- Test in non-production first
- Have rollback plan ready
- Notify affected teams
- Update documentation

### Documentation

**What to Document:**
- Configuration changes
- Routing issues and resolutions
- New company onboarding
- System anomalies
- Performance metrics

**Where to Document:**
- Internal knowledge base
- Support ticket system
- Change management system
- Team communication channels

---

## 8. Common Issues

**Empty queue but customer says document sent?**
- Check Inbox History by Sender ID
- Verify sender used correct Peppol ID
- Check sender's system logs
- Confirm document actually sent

**Document in History but not in tenant?**
- Verify routing decision was correct
- Check destination tenant accessibility
- Look for processing errors
- Contact technical team for re-routing

**Duplicate registrations causing issues?**
- Identify which registration is correct
- Remove duplicate from Registered Companies
- Test document delivery
- Document the correction

**Can't find company in Registered Companies?**
- Check if registered in Organization Applet
- Verify spelling of company name
- Try searching by Peppol ID
- Confirm registration is active

**Process ID doesn't match between systems?**
- This shouldn't happen - escalate immediately
- Provide both Process IDs
- Include timestamps
- Contact technical team

---

## 9. Integration Points

### With Organization Applet

Peppol ID registrations sync between:
- Organization Applet → Peppol Config tab
- Peppol AP Admin → Registered Companies

Changes in one should reflect in the other.

### With My Invoice Admin Applet

Process IDs link documents across:
- Outgoing documents (My Invoice Admin)
- Incoming documents (Peppol AP Admin)

Use Process ID for end-to-end tracking.

### With Support Systems

When creating support tickets:
- Include Process ID
- Reference Inbox History record
- Provide Peppol IDs (sender and receiver)
- Note destination tenant
- Attach relevant screenshots

---

## 10. Quick Reference

### Access Path

```
account.cloud → Peppol AP Tenant → Peppol AP Admin Applet
```

### Key Menus

| Menu | Purpose | Typical Use |
|------|---------|-------------|
| **Inbox Queue** | Real-time monitoring | Check for stuck documents |
| **Inbox History** | Audit trail | Verify delivery, support tickets |
| **Registered Companies** | Peppol ID registry | Verify mappings, troubleshoot routing |

### Critical Information

**Process ID:** Unique tracking identifier across all systems
**Peppol ID Format:** 0195:XXXXXXXXX (Malaysia)
**Normal Queue Size:** 0-5 documents
**Processing Time:** Typically seconds

### Emergency Contacts

- **System Issues:** Technical team
- **Routing Problems:** Operations team
- **Access Issues:** System administrator
- **Compliance Questions:** Compliance officer

---

## 11. Frequently Asked Questions

**Q: A customer claims they sent a document 5 minutes ago, but it's not in the destination tenant. Where do I check first?**
A: Check **Inbox History** first. If it was successfully routed, it will show as "Delivered" with the target tenant. If it failed or is still processing, verify the Peppol ID in **Registered Companies** and check the **Inbox Queue**.

**Q: What should I do if the Inbox Queue suddenly has 50+ documents and isn't clearing?**
A: This indicates a system blockage or severe load issue. DO NOT ignore it. Check system logs for immediate errors, verify that destination tenants are accessible, and escalate to the technical team immediately.

**Q: We onboarded a new company, but their received documents are failing. What's wrong?**
A: They are likely missing their Peppol ID mapping. Go to **Organization Applet → Peppol Config** and ensure their correct Peppol ID is mapped to their active tenant. Verify the update reflects in this applet's **Registered Companies** list.

**Q: Why can't I manually re-route a document that went to the wrong tenant?**
A: To maintain strict audit trails and compliance, manual re-routing is disabled. You must fix the root cause (the mapping in Registered Companies) and have the technical team re-process or ask the sender to resubmit.

**Q: Can I export the Inbox History to send a delivery report to a customer?**
A: The export button is currently non-functional. Instead, take a screenshot of the specific record containing the Process ID and status, or contact your administrator for a direct database extract if a large volume of data is needed.

{{< callout type="info" >}}
**Need Help?** Contact your system administrator or technical team for assistance with specific scenarios.
{{< /callout >}}
