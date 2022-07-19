chcp 65001
echo off
set logFilename=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set root=%~d0%~p0
set timeTmp=%TIME::=_%
set logFilename=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
set BOT_EXEC="C:\Program Files\FPT Software\akaBot Platform\BotExecutor.exe"
set PROJECT_MAIN="%root%\"
%BOT_EXEC% -f %PROJECT_MAIN% -l VERBOSE
pause
exit