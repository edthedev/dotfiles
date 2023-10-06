
$env:src = "~\src"
Import-Module $env:src\dotfiles\psmodules\add_to_profile.psm1
Add-ToProfile $env:src\dotfiles\files\paths.ps1
Add-ToProfile $env:src\dotfiles\files\env.ps1
Add-ToProfile $env:src\dotfiles\files\load_modules.ps1

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

# Let's face it, I'm about to cd into my source directory
if((Get-Location).Path -eq $HOME){
	cd $env:src
}

# Dashboard
New-Alias dash   Show-MyDashboard # from dash.psm1

function Get-JournalAgenda() {
	agenda.exe -path "$HOME/Journal/{YYYY}/{MM}-{DD}.md"
}
New-Alias today Get-JournalAgenda
# Write-Host "Real profile file is at $env:realProfile ($$env:realProfile)"