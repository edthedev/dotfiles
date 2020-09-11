# Reminder to future self:
# Step 0: git clone https://github.com/edthedev/dotfiles
# Step 1: Run this bootstrap script.

echo "Git, vi are already installed."

mkdir -p ~/.installed

## Setup Git and Vim
if [ ! -d ~/dotfiles ]; then
	sudo apt-get install git vim-nox
	cd ~; git clone git@github.com:edthedev/dotfiles.git
fi

# sudo apt-get install vim-nox

if [ ! -f ~/.vimrc ]; then
	git config --global user.email "edward@delaporte.us"
	git config --global user.name "Edward Delaporte"
	git config --global core.editor /usr/bin/vim
	ln -s ~/dotfiles/vimrc ~/.vimrc
fi

if [ ! -f ~/.installed/i3 ]; then
	sudo apt-get install i3
	touch ~/.installed/i3
fi

## Setup PowerShell
if [ ! -f ~/.config/powershell/Microsoft.PowerShell_profile.ps1 ]; then
	sudo apt-get install powershell
	chsh --shell /usr/bin/pwsh
	mkdir -p ~/.config/powershell/
	ln -s ~/dotfiles/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1 
fi

## Create SSH Keys
if [ ! -f ~/.ssh/id_rsa ]; then
	ssh-keygen
fi

## Setup Remote Access
# if [ ! -f ~/id_rsa.pub ]; then
# 	cp ~/dotfiles/id_rsa.pub ~/id_rsa.pub
#	chmod go+r ~/id_rsa.pub
# fi

## Setup Screen
if [ ! -f ~/.screenrc ]; then
	sudo apt-get install screen
	ln -s ~/dotfiles/screenrc ~/.screenrc
fi

## Setup Vundle for Vim
if [ ! -d ~/.vim/bundle ]; then
 	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +BundleInstall +qall
fi

if [ ! -d ~/.installed/code ]; then
	# sudo apt install snapd
	# sudo snap install --classic code
	wget https://packagecloud.io/headmelted/codebuilds/gpgkey -O - | sudo apt-key add -
  curl -L https://raw.githubusercontent.com/headmelted/codebuilds/master/docs/installers/apt.sh | sudo bash
	touch ~/.installed/code
fi

echo "https://github.com/settings/keys"
echo "vim .git/config -- add: url = git@github.com:edthedev/dotfiles.git"
cat ~/.ssh/id_rsa.pub

ls -al ~/.installed
