Write-Output "Jolie Windows Sandbox installer"
Write-Output "-------------------------------"
Write-Output "Creating destination dir..."
mkdir C:\Users\WDAGUtilityAccount\jolie_fast_installer > $null
cd C:\Users\WDAGUtilityAccount\jolie_fast_installer > $null
Write-Output "Installing Java 11..."
Invoke-WebRequest -Uri https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.7%2B10.2/OpenJDK11U-jre_x64_windows_hotspot_11.0.7_10.zip -OutFile .\OpenJDK11U-jre_x64_windows_hotspot_11.0.7_10.zip > $null
Expand-Archive -Path .\OpenJDK11U-jre_x64_windows_hotspot_11.0.7_10.zip -DestinationPath . > $null
$env:Path += "C:\Users\WDAGUtilityAccount\jolie_fast_installer\jdk-11.0.7+10-jre\bin;" > $null
Write-Output "Installing Jolie..."
Invoke-WebRequest -Uri https://github.com/jolie/jolie/releases/download/v1.9.1/jolie-1.9.1.jar -OutFile .\jolie-1.9.1.jar > $null
java -jar jolie-1.9.1.jar /jh C:\Users\WDAGUtilityAccount\jolie_fast_installer\jolie /jl C:\Users\WDAGUtilityAccount\jolie_fast_installer\jolie\bin > $null
$env:Path += "C:\Users\WDAGUtilityAccount\jolie_fast_installer\jolie\bin" > $null
$env:JOLIE_HOME="C:\Users\WDAGUtilityAccount\jolie_fast_installer\jolie" > $null
Write-Output "Done!"