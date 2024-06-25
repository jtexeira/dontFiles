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
    PS1='\[\e[96m\]$($DOTFILES/scripts/ps1.sh)\[\e[39m\] $($DOTFILES/scripts/aws_env.sh)$($DOTFILES/scripts/tf_env.sh)$($DOTFILES/scripts/git_branch.sh)$($DOTFILES/scripts/count_jobs.sh)'
fi
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"
[ -f "$DOTFILES/z.ignore/z.sh" ] && . $DOTFILES/z.ignore/z.sh
export AWS_VAULT_BACKEND=pass
export AWS_VAULT_PASS_PREFIX=aws/
export SSH_ASKPASS=ksshaskpass

export LC_ALL=en_GB.UTF-8

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
function hstrnotiocsti {
    { READLINE_LINE="$( { </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    READLINE_POINT=${#READLINE_LINE}
}
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti"'; fi
export HSTR_TIOCSTI=n
export EDITOR='nvim -u ~/.dotfiles/vimrc'

