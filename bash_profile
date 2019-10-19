#
# ~/.bash_profile
#

export TERMINAL=st
export DOTFILES=~/dotfiles
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
    sh $DOTFILES/updatefiles
    pgrep i3 || startx 2> /dev/null
    clear
fi
