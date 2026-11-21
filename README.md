# biblatex-abnt

[![CI](https://github.com/abntex/biblatex-abnt/actions/workflows/ci.yml/badge.svg)](https://github.com/abntex/biblatex-abnt/actions/workflows/ci.yml)
[![CTAN](https://img.shields.io/badge/CTAN-biblatex--abnt-blue.svg)](https://ctan.org/pkg/biblatex-abnt)
[![NBR 6023:2025](https://img.shields.io/badge/NBR%206023%3A2025-testado-brightgreen.svg)](tests/NBR6023-2025)
[![NBR 10520:2023](https://img.shields.io/badge/NBR%2010520%3A2023-testado-brightgreen.svg)](tests/NBR10520-2023)

BibLaTeX style for Brazil's ABNT (Brazilian Association of Technical Standards)
rules.

Version 5.0

---

Estilo para BibLaTeX compatível com as normas da ABNT.

Versão 5.0

---

Permission is granted to copy, distribute and/or modify this software
under the terms of the LaTeX Project Public License, version 1.3c
(http://www.latex-project.org/lppl.txt).

The current maintainer is Daniel Ballester Marques
([@dbmrq](https://github.com/dbmrq)).

## Instalação

O biblatex-abnt está incluso no TeX Live. A versão 5.0 exige
`biblatex` 3.22 ou mais recente e `biber` 2.22 ou mais recente.

Para instalá-lo manualmente, copie os arquivos `.bbx`, `.cbx` e `.lbx` para

    <TEXMFLOCAL>/tex/latex/biblatex-contrib/biblatex-abnt/

e atualize o banco de dados do TeX (rodando o `texhash`, por exemplo).

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

*Consulte [o arquivo biblatex-abnt.pdf](doc/biblatex-abnt.pdf) e o
[manual do biblatex](http://mirrors.ctan.org/macros/latex/contrib/biblatex/doc/biblatex.pdf)
para informações sobre as opções e comandos disponíveis.*

## Base normativa

As referências normativas principais do estilo são:

> ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. **ABNT NBR 6023:2025:
> Informação e documentação — Referências — Elaboração**. 3. ed.
> Rio de Janeiro: ABNT, 2025. 68 p.

> ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. **ABNT NBR 10520:2023:
> Informação e documentação — Citações em documentos — Apresentação**.
> 2. ed. Rio de Janeiro: ABNT, 2023. 19 p.

Consulte [a nota de implementação da NBR 6023:2025](doc/NBR6023-2025.md)
para conhecer o escopo, os campos BibLaTeX adotados e os testes relacionados.
As normas podem ser adquiridas ou consultadas pelos meios autorizados no
[Catálogo da ABNT](https://www.abntcatalogo.com.br/). O texto integral não é
distribuído neste repositório.

## Testes

O projeto usa testes de saída textual, não comparação de pixels. Cada exemplo
normativo é compilado pelo estilo e comparado, entrada por entrada, com o texto
da norma:

```sh
tests/run-tests.sh
```

A suíte cobre:

- todos os modelos da seção 7 da NBR 6023:2025 (165 registros);
- os principais exemplos autor-data da NBR 10520:2023;
- os estilos `abnt-ibid` e `abnt-numeric`;
- regressões de problemas relatados (por exemplo, `\textapud`, editores em
  `@inbook`, `relatedtype=reviewof` e datas desconhecidas).

Consulte [`tests/README.md`](tests/README.md) para detalhes.

## Overleaf

O Overleaf usa uma versão congelada do TeX Live. Se a versão disponível ainda
for anterior à 5.0, faça o upload dos arquivos `.bbx`, `.cbx` e `.lbx` para uma
pasta do projeto e acrescente ao `latexmkrc`:

```perl
$ENV{'TEXINPUTS'}='./abnt//:' . $ENV{'TEXINPUTS'};
```

## Licença

LPPL 1.3c ou posterior. Veja `README.md` e os cabeçalhos dos arquivos de
estilo.
