for /R %CD% %%f in (*.glg, *.glo, *.gls, *.ist, *.lof, *.lot, *.sbl, *.slg, *.sym, *.toc, *.aux, *.bbl, *.blg, *.log, *.out) do move %%f %CD%\outputfiles

cd content
call generator.bat
cd ..

pdflatex 00_MAIN.tex --shell-escape

rem bibtex digital
rem bibtex analog

bibtex 00_MAIN
bibtex ltex

rem pdflatex 00_MAIN.tex --shell-escape

makeindex -t 00_MAIN.glg -s 00_MAIN.ist -o 00_MAIN.gls 00_MAIN.glo 
makeindex  -t 00_MAIN.alg -s 00_MAIN.ist -o 00_MAIN.acr 00_MAIN.acn 
rem makeindex -t 00_MAIN.slg -s 00_MAIN.ist -o 00_MAIN.sym 00_MAIN.sbl


pdflatex 00_MAIN.tex --shell-escape
pdflatex 00_MAIN.tex --shell-escape

for /R %CD% %%f in (*.glg, *.glo, *.gls, *.ist, *.lof, *.lot, *.sbl, *.slg, *.sym, *.toc, *.aux, *.bbl, *.blg, *.log, *.out) do move %%f %CD%\outputfiles
xcopy  00_MAIN.pdf ./cd/

pause