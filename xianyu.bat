@if (@CodeSection == @Batch) @then


@echo off
setlocal EnableDelayedExpansion


:: Use %SendKeys% to send keys to the keyboard buffer
SET SendKeys=CScript //nologo //E:JScript "%~F0"


:neverStop
ECHO ------ BEGIN THE LOOP ------

SET /A idleTime=%RANDOM% * 900 / 32768 + 1
SET /A idleTime=%idleTime% * 1000 + %RANDOM% * 999 / 32768
SET /A idleTimeInMinutes = %idleTime% / 1000 / 60
ECHO (%DATE% %TIME%) Plan to wait for about %idleTimeInMinutes% minutes to log in
%SendKeys% %idleTime% "{ENTER}"
ECHO (%DATE% %TIME%) Press key {ENTER} to log in

ECHO (%DATE% %TIME%) Plan to wait for 35 minutes to let system kick the character out
TIMEOUT /T 2100 /NOBREAK
ECHO (%DATE% %TIME%) The character should be kicked out now

ECHO ------ END THE LOOP ------
GOTO :neverStop


GOTO :EOF


:: define a function to press key {SPACE} random times
:pressSpaces
SET /A repeatAmount=!RANDOM! * 10 / 32768 + 2
FOR /L %%x in (1, 1, !repeatAmount!) do (
    SET /A idleTime=!RANDOM! * 3000 / 32768 + 300
    %SendKeys% !idleTime! " "
    ECHO Pressed key {SPACE} after !idleTime!ms delay.
)
EXIT /B 0


@end


// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WScript.Sleep(WScript.Arguments(0));
WshShell.SendKeys(WScript.Arguments(1));


