$env:src = "$HOME\src"
$env:dotfiles = "$HOME\dotfiles"
Import-Module $env:dotfiles\psmodules\add_to_profile.psm1
Add-ToProfile $env:dotfiles\files\paths.ps1
Add-ToProfile $env:dotfiles\files\env.ps1

# Delay loading PoshGit for speed. 
function Enable-PoshGit {
	Import-Module posh-git
}
New-Alias pg    Enable-PoshGit

Set-Alias code codium  # Prefer Codium

# Dashboard
New-Alias dash   Show-MyDashboard # from dash.psm1
New-Alias today Get-JournalAgenda

# You can pry my unix commands out of my cold dead fingers
Set-Alias which get-command
# Reject Windows heritage, act like Vi
# Set-PSReadlineOption -HistorySavePath $env:src\PSHistory.log
Set-PSReadlineOption -BellStyle Visual
Set-PSReadlineOption -ViModeIndicator Prompt
Set-PSReadlineOption -EditMode Vi

Write-Host "+ Type 'pg' to enable PoshGit"
Write-Host 'See $env:realProfile for version controlled profile file.'

# Load some modules
$env:psmodules = "$env:dotfiles\psmodules"
Import-Module "$env:psmodules\dash.psm1"
Import-Module $env:PSModules\file_management.psm1
Import-Module "$env:psmodules\fix_vpn.psm1"

# Let's face it, I'm about to cd into my source directory
if((Get-Location).Path -eq $HOME){ cd $env:src }

function Get-JournalAgenda() {
    # Write-Host "Reading from $HOME\Journal\{YYYY}\{MM}-{DD}.md"
    agenda.exe -path "$HOME\Journal\{YYYY}\{MM}-{DD}.md"
}
New-Alias today Get-JournalAgenda
