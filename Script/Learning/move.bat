REM @echo START
REM @pause

REM @move ".\*.ass" "..\..\..\[Ghost in the Shell S.A.C.2nd GIG���ǻ�����TV��ڶ���][X264 1920x1080_AAC][Raw][BDRip]\"

REM @echo END
REM @pause

@echo off
for /f "delims=" %%a in ('dir /b/s/a-d "����*.jpg"') do (
    @set "str=%%~nxa"
    setlocal enabledelayedexpansion
    ren "%%a" "!str:2,0!.ass"
    endlocal
)

@pause