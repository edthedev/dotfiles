" -------------------------------------------------------
"
"       EdTheDev's .vimrc 
"
" -------------------------------------------------------

" Let the leader key be ,  
let mapleader=","

" Easier Ex commands
nnoremap ; :

" iPad and Android keyboards have no ESC Key
inoremap ii <esc>

set smarttab

set nocompatible              " be iMproved, required

set omnifunc=syntaxcomplete#Complete

filetype off                  " required

" =================
" Here be Plugins!
" =================
call plug#begin('~/.vim/plugged')

" Markdown highlighting
Plugin 'tpope/vim-markdown'
" let g:markdown_github_languages = ['sh', 'python']

" Distraction free writing.
Plugin 'junegunn/goyo.vim'
nnoremap <leader>w :Goyo<Cr>


" Better status line.
Plugin 'bling/vim-airline'

" Plugin 'Windows-PowerShell-Syntax-Plugin'

" PowerShell Highlighting and detection
Plugin 'pprovost/vim-ps1'

call vundle#end()
filetype plugin indent on     " required for Vundle Bundle

" If not something else, then assume Markdown
set filetype=markdown
set syntax=markdown

" Don't show tabs for HTML files. Do show trailing spaces."
au FileType html set nolist
au FileType javascript set nolist

set softtabstop=4 " makes the spaces feel like real tabs

" Sensible default for everything else.
set tabstop=2
set shiftwidth=2

colorscheme slate
