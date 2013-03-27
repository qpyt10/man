#!/bin/gnuplot
reset

#set term post 
#set output 'fig6.ps'


Ninit=0
FilePref="./OUTvel_"
FileSuff=".cub"
Title="File = "

iteration_count = 1
iteration_diff  = 50
iteration_max   = 25000

num = 12
scale=200
MarginX=20
MarginZ=20
load  "formovie.plt"
