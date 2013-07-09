
from pylab import *
import numpy 

file_data='time.dat'

data = numpy.loadtxt(file_data)

x = data[:,0]
y = data[:,2]

l1 = plot(x, y)

setp(l1, color='r', linewidth=2.0)

savefig('fig.pdf')

