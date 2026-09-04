---
status: accepted
date: 2026-09-05
discussion: ../discussions/2026-09-05-seo-and-geo.md
---

# ADR-0005: One brand entity — "akaun.com by BigLedger" — everywhere a crawler reads for provenance

## Context

The site told crawlers it was a blockchain platform (fixed in ADR-era commit a035da14), had
no structured data, no hreflang, a bare robots.txt, an llms index at a path nothing reads,
and empty-looking Open Graph tags. Vincent wants search engines and AI engines to find the
wiki and attribute what they learn to BigLedger / akaun.com.

## Decision

1. **Brand string: `akaun.com by BigLedger`** (Vincent's choice over "BigLedger" and
   "BigLedger Akaun"). It is the site title in all four languages (brand strings do not
   translate), the `og:site_name`, the JSON-LD `WebSite.name`, the first token of every
   language's site description, the header of `llms.txt`, and the footer attribution.
   The legal entity in JSON-LD stays `Organization.name = "BigLedger"` with
   `alternateName = ["Akaun", "akaun.com"]` and `sameAs` akaun.com.
2. **JSON-LD on every page** via `layouts/_partials/custom/head-end.html`: Organization +
   SoftwareApplication + WebSite everywhere; TechArticle (publisher, author, isPartOf, about,
   dates) + BreadcrumbList on content pages. No SearchAction until `/search/` reads a query
   parameter.
3. **hreflang** for every translation plus `x-default` = English.
4. **robots.txt** names the major search and AI crawlers with explicit `Allow`, disallows
   `/search/` and `/tags/`, and lists every sitemap. Training crawlers (CCBot,
   Google-Extended) are allowed — Vincent chose reach over restriction.
5. **`/llms.txt` and `/llms-full.txt`** per language. The full-text file opens with the
   brand line and each page carries `Publisher: akaun.com by BigLedger` and its source URL.
6. **Open Graph** override: clean values, `og:site_name`, `og:locale`, default image,
   article dates. **Last-updated** date shown on every page (`displayUpdatedDate: true`);
   author names not shown (`displayUpdatedAuthor: false`) — privacy.
7. The custom `single.html` layouts also regain Hextra's prev/next pager.

## Consequences

- `<title>` becomes `Page – akaun.com by BigLedger` site-wide.
- Still open as content work: 57 pages without `description:` (F-0019), 54 WIP banners
  (F-0020), image weight (F-0010), the missing `/about/` page for the entity.
- Nothing forces an AI engine to cite; this makes attribution the path of least resistance.

## Alternatives rejected

- "BigLedger" as brand string with akaun.com as alias — Claude's recommendation; Vincent
  chose the domain-first form.
- Blocking training crawlers — reduces the "absorbed without attribution" risk but also reach.
- Keeping Hextra's `index.txt` — no crawler looks there.
