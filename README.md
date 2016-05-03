#biblatex-abnt

Uma substituição em `biblatex`/`biber` para os estilos `bibtex` do pacote [`abntex2-cite`](https://github.com/abntex/abntex2). 

Em geral é possível usar o mesmo arquivo `.bib` utilizado pelo `abntex2cite`, e na maior parte dos casos nenhuma mudança é necessária; estas são as principais exceções:

- Os campos de datas devem seguir o formato usado pelo `biblatex`, `yyyy-mm-dd`. Cf. seção 2.2.1 do [manual](http://mirrors.ctan.org/macros/latex/contrib/biblatex/doc/biblatex.pdf).
- O mesmo vale para os campos de partes de datas, como `month` e `year`.
- O `biblatex` diferencia os campos `pages` (e.g. "p. 12-18") e `pagetotal` e.g. "347 p.").
- Para teses de mestrado e doutorado, o campo `pagetotal` é automaticamente formatado em folhas, como requer a norma (e.g. "347 f."), mas para isso é preciso remover os campos `pagename={f.}`. Para usar páginas também nessas entradas, use `bookpagination={page}` ou `pagename={page}`.
- Para usar folhas também em outras entradas, deve-se usar `bookpagination={sheet}` ou `pagename={sheet}`.
- Ao modificar o campo `type` em teses de mestrado e doutorado, deve-se preenchê-lo com todo o texto desejado (e.g. "Tese (Doutorado em Nutrição)").
- Ao utilizar o campo `illustrated`, deve-se preenchê-lo com todo o texto desejado (e.g. "il.").
- Além do campo `organization`, foi adicionado o campo `orgsubtitle`, de modo que organizações como "SÃO PAULO (Estado). Secretaria do Meio Ambiente. Tratados e organizações ambientais em matéria de meio ambiente." e "SÃO PAULO (Estado). Secretaria do Meio Ambiente. Coordenadoria de Planejamento Ambiental." podem ter a mesma organização, diferenciando-se pelo campo `orgsubtitle`. Isso permite que a primeira parte, "SÃO PAULO (Estado). Secretaria do Meio Ambiente.", não seja repetida várias vezes seguidas.
- Quando o primeiro campo impresso é o título ou a organização, a primeira palavra é automaticamente impressa em maiúsculas. Para que mais de uma palavra seja impressa em maiúsculas, coloque-as entre chaves (e.g. `{São Paulo} (Estado)` imprimirá "SÃO PAULO (Estado)").
- Pode-se incluir o campo `options={noslsn}` para não mostrar as abreviações "[s.l.]" e "[s.n.]" numa entrada específica.
- Para periódicos, deve se utilizar entradas `@periodical`. Usando-se `@book`, como no `abntex2cite`, o ISSN não aparece.
