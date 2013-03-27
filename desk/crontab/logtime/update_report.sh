#!/bin/bash
#
# 16.01.13
# 06.02.13 m
#
_DEBUG=off

help () {
echo -e "
NAME:
\t$(basename $0) - ...
\nUSAGE:
\t$(basename $0) host_name
\nDESCRIPTION:
\t...
"
}

# setup base_dir
base_dir=$(dirname $0)

# load useful functions
source $base_dir/functions.sh

# host name from command argument
report_host=$1
DEBUG "report_host \t: -$report_host-"

# check if exist an argument
test -z $report_host && error "$0 without report_host"

# get data of the last login
date_last_login date_login
DEBUG "last login date\t: -$date_login-"

# convert data of the last login to format YYYYMM
date_convert date_to_grep "%Y%m" $date_login
DEBUG "convert date \t: -$date_to_grep-"

# setup: path and name of the report file
report_path=$base_dir/report
report_file=${report_host}_$date_to_grep.log
DEBUG "report_file \t: -$report_file-"

# setup log file from which take the data
file_log=$base_dir/${report_host}.log
DEBUG "file_log \t: -$file_log-"

# update report file with data
grep $date_to_grep $file_log > $report_path/$report_file

