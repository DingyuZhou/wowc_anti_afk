@if (@CodeSection == @Batch) @then


@echo off
setlocal EnableDelayedExpansion


:: Use %SendKeys% to send keys to the keyboard buffer
SET SendKeys=CScript //nologo //E:JScript "%~F0"


:neverStop

SET /A idleTime=%RANDOM% * 296 / 32768

IF %idleTime% GTR 250 (
    SET /A idleTime=%RANDOM% * 296 / 32768
)

IF %idleTime% LSS 150 (
    SET /A idleTime=%RANDOM% * 296 / 32768
    IF %idleTime% LSS 100 (
        SET /A idleTime=%RANDOM% * 296 / 32768
        IF %idleTime% LSS 50 (
            SET /A idleTime=%RANDOM% * 296 / 32768
        )
    )
)

SET /A idleTime=%idleTime% * 1000 + %RANDOM% * 999 / 32768 + 200

%SendKeys% %idleTime% " "
ECHO (%DATE% %TIME%) Press the key {SPACE}

GOTO :neverStop


GOTO :EOF


@end


// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WScript.Sleep(WScript.Arguments(0));
WshShell.SendKeys(WScript.Arguments(1));


