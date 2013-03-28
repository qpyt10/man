#!/bin/bash
# function ReturnDate ( String )
ReturnDate ()
# 18.07.08
# 22.07.08 m
# Return the date asked with String
# in the format DD/MM/YY
{
local String=$1

local -i Flag=1
local -i FlagA=0
local -i FlagB=0

CheckReturnDate ()
{
local Wanted=$1
local ToDay=$(date '+%d/%m/%y')
local MyDay=$(date '+%d/%m/%y' -d "$Wanted")
if [[ $ToDay == $MyDay ]];then
echo $(date '+%d/%m/%y' -d "2 $Wanted")
else
echo $MyDay
fi
return 0
}

case $String in
'domani'|'tomorrow')
local Wanted=tomorrow	;;
'lun'|'lunedi'|'lunedi'|'monday')
local Wanted=monday	;;
'mar'|'martedi'|'martedi'|'tuesday')
local Wanted=tuesday	;;
'mer'|'mercoledi'|'mercoledi'|'wednesday')
local Wanted=wednesday	;;
'gio'|'giovedi'|'giovedi'|'thursday')
local Wanted=thursday	;;
'ven'|'venerdi'|'venerdi'|'friday')
local Wanted=friday	;;
'sab'|'sabato'|'sabato'|'saturday')
local Wanted=saturday	;;
'dom'|'domenica'|'domenica'|'sunday')
local Wanted=sunday	;;
*)local FlagA=1;;
esac

if (( $FlagA == 0 ));then
MyDate=$(CheckReturnDate $Wanted)
fi

case $String in
[1-9])local String=0$String;;
esac

case $String in
0?|1?|2?|30|31)
local MyDate=$String$(date '+/%m/%y');;
*)local FlagB=1;;
esac

let Flag=FlagA*FlagB
case $Flag in
0)
echo $MyDate
return 0;;
1)
echo $1
return 1;;
esac

}
# end function ReturnDate
ReturnDate "$@"
