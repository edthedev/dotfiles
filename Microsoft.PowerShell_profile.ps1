# .EXAMPLE
# . C:\src\dotfiles\Microsoft.PowerShell_profile.ps1

# Courtesty of MKletz
# Get-ChildItem -Path 'C:\Repos' -Filter "*.psd1" -Recurse | ForEach-Object -Process {
#     $Path = Split-Path -Path $_.Directory -Parent
#     $env:PSModulePath = $env:PSModulePath + ";$($Path)"
#}
# $env:PSModulePath = $env:PSModulePath.Replace("\\ad.uillinois.edu\techsvc\home\$($ENV:USERNAME)\Documents\PowerShell\Modules;",'')

if($IsWindows -eq "") {
	# Bootstrap for older PowerShell
	$IsWindows = ($env:OS -eq "Windows_NT")
}

#if($IsWindows){
#	# Some Paths that are annoying to find/restore if the installer fails
#	$ENV:PATH+=";C:\Program Files\Microsoft VS Code\bin" # One Editor to rule them all
#	$ENV:PATH+=";C:\Program Files\Git\cmd" # Version control is nice.
#	$ENV:PATH+=";C:\ProgramData\chocolatey\bin" # Package management is nice.
#	$ENV:PATH+=";C:\PENGUIN" # Flag to ensure my profile kicked in.
#}

$env:Journal = "~\Journal\2021" # allows cd $env:journal

# Import some home grown PowerShell modules, if they are installed.
$modPaths = Get-Childitem -Path "c:\src\dotfiles\psmodules"
$modPaths += Get-Childitem -Path "c:\src\minion\psmodule"
if($modPaths.length -eq 0){
	Write-Host "No modules found."
}
$modPaths | ForEach-Object {
	$fileName = $_.FullName
	Import-Module $fileName
	Write-Host ">> Loaded $fileName"
}
#}
# $env:PSModulePath = $env:PSModulePath + ";c:\src\dotfiles\psmodules"


# Linux-like up/down in shell
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward 
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward 
Set-PSReadlineOption -HistorySavePath c:\temp\PSHistory.log

# Minion alias commands - 'today'
. C:\src\minion\profiles\alias.ps1
# Add Minion go executable to path.
. C:\src\minion\profiles\path.ps1

# Unix dies hard.
New-Alias which get-command

# Delay loading PoshGit for speed. 
function Enable-PoshGit {
	Import-Module posh-git
}
New-Alias pg    Enable-PoshGit
Write-Host "+ Type 'pg' to enable PoshGit"


if((Get-Location).Path -eq $HOME){
	cd c:\src
}
