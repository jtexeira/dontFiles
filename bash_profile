#
# ~/.bash_profile
#

export DOTFILES=~/dotfiles
export TERMINAL=st
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
    sh $DOTFILES/updatefiles
    pgrep i3 || startx 2> /dev/null
    clear
fi
