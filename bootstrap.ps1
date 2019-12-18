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

