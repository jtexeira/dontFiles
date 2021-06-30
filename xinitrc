setxkbmap -layout $LAYOUT -option caps:escape -option altwin:swap_lalt_lwin
xrdb ~/.Xresources
compton & disown
$DOTFILES/wallpaper.sh
sxhkd -m -1 &
wmname compiz
thonkbar_daemon &
[ -f "$DOTFILES"/local_configs/"$HOSTNAME".startup ] && . "$DOTFILES"/local_configs/"$HOSTNAME".startup
exec bspwm -c $DOTFILES/bspwmrc
