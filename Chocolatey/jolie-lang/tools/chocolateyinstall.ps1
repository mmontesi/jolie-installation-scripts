# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installationPath = "C:\Jolie" 
$params = "$env:chocolateyPackageParameters" 
$params = (ConvertFrom-StringData $params.Replace(";", "`n")) 
if ($params.installdir -ne $null) {
  $installationPath = $params.installdir
}

Write-Output "Checking environment..."
if( Test-Path $installationPath -PathType Container ) {
  Write-Output "Removing old files..."
  Remove-Item -Recurse -Force $installationPath
}
Write-Output "Installing Jolie v$version in $installationPath ..."
java -jar "$toolsDir\jolie-1.9.1.jar" /jh "$installationPath" /jl "$installationPath\jolie\bin" 
Install-ChocolateyEnvironmentVariable "JOLIE_HOME" "$installationPath" Machine
Install-ChocolateyPath $installationPath\jolie\bin -PathType 'Machine'