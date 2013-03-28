#!/bin/bash

#script_to_run="pause target interval"
script_to_run="target interval"
#script_to_run="check"

this_path=`dirname $(readlink -f $0)`

for this_script in $script_to_run
do
   bash $this_path/$this_script.sh &
done


