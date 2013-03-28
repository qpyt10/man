#!/bin/bash
#
# 09.12.09
# 10.12.09 m
#
#
#
#
#
#

### define PBS options ###
#
#PBS -l nodes=1:ppn=2
#PBS -e ~/scr/svl
#PBS -A adu
#PBS -t 1-3
#PBS -j oe
#
# end define PBS options #

JobID=$PBS_ARRAYID
JobID=1

LogSwap=swap.log

# configure temp and id
Temp[1]=300
Temp[2]=500
Temp[3]=750
Temp[4]=1000
Temp[5]=1250
Temp[6]=1500
MaxID=6




### useful function

Tmy ()
# Tmy JobID 
# return T of the job
{
echo ${Temp[$1]}
}


Tswap ()
# Tswap JobID SwapID
# return T of the swapping job
{

local lJobID=$1
local lSwapID=$2

  if [[ $lJobID == 1 ]];then
   local IndexSwap[0]=1
   local IndexSwap[1]=1
elif [[ $lJobID == $MaxID ]];then
   local IndexSwap[0]=-1
   local IndexSwap[1]=-1
else
   local IndexSwap[0]=1
   local IndexSwap[1]=-1
fi


let "ThisIndex=lSwapID%2"
ThisIndex=${IndexSwap[$ThisIndex]}
let "ThisIndex=ThisIndex+lJobID"
TempSwap=${Temp[$ThisIndex]}

echo $TempSwap
}

ThrowRandom ()
# return a random number between 0 and 1
{
local ThisNumber=$RANDOM
local Range=100
let "ThisNumber %= $Range"
echo $ThisNumber /100 | bc -l
}

TakeRatio ()
# TakeRatio Job1 Job2 T1 T2
# return the Acceptance Ratio
# (1/k*T1 - 1/k*T2) * (V1 - V2)
# ATTENTION: use absolute path
{
Job1=$1
Job2=$2
T1=$3
T2=$4

FileObs=Observables
Kb=8.617343*10^-5

# read potential energy from the observable file of job 1
Pot1=`tail -1 $Job1/$FileObs | awk '{print $4}'`
# read potential energy from the observable file of job 1
Pot2=`tail -1 $Job2/$FileObs | awk '{print $4}'`


(1.0/($Kb * $T1) - 1.0/($Kb * $T1)) * ($Pot1 - $Pot2)


}

Swapping ()
# Swapping Job1 Job2 T1 T2
# return 1 if Random < Ratio
# return 0 if Random > Ratio
{
local Random=`ThrowRandom`
local Ratio=`TakeRatio $1 $2 $3 $4`

local Result=`echo "$Random < $Ratio" | bc -l`

return $Result
}

SwapRestart ()
# Swap the Restart File
# SwapRestart Restart1 Restart2
# ATTENTION: use absolute path
{
# ADD
local PrgSwapPath=
local PrgSwap=
$PrgSwapPath/$PrgSwap $1 $2
}
### end function


TempJob=`Tmy $JobID`

echo "`date`: starting Swap simulation" > $LogSwap

for SwapID in `seq $SwapNum`
do

# cd to job dir
# ADD
cd ...


# run job
# ADD
mpiexec ...
bakOutput _$SwapID


# touch end file with swap number
FileSwap=done_$SwapID
touch $FileSwap
echo -en "`date`: swap $SwapID ... " >> $LogSwap


# waiting for the others
# look for end file
flag=0
until [[ $flag != 0 ]];do
   test -e $JobToSwap/$FileSwap && flag=1
done


# swap with ?
TempSwap=`Tswap $JobID $SwapID`


# swapping ?
FlagSwap=`Swapping $Job $Swap $TempJob $TempSwap`


# manage the restart file
test $FlagSwap == 1 && SwapRestart $Job $Swap

test $FlagSwap == 1 && echo "yes" >> $LogSwap || echo "no" >> $LogSwap

done
