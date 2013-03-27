#!/bin/bash

target_hours=7
target_minutes=42

check_sec=60

# load useful functions
this_path=`dirname $(readlink -f $0)`
source $this_path/uptime.sh

icon=/usr/share/pixmaps/gnome-home.png

target_sec=$(( $target_hours *60*60 + $target_minutes *60 ))

tot=0
while [ $tot -lt $target_sec ]
do
   _uptime hou min sec tot
   sleep $check_sec
done
string="you've worked for ${hou}h and ${min}m
GO HOME!!!"
notify-send 'well done!' "$string" -t 20000 -i $icon

check_sec=$(( 15 *60 ))
while true;
do
   sleep $check_sec
   _uptime hou min sec tot
   string="you've already worked for ${target_hours}h and ${target_minutes}m
   now you're at ${hou}h and ${min}m
   GO HOME!!!"
   notify-send 'well done!' "$string" -t 5000 -i $icon
done
