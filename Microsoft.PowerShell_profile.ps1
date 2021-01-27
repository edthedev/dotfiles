
## Setup reminder:
# code $profile
# Set-ExecutionPolicy RemoteSigned
# . C:\src\dotfiles\Microsoft.PowerShell_profile.ps1

Import-Module posh-git
# Courtesty of MKletz
# Get-ChildItem -Path 'C:\Repos' -Filter "*.psd1" -Recurse | ForEach-Object -Process {
#     $Path = Split-Path -Path $_.Directory -Parent
#     $env:PSModulePath = $env:PSModulePath + ";$($Path)"
#}
$env:PSModulePath = $env:PSModulePath.Replace("\\ad.uillinois.edu\techsvc\home\$($ENV:USERNAME)\Documents\PowerShell\Modules;",'')

# Kali linux env
$ENV:PATH +=":/home/delaport/development/flutter/bin" # Flutter in Kali under WSL

# Some Paths that are annoying to find/restore if the installer fails
$IsWindows = ($env:OS -eq "Windows_NT")
if($IsWindows){
	$ENV:PATH+=";C:\Program Files\Microsoft VS Code\bin" # One Editor to rule them all
	$ENV:PATH+=";C:\Program Files\Python38\Scripts\;C:\Program Files\Python38\" # Python latest as of 2019 December
	$ENV:PATH+=";C:\ProgramData\DockerDesktop\version-bin;C:\Program Files\Docker\Docker\Resources\bin" # Docker for R Studio and Jupyter
	$ENV:PATH+=";C:\Program Files (x86)\Common Files\Oracle\Java\javapath" # Don't remember why I still care about Java.
	$ENV:PATH+=";C:\Program Files\Git\cmd" # Version control is nice.
	$ENV:PATH+=";C:\ProgramData\chocolatey\bin" # Package management is nice.
	$ENV:PATH+=";C:\Program Files\nodejs" # KataKoda wants to add tools via npm
	$ENV:PATH+=";C:\PENGUIN" # Flag to ensure my profile kicked in.

	function Find-LargeFiles() {
		 Get-ChildItem c:\ -r| sort -descending -property length | select -first 10 name, Length, FullName
	}

	function List-DriveSpace() {
		Get-PSDrive C | Select-Object Used,Free
	}

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


function Export-VSCodeExtensions {
  code --list-extensions | Out-File -FilePath /src/dotfiles/vscode-extensions.txt
  Get-Content -Path /src/dotfiles/vscode-extensions.txt
}


# Aliases for Minion
if($IsWindows){
	New-Alias mn c:\src\minion\mn.ps1
}else{
	New-Alias mn ~/src/minion/mn.ps1
}

function New-JournalToday() {
	vim "$(mn -today)"
}
New-Alias today New-JournalToday
