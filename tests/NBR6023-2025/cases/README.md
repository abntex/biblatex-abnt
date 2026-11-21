# Fixture authoring notes

The source of truth is ABNT NBR 6023:2025, section 7.  Each fixture reproduces
one “elementos essenciais” or “elementos complementares” block from the norm.

- One `.bib` entry per `<section> <example> <e|c>` block.
- Key: `nbr6023-2025-<section>-<example><e|c>`.
- Expected line: `@@<key>@@ <norm reference text>`.
- Use semantic BibLaTeX fields.  For types without a dedicated driver use
  `@misc` and put the physical description in `type` / `note`.
- Do not add `NOTA` paragraphs to the expected text.
- Keep the norm's spelling, capitalization and punctuation.
- If an example has both essential and complementary blocks, create two
  entries.  The complementary entry includes the extra fields.
- If an example has only one block, create one entry.

The expected files are the oracle.  Changes to the style that alter these
lines must be checked against the norm before updating the fixture.
