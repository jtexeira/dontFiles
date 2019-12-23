_za() {
	COMPREPLY=( $(compgen -f | grep .pdf) )
	return
}
complete -F _za za
