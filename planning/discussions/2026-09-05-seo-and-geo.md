---
status: decided
started: 2026-09-05
participants: Vincent, Claude
trigger: feedback F-0008
decision: ../decisions/0005-seo-geo-brand-entity.md
related:
  - ../decisions/0001-content-folder-restructure.md
---

# SEO and GEO — make the wiki findable by search engines and attributable by AI engines

Vincent (2026-09-05): search-engine friendly, and "GEO" (generative engine optimisation —
easily picked up by AI crawlers), with **BigLedger** and **akaun.com** attached to the
knowledge so that AI answers cite them rather than absorbing the content anonymously.

## Honest framing

We cannot force an AI engine to cite a source. What we can do is make attribution the
path of least resistance: put the brand in every place a crawler or a model reads for
provenance — page title, description, canonical URL, structured data (`publisher`,
`author`, `isPartOf`), an `llms.txt`, and the visible text itself. Models cite sources they
can name; a page whose title is "Bank Reconciliation Guide" is anonymous, one titled
"Bank Reconciliation Guide | BigLedger Akaun" is not.

## Levers (to audit, then spec)

| Lever | What | Status to check |
|---|---|---|
| Titles | `<title>` = page title + " · BigLedger Akaun Docs" via the theme's title template | Hextra default? |
| Meta description | every page has `description:` front matter; brand name appears where natural | many pages lack it? |
| Canonical + hreflang | one canonical per page; `hreflang` for zh/ms/ar | Hugo emits both if configured |
| Sitemap + robots | `sitemap.xml` present; `robots.txt` allows GPTBot, ClaudeBot, PerplexityBot, Google-Extended explicitly | `enableRobotsTXT: true` — check the file |
| `llms.txt` / `llms-full.txt` | the emerging convention AI crawlers read first: what this site is, who publishes it, index of key pages | `hugo.yaml` already defines an `llms` output format — is it wired to a template? |
| JSON-LD | `Organization` (BigLedger, url akaun.com + bigledger.com), `TechArticle` per page with `publisher`, `author`, `isPartOf: WebSite`, `about: SoftwareApplication "BigLedger Akaun"` | none today? |
| Open Graph / Twitter card | `og:site_name` = BigLedger Akaun; `og:image` default | Hextra partial exists |
| Visible attribution | short footer line on every page: "Part of the BigLedger Akaun documentation — akaun.com" | custom footer partial exists |
| Brand in prose | guides already say "BigLedger posts the journal" (CLAUDE.md voice) — keep the product name in running text, not "the system" | style check |
| URL quality | the ADR-0001 restructure removes `-v2` and duplicate paths; aliases keep old links alive | in progress |
| Performance | Core Web Vitals: Hextra is light; check image sizes under `static/images/` | audit |

## Current state — audited 2026-09-05 (built site, Hextra v0.12.1)

| Signal | Today | Verdict |
|---|---|---|
| `<title>` | `Page Title – BigLedger Documentation` | OK; brand present. Consider `– BigLedger Akaun Docs` once the brand string is decided |
| meta description | 90% of pages have `description:`; 57 do not | fill the 57 |
| **site description** | **"Next-Generation Blockchain Platform"** in all 4 languages (`hugo.yaml`) | **wrong product category** — F-0009 |
| canonical | present, correct | OK |
| hreflang | not observed in `<head>` | add (Hugo can emit from `.AllTranslations`) |
| `og:title`, `og:url` | present | OK |
| `og:description`, `og:type`, `og:site_name`, `og:image` | **empty / absent** | fix in a `layouts/partials/` override |
| twitter card | present with description | OK |
| JSON-LD | **none anywhere** | add Organization + WebSite/SearchAction + TechArticle + BreadcrumbList |
| robots.txt | `User-agent: *` and nothing else | add `Sitemap:` line and explicit AI-crawler allow rules |
| sitemap | index → per-language sitemaps | OK |
| llms.txt | Hextra generates one at `/index.txt` (90 KB, all pages with descriptions) | rename/copy to `/llms.txt`; fix the blockchain summary; add `llms-full.txt` |
| last-updated on page | `enableGitInfo: true` but nothing rendered | switch on Hextra's `page.lastUpdated` or equivalent |
| WIP banners | **54 pages** in production | credibility problem; policy needed |
| images | 1,766 files, **863 MB**; one page loads 226 MB of GIFs | F-0010; needs an image budget + GIF→MP4 rule |
| alt text | 0 empty-alt images in markdown | OK |

## Positioning (Vincent, 2026-09-05) — settles the "what is it" half of the brand question

"BigLedger is more like a web-based modern serverless / cloud native business operating
system, the kind of backbone that a business would need, if they want to integrate and
utilize with ai-agents, through various api, mcp, sdk and other mechanism."

Applied 2026-09-05 to `hugo.yaml` `params.description` in all four languages (replacing
"Next-Generation Blockchain Platform") and to CLAUDE.md. This is also the `Organization` /
`SoftwareApplication` description for JSON-LD when that lands. Still open: the exact brand
string for titles (decision 1 below).

## Decisions for Vincent

1. Brand string: "BigLedger", "Akaun", "BigLedger Akaun", or "akaun.com by BigLedger"? One
   canonical form for titles, JSON-LD and footer.
2. Which AI crawlers to explicitly allow in robots.txt (default: all major ones).
3. Whether the `llms.txt` should include full page text (`llms-full.txt`) — bigger, but
   what AI engines actually ingest.

## Next steps

- [ ] Audit current state of each lever (head of a built page, robots.txt, sitemap, llms output)
- [ ] Vincent decides 1–3
- [ ] Spec, then implement as layout/config changes — mostly `layouts/partials/` + `hugo.yaml`, not per-page edits
