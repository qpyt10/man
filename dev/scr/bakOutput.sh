#!/bin/bash
#
# 01.10.08

Suffix=$1
PRG=CMP

if [[ $PRG = 'CMP' ]];then
FileOut="Averages Observables MeanSquareDisplacement RmsAverages outpos.xyz outvel.xyz RESTART Positions.hdf5"
fi

echo
for i in $FileOut
do
cp $i $i$Suffix && echo "succesfully cp $i $i$Suffix"

done

DiskSpace=$(du -hc $FileOut)
echo -e "\ncopied\n$DiskSpace\n\ndone."
