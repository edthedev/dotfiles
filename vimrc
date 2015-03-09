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
if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
     call system("git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle")
     endif

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

" Helper scripts for editing ReStructuredText
" Plugin 'edthedev/vim-rst'
Plugin 'edthedev/text-helper.vim'

" EdTheDev's Minion file organizer.
Plugin 'edthedev/minion'
" let g:minion_map_keys = 0

Plugin 'edthedev/rst-syntax.vim'

" EdTheDev's Vim configuration for Python PEP8
Plugin 'edthedev/vim-pep8'
let g:minion_todo_map_keys = 1


" let g:vimroom_ctermbackground = "black"
"

" Trac plugin for Vim
" Plugin 'mjbrownie/Trac.vim'
" :help trac
" let g:tracServerList = {}
" let g:tracServerList['sdg'] = 
""	\'http://username:password@trac.nukulele.org/login/xmlrpc'

"Plugin 'fmoralesc/vim-pad'
" let g:pad_dir='~/Copy/notes'

" Pelican.vim Revived!
Plugin 'edthedev/pelican.vim'
let g:pelican_blog_source = '~/Copy/blog'
let g:pelican_blog_html = '~/blog_html'
let g:pelican_git_master = 'git@bitbucket.org:edthedev/blog.git'
let g:pelican_publish_server = 'uiucedward@hathor.dreamhost.com:~/edward.delaporte.us'

" Low contrast color scheme for Gvim - much easier on the eyes.
Plugin 'junegunn/seoul256.vim'

" Display tag (function/method) outline
Plugin 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<Cr>

" EdTheDev's Vim configuration for TODO list items.
Plugin 'edthedev/vim-todo'
let g:vim_todo_keys = 1

" Automatic closing of parenthesis
" Plugin 'Raimondi/delimitMate'
"  - Caused syntax color problems for RST?

" Browsing files made easier.
Plugin 'scrooloose/nerdtree'
nmap <leader>r :NERDTreeToggle<CR>

" Async dispatch by Tim Pope
Plugin 'tpope/vim-dispatch'

" Bundle 'vim-scripts/confluencewiki.vim'
"  - Caused syntax color problems for RST?
"
"Plugin 'jceb/vim-orgmode'
"let g:org_todo_keywords=['TODO', 'DONE', 'WAITING', 'CANCELED']
"let g:org_agenda_files=['~/Google Drive/index.org']

Plugin 'edthedev/wordlike.vim'

" Plugin 'xolox/vim-notes'
" Add @Tag search support
"Bundle 'fmoralesc/vim-pad'
" let g:pad_dir='~/Copy/notes'

" Distraction free writing.
Plugin 'junegunn/goyo.vim'
nnoremap <leader>w :Goyo<Cr>
" Limelight doesn't work with iterm
" Plugin 'junegunn/limelight.vim'
" nnoremap <leader>w :Goyo<Cr>:Limelight<Cr>

Plugin 'vim-scripts/pylint-mode'
let g:PyLintCWindow = 1
let g:PyLintSigns = 1
let g:PyLintOnWrite = 1
" let g:PyLintDissabledMessages = 'C0103,C0111,C0301,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0631,E1101,E1120,R0201,R0901,R0903,R0904,R0913'
" let g:PyLintDissabledMessages = 'C0103,C0111,C0301,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0631,E1101,E1120,R0201,R0901,R0903,R0904,R0913,E1002,E1103'
" let g:PyLintDissabledMessages = 'C0103,C0111,C0301,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0631,E1002,E1101,E1103,E1120,R0201,R0901,R0903,R0904,R0913'
let g:PyLintDissabledMessages = 'C0103,C0111,C0301,C0322,C0323,C0324,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0621,W0631,E1002,E1101,E1103,E1120,F0401,R0201,R0901,R0903,R0904,R0913'

Plugin 'edthedev/arduino.vim'
" Plugin 'edthedev/vim-arduino-ino'
let g:arduino_compile_command = 'ino build --board-model=atmega328'
" let g:arduino_compile_command = 'Dispatch ino build --board-model=atmega328'
let g:arduino_upload_command = 'ino upload --board-model=atmega328'

" Plugin 'tomswartz07/vim-todo'
"
Plugin 'edthedev/cmd.vim'

Plugin 'itchyny/thumbnail.vim'
" :Thumbnail
"
" Plugin 'farseer90718/vim-taskwarrior'
" let g:task_rc_override = 'defaultwidth=0'
" let g:task_report_name     = 'list'
" Read up on it here:  https://github.com/farseer90718/vim-taskwarrior
"

" For REST APIs Press QQ in normal mode to open.
Plugin 'nicwest/QQ.vim'

Plugin 'scrooloose/syntastic'

Plugin 'mihaifm/bufstop'
nn <leader>b :Bufstop<CR>             " get a visual on the buffers
map <leader>a :BufstopModeFast<CR>     " a command for quick switching

" Sensible defaults for Markdown
Plugin 'plasticboy/vim-markdown'
set nofoldenable "Do not fold everything

" Ctrl P on steroids...
Plugin 'Shougo/unite.vim'

" Better status line.
Plugin 'bling/vim-airline'


call vundle#end()
filetype plugin indent on     " required for Vundle Bundle

" Page down with space key
nn <space> <c-d>
" Shift space is undetectable in many terminals...
nn <S-space> <c-u>

" Don't show tabs for HTML files. Do show trailing spaces."
au FileType html set nolist

" Two spaces as tabs in .feature files.
au BufRead,BufNewFile *.feature set filetype=yaml
au FileType yaml set tabstop=2
au FileType yaml set shiftwidth=2
au FileType yaml set expandtab

" Two spaces for Markdown files.
au BufRead,BufNewFile *.md set filetype=markdown
au FileType markdown set tabstop=2
au FileType markdown set shiftwidth=2
" au FileType yaml set expandtab
"


set softtabstop=4 " makes the spaces feel like real tabs
" Sensible default for everything else.
set tabstop=2
set shiftwidth=2
