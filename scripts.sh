aura() {
	pushd /tmp >> /dev/null
	git clone https://aur.archlinux.org/$1
	cd $1
	makepkg -si
	popd >> /dev/null
}

aurs() {
	curl -s "https://aur.archlinux.org/rpc/?v=5&type=search&by=name&arg=$1" | jq '.results[] | "\(.Name) -> \(.Description)"'
}

za() {
	zathura $1 & disown
}

f() {
	nvim -u $DOTFILES/vimrc $(find $DOTFILES | grep $1)
}
