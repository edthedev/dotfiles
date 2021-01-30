# .EXAMPLE
# . C:\src\dotfiles\Microsoft.PowerShell_profile.ps1

Import-Module posh-git
# Courtesty of MKletz
# Get-ChildItem -Path 'C:\Repos' -Filter "*.psd1" -Recurse | ForEach-Object -Process {
#     $Path = Split-Path -Path $_.Directory -Parent
#     $env:PSModulePath = $env:PSModulePath + ";$($Path)"
#}
$env:PSModulePath = $env:PSModulePath.Replace("\\ad.uillinois.edu\techsvc\home\$($ENV:USERNAME)\Documents\PowerShell\Modules;",'')

if($IsWindows -eq "") {
	# Bootstrap for older PowerShell
	$IsWindows = ($env:OS -eq "Windows_NT")
}
if($IsWindows){
	# Some Paths that are annoying to find/restore if the installer fails
	$ENV:PATH+=";C:\Program Files\Microsoft VS Code\bin" # One Editor to rule them all
	$ENV:PATH+=";C:\Program Files\Git\cmd" # Version control is nice.
	$ENV:PATH+=";C:\ProgramData\chocolatey\bin" # Package management is nice.
	$ENV:PATH+=";C:\PENGUIN" # Flag to ensure my profile kicked in.
}

# Import some home grown PowerShell modules, if they are installed.
$modPaths = @("C:\src\dotfiles\ToyBox\toybox.psm1")
$modPaths | ForEach-Object {
  $_ | Format-Table
  if(Test-Path -Path $_) {
    Import-Module $_
    Write-Host "Loaded $_"
  }
}

# Linux-like up/down in shell
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward 
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward 
Set-PSReadlineOption -HistorySavePath c:\temp\PSHistory.log

. C:\src\minion\minion_ps_alias.ps1

cd c:\src
