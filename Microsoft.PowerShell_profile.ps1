# .EXAMPLE
# . C:\src\dotfiles\Microsoft.PowerShell_profile.ps1

# Courtesty of MKletz
# Get-ChildItem -Path 'C:\Repos' -Filter "*.psd1" -Recurse | ForEach-Object -Process {
#     $Path = Split-Path -Path $_.Directory -Parent
#     $env:PSModulePath = $env:PSModulePath + ";$($Path)"
#}
# $env:PSModulePath = $env:PSModulePath.Replace("\\ad.uillinois.edu\techsvc\home\$($ENV:USERNAME)\Documents\PowerShell\Modules;",'')

# No longer needed in PowerShell 7
if(-Not $IsWindows) {
 	# Bootstrap for older PowerShell
	Write-Host "***Bootstrapped Is Windows for older PowerShell***"
 	$IsWindows = ($env:OS -eq "Windows_NT")
}

$env:src = "~"
if($IsWindows){
	Write-Host "***Is Windows***"
  $env:src = "c:\src"
}

if($IsWindows){
	# Some Paths that are annoying to find/restore if the installer fails
	$ENV:PATH+=";C:\Program Files\Microsoft VS Code\bin" # One Editor to rule them all
	$ENV:PATH+=";C:\Program Files\Git\cmd" # Version control is nice.
	$ENV:PATH+=";C:\ProgramData\chocolatey\bin" # Package management is nice.
	$ENV:PATH+=";C:\bin\x16emu" # Package management is nice.
	$ENV:PATH+=";C:\Program Files (x86)\GnuWin32\bin" # GNU Utils - i.e. rm
	$ENV:PATH+=";C:\PENGUIN" # Flag to ensure my profile kicked in.
}


$env:Journal = "~\Journal\2021" # allows cd $env:journal
$env:minion = "$env:src\minion"

# Import some home grown PowerShell modules, if they are installed.
#
$modPaths = Get-Childitem -Path "$env:src\dotfiles\psmodules"
$modPaths += Get-Childitem -Path "$env:minion\psmodule"

# Windows Only Modules
if($IsWindows){
	$modPaths += Get-Childitem -Path "$env:src\dotfiles\win_psmodules"
}
if($modPaths.length -eq 0){
	Write-Host "No modules found."
}
$modPaths | ForEach-Object {
	$fileName = $_.FullName
	Import-Module $fileName
	Write-Host ">> Loaded $fileName"
}



# Linux-like up/down in shell
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward 
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward 
Set-PSReadlineOption -HistorySavePath $env:src\PSHistory.log

# Minion alias commands - 'today'
# . C:\src\minion\profiles\alias.ps1
. $env:minion\profiles\alias.ps1
# Add Minion go executable to path.
. $env:minion\profiles\path.ps1
# Add Minion to path
Write-Host "+ Added minion command to path."
$ENV:PATH+=";$env:minion\go" # Flag to ensure my profile kicked in.

# Unix dies hard.
New-Alias which get-command

# Delay loading PoshGit for speed. 
function Enable-PoshGit {
	Import-Module posh-git
}
New-Alias pg    Enable-PoshGit
Write-Host "+ Type 'pg' to enable PoshGit"

function Invoke-X16Emu {
	param(
		[string]$File
	)
	x16emu.exe -bas $File -keymap en-us
}

New-Alias x16   Invoke-X16Emu

if((Get-Location).Path -eq $HOME){
	cd $env:src
}

function Get-GitLog() {
	git log --oneline
}

function Get-GitStatus() {
	git status -b --short
}

function Get-JournalAgenda() {
	Get-Content $(Get-JournalFile -date $(Get-Date))
}

# Nice for git
New-Alias ol 		Get-GitLog
New-Alias st 		Get-GitStatus

# Dashboard
New-Alias dash   Get-MyDashboard # See dash.psm1
New-Alias agenda Get-JournalAgenda
