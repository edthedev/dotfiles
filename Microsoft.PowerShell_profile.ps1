# .EXAMPLE
# . C:\src\dotfiles\Microsoft.PowerShell_profile.ps1

# Courtesty of MKletz
# Get-ChildItem -Path 'C:\Repos' -Filter "*.psd1" -Recurse | ForEach-Object -Process {
#     $Path = Split-Path -Path $_.Directory -Parent
#     $env:PSModulePath = $env:PSModulePath + ";$($Path)"
#}
# $env:PSModulePath = $env:PSModulePath.Replace("\\ad.uillinois.edu\techsvc\home\$($ENV:USERNAME)\Documents\PowerShell\Modules;",'')

$env:src = "~\src"
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
	$ENV:PATH+=";$env:src\x16-demo\tools" # x16 python tools
	$ENV:PATH+=";$env:src\chart" # command line chart utility edthedev\chart
}
else {
	$ENV:PATH+=":$HOME/x16/x16-emulator" # x16 Emulator
	$ENV:PATH+=":$HOME/src/x16-demo/tools" # x16 python tools
}

# alias renumber $HOME/src/x16-demo/

$env:Journal = "~\Journal\2022" # allows cd $env:journal
$env:minion = "$env:src\minion"

# Import some home grown PowerShell modules, if they are installed.
#
$modPaths = Get-Childitem -ErrorAction Ignore -Path "$env:src\dotfiles\psmodules"
$modPaths += Get-Childitem -ErrorAction Ignore -Path "$env:minion\psmodule"

# https://github.com/uillinois-community/powershell-scripts
$modPaths += Get-Childitem -ErrorAction Ignore -Path "$env:src\powershell-scripts\modules"

# Windows Only Modules
if($IsWindows){
	$modPaths += Get-Childitem -ErrorAction Ignore -Path "$env:src\dotfiles\win_psmodules"
}
if($modPaths.length -eq 0){
	Write-Host "No modules found."
}
$modPaths | ForEach-Object {
	$fileName = $_.FullName
	if($filename -Like "*.psm1") {
		Import-Module $fileName
		Write-Host ">> Loaded $fileName"
	}
}



# Linux-like up/down in shell
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward 
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward 
Set-PSReadlineOption -HistorySavePath $env:src\PSHistory.log

# Minion alias commands - 'today'
# . C:\src\minion\profiles\alias.ps1
# . $env:minion\profiles\alias.ps1
# Add Minion go executable to path.
# . $env:minion\profiles\path.ps1
# Add Minion to path
# Write-Host "+ Added minion command to path."
# if($IsWindows){
# 	$ENV:PATH+=";$env:minion\go" # Flag to ensure my profile kicked in.
# }

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

# Tell my scripts which GitHub repositories to look in.
$env:GITHUB_USERNAME = 'edthedev'
$env:GITHUB_REPOS = @(
	'techservicesillinois/SecOps-Tools', 
	'techservicesillinois/secdev-job-aids', 
	'techservicesillinois/awscli-login', 
	'techservicesillinois/farmit',
	'uillinois-community/uillinois-community.github.io',
	'techservicesillinois/SecOps-Powershell-CSOC'
) -join ' '
$ENV:TS_REPOS = $ENV:GITHUB_REPOS.split(' ') | Where { $_ -like 'techser*' }

# Todo List
$ENV:PATH+=";$env:src\todolist" # todo list utility edthedev\todolist
$env:todolist = "C:\Users\delaport\Journal\2022"
# New-Alias todo      todolist

# Nice for git
New-Alias ol 		Get-GitLog
New-Alias st 		Get-GitStatus

# Dashboard
New-Alias dash   Show-MyDashboard # from dash.psm1
New-Alias agenda Get-JournalAgenda # from minion_go.psm1

function Invoke-FixWslVPN {
	Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect Secure Mobility Client Virtual Miniport Adapter for Windows x64"} | Set-NetIPInterface -InterfaceMetric 6000
}
