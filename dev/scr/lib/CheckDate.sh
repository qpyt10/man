#!/bin/bash
# function CheckDate ( Day Month Year )
# 03.06.08
# 18.07.08 m
# check if the date is correst
CheckDate ()
{
Day=$1
Month=$2
Year=$3

local -i flag

### month ###

case $Month in
[1-9])Month=0$Month;;
esac

case $Month in
0?|10|11|12);;
*)flag=1;;
esac

### day ###

case $Day in
[1-9])Day=0$Day;;
esac

if (( $Day > 31 || $Day < 1 ));then
flag=2
fi

case $Month in
04|06|09|11)
if (( $Day > 30 ));then
flag=3
fi
;;
02)
if (( $Day > 29 ));then
flag=3
fi
# check for bisestile
local -i bis
bis=$(echo $Year%4 | bc)
if (( $bis != 0 && $Day == 29));then
flag=4
fi
;;
esac

### year ###

case $Year in
[1-9])Year=0$Year;;
esac

local ThisYear=$(date '+%y')
local NextYear=$(date '+%y' -d 'next year')
case $Year in
$ThisYear|$NextYear);;
*)flag=5;;
esac

### error ###

case $flag in
1) echo -e "invalid month\t$Month"		;;
2) echo -e "invalid day\t$Day"			;;
3) echo -e "invalid day\t$Day/$Month"		;;
4) echo -e "year not bisestile\t$Day/$Month"	;;
5) echo -e "invalid year\t$Year"		;;
esac

return $flag

exit
}
# end function CheckDate

