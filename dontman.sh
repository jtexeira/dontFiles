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
