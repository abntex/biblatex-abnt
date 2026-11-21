# Testes

A suíte atual usa comparação **textual** e determinística, não comparação de
pixels. Cada exemplo normativo é compilado pelo estilo e o texto extraído do
PDF é comparado, registro por registro, com o texto da norma.

## Executar

Na raiz do repositório:

```sh
tests/run-tests.sh
```

Requisitos: `pdflatex`, `biber`, `latexmk`, `pdftotext` e Python 3. O script
usa os arquivos `.bbx`, `.cbx` e `.lbx` desta árvore de trabalho, não a cópia
instalada no TeX Live.

## Suítes

| Diretório | Cobertura |
|---|---|
| `NBR6023-2025` | todos os modelos da seção 7 da NBR 6023:2025 (165 registros) |
| `NBR10520-2023` | principais exemplos autor-data da NBR 10520:2023 |
| `abnt-ibid` | abreviações page-local, primeira citação da página e `apud` |
| `abnt-numeric` | citações numéricas |
| `issues` | regressões de problemas relatados |

Cada caso usa um marcador `@@chave@@` antes da citação ou da entrada
bibliográfica. O runner extrai esses registros com `pdftotext` e compara com
os arquivos `expected.txt`/`cases/*.expected`. Espaços, hifenização e alguns
artefatos de extração são normalizados em `lib/compare_records.py`; o conteúdo
e a pontuação são comparados de forma sensível a maiúsculas e minúsculas.

## Fixtures da NBR 6023:2025

Os arquivos em `NBR6023-2025/cases/` são divididos por faixa de seção. Cada
entrada usa a chave

```
nbr6023-2025-<seção>-<exemplo><e|c>
```

onde `e` é um bloco “elementos essenciais” e `c` um bloco “elementos
complementares”. Consulte `NBR6023-2025/cases/README.md`.

## Testes antigos

Os testes de 2002/2018 baseados em PDF de referência foram movidos para
`legacy/`. Eles não são executados: dependem de versões antigas do TeX Live e
de comparação de pixels, que não é reproduzível. Servem apenas como registro
histórico.
