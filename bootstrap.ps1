# Setup my PowerShell Profile (on Windows)
if(-Not(Test-Path -Path $profile)) {
  New-Item -Path "$profile" -ItemType File
}
$sourceMeFile = "$pwd\Microsoft.PowerShell_profile.ps1"
$sourceMeLine = '$profileContents = [string]::join([environment]::newline, (get-content -path'
$sourceMeLine += $sourceMeFile
$sourceMeLine += '));invoke-expression $profileContents'

Write-Host $sourceMeLine

$profileContents = Get-Content $profile 
if(! $profileContents -contains $sourceMeLine) {
  Add-Content -Path $profile -Value $sourceMeLine
}
# Install Chocolatey

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

# Vault for secret management
# ... and really for coding better intergrations i.e. for RobotFramework
if($false) {
  choco install consul
  choco install vault
}

# OWASP ZAP for web application security scanning
if($false) {
  choco install zap
}