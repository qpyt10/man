#!/bin/bash
if (( $# == 0 ));then
HELP=yes
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

\t-o \toption
\t   \tdescription

\t-h \thelp
"
exit 0
fi
############# end HELP #############
