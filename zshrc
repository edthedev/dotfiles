# Collaboration permissions are nice.
umask 022

#   Colors are nice.
# -----------------------------------------------------------------------
# autoload -U colors && colors
# autoload -U compinit && compinit

# setopt prompt_subst

export EDITOR="vim"


## Include local bin stuff on the path, if they are there.
#if [ -d $HOME/bin ]; then
#	PATH=$PATH:$HOME/bin 
#fi
#
## Set screen title when SSH-ing
#ssh() {
#	args=$@
#	echo -ne "\033k${args##* }\033\\";
#	env ssh "$@";
#	# Set window title back here!
#}
#
## Many thanks to https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/completion.zsh
## Same guy who wrote antigen! Awesome!
#
## disable named-directories autocompletion
#zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
#cdpath=(.)
#
## SSH Completion should include ~/.ssh/config
#[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
#[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
#[ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
#[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
#hosts=(
#  "$_ssh_config[@]"
#  "$_global_ssh_hosts[@]"
#  "$_ssh_hosts[@]"
#  "$_etc_hosts[@]"
#  "$HOST"
#  localhost
#)
#zstyle ':completion:*:hosts' hosts $hosts
#zstyle ':completion:*' users off
#
## Use caching so that commands like apt and dpkg complete are useable
#zstyle ':completion::complete:*' use-cache 1
#zstyle ':completion::complete:*' cache-path $ZSH/cache/
#
## Don't complete uninteresting users
#zstyle ':completion:*:*:*:users' ignored-patterns \
#        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
#        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
#        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
#        mailman mailnull mldonkey mysql nagios \
#        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
#        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
#        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs
#
#source ~/.vim/bundle/minion/add_to_your_profile
#source ~/.vim/bundle/minion/aliases_for_minion
#
#if [ -f ~/.krb5.conf ]; then
## For Exchange Perl connector.
#	export KRB5_CONFIG=$HOME/.krb5.conf
#fi
#
#if [ -f ~/dotfiles/prompt.py ]; then
#	precmd() {
#		PROMPT=`/usr/bin/python ~/dotfiles/prompt.py ~/dotfiles/prompt.txt`
#	}
#fi
#
#if [ -f /usr/bin/xscreensaver ]; then
#	    alias lock="xscreensaver -l"
#fi
#
#if [ -f ~/dotfiles/scripts/add_to_your_profile ]; then
#	source ~/dotfiles/scripts/add_to_your_profile
#fi
#
#if [ -f ~/.vim/bundle/vim-todo/bin ]; then
#	source ~/.vim/bundle/vim-todo/bin
#fi
#
#
#alias gitlog git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all

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
antigen bundle sindresorhus/pure

# Quickly create and fetch text files.
antigen bundle edthedev/minion

# # Tell antigen that you're done.
antigen apply
