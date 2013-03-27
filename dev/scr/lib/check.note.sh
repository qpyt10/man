#!/bin/bash
#
# 15.05.08
# 23.02.11 m
#
#
#
#
#
#

### Set default variables ###
File=note
FilePath=$HOME/srg
MailSubject=PROMO
MailTo=orlandin@caspur.it
MailCc=
MailCcBirth=qpyt10@gmail.com
# end set default variables #

#################### GETOPTS #####################
# 10.04.07
# 27.09.07 modified
while getopts "hnbptF:T:C:S:P:avA" OPTS
# here letter ..^ for options
# : for argument of options
do
 case $OPTS in
 n) File=note
    Mailsubject=PROMO
    NOTE=yes;;
 b) FileBirth=birth
    Mailsubject=BIRTHDAY
    MailCc=$MailCcBirth
    BIRTH=yes;;
 p) File=plan
    MailSubject=PLAN
    PLAN=yes;;
 t) File=todo
    MailSubject=TODO
    TODO=yes;;
 A) exit;NOTE=yes;BIRTH=yes;PLAN=yes;TODO=yes;;
 F) File=$OPTARG
    MailSubject="from $File";;
 P) FilePath=$OPTARG;;
 T) MailTo=$OPTARG;;
 C) MailCc=$OPTARG;;
 S) MailSubject=$OPTARG;;
 a) ADD=yes;;
 v) VIEW=yes;ADD=yes;;
 h) HELP=yes;;
 esac
done
shift $(($OPTIND-1))
################## end GETOPTS ###################

if (( $# == 0 ));then
   # default
   NOTE=yes
fi

############### HELP ###############
# 10.04.07
# 19.09.08 modified
if [ $HELP ];then
echo -e "
NAME
\t${0##*/}

SYNOPSIS
\t${0##*/} [OPTION] variable

DESCRIPTION
\tdescription of ${0##*/}

Option for CHECK: (default: $TODO)

\t-n \tnote
\t   \tcheck file and send mail

\t-b \tbirth
\t   \tcheck file and send mail

\t-p \tplan
\t   \tcheck file and send mail

\t-t \ttodo
\t   \tcheck file and send mail

Option for FILE:

\t-F \tname of file
\t   \tdefault: $File

\t-P \tpath of file
\t   \tdefault: $FilePath

Option for MAIL:

\t-T \tmail TO
\t   \tdefault: $MailTo

\t-C \tmail CC
\t   \tdefault: $MailCc

\t-S \tmail SUBJECT
\t   \tdefault: $MailSubject

Option for ADD:

\t-a \tadd
\t   \tdefault: $ADD

\t-v \tview
\t   \tdefault: $VIEW

\t-h \thelp
"
exit 0
fi
############# end HELP #############

### don't change below ###

############## date ###############
# function: mydate ()
# 15.05.08
# 25.07.08 modified
# return the date in format:
# dd/mm/yy hh:mm:ss Day
myDate ()
{
   local FormatDate='%d/%m/%y'
   local FormatTime='%H:%M:%S'
   local FormatDays='%a'
   local Target=
#
   for i in $(seq $#)
   do
      local Target="$Target $1"
      shift 
   done
#
   if [[ $Target == '' ]];then
      local Target=now
   else
      local FormatTime=
      local FormatDays=
   fi
#
   date "+$FormatDate $FormatTime $FormatDays" -d "$Target"
#
   return 0
}
# end function mydate #############


############## mail ###############
# functioni: myMail (To Subject Body [From])
#
# 14.05.08
# 23.02.11 m
#
# myMail To Subject Body [From]
# send mail with mail
#
myMail ()
{
   # check input
   if (( $# == 0 ));then
      echo -e  "
NAME
\t$0
\nSYNOPSIS
\tgomail To Subject Body [From]
\nDESCRIPTION
\tsend mail with mail
\tATTENTION! to save the space use quotas
\nBUGS
\tCC doesn't work
"
      exit 1
   fi
   local cc="$4"
   if [ $cc ];then
      local cc="-c $cc"
   fi
   (
      echo -e "$3"
   ) | mail -s "$2" "$1" $cc
}
# end function myMail #############

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
      local Wanted=tomorrow   ;;
   'lun'|'lunedi'|'lunedi'|'monday')
      local Wanted=monday     ;;
   'mar'|'martedi'|'martedi'|'tuesday')
      local Wanted=tuesday    ;;
   'mer'|'mercoledi'|'mercoledi'|'wednesday')
      local Wanted=wednesday  ;;
   'gio'|'giovedi'|'giovedi'|'thursday')
      local Wanted=thursday   ;;
   'ven'|'venerdi'|'venerdi'|'friday')
      local Wanted=friday     ;;
   'sab'|'sabato'|'sabato'|'saturday')
      local Wanted=saturday   ;;
   'dom'|'domenica'|'domenica'|'sunday')
      local Wanted=sunday     ;;
   *) local FlagA=1;;
   esac
   
   if (( $FlagA == 0 ));then
      MyDate=$(CheckReturnDate $Wanted)
   fi
   
   case $String in
      [1-9]) local String=0$String;;
   esac
   
   case $String in
      0?|1?|2?|30|31)
         local MyDate=$String$(date '+/%m/%y');;
      *) local FlagB=1;;
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
      [1-9]) Month=0$Month;;
   esac
   
   case $Month in
      0?|10|11|12);;
      *) flag=1;;
   esac
   
   ### day ###
   
   case $Day in
      [1-9]) Day=0$Day;;
   esac
   
   if (( $Day > 31 || $Day < 1 ));then flag=2; fi
   
   case $Month in
      04|06|09|11)
         if (( $Day > 30 ));then flag=3; fi
      ;;
      02)
         if (( $Day > 29 ));then flag=3; fi
         # check for bisestile
         local -i bis=$(echo $Year%4 | bc)
         if (( $bis != 0 && $Day == 29));then flag=4; fi
      ;;
   esac
   
   ### year ###
   
   case $Year in
      [1-9]) Year=0$Year;;
   esac
   
   local ThisYear=$(date '+%y')
   local NextYear=$(date '+%y' -d 'next year')
   case $Year in
      $ThisYear|$NextYear);;
      *) flag=5;;
   esac
   
   ### error ###
   
   case $flag in
      1) echo -e "invalid month\t$Month"           ;;
      2) echo -e "invalid day\t$Day"               ;;
      3) echo -e "invalid day\t$Day/$Month"        ;;
      4) echo -e "year not bisestile\t$Day/$Month" ;;
      5) echo -e "invalid year\t$Year"             ;;
   esac
   
   return $flag
   
   exit
}
# end function CheckDate


# set File variable
File=$FilePath/$File
# check if File exists
test ! -e "$File" && echo "$File does not exist"

# get number of the day: 1 mon, 2 tue, 3 wed, 4 thu, 5 fri, 6 sat, 7 sun
DayNum=$(date +%u)

if [ $ADD ];then

   if [ ! $VIEW ];then
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

   if [ $VIEW ];then
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
   exit
fi # end if on add


if [ $NOTE ];then

   # clean mail body
   MailBody=

   # check for note on today
   ThisDay=$(myDate today)
   ThisNote=$(grep $ThisDay $File)
   # update mail body
   test "$ThisNote" && \
      MailBody="$MailBody\nOGGI:\n$ThisNote"

   # check for note on tomorrow
   ThisDay=$(myDate tomorrow)
   ThisNote=$(grep $ThisDay $File)
   # update mail body
   test "$ThisNote" && \
      MailBody="$MailBody\nDOMANI:\n$ThisNote"

   # check mail body and send mail
   test "$MailBody" && \
      myMail "$MailTo" "$MailSubject" "$MailBody" "$MailCc"


   # report of the week

   # clean mail body
   MailBody=

   # if Monday
   # mail with report of the week
   if (( $DayNum == 1 ));then

      for i in $(seq 0 6)
      do
         GrepThisDay=$(myDate "$i day")
         WriteThisDay=$(date '+ %d/%m/%y   %A' -d "$i day")
         String=$(grep $GrepThisDay $File|sed s/^........//g)
         MailBody="$MailBody\n- $WriteThisDay\n$String"
      done
      WEEK="WEEK $(date +%V)"
      myMail "$MailTo" "$WEEK" "$MailBody"
   fi # end if on Monday

   # check mail body and send mail
   test "$MailBody" && \
      myMail "$MailTo" "$MailSubject" "$MailBody" "$MailCc"

fi # end if on NOTE


if [ $BIRTH ];then

   # clean mail body
   MailBody=

   # check for note on today
   ThisDay=$(date '+%d/%m')
   ThisNote=$(grep $ThisDay $File)
   # update mail body
   test "$ThisNote" && \
      MailBody="$ThisNote"

   # if Friday
   # mail with birth of Saturday and Sunday
   if (( $DayNum == 5 ));then
      ThisNote=
      for i in `seq 1 2`
      do
         ThisDay=$(date '+%d/%m' -d "$i days")
         ThisNote=$(grep $ThisDay $File)
         # update mail body
         test "$ThisNote" && \
            MailBody="$MailBody\n\nIn the WEEKEND:\n\n$ThisNote"
      done
   fi

   # check mail body and send mail
   test "$MailBody" && \
      myMail "$MailTo" "$MailSubject" "$MailBody" "$MailCc"

fi # end if on BIRTH


if [ $PLAN ];then

   # clean mail body
   MailBody=

   case $DayNum in
      0) ThisDay=domenica ;;
      1) ThisDay=lunedi   ;;
      2) ThisDay=martedi  ;;
      3) ThisDay=mercoledi;;
      4) ThisDay=giovedi  ;;
      5) ThisDay=venerdi  ;;
      6) ThisDay=sabato   ;;
   esac

   # check for note on today
   ThisNote=$(grep $ThisDay $File)
   # update mail body
   test "$ThisNote" && \
      MailBody="$ThisNote"

   # check mail body and send mail
   test "$MailBody" && \
      myMail "$MailTo" "$MailSubject" "$MailBody" "$MailCc"

fi


if [ $TODO ];then

   # clean mail body
   MailBody=

   # check for note on today
   ThisDay=$(myDate today)
   # check for note on today
   ThisNote=$(grep $ThisDay $File|sed  s/^........//g)
   # update mail body
   test "$ThisNote" && \
      MailBody="$ThisNote"

   # check mail body and send mail
   test "$MailBody" && \
      myMail "$MailTo" "$MailSubject" "$MailBody" "$MailCc"

fi

#test "$MailBody" || exit && \
#myMail "$MailTo" "$MailSubject" "$MailBody" "$MailCc"
