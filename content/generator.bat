@ECHO off
DEL generator.tex
ECHO %% ######################################################### >>generator.tex 
ECHO %% Title:      Automated Latex File Input >>generator.tex
ECHO %% Author:   Ilka Salomon >>generator.tex
ECHO %% Date:      09.07.2022 >>generator.tex 
ECHO %% Note:      This file is auto-generated and will be >>generator.tex 
ECHO %%               reloaded during compile process.>>generator.tex 
ECHO %% ######################################################### >>generator.tex 
REM ECHO %% COMMENT >>generator.tex 


:: 1st Layer ::
for /d %%D in (*) do (
	ECHO.>>generator.tex
	ECHO %% ------------------------------------------------------------------------------------------------------------------------------------ >>generator.tex
	ECHO %% Chapter %%~nxD>>generator.tex 
	ECHO %% ------------------------------------------------------------------------------------------------------------------------------------ >>generator.tex
	ECHO.>>generator.tex
	ECHO  - %%~nxD
:: -> Files ::
	for %%T in (%%~nxD/*) do (
		ECHO    - %%~nxT
		ECHO    \input{content/%%~nxD/%%~nxT}>>generator.tex 
	)
:: -> Folders ::
	:: 2nd Layer ::
	for /d %%E in (%%~nxD/*) do (
		ECHO.>>generator.tex
		ECHO    %% ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ >>generator.tex
		ECHO    %% Section %%~nxE>>generator.tex 
		ECHO    %% ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ >>generator.tex
		ECHO.>>generator.tex
		ECHO    - %%~nxE
	:: -> Files ::
		for %%T in (%%~nxD/%%~nxE/*) do (
			ECHO    - %%~nxT
			ECHO       \input{content/%%~nxD/%%~nxE/%%~nxT}>>generator.tex 
		)
		:: 3rd Layer ::
		for /d %%F in (%%~nxD/%%~nxE/*) do (
			ECHO      - %%~nxF
			ECHO.>>generator.tex
			ECHO       %% Subsection %%~nxF ---------->>generator.tex
		:: -> Files ::
			for %%T in (%%~nxD/%%~nxE/%%~nxF/*) do (
				ECHO    - %%~nxT
				ECHO          \input{content/%%~nxD/%%~nxE/%%~nxF/%%~nxT}>>generator.tex 
			)			
		)
	)
)

REM ECHO \input{00_Introduction}>generator.tex