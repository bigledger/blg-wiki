---
title: "Getting Started"
description: "Prerequisites, setup workflow, and initial configuration for the Membership Module"
weight: 10
---

Welcome to the Membership Module Getting Started guide. This section will help you understand the prerequisites, prepare your system, and successfully implement your first membership program in BigLedger.

## Who Should Read This

This guide is designed for:
- **System Administrators** setting up the Membership Module for the first time
- **Business Analysts** planning membership program implementation
- **Project Managers** coordinating loyalty program launches
- **IT Teams** responsible for BigLedger configuration

## What You'll Learn

By following this getting started guide, you'll understand:

1. **Prerequisites** - What must be configured before enabling the Membership Module
2. **Dependencies** - Required Core Module applets and their configuration status
3. **Setup Workflow** - Step-by-step process from planning to launch
4. **Quick Start** - Fast-track guide to get a basic program running in minutes
5. **Best Practices** - Proven approaches for successful implementations

## Before You Begin

### Technical Prerequisites

Ensure your BigLedger environment meets these requirements:

**Core Module Configuration**
- Organization structure defined
- Chart of Accounts configured
- At least one operating location active
- User roles and permissions established

**Master Data Readiness**
- Customer master data structure finalized
- Product/service catalog populated
- Tax configuration completed
- Payment methods configured

**Infrastructure Readiness**
- Database backup procedures in place
- Test environment available (recommended)
- Admin user access confirmed
- Documentation access for all stakeholders

### Business Prerequisites

Before implementing the Membership Module, complete these business planning steps:

**Program Design**
- Clear loyalty program objectives defined
- Target customer segments identified
- Tier structure designed (if applicable)
- Earning and redemption rules outlined
- Budget allocated for program costs

**Legal and Compliance**
- Terms and conditions drafted
- Privacy policy updated for member data
- Financial liability assessment completed
- Regulatory requirements reviewed

**Operational Readiness**
- Staff training plan prepared
- Customer communication strategy defined
- Member support procedures established
- Reporting requirements identified

## Implementation Roadmap

### Phase 1: Foundation (Week 1)

**Core Module Verification**
1. Verify Organization Applet configuration
2. Confirm Customer Maintenance Applet setup
3. Validate Doc Item Maintenance readiness
4. Check Pricebook Applet configuration

**Membership Planning**
1. Document tier structure and criteria
2. Define points currencies needed
3. Map earning rules by tier and category
4. Design redemption mechanisms

### Phase 2: Configuration (Week 2)

**Membership Module Setup**
1. Install required applets
2. Create points currencies
3. Configure member classes/tiers
4. Set up earning rules
5. Define redemption options

**Integration Configuration**
1. Link to POS (if applicable)
2. Configure E-Commerce integration (if applicable)
3. Set up Financial Accounting linkages
4. Configure reporting parameters

### Phase 3: Testing (Week 3)

**Functional Testing**
1. Test member enrollment flow
2. Validate points earning calculations
3. Verify redemption mechanisms
4. Confirm tier progression logic
5. Test expiry processing

**Integration Testing**
1. Test POS member identification
2. Validate E-Commerce points display
3. Confirm accounting entries accuracy
4. Test multi-channel consistency

### Phase 4: Pilot Launch (Week 4)

**Soft Launch**
1. Enroll pilot member group (50-100 members)
2. Monitor daily operations
3. Collect staff feedback
4. Identify and resolve issues
5. Refine configurations based on learnings

### Phase 5: Full Rollout (Week 5+)

**Production Launch**
1. Complete staff training
2. Launch marketing campaign
3. Open enrollment to all customers
4. Monitor system performance
5. Track program KPIs

## Setup Workflow Overview

The typical setup sequence follows this pattern:

### Step 1: Core Applet Configuration

Configure these Core Module applets first (if not already done):

```
1. Organization Applet
   └─ Define locations where memberships operate

2. Customer Maintenance Applet
   └─ Prepare customer data structure for member linking

3. Doc Item Maintenance Applet
   └─ Create membership product items

4. Pricebook Applet
   └─ Set up member pricing structures
```

### Step 2: Membership Module Applets

Install and configure Membership-specific applets:

```
1. Membership Points Currency
   └─ Create point currencies (e.g., LOYPTS, GOLDPTS)

2. Membership Admin Console
   └─ Central management interface setup

3. Membership Program Applet
   └─ Configure programs, tiers, earning rules
```

### Step 3: Integration Setup

Connect Membership Module to other modules:

```
1. POS Integration
   └─ Enable member identification and points earning at checkout

2. E-Commerce Integration
   └─ Configure member portal via CP-Commerce

3. Financial Accounting Integration
   └─ Set up liability accounts and journal templates
```

### Step 4: Testing and Validation

Comprehensive testing before launch:

```
1. Create test member accounts
2. Execute complete customer journeys
3. Verify all calculations
4. Confirm reporting accuracy
5. Test edge cases and exceptions
```

## Choosing Your Path

Based on your needs, choose the appropriate starting point:

### Fast Track: Quick Start Guide

**Best for:**
- Simple loyalty programs
- Single-tier implementations
- Learning and exploration
- Proof of concept

**Time Required:** 5-10 minutes

**What You'll Build:** Basic loyalty program with single tier, simple earning rules, and points redemption.

[Start Quick Start Guide →](/modules/membership/getting-started/quick-start-guide/)

### Comprehensive Setup: Installation Requirements

**Best for:**
- Enterprise implementations
- Multi-tier programs
- Production deployments
- Full feature utilization

**Time Required:** 2-4 hours

**What You'll Learn:** Complete prerequisite checklist, detailed dependency verification, and configuration validation.

[Review Installation Requirements →](/modules/membership/getting-started/installation-requirements/)

### Practical Walkthrough: First Membership Program

**Best for:**
- Hands-on learners
- Retail loyalty programs
- Step-by-step guidance
- Real-world implementation

**Time Required:** 30-60 minutes

**What You'll Build:** Complete retail loyalty program with Bronze/Silver/Gold tiers, points earning, and redemption.

[Build Your First Program →](/modules/membership/getting-started/first-membership-program/)

## Common Starting Scenarios

### Scenario 1: Retail Store Loyalty

**Business Need:** Reward repeat customers with points and tiered benefits

**Recommended Path:**
1. Start with [Installation Requirements](/modules/membership/getting-started/installation-requirements/)
2. Follow [First Membership Program](/modules/membership/getting-started/first-membership-program/)
3. Configure POS integration for seamless checkout

**Key Configurations:**
- 3-tier structure (Bronze, Silver, Gold)
- Single points currency
- Dollar-to-points earning rule
- Points-to-discount redemption

### Scenario 2: Service Business Subscription

**Business Need:** Monthly/annual memberships with fixed benefits

**Recommended Path:**
1. Review [Installation Requirements](/modules/membership/getting-started/installation-requirements/)
2. Focus on membership deposit configuration
3. Set up auto-renewal processes

**Key Configurations:**
- Subscription-based membership products
- Deposit-based payment model
- Recurring billing setup
- Member portal for account management

### Scenario 3: Multi-Brand Loyalty Network

**Business Need:** Shared loyalty program across multiple business units

**Recommended Path:**
1. Complete [Installation Requirements](/modules/membership/getting-started/installation-requirements/) thoroughly
2. Design multi-currency point system
3. Configure cross-location redemption

**Key Configurations:**
- Multiple point currencies by brand
- Organization-wide member accounts
- Cross-brand redemption rules
- Centralized reporting

## Success Criteria

Before considering your setup complete, verify these criteria:

### Technical Validation

- [ ] All required applets installed and accessible
- [ ] At least one points currency created
- [ ] Member class/tier configured
- [ ] Test member account created successfully
- [ ] Points earning calculation verified
- [ ] Redemption mechanism tested
- [ ] Reports generating accurately

### Business Validation

- [ ] Program rules documented
- [ ] Staff trained on enrollment process
- [ ] Member communications prepared
- [ ] Support procedures established
- [ ] Financial tracking configured
- [ ] KPI dashboard functional

### Integration Validation

- [ ] POS member lookup working (if applicable)
- [ ] E-Commerce member login functional (if applicable)
- [ ] Accounting entries posting correctly
- [ ] Multi-channel data consistency confirmed

## Getting Help

If you encounter issues during setup:

### Documentation Resources

- **[Membership Module Overview](/modules/membership/)** - Architecture and capabilities
- **[Applet Documentation](/applets/)** - Detailed applet configuration guides
- **[Integration Guides](/modules/membership/integration/)** - Module integration instructions

### Support Channels

- **BigLedger Support Portal** - Submit support tickets
- **Implementation Team** - For enterprise customers
- **Community Forum** - Share experiences and solutions
- **Training Resources** - Video tutorials and webinars

### Troubleshooting

Common setup issues and resolutions:

**"Required applet not visible"**
- Verify applet installation
- Check user permissions
- Confirm module license activation

**"Cannot create member class"**
- Ensure points currency created first
- Verify Organization Applet configured
- Check database permissions

**"Points not calculating"**
- Review earning rule configuration
- Verify transaction type eligibility
- Check tier assignment for member

## Next Steps

Ready to get started? Choose your path:

{{< cards >}}
  {{< card link="/modules/membership/getting-started/quick-start-guide/" title="Quick Start Guide" subtitle="5-minute setup for a basic loyalty program - perfect for learning and testing" >}}
  {{< card link="/modules/membership/getting-started/installation-requirements/" title="Installation Requirements" subtitle="Comprehensive checklist of all prerequisites and dependencies" >}}
  {{< card link="/modules/membership/getting-started/first-membership-program/" title="First Membership Program" subtitle="Step-by-step walkthrough to build a complete retail loyalty program" >}}
{{< /cards >}}

{{< callout type="tip" >}}
**Recommended Approach**: Start with the Quick Start Guide to familiarize yourself with the module, then review Installation Requirements before building your production program using the First Membership Program walkthrough.
{{< /callout >}}
