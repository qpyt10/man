#!/bin/gnuplot
#reset

thisfile=sprintf("%s%d%s", FilePref, iteration_count, FileSuff)
#set title sprintf("%s %i", Title, iteration_count)

iteration_count=iteration_count+iteration_diff

thisout=sprintf("mov%d.ps", iteration_count)
#set output thisout

set origin -0.48,-0.40
set lmargin 0.0
set rmargin 0.0
set tmargin 0.0
set bmargin 0.0

set size 1.95,1.75
set view 90,0

unset border
unset tics


OffX=5
# set the metric
MetricX = 153.5189275
MetricY = MetricX
MetricZ = 2*MetricX
# draw the border
set style line 1 lt -1 lw 1
set arrow from 0,0,0 to 0,0,MetricX               nohead ls  1
set arrow from 0,0,0 to MetricZ,0,0               nohead ls  1
set arrow from 0,0,MetricX to MetricZ,0,MetricX   nohead ls  1
set arrow from MetricZ,0,MetricX to MetricZ,0,0   nohead ls  1
# end draw the border

# set style line for vectors
set style line 2 lt 1 lw 1.5
set style arrow 1 head filled ls 2

Cell = 153.5189275 / 14

# set the number of plane to plot
OffX=3*Cell-MarginX
OffX=0
set xr [0-MarginX:2*MetricX+MarginX-OffX]
set zr [0-MarginZ:153.51+MarginZ]

# select the right plane
Ymin = (num-1)*Cell
Ymax = num*Cell
set xr[:]
set zr[:]
set yr [Ymin:Ymax]
# end selection

#set xlabel "X"
#set zlabel "Z"

set view 90,0
#set view 51, 235
# scale the vetors 
mis=1

pause 0.01 sprintf("%s",thisfile)
sp \
  thisfile u ($1*mis):($2*mis):($3*mis):($4*scale):($5*scale*0):($6*scale) w vec as 1 t ""
#pause -1 'ready ?'
if (iteration_count<iteration_max)reread
