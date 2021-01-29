<#
.SYNOPSIS

Setup EdTheDev's PowerShell Profile

.NOTES

#>

# Setup my PowerShell Profile (on Windows)
if(-Not(Test-Path -Path $profile)) {
  New-Item -Path "$profile" -ItemType File
}

# Install Stub PowerShell Profile that sources the one from DotFiles
$sourceMeFile = "$pwd\Microsoft.PowerShell_profile.ps1"
$sourceMeLine = '$profileContents = [string]::join([environment]::newline, (get-content -path '
$sourceMeLine += $sourceMeFile
$sourceMeLine += '));invoke-expression $profileContents'

# $doneFlagFile = "./DONE.md"
# $doBootStrap = -Not (Test-Path -Path $doneFlagFile)

$profileStuff = Get-Content -Path $profile 
if($profileStuff -Contains $sourceMeLine) {
    Write-Host "Found profile source line: $sourceMeLine"
    Write-Host "in file $profile"
}
else {
    Write-Host "Profile source line will be added to $profile"
    Add-Content -Path $profile -Value "" # Blank line to enforce newline.
    Add-Content -Path $profile -Value $sourceMeLine
}

# Install profile for Windows Terminal
# $destFile = "C:\Users\delaport\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json"
# if(-Not(Test-Path -Path $destFile)) {
#  Copy-Item -Path ./profiles.json -Destination $destFile
# } else {
#  # Brute force ensure we update our git copy once in awhile.
#  Copy-Item -Path $destFile -Destination ./profiles.json
#}

PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force