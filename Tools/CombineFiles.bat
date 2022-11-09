@echo off
ECHO Set working directory
pushd %~dp0
ECHO Deleting existing combined file
del combined.csv
setlocal ENABLEDELAYEDEXPANSION
set cnt=1
for %%i in (*.csv) do (
  if !cnt!==1 (
    for /f "delims=" %%j in ('type "%%i"') do echo %%j >> combined.csv
  ) else if %%i NEQ combined.csv (
    for /f "skip=1 delims=" %%j in ('type "%%i"') do echo %%j >> combined.csv
  )
  set /a cnt+=1
)
