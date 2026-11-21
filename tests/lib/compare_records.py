#!/usr/bin/env python3
"""Compare keyed text records extracted from a PDF with expected records.

Both the actual and expected files use lines of the form:

    @@key@@ text

Text may span multiple lines in the actual extraction; a new record starts at
the next @@key@@ marker.
"""
from __future__ import annotations

import argparse
import re
import sys
import unicodedata
from pathlib import Path

MARKERS = ("[[b]]", "[[/b]]", "[[i]]", "[[/i]]")
SENTINEL = re.compile(r"@@([^@\n]+)@@")


def normalize(text: str) -> str:
    text = unicodedata.normalize("NFC", text)
    for marker in MARKERS:
        text = text.replace(marker, "")
    text = text.replace("\u00a0", " ")
    text = text.replace("\u2013", "-").replace("\u2014", "-")
    text = text.replace("http ://", "http://").replace("http: //", "http://")
    text = text.replace("http:// ", "http://")
    # URLs in the norm PDF are often broken across lines.  Join them back
    # before comparing with the generated output.
    text = re.sub(
        r"(https?://.*?)(?=\s+Acesso em:)",
        lambda match: match.group(1).replace(" ", ""),
        text,
    )
    # T1/lmodern glyphs extracted by pdftotext from the test PDF.  These are
    # one-to-one encoding artifacts, not differences in the rendered output.
    text = text.replace("ř", "°").replace("ł", "ª").replace("ž", "º")
    text = text.replace("¡", "½")
    text = re.sub(r"\[\.\s*\.\s*\.\]", "[...]", text)
    text = re.sub(r"\[\s*\.\.\.\s*\]", "[...]", text)
    text = re.sub(r"\s+([.,;:!?])", r"\1", text)
    text = re.sub(r"\s+", " ", text)
    return text.strip()


def parse_records(text: str) -> dict[str, str]:
    matches = list(SENTINEL.finditer(text))
    records: dict[str, str] = {}
    for index, match in enumerate(matches):
        key = match.group(1)
        start = match.end()
        end = matches[index + 1].start() if index + 1 < len(matches) else len(text)
        # Footnotes are printed at the bottom of the page; stop the record at
        # the page break so following body text is not appended to it.
        segment = text[start:end].split("\f", 1)[0]
        value = normalize(segment)
        if key.startswith("ibid-"):
            # The footnote number of the next note is printed just before its
            # @@key@@ marker.
            value = re.sub(r"\s+\d+$", "", value)
        records[key] = value
    return records


def parse_expected(paths: list[Path]) -> dict[str, str]:
    expected: dict[str, str] = {}
    for path in paths:
        for line in path.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            match = SENTINEL.match(line)
            if not match:
                raise SystemExit(f"{path}: expected line without @@key@@: {line[:80]}")
            key = match.group(1)
            value = normalize(line[match.end():])
            if key in expected and expected[key] != value:
                raise SystemExit(f"{path}: duplicate key with different text: {key}")
            expected[key] = value
    return expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("actual", type=Path, help="text extracted from the generated PDF")
    parser.add_argument("expected", nargs="+", type=Path, help="expected .txt files")
    parser.add_argument("--quiet", action="store_true")
    args = parser.parse_args()

    actual = parse_records(args.actual.read_text(encoding="utf-8"))
    expected = parse_expected(args.expected)

    missing = sorted(set(expected) - set(actual))
    extra = sorted(set(actual) - set(expected))
    wrong = sorted(k for k in set(actual) & set(expected) if actual[k] != expected[k])

    if not missing and not extra and not wrong:
        if not args.quiet:
            print(f"OK: {len(expected)} records match")
        return 0

    print(f"FAILED: {len(wrong)} wrong, {len(missing)} missing, {len(extra)} unexpected")
    for key in missing:
        print(f"\nMISSING {key}\n  expected: {expected[key]}")
    for key in extra:
        print(f"\nUNEXPECTED {key}\n  actual:   {actual[key]}")
    for key in wrong:
        print(f"\nWRONG {key}")
        print(f"  expected: {expected[key]}")
        print(f"  actual:   {actual[key]}")
    return 1


if __name__ == "__main__":
    sys.exit(main())
