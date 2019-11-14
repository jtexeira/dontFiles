#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. $DOTFILES/$HOSTNAME.local
for file in $DOTFILES/*.sh; do 
	. $file;
done
PS1='[\u@\h \W]\$ '
