#!/usr/bin/env bash
# Quarantine screenshots a lane flagged under "Screenshots with personal data" in its findings.md.
#   kb/tools/quarantine-images.sh <lane N>
# Parses every backticked image path in those sections, skips files still referenced by any content
# page (the lane judged those safe or the reference must be removed first), and git-mv's the rest to
# the gitignored planning/private/quarantined-images/ (reversible; git records a deletion).
set -uo pipefail
N="${1:?lane}"; cd "$(dirname "${BASH_SOURCE[0]}")/../.."
F="planning/lanes/lane-$N/findings.md"
awk '/[Ss]creenshots with personal data/{p=1;next} p&&/^##/{p=0} p' "$F" \
 | grep -oE '(`[^`]+\.(png|jpe?g|gif)`|[A-Za-z0-9_./-]+\.(png|jpe?g|gif))' | tr -d '`' | sed -E 's#^/?static/##; s#^/?images/##' | sort -u > /tmp/q-$N.txt
# bare filenames (no dir) → resolve by find
n=0; kept=0
while read -r rel; do
  [ -z "$rel" ] && continue
  if [[ "$rel" == */* ]]; then src="static/images/$rel"; else src=$(find static/images -name "$rel" | head -1); fi
  [ -n "$src" ] && [ -f "$src" ] || continue
  base=$(basename "$src"); dir=$(basename "$(dirname "$src")")
  if grep -rqF "$dir/$base" content; then echo "  still referenced, kept: $dir/$base"; kept=$((kept+1)); continue; fi
  mkdir -p "planning/private/quarantined-images/$dir"; git mv "$src" "planning/private/quarantined-images/$dir/$base" && n=$((n+1))
done < /tmp/q-$N.txt
echo "lane $N: quarantined $n, kept-referenced $kept, total quarantined now $(find planning/private/quarantined-images -type f | wc -l)"
