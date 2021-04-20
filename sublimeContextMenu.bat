@echo off

rem @author Juan Calvopina
rem This script allow you add/remove SublimeText to the contextual menu
rem This batch file was tested on Windows 7
rem source https://gist.github.com/jcalvopinam/77e6337ab8287acfc9646f20808bf527
rem added non-admin for folders

cls

echo +------------------------------------------------------+
echo            SublimeText to the Contextual Menu
echo +------------------------------------------------------+
echo.

set st3Path=""

:chooseOption
    echo [0] Exit
    echo [1] Add SublimeText 3
    echo [2] Remove SublimeText 3
    echo.
    set /p chosenOption=Enter an option: 
    if /i "%chosenOption:~,1%" EQU "0" goto cleanAndExit
    if /i "%chosenOption:~,1%" EQU "1" goto addFullPath
    if /i "%chosenOption:~,1%" EQU "2" goto removeFullPath
    cls
    echo Please type 0 for Exit, 1 for Add or 2 for Remove
    echo.
    goto chooseOption

:cleanAndExit
    cls
    exit /b

:addFullPath
    echo.
    set fullPath=C:\Program Files\Sublime Text 3\sublime_text.exe
    goto checkFile

:checkFile
    if exist "%fullPath%" (
        goto kindSetting
    ) else (
        goto fileNotExist
    )

:fileNotExist
    echo.
    echo The file was not found.
    set /p tryAgain=Do you want to enter the full path (Y/N)? 
    if /i "%tryAgain:~,1%" EQU "Y" goto customPath
    if /i "%tryAgain:~,1%" EQU "N" exit /b
    cls
    echo Please type Y for 'Try again' or N for 'Exit'
    echo.
    goto fileNotExist

:customPath
    echo Please enter the full path without quotes (e.g.: C:\Program Files\Sublime Text 3\sublime_text.exe):
    set /p fullPath=
    goto checkFile

:kindSetting
    echo.
    set st3Path=%fullPath%
    set /p answer=Do you want to add 'SublimeText 3' to the contextual menu as Admin (Y/N)? 
    if /i "%answer:~,1%" EQU "Y" goto withAdmin
    if /i "%answer:~,1%" EQU "N" goto withoutAdmin
    cls
    echo Please type Y for 'Admin' or N for 'Non Admin'
    echo.
    goto kindSetting

:withAdmin
    echo.
    echo Adding as Admin
    rem add it for all file types
    @reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3"         /t REG_SZ /v "" /d "Open with Sublime Text 3"   /f
    @reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3"         /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f
    @reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f
     
    rem add it for folders
    @reg add "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text 3"         /t REG_SZ /v "" /d "Open with Sublime Text 3"   /f
    @reg add "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text 3"         /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f
    @reg add "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text 3\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f
    echo Done!
    pause
    exit /b

:withoutAdmin
    echo.
    echo Adding as non-Admin
    rem add it for all file types
    @reg add "HKEY_CURRENT_USER\Software\Classes\*\shell\Open with Sublime Text 3"         /t REG_SZ /v "" /d "Open with Sublime Text 3"   /f
    @reg add "HKEY_CURRENT_USER\Software\Classes\*\shell\Open with Sublime Text 3"         /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f
    @reg add "HKEY_CURRENT_USER\Software\Classes\*\shell\Open with Sublime Text 3\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f
	
	@reg add "HKEY_CURRENT_USER\Software\Classes\directory\shell\Open with Sublime Text 3"         /t REG_SZ /v "" /d "Open with Sublime Text 3"   /f
    @reg add "HKEY_CURRENT_USER\Software\Classes\directory\shell\Open with Sublime Text 3"         /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f
    @reg add "HKEY_CURRENT_USER\Software\Classes\directory\shell\Open with Sublime Text 3\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f
    echo Done!
    pause
    exit /b

:removeFullPath
    echo.
    echo Removing all....
    rem delete it for admin
    @reg delete "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3\command" /f >nul 2>&1
    @reg delete "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3" /f >nul 2>&1
     
    rem delete it for folders
    @reg delete "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text 3\command" /f >nul 2>&1
    @reg delete "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text 3" /f >nul 2>&1

    rem delete it for non admin
    @reg delete  "HKEY_CURRENT_USER\Software\Classes\*\shell\Open with Sublime Text 3\command" /f >nul 2>&1
    @reg delete  "HKEY_CURRENT_USER\Software\Classes\*\shell\Open with Sublime Text 3" /f >nul 2>&1

    echo Done!
    exit /b
