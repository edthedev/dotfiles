## Setup PowerShell
if [ ! -f ~/.config/powershell/Microsoft.PowerShell_profile.ps1 ]; then
	echo "************** Install PowerShell and setup profile"
	sudo apt-get install powershell
	chsh --shell /usr/bin/pwsh
	mkdir -p ~/.config/powershell/
	ln -s ~/dotfiles/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1 
fi
