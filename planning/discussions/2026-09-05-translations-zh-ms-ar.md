---
status: decided
started: 2026-09-05
participants: Vincent, Claude
decision: ../decisions/0003-translation-policy.md
related:
  - 2026-09-05-content-folder-restructure.md
---

# Chinese, Malay and Arabic trees — what exists, and what the restructure does to them

Vincent asked how the folder restructure affects zh/ms. Standing instruction from him:
**Malay means Bahasa Melayu (Malaysia), never Bahasa Indonesia.** Do not confuse them.

## Config is correct

`hugo.yaml`: `ms` → languageName "Bahasa Melayu", languageCode `ms`. (Indonesian would be
`id`.) `zh` → `zh-CN` Simplified, which is what Malaysian Chinese readers use. `ar` is RTL.

## Coverage (surveyed 2026-09-05)

| Section | en | zh | ms | ar |
|---|---|---|---|---|
| applets | 188 | 62 | 12 | 0 |
| modules | 92 | 5 | 5 | 5 |
| modules-v2 | 118 | 0 | 0 | 0 |
| user-guide | 70 | 19 (all `_index.md` hubs) | 6 (demo hubs only) | 0 |
| guides | 47 | 4 (2 e-invoice guides + hubs) | 0 | 0 |
| everything else | ~100 | 1 each, stubs | 0 | 0 |
| **total** | **620** | **103** | **25** | **7** |

Translation is concentrated on **applet reference docs** — the least valuable content to
translate, because operators use the English UI and the fields are English anyway. The
**user manuals** — the Xero-voice guides an accounts clerk actually reads — are almost
untranslated: zh has two, ms has none.

## Hugo links translations by path — so the restructure must move every language

Hugo pairs `en/X.md` with `zh/X.md` and `ms/X.md` by identical relative path. Move the
English file and the twin becomes an orphan: it still builds, but the language switcher
no longer finds it and it falls out of the section tree.

**This has already happened once.** `zh/applets/` holds **30 orphans** — flat paths like
`zh/applets/cashbook-applet.md` — because the English applets were reorganised into
sub-domains (`en/applets/finance/cashbook-applet.md`) and zh was never moved. Those 30
pages have had a broken language switcher ever since.

Consequences for the restructure spec:
1. Every `git mv` in the spec carries a zh/ms/ar row. The twins are small (zh: 4 guides +
   19 user-guide hubs + 5 root pages; ms: 6 hubs + 2 root pages), so this is cheap.
2. `aliases:` are per-language — moved zh/ms pages need their own.
3. Fix the 30 pre-existing zh/applets orphans in the same spec (same mechanism).
4. Add a **translation-parity test** to `tests/`: every file under zh/ ms/ ar/ must have an
   en counterpart at the same path. One shell loop; fails the build on orphans.

## Malay quality: three files contain Indonesian

Grep for Indonesian-only vocabulary (words that do not exist, or mean something else, in
Bahasa Melayu):

| File | Indonesian found | Malay |
|---|---|---|
| `ms/applets/customer-consignment-applet.md` | inventaris ×3, bisnis ×2, melacak, bisa, fitur, mengelola | inventori, perniagaan, menjejak, boleh, ciri, mengurus |
| `ms/applets/driver-delivery-order-applet.md` | pengiriman, mengelola | penghantaran, mengurus |
| `ms/applets/internal-sales-order-applet.md` | fitur | ciri |

The rest of `ms/` reads as proper Malay (penjadualan, pemasangan, hadkan, mengikut,
bersepadu, borang, muat turun). The likely cause: LLM or MT output drifting to Indonesian
because there is far more Indonesian training data. It will recur without a guard.

Fix: correct the three files (batch, see feedback inbox) and add the Indonesian-word list to
the test suite as a lint on `content/ms/`.

## Decisions for Vincent

1. **Translation policy** — which sections deserve zh/ms? Proposed: user manuals first
   (`user-guide/processes/`, `setup/`, `getting-started/`), applet reference last or never.
   Today it is the reverse. → ADR.
2. **Arabic** — 7 files, 5 module stubs, no activity. Keep, or disable the language until
   there is a reader?
3. Confirm the parity test + Indonesian-word lint go into `tests/run-all.sh`.

## Next steps

- [ ] Vincent decides 1–3
- [ ] Add the zh/ms/ar rows to `specs/content-folder-restructure.md` when it is written
- [ ] Batch-fix the three Indonesian-contaminated ms files
- [ ] `tests/translation-parity.sh` + `tests/malay-lint.sh`, wired into `run-all.sh`
