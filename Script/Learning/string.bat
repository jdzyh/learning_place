@echo off
setlocal enabledelayedexpansion

set x=asfas;zzzz;qq;

ECHO !x!
pause

set y=!x:~-1!

ECHO !y!
pause

if /i !x:~-1!==';' (
	echo [+]
)
