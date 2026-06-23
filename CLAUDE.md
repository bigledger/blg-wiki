# BigLedger Documentation - Development Guidelines

---

# 🚨🚨🚨 READ THIS FIRST — WE WRITE USER GUIDES, NOT REFERENCE CARDS 🚨🚨🚨

> The single most important rule in this repository. **Read it. Apply it. Do not skip it.**

## The two types of documentation in this repo

| Type | Location | Audience | Voice |
|---|---|---|---|
| **User guide** (a.k.a. **user manual**) | `/content/en/guides/`, `/content/en/user-guide/`, `/content/en/tutorials/` | A real human reader trying to accomplish a business task | Warm, hand-holding, second-person, examples-first |
| **Reference doc** | `/content/en/applets/`, `/content/en/api-reference/`, `/content/en/developer-docs/` | An operator who already knows the workflow and needs to look up a field | Dense, precise, exhaustive, table-heavy |

**These are NOT the same artifact.** Do not confuse them. Do not let one bleed into the other.

## A user guide tells a story

A user guide:
- Is written FOR a person, not about a system. There is a named reader in the writer's head.
- **Opens with the outcome**, not the menu path. "By the end of this guide, your first invoice will post correctly." Menu paths come *after* the framing.
- **Uses a running example** — the canonical fictional running example — **GadgetSphere Sdn Bhd**, a Malaysian multi-branch consumer electronics retail group (see "The running example" below) and threads it through every step.
- **Translates every internal system identifier into plain English.** When the engine calls something `DEBTOR_NON_TRADE_NOT_INVOICED`, the guide says "accrued non-trade receivables — money owed to you that you haven't invoiced yet". The uppercase identifier goes in a footnote or aside, never as the primary label.
- **Embeds screenshots** from the applet doc at the moments the reader is staring at a confusing screen.
- **Anticipates "what happens if I get this wrong"** and answers it concretely. ("If you skip Step 6, every sales invoice will fail to post with the message *Default GL Code not configured for SALES*. You'll find out the first time someone in Sales hits Save.")
- **Closes the loop** at the end of every guide with a *"What success looks like"* check the reader can run in 30 seconds to confirm they're done.

## A reference card lists fields

A reference card:
- Has tables of every field, type, default, validator.
- Uses internal system identifiers as primary labels.
- Says "Required. Immutable after save. Max 255 chars."
- Lives in the applet doc. **It does not belong in a guide.**

If the first 30 seconds of your draft reads like a database schema, **you have written a reference card. Stop. Throw it away. Restart.**

## Voice and tone — Xero / QuickBooks-style

User guides in this repo use a warm, hand-holding tone aimed at a small-business owner or accounts clerk who may not be a trained accountant. Reference: how Xero and QuickBooks write their support docs.

- **"You" not "the user"**. Speak to the reader, not about them.
- **Plain English over jargon.** "Customers who owe you money" beats "Trade Debtors" on first mention. Then introduce the technical term in parentheses.
- **Reassuring, not condescending.** "Don't worry, this only takes about 10 minutes" — not "It is recommended that the administrator allocate sufficient time to complete this procedure."
- **Concrete numbers and examples.** RM 100. 6% SST. 8 staff. *Restoran Kopi Pagi*. Not "an entity".
- **Active voice, present tense.** "BigLedger posts the journal" — not "The journal will be posted by the system."
- **Acronyms get expanded the first time, every time.** GR/IR (Goods Received / Invoice Received). WIP (Work in Progress). MA (Moving Average).

## Required structure for every user guide

```
1. Front matter (title, description, tags, weight) — no duplicate H1
2. Opening paragraph (2-3 sentences) — name the reader, name the outcome, set time expectation
3. "Meet [the example business]" — one short paragraph introducing the running example
4. Concepts (only if 2-5 BigLedger-specific terms are essential) — plain-English first, identifier second
5. Prerequisites — concrete, checkable, no chicken-and-egg references to later steps
6. Numbered "Step N: [Outcome verb + object]" sections. Each step:
   - Opens with the outcome (1 sentence)
   - Shows the menu path (1 line, italics)
   - Walks the user through with the running example
   - Translates any system identifiers it touches
   - Embeds a screenshot if the screen is non-obvious
   - Names the most common failure and how to spot it
7. "What success looks like" — a 30-second test the reader runs to confirm they're done
8. "Common mistakes" — the top 5 ways this goes wrong, with symptoms and fixes
9. Related documentation — links to the applet doc (reference) and adjacent guides
```

## The running example — GadgetSphere Sdn Bhd

Every user guide in this repo uses the SAME synthetic Malaysian business as the running example, so a reader who follows multiple guides meets the same characters and the same shape. The example was chosen to sit at the median of the **actual** BigLedger customer base, which we verified by querying live production tenants.

### Who BigLedger actually sells to (verified from live tenant data)

The dominant customer is a **multi-branch Malaysian consumer electronics / mobile / IT retailer** with **2+ legal entities** and **5–200+ branches**. Examples in the live customer base include the largest Malaysian tech retail chain (~217 branches across 2 companies), the largest Malaysian computer retail group (~115 branches across 8 companies), the largest Malaysian mobile-phone retailer (~78 branches across 7 companies), and several mid-size IT / mobile chains. Secondary segments: pharmacy chains (~50 branches), automotive service groups, precision manufacturers, and franchise-model F&B.

**The customer is NOT a small single-owner F&B outlet.** Do not write guides as if they were.

### The synthetic running example — GadgetSphere Sdn Bhd

A fictional Malaysian multi-branch consumer electronics retailer chosen to be **representative of the median customer** — big enough to feel real, small enough to walk through in a guide.

**Group structure (3 companies):**
- **GadgetSphere Sdn Bhd** (code `GS`) — main operating retail company. Multi-brand consumer electronics: smartphones, laptops, tablets, gaming, accessories.
- **GadgetSphere Online Sdn Bhd** (code `GSO`) — the e-commerce arm + fulfilment centre.
- **GadgetSphere Distribution Sdn Bhd** (code `GSD`) — wholesale + authorised distribution to corporate clients.

**Scale:**
- 22 retail branches across Klang Valley (12 incl. Pavilion KL, Mid Valley, Sunway Pyramid, IOI City Mall), Penang (4 incl. Gurney Plaza), Johor Bahru (3 incl. KSL City), Kota Kinabalu (2), Kuching (1)
- ~5,200 active SKUs across 30+ brands (Apple, Samsung, Asus, Lenovo, HP, Dell, Microsoft, Honor, Oppo, Vivo, Xiaomi, Logitech, Razer, etc.)
- 28 cashbooks (one per Maybank / Public Bank / CIMB account, plus group-level accounts)
- ~85,000 customer entities (mostly walk-in retail, some B2B)
- ~1,200 supplier entities (authorised distributors, accessory wholesalers, brand principals)
- SST-registered (6% service tax)
- Multi-currency: mostly MYR, some USD purchases from regional distributors in Singapore and Hong Kong

**The finance team (the people who read these guides):**
- **Pn. Aishah Rahman, CFO / Head of Finance** — chartered accountant, decides chart structure, reviews month-end reports.
- **En. Daniel Tan, Senior Accounts Executive** — chart of accounts day-to-day, journal entries, month-end close, financial reporting.
- **Cik Farah Hashim, Accounts Clerk** — daily AR/AP, bank reconciliation, invoice processing.
- **En. Hadi Razak, IT/Finance Sysadmin** — initial migration, integrations, applet settings, permissions.

**Which character is the reader of each guide:**
- **Chart of Accounts Setup** → En. Hadi (doing the initial setup) working with Pn. Aishah (deciding the chart structure)
- **Journal Entries** → En. Daniel (posting monthly accruals, depreciation, opening balances)
- **Bank Reconciliation** → Cik Farah (monthly cashbook reconciliation)
- **Financial Reporting** → En. Daniel (running the close), reporting to Pn. Aishah

**GL Code style:** mnemonic alphabetic (verified standard in live customers). Examples for GadgetSphere:
- `CASH-MBB-PAV` (cash, Maybank, Pavilion branch), `CASH-PBB-MID` (Public Bank, Mid Valley)
- `DEBTOR-TRADE-RETAIL`, `DEBTOR-CC-VISA`, `DEBTOR-CC-AMEX`
- `INV-MOBILE`, `INV-LAPTOP`, `INV-ACCESSORY`
- `SALES-MOBILE-PAV`, `SALES-LAPTOP-MID`, `SALES-ONLINE`
- `COST-MOBILE`, `COST-LAPTOP`, `COST-ACCESSORY`
- `EXPENSE-RENTAL`, `EXPENSE-WAGES`, `EXPENSE-MARKETING`
- `LIAB-SST-OUTPUT`, `LIAB-SUPPLIER-TRADE`
- `EQUITY-CAPITAL`, `EQUITY-RETAINED`

Numeric coding is mentioned as a secondary option for accountants who prefer it. The default in our guides is mnemonic.

**Use these names, codes, and scale numbers consistently across all four accounting guides.** If a new guide for another module is written later, extend GadgetSphere — don't invent a new business.

## 🔬 You MUST study the live tenant data before writing

This repo sits on a server with read-only access to all production BigLedger tenants. **Use it.**

Before writing or rewriting any user guide, study real tenant data to understand how customers actually configure and use the system. The fictional running example in the guide must be **inspired by patterns observed in real tenants** — not invented from accounting textbook abstractions.

### How to access

- **Schema dumps** (DDL only, world-readable via sudo):
  `sudo cat /home/vincent/projects/sysadmin/aws-akaun/tenant-schemas/pcimage/tables/bl_fi/<table>.sql`
- **Live DB** (read-only queries via SSH tunnel to the bastion):
  `sudo -u vincent /home/vincent/projects/sysadmin/bin/psql-akaun-master -c "SELECT ..."`
- **Tenant list**: 83 active tenants in `app_tenant_hdr` (akaun_master). Per-tenant DB connection JSON is in `app_generic_resources_hdr`.
- **Source code**: `/home/marketing/repos/refs/` holds clones of every applet UI repo and the Java backend (`blg-akaun-platform-java`). Run `git -C <repo> pull --ff-only` before reading.

### What to look at before writing a guide

For the Chart of Accounts guide, look at: what real charts look like — common section names, common code ranges, typical category groupings. For Journal Entries: what real manual journals say in `descr`, what common reference number patterns are. For Bank Reconciliation: what real `bl_fi_cashbook_txn_stmt_recon_link` records look like in practice. For Financial Reports: what real Set of Books configurations look like.

### Privacy rules — non-negotiable

- ✅ **DO** use patterns and shapes you observe (e.g. "a common pattern is to number current assets 1000-1499 and fixed assets 1500-1999").
- ✅ **DO** anonymise any example you use ("a F&B chain with 12 outlets" not the tenant's real name).
- ❌ **DO NOT** copy any tenant's real name, real account names, real reference numbers, real amounts, real customer names, real GL Code descriptions, real branch names, or anything else that could identify a specific customer.
- ❌ **DO NOT** include real tenant data in any markdown file, screenshot, commit message, or PR.

The fictional running example (e.g. *Restoran Kopi Pagi Sdn Bhd*) is **synthetic, inspired by real shapes**. Never the other way around.

## How to know you've slipped back into reference-card writing

Self-check before every commit. If any of these are true, you've written a reference card, not a guide:

- ❌ More than 3 tables of fields in the body.
- ❌ Uppercase system identifiers (`DEBTOR`, `OUTPUT_TAX`, `STOCK_BALANCE_WIP`) appearing as headings or primary bullet labels.
- ❌ The word "Immutable" or "Required" appearing more than 5 times.
- ❌ No fictional business or worked example anywhere.
- ❌ No screenshots and the workflow involves looking at a screen.
- ❌ No "what happens if I skip this" or "what success looks like" sections.
- ❌ The reader could not tell from the first paragraph who this guide is for.

If you spot any of these, rewrite. The applet doc absorbs the reference content — keep it there.

---



### Primary Language: English (en)
- **All new content should be authored in English first**
- English content is located in `content/en/`
- This is the authoritative version of all documentation
- Keep English content up-to-date and comprehensive

### Supported Languages
1. **Chinese (zh)** - `content/zh/`
2. **Malay (ms)** - `content/ms/`  
3. **Arabic (ar)** - `content/ar/` (RTL support enabled)

### Translation Policy
- Translations are updated periodically, not in real-time
- English content takes priority for new features and updates
- Translation folders may not always have complete parity with English
- When creating new content, focus only on the English version

### Content Creation Guidelines for Claude

When creating or updating documentation:

1. **Always work in the English (`content/en/`) directory**
2. **Do not create translations automatically**
3. **Structure all new content in English first**
4. **Use clear, simple English that is easy to translate**
5. **Avoid idioms and culturally-specific references**

## BigLedger Architecture - Module-Applet Relationship

### CRITICAL: Understanding Modules and Applets

**Modules and Applets have a many-to-many relationship:**
- **Modules** = Logical business groupings (e.g., Financial Accounting, E-Commerce, POS)
- **Applets** = Reusable functional components that can belong to MULTIPLE modules
- **Location**: All applet documentation stays in `/content/en/applets/` (single source of truth)
- **References**: Modules reference (link to) applets, never duplicate their documentation

**Example**: Tax Configuration Applet is used by:
- Financial Accounting Module
- Sales & CRM Module  
- Purchasing Module
- E-Commerce Module
- POS Module

This applet has ONE documentation file in `/applets/` that all modules link to.

**DO:**
- ✅ Keep applet docs in `/applets/`
- ✅ Have modules list and link to their applets
- ✅ Explain in each module which applets it uses

**DON'T:**
- ❌ Move applets under module folders
- ❌ Duplicate applet documentation
- ❌ Create multiple versions of the same applet doc

### IMPORTANT: Hextra Theme Limitations

⚠️ **The Hextra theme has strict limitations on HTML/CSS usage:**

1. **DO NOT use complex inline HTML with styles** - The theme doesn't properly render complex HTML/CSS
2. **DO NOT use `<div>` tags with inline styles** - They will display as raw HTML
3. **DO NOT use CSS grid or flexbox in markdown** - It won't work correctly

✅ **INSTEAD, use Hextra's built-in components:**

```markdown
# Good - Using Hextra cards component
{{< cards >}}
  {{< card link="/path" title="Title" subtitle="Description" >}}
{{< /cards >}}

# Bad - Using HTML divs
<div style="display: grid;">...</div>
```

✅ **Use these Hextra components:**
- `{{< cards >}}` - For card grids
- `{{< card >}}` - Individual cards with title, subtitle, link
- `{{< hextra/hero-badge >}}` - Hero badges
- `{{< hextra/hero-headline >}}` - Hero headlines
- `{{< hextra/hero-subtitle >}}` - Hero subtitles
- `{{< hextra/hero-button >}}` - Call-to-action buttons
- `{{< tabs >}}` - Tabbed content
- `{{< tab >}}` - Individual tab content

✅ **For styling, use:**
- Standard Markdown formatting
- Hextra's built-in classes only
- Emoji for visual elements (sparingly)
- Simple tables for structured data

❌ **Avoid:**
- Inline `style` attributes
- Complex HTML structures
- Custom CSS classes
- JavaScript in content files

### File Structure Example
```
content/
├── en/           # PRIMARY - Always update this first
│   ├── _index.md
│   ├── user-guide/
│   ├── developer-docs/
│   ├── api-reference/
│   └── tutorials/
├── zh/           # Chinese translations (updated periodically)
├── ms/           # Malay translations (updated periodically)
└── ar/           # Arabic translations (updated periodically, RTL)
```

### Important Commands

Test the site locally:
```bash
./scripts/test-local.sh
# Or manually: hugo server -D
```

Build the site:
```bash
hugo --gc --minify
```

Check for broken links:
```bash
./scripts/check-links.sh
```

### Language URLs
- English: https://wiki.bigledger.com/ (default)
- Chinese: https://wiki.bigledger.com/zh/
- Malay: https://wiki.bigledger.com/ms/
- Arabic: https://wiki.bigledger.com/ar/

## Deployment Process

### IMPORTANT: Always use GitHub Actions for deployment

**DO NOT deploy directly from local machine to S3!** The site should be deployed through GitHub Actions for consistency and security.

### Deployment Workflow

1. **Complete Deployment Process:**
   ```bash
   ./scripts/deploy.sh
   ```
   This script will:
   - Build the site
   - Optionally test locally
   - Commit changes
   - Push to GitHub
   - Monitor GitHub Actions deployment
   - Verify the deployment

2. **Manual Steps:**
   ```bash
   # 1. Build and test locally
   ./scripts/test-local.sh
   
   # 2. Check for broken links
   ./scripts/check-links.sh
   
   # 3. Commit changes
   git add -A
   git commit -m "Your commit message"
   
   # 4. Push to GitHub (this triggers deployment)
   git push origin main
   
   # 5. Monitor deployment
   gh run list --workflow=deploy.yml --limit=1
   gh run watch <run-id>
   ```

3. **Setup GitHub Secrets (one-time setup):**
   ```bash
   ./scripts/setup-github-secrets.sh
   ```
   Required secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_REGION`

### Deployment Scripts

All deployment scripts are located in the `scripts/` directory:

- **`deploy.sh`** - Complete deployment workflow
- **`test-local.sh`** - Build and test locally
- **`check-links.sh`** - Validate all internal links
- **`setup-github-secrets.sh`** - Configure GitHub Actions secrets

### GitHub Actions

The site is automatically deployed when changes are pushed to the `main` branch. The workflow:

1. Builds the site with Hugo
2. Deploys to S3 bucket: `wiki.bigledger.com`
3. Invalidates CloudFront distribution: `E3FOFD9ZXC2QVT`
4. Verifies deployment

Monitor deployments at: https://github.com/bigledger/blg-wiki/actions

### Troubleshooting Deployment

If deployment fails:

1. **Check GitHub Actions logs:**
   ```bash
   gh run view <run-id>
   ```

2. **Verify secrets are set:**
   ```bash
   gh secret list
   ```

3. **Test build locally:**
   ```bash
   hugo --gc --minify
   ```

4. **Check S3 permissions:**
   - Ensure AWS credentials have S3 write access
   - Verify bucket policy allows uploads

5. **CloudFront issues:**
   - Wait 5-10 minutes for propagation
   - Check CloudFront distribution status in AWS Console

## CRITICAL: Navigation and Title Guidelines

### ⚠️ MANDATORY RULES TO PREVENT NAVIGATION AND TITLE ISSUES

#### 1. Navigation Structure Requirements
**EVERY directory MUST have an _index.md file:**
- Check EVERY directory in `content/en/` for _index.md
- Use this exact template for ALL _index.md files:
```markdown
---
title: "Section Title"
description: "Clear description of this section"
weight: [number for ordering]
bookCollapseSection: false  # For top-level sections
---

[Content here]
```

#### 2. Preventing Duplicate Titles
**NEVER add an H1 heading that duplicates the front matter title:**
```markdown
# BAD Example:
---
title: "Module Overview"
---

# Module Overview  ← DELETE THIS! It duplicates the title above

Content starts here...

# GOOD Example:
---
title: "Module Overview"
---

Content starts here directly without repeating the title...
```

#### 3. Systematic Verification Checklist
Before EVERY commit, run these checks:

```bash
# Check for missing _index.md files
find content/en -type d | while read dir; do
  if [ ! -f "$dir/_index.md" ]; then
    echo "MISSING: $dir/_index.md"
  fi
done

# Check for duplicate titles
find content/en -name "*.md" | while read file; do
  title=$(grep "^title:" "$file" | head -1 | sed 's/title: *//' | tr -d '"')
  h1=$(grep "^# " "$file" | head -1 | sed 's/^# *//')
  if [ "$title" = "$h1" ]; then
    echo "DUPLICATE TITLE: $file"
  fi
done
```

#### 4. When Adding New Content
- **ALWAYS create _index.md FIRST** before adding any content to a directory
- **NEVER use an H1 heading** if it matches the front matter title
- **TEST navigation locally** with `hugo server` before committing
- **Verify left menu appears** on ALL pages

#### 5. Common Mistakes to Avoid
- ❌ Creating content files without parent _index.md
- ❌ Adding H1 headings that duplicate front matter titles
- ❌ Missing bookCollapseSection in section _index.md files
- ❌ Forgetting to test navigation after changes
- ❌ Assuming navigation works without verification

## Remember

1. **When authoring content, focus exclusively on the English version in `content/en/`. Translations will be handled separately.**
2. **Always deploy through GitHub Actions, never directly from local machine to S3.**
3. **Test locally before pushing to ensure the build succeeds.**
4. **Monitor GitHub Actions to confirm successful deployment.**
5. **NEVER add the following lines to commit messages:**
   - `🤖 Generated with [Claude Code](https://claude.ai/code)`
   - `Co-Authored-By: Claude <noreply@anthropic.com>`
   - Keep commit messages clean and professional without attribution tags
6. **ALWAYS verify navigation and titles before committing - use the verification checklist above**