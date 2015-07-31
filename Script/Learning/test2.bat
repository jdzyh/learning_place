@echo off &setlocal enabledelayedexpansion

:Label_1
ECHO $ ----START----

set Y="C:\JAVA;D:\EEEE;%JAVA_HOME%\nice"
ECHO $ !Y!

ECHO $ Input X:
set /p X=
ECHO $ !X!

echo $ Current://
echo $	"!Y!" |find /i "!X!" && set isFind=true || set isFind=false &echo $	!Y!
echo $ !isFind!

goto :Label_1