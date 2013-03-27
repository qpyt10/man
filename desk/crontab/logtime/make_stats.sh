#!/bin/bash
#
# 19.02.13
# 19.02.13 m
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

file_report=$base_dir/hpc2.log

day_total=`wc -l $file_report | awk '{print $1-1}'`
day_first=`head -2 $file_report | tail -1 | awk '{print $6}'`
day_final=`tail -1 $file_report | awk '{print $6}'`

echo " $day_total working days @CASPUR from $day_first to $day_final"

year=`date '+%Y'`
month=`date '+%m'`
month_name=`date '+%B'`
dayw=`date '+%a'`
dayw_name=`date '+%A'`

####

days_year=`grep -c $year $file_report`

echo " $days_year working days in the $year"

days_month=`grep -c $year$month $file_report`

echo " $days_month working days in $month_name $year"

daysw_year=`grep -c $dayw $file_report`

echo " $daysw_year working $dayw_name in $year"

daysw_month=`grep $year$month $file_report | grep -c $dayw `

echo " $daysw_month working $dayw_name in $month_name $year"

####
