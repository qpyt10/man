#!/bin/bash
################ check hostname ##################
myhost ()
#
# 18.09.07
# 15.05.08 modified
#
# function: myhost ()
# check all hostname in local $LIST
# return a global variable named as my host name
# echo $"my host name"
#
{
# LIST="myname/$HOST"
# list of possible hostname
local LIST="
theory6/theory6.chem.uniroma1.it
theory16/theory16.chem.uniroma1.it
drone/drone.caspur.it
jamaica/jamaica.caspur.it
poseidon/poseidon
theory20/theory20.chem.uniroma1.it
cineca/node248
cineca/node1309
theory23/theory23.chem.uniroma1.it
man/pwr503.caspur.it
caspur/hpc2.caspur.it
"
#################### GETOPTS #####################
# 10.04.07
# 27.09.07 modified
while getopts ":hl" OPTS
do
 case $OPTS in
 l) echo "$LIST" ; exit 0 ;;
 h) echo -e "
NAME
\t$0
\nDESCRIPTION
\tcheck all hostname in local \$LIST
\treturn a global variable named as $\"my host name\"
\techo $\"my host name\"
\nOPTIONS
\t-l\tview local \$LIST
"
 exit 0 ;;
 esac
done
shift $(($OPTIND-1))
################## end GETOPTS ###################
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
flag=0
# define a global variable named as my host name
export $myname=$myname
echo $myname
break
else
flag=1
fi
done
# return status
if(($flag==1));then
echo invalid hostname
fi
return $flag
}
myhost "$@"
############## end check hostname ################
