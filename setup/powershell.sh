if [ ! -f ~/.config/powershell/Microsoft.PowerShell_profile.ps1 ]; then
	echo "************** Link PowerShell profile"
	chsh --shell /usr/bin/pwsh
	mkdir -p ~/.config/powershell/
	ln -s ~/dotfiles/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1 
fi

chsh --shell /usr/bin/pwsh
