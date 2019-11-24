#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. $DOTFILES/$HOSTNAME.local
for file in $DOTFILES/*.dont; do 
	. $file;
done
PS1='$($DOTFILES/ps1.sh) '
