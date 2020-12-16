#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f "$DOTFILES"/local_configs/"$HOSTNAME".local ] && . $DOTFILES/local_configs/$HOSTNAME.local
for file in $DOTFILES/bash_configs/*.dont; do 
	. $file;
done

export PATH=$PATH:$HOME/.local/bin

PS0=$(echo -ne "\033]0;$(pwd | sed -r 's|'"$HOME"'|~|g') - "$TERMINAL"\007")
echo -ne "\033]0;$(pwd | sed -r 's|'"$HOME"'|~|g') - "$TERMINAL"\007"

if [[ -n $SSH_CLIENT ]]; then
    PS1='\[\e[33m\][\h] $($DOTFILES/scripts/ps1.sh)\[\e[39m\] '
else
    PS1='\[\e[96m\]$($DOTFILES/scripts/ps1.sh)\[\e[39m\] '
fi
