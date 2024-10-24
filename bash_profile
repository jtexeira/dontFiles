#
# ~/.bash_profile
#

export DOTFILES=~/.dotfiles
export TERMINAL=st
export LC_ALL=C; unset LANGUAGE
export VISUAL=nvim
eval "$(ssh-agent -s)"
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
    sh $DOTFILES/updatefiles
    pgrep i3 || $XSESSION 2> /dev/null
    clear
fi

if [[ -z $TMUX ]] && [[ -n $SSH_CLIENT ]]; then
    echo 'Launch tmux? [Y/n]'
    read -r bool
    case $bool in
        "y"|"Y"|"")
            tmux new-session -A -s main
            exit
            ;;
    esac
    unset bool
fi

. "$HOME/.cargo/env"
