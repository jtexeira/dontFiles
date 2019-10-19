git -C ~/dotfiles pull
setxkbmap -layout pt -option caps:escape -option altwin:swap_lalt_lwin
xrdb ~/.Xresources
compton & disown
exec i3
