#!/bin/bash
#
# 11.02.13
# 11.02.13 m
#
_DEBUG=off

help () {
echo -e "
NAME:
\t$(basename $0) - ...
\nUSAGE:
\t$(basename $0) 
\nDESCRIPTION:
\t...
"
}

update_file () {
   local this_file="$1"
   local this_path="$2"

   test -e "$this_file" || return
   test -e "$this_path" || return

   cp $this_file $this_path

   DEBUG cp $this_file $this_path
}

# setup base_dir
base_dir=$(dirname $0)

fig_path=$base_dir/fig
rep_path=$base_dir/report
web_path=$HOME/Dropbox/web/report

# load useful functions
source $base_dir/functions.sh


files2update="$base_dir/hpc2.log $fig_path/report.png"

months="Dec12 Jan13 Feb13 Mar13"
for this in $months
do
   files2update="$files2update $fig_path/$this.png"
done

for this in $files2update
do
   update_file $this $web_path
done

