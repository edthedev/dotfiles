
# This setup script is for Kali Linux running under Linux subsystem for Windows
# Because yeah, I'm **that** guy.
## It makes total sense, I swear.

# Setup git
sudo apt-get install git install vim
git config --global user.email "edward@delaporte.us"
git config --global user.name "Edward Delaporte"
git config --global core.editor /usr/bin/vim

# Setup PowerShell
sudo apt-get install powershell
chsh --shell /usr/bin/pwsh
mkdir -p /home/delaport/.config/powershell/
ln -s ~/dotfiles/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1 
