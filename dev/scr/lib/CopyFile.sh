#!/bin/bash
#
# 02.07.09
# 02.07.09 m
#
# CopyFile copy files
# CopyFile [-opt] SourceDir DestinationDir FileToCopy NewName
#
# ATTENTION for a list of file use quotas
#
WriteHelp ()
{
local NAME=${0##*/}
echo -e "
NAME
\t$NAME -- copy files

SYNOPSIS
\t$NAME [-opt] SourceDir DestinationDir FileToCopy NewName

DESCRIPTION
\tATTENTION for a list of file use quotas

\tThe following options are available:

\t-h\tdisplay this help
"
}

Exit ()
{
local -i Flag=$1
test $Flag != 0 && exit $Flag
echo done.
exit $Flag
}

CheckDir ()
{
local File=$1
local -i FlagError=0
echo -en "checking directory $File ... "
# check if File exists
test ! -e $File && (( FlagError++ ))
# check if File is a directory
test ! -d $File && (( FlagError++ ))
# check error flag
test $FlagError == 0 && echo yes || echo no

return $FlagError
}

CheckFile ()
{
local File=$1
local -i FlagError=0
echo -en "checking file $File ... "
test ! -e $File && (( FlagError++ ))
test $FlagError == 0 && echo yes || echo no
return $FlagError
}

CopyFile ()
{
test $# -eq 0 && WriteHelp && exit 0
local DirOrig=$1
local DirDest=$2
local FilesOrig="$3"

read -r -a FilesDest <<< "$4"

local -i FlagError
FlagError=0

### check arguments ###

# check source dir
for ThisDir in $DirOrig
do
  CheckDir $ThisDir
  test $? != 0 && (( FlagError++ ))
done

# check destination dir
for ThisDir in $DirDest
do
  CheckDir $ThisDir
  test $? != 0 && (( FlagError++ ))
done

# check for file
for ThisDir in $DirOrig
do
  for ThisFile in $FilesOrig
  do
    CheckFile $ThisDir/$ThisFile
    test $? != 0 && (( FlagError++ ))
  done
done

# result?
test $FlagError != 0 && Exit $FlagError

# end check arguments #


### copy files ###
for ThisDirOrig in $DirOrig
do

  for ThisDirDest in $DirDest
  do

    Count=0
    for ThisFile in $FilesOrig
    do
      echo -n "coping $ThisFile ... "
      cp $ThisDirOrig/$ThisFile $ThisDirDest/${FilesDest[$Count]}
      test $? != 0 && (( FlagError++ ))
      test $FlagError == 0 && echo yes || echo no
      (( Count++ ))
    done

  done
done
# end copy files #

Exit $FlagError

}
CopyFile "$@"
