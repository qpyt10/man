
date +'%Y%m%d' --date="`ac -dy | grep -v Today | tail -1 | awk '{print $1, $2, $3}'`"

date --date="02/11/12 20:00:20 + 1 hours + 10 minutes"

last -aFRx | grep reboot

