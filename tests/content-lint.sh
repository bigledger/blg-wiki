#!/usr/bin/env bash
# Content lints that must never reach production. Exit 1 on any hit.
# Used by tests/run-all.sh (local) and .github/workflows/deploy.yml (quality job).
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."
fail=0
say() { printf '%s\n' "$*"; }
allow() { awk -F'\t' -v k="$1" '$1==k {print $2}' tests/lint-allowlist.tsv; }   # files exempt from lint <key>

check() {  # check <label> <grep args...>
  local label="$1"; shift
  local hits; hits=$(grep -rn "$@" 2>/dev/null | head -20)
  if [ -n "$hits" ]; then say "FAIL: $label"; say "$hits" | sed 's/^/  /'; fail=1; else say "ok:   $label"; fi
}

check "no unresolved Git conflict markers"      -E '^(<<<<<<< |=======$|>>>>>>> )' content --include='*.md'
check "no leaked AI tool-call transcripts"       -E '<function_calls>|<invoke name=|antml:' content --include='*.md'
check "product is not described as blockchain"  -iE 'blockchain|区块链|بلوك تشين' content hugo.yaml layouts --include='*.md' --include='*.yaml' --include='*.html'
malay_hits=$(grep -rlwiE 'bisa|fitur|bisnis|inventaris|mengelola|pengiriman|melacak|kantor|uang|unduh|silakan|karena|pengaturan' content/ms --include='*.md' 2>/dev/null | grep -vxF -f <(allow malay) | head -20)
if [ -n "$malay_hits" ]; then say "FAIL: Malay pages contain Indonesian-only words (not in allowlist)"; say "$malay_hits" | sed 's/^/  /'; fail=1; else say "ok:   Malay pages contain no Indonesian-only words (allowlisted: $(allow malay | wc -l))"; fi
check "no customer-specific repo slugs in content"  -E 'blg-sd-[a-z0-9-]+|BigLedger-Support/' content kb/topics kb/research --include='*.md'
# the legacy core1 API surface must not appear in published pages (drafts are excluded)
legacy=$(grep -rlE '/api/v1/|\bcore1\b' content --include='*.md' 2>/dev/null | while read -r f; do
  grep -q '^draft: true' "$f" || echo "$f"; done | head -20)
if [ -n "$legacy" ]; then say "FAIL: legacy core1 / /api/v1 surface in published pages"; say "$legacy" | sed 's/^/  /'; fail=1; else say "ok:   no legacy core1 surface in published pages"; fi

check "no named prospect or customer organisations"  -E 'Universiti Teknologi|\bUTM\b|Inter-PTJ' content --include='*.md'

# --- fabricated REST API surfaces (2026-09-06 sweep) -------------------------------------------
# Class of error: pages that document an API BigLedger does not have. Three mechanical signatures,
# each checked only in published pages (draft: true is excluded, as for the core1 check above).
# Ground truth: every one of the backend's ~12,000 unique request mappings is under /core2/
# (javasdk/.../constants/Core2Config.java:19-90), and the only host that serves it is akaun.com.
published() { while read -r f; do grep -q '^draft: true' "$f" || echo "$f"; done; }

# 1. an endpoint shape that cannot exist: a verb followed by /api/... or /v<n>/...
shape=$(grep -rlE '(^|[^A-Za-z`])(GET|POST|PUT|DELETE|PATCH) +/(api|v[0-9])/' content --include='*.md' 2>/dev/null | published | head -20)
if [ -n "$shape" ]; then say "FAIL: endpoint shape that cannot exist (verb + /api/ or /v<n>/); the API is served under /core2/"; say "$shape" | sed 's/^/  /'; fail=1; else say "ok:   no impossible endpoint shapes in published pages"; fi

# 2. API hostnames under bigledger.com that have never resolved. The API host is api.akaun.com.
badhost=$(grep -rlE '\b(api|sandbox-api|api-sandbox|auth|developers|app)\.bigledger\.com' content --include='*.md' 2>/dev/null | published | head -20)
if [ -n "$badhost" ]; then say "FAIL: non-existent API hostname (api/sandbox-api/api-sandbox/auth/developers/app .bigledger.com); the API host is api.akaun.com"; say "$badhost" | sed 's/^/  /'; fail=1; else say "ok:   no non-existent API hostnames in published pages"; fi

# 3. auth headers and key formats the platform has never accepted. Real headers: Authorization,
#    tenantCode / tenant-code, appId, accessId, accessKey, X-BigLedger-Instance-Code
#    (akaun-api/.../config/CorsInterceptor.java:40). There is no request signing.
badauth=$(grep -rlniE 'X-Company-Id|blg_live_sk_|blg_test_sk_|X-BigLedger-Signature' content --include='*.md' 2>/dev/null | published | head -20)
if [ -n "$badauth" ]; then say "FAIL: invented auth header or API-key format in published pages"; say "$badauth" | sed 's/^/  /'; fail=1; else say "ok:   no invented auth headers in published pages"; fi

# 4. a real signed token pasted into a sample. Checked in every page, drafts included - a credential
#    in the repo is exposed whether Hugo builds the page or not.
check "no signed JWT in content" -rEo 'eyJ[A-Za-z0-9_-]{10,}\.eyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{20,}' content --include='*.md'
# ------------------------------------------------------------------------------------------------
# --- translated twins of unpublished English pages (2026-09-06 translation-orphan sweep) --------
# Class of error: an English page is unpublished under ADR-0008 and its zh/ms/ar translation stays
# live because it sits at a DIFFERENT path, so a same-path twin check never sees it.
# content/zh/applets/webhook-applet.md kept publishing retries, OAuth, request signing, "200+ event
# types" and 99.9% delivery for hours after content/en/applets/integrations/webhook-applet.md went
# to draft, because the English lives under applets/integrations/ and the Chinese under applets/.
# Rule: a published translated page must not share a basename with English pages that are ALL draft.
# A basename that also matches at least one published English page is fine - e.g. zh/modules/inventory.md
# pairs with the live content/en/modules/inventory.md even though developers/api-reference/inventory.md
# is draft. _index.md is skipped: the basename carries no identity.
en_all=$(find content/en -name '*.md' ! -name '_index.md' | sed 's|.*/||' | sort -u)
en_live=$(find content/en -name '*.md' ! -name '_index.md' -print0 | xargs -0 -r grep -L '^draft: true' -- | sed 's|.*/||' | sort -u)
en_draft_only=$(comm -23 <(printf '%s\n' "$en_all") <(printf '%s\n' "$en_live"))
twins=""
if [ -n "$en_draft_only" ]; then
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    grep -q '^draft: true' "$f" && continue
    b=${f##*/}
    printf '%s\n' "$en_draft_only" | grep -qxF "$b" && twins="$twins$f"$'\n'
  done < <(find content/zh content/ms content/ar -name '*.md' ! -name '_index.md' 2>/dev/null | sort)
fi
twins=$(printf '%s' "$twins" | grep -v '^$' | head -20)
if [ -n "$twins" ]; then say "FAIL: published translation of an English page that is unpublished (draft: true) - unpublish the twin too, or repair the pairing"; say "$twins" | sed 's/^/  /'; fail=1; else say "ok:   no published translation of an unpublished English page"; fi
# ------------------------------------------------------------------------------------------------
check "no blockchain-era vocabulary"              -iE 'smart contract|wallet api|crypto wallet' content --include='*.md'
check "no mojibake (UTF-8 read as cp1252)"      -E 'â€|Ã©|Ã¢' content --include='*.md'

# every markdown page has a title in front matter
missing=$(find content -name '*.md' | while read -r f; do sed -n '2,15p' "$f" | grep -q '^title:' || echo "$f"; done | grep -vxF -f <(allow title) | head -20)
if [ -n "$missing" ]; then say "FAIL: pages without title: front matter"; say "$missing" | sed 's/^/  /'; fail=1; else say "ok:   every page has a title (allowlisted: $(allow title | wc -l))"; fi

# duplicate H1 that repeats the title (CLAUDE.md navigation rule)
dups=$(find content/en -name '*.md' | while read -r f; do t=$(grep -m1 '^title:' "$f" | sed 's/^title: *//; s/^"//; s/"$//'); h=$(grep -m1 '^# ' "$f" | sed 's/^# *//'); [ -n "$t" ] && [ "$t" = "$h" ] && echo "$f"; done | head -20)
if [ -n "$dups" ]; then say "FAIL: H1 duplicates front-matter title"; say "$dups" | sed 's/^/  /'; fail=1; else say "ok:   no duplicate titles"; fi

exit $fail
