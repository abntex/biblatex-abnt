# biblatex-abnt
[![Build Status](https://travis-ci.org/abntex/biblatex-abnt.svg?branch=master)](https://travis-ci.org/abntex/biblatex-abnt)
[![NBR 6023:2025](https://img.shields.io/badge/NBR%206023%3A2025-adequa%C3%A7%C3%A3o%20inicial-yellow.svg)](doc/NBR6023-2025.md)
[![NBR 6023:2018 100%](https://img.shields.io/badge/NBR%206023%3A2018-100%25-brightgreen.svg)](https://github.com/abntex/biblatex-abnt/blob/master/tests/NBR6023-2018_reference.pdf)
[![NBR 6023:2002 100%](https://img.shields.io/badge/NBR%206023%3A2002-100%25-brightgreen.svg)](https://github.com/abntex/biblatex-abnt/blob/master/tests/NBR6023-2002_reference.pdf)
[![NBR 10520:2002 100%](https://img.shields.io/badge/NBR%2010520%3A2002-100%25-brightgreen.svg)](https://github.com/abntex/biblatex-abnt/blob/master/tests/NBR10520-2002_reference.pdf)


BibLaTeX style for Brazil's ABNT (Brazilian Association of Technical Standards)
rules.

Version 3.4

---

Estilo para BibLaTeX compatível com as normas da ABNT.

O desenvolvimento atual adota como referência a **ABNT NBR 6023:2025**,
terceira edição da norma de elaboração de referências. As alterações em
relação à edição de 2018 possuem casos de regressão próprios.

Versão 3.4

---

Permission is granted to copy, distribute and/or modify this software
under the terms of the LaTeX Project Public License, version 1.3c
(http://www.latex-project.org/lppl.txt).

The current maintainer is Daniel Ballester Marques
([@dbmrq](https://github.com/dbmrq)).

## Instalação

O biblatex-abnt está incluso no TeX Live a partir de 2016.

Para instalá-lo manualmente, copie os arquivos `.bbx`, `.cbx` e `.lbx` para

    <TEXMFLOCAL>/tex/latex/biblatex-contrib/biblatex-abnt/

e atualize o banco de dados do TeX (rodando o `texhash`, por exemplo).

**O biblatex-abnt requer as últimas versões do Biber e do BibLaTeX.
Se você estiver com algum problema, verifique se esses pacotes estão
atualizados.**

## Uso

1. Adicione as seguintes linhas ao preâmbulo do seu arquivo `.tex`:

  ```tex
  \usepackage[style=abnt]{biblatex}
  \addbibresource{arquivo.bib}        % Seus arquivos de
  \addbibresource{outroarquivo.bib}   % bibliografia vão aqui
  ```

2. Use os comandos de citação (e.g. `\cite[10]{entrada2018}`) para citar
suas entradas.

3. Use o comando `\printbibliography` para imprimir a bibliografia.

*Consulte [o arquivo biblatex-abnt.pdf](https://github.com/abntex/biblatex-abnt/raw/master/doc/biblatex-abnt.pdf) e o [manual do biblatex](http://mirrors.ctan.org/macros/latex/contrib/biblatex/doc/biblatex.pdf) para informações sobre as opções e comandos disponíveis.*

## Base normativa

A referência normativa principal do estilo é:

> ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. **ABNT NBR 6023:2025:
> Informação e documentação — Referências — Elaboração**. 3. ed.
> Rio de Janeiro: ABNT, 2025. 68 p.

Consulte [a nota de implementação da NBR 6023:2025](doc/NBR6023-2025.md)
para conhecer o escopo, os campos BibLaTeX adotados e os testes relacionados.
A norma pode ser adquirida ou consultada pelos meios autorizados no
[Catálogo da ABNT](https://www.abntcatalogo.com.br/).

O texto integral da norma não é distribuído neste repositório.

## Testes normativos

- NBR 6023:2002: exemplos normativos e
  [PDF de saída validada](tests/NBR6023-2002_reference.pdf).
- NBR 6023:2018: exemplos normativos e
  [PDF de saída validada](tests/NBR6023-2018_reference.pdf).
- NBR 6023:2025: regressões das alterações da terceira edição em
  [`tests/NBR6023-2025-regressions.tex`](tests/NBR6023-2025-regressions.tex)
  e
  [`tests/NBR6023-2025-regressions.bib`](tests/NBR6023-2025-regressions.bib).

