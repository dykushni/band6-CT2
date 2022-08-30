@echo off
set name=GoodAdvice
set moment=%Date:~6,4%.%Date:~3,2%.%Date:~0,2%_%TIME:~0,2%-%TIME:~3,2%
xcopy "%name%\*.*" "%name%_%moment%\" /e /c /y /h
xcopy "sources\*.*" "%name%_%moment%\" /e /c /y /h