$env:src = "~\src"
Import-Module $env:src\dotfiles\psmodules\add_to_profile.psm1
Add-ToProfile $env:src\dotfiles\files\paths.ps1
Add-ToProfile $env:src\dotfiles\files\env.ps1
Add-ToProfile $env:src\dotfiles\files\load_modules.ps1

# Delay loading PoshGit for speed. 
function Enable-PoshGit {
	Import-Module posh-git
}
New-Alias pg    Enable-PoshGit

Set-Alias code codium  # Prefer Codium

# You can pry my unix commands out of my cold dead fingers
Set-Alias which get-command
# Reject Windows heritage, act like Vi
# Set-PSReadlineOption -HistorySavePath $env:src\PSHistory.log
Set-PSReadlineOption -BellStyle Visual
Set-PSReadlineOption -ViModeIndicator Prompt
Set-PSReadlineOption -EditMode Vi

Write-Host "+ Type 'pg' to enable PoshGit"
Write-Host 'See $env:realProfile for version controlled profile file.'
# Let's face it, I'm about to cd into my source directory
if((Get-Location).Path -eq $HOME){ cd $env:src }

function Get-JournalAgenda() {
    # Write-Host "Reading from $HOME\Journal\{YYYY}\{MM}-{DD}.md"
    agenda.exe -path "$HOME\Journal\{YYYY}\{MM}-{DD}.md"
}
New-Alias today Get-JournalAgenda