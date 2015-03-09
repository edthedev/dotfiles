ln -s ~/dotfiles/zshrc ~/.zshrc
cd ~/dotfiles/antigen;git submodule update --init

ln -s ~/dotfiles/vimrc ~/.vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
