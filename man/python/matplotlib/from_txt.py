#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np

file_data='time.dat'

data = np.loadtxt(file_data)

x = data[:,0]
y = data[:,2]

l1 = plt.plot(x, y)

plt.setp(l1, color='r', linewidth=2.0)

plt.savefig('fig.pdf')

