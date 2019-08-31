@if (@CodeSection == @Batch) @then


@echo off
setlocal EnableDelayedExpansion


:: Use %SendKeys% to send keys to the keyboard buffer
SET SendKeys=CScript //nologo //E:JScript "%~F0"
SET /A idleTime=100000


:neverStop

SET /A shouldRun = %RANDOM% %% 2
IF %shouldRun% == 1 (
    CALL :getIdleTimeInMs !idleTime! idleTime
    %SendKeys% !idleTime! "{UP}"
    ECHO Pressed key {UP} after !idleTime!ms delay.
)

IF %shouldRun% == 1 (
    CALL :getIdleTimeInMs !idleTime! idleTime
    %SendKeys% !idleTime! "c"
    ECHO Pressed key {c} after !idleTime!ms delay.
)

SET /A shouldRun = %RANDOM% %% 2
IF %shouldRun% == 1 (
    CALL :getIdleTimeInMs !idleTime! idleTime
    %SendKeys% !idleTime! "{DOWN}"
    ECHO Pressed key {DOWN} after !idleTime!ms delay.
)

IF %shouldRun% == 1 (
    CALL :getIdleTimeInMs !idleTime! idleTime
    %SendKeys% !idleTime! "l"
    ECHO Pressed key {l} after !idleTime!ms delay.
)

SET /A shouldRun = %RANDOM% %% 2
IF %shouldRun% == 1 (
    CALL :getIdleTimeInMs !idleTime! idleTime
    %SendKeys% !idleTime! "{LEFT}"
    ECHO Pressed key {LEFT} after !idleTime!ms delay.
)

IF %shouldRun% == 1 (
    CALL :getIdleTimeInMs !idleTime! idleTime
    %SendKeys% !idleTime! "p"
    ECHO Pressed key {p} after !idleTime!ms delay.
)

SET /A shouldRun = %RANDOM% %% 2
IF %shouldRun% == 1 (
    CALL :getIdleTimeInMs !idleTime! idleTime
    %SendKeys% !idleTime! "{RIGHT}"
    ECHO Pressed key {RIGHT} after !idleTime!ms delay.
)

IF %shouldRun% == 1 (
    CALL :getIdleTimeInMs !idleTime! idleTime
    %SendKeys% !idleTime! "b"
    ECHO Pressed key {b} after !idleTime!ms delay.
)

SET /A shouldRun = %RANDOM% %% 2
IF %shouldRun% == 1 (
    CALL :getIdleTimeInMs !idleTime! idleTime
    %SendKeys% !idleTime! " "
    ECHO Pressed key {SPACE} after !idleTime!ms delay.
)

GOTO :neverStop


GOTO :EOF


:: define a function to get a random idle time to try to simulate human behavior
:getIdleTimeInMs
IF %~1 LEQ 500 (
    :: burst mode
    IF !RANDOM! LSS 29000 (
        :: have about 90% chance to keep staying in the burst mode
        SET /A idle=!RANDOM! * 500 / 32768 + 100
        SET /A %~2=!idle!
    ) ELSE (
        SET /A idle=!RANDOM! * 100 / 32768 + 1
        SET /A idle=!RANDOM! * !idle! / 32768 + 1
        SET /A idle=!RANDOM! * !idle! / 32768 + 1
        SET /A idle=!idle! * 1000
        SET /A %~2=!idle!
    )
) ELSE (
    IF !RANDOM! LSS 10000 (
        :: have about one third chance to get into the burst mode
        SET /A idle=!RANDOM! * 500 / 32768 + 100
        SET /A %~2=!idle!
    ) ELSE (
        SET /A idle=!RANDOM! * 100 / 32768 + 1
        SET /A idle=!RANDOM! * !idle! / 32768 + 1
        SET /A idle=!RANDOM! * !idle! / 32768 + 1
        SET /A idle=!idle! * 1000
    )
)
SET /A %~2=!idle!
EXIT /B 0


@end


// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WScript.Sleep(WScript.Arguments(0));
WshShell.SendKeys(WScript.Arguments(1));


