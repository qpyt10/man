#!/usr/bin/python

from pylab import *

x = arange(0, 3.14, 0.1)
c = np.cos(x)

# axis range
xlim(x.min()-0.1, x.max()+0.1)
ylim(c.min()*1.1, c.max()*1.1)

# axis label
xlabel("x")
ylabel("cos(x)")

# axis ticks
xticks(arange(x.min(), x.max(), 0.5))
yticks([-1, 0, 1], ["c(x)=-1", "c(x)=0", "c(x)=1"])

# plot figure
plot(x, c, label="cosine")

# legend
legend(loc='upper right')

# save figure
savefig('plot.pdf')

