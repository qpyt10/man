#!/bin/bash

DROPBOX_PATH=

file_log=$DROPBOX_PATH/setting/logfile/logio.log

#################### GETOPTS #####################
# 10.04.07
# 27.09.07 modified
while getopts "iol:" OPTS
# here letter ..^ for options
# : for argument of options
do
 case $OPTS in
 i) log_msg="login";;
 o) log_msg="logout";;
 l) file_log=$OPTARG;;
 esac
done
shift $(($OPTIND-1))
################## end GETOPTS ###################

FormatDate='%d/%m/%y'

echo "$(date "+$FormatDate") $log_msg"
