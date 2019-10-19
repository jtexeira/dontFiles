#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for file in $DOTFILES/*.sh; do 
	source $file;
done
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias v='nvim -u $DOTFILES/vimrc'
alias cls=clear
alias dontup='sh $DOTFILES/updatefiles'
