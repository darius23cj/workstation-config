cd /d "%~dp0"
set "CURRENT_DIR=%cd%"
echo CURRENT_DIR='%CURRENT_DIR%'

set "TOMCAT_VERSION=8.5.8"
set "M2_VERSION=3.3.9"


if defined ProgramFiles(x86) (
    if not exist "jdk-8u73-windows-x64.exe" (
        PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%CURRENT_DIR%\download-app.ps1'" jdk-8u73-windows-x64.exe
    )
    if not exist "Git-2.7.2-64-bit.exe" (
        PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%CURRENT_DIR%\download-app.ps1'" Git-2.7.2-64-bit.exe
    )
) else (
    if not exist "jdk-8u73-windows-i586.exe" (
        PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%CURRENT_DIR%\download-app.ps1'" jdk-8u73-windows-i586.exe
    )
    if not exist "Git-2.7.2-32-bit.exe" (
        PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%CURRENT_DIR%\download-app.ps1'" Git-2.7.2-32-bit.exe
    )
)

if not exist "npp.7.2.1.Installer.exe" (
    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%CURRENT_DIR%\download-source.ps1'" npp.7.2.1.Installer.exe https://notepad-plus-plus.org/repository/7.x/7.2.1
)
if not exist "apache-maven-%M2_VERSION%-bin.zip" (
    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%CURRENT_DIR%\download-source.ps1'" apache-maven-%M2_VERSION%-bin.zip http://mirrors.m247.ro/apache/maven/maven-3/3.3.9/binaries
)
if not exist "apache-tomcat-%TOMCAT_VERSION%.zip" (
    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%CURRENT_DIR%\download-source.ps1'" apache-tomcat-%TOMCAT_VERSION%.zip http://mirror.evowise.com/apache/tomcat/tomcat-8/v8.5.8/bin
)
if not exist "ideaIU-2016.3.exe" (
    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%CURRENT_DIR%\download-source.ps1'" ideaIU-2016.3.exe https://download.jetbrains.com/idea
)

rem TODO https://intellij-support.jetbrains.com/hc/en-us/articles/206827139-Silent-or-Unattended-installation-on-Windows
rem TODO add all versions in config file

pause
