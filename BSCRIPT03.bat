@echo off
echo Select a command:
echo 1. ipconfig
echo 2. tasklist/taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
set /p choice=Enter your choice (1-7):
if %choice% equ 1 (
    ipconfig
) else if %choice% equ 2 (
    set /p task=Enter the task name:
    tasklist | findstr /i "%task%"
    if errorlevel 1 (
        echo Task not found.
    ) else (
        taskkill /im %task%
    )
) else if %choice% equ 3 (
    chkdsk
) else if %choice% equ 4 (
    echo This command will format a drive. Are you sure you want to proceed? (Y/N)
    set /p confirm=
    if /i "%confirm%" equ "Y" (
        format
    ) else (
        echo Format canceled.
    )
) else if %choice% equ 5 (
    defrag
) else if %choice% equ 6 (
    set /p searchString=Enter the string to search for:
    find "%searchString%"
) else if %choice% equ 7 (
    set /p file=Enter the file name:
    attrib %file%
) else (
    echo Invalid choice!
)
