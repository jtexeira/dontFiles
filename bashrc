#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. $DOTFILES/$HOSTNAME.local
for file in $DOTFILES/*.dont; do 
	. $file;
done

export PATH=$PATH:$HOME/.local/bin

if [[ -n $SSH_CLIENT ]]; then
    PS1='\[\e[33m\][\h] $($DOTFILES/ps1.sh)\[\e[39m\] '
else
    PS1='\[\e[96m\]$($DOTFILES/ps1.sh)\[\e[39m\] '
fi
