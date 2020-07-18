# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName "jolie-$version" -FileFullPath "$toolsDir\jolie-$version.jar" -Url "https://github.com/jolie/jolie/releases/download/v$version/jolie-$version.jar"

$installationPath = "$toolsDir\dist\jolie" 
Write-Output "Checking environment..."
if( Test-Path $installationPath -PathType Container ) {
  Write-Output "Removing old files..."
  Remove-Item -Recurse -Force $installationPath
}

Set-Location -Path $toolsDir
Write-Output "Extracting Jolie files from jar..."
jar xf "$toolsDir\jolie-$version.jar" dist.zip
Write-Output "Copying Jolie files to destination..."
Get-ChocolateyUnzip -FileFullPath "$toolsDir\dist.zip" -Destination $toolsDir
New-Item -Path "$toolsDir\dist\jolie" -Name "jolie\bin" -ItemType "directory"
Copy-Item -Path "$toolsDir\dist\launchers\*" -Destination "$toolsDir\dist\jolie\jolie\bin"
Remove-Item "$toolsDir\dist\launchers\*" -Recurse
Remove-Item "$toolsDir\dist\launchers"
Write-Output "Setting environment..."
Install-ChocolateyEnvironmentVariable "JOLIE_HOME" "$installationPath" Machine
Install-ChocolateyPath $installationPath\jolie\bin -PathType 'Machine'