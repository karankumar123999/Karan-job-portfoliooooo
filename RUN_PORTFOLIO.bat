@echo off
setlocal
cd /d "%~dp0"
echo ========================================
echo   Karan Kumar - Portfolio Launcher
echo ========================================
echo.
if not exist package.json (
  echo ERROR: package.json not found. Extract the entire ZIP first.
  pause
  exit /b 1
)
if not exist node_modules (
  echo Installing required packages for the first run...
  call npm install
  if errorlevel 1 goto failed
)
echo Clearing Vite cache and starting the website...
if exist node_modules\.vite rmdir /s /q node_modules\.vite
call npm run dev -- --force --host 127.0.0.1
if errorlevel 1 goto failed
goto end
:failed
echo.
echo Startup failed. Check the error shown above.
echo Make sure Node.js LTS is installed and internet is available for npm install.
pause
:end
endlocal
