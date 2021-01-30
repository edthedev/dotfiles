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
Plug 'tpope/vim-markdown'
" let g:markdown_github_languages = ['sh', 'python']

" Distraction free writing.
Plug 'junegunn/goyo.vim'

" Better status line.
Plug 'bling/vim-airline'

" Plugin 'Windows-PowerShell-Syntax-Plugin'

" PowerShell Highlighting and detection
Plug 'pprovost/vim-ps1'

call plug#end()

filetype plugin indent on     " required for Vundle Bundle

nnoremap <leader>w :Goyo<Cr>

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
set number
