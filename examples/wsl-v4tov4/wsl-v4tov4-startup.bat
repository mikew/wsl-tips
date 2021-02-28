@REM Change to current script directory.
cd /D "%~dp0"

@REM This may well be different in another use case. Currently I'm using
@REM systemd to bring up ssh (and more), through /etc/profile.d. So a login shell
@REM must be created, and it seems _some_ time is needed.
wsl --exec bash -l -c "sleep 10"

@REM Remove any old rules.
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '.\wsl-v4tov4.ps1' 'reset'";

@REM Add rules.
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '.\wsl-v4tov4.ps1'";

@REM Always helpful when debugging.
pause

exit