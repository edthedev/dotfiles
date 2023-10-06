#WebDriverException: Message: nknown error: cannot determine loading status .EXAMPLE
# . C:\src\dotfiles\Microsoft.PowerShell_profile.ps1

# Courtesty of MKletz
# Get-ChildItem -Path 'C:\Repos' -Filter "*.psd1" -Recurse | ForEach-Object -Process {
#     $Path = Split-Path -Path $_.Directory -Parent
#     $env:PSModulePath = $env:PSModulePath + ";$($Path)"
#}
# $env:PSModulePath = $env:PSModulePath.Replace("\\ad.uillinois.edu\techsvc\home\$($ENV:USERNAME)\Documents\PowerShell\Modules;",'')

function Add-ToProfile {
    param (
        $Path
    )
	$profileContents = [string]::join([environment]::newline, (get-content -path $Path))
	invoke-expression $profileContents
}


$env:src = "~\src"
if($IsWindows){
  $env:src = "c:\src"
}

Add-ToProfile $env:src\dotfiles\files\paths.ps1
Add-ToProfile $env:src\dotfiles\files\env.ps1

# You can pry my unix commands out of my cold dead fingers
Set-Alias which get-command

# Linux-like up/down in shell
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward 
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward 
Set-PSReadlineOption -HistorySavePath $env:src\PSHistory.log

# Delay loading PoshGit for speed. 
function Enable-PoshGit {
	Import-Module posh-git
}
New-Alias pg    Enable-PoshGit
Write-Host "+ Type 'pg' to enable PoshGit"


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
	'techservicesillinois/SecOps-Powershell-CSOC',
	'techservicesillinois/SecOps-Powershell-CISDSC',
	'techservicesillinois/secops-splunk-null-router'
) -join ' '
$ENV:TS_REPOS = $ENV:GITHUB_REPOS.split(' ') | Where { $_ -like 'techser*' }


# Nice for git
New-Alias ol 		Get-GitLog
New-Alias st 		Get-GitStatus

# Dashboard
New-Alias dash   Show-MyDashboard # from dash.psm1

function Get-JournalAgenda() {
	agenda.exe -path "$HOME/Journal/{YYYY}/{MM}-{DD}.md"
}
New-Alias today Get-JournalAgenda

function Invoke-FixWslVPN {
	Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect Secure Mobility Client Virtual Miniport Adapter for Windows x64"} | Set-NetIPInterface -InterfaceMetric 6000
}

# Write-Host "Real profile file is at $env:realProfile ($$env:realProfile)"