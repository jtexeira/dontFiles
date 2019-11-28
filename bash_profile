#
# ~/.bash_profile
#

export DOTFILES=~/dotfiles
export TERMINAL=st
export LC_ALL=C; unset LANGUAGE
export VISUAL=nvim
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
    sh $DOTFILES/updatefiles
    pgrep i3 || $XSESSION 2> /dev/null
    clear
fi
