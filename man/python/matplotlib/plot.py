#!/usr/bin/python

import numpy as np
import matplotlib.pyplot as plt

x = np.arange(0, 3.14, 0.1)
c = np.cos(x)

# axis range
plt.xlim(x.min()-0.1, x.max()+0.1)
plt.ylim(c.min()*1.1, c.max()*1.1)

# axis label
plt.xlabel("x")
plt.ylabel("cos(x)")

# axis ticks
plt.xticks(np.arange(x.min(), x.max(), 0.5))
plt.yticks([-1, 0, 1], ["c(x)=-1", "c(x)=0", "c(x)=1"])

# plot figure
plt.plot(x, c, label="cosine")

# legend
plt.legend(loc='upper right')

# title
plt.title('Cosine plot')

# save figure
plt.savefig('fig.pdf')

