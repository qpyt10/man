#!/bin/bash
#
# 09.02.13
# 19.02.13 m
#
_DEBUG=off

help () {
echo -e "
NAME:
\t$(basename $0) - ...
\nUSAGE:
\t$(basename $0) host_name
\nDESCRIPTION:
\t...
"
}

# setup base_dir
base_dir=$(dirname $0)

# load useful functions
source $base_dir/functions.sh

fig_name=report
file_plt=$base_dir/plot2.plt

cd $base_dir

/usr/bin/gnuplot $file_plt 2>/dev/null

cd ..
