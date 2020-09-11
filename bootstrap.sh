# Reminder to future self:
# Step 1: ssh-keygen on remote host.
# Step 0: Remove any existing .vim, .vimrc and .zsrhrc on remote host.
# Step 2: Add ssh pubkey to GitHub as deploy key.
# Step 3: clone the repo.
# Step 4: Run this bootstrap script.

# You can scp just this file to the destination host,
#   and then run it.

## Setup Git and Vim
if [ ! -d ~/dotfiles ]; then
	sudo apt-get install git install vim
	# TODO: Consider vim-nox to resolve 'needs python' error from some of my vundle plugins.
	git config --global user.email "edward@delaporte.us"
	git config --global user.name "Edward Delaporte"
	git config --global core.editor /usr/bin/vim
	cd ~; git clone git@github.com:edthedev/dotfiles.git
fi
if [ ! -f ~/.vimrc ]; then
	ln -s ~/dotfiles/vimrc ~/.vimrc
fi

## Setup PowerShell
if [ ! -f ~/.config/powershell/Microsoft.PowerShell_profile.ps1 ]; then
	sudo apt-get install powershell
	chsh --shell /usr/bin/pwsh
	mkdir -p /home/delaport/.config/powershell/
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

## Setup ZShell Profile
# if [ ! -f ~/.zshrc ]; then
# 	ln -s ~/dotfiles/zshrc ~/.zshrc
# fi
# if [ ! -f ~/dotfiles/antigen/README.md ]; then
# 	cd ~/dotfiles;git submodule update --init
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
