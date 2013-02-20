@echo off
pdflatex %1.tex
if "%2" == "bibtex" (
    bibtex %1
    pdflatex %1.tex
    pdflatex %1.tex
)
%1.pdf

