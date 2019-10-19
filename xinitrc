echo $DOTFILES
sleep 3
git -C $DOTFILES pull
sh $DOTFILES/initfiles
setxkbmap -layout pt -option caps:escape -option altwin:swap_lalt_lwin
xrdb ~/.Xresources
compton & disown
exec i3
