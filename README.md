# BigLedger Documentation Wiki

This repository contains the source for BigLedger's documentation website, built with Hugo and hosted at https://wiki.bigledger.com

---

## 🚨 BEFORE YOU EDIT — READ THIS

**We write USER MANUALS, not reference cards.**

The most common failure in this repo is writing dense reference cards full of field tables and uppercase system identifiers, then calling them user guides. **Stop.**

- **User guides** (`/content/en/guides/`, `/content/en/user-guide/`, `/content/en/tutorials/`) tell a story to a real reader. Warm, hand-holding, second-person, examples-first. Voice and tone reference: Xero / QuickBooks support docs.
- **Reference docs** (`/content/en/applets/`, `/content/en/api-reference/`, `/content/en/developer-docs/`) list fields, types, validators. Dense, precise, exhaustive.

These are **different artifacts**. Do not confuse them. Do not let one bleed into the other.

Every guide must:
- Use a **fictional Malaysian SME running example** (canonically *Restoran Kopi Pagi Sdn Bhd* — F&B + retail, 8 staff). Continuity makes it stick.
- **Translate every internal system identifier into plain English** on first mention. `DEBTOR` → "customers who owe you money (Trade Debtors)".
- **Embed screenshots** from `/static/images/<applet-name>/` at high-friction steps.
- **Anticipate failure modes** — "if you skip this, here's the symptom you'll see".
- **Close with "What success looks like"** — a 30-second concrete check the reader runs.
- Be informed by **patterns observed in real tenant data** (read-only access available via `sudo -u vincent /home/vincent/projects/sysadmin/bin/psql-akaun-master`). Anonymise everything — no real customer names, accounts, or numbers in the markdown.

**Read [`CLAUDE.md`](CLAUDE.md) and [`AGENTS.md`](AGENTS.md) for the full charter before writing or editing.**

---

## ⚠️ CRITICAL: GitHub File Paths

### **ALL documentation files are located under `content/en/` NOT just `en/`**

❌ **WRONG**: `https://github.com/bigledger/blg-wiki/blob/main/en/user-guide/_index.md`  
✅ **CORRECT**: `https://github.com/bigledger/blg-wiki/blob/main/content/en/user-guide/_index.md`

**The `content/` prefix is REQUIRED for all GitHub paths!**

## Overview

The documentation is organized into sections under `content/en/`:
- **User Guide** (`content/en/user-guide/`) - Comprehensive guides for end users
- **Developer Documentation** (`content/en/developers/`) - Technical documentation for developers
- **API Reference** (`content/en/developers/api-reference/`) - Complete API documentation
- **Modules** (`content/en/modules/`) - Core module documentation
- **Applets** (`content/en/applets/`) - Applet documentation
- **Business Operations** (`content/en/business-operations/`) - Operational workflows
- **E-Commerce** (`content/en/ecommerce/`) - E-commerce features
- **Industry Solutions** (`content/en/industry-solutions/`) - Industry-specific guides

## Local Development

### Prerequisites
- Hugo (extended version) - `brew install hugo`
- Git

### Running Locally

1. Clone the repository with submodules:
```bash
git clone --recurse-submodules https://github.com/[your-org]/blg-wiki.git
cd blg-wiki
```

2. Start the Hugo development server:
```bash
hugo server -D
```

3. Open http://localhost:1313 in your browser

## Deployment

The site automatically deploys to AWS S3 when changes are pushed to the `main` branch via GitHub Actions.

### Manual Deployment

If you need to deploy manually (requires AWS credentials):

```bash
hugo deploy --target=production
```

## Content Structure

```
content/
├── _index.md                 # Homepage
├── user-guide/               # End user documentation
│   ├── _index.md
│   └── getting-started.md
├── developer-docs/           # Developer documentation
│   ├── _index.md
│   └── installation.md
├── api-reference/           # API documentation
│   └── _index.md
└── tutorials/               # Tutorials
    └── _index.md
```

## Adding Content

Create new content using Hugo's `new` command:

```bash
# User guide page
hugo new user-guide/new-feature.md

# Developer documentation
hugo new developer-docs/integration-guide.md

# Tutorial
hugo new tutorials/how-to-integrate.md
```

## Configuration

Site configuration is in `hugo.yaml`:
- Base URL: https://wiki.bigledger.com
- Theme: Geekdoc
- AWS Region: ap-southeast-5

## GitHub Actions

The `.github/workflows/deploy.yml` workflow handles automatic deployment:
1. Builds the Hugo site
2. Deploys to S3 bucket
3. Verifies deployment

Required secrets (already configured):
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`

## Contributing

1. Create a feature branch
2. Make your changes
3. Test locally with `hugo server`
4. Submit a pull request

## License

Copyright BigLedger. All rights reserved.