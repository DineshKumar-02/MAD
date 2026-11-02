@echo off
title MAD Lab Master App
echo ========================================================
echo   Launching MAD Lab All-in-One Application in Chrome...
echo ========================================================
cd /d "%~dp0flutter_application_1"
flutter run -d chrome
pause

