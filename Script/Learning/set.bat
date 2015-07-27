@echo off &setlocal enabledelayedexpansion
for /f "delims== tokens=1,*" %%f in ('path') do (
	set str=%%g
)
echo !str!
pause

set tmpStr=java

echo %str%|find /i "tmpStr" && set IsNull=true|| set IsNull=false
if not %IsNull%==true ( echo aaa )

pause