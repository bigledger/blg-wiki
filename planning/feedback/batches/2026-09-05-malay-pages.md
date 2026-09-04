---
status: done
date: 2026-09-05
items: F-0001, F-0002, F-0003, F-0037
decision: ../../decisions/0003-translation-policy.md
loop: unit 2
---

# Batch: Indonesian text in Malay pages

## Analysis
The content lint (unit 1) confirmed four `content/ms` pages carried Indonesian vocabulary. Three were
genuine Malay with a few slips; one (`customer-consignment-applet.md`, 3,300 words) was an Indonesian
translation end to end (*inventaris* ×88, *Anda* ×47, *pengaturan* ×26, "Siklus Hidup", "Manajer").
Re-translating an applet-reference page is the lowest priority under ADR-0003, and publishing
Indonesian to Malaysian readers is worse than falling back to English.

## Changes
- `content/ms/applets/customer-consignment-applet.md` → `planning/archive/content-ms-applets-customer-consignment-applet.md`
  (git mv; header note). The language switcher now falls back to the English page.
- `driver-delivery-order-applet.md`: "Dalam Pengiriman" → "Dalam Penghantaran"; "menu kelola" → "menu urusan";
  "mengelola dasar polisi" → "mengurus dasar polisi".
- `internal-sales-order-applet.md`: "keterlihatan fitur" → "keterlihatan ciri" ×3.
- `tests/lint-allowlist.tsv`: all `malay` exemptions removed — the lint is now fully enforced for Bahasa Melayu.

## Not done
- A proper Bahasa Melayu translation of the consignment page — queue under ADR-0003 after the manuals.
