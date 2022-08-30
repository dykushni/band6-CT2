@echo off
if "%~1" == "" (start "" /min "%comspec%" /c "%~f0" any_word & exit /b)
set OUTPUT=nul
if "%STDOUT_REDIRECTED%" == "" (
set STDOUT_REDIRECTED=yes
cmd.exe /c %0 1>%OUTPUT% 2>%OUTPUT%
exit /b %ERRORLEVEL%
)
set name=GoodAdvice
set moment=%Date:~6,4%.%Date:~3,2%.%Date:~0,2%_%TIME:~0,2%-%TIME:~3,2%
xcopy "%name%\*.*" "%name%_%moment%\" /e /c /y /h
xcopy "sources\*.*" "%name%_%moment%\" /e /c /y /h
cd %name%_%moment%\
call package_tool.bat
cd %programdata%\watchdesigner\project
xcopy "%name%_%moment%\output\*.hwt" ".\" /e /c /y /h
pause& exit