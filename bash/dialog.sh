#!/bin/bash

dialog --backtitle "My first dialog" \
       --title "Main menu" \
       --menu "Make your choice" 13 60 6 \
        1 "First option" \
        2 "Second option" \
        3 "Exit" 2> .tempfile
        output=`cat .tempfile`
        rm -f .tempfile

if [ "$output" = "1" ]; then
    dialog --msgbox "First option was entered" 5 40
fi

if [ "$output" = "2" ]; then
    dialog --msgbox "Second option was entered" 5 40
fi

exit 0
