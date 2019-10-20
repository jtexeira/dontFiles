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

dontback() {
	git -C $DOTFILES commit -am "Backup $(date +%d/%m/%y\ %R)" 
	git -C $DOTFILES push
}

dontadd() {
	FPATH=$(readlink -f $1 | sed -r 's|'"$HOME"'|~|g')
	echo $2:$FPATH >> $DOTFILES/.locations
	mv $1 $DOTFILES/$2
	ln -rsn $DOTFILES/$2 $1
	git -C $DOTFILES add $2
}

dontrm() {
	FPATH=$(find $DOTFILES | grep $1)
	grep $1 $DOTFILES/.locations | awk -F: '{system("mv $DOTFILES/"$1 " " $2)}'
	sed -ri "/$1/d" $DOTFILES/.locations
}
