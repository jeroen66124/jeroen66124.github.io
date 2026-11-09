@echo off
rem Downloads JDK 17 and the Android SDK into the tools folder and writes local.properties,
rem so a fresh clone can be built with build.bat. Nothing is written to C:.
rem Usage: setup.bat   (run once after cloning; running it again skips what is already there)
rem Gradle and the libraries are downloaded into tools\gradle-home by the first build.bat.
setlocal
cd /d "%~dp0"
set "TOOLS=%~dp0tools"
set "SDK=%TOOLS%\android-sdk"
set "DL=%TOOLS%\downloads"
set "JAVA_HOME=%TOOLS%\jdk-17"
set "SDKMANAGER=%SDK%\cmdline-tools\latest\bin\sdkmanager.bat"
set "JDK_URL=https://api.adoptium.net/v3/binary/latest/17/ga/windows/x64/jdk/hotspot/normal/eclipse"
set "CLT_URL=https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip"

if not exist "%DL%" mkdir "%DL%"

if exist "%JAVA_HOME%\bin\java.exe" goto :have_jdk
echo.
echo === Downloading JDK 17 (about 190 MB)
curl.exe -fL -o "%DL%\jdk17.zip" "%JDK_URL%" || goto :failed
if exist "%DL%\jdk" rmdir /s /q "%DL%\jdk"
mkdir "%DL%\jdk"
tar.exe -xf "%DL%\jdk17.zip" -C "%DL%\jdk" || goto :failed
rem The zip holds one folder named after the exact version, such as jdk-17.0.21+9.
for /d %%D in ("%DL%\jdk\*") do move "%%D" "%JAVA_HOME%" >nul
if not exist "%JAVA_HOME%\bin\java.exe" goto :failed
:have_jdk
echo JDK 17: ok

if exist "%SDKMANAGER%" goto :have_clt
echo.
echo === Downloading Android command-line tools (about 150 MB)
curl.exe -fL -o "%DL%\cmdline-tools.zip" "%CLT_URL%" || goto :failed
if exist "%DL%\clt" rmdir /s /q "%DL%\clt"
mkdir "%DL%\clt"
tar.exe -xf "%DL%\cmdline-tools.zip" -C "%DL%\clt" || goto :failed
if not exist "%SDK%\cmdline-tools" mkdir "%SDK%\cmdline-tools"
move "%DL%\clt\cmdline-tools" "%SDK%\cmdline-tools\latest" >nul || goto :failed
:have_clt
echo Android command-line tools: ok

if exist "%SDK%\licenses\android-sdk-license" goto :have_licenses
echo.
echo === Android SDK licences
echo Read each licence and type y to accept it. The SDK can't be installed without them.
call "%SDKMANAGER%" --sdk_root="%SDK%" --licenses
if not exist "%SDK%\licenses\android-sdk-license" goto :failed
:have_licenses

if exist "%SDK%\platforms\android-35" if exist "%SDK%\build-tools\34.0.0" if exist "%SDK%\platform-tools\adb.exe" goto :have_sdk
echo.
echo === Installing Android SDK packages (about 250 MB)
call "%SDKMANAGER%" --sdk_root="%SDK%" "platforms;android-35" "build-tools;34.0.0" "platform-tools" || goto :failed
:have_sdk
echo Android SDK: ok

rem Forward slashes, because a backslash is an escape character in .properties files.
> local.properties echo sdk.dir=%SDK:\=/%
echo local.properties: ok

rmdir /s /q "%DL%"
echo.
echo Setup finished. Run build.bat to build the launcher.
exit /b 0

:failed
echo.
echo Setup failed, see the messages above. Run setup.bat again to retry; finished steps are skipped.
exit /b 1
