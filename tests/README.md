
# biblatex-abnt/tests

- The files `NBR10520-2002.tex`, `NBR6023-2002.tex`, and
  `NBR6023-2018.tex` use the biblatex-abnt style to print every entry
  mentioned in the respective ABNT standards.

- The files `NBR10520-2002_reference.pdf`, `NBR6023-2002_reference.pdf`, and
  `NBR6023-2018_reference.pdf` are the latest compilations of the files above
  that were manually checked against ABNT's rules and confirmed to be
  accurate. They contain generated test output, not copies of the standards.

- The files `NBR10520-2002_test.tex`, `NBR6023-2002_test.tex`, and
  `NBR6023-2018_test.tex` compare the reference files with a current
  compilation (which has to be generated from the original tex files), making
  it easy to check if the style has strayed from the rules.

- The `test.sh` script automates that last step.
  It sets `TEXINPUTS` explicitly so the tests use the style files from the
  working tree instead of a globally installed version.

- The files `NBR6023-2025-regressions.tex` and
  `NBR6023-2025-regressions.bib` contain focused regression cases for changes
  introduced by NBR 6023:2025. They currently cover an event with no city and
  the electronic article identifier (`eid`, or e-location), judgment dates,
  online documents without publication details, periodical supplements,
  interviewees as authors, optional ISSN, and DOI/ORCID identifiers.

---

- Os arquivos `NBR10520-2002.tex`, `NBR6023-2002.tex` e
  `NBR6023-2018.tex` usam o biblatex-abnt para imprimir todas as entradas
  citadas nas respectivas normas.

- Os arquivos `NBR10520-2002_reference.pdf`, `NBR6023-2002_reference.pdf` e
  `NBR6023-2018_reference.pdf` são as compilações mais recentes dos arquivos
  acima que foram manualmente comparadas às normas da ABNT com um resultado
  favorável. Eles contêm saídas de teste geradas, não cópias das normas.

- Os arquivos `NBR10520-2002_test.tex`, `NBR6023-2002_test.tex` e
  `NBR6023-2018_test.tex` comparam os arquivos de referência com uma
  compilação atual (que deve ser gerada a partir dos arquivos tex originais),
  permitindo visualizar facilmente os pontos em que o estilo distanciou-se
  da norma.

- O script `test.sh` automatiza esse último passo.
  Ele define `TEXINPUTS` explicitamente para que os testes usem os arquivos
  de estilo da árvore de trabalho, em vez de uma versão instalada globalmente.

- Os arquivos `NBR6023-2025-regressions.tex` e
  `NBR6023-2025-regressions.bib` contêm casos de regressão focados nas
  alterações introduzidas pela NBR 6023:2025. No momento, eles cobrem um
  evento sem cidade e o identificador eletrônico de artigo (`eid`, ou
  e-location), datas de julgamento, documentos online sem dados de publicação
  e suplementos de periódicos, entrevistados como autores, ISSN opcional e
  identificadores DOI/ORCID.

