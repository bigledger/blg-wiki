---
status: done
date: 2026-09-05
items: F-0008 (site-level layer), F-0017 (not this batch)
decision: ../../decisions/0005-seo-geo-brand-entity.md
commit: (see git log — "Add the SEO/GEO layer")
---

# Batch: SEO / GEO layer

## Changes (layout + config only; no per-page edits)

- `layouts/_partials/custom/head-end.html` — hreflang + x-default; JSON-LD graph.
- `layouts/_partials/opengraph.html` — override: unpadded values, site_name, locale, image, dates.
- `layouts/robots.txt` — 18 named user-agents, Allow /, Disallow /search/ /tags/, 5 Sitemap lines.
- `layouts/llmsfull.txt` — `/llms-full.txt` per language (Hugo keys the template on the
  output-format name, so `llms-full.txt` as a filename silently does nothing).
- `hugo.yaml` — site + language titles → "akaun.com by BigLedger"; descriptions lead with it;
  `llms` baseName index→llms; new `llmsfull` format; `displayUpdatedDate: true`,
  `displayUpdatedAuthor: false`; `params.title`.
- `layouts/_default/single.html`, `layouts/applets/single.html` — last-updated + pager.
- `layouts/partials/custom/footer.html` — attribution line linking akaun.com and bigledger.com.

## Verified (production build)

JSON-LD parses on home (Organization, SoftwareApplication, WebSite) and on pages (+ TechArticle,
BreadcrumbList); hreflang + x-default present; og:* populated; robots.txt has 18 agents and
5 sitemaps; `/llms.txt` header carries the brand + positioning; last-updated renders; title
= "Page – akaun.com by BigLedger". Live checks in the ship log.

## Not done

- Content-side: F-0019 missing descriptions, F-0020 WIP banners, F-0010 image weight.
- An `/about/` page for the entity (citable "what is akaun.com by BigLedger").
- SearchAction (needs `/search/?q=` support).
