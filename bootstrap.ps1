# Setup my PowerShell Profile (on Windows)
if(-Not(Test-Path -Path $profile)) {
  New-Item -Path "$profile" -ItemType File
}
$sourceMeLine = "source $pwd/Microsoft.PowerShell_profile.ps1"
$profileContents = Get-Content $profile 
if(! $profileContents -contains $sourceMeLine) {
  Add-Content -Path $profile -Value $sourceMeLine
}
# Install Chocolatey

# Install Python3 and Pip

# Install Stub PowerShell Profile that sources the one from DotFiles

