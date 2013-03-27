" vi map for gnuplot
"
" 04.04.08
" 26.06.12 m
"
"
" use <<g to load
" use ,[name]
"
"
"

map! ,init  #!/bin/gnuplot<CR># file to load with gnuplot<CR>

" === MARGIN ===
map! ,mar  # set MARGIN<CR>
            \set lmargin  1.00 <CR>
            \set bmargin  1.00 <CR>
            \set tmargin  1.00 <CR>
            \set rmargin  1.00 <CR>
" ==============
"
"
" === KEY ===
map! ,key    # set KEY<CR>
            \  set key on<CR>
            \set key top right     # position    <CR>
            \set key samplen  4.0  # hor. length <CR>
            \set key spacing  1.0  # ver. space  <CR>
            \set key width    1.0  # <CR>
            \set key height   1.0  # <CR>
	    \set key font "Helvetica, 24"
map! ,ukey  set key off<CR>
" ===========
"
"
" === LABEL ===
map! ,lab   # set LABEL<CR>
            \,xlab
            \,ylab


map! ,xlab  set xlabel "x"                  <CR>
           \set xlabel font "Helvetica, 24" <CR>
           \set xlabel offset   0.00, -1.00 <CR>

map! ,ylab  set ylabel "y"                  <CR>
           \set ylabel font "Helvetica, 24" <CR>
           \set ylabel offset  -1.00,  0.00 <CR>
" =============
"
"
" ===  TICS ===
map! ,tic   # set TICS<CR>
            \,xt
            \,yt

map! ,xt  set xtics  font "Helvetica, 20"<CR>
map! ,yt  set ytics  font "Helvetica, 20"<CR>
" =============
"
"
" === LINES ===
map! ,lin  # set LINEs (hlin for help)<CR>
           \,l1
           \,l2
           \,l3
           \,l4
map! ,l1  set style line 1 lt 1 lw 3 pt  6 ps 2 lc rgb "black" # line with points       <CR>
map! ,l2  set style line 2 lt 2 lw 3 pt  4 ps 2 lc rgb "red  " # line with squares      <CR>
map! ,l3  set style line 3 lt 3 lw 3 pt 12 ps 2 lc rgb "green" # line with diamonds     <CR>
map! ,l4  set style line 4 lt 4 lw 3 pt  8 ps 2 lc rgb "blue " # line with up triangles <CR>

map! ,hlin # help for line style in term post color<CR>
          \# line(lt): 1 line, 2 dot, 3 dash, 4 small dot, 5 dash-dot, 6 ... <CR>
          \# point(pt): odds empty , even full 
	  \# 1 plus, 2 cross, 3 star<CR>
	  \# 3/4 square, 5/6 point, 7/8 up triangle, 9/10 down triangle<CR>
	  \# 11/12 diamond, 13/14 pentagon, ... <CR>
" =============
"
"
" === MACRO ===
map! ,mac  set macros<CR> 
map! ,fig   # set the file name      <CR>
           \file_out = "name"        <CR>
	   \set_ps   = "set term post enha color"<CR>
           \set_out  = "file_out_ps = sprintf(\"%s.ps\", file_out);set out file_out_ps"<CR>
	   \make_pdf = "!ps2pdf @file_out_ps && rm @file_out_ps"<CR>
	   \@set_ps   <CR>
	   \@set_out  <CR>
           \replot    <CR>
	   \@make_pdf <CR>
	   \<UP><UP><UP><UP><UP><UP><UP><UP><END><ESC>?=<CR>:silent noh<CR>:<CR><RIGHT><RIGHT><RIGHT>
" =============


map! ,art ,init<CR>,out<CR>,mar<CR>,lab<CR>,tic<CR>,lin<CR>,key<CR><CR>,plt


map! ,xf set format x "%g"<CR>
map! ,yf set format y "%g"<CR>

map! ,set ,xl<CR>,yl<CR>,xt<CR>,yt<CR>

map! ,m set multiplot<CR><CR>unset multiplot<UP>
map! ,s set size  1.00, 1.00
map! ,0 set origin  0.00, 0.00



map! ,plt # PLOT<CR>,p
map! ,p plot '' w l t ""

map! ,A set encoding iso_8859_1<CR>{\305}


:function! Clean()
:endfunction
