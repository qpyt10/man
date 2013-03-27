#!/bin/bash
#
# 16.01.13
# 06.02.13 m
#

#echo "included: $0"

function DEBUG()
{
 [ "$_DEBUG" == "on" ] &&  echo -e "[DEBUG] $@"
}


error () {
   echo "[FATAL_ERROR] $1"
   help
   exit 1
}


date_convert () {
   # return date of $day in $format
   # USAGE: date_convert date $format [$day]
   # NB 1 : no space in $format
   # NB 2 : default day is 'today'
   test -n "$2" && local _fmt="$2"  || local _fmt="%d/%m/%y"
   #echo "[DEBUG] fmt in args : $2"
   #echo "[DEBUG] local _fmt  : $_fmt"
   test -z "$3" && local _day=today || local _day=$3
   #echo "[DEBUG] day in args : $3"
   #echo "[DEBUG] local _day  : $_day"
   local _date=`date "+$_fmt" --date="$_day"`
   #echo "[DEBUG] _date --$_date--"
   eval $1="$_date"
   
}

date_last_login () {
   # return date of the last login (date format '+%Y%m%d')
   # USAGE: date_last_login date
   # ac return date in format '+%b %d %Y'
   local _FMT_b_dY="`ac -dy | grep -v Today | tail -1 | awk '{print $1, $2, $3}'`"
   local _FMT_Ymd=`date +'%Y%m%d' --date="${_FMT_b_dY}"`
   eval $1=$_FMT_Ymd
}

take_hrs () {
   # return HH from HH:MM 
   local _time=$1
   eval $2=${_time%:*}
   #DEBUG "take_hrs : HH:MM = $_time ; HH = ${_time%:*}"
}
take_min () {
   # return MM from HH:MM 
   local _time=$1
   eval $2=${_time#*:}
   #DEBUG "take_min : HH:MM = $_time ; MM = ${_time#*:}"
}
take_sec () {
   # return seconds from HH:MM
   local _time=$1
   take_hrs $_time _hrs
   take_min $_time _min
   local _sec=`echo  "$_hrs *60*60 + $_min *60" | bc `
   eval $2=$_sec
   #DEBUG "take_sec : _hrs = $_hrs"
   #DEBUG "take_sec : _min = $_min"
   #DEBUG "take_sec : _sec = $_sec"
}
