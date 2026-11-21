# Fixture authoring notes

The source of truth is the 2025 norm text extracted at
`/private/var/folders/hn/7135_0tj583gz9_kwzyr5dsr0000gn/T/opencode/norms/6023-2025-ufsm.txt`.
The pre-split example lists are `/tmp/norm_<range>.txt`.

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
