if [ ! -d ~/dotfiles ]; then
	echo "************** Cloning Dotfiles Directory"
	cd ~; git clone git@github.com:edthedev/dotfiles.git
fi

if [ ! -f ~/.ssh/id_rsa ]; then
	echo "************** Generate an SSH key"
	ssh-keygen
fi

if [ ! -f ~/.screenrc ]; then
	echo "************** Setup Screen"
	ln -s ~/dotfiles/screenrc ~/.screenrc
fi

if [ ! -f ~/.vimrc ]; then
	echo "************** Link Vimrc"
	ln -s ~/dotfiles/vimrc ~/.vimrc
fi

if [ -f ~/.vimrc ]; then
	echo "************** Configure Git to use Vim"
	git config --global core.editor /usr/bin/vim
fi

if [ -f ~/.gitconfig ]; then
	echo "************** Configure Git user"
	git config --global user.email "edward@delaporte.us"
	git config --global user.name "Edward Delaporte"
fi

echo "************** Reminder to setup GitHub key"
echo "https://github.com/settings/keys"
echo "vim .git/config -- add: url = git@github.com:edthedev/dotfiles.git"
cat ~/.ssh/id_rsa.pub
