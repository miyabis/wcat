@echo off

@REM �y�X�g���X�e�X�g�����z
@REM WCat���_�E�����[�h���ăC���X�g�[��
@REM http://www.iis.net/downloads/community/2007/05/wcat-63-%28x86%29
@REM �R�}���h�v�����v�g���Ǘ��Ҍ����Ŏ��s
@REM ���̃o�b�`�����s�i����̓t�@�C�A�[�E�H�[�����A�������u�[�g������j
@REM 

set WCAT="C:\Program Files\WCAT\Wcat.wsf"
set OUTPUT=report.xml
set SERVER=server_name
set SCENARIO=scenario.wcat
set SETTINGS=settings.wcat
set STDERR=log_errors.txt
set STDOUT=log_output.txt
set LOG=log_wcat.log

rm "%STDERR%"
rm "%STDOUT%"

@echo on

@REM Cscript ���f�t�H���g�ɂ���
Cscript //H:Cscript
pause

@REM ���ׂ��|����N���C�A���g�����J���}��؂�Ŏw�肷��
%WCAT% -terminate -update -clients localhost

@REM �T�[�o�[�̃p�t�H�[�}���X�J�E���^�ɃA�N�Z�X�ł���悤��IPC$�̐ڑ����m������
net use \\%SERVER%\ipc$
pause

@REM ���s
%WCAT% -terminate -run -setclients -clients localhost -o "%OUTPUT%" -t "%SCENARIO%" -f "%SETTINGS%" -s "%SERVER%" -singleip -x -stderr "%STDERR%" -stdout "%STDOUT%" > "%LOG%"
pause
