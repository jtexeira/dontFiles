#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERMINAL=st
source $HOME/.gitalias
source $HOME/.scripts
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias vim='nvim -u ~/.vimrc'
alias cls=clear
