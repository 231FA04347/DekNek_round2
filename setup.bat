@echo off
REM Colors for Windows Command Prompt
setlocal enabledelayedexpansion

echo.
echo ===================================
echo    DEKNEK MERN Setup
echo ===================================
echo.

REM Install Backend Dependencies
echo Installing Backend dependencies...
cd Backend
call npm install
echo Backend dependencies installed!
echo.

REM Install Frontend Dependencies
echo Installing Frontend dependencies...
cd ..\Frontend
call npm install
echo Frontend dependencies installed!
echo.

REM Go back to root
cd ..

echo ===================================
echo Setup Complete!
echo ===================================
echo.
echo Next steps:
echo 1. Open Terminal 1: cd Backend && npm run dev
echo 2. Open Terminal 2: cd Frontend && npm run dev
echo 3. Open Browser: http://localhost:3000
echo.
echo Happy Coding! 
pause
