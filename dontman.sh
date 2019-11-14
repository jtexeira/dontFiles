dontback() {
    if ! [[ $1 ]]; then
        1=$(date +%d/%m/%y\ %R);
    fi
	git -C $DOTFILES commit -am "Backup $1" 
	git -C $DOTFILES push
}

dontadd() {
	if ! [[ $2 ]]; then
		2=$(echo $1 | sed -r 's|.*/(.)|\1|g');
	fi
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
