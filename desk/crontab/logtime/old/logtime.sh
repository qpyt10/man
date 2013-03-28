#!/bin/bash
# 02.11.12

this_path=$Dropbox_path/settings/crontab/logtime

fileLOG=$this_path/$HOSTNAME.log

path_icon=$this_path/icon

_help () {
   echo -e "\nUSAGE: $0 -i/-o\n"
   exit 1
}

_uptime () {
   local _time=$(awk '{print $1}' /proc/uptime)
   local _time=${_time%%.*}
# total seconds
   eval $4=$_time
# seconds
   eval $3=$(( _time%60       ))
# minutes
   eval $2=$(( _time/60%60    ))
# hours 
   eval $1=$(( _time/60/60%24 ))
   return 0
}  

test $# == 0 && _help

#################### GETOPTS #####################
while getopts "io" OPTS
do
 case $OPTS in
 i) LOG=in   ;;
 o) LOG=out  ;;
 *) LOG=     ;;
 esac
done
shift $(($OPTIND-1))
################## end GETOPTS ###################

test -z $LOG && _help

# initialization of log file
test -e $fileLOG || \
echo "# date   % date -h      % \
login    % \
logout   % uptime   % up sec. % hostname" > $fileLOG

# LOGIN
if [ $LOG == 'in' ];then
   # write date in log file
   echo -n "$(date +'%Y%m%d %% %d/%m/%y %a %%')" >> $fileLOG
   # write login time in file log
   echo -n " $(date +'%H:%M %%')" >> $fileLOG
   #echo -n " $(date +'%H:%M:%S %%')" >> $fileLOG
   # notify
   string1="Good Morning!"
   string2="sono le `date +'%H:%M'`
   devi tornare a casa alle `date --date='7 hours 42 minutes' +'%H:%M'`"
   notify-send "$string1" "$string2" -i $path_icon/start.jpg
fi

# LOGOUT
if [ $LOG == 'out' ];then
   # write logout time in file log
   echo -n " $(date +'%H:%M:%S %%')" >> $fileLOG
   # write uptime 
   _uptime hou min sec tot
   printf " %02d:%02d:%02d %% %7d %%" $hou $min $sec $tot >> $fileLOG
   echo -n " $(hostname)" >> $fileLOG
   echo >> $fileLOG
   # notify
   string1="Bye Bye!"
   string2="sono le `date +'%H:%M'`
   hai lavorato per ${hou}h:${min}m"
   notify-send "$string1" "$string2" -i $path_icon/finish.jpg
fi
