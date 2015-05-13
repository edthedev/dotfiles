if [ ! -d "~/dotfiles" ]; then
	cd ~; git clone git@github.com:edthedev/dotfiles.git
fi

if [ ! -f "~/.zshrc" ]; then
	ln -s ~/dotfiles/zshrc ~/.zshrc
fi

if [ ! -f "~/dotfiles/antigen/README.md" ]; then
	cd ~/dotfiles/antigen;git submodule update --init
fi

if [ ! -f "~/.vimrc" ]; then
	ln -s ~/dotfiles/vimrc ~/.vimrc
fi

if [ ! -d "~/.vim/bundle" ]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +BundleInstall +qall
fi
