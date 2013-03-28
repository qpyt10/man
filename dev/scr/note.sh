#!/bin/bash
# 30.05.08
# 15.12.08 m
#
# add note in $HOME/srg/note
#
# usage:
# 	note DD/MM/YY note
#
# ATTENTION don't use quotas

### Set variables ###
File=note
FilePath=$HOME/srg
# end set variables #


### don't change below ###

if (( $# == 0 ));then
HELP=yes
fi

#################### GETOPTS #####################
# 10.04.07
# 27.09.07 modified
while getopts ":hf:p:v" OPTS
do
 case $OPTS in
 h) HELP=yes	;;
 f) File=$OPTARG;;
 p) FilePath=$OPTARG;;
 v) View=yes	;;
 esac
done
shift $(($OPTIND-1))
################## end GETOPTS ###################

File=$FilePath/$File

############### HELP ###############
# 10.04.07
# 27.09.07 modified
if [ $HELP ];then
echo -e "
NAME
\tnote

SYNOPSIS
\tnote [OPTION] DD/MM/YY note

DESCRIPTION
\tadd note in $File
\tATTENTION don't use quotas

\t-f \tspecify file
\t   \tdefault: $File

\t-p \tspecify path file
\t   \tdefault: $FilePath

\t-v \tview note for day

\t-h \thelp
"
exit 0
fi
############# end HELP #############


# check the number of parameters

if [ ! $View ];then

if (( $# < 2 ));then
echo invalid parameters
exit 1
fi

fi

DateInput=$1

# return date
DateInput=$(ReturnDate $DateInput)

# check for correct date

Check=$DateInput
Day=${Check%/*/*}
Month=${Check#*/}
Month=${Month%/*}
Year=${Check#*/*/}

CheckDate $Day $Month $Year
flag=$?
if(($flag!=0));then exit $flag;fi

if [ $View ];then
grep "$Day/$Month/$Year" $File
exit 0
fi

# read note
# save date and note in Note

Note=$Day/$Month/$Year
for i in $(seq $#)
do
shift
Note="$Note $1"
done

# update File

echo "$Note" >> $File \
&& echo -e "\nsuccesfully update  $File with\n\t$(tail -1 $File)\n"

if (( $? != 0 ));then
echo -e "\nerror updating $File with\n\t$Note\n"
exit 1
fi

exit 0

# BUGs REPORT ####
#  non prende apostrofo e virgolette ... safe quotas 
