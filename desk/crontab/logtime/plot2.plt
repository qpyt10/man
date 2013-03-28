#!/bin/gnuplot
#
# 11.02.13
# 19.02.13 m
#
reset

set macros

hours = "($5/60/60)"

Dec12 = "'report/hpc2_201212.log' u ($1-20121200):($5/60/60)"
Jan13 = "'report/hpc2_201301.log' u ($1-20130100):($5/60/60)"
Feb13 = "'report/hpc2_201302.log' u ($1-20130200):($5/60/60)"
Mar13 = "'report/hpc2_201303.log' u ($1-20130300):($5/60/60)"

# set the file name
set_fig = "\
set term pngcairo crop enhanced interlace font 'Helvetica-Bold, 8';\
file_png = sprintf(\"%s.png\", file_out);\
set out file_png"

lab = "notitle with labels offset 0,0.75 tc "

# set LINEs (hlin for help)
set style line 99 lt 1 lw 1 pt  6 ps 1   lc rgb "black"
#
set style line  1 lt 0 lw 3 pt  7 ps 1.1 lc rgb "red"
set style line  2 lt 0 lw 3 pt  5 ps 1.1 lc rgb "green"
set style line  3 lt 0 lw 3 pt  9 ps 1.1 lc rgb "blue"
set style line  4 lt 0 lw 3 pt 13 ps 1.1 lc rgb "violet"
set style line  5 lt 0 lw 3 pt  1 ps 1.1 lc rgb "orange"
set style line  6 lt 0 lw 3 pt 11 ps 1.1 lc rgb "orange"
set style line  7 lt 0 lw 3 pt  2 ps 1.1 lc rgb "blue"
set style line  8 lt 0 lw 3 pt  6 ps 1.1 lc rgb "blue"
set style line  9 lt 0 lw 3 pt  8 ps 1.1 lc rgb "blue"
set style line 10 lt 0 lw 3 pt  3 ps 1.1 lc rgb "blue"
set style line 11 lt 0 lw 3 pt 23 ps 1.1 lc rgb "blue"
set style line 12 lt 0 lw 3 pt  4 ps 1.1 lc rgb "black"
#

# set KEY
  set key on
  set key reverse
  set key top left     # position    
  set key samplen  4.0  # hor. length 
  set key spacing  1.0  # ver. space  
  set key width    1.0  # 
  set key height   1.0  # 
  set key font "Helvetica, 10"



set format y '%2.1f'

lim(x) = (7 *60.*60. + 42 *60.)/60./60.

set xr [0:32]

set xtics font "Helvetica, 12"
set xtics 1, 2
set xtics nomirror
set mxtics 2

set x2tics font "Helvetica, 12"
set x2tics 1, 2
set x2tics nomirror
set mx2tics 2

set ytics  font "Helvetica, 12"
set ytics 0.5
set mytics 2

# set LABEL
set xlabel "Day of the month"
set xlabel font "Helvetica, 18" 
set xlabel offset   0.00, -0.50 
set ylabel "Time / hour"
set ylabel font "Helvetica, 18" 
set ylabel offset  -1.00,  0.00 

# set MARGIN
set bmargin  4.00 

set term unknown

p lim(x) w l ls 99 notitle

rep @Dec12   w lp ls 12 t "Dec 2012"
rep @Dec12:7 @lab ls 12

rep @Jan13   w lp ls  1 t "Jan 2013"
rep @Jan13:7 @lab ls  1

rep @Feb13   w lp ls  2 t "Feb 2013"
rep @Feb13:7 @lab ls  2

rep @Mar13   w lp ls  3 t "Mar 2013"
rep @Mar13:7 @lab ls  3

y_off=0.5
set yr [GPVAL_DATA_Y_MIN-y_off:GPVAL_DATA_Y_MAX+y_off]

file_out = "fig/report"
@set_fig
replot


file_out = "fig/Dec12"
p lim(x) w l ls 99 notitle
rep @Dec12   w lp ls 12 t "Dec 2012"
rep @Dec12:7 @lab ls 12 
@set_fig
replot

file_out = "fig/Jan13"
p lim(x) w l ls 99 notitle
rep @Jan13   w lp ls  1 t "Jan 2013"
rep @Jan13:7 @lab ls  1
@set_fig
replot

file_out = "fig/Feb13"
p lim(x) w l ls 99 notitle
rep @Feb13   w lp ls  2 t "Feb 2013"
rep @Feb13:7 @lab ls  2 
@set_fig
replot

file_out = "fig/Mar13"
p lim(x) w l ls 99 notitle
rep @Mar13   w lp ls  3 t "Mar 2013"
rep @Mar13:7 @lab ls  3 
@set_fig
replot

