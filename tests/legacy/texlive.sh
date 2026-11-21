#!/bin/bash

wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xzf install-tl-unx.tar.gz
cd install-tl-20*

cat << EOF >> texlive.profile
selected_scheme scheme-minimal
TEXDIR /tmp/texlive
TEXMFCONFIG ~/.texlive/texmf-config
TEXMFHOME ~/texmf
TEXMFLOCAL /tmp/texlive/texmf-local
TEXMFSYSCONFIG /tmp/texlive/texmf-config
TEXMFSYSVAR /tmp/texlive/texmf-var
TEXMFVAR ~/.texlive/texmf-var
option_doc 0
option_src 0
EOF

./install-tl --no-verify-downloads --profile=./texlive.profile
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH

tlmgr --no-verify-downloads install latex-bin lm ec biblatex biber babel babel-portuges \
    hyphen-portuguese logreq xstring xpatch csquotes substr pdfpagediff \
    microtype graphics etoolbox xcolor oberdiek url l3packages hyperref \
    geometry l3kernel

