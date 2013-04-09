

import matplotlib.pyplot as plt
import numpy 

file_data='time.dat'

def f(x):
   return x

data = numpy.loadtxt(file_data)

nt = data[:,0]
s1 = data[:,2]

plt.title('title')
plt.xlabel('Number of threads')
plt.ylabel('Speed Up')

l0 = plt.plot(nt, f(nt))
l1 = plt.plot(nt, s1)

plt.setp(l1, color='r', linewidth=2.0)
plt.setp(l0, color='k', lw =1.0)

#plt.show()
plt.savefig('th.pdf')

