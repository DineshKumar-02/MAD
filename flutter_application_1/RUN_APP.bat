@echo off
title MAD Lab Master App
echo ========================================================
echo   Launching MAD Lab All-in-One Application in Chrome...
echo ========================================================
cd /d "%~dp0"
flutter run -d chrome
pause

