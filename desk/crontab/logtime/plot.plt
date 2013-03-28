#!/usr/bin/gnuplot
##!/bin/gnuplot
reset

Dec12 = "report/hpc2_201212.log"
Jan13 = "report/hpc2_201301.log"
Feb13 = "report/hpc2_201302.log"

# set LINEs (hlin for help)
set style line 99 lt 1 lw 3 pt  6 ps 1 lc rgb "black" # line with points       
set style line  1 lt 2 lw 3 pt  5 ps 1.5 lc rgb "red"
set style line  2 lt 2 lw 3 pt  7 ps 1.5 lc rgb "green"
set style line  3 lt 2 lw 3 pt  9 ps 1.5 lc rgb "blue"
set style line  4 lt 2 lw 3 pt 11 ps 1.5 lc rgb "violet"
set style line  5 lt 2 lw 3 pt 13 ps 1.5 lc rgb "orange"
set style line  6 lt 2 lw 3 pt 15 ps 1.5 lc rgb "orange"
set style line  7 lt 2 lw 3 pt 17 ps 1.5 lc rgb "blue"
set style line  8 lt 2 lw 3 pt 19 ps 1.5 lc rgb "blue"
set style line  9 lt 2 lw 3 pt 21 ps 1.5 lc rgb "blue"
set style line 10 lt 2 lw 3 pt 23 ps 1.5 lc rgb "blue"
set style line 11 lt 2 lw 3 pt 23 ps 1.5 lc rgb "blue"
set style line 12 lt 2 lw 3 pt  4 ps 1.5 lc rgb "black"

# set KEY
  set key on
  set key reverse
  set key top left     # position    
  set key samplen  4.0  # hor. length 
  set key spacing  2.0  # ver. space  
  set key width    0.0  # 
  set key height   1.0  # 
  set key font "Helvetica, 14"

# set MARGIN
set lmargin  5.00 
set bmargin  1.00 
set tmargin  1.00 
set rmargin  1.00 


hours = "($5/60/60)"

set format y '%2.1f'

lim(x) = (7 *60.*60. + 42 *60.)/60./60.

set xr [0:32]

set xtics font "Helvetica, 18"
set xtics 1, 2
set xtics nomirror
set mxtics 2

set x2tics font "Helvetica, 18"
set x2tics 1, 2
set x2tics nomirror
set mx2tics 2

set ytics  font "Helvetica, 18"

# set LABEL
set xlabel "Day of the month"
set xlabel font "Helvetica, 20" 
set xlabel offset   0.00, -1.00 
set ylabel "Time / hour"
set ylabel font "Helvetica, 20" 
set ylabel offset  -1.00,  0.00 

set macros

p lim(x) w l ls 99 notitle

rep Dec12 u ($1-20121200):@hours w lp ls 12 t "Dec 2012"
rep Dec12 u ($1-20121200):@hours:7  with labels offset 0,1 tc ls 12 notitle

rep Jan13 u ($1-20130100):@hours w lp ls  1 t "Jan 2013"
rep Jan13 u ($1-20130100):@hours:7  with labels offset 0,1 tc ls 1 notitle

rep Feb13 u ($1-20130200):@hours w lp ls  2 t "Feb 2013"
rep Feb13 u ($1-20130200):@hours:7  with labels offset 0,1 tc ls 2 notitle


# set the file name      
file_out = "report"
set_fig = "\
set term post enha color;\
file_pdf = sprintf(\"| ps2pdf - %s.pdf\", file_out);\
set out file_pdf"

#file_pdf = sprintf(\"| /usr/bin/ps2pdf - %s.pdf\", file_out);\

@set_fig
replot
