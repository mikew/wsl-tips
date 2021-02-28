schtasks /create /rl highest /sc onlogon /tn wsl-v4tov4 /tr "%~dp0\wsl-v4tov4-startup.bat"
pause