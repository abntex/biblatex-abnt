# language: pt
Funcionalidade: Citar nome do autor com primeiras letras maiúsculas 

Essa funcionalidade foi implementada para prover a funcionalide de `\citeauthoronline` de biblatex-abnt, conforme solicitado em [#38](https://github.com/abntex/biblatex-abnt/issues/38).

Cenário: Executando cite
  Dado um arquivo chamado "texto.tex" contendo:
"""
\documentclass{article}
\usepackage{nopageno} %% não imprime o número da página
\usepackage[style=abnt]{biblatex}
\addbibresource{arquivo.bib}
\begin{document}

\textcite*{obra}

\end{document}
"""
  Dado um arquivo chamado "arquivo.bib" contendo:
"""
@book{obra,
    keywords        = {7.1},
    author          = {L. G. F. F Gomes},
    title           = {Novela e sociedade no Brasil},
    location        = {Niterói},
    publisher       = {EdUFF},
    date            = {1998},
    pagetotal       = {137},
    dimensions      = {21~cm},
    series          = {Coleção Antropologia e Ciência Política},
    number          = {15},
    note            = {Bibliografia: p. 131-132},
    isbn            = {85-228-0268-8},
}
"""
  Quando eu executo `pdflatex -interaction=batchmode texto`
  Quando eu executo `pdflatex -interaction=batchmode texto`
  Quando eu executo `biber texto`
  Quando eu executo `pdflatex -interaction=batchmode texto`
  Quando eu executo `pdftotext texto.pdf`
  Então o arquivo "texto.txt" deve conter:
"""
Gomes, 1998

"""
