#!/bin/bash
# function: value (File OldString NewString Log)
# 18.04.08
# 24.05.10 m
# modify File
# replacing OldString with NewString
# using sed -e command
# if Log: write the sed command string in file Log
# 
WriteHelp ()
{
local NAME=${0##*/}
echo -e  "
NAME
\t$NAME
\nSYNOPSIS
\tvalue File StringVariable Value [Log]
\nDESCRIPTION
\tmodify File
\treplacing OldString with NewString
\tusing sed -e command
\tif Log: write the sed command string in file Log
"
}
change ()
{
# check input
test $# == 0 && WriteHelp && exit 0

local -i DONE=0

local file=$1
local OldString=$2
local Newstring=$3
local log=$4
local rnd=$RANDOM
local bak1=bak1$rnd
local bak2=bak2$rnd

local -i Flag=0

# check for file
echo -n "checking for $file ... "
test ! -e $file && (( Flag++ ))
test $Flag == 0 && echo yes || echo no || return $Flag

# add blank space at the beginning of each line
sed "s/^/\ /" $file > $bak1

#check for string
echo -n "checking for $OldString ... "
Found=`grep -c "$OldString" $bak1`
test $Found == 0 && (( Flag++ ))
test $Flag == 0 && echo yes || echo no

# only for write correct log file
local Command="sed -e \"s/$OldString/$Newstring/g\" $bak1 > $bak2 && mv $bak2 $bak1" 


# substitu value
test $Flag == 0 && \
sed -e "s/$OldString/$Newstring/g" $bak1 > $bak2 && mv $bak2 $bak1


# delete blank space at the beginning of each line
sed "s/^ //" $bak1 > $file && rm $bak1

### write Log file ###
if [ $log ];then
local DATE=$(date '+%d/%m/%y %H:%M:%S %a')
local iniz=${value:0:1}
if [[ $iniz == '"' ]];then
local iniz="'"
else
local iniz='"'
fi
echo -en "# substitute $OldString with $Newstring in $file \t\t $DATE
sed $iniz s/^/\ / $iniz $file > $bak1
$Command
sed $iniz s/^ // $iniz  $bak1 > $file && rm $bak1
" >> $log
fi
# end write Log file #

return $Flag
}
# end function value
change "$@"
