#!/usr/bin/python

import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(-np.pi, np.pi, 12,endpoint=True)
c,s = np.cos(x), np.sin(x)

# bar plot
plt.bar(x, c, width=0.5, align="center")

plt.savefig('fig.pdf')
