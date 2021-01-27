<#
.SYNOPSIS

Setup my Windows PowerShell environment.

.DESCRIPTION

.NOTES

Relies heavily on the Chocolatey package manager.

#>

param(
  [Parameter(Mandatory=$true, HelpMessage="Install Development Tools")]
  [switch]$dev_tools,
  [Parameter(Mandatory=$true, HelpMessage="Install Modeling Tools")]
  [switch]$archi,
)

# Setup my PowerShell Profile (on Windows)
if(-Not(Test-Path -Path $profile)) {
  New-Item -Path "$profile" -ItemType File
}

$sourceMeFile = "$pwd\Microsoft.PowerShell_profile.ps1"
$sourceMeLine = '$profileContents = [string]::join([environment]::newline, (get-content -path'
$sourceMeLine += $sourceMeFile
$sourceMeLine += '));invoke-expression $profileContents'

$doneFlagFile = "./DONE.md"
$doBootStrap = -Not (Test-Path -Path $doneFlagFile)

$profileContents = Get-Content $profile 
if(! $profileContents -contains $sourceMeLine) {
  Add-Content -Path $profile -Value $sourceMeLine
}

## Install Chocolatey
$testchoco = powershell choco -v
if(-not($testchoco)){
  Write-Output "Seems Chocolatey is not installed, installing now..."
  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install Python3 and Pip

# Install Stub PowerShell Profile that sources the one from DotFiles

# Install profile for Windows Terminal
$destFile = "C:\Users\delaport\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json"
if(-Not(Test-Path -Path $destFile)) {
  Copy-Item -Path ./profiles.json -Destination $destFile
} else {
  # Brute force ensure we update our git copy once in awhile.
  Copy-Item -Path $destFile -Destination ./profiles.json
}

# OWASP ZAP for web application security scanning
if($false) {
  choco install zap
}

## TODO: Can I set this via command line: chrome://flags/#enable-force-dark 

if($doBootStrap) {
  # DONE!
  New-Item -ItemType File -Path $doneFlagFile
}

# ArchiMate for enterprise modeling
if($archi) {
  choco install archi
}

# Install dev tools
if($dev_tools){
  ./install/dev.ps1
}

PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force

choco install vim