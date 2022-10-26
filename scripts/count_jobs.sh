JOB_NUMBER=$(jobs | grep -c "STOPPED")
[ "$JOB_NUMBER" == "0" ] || echo "[bg:$JOB_NUMBER] "
