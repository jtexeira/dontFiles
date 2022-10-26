BRANCH=$(git branch --show-current 2>/dev/null)
[ -z "${BRANCH}" ] || echo "[git:$BRANCH] "
