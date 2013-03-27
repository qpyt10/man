#!/bin/bash
#
# 06.10.08
# 09.01.09
#
#
#
#
#
#

FileToBak=$1
PathToBak="./$2"

Date=date
DateFlags="+%y%m%d"

Date=$(date $DateFlags)

CP=cp
CPFLAGS="-iv"

if (( $# == 1 )); then
PathToBak="."
fi

echo
$CP $CPFLAGS $FileToBak $PathToBak/$FileToBak.$Date &&\
echo
