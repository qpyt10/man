#!/bin/bash
JobId ()
{
local Name=$1
local Id=$(qstat | grep $USER | grep  $Name | awk '{print $1}')
local Id=${Id%*.*}
echo $Id
}
JobId "$@"
