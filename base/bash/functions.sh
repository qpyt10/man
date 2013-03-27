#!/bin/bash
#
# 16.01.13
# 07.03.13 m
#

function DEBUG ()
{
    [ "$_DEBUG" == "on" ] &&  echo -e "[DEBUG] $@"
}

