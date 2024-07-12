@echo off
setlocal enabledelayedexpansion
set "source=C:\"
set "archive=Z:\archive"
set "deletePrompt=0"

:: Sorting files by date
for %%i in ("%source%\*.txt") do (
    set "date=%%~ti"
    set "date=!date:~0,10!"
    md "%archive%\!date!" 2>nul
    move "%%i" "%archive%\!date!\" >nul
)

:: Archiving older files and sorting by size
for /d %%d in ("%archive%\*") do (
    pushd "%%d"
    for /f "delims=" %%f in ('dir /b /a:-d /od') do (
        set "size=%%~zf"
        set "size=!size:,=!"
        if !size! GTR 1048576 (
            if !deletePrompt! equ 0 (
                echo WARNING: Large files found. Do you want to delete them? (Y/N)
                set /p choice=
                if /i "!choice!" equ "Y" (
                    set deletePrompt=1
                ) else (
                    set deletePrompt=2
                )
            )
            if !deletePrompt! equ 1 (
                del "%%f"
            )
        )
    )
    popd
)
