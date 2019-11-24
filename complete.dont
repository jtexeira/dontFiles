_za() {
	local curw
	curw=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $(compgen -o plusdirs -A file -- $curw | grep .pdf) )
	return
}

_f() {
	local curw
	local files
	curw=${COMP_WORDS[COMP_CWORD]}
	files=$(ls $DOTFILES)
	COMPREPLY=( $(compgen -W "$files" -- $curw) )
	return
}

complete -F _za za
complete -F _f f
