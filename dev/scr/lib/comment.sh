#!/bin/bash
# function comment (File StringVariable StringComment Log)
# 18.04.08
# 27.06.08 m
# modify File
# comment StringVariable with StringComment
# using sed -e command
# if Log: write the sed command string in file Log
comment ()
{
# check input
if (( $# == 0 ));then
echo -e "
NAME
\t$0
\nSYNOPSIS
\tcomment File StringVariable StringComment [Log]
\nDESCRIPTION
\tmodify File
\tcomment StringVariable with StringComment
\tusing sed -e command
\tif Log: write the sed command string in file Log
"
exit 1
fi
local file=$1
local string=$2
local comment=$3
local log=$4
local rnd=$RANDOM
local bak=bak$rnd
sed -e "s/.*$string/$comment\ $string/g" $file > $bak
mv $bak $file
# write to Log file
if [ $log ];then
local DATE=$(date '+%d/%m/%y %H:%M:%S %a')
#echo -e "# $DATE" >> $log
echo -e "# $comment $string in $file" >> $log
echo -e "sed -e \"s/.*$string/$comment\ $string/g\" $file > $bak
mv $bak $file
" >> $log
fi
}
# end function value
comment "$@"
