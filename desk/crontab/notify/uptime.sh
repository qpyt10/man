#!/bin/bash
#
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
