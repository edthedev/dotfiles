
if [ ! -d ~/dotfiles ]
	cd ~; git clone git@github.com:edthedev/dotfiles.git
fi

if [ ! -f ~/.zshrc ]
	ln -s ~/dotfiles/zshrc ~/.zshrc
fi

if [ ! -d ~/dotfiles/antigen ]
	cd ~/dotfiles/antigen;git submodule update --init
fi

if [ ! -f ~/.vimrc ]
	ln -s ~/dotfiles/vimrc ~/.vimrc
fi

if [ ! -d ~/.vim/bundle  ]
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +BundleInstall +qall
fi
