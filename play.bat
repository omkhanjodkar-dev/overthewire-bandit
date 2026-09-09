@echo off
title OverTheWire Bandit Helper
python "%~dp0bandit.py"
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Press any key to exit...
    pause >nul
)
