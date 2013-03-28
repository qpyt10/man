#!/bin/bash
# 03.06.08
# 11.12.08 m
#
# add birthday in File
#
# usage:
# 	birth DD/MM name
#
# ATTENTION don't use quotas

### set variables ###
File=birth
FilePath=$HOME/srg
# end set variables #


### don't change below ###

File=$FilePath/$File

if (( $# == 0 ));then
HELP=yes
fi

#################### GETOPTS #####################
# 10.04.07
# 27.09.07 modified
while getopts ":h" OPTS
do
 case $OPTS in
 h) HELP=yes	;;
 esac
done
shift $(($OPTIND-1))
################## end GETOPTS ###################

############### HELP ###############
# 10.04.07
# 27.09.07 modified
if [ $HELP ];then
echo -e "
NAME
\tbirth

SYNOPSIS
\tbirth [OPTION] DD/MM name

DESCRIPTION
\tadd birth in $File

\t-h \thelp
"
exit 0
fi
############# end HELP #############


# check the number of parameters

if (( $# < 2 ));then
echo invalid parameters
exit 1
fi

# check for correct date

Birth=$1
Day=${Birth:0:2}
Month=${Birth:3:2}
Year=${Birth:6:2}

CheckDate $Day $Month
flag=$?
if(($flag!=0));then exit $flag;fi


# read name
# save date and name in Birth

Birth=$Day/$Month
if [ $Year ];then
Birth=$Birth/$Year
fi

for i in $(seq $#)
do
shift
Birth="$Birth $1"
done


# update File

echo "$Birth" >> $File \
&& echo -e "succesfully update $File with\n\t$(tail -1 $File)" 

if (( $? != 0 ));then
echo -e "error updating $File with\n\t$Birth"
exit 1
fi

# BUGs REPORT
# non prende apostrofo e virgolette ... safe quotas 
