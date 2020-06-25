# Windows Sandox installer

Windows Sandbox (https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview) can be used to test Jolie installation on a clean environment.

__Manual invocation__

Start a new sandbox, open a command prompt and run this:

    PowerShell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mmontesi/jolie-installation-scripts/master/WindowsSandbox/windows-sandbox-installer.ps1'))"

__Sandbox automation__

_TBD_
