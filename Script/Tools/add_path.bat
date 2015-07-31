@echo off &setlocal enabledelayedexpansion

::作为参数传入:path_dst
ECHO $ ----START----

for /f "tokens=1,2*" %%a in (
	'reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Path' 
) do (
	set path_all=%%c
)
::将path_all中的分号替换为空格
::set path_all=%path_all:;= %
set path_split_right=%path_all%
call :Loop_split

ECHO $ Input dst_path:
set /p path_dst=
ECHO $ !path_dst!

echo $ Current Path :
echo $	"!path_all!" |find /i "!path_dst!" && set FindPath=true || set FindPath=false &echo $	!path_all!
echo $
echo $ FindPath ? : !FindPath!

if /i !FindPath!==true (
	echo $ Path Already Exists!

) else (
	echo $ Sure To Add New Path ? [Y/N]
	set /p ans=
	
	if /i ans==Y (
		reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "%path_all%;%path_dst%" /f
		echo $New PATH : 
		path
	)
)
echo $ EXIT
echo $	
echo $	
echo $	
echo $	
goto :eof

:Loop_split
for /f "delims=; tokens=1*" %%c in ("%path_split_right%") do (
	echo $	%%c
	if %%d==nul (
		goto Loop_split_End
	) else (
		set path_split_right=%%d
		goto Loop_split
	)
)
:Loop_split_End
goto :eof