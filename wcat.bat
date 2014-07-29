@echo off

@REM 【ストレステスト準備】
@REM WCatをダウンロードしてインストール
@REM http://www.iis.net/downloads/community/2007/05/wcat-63-%28x86%29
@REM コマンドプロンプトを管理者権限で実行
@REM このバッチを実行（初回はファイアーウォール許可、強制リブートがある）
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

@REM Cscript をデフォルトにする
Cscript //H:Cscript
pause

@REM 負荷を掛けるクライアント名をカンマ区切りで指定する
%WCAT% -terminate -update -clients localhost

@REM サーバーのパフォーマンスカウンタにアクセスできるようにIPC$の接続を確立する
net use \\%SERVER%\ipc$
pause

@REM 実行
%WCAT% -terminate -run -setclients -clients localhost -o "%OUTPUT%" -t "%SCENARIO%" -f "%SETTINGS%" -s "%SERVER%" -singleip -x -stderr "%STDERR%" -stdout "%STDOUT%" > "%LOG%"
pause
