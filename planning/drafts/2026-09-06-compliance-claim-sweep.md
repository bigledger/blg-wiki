---
title: "Compliance-claim sweep — 2026-09-06"
unit: compliance-claim correction unit
authority: ADR-0008 (verify or unpublish), corrections in place — nothing unpublished
---

# Compliance-claim sweep

## Why

`developers/architecture/` publicly claimed **SOC 2 Type II, ISO 27001 and GDPR compliance** that
nobody has evidenced. It was unpublished, and **Q-0006** asks Vincent whether BigLedger holds any
of the three. Q-0006 is still open. A later audit found the same class on five more pages
(**P-0121**). A grep across `content/` found 21 live pages carrying certification, compliance,
SLA or cryptography claims; working through them turned up **6 more** the brief's list did not
name (`modules/crm.md` + its three translations, `modules/manufacturing/_index.md`,
`modules/e-invoice/_index.md`, `support/beginner-guide/getting-started.md`,
`membership/core-concepts/membership-tiers.md` ×2, and seven Chinese applet/user-guide pages).

**27 files corrected in place. Nothing unpublished — every one of these pages is otherwise usable
prose, and a certification bullet list is a line-level error, not a page-level one.**

## Classification used

| # | Class | Rule applied |
|---|---|---|
| 1 | BigLedger holds a certification ("SOC 2 Type II certified infrastructure") | **Removed.** Unverifiable by us; commercial and legal exposure |
| 2 | The cloud provider holds it ("ISO 27001 certified data centres") | **Removed**, because every instance sat inside a list of *BigLedger's* own properties, so a reader takes it as ours. We also cannot cite which provider hosts the product. Routed to Vincent as Q-0136 |
| 3 | A capability that helps the customer meet an obligation ("supports PDPA data-subject export") | **Kept where the subject is the reader**, corrected where the subject was ambiguous. PDPA is the Malaysian regime and stays; GDPR is scoped to "if you also serve EU customers" or removed |
| 4 | A quantitative service claim ("99.9% uptime SLA", "AES-256") | **Removed.** No contract clause was produced for any SLA. `akaun.com` negotiates **TLS 1.3 / TLS_AES_128_GCM_SHA256** (`openssl s_client`, 2026-09-06), so "bank-level encryption (AES-256)" and "256-bit SSL encryption" were also simply *wrong*, not merely unevidenced |

## Evidence for what was KEPT

| Kept claim | Where | Citation |
|---|---|---|
| BigLedger is an **accredited Peppol Access Point** on the Malaysian network | `e-invoice-peppol.md`, `zh/e-invoice-peppol.md`, `support/faqs.md` | `kb/topics/mypeppol-admin-applet.md:28` — "monthly TSR reporting is done by BigLedger **as AP**"; `kb/topics/e-invoice-peppol.md:49` — BigLedger files the OpenPeppol **TSR and EUSR** "as a service provider", tracked as recurring issues [src:gh:bigledger/blg-intranet#5693, #5444, #5256, #4995] |
| MDEC verifies participant name + registration number before a Peppol ID publishes | `e-invoice-peppol.md` | `kb/topics/e-invoice-peppol.md:39` — automated MDEC KYC cross-verifies against the company registry through MDEC middleware [src:gh:bigledger/blg-intranet#1373] |
| Peppol documents are exchanged over **AS4** | `modules/e-invoice/_index.md` | `kb/topics/e-invoice-peppol.md:49` — "transport protocol (AS4 v2.0)" |
| Traffic is **encrypted with TLS** | `platform-overview.md`, `faqs.md`, `technical-concerns.md`, `document-item-maintenance.md`, `dashboard.md`, `order.md` | `openssl s_client -connect akaun.com:443` → `New, TLSv1.3, Cipher is TLS_AES_128_GCM_SHA256`, `Verify return code: 0 (ok)` (2026-09-06). Deliberately stated without a key size |
| PDPA **data-access response within 21 days**; breach notification **within 72 hours** | membership `data-management.md`, `security-compliance.md` (×2 dirs) | Personal Data Protection Act 2010 s.12 (21 days); PDP (Data Breach Notification) obligations under Act A1732. These are the **reader's** statutory duties, not a BigLedger claim |
| SST / MyInvois support | `faqs.md`, `order.md` | Documented across `content/en/guides/einvoice-guides/` and the e-invoice applet pages; not a certification |

## Per-page claim table

Class in brackets. "→" is the action.

### 1. `content/en/e-invoice-peppol.md`
| Claim | Class | Action |
|---|---|---|
| `- ISO 27001 Certified` | 1 | → removed |
| `- LHDN Approved Solution` | 1 | → removed. No such designation is evidenced anywhere in `kb/`; Q-0136 asks whether it exists |
| `- PDPA Compliant` | 1 | → removed. PDPA compliance is the customer's status, not ours to assert |
| `- MDEC PEPPOL Accreditation` | — | → **kept**, rewritten into a sourced paragraph (see evidence table) |
| `- 99.9% uptime SLA` | 4 | → removed |
| `- SLA guarantee` (Enterprise package) | 4 | → removed |
| `- 100% LHDN compliance` | 1 | → removed. An absolute conformance claim about someone else's filings |
| `- 99.99% submission success rate` | 4 | → removed |
| `- 7-year retention compliance` | 3 | → removed. LHDN's 7-year rule is real; that BigLedger's archive is configured to it is not evidenced |
| `## Compliance & Certifications` heading | 1 | → retitled `## Accreditation`, with an explicit "no information-security certification is claimed on this page" |

### 2. `content/zh/e-invoice-peppol.md`
Same six claims in Chinese (`ISO 27001认证`, `LHDN批准解决方案`, `PDPA合规`, `99.9%正常运行时间SLA`,
`SLA保证`, `100%LHDN合规`, `99.99%提交成功率`, `7年保留合规`) → same actions, section retitled `## 认证资格`.

### 3. `content/en/modules/it-ce/_index.md`
| `- **GDPR compliance** for customer data protection` · `- **SOC 2 Type II** controls` · `- **ISO 27001** information security standards` · `- **ITIL compliance**` · `- **Industry-specific** compliance` | 1 | → whole `### Compliance Support` block removed. The `### IT Security Features` block above it already lists the real capabilities (RBAC, audit logging, backup) and survives untouched |

### 4. `content/en/modules/service-industry/_index.md`
| `- **ISO 9001**` · `- **ISO 20000**` · `- **ITIL**` · `- **PMI Standards**` · `- **Industry-Specific**: (SOX, HIPAA, etc.)` | 1 | → `### Service Quality Standards` block removed; `## Compliance and Quality Management` → `## Quality Management` |
| `- **Compliance reporting** and certification management` | 3 | → removed; no such feature is evidenced |

### 5. `content/en/modules/digital-crm/_index.md`
| `- **GDPR Compliance**: Complete data privacy and protection compliance` | 1 | → removed |
| `- **CCPA Compliance**: California Consumer Privacy Act adherence` | 1 | → removed |
| `- **Data Encryption**: End-to-end encryption for customer data` | 4 | → removed |
| `- **Right to be Forgotten**: GDPR compliance for data deletion requests` | 3 | → removed (unsourced capability) |
| — | — | → added the standing PDPA note: the Malaysian regime is PDPA, these features help you meet **your** obligations, they are not a certification |

### 6. `content/en/modules/financial-accounting.md`
| `- GDPR/CCPA compliance` (under Data Protection) | 1 | → removed |
| `### Compliance Features` — SOX / GDPR / PCI DSS / HIPAA / ISO 27001 | 1 | → block removed |
| `## Regulatory Compliance` heading | — | → retitled `## Accounting Standards` (only `### Supported Standards` remains) |
| `### Supported Standards` — US GAAP / IFRS / UK GAAP / IND AS / PRC GAAP | 3 | → **kept**. Accounting frameworks a chart can be built to, not certifications. Flagged to the audit backlog: IND AS and PRC GAAP look aspirational |

### 7. `content/en/modules/erp/_index.md`
| `- **High availability** with 99.9% uptime` | 4 | → removed |
| `- **SOX compliance** with automated controls` · `- **GDPR/CCPA** data privacy protection` · `- **Industry standards** (ISO 27001, PCI DSS)` | 1 | → removed; `### Regulatory Compliance` → `### Audit Evidence`, keeping the one real bullet (`Audit trails with complete transaction history`) |

### 8/9. `modules/membership/best-practices/security-compliance.md` — **and its byte-identical twin under `modules-v2/`**
| `Full database encryption (AES-256)` · `Keys stored in hardware security module` · `Key rotation: Quarterly` | 4 | → reframed as **what to require of your platform and partners**, with the specific unverifiable assertions dropped |
| `Payment information: Encrypted (PCI-DSS)` | 3 | → replaced with better advice: *do not store card data — hold a token from your acquirer* |
| `### Regulatory Compliance` (PDPA / PCI-DSS blocks) | 3 | → **kept**. Both are correctly framed as the reader's obligations ("If storing payment information linked to membership…"). Added one sentence making the subject explicit: these fall on **you**, BigLedger does not certify you against them and holds no certification that transfers to you |
| `TLS 1.2 or higher`, `Certificate pinning for mobile apps` | 3 | → kept inside the requirements checklist, which is now explicitly a checklist |

### 10/11. `modules/membership/best-practices/data-management.md` — **and its `modules-v2/` twin**
| `### PDPA Compliance (Malaysia)` | 3 | → retitled `### Your PDPA Obligations (Malaysia)`; lead rewritten so the duty sits on the reader, not on BigLedger |
| `### GDPR Compliance (For EU Operations)` | 3 | → retitled `### If You Also Serve EU Customers: GDPR`, with "most Malaysian membership programmes never touch this" |
| Data-subject rights, 21-day response, consent record-keeping | 3 | → **kept** — statutory, correct, and the reader's job |

### 12. `content/en/modules/sales-crm/_index.md`
| `- **GDPR Compliance** - European data protection regulation compliance` | 1 | → removed, replaced by the standing PDPA note |

### 13. `content/en/modules/accounting/_index.md`
| `- SOX compliance features` | 1 | → removed |
| `- Industry-specific compliance support` | 1 | → removed |
| `- Multi-standard accounting compliance (GAAP, IFRS, etc.)` | 3 | → kept (accounting frameworks) |

### 14. `content/en/user-guide/basic-operations/document-item-maintenance.md`
| `- **Healthcare**: HIPAA and medical record compliance` · `- **Manufacturing**: ISO standards` · `- **Financial Services**` · `- **Government Contracting**: Federal and state` | 1 | → removed |
| `- **GDPR Compliance**` · `- **SOX Compliance**` | 1 | → removed. `#### Regulatory Compliance Features` → `#### Regulatory and Tax Requirements`, keeping GST/SST and local retention, plus an explicit "PDPA not GDPR; no HIPAA/SOX/GDPR/ISO certification is claimed" |
| `- **Encryption**: AES-256 encryption for all document storage and transmission` | 4 | → replaced with "documents move between your browser and BigLedger over TLS" (evidenced) |
| `- **Right to Deletion**: Compliance with data deletion requirements` | 3 | → removed |
| `**Legal Compliance**: eIDAS / E-SIGN Act / Local Regulations / Industry Standards` | 1 | → block removed |
| The rest of the digital-signature section (Qualified/Biometric signatures, timestamp services, certificate issuance) | — | → **not touched.** Reads as invented but is outside this unit's class → audit backlog |

### 15. `content/en/user-guide/reports-analytics/_index.md`
| `- **GDPR Compliance**` · `- **SOX Compliance**` · `- **Industry Standards**` · `- **Right to be Forgotten**` | 1 | → removed |
| `- **Data Retention** - Automated archiving and deletion` | 3 | → **kept**, reworded to "policies you configure"; section retitled `**Retention**` with the PDPA note |
| Chinese twin `content/zh/user-guide/reports-analytics/_index.md:600-601` (`GDPR合规`, `SOX合规`) | 1 | → removed, same as the English |

### 16. `content/en/user-guide/getting-started/platform-overview.md`
| "Over 5,000 Malaysian SMEs trust BigLedger" | 4 | → removed. Same family as **Q-0072**; `app_tenant_hdr` holds 83 active tenants |
| `Handles millions of transactions with 99.9% uptime` | 4 | → SLA half removed |
| `- **Custom SLAs**: Guaranteed performance` (Private Cloud tier) | 4 | → removed |
| `bank-level encryption (AES-256), ISO 27001 certified data centers, and complies with PDPA … backed up hourly with 99.9% uptime SLA` | 1+2+4 | → the whole FAQ answer rewritten: TLS, RBAC, and "we do not publish a security certification on this wiki — ask your BigLedger contact" |
| Published pricing (RM299/mo, RM2,999/mo) | — | → not touched; already recorded against Q-0111 |

### 17. `content/en/support/faqs.md`
| "Is BigLedger compliant with Malaysian regulations? **Yes, BigLedger is fully compliant with:**" | 1 | → question retitled *"Does BigLedger support Malaysian tax and e-invoicing requirements?"*, answer reframed as support, closing with "supporting a requirement is not the same as certifying you against it" |
| `- 256-bit SSL encryption` | 4 | → removed — **contradicted by measurement** (TLS 1.3 / AES-128-GCM) |
| `- ISO 27001 compliant data centers` | 2 | → removed |
| `- Daily automated backups` | 3 | → removed (unsourced) |
| `- Role-based access control` · `- Two-factor authentication` | 3 | → **kept** |

### 18. `content/en/support/beginner-guide/technical-concerns.md`
| `- **ISO 27001**: International security standard certification` | 1 | → removed |
| `- **SOC 2**: Audited security controls` | 1 | → removed |
| `- **GDPR compliant**` · `- **PDPA compliant**` | 1 | → removed; block replaced with *"What we can and cannot tell you about certification"* — we publish none, ask your contact, do not cite this page as evidence |
| `- **Bank-level encryption**: Same security as online banking` | 4 | → rewritten to the true version: TLS, the same protocol a bank's website uses |
| `- **Encrypted storage**: Data scrambled even if someone accessed servers` · `- **Key management**` | 4 | → removed (at-rest encryption not evidenced) |
| `- **Secure protocols**: All connections use bank-grade encryption` | 4 | → "encrypted in transit" |
| `**99.9% uptime guarantee**` · `Maximum downtime: Less than 9 hours per year` · `Actual uptime: Typically exceeds 99.95%` | 4 | → removed; answer rewritten to say plainly that **we do not publish an uptime SLA on this wiki** and that an availability guarantee is a commercial term |
| `Multiple data centers` / `Geographic distribution: different cities/countries` / `Real-time replication` | — | → **not touched**; unevidenced infrastructure claims but outside this unit's class → audit backlog |

### 19. `content/en/business-operations/dashboard.md`
| `- SOC 2 Type II certified infrastructure` | 1 | → removed |
| `- GDPR and data privacy compliance` | 1 | → removed |
| `- Uptime SLA: 99.99%` | 4 | → removed |
| `- End-to-end encryption for sensitive data` | 4 | → "TLS encryption in transit" |
| `Concurrent users supported: 10,000+`, `Dashboard load time: < 2 seconds` | — | → not touched → audit backlog |

### 20. `content/en/business-operations/order.md`
| `- PCI DSS compliance for payment data` | 1 | → removed |
| `- GDPR compliance for customer data` | 1 | → removed |
| `- SSL encryption for data transmission` | 4 | → "TLS encryption for data in transit" |
| `- SIRIM certification for certain products` · `- Halal certification tracking` | 3 | → removed; no such item-attribute feature is evidenced |
| `- MDEC MSC status compliance` | 1 | → removed. A claim about BigLedger's own MSC status |
| `### Regional Compliance` | — | → `### Malaysian Requirements`, keeping SST and MyInvois |

### 21. `content/en/business-operations/sales-dashboard.md`
| `### Compliance Features` — GDPR / PCI DSS / Malaysian PDPA / Industry standards | 1 | → block removed. `### Data Security` (RBAC, masking, audit trails, IP restrictions) survives |

## Found while sweeping — not on the brief's list of 21, same class, corrected

| Page | Claim | Class | Action |
|---|---|---|---|
| `content/en/modules/crm.md:85` + `zh`, `ms`, `ar` twins | `- **Compliance**: GDPR, CAN-SPAM support` | 1 | → "Consent tracking: record what each contact opted in to, and when", translated into all three |
| `content/en/modules/manufacturing/_index.md:236` | `- **ISO 9001** - Quality management systems` | 1 | → "Quality management — inspection plans, non-conformance records and corrective actions you can show an auditor" |
| `content/en/modules/e-invoice/_index.md:219` | `- **End-to-end encryption** for all transmissions` | 4 | → "Encrypted in transit — traffic runs over TLS, and Peppol documents are exchanged over AS4" |
| `content/en/support/beginner-guide/getting-started.md:269` | `- **99.9% uptime**: System available 24/7/365` | 4 | → removed |
| `modules/membership/core-concepts/membership-tiers.md:501` (+ `modules-v2/` twin) | `- SLA guarantees` (Enterprise plan) | 4 | → removed. The invented plan/pricing table around it → audit backlog |
| `content/zh/applets/unified-contact-center-ucc-applet.md:621` | 答：银行级加密，ISO 27001认证，GDPR合规 | 1+4 | → rewritten to the TLS/RBAC + "ask your contact" answer. English twin (`applets/crm/…`) has none — this was a translation orphan |
| `content/zh/applets/unified-contact-center-ucc-applet.md:213` | `- **法规合规**：PDPA、GDPR合规工具` | 1 | → consent/opt-out wording, PDPA named as the reader's regime |
| `content/zh/applets/t2t-admin-applet.md:78` | `- **安全标准**：SOC 2、ISO 27001 合规性就绪` | 1 | → removed. Already flagged in `planning/reviews/2026-09-06-translation-orphan-sweep.md:133` |
| `content/zh/applets/customer-maintenance-applet.md:142,292` | `隐私合规 - GDPR…` | 1 | → PDPA-framed consent wording |
| `content/zh/applets/employee-maintenance-applet.md:92,291` | `安全合规：GDPR、CCPA和当地隐私法合规` | 1 | → privacy-controls wording |
| `content/zh/applets/supplier-maintenance-applet.md:570` | `隐私法规合规（GDPR、CCPA）` | 1 | → access/retention wording |
| `content/zh/applets/supplier-maintenance-applet.md:282` (`- ISO 9001:2015`) | 3 | → **kept.** It is the *supplier's* certificate inside a sample supplier record. The lint is written not to fire on it |
| `content/zh/user-guide/industry-solutions/_index.md:164,175` (ISO 9001 recertification) | 3 | → **kept.** A customer's own certification in a case study. The case study itself → audit backlog |

## Pages already unpublished — verified, no action

`content/en/developers/architecture/overview.md` (AES-256-GCM / AES-256-CBC) and
`content/en/guides/advanced/integration-best-practices.md` (PCI DSS narrative, AES-256) both
carry `draft: true` already. The lint skips drafts, as the core1 and endpoint checks do.

## The lint

Three new checks in `tests/content-lint.sh`, after the translation-orphan block:

1. **`no unverified certification claims in published pages`** — matches an *assertive shape*, not
   the bare scheme name: a bullet whose **bolded** label is the scheme (`- **SOC 2 Type II** …`,
   `- **GDPR Compliance**: …`), a heading naming it, or the scheme sitting adjacent to
   *certified / certification / compliant / compliance / conformant / accredited / 认证 / 合规*.
   Schemes: ISO 27001/9001/20000/22301, SOC 1-3, PCI DSS, HIPAA, SOX, Sarbanes-Oxley, GDPR, CCPA,
   eIDAS, E-SIGN Act, FedRAMP, CSA STAR. A line that **denies** the claim passes ("does not hold",
   "do not publish", "ask your BigLedger contact", "if you also serve", 不发布 / 不声明 / 不要引用).
   **PDPA is deliberately not in the list** — it is the Malaysian regime, and pages legitimately
   explain what it asks of the reader.
2. **`no uptime SLA claims in published pages`** — `NN.N% uptime|availability`, `uptime SLA`,
   `SLA guarantee`, `正常运行时间SLA`.
3. **`no unverifiable cryptography claims in published pages`** — `AES-256`, `256-bit SSL/TLS`,
   `bank-level encryption`, `bank-grade encryption`, `military-grade`, `end-to-end encryption`.
   "bank-level **security**" is left alone: it is a loose analogy, not a cryptography claim.

All three skip `draft: true` pages via the existing `published()` helper and honour a
`certification` key in `tests/lint-allowlist.tsv`.

**Exception mechanism.** If a certification is later confirmed, add the page under the
`certification` key with the evidence in the comment — issuer, certificate number, expiry (or, for
an SLA, the contract clause). The exemption is deliberately file-level, so the next author has to
justify the whole page rather than one line. The key is **empty today** and the allowlist header
says it should stay empty until Q-0006 is answered.

**Regression-tested**: a probe page containing all ten removed shapes (English and Chinese) makes
all three checks fail; the suite is green with it removed.

## Why nothing was unpublished

Every page here is a tier-3 overview or a working user page with a tier-1 *block* inside it. ADR-0008's
"a page that mixes tiers goes" is about a reader who cannot tell real endpoints from fabricated ones.
A compliance bullet list is separable: excise the block and the surrounding page is unchanged and
still true. Where excision left a stranded heading, the heading was retitled rather than left dangling.

## Audit backlog — noticed, deliberately out of scope

- `e-invoice-peppol.md` case studies ("Retail Chain — 500 Outlets", "RM 2 million annual cost
  savings", "50,000 daily invoices") and its pricing tiers.
- `document-item-maintenance.md` digital-signature section — qualified/biometric signatures,
  timestamp services, certificate issuance. Reads as invented end to end.
- `technical-concerns.md` infrastructure claims — multiple data centres in different
  cities/countries, real-time replication, automatic failover.
- `dashboard.md` / `sales-dashboard.md` technical specifications — 10,000+ concurrent users,
  <2s load, <100ms refresh, sub-second query response.
- `membership-tiers.md` plan/pricing table (Starter/Professional/Enterprise with RM figures).
- `financial-accounting.md` "Supported Standards" — IND AS and PRC GAAP.
- `zh/user-guide/industry-solutions/_index.md` ISO 9001 case study.
- `platform-overview.md` "40% reduction in manual data entry with built-in AI".

## Routed

- **Q-0006** — appended: measured blast radius (27 files, 4 languages), what was corrected, and the
  fact that the answer now unblocks 27 pages plus the lint allowlist, not one page.
- **Q-0136** — new: three sub-questions the sweep could not settle (LHDN "Approved Solution",
  naming the hosting provider, any contractual uptime SLA).
- **P-0121** — appended: the class is wider than five pages and has now been corrected in place;
  nothing left for a programmer.
- **F-0462 … F-0467** — inbox, recorded as done in this pass.
