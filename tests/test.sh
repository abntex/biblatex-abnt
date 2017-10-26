#!/bin/bash

latexmk -pdf -norc NBR10520-2002.tex

latexmk -pdf -norc NBR6023-2002.tex

pdflatex NBR10520-2002_test.tex

pdflatex NBR6023-2002_test.tex

