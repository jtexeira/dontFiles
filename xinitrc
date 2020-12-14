setxkbmap -layout $LAYOUT -option caps:escape -option altwin:swap_lalt_lwin
xrdb ~/.Xresources
compton & disown
$DOTFILES/wallpaper.sh
sxhkd &
wmname compiz
thonkbar_daemon &
. "$DOTFILES"/local_configs/"$HOSTNAME".startup
exec bspwm -c ~/.config/bspwm/bspwmrc
