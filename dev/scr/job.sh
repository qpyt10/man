#!/bin/bash
#
# 22.08.07
# 26.09.08 modified
#
# job [OPTION]
# 
# qstat -u $USER in the format:
# job id | job name | status | time | queue
#
### setting LOG ###
logFile=job.log
logPath=$HOME/log
log=$logPath/$logFile



### don't change below ###



while getopts ":hrt:s" OPTS
# 27.09.07 m
do
 case $OPTS in
 h) HELP=yes	;;
 r) READ=yes	;;
 t) READ=yes
    NumTail=$OPTARG
    ;;
 s) SILENT=yes ;;
 esac
done
shift $(($OPTIND-1))



if [ $HELP ];then
# 19.09.08 m
echo -e "
NAME
\t${0##*/}

SYNOPSIS
\t${0##*/} [OPTION]

DESCRIPTION
\t${0##*/} shows running and queuing jobs
\tupdate the log file
\tdefault log file: $log 

\t-r \tread log file with cat

\t-t \tread log file with tail
\t   \t${0##*/} -t lines

\t-s \tdon't update log file

\t-h \thelp
"
exit 0
fi


################### FUNCTIONs ####################

mydate ()
# 15.05.08
# return the date in format:
# dd/mm/yy hh:mm:ss Day
{
date '+%d/%m/%y %H:%M:%S %a'
}



chk_host ()
# 23.01.08 m
# check all hostname in local $LIST
# define:
# 1) global variable $myname
#    named as the my host name
# 2) global variable $myhost
#    with my host name
#
{
# LIST="myname/$HOST"
# list of possible hostname
# (in listhost.txt)
local LIST="
theory6/theory6.chem.uniroma1.it
drone/drone.caspur.it
jamaica/jamaica.caspur.it
poseidon/poseidon
theory20/theory20.chem.uniroma1.it
cineca/node248
theory23/theory23.chem.uniroma1.it
man/pwr503.caspur.it
"
#     NUML=number of host
local NUML=$(echo $LIST|wc -w)
local flag
local i
declare -i i flag
for i in `seq $NUML`
do
#       name=line of LIST
local   name=$(echo $LIST|awk "{print $ $i}")
#     myname=name before / (my host name)
local myname=${name%*/*}
#     itname=name after /  ($HOST)
local itname=${name#*/*}
if [ $HOSTNAME == $itname ];then
export $myname=$myname
# define a global variable named as my host name
export myhost=$myname
# $myhost contains my host name (global variable)
return 0
else
flag=1
fi
done
if (( $flag == 1 ));then
echo invalid hostname
return $flag
fi
}
chk_host


################# end function ###################




if [ $READ ];then
if [[ ! -e $log ]];then
  echo -e "\nERROR file $log doesn't exist"
  exit 1
fi

# write on screen
echo -e "\nReading log file $log\n"

if [[ $NumTail != ''  ]];then
tail -$NumTail $log
else
cat $log
fi

# write on screen
echo -e "\ndone"
exit 0
fi


RND=$RANDOM
F1=bak1$RND # id
F2=bak2$RND # name
F3=bak3$RND # status
F4=bak4$RND # time
F5=bak5$RND # queue
COM="qstat"
COM_OPT="-u"
COM_USR="$COM $COM_OPT $USER"


case $myhost in
poseidon)
$COM_USR | grep $USER | awk '{print $1}' | cut -c 1-6 > $F1
$COM     | grep $USER | awk '{print $2}'              > $F2
$COM_USR | grep $USER | awk '{print $3}'              > $F5
$COM_USR | grep $USER | awk '{print $10,$11}'         > $F3
$COM_USR | grep $USER | awk '{print $9}'              > $F4
;;
jamaica|man)
$COM_USR | grep $USER | grep -v SLAVE | awk '{print $1}'    > $F1
$COM_USR | grep $USER | grep -v SLAVE | awk '{print $3}'    > $F2
$COM_USR | grep $USER | grep -v SLAVE | awk '{print $5}'    > $F3
$COM_USR | grep $USER | grep -v SLAVE | awk '{print $6,$7}' > $F4
$COM_USR | grep $USER | grep -v SLAVE | awk '{print $8}' > $F5
;;
esac

# write on screen
echo -e "\n----------- $(mydate) -----------"
paste $F1 $F2 $F3 $F4 $F5
echo -e "\ndone"

# check on silent flag
if [ ! $SILENT ];then
# write on log file
echo "----------- $(mydate) -----------">>$log
paste $F1 $F2 $F3 $F4 $F5 >> $log
fi

# remove work files 
rm -f $F1 $F2 $F3 $F4 $F5
