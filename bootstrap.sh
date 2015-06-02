# Reminder to future self:
# You can scp just this file to the destination host,
#   and then run it.

if [ ! -f ~/.ssh/id_rsa ]; then
	ssh-keygen
fi

if [ ! -d ~/dotfiles ]; then
	cd ~; git clone git@github.com:edthedev/dotfiles.git
	cp ~/dotfiles/id_rsa.pub ~/id_rsa.pub
	chmod go+r ~/id_rsa.pub
fi

if [ ! -f ~/.zshrc ]; then
	ln -s ~/dotfiles/zshrc ~/.zshrc
fi

if [ ! -f ~/dotfiles/antigen/README.md ]; then
	cd ~/dotfiles;git submodule update --init
fi

if [ ! -f ~/.vimrc ]; then
	ln -s ~/dotfiles/vimrc ~/.vimrc
fi

if [ ! -d ~/.vim/bundle ]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +BundleInstall +qall
fi
