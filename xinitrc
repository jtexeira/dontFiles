xmodmap ~/pt.map
setxkbmap -layout $LAYOUT -option caps:escape -option altwin:swap_lalt_lwin
xrdb ~/.Xresources
compton & disown
~/.fehbg
sxhkd &
xrandr --output eDP-1-1 --left-of DP-1-1
xrandr --output HDMI-1-2 --right-of eDP-1-1
xrandr --output HDMI-1-2 --left-of DP-1-1
xrandr --output DP-1-1 --primary
wmname compiz
exec bspwm -c ~/.config/bspwm/bspwmrc
