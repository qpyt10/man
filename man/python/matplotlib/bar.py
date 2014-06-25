#!/usr/bin/python

from pylab import *

x = np.linspace(-np.pi, np.pi, 12,endpoint=True)
c,s = np.cos(x), np.sin(x)


# bar plot
bar(x, c, width=0.5, align="center")


savefig('fig.pdf')
