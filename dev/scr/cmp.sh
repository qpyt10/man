#!/bin/bash
#
# 10.04.07
# 15.05.08 modified
#
#
# 1 parameters ( DIR_JOB )
# dgf [-opt] DIR_JOB 
#
#
##################################################
mydate=`date '+%d/%m/%y %H:%M:%S %a'`


# default variables ##############################

METHOD=DGF	# default method
VERS=20.11.07	# default version
POINTS=10000	# default number of points
SYSTEM=he2h	# default system
LOOP=1		# default number of submitted job
HOURS=1		# default number of hours
TYPE=serial	# default type of job = serial
TIME=1:00:00	# default time (format hh:mm:ss)

# default file ###################################

RUNFILE=go	# file with the script

FILE_BJ=bj	# file with the qsub


################ check hostname ##################
chk_host ()
#
# 18.09.07
# 10.04.08 modified
#
# check all hostname in local $LIST
# return a global variable named as my host name
#
#
#
#
{
# LIST="myname/$HOST"
# list of possible hostname
# (in listhost.txt)
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
#echo $myname
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
chk_host
############## end check hostname ################


# FUNCTION #######################################

error ()
{
echo "**** ERROR: $1 ****"
exit 1
}


# only for DGF
MAKE=0		# default make=0 (TOT.out)
make_fin ()
{
declare -ir MAKE=$1
case $MAKE
  0) NAME_OPT=TOT ;;
  1) NAME_OPT=EIG ;;
  2) NAME_OPT=1Ds ;;
  4) NAME_OPT=BAD ;;
  8) NAME_OPT=PWs ;;
 16) NAME_OPT=2Ds ;;
100) NAME_OPT=TOT ;;
  *) error "illegal value of \$MAKE" ;;
esac
}

# only for DGF
wrt_fin ()
{
declare -ir MAKE=$1
FIN=fin.dat
BAK=fin.dat.bak
echo -e "sed -e \"s/make.=.*/make\ =\ $MAKE/g\" $FIN > $BAK
cp $BAK $FIN
"
}

# end function ###################################


# getopts for option ############################
while getopts ":hp:t:s:v:l:m:n:q:f:j:od:" OPTS
do
 case $OPTS in
 h) HELP=HELP			;;
 # print the help
 p) POINTS=$OPTARG		;;
 # set the number of points
 t) HOURS=$OPTARG		
    TIME=$HOURS:00:00		;;
 # set the number of hours of the job $HOURS:00:00
 o) QSUB_LONG="-q long_smp"	;;
 # long queue until 72 hours (needed for $HOURS>24 for poseidon)
 s) SYSTEM=$OPTARG		;;
 # set the system
 m) METHOD=$OPTARG		;;
 # set the method
 v) VERS=$OPTARG		;;
 # choose the version of the code
 l) LOOP=$OPTARG		;;
 # how many jobs submitted
 n) NAME_OPT=$OPTARG		;;
 # add option to name_job
 f) MAKE=$OPTARG		;;
 # write in fin.dat make=$OPTARG
 j) JOB_TYPE=$OPTARG		;;
 # set serial or parallel
 q) QUEUE=$OPTARG		;;
 # select a queue
 d) DEPEND=$OPTARG		;;
 # select manually a hold (depend) option
 esac
done

if [ $DGF ];then
make_fin $MAKE
fi

shift $(($OPTIND-1))

####################### for HELP #######################

if [ $HELP ];then
echo -e "
NAME
\tdgf - submit a job

SYNOPSIS
\tdgf [OPTION] name_job

DESCRIPTION
\twrite the output in:
\thome/method/system/name_job


\t-v \tversion DD.MM.YY (also DD.MM)
\t   \tdefault: $VERS

\t-j \ttype of job (serial or parallel)
\t   \tdefault: $TYPE
\t   \ts for serial
\t   \tp for parallel
\t   \t\tp[processor]
\t   \t\tfor poseidon
\t   \t\tp[network][nodes][processor]
\t   \t\tnetwork: i - infiniband ; e - ethernet

\t-q \tselect a queue

\t-p \tnumber of points \$VERX_\$POINTS.x'
\t   \tby default $POINTS

\t-t \ttime \$TIME
\t   \tby default $TIME

\t-o \tfor long queues until 72 hours
\t   \tqsub with the option -q long_smp
\t   \tneede for \$HOURS > 24

\t-l \tloops
\t   \thow many times run the job

\t-f \tset the value of make in fin.dat
\t   \tspecify also the name_job

\t-d \tset manually the dependence of the job
\t   \tqsub with the hold option

\t-n \tadd options to the name_job
\t   \tby default name_job.$NAME_OPT

\t-m \tmethod
\t   \tby default $METHOD

\t-s \tsystem
\t   \tby default $SYSTEM

\t-h \thelp
"
exit 0
fi
####################### end HELP #######################


# check on parameters ########################

if (( $# == 0 ));then
error "no parameters"
fi

if [ $poseidon ];then
if [[ $HOURS > 24 ]];then # number of hours
 if [ ! = $LONG_SMP ];then
 echo "for \$TIME > 24:00:00 option -q is needed"
 exit 1
 fi
fi
fi

case $METHOD in
DGF) $METHOD=$METHOD ;;
CMP) $METHOD=$METHOD ;;
  *) error "unknown method" ;;
esac

# end check on parameters ####################


# inizialization of variables ####################

#####################
##### POSEIDON ######
#####################
if [ $poseidon ];then
MYSHELL=bash
CALLSHELL=/bin/$MYSHELL
PATH_HOME=$HOME
PATH_SCRATCH=$PATH_HOME
MOD_COM='module load pgi'

##################
##### CINECA #####
##################
elif [ $cineca ];then
MYSHELL=tcsh
CALLSHELL=/bin/$MYSHELL
PATH_HOME=$CINECA_DATA
PATH_SCRATCH=$CINECA_SCRATCH
MOD_SRC=". /cineca/prod/modules/init/$MYSHELL"
MOD_CLN='module purge'
MOD_COM='module load intel'
MOD_MPI='module load openmpi'
MOD_LIB='module load acml'

#################
##### DRONE #####
#################
elif [ $drone ];then
MYSHELL=tcsh
CALLSHELL=/bin/$MYSHELL
PATH_HOME=$HOME
PATH_SCRATCH=/scratch1/orlandin

###############
##### MAN #####
###############
elif [ $man ];then
MYSHELL=tcsh
CALLSHELL=/caspur/bin/$MYSHELL
PATH_HOME=$HOME
PATH_SCRATCH=$HOME

####################
##### THEORY23 #####
####################
elif [ $theory23 ];then
MYSHELL=bash
CALLSHELL=/bin/$MYSHELL
PATH_HOME=$HOME
PATH_SCRATCH=$HOME
#FIRST=nohup

####################
##### JAMAICA  #####
####################
elif [ $jamaica ];then
MYSHELL=bash
CALLSHELL=/caspur/bin/$MYSHELL
PATH_HOME=$HOME
PATH_SCRATCH=/scratch/orlandin

fi

case $MYSHELL in
bash) inz=	;;
tcsh) inz="set"	;;
   *) error "unknown shell" ;;
esac

# dir of the job (1st parameter)
DIR_JOB=$1

# name of the job (only for qsub name)
NAME_JOB=$DIR_JOB

# define PATHs ###################################

# path of the job
PATH_JOB=$PATH_HOME/$METHOD/$SYSTEM/$NAME_JOB
# path scratch
PATH_SCRATCH=$PATH_SCRATCH/$METHOD/$SYSTEM/$NAME_JOB

# default path of the program
PATH_PRG=$PATH_HOME/$METHOD/bin

case $METHOD in
DGF)
PATH_PRG=$PATH_HOME/$METHOD/$SYSTEM/$NAME_JOB
NAME_JOB=$NAME_JOB.$NAME_OPT
;;
CMP)
PATH_PRG=$PATH_HOME/$METHOD/bin
;;
esac

# end define PATHs ###############################


# define FILEs ###################################
case $METHOD in
DGF)
FILE_INP=fin.dat
FILE_OUT=$NAME_OPT
# file to check for restarting procedure
# (only for the eigenproblem)
FILE_RST='restart.dat'
;;
CMP)
FILE_INP=""
FILE_OUT="
CMPTool.log
outpos.xyz
outvel.xyz
Observables
MeanSquareDisplacement
Averages
RmsAverages
"
FILE_RST=RESTART
;;
esac
# end define FILEs ###############################


# check on job ###################################

TYP=${JOB_TYPE:0:1}
# $TYP=s -> serial
# $TYP=p -> parallel

case $TYP in
# serial job
s)TYPE=serial;PROCS=1;;
# parallel job
p)TYPE=parallel
#####################
##### POSEIDON ######
#####################
if [ $poseidon ];then
# select network
# NETWORK is the type of parallel
# i -> InfiniBand
# e -> Ethernet
NETWORK=${JOB_TYPE:1:1}
case $NETWORK in
e)NETWORK=eth;MOD_MPI='module load mpich'  ;;
i)NETWORK=ib ;MOD_MPI='module load mvapich';;
esac
# number of processors
NODES=${JOB_TYPE:2:1}
PROCSPN=${JOB_TYPE:3:2}
PROCS=`echo "$NODES*$PROCSPN"|bc -l`
# mpi
MPI_RUN=mpiexec
MPI_OPT="-np $PROCS"
# qsub
QSUB_PAR="-l nodes=$NODES:ppn=$PROCSPN:$NETWORK"
##################
##### CINECA #####
##################
elif [ $cineca ];then
PROCS=${JOB_TYPE:1:2}
# mpi
MPI_RUN=mpirun
MPI_OPT="-n $PROCS"
###############
##### MAN #####
###############
elif [ $man ];then
PROCS=${JOB_TYPE:1:2}
# mpi
MPI_RUN=poe
# qsub
QSUB_PAR="-pe mp $PROCS"
SOURCE="source /sge/sp5/common/sge_mpisetup.csh"
####################
##### THEORY23 #####
####################
elif [ $theory23 ];then
PROCS=2
# mpi
MPI_RUN=mpiexec
MPI_OPT="-np $PROCS"
####################
##### JAMAICA  #####
####################
elif [ $jamaica ];then
PROCS=${JOB_TYPE:1:2}
# mpi
MPI_RUN=/opt/mpi/bin/mpiexec
MPI_OPT="-n $PROCS"
# qsub
QSUB_PAR="-pe mp $PROCS"
fi
;;
esac

# end check on job ###############################



# check for name of program ######################

case $METHOD in
DGF)
# take only DDMM from the $VERS (DD.MM.YY)
VERX=`echo $VERS | cut -c 1-2,4-5`
# name of the program DDMM.x (DDMM_$TYPE_$POINTS.x)
PRG_POINTS="_$POINTS"
PRG_TYPE=${TYPE:0:3}
PRG_TYPE="_$PRG_TYPE"
PRG=$VERX$PRG_TYPE$PRG_POINTS.x
;;
CMP)
PRG=CMPTool-serial.x
;;
esac

# end check for name of program ##################



# procedure to confirm the submission of the job #

# general
echo -e "
$METHOD calculation of:
system\t\t$SYSTEM
job\t\t$NAME_JOB
in the path\t$PATH_JOB
with:
program\t$PRG
prg path\t$PATH_PRG
"
# type
echo -e "type\t\t$TYPE"
if [[ $TYP == p ]];then
if [ $poseidon ];then
echo "
network             = $NETWORK
number of nodes     = $NODES
number of processor = $PROCSPN
--------------------------
total number        = $PROCS"
else
echo "
number of processor = $PROCS"
fi # on poseidon
fi # on $TYP

# type
if [ $TIME ];then
echo "with the submitting time $TIME"
else
echo "with the default ($TIME) submitting time"
fi

# queue
if [ $QUEUE ];then
echo "in the queue: $QUEUE"
fi

# depend
if [ $DEPEND ];then
echo "in depend of: $DEPEND"
fi

# DGF #
if [ $DGF ];then
echo -e "\nin fin.dat: make = $MAKE -> with the name $NAME_OPT"
fi

if [[ $LOOP = 1 ]];then
 echo "
do you want to submit this job? (y,[n])"
else
 echo "
do you want to submit this job $LOOP times? (y,[n])"
fi

# read the answer
read answer
if [[ $answer != [y] ]];then
 echo EXIT
 exit 1
fi

# end procedure to confirm the submission of job #


# create and cd to the PATH_JOB ##################

if [[ ! -f $PATH_JOB ]];then
echo "$PATH_JOB doesn't exist"
echo "do you want to create it? (y/[n])"
read answer
if [[ $answer != [y] ]];then
 echo exit
 exit 1
fi
mkdir -p $PATH_JOB
fi

cd $PATH_JOB 


#
#
#
#XXXXX fino qui rivisto 15.05.08 XXXXXXXXXXXXXXXXXX#
#
#
#
#


############### write the $RUNFILE ################

#### create the RUNFILE
if [ -f $RUNFILE ];then
rm $RUNFILE
fi
touch $RUNFILE
chmod 700 $RUNFILE

#### call shell
echo "#!$CALLSHELL" >> $RUNFILE

#### write date
echo -e "\n# $mydate\n" >> $RUNFILE

#### write source
echo -e "\n$SOURCE\n" >> $RUNFILE

#### define path
echo -e "\n# define variables #
\n# path job
$inz PATH_JOB=$PATH_JOB
\n# path scratch
$inz SCRATCH=$PATH_SCRATCH
\n# program:
$inz PRG=$PRG
$inz PATH_PRG=$PATH_PRG
\n# end define variables #
" >> $RUNFILE

#### make work dir
echo -e "\n# procedure to check for work dir #" >> $RUNFILE
case $SHELL in
bash) 
echo "
if [ ! -e \$SCRATCH ];then
mkdir -p \$SCRATCH
fi
" >> $RUNFILE
;;
tcsh)
echo "
if ( ! -e \$SCRATCH ) then
mkdir -p \$SCRATCH
endif
" >> $RUNFILE
;;
esac
echo "# end procedure to check for work dir #" >> $RUNFILE

#### cd to work dir
echo -e "\n# cd to work dir #
cd \$SCRATCH
" >> $RUNFILE

if [[ $PATH_JOB != $PATH_SCRATCH ]];then
#### copy program and input file
echo -e "\n# copy program and input file #
cp \$PATH_PRG/\$PRG       \$SCRATCH && echo prg copied
" >> $RUNFILE
for i in `echo $FILE_INP`
do
echo -e "
cp \$PATH_JOB/$i \$SCRATCH && echo $i copied
" >> $RUNFILE
done
echo -e "# end copy program and input file #" >> $RUNFILE

### DGF ###
if [ $METHOD == DGF ];then
#### procudere for restart
#### (onlyif $NAME_OPT=EIG)
if [[ $NAME_OPT = "EIG" ]];then
echo -e "\n# procedure for restart #
$inz FILE_RST=$FILE_RST
$inz FILE_RST=\$PATH_JOB/\$FILE_RST
" >> $RUNFILE
case $SHELL in
bash)
echo "
if [ -e \$FILE_RST ];then
STATUS=\`cat \$FILE_RST\`
  if [ \$STATUS == ' finish' ];then
   exit
  fi
fi
" >> $RUNFILE
;;
tcsh)
echo "
if ( -e \$FILE_RST ) then
set STATUS=\`cat \$FILE_RST\`
  if ( \$STATUS == ' finish' ) then
   exit
  endif
endif
" >> $RUNFILE
;;
esac
echo "# end procedure for restart #
" >> $RUNFILE
fi # on $NAME_OPT = EIG

#### if $NAME_OPT != EIG && TOT -> copy Eigv.dat
if [[ $NAME_OPT != "EIG" && $NAME_OPT != "TOT" ]];then
echo -e "\n# copy Eigv.dat #
cp \$PATH_JOB/\$FILE_EGV \$SCRATCH && echo Eigv.dat copied
# end copy Eigv.dat #
" >> $RUNFILE
fi # on $NAME_OPT != EIG && TOT

#### modify fin.dat
echo -e "\n# modify fin.dat #" >> $RUNFILE
wrt_fin $MAKE >> $RUNFILE
echo -e "\n# end modify fin.dat #\n" >> $RUNFILE

fi # on $METHOD = DGF


##### load module
echo -e "\n# load module #
$MOD_SRC
$MOD_CLN
$MOD_COM
$MOD_LIB
$MOD_MPI
# end load module #
"  >> $RUNFILE

#### run prg.x
echo -e "\n# run prg.x #
echo running prg
$FIRST time $MPI_RUN $MPI_OPT \$SCRATCH/\$PRG
# end prg.x #
" >> $RUNFILE


if [[ $PATH_JOB != $PATH_SCRATCH ]];then
#### copy output files
echo -e "\n# copy output files #" >> $RUNFILE
for i in `echo $FILE_OUT`
do
echo -e "
cp $i \$SCRATCH && echo copied $i
" >> $RUNFILE
done
echo -e "\n# end copy output files #" >> $RUNFILE
fi


### DGF ###
if [[ $METHOD == DGF ]];then
#### if $NAME_OPT == EIG -> copy Eigv.dat
if [[ $NAME_OPT = "EIG" ]];then
echo -e "\n# copy Eigv.dat #
#gzip \$FILE_EGV
#cp \$FILE_EGV.gz \$PATH_JOB
cp \$FILE_EGV \$PATH_JOB
#end copy Eigv.dat #
" >> $RUNFILE
fi # on $NAME_OPT == EIG
fi # on $METHOD == DGF

fi # on $PATH_JOB

echo -e "
# system\t$SYSTEM
# job\t\t$NAME_JOB
# job path\t$PATH_JOB
# type\t\t$TYPE
# processor\t$NPC
# program\t$PRG
# program path\t$PATH_PRG
# points\t$POINTS
# time\t\t$HOURS:00:00
# depend\t\t$DEPEND
" >> $RUNFILE

############### end write the $RUNFILE ###############


#################### qsub options ####################

#####################
##### POSEIDON ######
#####################
if [ $poseidon ];then
QSUB=qsub
QSUB_NAME="-N $NAME_JOB"
QSUB_TIME="-l walltime=$TIME"
QSUB_OPTN="-j oe $QSUB_OPTN"
QSUB_PATH="-e $PATH_JOB"
if [ $QUEUE ];then
QSUB_QUEU="-q $QUEUE"
fi
if [ $DEPEND ];then
QSUB_HOLD="-Wdepend=afterok:$DEPEND"
fi
if (( $MAKE == 0 ));then
# if make=0 doesn't send mail
QSUB_OPTN="-m a $QSUB_OPTN"
else
QSUB_OPTN="-m ae $QSUB_OPTN"
fi

#################
##### DRONE #####
#################
elif [ $drone ];then
QSUB=qsub
QSUB_NAME="-N $NAME_JOB"
QSUB_OPTN="-j y $QSUB_OPTN"
QSUB_PATH="-e $PATH_JOB"
if [ $QUEUE ];then
 if [[ $QUEUE == "cp" ]];then
 QSUB_QUEU="-pe cp 1"
 else
 QSUB_QUEU="-q $QUEUE"
 fi
fi
if [ $DEPEND ];then
QSUB_HOLD="-hold_jid $DEPEND"
fi
if (( $MAKE == 0 ));then
# if make=0 doesn't send mail
QSUB_OPTN="-m a $QSUB_OPTN"
else
QSUB_OPTN="-m ae $QSUB_OPTN"
fi

##################
##### CINECA #####
##################
elif [ $cineca ];then
QSUB=bsub
QSUB_CINC="<"
QSUB_NAME="-J $NAME_JOB"
QSUB_TIME="-W $TIME"
QSUB_OPTN="-n $PROCS $QSUB_OPTN"
QSUB_OPTN="-u orlandin@caspur.it $QSUB_OPTN"
if [ $QUEUE ];then
QSUB_QUEU="-q $QUEUE"
fi
if [ $DEPEND ];then
QSUB_HOLD="$DEPEND"
fi

###############
##### MAN #####
###############
elif [ $man ];then
QSUB=qsub
QSUB_NAME="-N $NAME_JOB"
QSUB_TIME="-l h_rt=$TIME"
#QSUB_OPTN="-j oe $QSUB_OPTN"
QSUB_PATH="-e $PATH_JOB"
if [ $QUEUE ];then
QSUB_QUEU="-q $QUEUE"
fi
if (( $MAKE == 0 ));then
# if make=0 doesn't send mail
QSUB_OPTN="-m a $QSUB_OPTN"
else
QSUB_OPTN="-m ae $QSUB_OPTN"
fi

####################
##### THEORY23 #####
####################
elif [ $theory23 ];then
./$RUNFILE
exit 0

####################
##### JAMAICA  #####
####################
elif [ $jamaica ];then
QSUB=qsub
QSUB_NAME="-N $NAME_JOB"
QSUB_TIME="-l h_rt=$TIME"
if [ $QUEUE ];then
QSUB_QUEU="-q $QUEUE"
fi
if (( $MAKE == 0 ));then
# if make=0 doesn't send mail
QSUB_OPTN="-m a $QSUB_OPTN"
else
QSUB_OPTN="-m ae $QSUB_OPTN"
fi
if [ $DEPEND ];then
QSUB_HOLD="-hold_jid $DEPEND"
fi

fi

################## end qsub options ##################



########## procedure to submit the $RUNFILE ##########

# begin of the loop on $LOOP
for a in `seq $LOOP`
do

if [[ $LOOP != 1 ]];then
 echo "submitting the job number: $a"
fi

# find for running job with the same name
if [ $poseidon ];then
GREP_JOB=`echo $NAME_JOB | cut -c 1-15`
OLD_JOB=`qstat | grep $USER | grep "$GREP_JOB" | cut -c 1-6 | tac | head -1`
elif [ $cineca ];then
OLD_JOB=`bjobs -l | tac | grep "$NAME_JOB" | head -1 | cut -c 6-11`
elif [ $jamaica ];then
OLD_JOB=`qstat|grep $USER|grep "$NAME_JOB"|tac|awk '{print $1}'|head -1`
fi

# if there is not other running job with the same name
if [ ! $OLD_JOB ];then  # start if on job

  # check if there is a file called restart.dat
  # (only for the eigenproblem)
  if [[ $NAME_OPT = "EIG" ]];then  # start if on nameopt (only for EIG)
    if [ -e $FILE_RST ];then  # start if on file
    STATUS=`cat $FILE_RST`

      # if the status of restart is finish -> exit
      if [[ $STATUS = ' finish' ]];then  # start if on status
        echo "status of restart = finish"
        exit 0
      fi # end if on status

    fi # end if on file
  fi # end if on nameopt (only for EIG)

# if there is other running jobs with the same name
else
# submitting this job with the option hold
if [ $poseidon ];then
QSUB_HOLD="-Wdepend=afterok:$OLD_JOB"
elif [ $drone ];then
QSUB_HOLD="-hold_jid $OLD_JOB"
elif [ $cineca ];then
QSUB_HOLD="-w \"done($OLD_JOB)\""
elif [ $jamaica ];then
QSUB_HOLD="-hold_jid $OLD_JOB"
fi
fi # end if on job

### write qsub command in $RUNFILE
echo -e "\n# $QSUB $QSUB_QUEU $QSUB_HOLD $QSUB_LONG $QSUB_TIME $QSUB_OPTN $QSUB_NAME $QSUB_PATH $QSUB_PAR $QSUB_CINC $RUNFILE" >> $RUNFILE

### write and run the qsub file ($FILE_BJ)
if [ -e $FILE_BJ ];then
rm $FILE_BJ
fi
touch $FILE_BJ
chmod u+x $FILE_BJ
echo "$QSUB $QSUB_QUEU $QSUB_HOLD $QSUB_LONG $QSUB_TIME $QSUB_OPTN $QSUB_NAME $QSUB_PATH $QSUB_PAR $QSUB_CINC $RUNFILE" >> $FILE_BJ
./$FILE_BJ

done
# end loop on $LOOP

exit 0
