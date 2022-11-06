@echo off
setlocal ENABLEDELAYEDEXPANSION
REM Edit this value to change the name of the file that needs splitting. Include the extension.
SET BFN=InsertFileNameHere.csv
REM Edit this value to change the number of lines per file.
SET LPF=60000
REM Edit this value to change the name of each short file. It will be followed by a number indicating where it is in the list.
SET SFN=InsertFileNameHereSplit
REM Do not change beyond this line.
SET SFX=%BFN:~-3%
SET /A LineNum=0
SET /A FileNum=1
For /F "delims==" %%l in (%BFN%) Do (
SET /A LineNum+=1
echo %%l >> %SFN%!FileNum!.%SFX%
if !LineNum! EQU !LPF! (
SET /A LineNum=0
SET /A FileNum+=1
)
)
endlocal
Pause
