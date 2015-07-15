@rem Copyright (c) 2013, 2014, Oracle and/or its affiliates. All rights reserved.
@rem ORACLE PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.

@echo off

setlocal
setlocal ENABLEDELAYEDEXPANSION

set exitcode=0

@REM # The for loops below are used to determine if a variable
@REM # is empty and to remove quotes if they are present.
@REM # If it is empty it will not iterate, count == 0.
@REM # if it is not empty the count will be greater than 0 and
@REM # quotes will be stripped if they exist.

@REM # Strip the quotes if they exist and then always
@REM # quote JAVA_HOME. The for loop should only
@REM # iterate once if JAVA_HOME is set.
set count=0
for /f "tokens=*" %%a in ("!JAVA_HOME!") do (
    set /a count=!count! + 1
    set JAVA_HOME=%%~a
)
if !count! EQU 0 (
    echo JAVA_HOME is not set.
    set exitcode=1
    goto :quit
)

@REM # Strip the quotes if they exist and then always
@REM # quote EJDK_HOME. The for loop should only
@REM # iterate once if EJDK_HOME is set.
set count=0
for /f "tokens=*" %%a in ("!EJDK_HOME!") do (
    set /a count=!count! + 1
    set EJDK_HOME=%%~a
)
if !count! EQU 0 (
    @REM # EJDK_HOME is not set
    @REM # Quotes will be stripped by %~dp0.
    @REM # Do not add trailing \, which will escape the 
    @REM # trailing quote when the string in quoted.
    set EJDK_HOME=%~dp0..
)
@REM # Strip trailing slash from EJDK_HOME if present
if !EJDK_HOME:~-1! EQU \ set EJDK_HOME=!EJDK_HOME:~0,-1!

@REM # Quote EJDK_HOME
set ejdkargs="-Xbootclasspath/p:!EJDK_HOME!\lib\JRECreate.jar" -Dejdk.home="!EJDK_HOME!" -jar "!EJDK_HOME!\lib\JRECreate.jar"

@REM # Quote java path
"!JAVA_HOME!\bin\java" -Xms512m -Xmx512m !ejdkargs! %*

endlocal

:quit

exit /b !exitcode!
