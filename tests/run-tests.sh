#!/usr/bin/env bash
# Run the biblatex-abnt conformance tests against the style files in this
# working tree (not against an installed copy).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TESTS="$ROOT/tests"

# TinyTeX is the development default on macOS; keep normal TeX installations
# first if they are already on PATH.
if ! command -v pdflatex >/dev/null 2>&1 && [ -x "$HOME/Library/TinyTeX/bin/universal-darwin/pdflatex" ]; then
  export PATH="$HOME/Library/TinyTeX/bin/universal-darwin:$PATH"
fi

for tool in pdflatex biber latexmk pdftotext python3; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "error: $tool not found" >&2
    exit 1
  fi
done

export TEXINPUTS="$ROOT/latex/bbx//:$ROOT/latex/cbx//:$ROOT/latex/lbx//:${TEXINPUTS:-}"
export BIBINPUTS="$TESTS//:${BIBINPUTS:-}"

run_text_test() {
  local dir="$1"
  local name
  name="$(basename "$dir")"
  local build="$dir/build"
  local doc="$dir/$name.tex"

  echo "== $name =="
  rm -rf "$build"
  mkdir -p "$build"

  ( cd "$dir" && latexmk -pdf -pdflatex=pdflatex \
      -interaction=nonstopmode -halt-on-error -file-line-error \
      -outdir="$build" "$name.tex" >"$build/latexmk.out" 2>&1 ) || {
        echo "error: compilation failed for $name" >&2
        tail -80 "$build/latexmk.out" >&2 || true
        exit 1
      }

  pdftotext -layout "$build/$name.pdf" "$build/$name.txt"

  local expected=()
  if [ -f "$dir/expected.txt" ]; then
    expected+=("$dir/expected.txt")
  fi
  if compgen -G "$dir/cases/*.expected" >/dev/null; then
    expected+=("$dir"/cases/*.expected)
  fi
  if [ "${#expected[@]}" -eq 0 ]; then
    echo "error: no expected files in $dir" >&2
    exit 1
  fi
  python3 "$TESTS/lib/compare_records.py" "$build/$name.txt" "${expected[@]}"
}

run_text_test "$TESTS/NBR6023-2025"
run_text_test "$TESTS/NBR10520-2023"
run_text_test "$TESTS/abnt-ibid"
run_text_test "$TESTS/abnt-numeric"
run_text_test "$TESTS/issues"

echo "All tests passed."
