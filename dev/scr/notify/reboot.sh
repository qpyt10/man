#!/bin/bash
DISPLAY=:0


this_path=/home/orlandin/Dropbox/settings/scr/notify

# specify the time for a pause in seconds
BREAK_PAUSE=7200
BREAK_PAUSE=20

/usr/bin/watch -n $BREAK_PAUSE $this_path/take_pause.sh &> /dev/null &
