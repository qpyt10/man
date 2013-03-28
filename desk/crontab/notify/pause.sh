#!/bin/bash

break_min=90

# load useful functions
this_path=`dirname $(readlink -f $0)`
source $this_path/uptime.sh

icon=/usr/share/pixmaps/faces/coffee.jpg
#icon=/usr/share/pixmaps/caffeine.png

break_sec=$(( $break_min * 60 ))

while true;
do
   _uptime hou min sec tot
   notify-send "take a break" "you're working for ${hou}h and ${min}m" -t 2000 -i $icon
   sleep $break_sec
done

