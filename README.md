# biblatex-abnt

Version 2.0

Permission is granted to copy, distribute and/or modify this software under
the terms of the LaTeX Project Public License, version
1.3c (http://www.latex-project.org/lppl.txt). The current
maintainer is Daniel B. Marques.

----------

Estilo para `biblatex` compatível com as normas da ABNT.

Substitui o pacote [`abntex2cite`](https://github.com/abntex/abntex2).

**Requer `biblatex v3.4` e `biber v2.5`.**

O arquivo `biblatex-abnt.pdf` apresenta algumas informações sobre o uso do pacote e a compatibilidade com o `abntex2cite`. O arquivo `abnt-testcase.pdf` imprime todas as entradas usadas nos manuais do `abntex2cite` (incluindo todas as entradas usadas na norma 6023 (2000) da ABNT).


## Instalação

O `biblatex-abnt` está incluso no TeX Live 2016.

Para instalá-lo manualmente, copie os arquivos `.bbx`, `.cbx` e `.lbx` para:

`<TEXMFLOCAL>/tex/latex/biblatex-contrib/biblatex-abnt/`

## Uso

1. Adicione as seguintes linhas ao preâmbulo do seu arquivo `.tex`:

  ```tex
  \usepackage[backend=biber, style=abnt]{biblatex}
  \usepackage[brazil]{babel}
  \addbibresource{arquivo.bib}        % Seus arquivos de
  \addbibresource{outroarquivo.bib}   % bibliografia vão aqui
  ```

2. Use os comandos de citação (e.g. `\cite[p.~10]{entrada2016}`) para citar suas entradas.

3. Use o comando `\printbibliography` para imprimir a bibliografia.

*Consulte o arquivo `biblatex-abnt.pdf` e o [manual do `biblatex`](http://mirrors.ctan.org/macros/latex/contrib/biblatex/doc/biblatex.pdf) para informações sobre as opções e comandos disponíveis.*
