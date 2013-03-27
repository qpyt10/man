#!/bin/bash
#
# 02.12.12
# 16.01.13 m
#

last_login () {
   local _FMT_b_dY="`ac -dy | grep -v Today | tail -1 | awk '{print $1, $2, $3}'`"
   local _FMT_Ymd=`date +'%Y%m%d' --date="${_FMT_b_dY}"`
   eval $1=$_FMT_Ymd
}

date_fmt () {
   local _day=$1
   local _fmt="$2"
   date +"$_fmt" --date="$_day"
}

take_time () {
   local _day="$1"
   #echo "[DEBUG] _day: -!$_day!-"
   local _string=`last -aFRx | grep reboot | grep "$_day" | head -1`
   #echo "[DEBUG] _string: -!$_string!-"
   #echo "[DEBUG] ${_string#*$_day }"
   local _string=${_string#*$_day }
   #echo "[DEBUG] ${_string%% *}"
   local _time_login=${_string%% *}
   #echo "[DEBUG] _time_login: -!$_time_login!-"
   #echo "[DEBUG] ${_string#*$_day }"
   local _string=${_string#*$_day }
   #echo "[DEBUG] ${_string%% *}"
   local _time_loout=${_string%% *}
   #echo "[DEBUG] _time_loout: -!$_time_loout!-"
   #echo "[DEBUG] _string: -!$_string!-"
   local _string=${_string#*(}
   local _string=${_string%)*}
   #echo "[DEBUG] _string: -!$_string!-"
   local _time_up=$_string
   #echo "[DEBUG] _time_up: -!$_time_up!-"
   local _time_hrs=${_string%:*}
   #echo "[DEBUG] _time_hrs: -!$_time_hrs!-"
   local _time_min=${_string#*:}
   #echo "[DEBUG] _time_min: -!$_time_min!-"
   #BUG IF _time_hrs=0?
   #BUG let "_time_sec = _time_hrs *60*60 + _time_min *60"
   local _time_sec=`echo  "$_time_hrs *60*60 + $_time_min *60" | bc `
   #echo "[DEBUG] up $_time_up hrs $_time_hrs min $_time_min sec $_time_sec"
   eval $2=$_time_login
   eval $3=$_time_loout
   eval $4=$_time_up
   eval $5=$_time_sec
}

# date of the last login in YYYYMMDD (date +'%Y%m%d')
last_login date_login

# convert last login date in format +'%b%_d'
DATE_FMT="%a %b %_d"
date_last=`date_fmt $date_login "$DATE_FMT"`

DATE_FMT="%d/%m/%y %a"
date_human=`date_fmt $date_login "$DATE_FMT"`

#echo $date_last

take_time "$date_last" _login _logout _up _upsec

echo $date_login $_login $_logout $_up $_upsec $date_human

