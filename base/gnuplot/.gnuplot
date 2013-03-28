# .gnuplot
#
# 13.02.09
# 02.09.10 m
#
# in the home directory
# in .gnuplot
# load "THIS_PATH/.gnuplot"
#
#

#obs="Observables"
#avg="Averages"
#

_red="#880000"
_blue="#0000ff"
_green="#008800"

set style line 1 lt  1 lw 1 pt 7 ps 1
set style line 2 lt  2 lw 1 pt 5 ps 1
set style line 3 lt  3 lw 1 pt 9 ps 1

bind ""
bind t "p'Observables'u 1:8 w l,'Observables'u 1:7 w l"
bind z "p'Observables'u 1:11 w l,'Averages'u 1:11 w l,'Observables'u 1:10 w l"
bind f "p'Observables'u 1:($10-$11)w l,'Averages'u 1:($10-$11)w l"
bind s "p'Observables'u 1:13 w l,'Averages'u 1:13 w l,'Observables'u 1:12 w l"
bind r "p'gofr' w l"
bind c "reset"


print "load .gnuplot"
print "--- cut here ---"
print "pause -1"
print "u 1:(0):xticlabel(1) and u (0):2:yticlabel(2)"
print "p'mol.out'u 1:2 w p pt 7 ps 3 ,''u 1:2:3 w labels center offset 0,-1 notitle"
print "--- cut here ---"
print "`pwd`"

