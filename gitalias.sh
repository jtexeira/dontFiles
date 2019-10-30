alias g='git'

alias gd='git diff'

alias gc='git commit'
alias gcam='git commit -am'

alias gcm='git checkout master'
alias gco='git checkout'
alias gcb='git checkout -b'

gcl() {
	git clone git@github.com:$1
}

alias gps='git push'
alias gpl='git pull'
alias gst='git status'
alias glog='git log --decorate --graph --oneline --all'
alias ga='git add'
alias gaa='git add -A'

alias grhh='git reset --hard HEAD'

gls () { 
	LS=$(ls --color=always)
	GST=$(git status)

	for i in $LS; do
		CROPPED=$(echo "$i" | sed 's/\x1b\[[0-9;]*m//g')
		IDK=$(echo "$GST" | (grep "$CROPPED" || echo "$i") | sed -r 's/modified:   /\x1b[32m/g')
		LS=${LS/$CROPPED/$IDK}
	done

	echo -e '\033[0;36m'Branch:$(git branch | grep \* | cut -d ' ' -f2)'\033[0m'
	echo $LS
}
