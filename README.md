# biblatex-abnt

Version 3.0.1

Permission is granted to copy, distribute and/or modify this software
under the terms of the LaTeX Project Public License, version 1.3c
(http://www.latex-project.org/lppl.txt).

The current maintainer is
Daniel B. Marques ([@dbmrq](https://github.com/dbmrq)).

----------

Estilo para `biblatex` compatível com as normas da ABNT.

Substitui o pacote [`abntex2cite`](https://github.com/abntex/abntex2).

**Requer `biblatex v3.6` e `biber v2.6`.**

O arquivo `biblatex-abnt.pdf` apresenta algumas informações sobre o uso do
pacote e a compatibilidade com o `abntex2cite`. O arquivo `abnt-testcase.pdf`
imprime *ipsis litteris* todas as entradas citadas na norma 6023:2002 da ABNT.


## Instalação

O `biblatex-abnt` está incluso no TeX Live 2016.

Para instalá-lo manualmente, copie os arquivos `.bbx`, `.cbx` e `.lbx` para

    <TEXMFLOCAL>/tex/latex/biblatex-contrib/biblatex-abnt/

e atualize o banco de dados do TeX (rodando o `texhash`, por exemplo).

## Uso

1. Adicione as seguintes linhas ao preâmbulo do seu arquivo `.tex`:

  ```tex
  \usepackage[style = abnt, language = brazil]{biblatex}
  \addbibresource{arquivo.bib}        % Seus arquivos de
  \addbibresource{outroarquivo.bib}   % bibliografia vão aqui
  ```

2. Use os comandos de citação (e.g. `\cite[10]{entrada2016}`) para citar
suas entradas.

3. Use o comando `\printbibliography` para imprimir a bibliografia.

*Consulte [o arquivo `biblatex-abnt.pdf`](https://github.com/abntex/biblatex-abnt/raw/master/doc/biblatex-abnt.pdf) e o [manual do `biblatex`](http://mirrors.ctan.org/macros/latex/contrib/biblatex/doc/biblatex.pdf) para informações sobre as opções e comandos disponíveis.*

