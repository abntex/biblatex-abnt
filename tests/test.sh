#!/bin/bash

sed -i '' 's/\\toggletrue{reference}/% \\toggletrue{reference}/' NBR10520-2002.tex

sed -i '' 's/\\toggletrue{reference}/% \\toggletrue{reference}/' NBR6023-2002.tex

latexmk -pdf -norc NBR10520-2002.tex

latexmk -pdf -norc NBR6023-2002.tex

pdflatex NBR10520-2002_test.tex

pdflatex NBR6023-2002_test.tex

latexmk -norc -c

rm NBR10520-2002.bbl

rm NBR6023-2002.bbl

rm NBR10520-2002.run.xml

rm NBR6023-2002.run.xml

sed -i '' 's/% \\toggletrue{reference}/\\toggletrue{reference}/' NBR10520-2002.tex

sed -i '' 's/% \\toggletrue{reference}/\\toggletrue{reference}/' NBR6023-2002.tex

