pdflatex 00_MAIN.tex --shell-escape
pdflatex 00_MAIN.tex --shell-escape
for /R %CD% %%f in (*.glg, *.glo, *.gls, *.ist, *.lof, *.lot, *.sbl, *.slg, *.sym, *.toc, *.aux, *.bbl, *.blg, *.log, *.out) do move %%f %CD%\outputfiles
