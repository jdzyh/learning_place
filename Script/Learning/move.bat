REM @echo START
REM @pause

REM @move ".\*.ass" "..\..\..\[Ghost in the Shell S.A.C.2nd GIG攻壳机动队TV版第二季][X264 1920x1080_AAC][Raw][BDRip]\"

REM @echo END
REM @pause

@echo off
for /f "delims=" %%a in ('dir /b/s/a-d "陈明*.jpg"') do (
    @set "str=%%~nxa"
    setlocal enabledelayedexpansion
    ren "%%a" "!str:2,0!.ass"
    endlocal
)

@pause