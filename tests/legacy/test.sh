#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
export TEXINPUTS="$REPO_DIR/latex/bbx//:$REPO_DIR/latex/cbx//:$REPO_DIR/latex/lbx//:${TEXINPUTS:-}"

echo "Running tests..."

pass=true


pdflatex -draftmode -interaction=batchmode NBR6023-2025-regressions.tex
biber NBR6023-2025-regressions
pdflatex -draftmode -interaction=batchmode NBR6023-2025-regressions.tex
pdflatex -draftmode -interaction=batchmode NBR6023-2025-regressions.tex


sed -i.bak 's/\\toggletrue{reference}/% \\toggletrue{reference}/' NBR10520-2002.tex
pdflatex -draftmode -interaction=batchmode NBR10520-2002.tex
biber NBR10520-2002
pdflatex -draftmode -interaction=batchmode NBR10520-2002.tex
pdflatex -interaction=batchmode NBR10520-2002.tex
pdflatex -interaction=batchmode NBR10520-2002_test.tex
sed -i.bak 's/% \\toggletrue{reference}/\\toggletrue{reference}/' NBR10520-2002.tex

while read -r line ; do
    C=$(echo $line | awk '{print $1}')
    Y=$(echo $line | awk '{print $2}')
    M=$(echo $line | awk '{print $3}')
    if [ "$C" != 0.00000 ] || [ "$Y" != 0.00000 ] || [ "$M" != 0.00000 ] ; then
        pass=false
    fi
done < <(gs -q  -o - -sDEVICE=inkcov NBR10520-2002_test.pdf | sed -e '1d')


sed -i.bak 's/\\toggletrue{reference}/% \\toggletrue{reference}/' NBR6023-2002.tex
pdflatex -draftmode -interaction=batchmode NBR6023-2002.tex
biber NBR6023-2002
pdflatex -draftmode -interaction=batchmode NBR6023-2002.tex
pdflatex -draftmode -interaction=batchmode NBR6023-2002.tex
pdflatex -interaction=batchmode NBR6023-2002.tex
pdflatex -interaction=batchmode NBR6023-2002_test.tex
sed -i.bak 's/% \\toggletrue{reference}/\\toggletrue{reference}/' NBR6023-2002.tex

while read -r line ; do
    C=$(echo $line | awk '{print $1}')
    Y=$(echo $line | awk '{print $2}')
    M=$(echo $line | awk '{print $3}')
    if [ "$C" != 0.00000 ] || [ "$Y" != 0.00000 ] || [ "$M" != 0.00000 ] ; then
        pass=false
    fi
done < <(gs -q  -o - -sDEVICE=inkcov NBR6023-2002_test.pdf | sed -e '1,3d')


sed -i.bak 's/\\toggletrue{reference}/% \\toggletrue{reference}/' NBR6023-2018.tex
pdflatex -draftmode -interaction=batchmode NBR6023-2018.tex
biber NBR6023-2018
pdflatex -draftmode -interaction=batchmode NBR6023-2018.tex
pdflatex -draftmode -interaction=batchmode NBR6023-2018.tex
pdflatex -interaction=batchmode NBR6023-2018.tex
pdflatex -interaction=batchmode NBR6023-2018_test.tex
sed -i.bak 's/% \\toggletrue{reference}/\\toggletrue{reference}/' NBR6023-2018.tex

while read -r line ; do
    C=$(echo $line | awk '{print $1}')
    Y=$(echo $line | awk '{print $2}')
    M=$(echo $line | awk '{print $3}')
    if [ "$C" != 0.00000 ] || [ "$Y" != 0.00000 ] || [ "$M" != 0.00000 ] ; then
        pass=false
    fi
done < <(gs -q  -o - -sDEVICE=inkcov NBR6023-2018_test.pdf | sed -e '1,3d')


if [ "$pass" = true ] ; then
    echo "ALL GOOD!"
    exit 0
else
    echo ""
    echo "OOPS, THERE'S SOMETHING WRONG!"
    echo ""
    echo "NBR10520-2002_test.pdf"
    gs -q  -o - -sDEVICE=inkcov NBR10520-2002_test.pdf
    echo ""
    echo "NBR6023-2002_test.pdf"
    gs -q  -o - -sDEVICE=inkcov NBR6023-2002_test.pdf
    echo ""
    curl --upload-file ./NBR6023-2002_test.pdf https://transfer.sh/
    echo ""
    curl --upload-file ./NBR10520-2002_test.pdf https://transfer.sh/
    exit 1
fi

