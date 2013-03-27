#!/bin/bash
############## date ###############
# function: mydate ()
# 15.05.08
# 25.07.08 modified
# return the date in format:
# dd/mm/yy hh:mm:ss Day
myDate ()
{
   local FormatDate='%d/%m/%y'
   local FormatTime='%H:%M:%S'
   local FormatDays='%a'
   local Target=
#
   for i in $(seq $#)
   do
      local Target="$Target $1"
      shift
   done
#
   if [[ $Target == '' ]];then
      local Target=now
   else
      local FormatTime=
      local FormatDays=
   fi
#
   date "+$FormatDate $FormatTime $FormatDays" -d "$Target"
#
   return 0
}
# end function mydate

myDate "$@"
