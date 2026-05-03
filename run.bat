@echo off
echo ========================================
echo   Secure Steganography - Starting...
echo ========================================
echo.
echo Server shuru hocche, please wait...
echo.

set JAVA_HOME=C:\Users\hp\.jdks\openjdk-25
set MVN="C:\Program Files\JetBrains\IntelliJ IDEA 2025.2.2\plugins\maven\lib\maven3\bin\mvn.cmd"

%MVN% tomcat7:run

echo.
echo Server bondho hoye gache.
pause
