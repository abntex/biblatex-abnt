#!/usr/bin/env bash
# Build the archive uploaded to CTAN.  Usage: tools/make-ctan.sh [version]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="${1:-$(sed -n 's/^Version \([0-9.]*\)$/\1/p' "$ROOT/README.md" | head -1)}"
NAME="biblatex-abnt"
OUT="$ROOT/$NAME-$VERSION.zip"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT

mkdir -p "$STAGE/$NAME"
cp "$ROOT/README.md" "$ROOT/CHANGELOG.md" "$STAGE/$NAME/"
cp -R "$ROOT/latex" "$ROOT/doc" "$ROOT/bibtex" "$STAGE/$NAME/"
mkdir -p "$STAGE/$NAME/tests"
cp -R "$ROOT/tests/README.md" "$ROOT/tests/run-tests.sh" "$ROOT/tests/lib" "$STAGE/$NAME/tests/"
cp -R "$ROOT/tests/NBR6023-2025" "$ROOT/tests/NBR10520-2023" \
      "$ROOT/tests/abnt-ibid" "$ROOT/tests/abnt-numeric" "$ROOT/tests/issues" \
      "$STAGE/$NAME/tests/"
find "$STAGE" -type d -name build -prune -exec rm -rf {} +
find "$STAGE" -type d -name __pycache__ -prune -exec rm -rf {} +
find "$STAGE" -name '*.bak' -delete
find "$STAGE" -name '*_bibertool.bib' -delete

( cd "$STAGE" && zip -qr "$OUT" "$NAME" )
echo "wrote $OUT"
