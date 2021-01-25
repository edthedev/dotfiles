" -------------------------------------------------------
"
"       EdTheDev's Minimal .vimrc 
"
"  Everything belongs in a Vundle plugin.
" -------------------------------------------------------

" When setting up on a new machine, remember to:
" cd ~
" git clone https://github.com/gmarik/Vundle.vim.git
" ~/.vim/bundle/Vundle.vim
" vim +BundleInstall +qall
"
" Automatically setup Vundle on first run
" if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
"     call system("git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle")
"     endif

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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" =================
" Here be Plugins!
" =================

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" EdTheDev's Minion file organizer.
" Plugin 'edthedev/minion'
" let g:minion_map_keys = 0


" Syntax helpers for ReStructuredText
" Plugin 'edthedev/rst-syntax.vim'

" EdTheDev's Vim configuration for Python PEP8
" Plugin 'edthedev/vim-pep8'
" let g:minion_todo_map_keys = 1


" let g:vimroom_ctermbackground = "black"

"Plugin 'fmoralesc/vim-pad'
" let g:pad_dir='~/Copy/notes'

" Low contrast color scheme for Gvim - much easier on the eyes.
" Plugin 'junegunn/seoul256.vim'

" Display tag (function/method) outline
" Plugin 'majutsushi/tagbar'
" nmap <leader>t :TagbarToggle<Cr>

" EdTheDev's Vim configuration for TODO list items.
" Plugin 'edthedev/vim-todo'
" let g:vim_todo_keys = 1

" Browsing files made easier.
" Plugin 'scrooloose/nerdtree'
" nmap <leader>r :NERDTreeToggle<CR>

" Async dispatch by Tim Pope
" Plugin 'tpope/vim-dispatch'

" Markdown highlighting
Plugin 'tpope/vim-markdown'
" let g:markdown_github_languages = ['sh', 'python']

"Plugin 'jceb/vim-orgmode'
"let g:org_todo_keywords=['TODO', 'DONE', 'WAITING', 'CANCELED']
"let g:org_agenda_files=['~/index.org']

" More obvious default behaviors
" Plugin 'edthedev/wordlike.vim'

" Plugin 'xolox/vim-notes'
" Add @Tag search support
"Bundle 'fmoralesc/vim-pad'
" let g:pad_dir='~/Copy/notes'

" Distraction free writing.
Plugin 'junegunn/goyo.vim'
nnoremap <leader>w :Goyo<Cr>

" Plugin 'vim-scripts/pylint-mode'
" let g:PyLintCWindow = 1
" let g:PyLintSigns = 1
" let g:PyLintOnWrite = 1
" let g:PyLintDissabledMessages = 'C0103,C0111,C0301,C0322,C0323,C0324,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0621,W0631,E0102,E0611,E1002,E1101,E1103,E1120,F0401,R0201,R0901,R0903,R0904,R0913'

" Help building Arduino source files.
" Plugin 'edthedev/arduino.vim'
" let g:arduino_compile_command = 'ino build --board-model=atmega328'
" let g:arduino_upload_command = 'ino upload --board-model=atmega328'

" Plugin 'tomswartz07/vim-todo'
"
" Run commands from the current line and get their output.
" Plugin 'edthedev/cmd.vim'

" Plugin 'itchyny/thumbnail.vim'
" :Thumbnail

" Plugin 'farseer90718/vim-taskwarrior'
" let g:task_rc_override = 'defaultwidth=999'
" Plugin 'farseer90718/vim-taskwarrior'
" let g:task_rc_override = 'defaultwidth=0'
" let g:task_report_name     = 'list'
" Read up on it here:  https://github.com/farseer90718/vim-taskwarrior
"

" For REST APIs Press QQ in normal mode to open.
" Plugin 'nicwest/QQ.vim'

" Plugin 'mihaifm/bufstop'
" nn <leader>b :Bufstop<CR>             " get a visual on the buffers
" map <leader>a :BufstopModeFast<CR>     " a command for quick switching

" Sensible defaults for Markdown
" Plugin 'plasticboy/vim-markdown'
" set nofoldenable "Do not fold everything

" Better status line.
Plugin 'bling/vim-airline'

" Plugin 'Windows-PowerShell-Syntax-Plugin'

" Quick complete of stuff...
" Plugin 'SirVer/ultisnips'

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Snippets for ultisnips
" Plugin 'edthedev/vim-snippets'

" Default to use strapdown and markdown for blog posts.
" UltiSnipsAddFiletypes markdown.strapdown


call vundle#end()
filetype plugin indent on     " required for Vundle Bundle

" Page down with space key
" nn <space> <c-d>
" Shift space is undetectable in many terminals...
" nn <S-space> <c-u>


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
