TFENV=$(pwd | grep -P ".*terraform.*/(environment.?|BOOTSTRAP)" | perl -ne "s|.*?terraform.*?/environment.?/([^/]+)/?.*|\1|g and print")
TFCLI=$(pwd | sed -E 's|.*/clients/([^/]+)/.*terraform.*|\1|g')
TFCLI+='/'
[ -z "${TFENV}" ] || echo "[tf:$TFCLI$TFENV] "
