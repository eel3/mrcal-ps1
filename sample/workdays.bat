@echo off
powershell -ExecutionPolicy RemoteSigned -File "%~dpn0.ps1" %*
