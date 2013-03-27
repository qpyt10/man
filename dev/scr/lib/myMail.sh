#!/bin/bash
# function: myMail (To Subject Body [From])
#
# 14.05.08
# 20.05.09 m
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
   (
      echo "$3"
   ) | mail -s $2 $1
}
# end function myMail

myMail "$@"
