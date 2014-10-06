#!/usr/bin/python
import numpy as np
import matplotlib.pyplot as plt

plt.rcParams.update({'font.size': 14, 'font.family': 'sans'})

fig, ax = plt.subplots()

ax = plt.plotfile('./time.dat', cols=(0, 1), delimiter = ' ')

#plt.plotfile(*np.loadtxt('time.dat', unpack=True))


#ax.plot(t, s, lw=2, color="red", ls = "-", alpha = 0.5,
#        marker = "o", markersize = 8.0, 
#        )
#        #animated = True, aa = True, clip_on = True)


fig.savefig('fig.pdf')

