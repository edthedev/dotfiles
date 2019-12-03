# Collaboration permissions are nice.
umask 022

#   Colors are nice.
# -----------------------------------------------------------------------
# autoload -U colors && colors
# autoload -U compinit && compinit

# setopt prompt_subst

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
export EDITOR="vim"

alias vi vim

function ssh-copy-id {
	cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys; chmod 700 ~/.ssh && chmod 600 ~/.ssh/*"
	# cat ~/.ssh/id_rsa.pub | ssh $1 "cat >> ~/id_rsa.pub"
}

export PATH=$PATH:$HOME/bin

# Task Aliases
# --------------
# Printout tasks
alias daily="task end.after:-1wk completed +daily &> /tmp/daily.txt;task +daily list &>> /tmp/daily.txt;open /tmp/daily.txt"
alias status="task list &> /tmp/status.txt; open /tmp/status.txt"
alias todo="task rc:~/dotfiles/taskrc_weekend $@"
alias team="task rc:~/dotfiles/taskrc_team $@"
alias someday="task rc:~/dotfiles/taskrc_someday $@"
alias vitc="vit -ms -someday -q -daily -assigned"
alias vitt="vit +daily"
alias vitf="vit +followup"
alias week_report="task completed"

# Minion aliases
# --------------
alias journal="minion --config=~/.minion_weekend $@"
alias life="minion --config=~/.minion_weekend $@"
alias mingoogle_drive="minion --config=/Users/delaport/dotfiles/minion_googledrive $@" 

# alias journal="minion --config=~/.minion_weekend"
# TODO: Figure out how to make a Minion antigen bundle...
alias life="minion --config=~/.minion_weekend"

# For antigen
# ----------------
source ~/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
#  Most others expect this one.
antigen use oh-my-zsh

# Nice git highlighting
antigen bundle git

# Autocomplete for pip install 
antigen bundle pip

# Change command color if it exists.
antigen bundle command-not-found

# Color current command based on Zshell interpretation
antigen bundle zsh-users/zsh-syntax-highlighting

# Nice multiline git-aware prompt.
# antigen bundle sindresorhus/pure
#   Does not play nicely with Git two-factor auth / SSH key auth

# Automatically activate virtualenvs
antigen bundle sharat87/autoenv

# Git Aware Prompt
antigen bundle nojhan/liquidprompt

# # Tell antigen that you're done.
antigen apply
