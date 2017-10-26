
# biblatex-abnt/tests

- The files `NBR10520-2002.tex` and `NBR6023-2002.tex` use the biblatex-abnt
  style to print every entry mentioned on the respective ABNT rules.

- The files `NBR10520-2002_reference.pdf` and `NBR6023-2002_reference.pdf` are
  the latest compilation of the files above that was manually checked against
  ABNT's rules and confirmed to be accurate.

- The files `NBR10520-2002_test.tex` and `NBR6023-2002_test.tex` compare the
  reference files with a current compilation (which has to be generated from
  the original tex files), making it easy to check if the style has strayed
  from the rules.

- The `test.sh` script automates that last step.

---

- Os arquivos `NBR10520-2002.tex` e `NBR6023-2002.tex` usam o biblatex-abnt
  para imprimir todas as entradas citadas nas respectivas normas.

- Os arquivos `NBR10520-2002_reference.pdf` e `NBR6023-2002_reference.pdf` são
  a última compilação dos arquivos acima que foi manualmente comparada à norma
  da ABNT com um resultado favorável.

- Os arquivos `NBR10520-2002_test.tex` e `NBR6023-2002_test.tex` comparam os
  arquivos de referência com uma compilação atual (que deve ser gerada
  a partir dos arquivos tex originais), permitindo visualizar facilmente os
  pontos em que o estilo distanciou-se da norma.

- O script `test.sh` automatiza esse último passo.

