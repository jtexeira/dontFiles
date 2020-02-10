setxkbmap -layout $LAYOUT -option caps:escape -option altwin:swap_lalt_lwin
xrdb ~/.Xresources
compton & disown
~/.fehbg
sxhkd &
exec i3
