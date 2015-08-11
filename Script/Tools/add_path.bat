@echo off
setlocal enabledelayedexpansion

::作为参数传入:path_dst
ECHO [+] ----------START----------
:L_main_loop_start
call :L_get_splited_path
ECHO=
ECHO [+] Input Commands : [0]exit, [1]add, [2]mod
set /p command=

if /i !command!==0 (
	goto L_main_loop_end
)
if /i !command!==1 (
	call :L_add_new_path
)
if /i !command!==2 (
	call :L_modify_exist_path
)
goto L_main_loop_start
:L_main_loop_end




echo [+] EXIT
echo=	
echo=
goto :eof

::-----------------------------------------
:: Get Splited Path
::-----------------------------------------
:L_get_splited_path
for /f "tokens=1,2*" %%a in (
	'reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Path' 
) do (
	set path_all=%%c
)

ECHO [+] Show Splited Path

set path_split_right=%path_all%
set count=0
:L_loop_split_start
for /f "delims=; tokens=1*" %%c in ("%path_split_right%") do (
	echo [!count!]	%%c

	set path_split_right=%%d
	set /a count+=1
	goto L_loop_split_start
)
:L_loop_split_end
goto :eof

::-----------------------------------------
:: Add Path
::-----------------------------------------
:L_add_new_path
ECHO [+] Input New Path :
set /p path_dst=

echo [+] Current Path :
echo [+] '!path_all!' |find /i "!path_dst!" && set FindPath=true || set FindPath=false
echo [+]
echo [+] FindPath ? : !FindPath!

if /i %FindPath%==true (
	echo [+] Path Already Exists!
	echo [+] Still Add New Path ? [y/n]
) else (
	echo [+] Sure To Add New Path ? [y/n]
)
set /p ans_add=
echo [+]
if /i %ans_add%==y (
	reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "%path_all%;%path_dst%" /f
)
:L_add_new_path_end
goto :eof

::-----------------------------------------
:: Modify Path
::-----------------------------------------
:L_modify_exist_path
ECHO [+] Input Id : 
set /p id=
ECHO [+] Input Mod Path :
set /p mod_path=

set path_split_right=!path_all!
set path_split_left=
set count=0

:L_loop_path_id_start
for /f "delims=; tokens=1*" %%c in ("%path_split_right%") do (
	if !count!==!id! (
		ECHO [+] Old Path[!count!] : %%c
		ECHO [+] New Path[!count!] : !mod_path!
		ECHO [+] Sure To Edit This Path ? [y/n]
		set /p ans_mod=
		if /i !ans_mod!==y (
			set new_all_path=!path_split_left:~1!;!mod_path!;%%d
			set chr=;
			if !new_all_path:~-1!==!chr! (
				set new_all_path=!new_all_path:~0,-1!
			)
			reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "%new_all_path%" /f
			ECHO !new_all_path!
			path
			goto L_loop_path_id_end
		) else (
			ECHO [+] Give Up !
			goto L_loop_path_id_end
		)
	) else (
		set path_split_left=!path_split_left!;%%c
		set path_split_right=%%d
		set /a count+=1
		goto L_loop_path_id_start
	)
)
:L_loop_path_id_end

:L_modify_exist_path_end
goto :eof
