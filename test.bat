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

set tmp_path = C:\Python34\
for /f "usebackq delims== tokens=1,*" %%a in (`"path"`) do ( 
	set pall = %%b
)
echo %pall% |find /i "%tmp_path%" && set IsNull=true|| set IsNull=false

if %IsNull%==true ( echo aaa )
pause


