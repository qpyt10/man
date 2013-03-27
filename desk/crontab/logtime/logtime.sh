#!/bin/bash
#
# 02.12.12
# 11.02.13 m
#

source $HOME/.bashrc

report () {
   if [[ $1 == '0' ]]; then
      echo "# date   login    logout   uptm upsec date -h " > $2
   else
      /bin/bash $log_path/last_login.sh >> $2
   fi
}


host_name=`/bin/uname -n`

this_path=`dirname $(readlink -f $0)`

log_path=$this_path
log_file=$log_path/$host_name.log

test -e $log_file || report 0 $log_file

report 1 $log_file

/bin/bash $log_path/update_report.sh $host_name
$log_path/make_fig.sh
#/bin/bash $log_path/make_fig.sh

/bin/bash $log_path/update_web.sh
