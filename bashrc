#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $HOME/.gitalias
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias vim=nvim
