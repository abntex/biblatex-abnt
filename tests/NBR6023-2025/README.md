# NBR 6023:2025 bibliography tests

This directory contains a golden-output test for the bibliography models in
ABNT NBR 6023:2025.  Each entry is compiled through `biblatex-abnt` and its
rendered text is compared with the corresponding example from the norm.

## Fixture format

Fixtures are split into section ranges under `cases/`:

- `nbr6023-2025-7.1-7.4.bib` / `nbr6023-2025-7.1-7.4.expected`
- `nbr6023-2025-7.5-7.10.bib` / `nbr6023-2025-7.5-7.10.expected`
- `nbr6023-2025-7.11-7.14.bib` / `nbr6023-2025-7.11-7.14.expected`
- `nbr6023-2025-7.15-7.20.bib` / `nbr6023-2025-7.15-7.20.expected`

Each `.bib` entry uses a key of the form

    nbr6023-2025-<section>-<example><e|c>

where `e` is an "elementos essenciais" example and `c` is an "elementos
complementares" example.

Each line of the `.expected` file has the form

    @@nbr6023-2025-7.1.1-1e@@ LUCK, Heloisa. Liderança em gestão escolar. 4. ed. Petrópolis: Vozes, 2010.

The text after the marker must reproduce the norm example exactly (apart from
whitespace normalisation).  The comparison is case-sensitive.  Do not include
the "— Elementos essenciais" labels or `NOTA` paragraphs.

Formatting is checked separately by `tests/formatting/`; the golden files here
compare text only.

## Running

From the repository root:

    tests/run-tests.sh

The script compiles `NBR6023-2025.tex` with the style files from this working
tree, extracts the text with `pdftotext`, and compares it with all
`cases/*.expected` files.
