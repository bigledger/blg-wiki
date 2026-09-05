# Google Drive — how to access (VERIFIED 2026-09-05; pointers only)

**Working path: same service account + delegation as email, scope `drive.readonly`, subject
`vincent@aimatrix.com`** — 84 shared drives visible. Use `corpora="allDrives"`,
`includeItemsFromAllDrives=True`, `supportsAllDrives=True`. Docs/Sheets: `files().export_media(
fileId, mimeType="text/plain" | "text/csv")` before hashing. Reference implementation:
`/home/robot/repos/blg-robot-support/scripts/data/gdrive-find.py` (and `gsheet.py`).

The robot keeps a **curated Drive catalog** (`blg-robot-support/knowledge/drive-index/catalog.jsonl`,
13 entries: roster/spec/ucc/access) keyed by file id — reuse the idea: `kb/sources/gdrive/catalog.jsonl`
records only files judged relevant to the wiki, with `relevance` + `last_verified`, so we grep instead
of re-scanning Drive.

Observed 2026-09-05 (names only): weekly "Auto E-Invoice Consolidation" project notes (Aug–Sep 2026),
an e-invoice automation doc, e-invoice proposals/BRDs for named customers (customer-specific → facts
only, never names). Fallback: the claude.ai Drive connector once authenticated with `/mcp`.

Ledger id: `gdrive:<fileId>`; cursor per query = last `modifiedTime`. Exports → `kb/private/` only.
