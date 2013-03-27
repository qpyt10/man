#!/bin/bash

break_min=60

# load useful functions
this_path=`dirname $(readlink -f $0)`
source $this_path/uptime.sh

#icon=/usr/share/pixmaps/anjuta/anjuta-preferences-general-48.png
icon=$this_path/icons/work.icon

break_sec=$(( $break_min * 60 ))

while true;
do
   _uptime hou min sec tot
   notify-send '@ CASPUR ... '  "... for ${hou}h and ${min}m" -t 2000 -i $icon
   sleep $break_sec
done

