@rem ����ע����
@GOTO StartLabel
@echo Hello World!
@rem @set /p inputxx= @rem /p��ʾ��������ݸ�ֵ������
@rem @echo %inputxx% >> .\test.txt

@REM ¥���ǿ���������ת�ı�ǩ
@REM ִ����һ���������ļ� : call xxx.bat
@pause

@IF /I abc==ABC (@echo /I ��ʾ�����ִ�Сд) ELSE (@echo ���ִ�Сд)
@pause


@for %%i in (bbs bathome cn) do @echo %%i
@pause

@set str=c d e f g h i j k l m n o p q r s t u v w x y z
@for %%i in (%str%) do @if exist %%i: @echo %%i
@pause

@for /f %%i in (test.txt) do @echo "%%i"&pause
@pause

@for /f "delims= ,   tokens=2-4" %%i in (test.bat) do @echo %%i %%j 
@pause


@for /f "delims=() tokens=1,2*" %%i in (test.bat) do @echo %%i %%j %%k
@pause


@rem ��ʾ��ǰ�����еĻ�������(ָ��setҲΪ�ù���)
@FOR /F "usebackq delims=" %%i IN (`set`) DO @echo %%i 
@pause

:StartLabel
@echo off &setlocal enabledelayedexpansion
for /f "delims== tokens=1,*" %%f in ('path') do (
	set str=%%g
)
echo !str_!
pause

set tmpStr=java

echo %str%|find /i "tmpStr" && set IsNull=true|| set IsNull=false
if not %IsNull%==true ( echo aaa )

pause


@echo off &setlocal enabledelayedexpansion
for /f "delims== tokens=1,*" %%f in ('path') do (
	set str=%%g
)
echo !str_!
pause

