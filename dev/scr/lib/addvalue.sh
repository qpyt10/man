#!/bin/bash
# function: addvalue (File StringVariable Value Log)
# 06.06.08
# 27.06.08 m
# modify File
# adding the StringVariable with
# StringValue = Value
# using echo -e command
# if Log: write the echo command string in file Log
# ATTENTION! safe the quotas!
addvalue ()
{
# check input
if (( $# == 0 ));then
echo -e  "
NAME
\t$0
\nSYNOPSIS
\tvalue File StringVariable Value [Log]
\nDESCRIPTION
\tmodify File
\tadding the StringVariable with
\tStringValue = Value
\tusing echo -e command
\tif Log: write the echo command string in file Log
\tATTENTION! safe the quotas!
"
exit 1
fi
local file=$1
local string=$2
local value=$3
local log=$4
local rnd=$RANDOM
local bak=bak$rnd
echo -e " $string = $value" >> $file
# write to Log file
if [ $log ];then
local DATE=$(date '+%d/%m/%y %H:%M:%S %a')
local iniz=${value:0:1}
if [[ $iniz == '"' ]];then
local iniz="'"
else
local iniz='"'
fi
#echo -e "# $DATE" >> $log
echo -e "# $string = $value in $file" >> $log
echo -e "echo -e $iniz $string = $value $iniz >> $file
" >> $log
fi
}
# end function addvalue
addvalue "$@"
