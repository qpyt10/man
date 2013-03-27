#!/bin/bash
#################### GETOPTS #####################
# 10.04.07
# 27.09.07 modified
while getopts ":" OPTS
# here letter ..^ for options
# : for argument of options
do
 case $OPTS in
 h) VAR_withoutoption=yes	;;
 o) VAR_withoption=$OPTARG	;;
 esac
done
shift $(($OPTIND-1))
################## end GETOPTS ###################
