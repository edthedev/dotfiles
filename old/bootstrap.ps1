<#
.SYNOPSIS

Setup my Windows PowerShell environment.

.DESCRIPTION

.NOTES

Relies heavily on the Chocolatey package manager.

#>

param(
  # [Parameter(Mandatory=$true, HelpMessage="Install Development Tools")]
  [switch]$dev_tools,
  # [Parameter(Mandatory=$true, HelpMessage="Install Modeling Tools")]
  [switch]$archi,
  # [Parameter(Mandatory=$true, HelpMessage="Install Vim")]
  [switch]$vim,
  # [Parameter(Mandatory=$true, HelpMessage="Setup PowerShell Profile")]
  [switch]$profile,
  [switch]$fav_ps_modules
)

## Install SSH client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

## Always Install Chocolatey if missing
$testchoco = powershell choco -v
if(-not($testchoco)){
  Write-Output "Seems Chocolatey is not installed, installing now..."
  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
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

if($vim){
  ./install/vim.ps1
}

if($profile){
  ./install/profile.ps1
}

if($fav_ps_modules) {
  Write-Host "Reminder: Need to install these modules with admin escalation."
  ./install/admin/favorite-ps-modules.ps1
}
