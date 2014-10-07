#!/usr/bin/python
import numpy as np
import matplotlib.pyplot as plt


t = np.arange(0.0, 2*np.pi, 0.01)
s = np.cos(t)


fig, ax = plt.subplots()

ax.plot(t, s, lw=2)

ax.set_xlim(0, 2*np.pi)

plt.rcParams.update({'font.size': 14, 'font.family': 'sans'})

ax.set_xlabel("x label")
ax.set_ylabel("y label")
ax.set_title("title")



fig.savefig('fig.pdf')

