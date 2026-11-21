# Release checklist

1. Run the full test suite:

   ```sh
   tests/run-tests.sh
   ```

2. Update the version in `README.md`, `CHANGELOG.md`, `doc/biblatex-abnt.tex`
   and the `\ProvidesFile` headers under `latex/`.

3. Rebuild the manual and copy the PDF to `doc/biblatex-abnt.pdf`:

   ```sh
   cd doc
   latexmk -pdf -pdflatex=pdflatex biblatex-abnt.tex
   cp build/biblatex-abnt.pdf biblatex-abnt.pdf
   ```

4. Commit, merge `dev` into `master`, and tag:

   ```sh
   git switch dev
   git merge --no-ff <release-branch>
   git switch master
   git merge --no-ff dev
   git tag -a vX.Y -m "biblatex-abnt X.Y"
   git push origin dev master vX.Y
   ```

5. Build the CTAN archive and create the GitHub release:

   ```sh
   tools/make-ctan.sh X.Y
   gh release create vX.Y biblatex-abnt-X.Y.zip \
     --title "biblatex-abnt X.Y" \
     --notes-file <(sed -n '/^## \[X.Y\]/,/^## \[/p' CHANGELOG.md | sed '$d')
   ```

6. Upload `biblatex-abnt-X.Y.zip` at <https://www.ctan.org/upload> using the
   maintainer account, then close the CTAN tracking issue.
