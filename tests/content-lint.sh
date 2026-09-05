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
check "no mojibake (UTF-8 read as cp1252)"      -E 'â€|Ã©|Ã¢' content --include='*.md'

# every markdown page has a title in front matter
missing=$(find content -name '*.md' | while read -r f; do sed -n '2,15p' "$f" | grep -q '^title:' || echo "$f"; done | grep -vxF -f <(allow title) | head -20)
if [ -n "$missing" ]; then say "FAIL: pages without title: front matter"; say "$missing" | sed 's/^/  /'; fail=1; else say "ok:   every page has a title (allowlisted: $(allow title | wc -l))"; fi

# duplicate H1 that repeats the title (CLAUDE.md navigation rule)
dups=$(find content/en -name '*.md' | while read -r f; do t=$(grep -m1 '^title:' "$f" | sed 's/^title: *//; s/^"//; s/"$//'); h=$(grep -m1 '^# ' "$f" | sed 's/^# *//'); [ -n "$t" ] && [ "$t" = "$h" ] && echo "$f"; done | head -20)
if [ -n "$dups" ]; then say "FAIL: H1 duplicates front-matter title"; say "$dups" | sed 's/^/  /'; fail=1; else say "ok:   no duplicate titles"; fi

exit $fail
