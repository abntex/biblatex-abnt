#!/bin/bash

echo "Running tests..."

sed -i '' 's/\\toggletrue{reference}/% \\toggletrue{reference}/' NBR10520-2002.tex

sed -i '' 's/\\toggletrue{reference}/% \\toggletrue{reference}/' NBR6023-2002.tex

{
latexmk -pdf -norc -interaction=nonstopmode NBR10520-2002.tex

latexmk -pdf -norc -interaction=nonstopmode NBR6023-2002.tex

pdflatex -interaction=nonstopmode NBR10520-2002_test.tex

pdflatex -interaction=nonstopmode NBR6023-2002_test.tex

latexmk -norc -c
} &> /dev/null

rm NBR10520-2002.bbl

rm NBR6023-2002.bbl

rm NBR10520-2002.run.xml

rm NBR6023-2002.run.xml

sed -i '' 's/% \\toggletrue{reference}/\\toggletrue{reference}/' NBR10520-2002.tex

sed -i '' 's/% \\toggletrue{reference}/\\toggletrue{reference}/' NBR6023-2002.tex

pass=true

while read -r line ; do
    C=$(echo $line | awk '{print $1}')
    Y=$(echo $line | awk '{print $2}')
    M=$(echo $line | awk '{print $3}')
    if [ "$C" != 0.00000 ] || [ "$Y" != 0.00000 ] || [ "$M" != 0.00000 ] ; then
        pass=false
    fi
done < <(gs -q  -o - -sDEVICE=inkcov NBR10520-2002_test.pdf | sed -e '1d')

while read -r line ; do
    C=$(echo $line | awk '{print $1}')
    Y=$(echo $line | awk '{print $2}')
    M=$(echo $line | awk '{print $3}')
    if [ "$C" != 0.00000 ] || [ "$Y" != 0.00000 ] || [ "$M" != 0.00000 ] ; then
        pass=false
    fi
done < <(gs -q  -o - -sDEVICE=inkcov NBR6023-2002_test.pdf | sed -e '1d')


if [ "$pass" = true ] ; then
    echo "ALL GOOD!"
    exit 0
else
    echo "OOPS, THERE'S SOMETHING WRONG!"
    exit 1
fi

